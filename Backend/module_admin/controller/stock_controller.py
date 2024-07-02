from fastapi import APIRouter, Request
from fastapi import Depends
from config.get_db import get_db
from module_admin.service.login_service import LoginService, CurrentUserModel
from module_admin.service.dept_service import DeptService, DeptModel
from module_admin.service.stock_overall_service import get_stock_overall_list_service
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
from datetime import datetime
import datetime as dt


stockController = APIRouter(prefix='/stock')


@stockController.get("/overall", response_model=list[PageResponseModel])
async def get_system_test_list(request: Request):
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
    
@stockController.get('/kline/{id}')
def kline(id : str = '000001'):
    '''
    : param id 股票代码
    :return 最近一年的 k 线数据 : dataframe 
    '''
    
    logger.info(f'正在获取 {id} 的 k 线数据')

    try:
        # start_date = (datetime.now().date() - dt.timedelta(365)).strftime("%y%m%d")
        # end_date = datetime.now().date().strftime("%y%m%d")
        # stock_df = ak.stock_zh_a_hist(symbol=id, \
        #                         period="daily", \
        #                         start_date = start_date, \
        #                         end_date = end_date, \
        #                         adjust = "前复权")
        # stock_df['时间戳'] = stock_df['日期'].apply(lambda date: datetime.timestamp(datetime.combine(date, datetime.min.time())))
        stock_df = pd.read_csv('test_kline.csv')
        print(stock_df.head())


        return ResponseUtil.success(data=stock_df.to_json())
    except Exception as e:
        logger.exception(e)
        return ResponseUtil.error(msg=str(e))
        
        
