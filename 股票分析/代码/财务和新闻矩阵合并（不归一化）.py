import datetime
import os

import pandas as pd


def conform_date(string):
    for fmt in ["%Y/%m/%d", "%Y-%m-%d"]:
        try:
            return datetime.datetime.strptime(string, fmt).date()
        except ValueError:
            continue
    raise ValueError(string)


data_dir = '../数据/财务数据/财务特征'
data_dir2 = '../数据/财务数据/财务与新闻同日期（可视化）'

ths = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09]

for th in ths:
    print(th)
    news_file = '../数据/新闻矩阵.csv'
    finance_file = os.path.join(data_dir, '财务特征' + str(th) + '.csv')

    df = pd.read_csv(news_file, error_bad_lines=False)
    cf = pd.read_csv(finance_file, error_bad_lines=False)

    news_date = df.iloc[:, 0]
    finance_date = cf.iloc[:, 1]  # 归一化是0

    for i in range(len(news_date)):
        news_date[i] = conform_date(news_date[i])

    for i in range(len(finance_date)):
        finance_date[i] = conform_date(finance_date[i])

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

    with open('../数据/新闻矩阵.csv', 'r', encoding='utf-8') as r:
        lines = r.readlines()

        with open('../数据/财务数据/财务与新闻同日期（可视化）/新闻矩阵同日期.csv', 'w', encoding='utf-8') as w:
            for i in range(len(drop)):
                w.write(lines[drop[i]])

    with open(finance_file, 'r', encoding='utf-8') as r:
        lines = r.readlines()

        fname2 = os.path.join(data_dir2, '财务特征未归一化与新闻合并' + str(th) + '.csv')
        with open(fname2, 'w', encoding='utf-8') as w:
            for i in range(len(drop2)):
                w.write(lines[drop2[i]])
