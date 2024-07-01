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

testController = APIRouter(prefix='/stock')


@testController.get("/overall", response_model=list[PageResponseModel])
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
    

