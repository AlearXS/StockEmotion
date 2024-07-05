import os

import pandas as pd

data_dir = '../数据/财务数据/财务与新闻同日期（可视化）'
data_dir2 = '../数据/模型输入/财务新闻情感（可视化）'

ths = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09]

for th in ths:

    # 读取新闻矩阵文件
    news_file = '../数据/财务数据/财务与新闻同日期（可视化）/新闻矩阵同日期.csv'
    news_df = pd.read_csv(news_file)

    # 读取财务矩阵文件
    finance_file = os.path.join(data_dir, '财务特征未归一化与新闻合并' + str(th) + '.csv')
    finance_df = pd.read_csv(finance_file, error_bad_lines=False, encoding='utf-8')

    # 来自预测项目
    senti_file = '../数据/情感预测合并.csv'
    senti_df = pd.read_csv(senti_file)

    # 确保两个数据框的日期列相同
    if not finance_df['date'].equals(news_df['日期']):
        raise ValueError("两个数据框的日期列不匹配")

    # 提取财务矩阵的涨幅列
    returns_col = finance_df.iloc[:, 14]  # 可视化 14

    # 删除财务矩阵的涨幅列
    finance_df = finance_df.iloc[:, :14]

    # 合并财务矩阵和新闻矩阵
    merged_df = pd.concat([finance_df, news_df.iloc[:, 1:]], axis=1)

    # 将senti_file的第二列附加到合并后的数据框
    merged_df['pred'] = senti_df.iloc[:, 1]

    # 将涨幅列添加到合并后的数据框的最后一列
    merged_df['label'] = returns_col
    # 可视化drop
    merged_df = merged_df.drop(columns=['index'])
    # 保存合并后的数据框到新的CSV文件
    merged_name = os.path.join(data_dir2, '财务可视化新闻情感' + str(th) + '.csv')
    merged_df.to_csv(merged_name, index=False)
