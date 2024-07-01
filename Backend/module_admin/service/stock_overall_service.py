
from module_admin.entity.vo.stock_overall_vo import StockOverallModel
import akshare as ak
stock_sse_summary_df = ak.stock_sse_summary()
stock_sse_summary_df.columns = ['id', 'stock', 'kcb', 'zb']
print(stock_sse_summary_df)

def get_stock_overall_list_service():
	return [StockOverallModel(**row) for _, row in stock_sse_summary_df.iterrows()]
