
# from flask import session
# from requests import Session
from time import strptime
from sqlalchemy.orm import Session
from module_admin.dao.stock_dao import StockDao
from module_admin.entity.vo.stock_vo import *
import akshare as ak
import pandas as pd

class StockService:

	@classmethod
	def get_short_kline_for_painting_by_code(cls, query_db: Session, code: str, startdate: datetime.date = datetime.date(2023, 1, 1), end_date = datetime.datetime.now().date(), adjust: str = ""):
		'''
		获取 k 线数据
		'''
		res = StockDao.get_kline_for_painting_by_code(query_db, code, startdate, end_date, adjust)
		# breakpoint()
		
		res = [
			[datetime.datetime.combine(datetime.datetime.fromisoformat(row[0]), datetime.time(0, 0, 0)).timestamp() * 1000, row[1], row[2], row[3], row[4], row[5]]
			for row in res
		]


		# stock_kline_df
		return res