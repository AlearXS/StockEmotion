import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from keras.models import load_model

# 加载训练好的模型
model_path = '../数据/模型/模型二.h5'
model = load_model(model_path)


# 定义生成器函数
def generator(data, lookback, step, min_index, max_index, batch_size):
    i = min_index + lookback
    while 1:
        if i + batch_size >= max_index:
            i = min_index + lookback
        rows = np.arange(i, min(i + batch_size, max_index), step)
        np.random.shuffle(rows)
        i += batch_size

        samples1 = np.zeros((len(rows), lookback, 12))
        samples2 = np.zeros((len(rows), lookback, 82))
        targets = np.zeros((len(rows),))
        for j, row in enumerate(rows):
            indices = range(row - lookback, row)
            samples1[j] = data[indices, :12]
            samples2[j] = data[indices, 12:data.shape[1] - 1]
            targets[j] = data[row][data.shape[1] - 1]
        yield {'num': samples1, 'text': samples2}, targets


# 读取输入文件
input_file = '../数据/模型输入/测试数据/input_data新闻.csv'  # 请确保文件路径正确
data = pd.read_csv(input_file, encoding='utf-8')

# 数据预处理
num = len(data) - 1  # the first column is title
dates = data.iloc[:, 0].values  # 提取日期列
data = data.iloc[:, 1:].fillna(0)
data = np.array(data, dtype=float)
data = np.asarray(data).astype('float32')

# 参数设置
lookback = 12
step = 1
batch_size = 1

# 预测每一行的涨跌
# 预测每一行的涨跌
predicted_labels = []
actual_labels = []

for i in range(lookback, len(data)):
    test_data = data[i - lookback:i, :]
    test_samples1 = test_data[:, :12].reshape(1, lookback, 12)
    test_samples2 = test_data[:, 12:data.shape[1] - 1].reshape(1, lookback, 82)
    test_input = {'num': test_samples1, 'text': test_samples2}

    # 使用模型进行预测
    prediction = model.predict(test_input)
    predicted_label = 1 if prediction[0][0] > 0.5 else 0
    actual_label = int(data[i, -1])

    predicted_labels.append(predicted_label)
    actual_labels.append(actual_label)

    # 打印预测结果和实际结果
    print(f'Date: {dates[i]}, Predicted: {predicted_label}, Actual: {actual_label}')

# 计算准确率
correct_predictions = sum(1 for p, a in zip(predicted_labels, actual_labels) if p == a)
accuracy = correct_predictions / len(predicted_labels)
print(f'Accuracy: {accuracy * 100:.2f}%')

# 截取最后部分的日期
start_index = max(0, len(dates) - len(predicted_labels) - lookback)
dates_subset = dates[start_index:]

# 可视化真实值和预测值
plt.figure(figsize=(12, 6))
plt.plot(dates_subset[lookback:], actual_labels, label='Actual', marker='o')
plt.plot(dates_subset[lookback:], predicted_labels, label='Predicted', marker='x')
plt.xlabel('Date')
plt.ylabel('Label (0: Down, 1: Up)')
plt.title('Actual vs Predicted Labels')
plt.legend()
plt.xticks(rotation=90)  # 旋转日期标签以避免重叠
plt.tight_layout()  # 自动调整子图参数以填充整个图表区域
plt.text(0.05, 0.95, f'Accuracy: {accuracy * 100:.2f}%', transform=plt.gca().transAxes, fontsize=12,
         verticalalignment='top')
plt.show()
