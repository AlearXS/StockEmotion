import csv
import json

import pandas as pd

labels = json.loads(open('../数据/辅助数据/训练结果/trained_results_20240630_143942/labels.json').read())
file = '../数据/新闻数据分词.csv'
col = ['日期']
for i in range(len(labels)):
    col.append(labels[i])


with open('../数据/辅助数据/预测结果/predicted_results/predictions_all.csv', 'r',
          encoding='utf-8') as f:
    reader = pd.read_csv(f, sep='|')  # 原来的sep = ','
    date = reader.iloc[:, 2]
    descript = reader.iloc[:, 1]
    predicted = reader.iloc[:, 0]
    length = len(date)
    alldate = []
    alldate.append(date[0])
    numdate = []
    numdate.append(0)
    save = []

    with open('../数据/新闻矩阵.csv', 'a+', newline='', encoding='utf-8') as cf:
        writer = csv.writer(cf)
        writer.writerow(col)
        for i in range(1, length):
            if date[i] != date[i - 1]:
                alldate.append(date[i])
                numdate.append(i)

        for k in range(1, len(numdate)):
            count = [0] * len(labels)
            a = numdate[k - 1]
            b = numdate[k]
            for i in range(a, b):
                for j in range(len(labels)):
                    if predicted[i] == labels[j]:
                        count[j] += 1
            save.append(count)
        for i in range(0, len(save)):
            total = []
            total.append(alldate[i])
            for j in range(len(save[i])):
                total.append(save[i][j])
            writer.writerow(total)
