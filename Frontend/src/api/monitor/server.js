import request from '@/utils/request'

// 获取服务信息
export function getServer() {
  return request({
    url: '/monitor/server',
    method: 'get'
  })
}

export function getStock(str) {
  return request({
    url: '/stock/kline/'+str,
    method: 'get'
  })
}

export function getStocklist(stockcode) {
  return request({
    url: '/stock/list',
    method: 'get',
    param: stockcode
  })
}
export function getlike() {
  return request({
    url: '/stock/like/list',
    method: 'get'
  })
}
export function addlike(str) {
  return request({
    url: '/stock/like/'+str,
    method: 'put'
  })
}
export function delike(str) {
  return request({
    url: '/stock/like/'+str,
    method: 'delete'
  })
}