<template>
   <div class="app-container">
      <el-table v-loading="loading" :data="likeList">
         <el-table-column label="股票代码" width="100" align="center" prop="代码" />
         <el-table-column label="股票名称" align="center" prop="名称" :show-overflow-tooltip="true" />
         <el-table-column label="最新价" align="center" prop="最新价" :show-overflow-tooltip="true" />
         <el-table-column label="成交量" align="center" prop="成交量" :show-overflow-tooltip="true" />
         <el-table-column label="最高" align="center" prop="最高" :show-overflow-tooltip="true" />
         <el-table-column label="最低" align="center" prop="最低" :show-overflow-tooltip="true" />
         <el-table-column label="今开" align="center" prop="今开" :show-overflow-tooltip="true" />
         <el-table-column label="昨收" align="center" prop="昨收" :show-overflow-tooltip="true" />
         <el-table-column label="总市值" align="center" prop="总市值" :show-overflow-tooltip="true" />
         <el-table-column label="涨速" align="center" prop="涨速" :show-overflow-tooltip="true" />
         <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
            <template #default="scope">
               <el-tooltip content="删除" placement="top">
                  <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"></el-button>
               </el-tooltip>
               <el-tooltip content="分析" placement="top">
                  <el-button link type="primary" icon="View" @click="handleView(scope.row)"></el-button>
               </el-tooltip>
            </template>
         </el-table-column>
      </el-table>

      <el-dialog v-model="openView" width="700px" append-to-body>
         <highcharts :options="chartOptions"></highcharts>
         <template #footer>
            <div class="dialog-footer">
               <el-button @click="openView = false">关 闭</el-button>
            </div>
         </template>
      </el-dialog>
   </div>
</template>

<script setup>
import { getlike, delike, } from "@/api/monitor/server";

const { proxy } = getCurrentInstance();

const likeList = ref([]);
const loading = ref(true);
const openView = ref(false);
const chartOptions = ref(
   {
      title: {
         text: 'Prediction',
         align: 'left'
      },
      xAxis: {
         labels: {
            enabled: false
         }
      },
      yAxis: {
         title: {
            text: '股价'
         },
         labels: {
            enabled: false
         }
      },
      legend: {
         layout: 'vertical',
         align: 'right',
         verticalAlign: 'middle'
      },
      plotOptions: {
         series: {
            marker: {
               enabled: false
            }
         }
      },
      series: [{
         name: '真实值',
         data: [
            43934, 48656, 65165, 81827, 112143, 142383,
            171533, 165174, 155157, 161454, 154610
         ]
      }, {
         name: '预测值',
         data: [
            24916, 47941, 40742, 60851, 132490, 130282,
            171466, 165222, 155000, 165000, 153333
         ]
      }],
      responsive: {
         rules: [{
            condition: {
               maxWidth: 500
            },
            chartOptions: {
               legend: {
                  layout: 'horizontal',
                  align: 'center',
                  verticalAlign: 'bottom'
               }
            }
         }]
      },
      credits: {
         enabled: false
      }
   });
/** 任务详细信息 */
function handleView(row) {
   openView.value = true;
}

function getlikelist() {
   getlike().then(response => {
      likeList.value = response.data
      loading.value = false;
   });
}
/** 删除按钮操作 */
function handleDelete(row) {
   proxy.$modal.confirm('是否取消收藏?').then(function () {
      return delike(row.代码);
   }).then(() => {
      getlikelist();
      proxy.$modal.msgSuccess("取消收藏成功");
   }).catch(() => { });
}

getlikelist();
</script>
