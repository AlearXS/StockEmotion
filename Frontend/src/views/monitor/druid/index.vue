<template>
   <div class="app-container">
      <div>我是股票收藏</div>
      <div>
         <highcharts :constructor-type="'stockChart'" :options="klineOptions"></highcharts>
      </div>
      <div>
         <highcharts :options="cloudOptions"></highcharts>
      </div>
   </div>
</template>

<script setup>

import { ref } from 'vue';
import { getStock } from '@/api/monitor/server';

const kline = ref([]);

const klineOptions = ref({
   chart: {
      type: 'candlestick',
      width: null,
      height: null,
   },
   series: [{
      type: "candlestick",
      name: "价格",
      color: "green",
      lineColor: "green",
      upColor: "red",
      upLineColor: "red",
      data: kline
   }],
   credits: {
      enabled: false
   }
})
const cloudOptions = ref({
   series: [{
      type: 'wordcloud',
      data: [
         { name: '大吉大利', weight: 10 },
         { name: '形势堪忧', weight: 7 },
         { name: '大举投入', weight: 5 },
         { name: '降低', weight: 15 }
         // 添加更多词及其权重
      ]
   }],
   title: {
      text: 'Simple Wordcloud'
   },
   credits: {
      enabled: false
   }
})
const { proxy } = getCurrentInstance();

function getList() {
   proxy.$modal.loading("正在加载服务监控数据，请稍候！");
   getStock().then(response => {
      kline.value = response.data;
      proxy.$modal.closeLoading();
   });
}

getList()
</script>

<style>
.highcharts-container {
   width: 600px;
   height: 400px;
   border: 1px solid #000000;
   margin: auto;
}
</style>