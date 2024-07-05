import os

import pandas as pd

# 设置日期单元格格式！
df = pd.read_csv('../数据/财务数据.csv')
df['label'] = 0
print(df.iloc[0, 8])

data_dir = '../数据/财务数据/财务特征'
ths = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09]

for th in ths:
    print(th)
    for i in range(len(df)):
        if df.iloc[i, 8] >= th:
            df.iloc[i, 14] = 1
        else:
            df.iloc[i, 14] = 0
    fname = os.path.join(data_dir, '财务特征' + str(th) + '.csv')
    df.to_csv(fname, index=False)
