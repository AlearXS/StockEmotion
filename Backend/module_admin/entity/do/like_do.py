from sqlalchemy import Column, Integer, String, DateTime, UniqueConstraint
from config.database import Base
from datetime import datetime

class Like(Base):
	__tablename__ = 'likes'
	
	id = Column(Integer, nullable=False, autoincrement=True, primary_key=True)
	user_id = Column(Integer)
	code = Column(String(30, collation='utf8_general_ci'), nullable=False, comment='股票代码')

	__table_args__ = (UniqueConstraint('user_id', 'code', name='unique_field1_field2'),)
