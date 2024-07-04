from module_admin.entity.do.stock_do import KLine
from sqlalchemy import and_
from sqlalchemy.orm import Session
from module_admin.entity.do.dict_do import SysDictType, SysDictData
from module_admin.entity.vo.dict_vo import *
from utils.time_format_util import list_format_datetime
from utils.page_util import PageUtil
import datetime


class StockDao:
    """
    字典类型管理模块数据库操作层
    """

    @classmethod
    def get_kline_for_painting_by_code(cls, db: Session, code: str, startdate: datetime.date = datetime.date(2023, 1, 1), end_date = datetime.datetime.now().date(), adjust: str = ""):
        """
        根据字典类型id获取字典类型详细信息
        :param db: orm对象
        :param dict_id: 字典类型id
        :return: 字典类型信息对象
        """
        kline_for_painting_info = db.query(KLine.date, KLine.open, KLine.high, KLine.low, KLine.close) \
            .filter(KLine.code == code,  KLine.date >= startdate, KLine.date <= end_date) \
            .all()
            # .first()
        

        return kline_for_painting_info