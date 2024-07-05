import subprocess

# 激活 conda 虚拟环境并运行另一个项目的脚本
subprocess.run(['conda', 'activate', 'py3.8', '&&', 'python', 'C:\\Users\\Lenovo\\Desktop\\test\\sentiment_cls-master'
                                                              '\\情感分析.py'], shell=True)
