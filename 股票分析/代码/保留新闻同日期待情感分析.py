import csv

import pandas as pd

# 将新闻分词保留与矩阵或财务同日期部分，待情感分析

news_file = '../数据/新闻数据分词.csv'
finance_file = '../数据/财务数据/财务与新闻同日期（归一化）/新闻矩阵同日期.csv'

df = pd.read_csv(news_file, error_bad_lines=False)
cf = pd.read_csv(finance_file, error_bad_lines=False)

news_date = df.iloc[:, 0]
finance_date = cf.iloc[:, 0]

print(news_date[0])
print(finance_date[0])

differ = set(news_date) ^ set(finance_date)
drop = []
drop2 = []
drop.append(0)
drop2.append(0)
drop_date = []
a = []
for i in range(len(news_date)):
    if news_date[i] not in differ:
        drop.append(i + 1)
for i in range(len(finance_date)):
    if finance_date[i] not in differ:
        drop2.append(i + 1)

with open(news_file, 'r', encoding='utf-8') as r:
    lines = r.readlines()

    with open('../数据/新闻分词同日期待预测情感.txt', 'w', encoding='utf-8') as w:
        for i in range(len(drop)):
            # 使用 csv.reader 解析每一行
            reader = csv.reader([lines[drop[i]]])
            for row in reader:
                # 删除第二列（索引为1）
                if len(row) > 1:
                    del row[1]
                # 将剩余的列重新组合成字符串并写入文件
                w.write(','.join(row) + '\n')