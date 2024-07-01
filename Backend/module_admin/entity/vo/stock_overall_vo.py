from pydantic import BaseModel

class StockOverallModel(BaseModel):
	id: object
	stock: object
	kcb: object
	zb: object