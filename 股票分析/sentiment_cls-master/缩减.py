import csv


def process_csv(input_file, output_file):
    with open(input_file, mode='r', newline='') as infile, open(output_file, mode='w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        # 写入标题行
        header = next(reader)
        writer.writerow(header)

        # 处理每一行数据
        for row in reader:
            # 确保第二列是数值类型
            try:
                value = int(row[1])
                if value > 1:
                    row[1] = 1
                else:
                    row[1] = value
            except ValueError:
                # 如果第二列不是数值，保持原样
                pass
            writer.writerow(row)


# 使用示例
input_file = 'merge.csv'
output_file = 'output.csv'
process_csv(input_file, output_file)