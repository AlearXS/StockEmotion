import os

import numpy as np
import pandas as pd


def Normalization2(x):
    return [(float(i) - np.mean(x)) / np.std(x) for i in x]


data_dir = '../数据/财务数据/财务特征'
data_dir2 = '../数据/财务数据/财务归一化'

ths = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09]

for th in ths:
    print(th)

    fname = os.path.join(data_dir, '财务特征' + str(th) + '.csv')
    df = pd.read_csv(fname, error_bad_lines=False, encoding='utf-8')

    a = []
    results = pd.DataFrame()

    for i in range(2, 14):
        data_train = df.iloc[:, i]
        result = Normalization2(data_train)
        a.append(result)

    results['date'] = df.iloc[:, 1]
    results['open'] = a[0]
    results['high'] = a[1]
    results['low'] = a[2]
    results['close'] = a[3]
    results['volume'] = a[4]
    results['increase'] = a[5]
    results['increase_rate'] = a[6]
    results['change'] = a[7]
    results['PE'] = a[8]
    results['PB'] = a[9]
    results['A-index'] = a[10]
    results['communication-index'] = a[11]

    results['label'] = df.iloc[:, 14]

    fname2 = os.path.join(data_dir2, '财务特征归一化' + str(th) + '.csv')
    results.to_csv(fname2, index=False)
