from config.database import Base
from sqlalchemy import Column, Float, PrimaryKeyConstraint, String, create_engine, Date, text
# from sqlalchemy.orm import sessionmaker
# from sqlalchemy.ext.declarative import declarative_base

# Base = declarative_base()

class KLine(Base):
	'''
	日期	object	交易日
	股票代码	object	不带市场标识的股票代码
	开盘	float64	开盘价
	收盘	float64	收盘价
	最高	float64	最高价
	最低	float64	最低价
	成交量	int64	注意单位: 手
	成交额	float64	注意单位: 元
	振幅	float64	注意单位: %
	涨跌幅	float64	注意单位: %
	涨跌额	float64	注意单位: 元
	换手率	float64	注意单位: %
	'''
	__tablename__ = 'kline'

	# id = Column(Integer)
	date = Column(Date)
	code = Column(String(30, collation='utf8_general_ci'), nullable=False, comment='股票代码')
	open = Column(Float, nullable=False, comment='开盘价')
	close = Column(Float, nullable=False, comment='收盘')
	high = Column(Float, nullable=False, comment='最高')
	low = Column(Float, nullable=False, comment='最低')
	volume = Column(Float, nullable=False, comment='成交量')
	amount = Column(Float, nullable=False, comment='成交额')
	zhenfu = Column(Float, nullable=False, comment='振幅')
	zhangdiefu = Column(Float, nullable=False, comment='涨跌幅')
	zhangdiee = Column(Float, nullable=False, comment='涨跌额')
	turn = Column(Float, nullable=False, comment='换手率')

	__table_args__ = (PrimaryKeyConstraint('date', 'code'), {})
