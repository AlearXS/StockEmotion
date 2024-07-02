
from module_admin.entity.vo.stock_vo import *
import akshare as ak
import pandas as pd

def get_short_kline_for_painting_by_id(id: str):
	df = pd.read_csv('test_kline.csv')
	
	# stock_kline_df
	return df.values.tolist()