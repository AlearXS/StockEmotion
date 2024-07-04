<template>
   <div class="app-container">
      <el-table v-loading="loading" :data="jobList" >
         <el-table-column label="股票编号" width="100" align="center" prop="jobId" />
         <el-table-column label="股票名称" align="center" prop="jobName" :show-overflow-tooltip="true" />
         <el-table-column label="操作" align="center" width="200" class-name="small-padding fixed-width">
            <template #default="scope">
               <el-tooltip content="删除" placement="top">
                  <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
                     v-hasPermi="['monitor:job:remove']"></el-button>
               </el-tooltip>
               <el-tooltip content="分析" placement="top">
                  <el-button link type="primary" icon="View" @click="handleView(scope.row)"
                     v-hasPermi="['monitor:job:query']"></el-button>
               </el-tooltip>
            </template>
         </el-table-column>
      </el-table>

      <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
         v-model:limit="queryParams.pageSize" @pagination="getList" />

      <!-- 任务日志详细 -->
      <el-dialog title="预测分析" v-model="openView" width="700px" append-to-body>
         <template #footer>
            <div class="dialog-footer">
               <el-button @click="openView = false">关 闭</el-button>
            </div>
         </template>
      </el-dialog>
   </div>
</template>

<script setup name="Job">
import { listJob, getJob, delJob } from "@/api/monitor/job";
const router = useRouter();
const { proxy } = getCurrentInstance();

const jobList = ref([]);
const loading = ref(true);
const ids = ref([]);
const total = ref(0);
const openView = ref(false);


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

const { queryParams, form} = toRefs(data);

/** 查询定时任务列表 */
function getList() {
   loading.value = true;
   listJob(queryParams.value).then(response => {
      jobList.value = response.rows;
      total.value = response.total;
      loading.value = false;
   });
}

/** 任务详细信息 */
function handleView(row) {
   getJob(row.jobId).then(response => {
      form.value = response.data;
      openView.value = true;
   });
}

/** 删除按钮操作 */
function handleDelete(row) {
   const jobIds = row.jobId || ids.value;
   proxy.$modal.confirm('是否取消收藏?').then(function () {
      return delJob(jobIds);
   }).then(() => {
      getList();
      proxy.$modal.msgSuccess("取消收藏成功");
   }).catch(() => { });
}

getList();
</script>
