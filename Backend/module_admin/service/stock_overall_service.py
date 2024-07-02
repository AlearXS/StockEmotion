
from module_admin.entity.vo.stock_overall_vo import StockOverallModel, StockOverallModels
import akshare as ak

def get_stock_overall_list_service():
	stock_sse_summary_df = ak.stock_sse_summary()
	stock_sse_summary_df.columns = ['id', 'stock', 'kcb', 'zb']
	print(stock_sse_summary_df)
	return StockOverallModels(content=[StockOverallModel(**row) for _, row in stock_sse_summary_df.iterrows()])
