import re

import jieba.analyse
import pandas as pd

# 将原始新闻分词
text1 = '../数据/新闻数据集.csv'
text2 = '../数据/新闻数据分词.csv'

jieba.load_userdict("../数据/辅助数据/stock_dict.txt")
jieba.analyse.set_stop_words('../数据/辅助数据/stopwords2.txt')

reg = "[^A-Za-z\u4e00-\u9fa5]"

f = pd.read_csv(text1, sep=',', encoding='utf-8', error_bad_lines=False)
outfile = open(text2, 'w', encoding='utf-8')
outfile.write('Date,Bid,Descript\n')

date_column = f['日期']  # 看原始数据集
descript_column = f['内容']

def fenci(line):
    line = line.strip()
    line_result = re.sub(reg, "", line)
    return line_result


for index, row in f.iterrows():
    # 写入日期列
    date = row['日期']
    outfile.write(date + ',' +'000651.SZ,')

    # 对标题进行分词
    descript = fenci(row['内容'])
    seg_list = jieba.cut(descript)
    descript_cut = ' '.join(seg_list)  # 使用空格连接分词结果

    # 写入分词后的标题列，并换行
    outfile.write(descript_cut + '\n')

outfile.close()
