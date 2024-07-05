from venv import logger
from httpx import delete
from module_admin.entity.do.like_do import Like
from sqlalchemy import and_
from sqlalchemy.orm import Session
from module_admin.entity.do.dict_do import SysDictType, SysDictData
from module_admin.entity.vo.dict_vo import *
from utils.time_format_util import list_format_datetime
from utils.page_util import PageUtil
import datetime
import pandas as pd

class LikeDao:
	"""
	收藏列表数据库操作层
	"""

	@classmethod
	def get_like_list_by_id(cls, db: Session, user_id: int):
		"""
		根据字典类型id获取字典类型详细信息
		:param db: orm对象
		:param dict_id: 字典类型id
		:return: 字典类型信息对象
		"""
		res = db.query(Like)\
				.filter(Like.user_id == user_id) \
				.all()

		return res
	@classmethod
	def add(cls, db: Session, user_id: int, code: str):
		logger.info('add in dao')
		res = Like(user_id = user_id, code = code)
		db.add(res)
		db.flush()
		db.commit()
		return res

	@classmethod
	def delete(cls, db: Session, user_id: int, code: str):
		res = db.query(Like) \
			.filter(Like.user_id == user_id, Like.code == code) \
			.delete()
		db.flush()
		db.commit()
		return res