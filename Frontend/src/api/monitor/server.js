import request from '@/utils/request'

// 获取服务信息
export function getServer() {
  return request({
    url: '/monitor/server',
    method: 'get'
  })
}

//测试
export function getStock() {
  return request({
    url: '/stock/kline/000001',
    method: 'get'
  })
}