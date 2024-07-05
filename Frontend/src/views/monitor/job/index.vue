<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item prop="jobName">
        <el-input v-model="queryParams.jobName" placeholder="请输入股票信息" clearable style="width: 200px"
          @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="stocklist">
      <el-table-column label="股票代码" width="100" align="center" prop="代码" />
      <el-table-column label="股票名称" align="center" prop="股票名称" :show-overflow-tooltip="true" />
      <el-table-column label="最新价" align="center" prop="最新价" />
      <el-table-column label="涨跌幅" align="center" prop="涨跌幅" :show-overflow-tooltip="true" />
      <el-table-column label="涨跌额" align="center" prop="涨跌额" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="分析详情" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"></el-button>
          </el-tooltip>
          <el-tooltip content="最近新闻" placement="top">
            <el-button link type="primary" icon="View" @click="handleView(scope.row)"></el-button>
          </el-tooltip>
          <el-tooltip content="收藏" placement="top">
            <el-button link type="primary" icon="CaretRight" @click="handleRun(scope.row)"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="数据可视化" v-model="open" width=90% append-to-body>
      <highcharts :constructor-type="'stockChart'" :options="klineOptions"></highcharts>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="cancel">确 定</el-button>
        </div>
      </template>
    </el-dialog>


    <el-dialog v-model="openView" width="700px" append-to-body>
      <highcharts :options="cloudOptions"></highcharts>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="openView = false">关 闭</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Job">
import { listJob, getJob, runJob } from "@/api/monitor/job";
import { getStock, getStocklist, addlike } from '@/api/monitor/server';

const { proxy } = getCurrentInstance();

const jobList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const total = ref(0);
const openView = ref(false);
const stocklist = ref()
const cloudOptions = ref({
  chart: {
    type: 'wordcloud'
  },
  series: [{
    type: 'wordcloud',
    data: [{
      name: 'Lorem',
      weight: 10
    }, {
      name: 'Ipsum',
      weight: 9
    }, {
      name: 'Dolor',
      weight: 8
    }]
  }],
  title: {
    text: '新闻趋势'
  },
  credits: {
    enabled: false
  }
})
const groupingUnits = ref([[
  'week',                         // unit name
  [1]                             // allowed multiples
], [
  'month',
  [1, 2, 3, 4, 6]
]]);
const klineOptions = ref({
  rangeSelector: {
    selected: 4
  },
  title: {
    text: 'Historical Data'
  },
  chart: {
    width: null,
    height: null,
  },
  xAxis: {
    dateTimeLabelFormats: {
      millisecond: "%H:%M:%S.%L",
      second: "%H:%M:%S",
      minute: "%H:%M",
      hour: "%H:%M",
      day: "%m-%d",
      week: "%m-%d",
      month: "%y-%m",
      year: "%Y"
    },
    minRange: 30 * 24 * 3600000,
    min: null,
    max: null,
    startOnTick: false,
  },
  yAxis: [{
    labels: {
      align: 'right',
      x: -3
    },
    title: {
      text: 'OHLC'
    },
    height: '60%',
    lineWidth: 2,
    resize: {
      enabled: true
    }
  }, {
    labels: {
      align: 'right',
      x: -3
    },
    title: {
      text: 'Volume'
    },
    top: '65%',
    height: '35%',
    offset: 0,
    lineWidth: 2
  }],
  tooltip: {
    split: true
  },
  series: [
    {
      type: "candlestick",
      name: "价格",
      color: "green",
      lineColor: "green",
      upColor: "red",
      upLineColor: "red",

      data: [],
      dataGrouping: {
        units: groupingUnits
      }
    },
    {
      type: 'column',
      name: '成交',
      data: [],
      yAxis: 1,
      dataGrouping: {
        units: groupingUnits
      }
    }
  ],
  credits: {
    enabled: false
  }
})

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    jobName: undefined,
    jobGroup: undefined,
    status: undefined
  }
});

const { queryParams } = toRefs(data);

/** 查询定时任务列表 */
function getList() {
  loading.value = true;
  listJob(queryParams.value).then(response => {
    jobList.value = response.rows;
    total.value = response.total;
    loading.value = false;
  });
}
/** 取消按钮 */
function cancel() {
  open.value = false;
  location.reload()
}
/** 搜索按钮操作 */
function handleQuery() {
  queryParams.value.pageNum = 1;
  getList();
}
/** 重置按钮操作 */
function resetQuery() {
  proxy.resetForm("queryRef");
  handleQuery();
}

/* 立即执行一次 */
function handleRun(row) {
  proxy.$modal.confirm('确认要收藏"' + row.代码 + '"吗?').then(function () {
    return addlike(row.代码.slice(-6));
  }).then(() => {
    proxy.$modal.msgSuccess("收藏成功");
  })
    .catch(() => { });
}
/** 任务详细信息 */
function handleView() {
  openView.value = true;
};

/** 按钮操作 */
function handleUpdate(row) {
  let lastsix = row.代码.slice(-6);
  getKl(lastsix)
  open.value = true;
};

function getKl(stockid) {
  proxy.$modal.loading("正在加载数据，请稍候！");
  getStock(stockid).then(response => {
    for (let i = 0; i < response.data.length; i += 1) {
      klineOptions.value.series[0].data.push([
        response.data[i][0], // the date
        response.data[i][1], // open
        response.data[i][2], // high
        response.data[i][3], // low
        response.data[i][4] // close
      ]);
      klineOptions.value.series[1].data.push({
        x: response.data[i][0], // the date
        y: response.data[i][5], // the volume
        color: response.data[i][1] > response.data[i][4] ? 'green' : 'red'
      });
    }
    proxy.$modal.closeLoading();
  });
}
function getstocklist() {
  getStocklist().then(response => {
    stocklist.value = response.data
  });
}
getstocklist();
getList();
</script>

<style>
.highcharts-container {
  width: 600px;
  height: 400px;
  border: 1px solid #000000;
  margin: auto;
}
</style>