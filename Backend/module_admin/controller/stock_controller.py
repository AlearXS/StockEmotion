from fastapi import APIRouter, Request
from fastapi import Depends
from config.get_db import get_db
from module_admin.service.login_service import LoginService, CurrentUserModel
from module_admin.service.dept_service import DeptService, DeptModel
from module_admin.service.stock_overall_service import get_stock_overall_list_service
from module_admin.service.stock_service import *
from module_admin.controller.like_controller import likeController
from utils.response_util import *
from utils.log_util import *
from utils.page_util import PageResponseModel
from utils.common_util import bytes2file_response
from module_admin.aspect.interface_auth import CheckUserInterfaceAuth
from module_admin.aspect.data_scope import GetDataScope
from module_admin.annotation.log_annotation import log_decorator
import akshare as ak
import numpy as np
import pandas as pd
# from datetime import datetime
import datetime


stockController = APIRouter(prefix='/stock')

@stockController.get('/list')
async def get_stock_heat_list():
	'''
	返回实时股票行情
	按涨跌幅排序
	'''
	logger.info('股票热度')
	try:
		df = ak.stock_hot_rank_em() 
		# df.sort_values('涨跌幅', inplace=True)
		# res = StockService.get_short_kline_for_painting_by_code(query_db, code, startdate, end_date, adjust)
		return ResponseUtil.success(data=[{**row} for _, row in df.iterrows()])
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))


@stockController.get("/overall", response_model=list[PageResponseModel])
async def get_overall(request: Request):
	'''
	测试前后端连接，返回股票总览
	'''
	logger.info('testing')
	try:
		res = get_stock_overall_list_service()
		logger.info('获取成功')
		return ResponseUtil.success(model_content=res)
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))
	
@stockController.get('/kline/{code}')
def kline(code : str = '000001', startdate: datetime.date = datetime.date(2023, 1, 1), end_date = datetime.datetime.now().date(), adjust: str = "", query_db: Session = Depends(get_db)):
	'''
	:param code 股票代码
	:param adjust 复权方式，默认无复权
	:return 最近一年的 k 线数据 : dataframe 
	'''

	logger.info(f'正在获取 {code} 的 k 线数据')

	try:
		res = StockService.get_short_kline_for_painting_by_code(query_db, code, startdate, end_date, adjust)
		return ResponseUtil.success(data=res)
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))
stockController.include_router(likeController)