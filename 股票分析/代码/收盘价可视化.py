import pandas as pd
import matplotlib.pyplot as plt

# 读取数据
data1 = pd.read_csv('../数据/可视化/visual1.csv', encoding='utf-8')
data2 = pd.read_csv('../数据/可视化/visual2.csv', encoding='utf-8')

# 提取数据
date1 = data1.iloc[:-1, 2].tolist()  # 去掉最后一个日期，因为它没有对应的预测值
close1 = data1.iloc[:-1, 3].tolist()
pred1 = []

for i in range(len(data1) - 1):
    if data1.iloc[i, 0] > 0.5:
        pred1.append(data1.iloc[i, 3] + abs(data1.iloc[i, 3] - data1.iloc[i + 1, 3]))
    else:
        pred1.append(data1.iloc[i, 3] - abs(data1.iloc[i, 3] - data1.iloc[i + 1, 3]))

date2 = data2.iloc[:-1, 2].tolist()  # 去掉最后一个日期，因为它没有对应的预测值
close2 = data2.iloc[:-1, 3].tolist()
pred2 = []

for i in range(len(data2) - 1):
    if data2.iloc[i, 0] > 0.5:
        pred2.append(data2.iloc[i, 3] + abs(data2.iloc[i, 3] - data2.iloc[i + 1, 3]))
    else:
        pred2.append(data2.iloc[i, 3] - abs(data2.iloc[i, 3] - data2.iloc[i + 1, 3]))

# 选择部分日期
date1_sampled = date1[::4]
close1_sampled = close1[::4]
pred1_sampled = pred1[::4]

date2_sampled = date2[::4]
pred2_sampled = pred2[::4]

# 创建图形
plt.rcParams['font.sans-serif'] = ['SimHei']  # 用来正常显示中文标签
plt.rcParams['axes.unicode_minus'] = False  # 用来正常显示负号
figure = plt.figure(figsize=(15, 7))
ax = figure.add_subplot(111)
plt.ylim(15, 45)

# 绘制实际收盘价
ax.plot(date1_sampled, close1_sampled, color='b', linewidth=1.5, label='实际收盘价')

# 绘制预测值
ax.scatter(date1_sampled, pred1_sampled, color='r', marker='X', label='预测收盘价 (结合新闻特征)')
ax.scatter(date2_sampled, pred2_sampled, color='g', marker='o', label='预测收盘价 (结合新闻特征与情感特征)')

# 设置标签和标题
ax.set_xticklabels(date1_sampled, rotation=80)
plt.xlabel('日期', fontsize=7)
plt.ylabel('收盘价', fontsize=14)
plt.title('代码:000063.SZ', fontsize=10)
figure.legend(loc=1, bbox_to_anchor=(1, 1), bbox_transform=ax.transAxes)

plt.show()