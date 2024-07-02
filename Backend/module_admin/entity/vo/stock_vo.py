from pydantic import BaseModel
import datetime

class KlineShortModel(BaseModel):
	ts: int
	open: float
	high: float
	close: float
	low: float
class KlineShortModel(BaseModel):
	ts: int
	open: float
	close: float
	high: float
	low: float

class KlineShortModels(BaseModel):
	rows: list[KlineShortModel]