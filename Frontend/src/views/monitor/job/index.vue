<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch">
      <el-form-item prop="jobName">
        <el-input v-model="queryParams.jobName" placeholder="请输入股票名称" clearable style="width: 200px"
          @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
        <el-button icon="Refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="jobList" >
      <el-table-column label="股票代码" width="100" align="center" prop="jobId" />
      <el-table-column label="股票名称" align="center" prop="jobName" :show-overflow-tooltip="true" />
      <el-table-column label="开盘价" align="center" prop="jobGroup" />
      <el-table-column label="收盘价" align="center" prop="invokeTarget" :show-overflow-tooltip="true" />
      <el-table-column label="最高价" align="center" prop="cronExpression" :show-overflow-tooltip="true" />
      <el-table-column label="最低价" align="center" prop="cronExpression" :show-overflow-tooltip="true" />
      <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-tooltip content="分析详情" placement="top">
            <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
              v-hasPermi="['monitor:job:edit']"></el-button>
          </el-tooltip>
          <el-tooltip content="最近新闻" placement="top">
            <el-button link type="primary" icon="View" @click="handleView(scope.row)"
              v-hasPermi="['monitor:job:query']"></el-button>
          </el-tooltip>
          <el-tooltip content="收藏" placement="top">
            <el-button link type="primary" icon="CaretRight" @click="handleRun(scope.row)"
              v-hasPermi="['monitor:job:changeStatus']"></el-button>
          </el-tooltip>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />


    <el-dialog title="数据可视化" v-model="open" width= 90% append-to-body>
      <highcharts :constructor-type="'stockChart'" :options="klineOptions"></highcharts>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="cancel">确 定</el-button>
        </div>
      </template>
    </el-dialog>


    <el-dialog title="最近新闻" v-model="openView" width="700px" append-to-body>
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
import { getStock } from '@/api/monitor/server';

const { proxy } = getCurrentInstance();

const jobList = ref([]);
const open = ref(false);
const loading = ref(true);
const showSearch = ref(true);
const ids = ref([]);
const total = ref(0);
const title = ref("");
const openView = ref(false);
const kline = ref();
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

const { queryParams, form } = toRefs(data);

/** 查询定时任务列表 */
function getList() {
  loading.value = true;
  listJob(queryParams.value).then(response => {
    jobList.value = response.rows;
    console.log(jobList);
    total.value = response.total;
    loading.value = false;
  });
}
/** 取消按钮 */
function cancel() {
  open.value = false;
  reset();
}
/** 表单重置 */
function reset() {
  form.value = {
    jobId: undefined,
    jobName: undefined,
    jobGroup: undefined,
    invokeTarget: undefined,
    cronExpression: undefined,
    misfirePolicy: "1",
    concurrent: "1",
    status: "0"
  };
  proxy.resetForm("jobRef");
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
  proxy.$modal.confirm('确认要收藏"' + row.jobName + '"吗?').then(function () {
    return runJob(row.jobId);
  }).then(() => {
    proxy.$modal.msgSuccess("收藏成功");
  })
    .catch(() => { });
}
/** 任务详细信息 */
function handleView(row) {
  getJob(row.jobId).then(response => {
    form.value = response.data;
    openView.value = true;
  });
}

/** 按钮操作 */
function handleUpdate(row) {
  reset();
  const jobId = row.jobId || ids.value;
  getJob(jobId).then(response => {
    form.value = response.data;
    open.value = true;
    title.value = "修改任务";
  });
}
function getKl() {
  proxy.$modal.loading("正在加载服务监控数据，请稍候！");
  getStock().then(response => {
    kline.value = response.data;
    proxy.$modal.closeLoading();
  });
}
getKl();
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