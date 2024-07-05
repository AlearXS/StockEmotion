import csv
import torch
from transformers import BertTokenizer, AlbertConfig, AlbertModel
import pandas as pd
from collections import defaultdict


# 定义模型结构
class SentimentClassifier(torch.nn.Module):
    def __init__(self, bert_model, bert_config, num_class):
        super(SentimentClassifier, self).__init__()
        self.bert_model = bert_model
        self.dropout = torch.nn.Dropout(0.2)
        self.fc1 = torch.nn.Linear(bert_config.hidden_size, 64)
        self.fc2 = torch.nn.Linear(64, num_class)
        self.relu = torch.nn.ReLU()

    def forward(self, input_ids, attn_masks, token_type_ids):
        bert_out = self.bert_model(input_ids, attn_masks, token_type_ids)[1]  # Sentence vector [batch_size,hidden_size]
        bert_out = self.fc1(bert_out)
        bert_out = self.relu(bert_out)
        bert_out = self.dropout(bert_out)
        bert_out = self.fc2(bert_out)  # [batch_size,num_class]
        return bert_out


# 加载预训练模型和配置
pretrained = 'C:\\Users\\Lenovo\\Desktop\\test\\sentiment_cls-master\\models\\albert_chinese_small'
tokenizer = BertTokenizer.from_pretrained(pretrained)
model = AlbertModel.from_pretrained(pretrained)
config = AlbertConfig.from_pretrained(pretrained)

# 创建模型实例
sentiment_cls = SentimentClassifier(model, config, 2)

# 加载训练好的模型权重
sentiment_cls.load_state_dict(torch.load('C:\\Users\\Lenovo\\Desktop\\test\\sentiment_cls-master'
                                         '\\sentiment_classifier.pth'))

# 设置模型为评估模式
sentiment_cls.eval()

# 设置设备
device = torch.device("cuda:0") if torch.cuda.is_available() else 'cpu'
sentiment_cls = sentiment_cls.to(device)

# 读取待预测数据
predict_file_path = "C:\\Users\\Lenovo\\Desktop\\中兴\\数据\\新闻分词同日期待预测情感.txt"
predict_df = pd.read_csv(predict_file_path, header=None)

predict_df.columns = ['date', 'content']

# 进行预测
predictions = []
count = 0
for index, row in predict_df.iterrows():
    date = row['date']
    content = row['content']
    tokenized_text = tokenizer(content.strip(), max_length=50, padding='max_length', truncation=True,
                               return_tensors='pt')
    inputs = {
        'input_ids': tokenized_text['input_ids'].to(device),
        'attn_masks': tokenized_text['attention_mask'].to(device),
        'token_type_ids': tokenized_text['token_type_ids'].to(device)
    }
    with torch.no_grad():
        out = sentiment_cls(**inputs)
        probs = torch.softmax(out, dim=1).cpu().numpy()[0]
        pos_prob = probs[1]
        # 将正面情感的概率从[0, 1]映射到[-1, 1]
        sentiment_score = 2 * pos_prob - 1
        predictions.append((date, sentiment_score))

    count += 1
    if count % 100 == 0:
        print(f"Processed {count} rows.")

# 打印预测结果
for i, (date, score) in enumerate(predictions):
    print(f"Sample {i + 1}: Date {date}, Sentiment Score {score}")

# 将预测结果写入CSV文件
with open('C:\\Users\\Lenovo\\Desktop\\中兴\\数据\\情感全预测.csv', 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    for date, score in predictions:
        writer.writerow([date, score])

# 合并日期相同的行，计算情感分数的平均值
merged_predictions = defaultdict(lambda: [0, 0])

for date, score in predictions:
    merged_predictions[date][0] += score
    merged_predictions[date][1] += 1

# 计算平均情感分数
averaged_predictions = {date: total_score / count for date, (total_score, count) in merged_predictions.items()}

# 打印合并后的预测结果
for date, avg_score in averaged_predictions.items():
    print(f"Date {date}, Average Sentiment Score {avg_score}")

# 将合并后的预测结果写入CSV文件
with open('C:\\Users\\Lenovo\\Desktop\\中兴\\数据\\情感预测合并.csv', 'w', newline='', encoding='utf-8') as csvfile:
    writer = csv.writer(csvfile)
    for date, avg_score in averaged_predictions.items():
        writer.writerow([date, avg_score])

senti_file = 'C:\\Users\\Lenovo\\Desktop\\中兴\\数据\\情感预测合并.csv'
senti_df = pd.read_csv(senti_file)
senti_df.rename(columns={senti_df.columns[1]: 'pred'}, inplace=True)
senti_df.to_csv(senti_file, index=False)

# 保存更改后的文件
senti_df.to_csv(senti_file, index=False)
