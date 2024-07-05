from httpx import delete
from exceptions.exception import LoginException
from fastapi import APIRouter, Request
from fastapi import Depends
from config.get_db import get_db
from module_admin.service.login_service import LoginService, CurrentUserModel
from module_admin.service.dept_service import DeptService, DeptModel
from module_admin.service.stock_overall_service import get_stock_overall_list_service
from module_admin.service.stock_service import *
from module_admin.dao.like_dao import LikeDao
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
import pandas as pd
from sqlalchemy.exc import IntegrityError


likeController = APIRouter(prefix='/like', dependencies=[Depends(LoginService.get_current_user)])
# df = pd.read_csv
# try:
# 	df = pd.read_csv('like_list.csv')
# except Exception as e:
# 	df = pd.DataFrame(columns=['代码', ])

@likeController.put("/{code}")
async def add_like(request: Request, code: str, query_db: Session = Depends(get_db), current_user: CurrentUserModel = Depends(LoginService.get_current_user)):
	'''
	添加收藏
	'''

	logger.info('add')
	try:
		# current_user.user.user_id
		user_id = current_user.user.user_id
		if user_id is None:
			raise LoginException

		LikeDao.add(query_db, user_id, code)
		logger.info('添加成功')
		return ResponseUtil.success(msg='添加成功')
	except IntegrityError as e:
		logger.exception(e)
		return ResponseUtil.error(msg='收藏已存在')
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))


@likeController.get("/list", response_model=list[PageResponseModel])
async def get_like_list(request: Request, query_db: Session = Depends(get_db), current_user: CurrentUserModel = Depends(LoginService.get_current_user)):
	'''
	返回用户收藏
	'''
	logger.info('list')
	try:
		# current_user.user.user_id
		user_id = current_user.user.user_id
		if user_id is None:
			raise LoginException

		res = LikeDao.get_like_list_by_id(query_db, user_id)
		res = pd.DataFrame([{column.name: getattr(row, column.name) for column in row.__table__.columns} for row in res])
		df = ak.stock_zh_a_spot_em()
		res = pd.merge(res, df, left_on='code', right_on='代码', how='left')
		logger.info('获取成功')
		return ResponseUtil.success(msg='获取成功', data=res.to_dict('records'))
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))
	

@likeController.delete("/{code}")
async def delete_like(request: Request, code: str, query_db: Session = Depends(get_db), current_user: CurrentUserModel = Depends(LoginService.get_current_user)):
	'''
	测试前后端连接，返回股票总览
	'''

	logger.info('add')
	try:
		# current_user.user.user_id
		user_id = current_user.user.user_id
		if user_id is None:
			raise LoginException

		res = LikeDao.delete(query_db, user_id, code)
		# breakpoint()
		logger.info('删除成功')
		return ResponseUtil.success(msg='删除成功')
	except IntegrityError as e:
		logger.exception(e)
		return ResponseUtil.error(msg='收藏已存在')
	except Exception as e:
		logger.exception(e)
		return ResponseUtil.error(msg=str(e))
