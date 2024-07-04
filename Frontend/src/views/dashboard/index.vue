<template>
  <div>
    <div class="pageHeaderContent">
      <div class="avatar">
        <a-avatar size="large" :src="currentUser.avatar" />
      </div>
      <div class="content">
        <div class="contentTitle">
          {{ currentUser.name }}
          ，祝您日进斗金！
        </div>
        <div>{{ currentUser.title }}</div>
      </div>
      <div class="extraContent">
        <div class="statItem">
          <a-statistic title="持股数" :value="56" />
        </div>
      </div>
    </div>

    <div style="padding: 10px">
      <a-row :gutter="24">
        <a-col :xl="16" :lg="24" :md="24" :sm="24" :xs="24">
          <a-card class="projectList" :style="{ marginBottom: '24px' }" title="相关网站" :bordered="false" :loading="false"
            :body-style="{ padding: 0 }">
            <template #extra>
              <a href="/monitor/druid"> <span style="color: #1890ff">我的收藏</span> </a>
            </template>
            <a-card-grid v-for="item in projectNotice" :key="item.id" class="projectGrid">
              <a-card :body-style="{ padding: 0 }" style="box-shadow: none" :bordered="false">
                <a-card-meta :description="item.description" class="w-full">
                  <template #title>
                    <div class="cardTitle">
                      <a-avatar size="small" :src="item.logo" />
                      <a :href="item.href" target="_blank">
                        {{ item.title }}
                      </a>
                    </div>
                  </template>
                </a-card-meta>
                <div class="projectItemContent">
                  <a :href="item.memberLink">
                    {{ item.member || "" }}
                  </a>
                  <span class="datetime" ml-2 :title="item.updatedAt">
                    {{ item.updatedAt }}
                  </span>
                </div>
              </a-card>
            </a-card-grid>
          </a-card>
          <el-calendar v-model="value" />
        </a-col>
        <a-col :xl="8" :lg="24" :md="24" :sm="24" :xs="24">
          <a-card :style="{ marginBottom: '24px' }" :bordered="false" title="今日指数">
            <div class="chart">
              <div ref="radarContainer" />
            </div>
          </a-card>
        </a-col>
      </a-row>
    </div>
  </div>
</template>

<script>
import {
  Statistic,
  Row,
  Col,
  Card,
  CardGrid,
  CardMeta,
  List,
  ListItem,
  ListItemMeta,
  Avatar,
} from "ant-design-vue";
import 'ant-design-vue/dist/reset.css';

export default {
  components: {
    AStatistic: Statistic,
    ARow: Row,
    ACol: Col,
    ACard: Card,
    ACardGrid: CardGrid,
    ACardMeta: CardMeta,
    AList: List,
    AListItem: ListItem,
    AListItemMeta: ListItemMeta,
    AAvatar: Avatar,
  },
};
</script>


<script setup>
import { Radar } from "@antv/g2plot";
import { ref } from 'vue'
import EditableLinkGroup from "./editable-link-group.vue";

defineOptions({
  name: "DashBoard",
});
const value = ref(new Date())
const currentUser = {
  avatar: "https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png",
  name: "吴彦祖",
  userid: "00000001",
  email: "antdesign@alipay.com",
  signature: "海纳百川，有容乃大",
  title: "资深用户",
  group: "蚂蚁金服－某某某事业群－某某平台部－某某技术部－UED",
};
const projectNotice = [
  {
    id: "xxx1",
    title: "巨潮资讯",
    logo: "http://static.cninfo.com.cn/new/img/favicon.ico",
    description: "中国证监会指定信息披露网站",
    updatedAt: "",
    member: "行情分析与数据服务",
    href: "http://www.cninfo.com.cn",
    memberLink: "",
  },
  {
    id: "xxx2",
    title: " 东方财富网",
    logo: "//g1.dfcfw.com/g1/special/Apple_ico.png",
    description: "全面股票行情、股市直播、大盘分析",
    updatedAt: "",
    member: "综合性门户",
    href: "https://www.eastmoney.com/",
    memberLink: "",
  },
  {
    id: "xxx3",
    title: "新浪财经",
    logo: "https://www.sinaimg.cn/dy/images/header/2009/standardl2nav_sina_new.gif",
    description: "即时股票市场新闻、专家评论",
    updatedAt: "",
    member: "新闻资讯",
    href: "https://finance.sina.com.cn/stock",
    memberLink: "",
  },
  {
    id: "xxx4",
    title: "证券时报",
    logo: "https://static-web.stcn.com/static/images/zqsb.png",
    description: "专业的财经新闻和分析",
    updatedAt: "",
    member: "新闻资讯",
    href: "https://www.stcn.com/article/index.html",
    memberLink: "",
  },
  {
    id: "xxx5",
    title: "同花顺财经",
    logo: "http://i.thsi.cn/images/logo_ths.jpg",
    description:
      "股票行情、财经资讯及交易服务",
    updatedAt: "",
    member: "行情分析与数据服务",
    href: "http://www.10jqka.com.cn/stock",
    memberLink: "",
  },
  {
    id: "xxx6",
    title: "中信证券",
    logo: "https://www.citics.com/newsite/ggmk/wztb/wzlogo/201803/W020180711560116478457.png",
    description: "全面的金融服务",
    updatedAt: "",
    member: "综合性门户",
    href: "https://www.citics.com/?spm=5176.28103460.0.0.54093da2lkOyuF",
    memberLink: "",
  },
];

const radarContainer = ref();
const radarData = [
  {
    name: "A股",
    label: "表现",
    value: 6,
  },
  {
    name: "A股",
    label: "成交量",
    value: 8,
  },
  {
    name: "A股",
    label: "市盈率",
    value: 4,
  },
  {
    name: "A股",
    label: "汇率影响",
    value: 5,
  },
  {
    name: "A股",
    label: "监管",
    value: 7,
  },
  {
    name: "美股",
    label: "表现",
    value: 10,
  },
  {
    name: "美股",
    label: "成交量",
    value: 9,
  },
  {
    name: "美股",
    label: "市盈率",
    value: 9,
  },
  {
    name: "美股",
    label: "汇率影响",
    value: 3,
  },
  {
    name: "美股",
    label: "监管",
    value: 8,
  },
  {
    name: "港股",
    label: "表现",
    value: 6,
  },
  {
    name: "港股",
    label: "成交量",
    value: 5,
  },
  {
    name: "港股",
    label: "市盈率",
    value: 6,
  },
  {
    name: "港股",
    label: "汇率影响",
    value: 5,
  },
  {
    name: "港股",
    label: "监管",
    value: 5,
  },
];
let radar;
onMounted(() => {
  radar = new Radar(radarContainer.value, {
    data: radarData,
    xField: "label",
    yField: "value",
    seriesField: "name",
    point: {
      size: 4,
    },
    legend: {
      layout: "horizontal",
      position: "bottom",
    },
  });
  radar.render();
});

onBeforeUnmount(() => {
  radar?.destroy?.();
});
</script>

<style scoped lang="less">
.textOverflow() {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  word-break: break-all;
}

// mixins for clearfix
// ------------------------
.clearfix() {
  zoom: 1;

  &::before,
  &::after {
    display: table;
    content: " ";
  }

  &::after {
    clear: both;
    height: 0;
    font-size: 0;
    visibility: hidden;
  }
}

.activitiesList {
  padding: 0 24px 8px 24px;

  .username {
    color: rgba(0, 0, 0, 0.65);
  }

  .event {
    font-weight: normal;
  }
}

.pageHeaderContent {
  display: flex;
  padding: 12px;
  margin-bottom: 24px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;

  .avatar {
    flex: 0 1 72px;

    &>span {
      display: block;
      width: 72px;
      height: 72px;
      border-radius: 72px;
    }
  }

  .content {
    position: relative;
    top: 4px;
    flex: 1 1 auto;
    margin-left: 24px;
    color: rgba(0, 0, 0, 0.45);
    line-height: 22px;

    .contentTitle {
      margin-bottom: 12px;
      color: rgba(0, 0, 0, 0.85);
      font-weight: 500;
      font-size: 20px;
      line-height: 28px;
    }
  }
}

.extraContent {
  .clearfix();

  float: right;
  white-space: nowrap;

  .statItem {
    position: relative;
    display: inline-block;
    padding: 0 32px;

    >p:first-child {
      margin-bottom: 4px;
      color: rgba(0, 0, 0, 0.45);
      font-size: 14px;
      line-height: 22px;
    }

    >p {
      margin: 0;
      color: rgba(0, 0, 0, 0.85);
      font-size: 30px;
      line-height: 38px;

      >span {
        color: rgba(0, 0, 0, 0.45);
        font-size: 20px;
      }
    }

    &::after {
      position: absolute;
      top: 8px;
      right: 0;
      width: 1px;
      height: 40px;
      background-color: #e8e8e8;
      content: "";
    }

    &:last-child {
      padding-right: 0;

      &::after {
        display: none;
      }
    }
  }
}

.members {
  a {
    display: block;
    height: 24px;
    margin: 12px 0;
    color: rgba(0, 0, 0, 0.65);
    transition: all 0.3s;
    .textOverflow();

    .member {
      margin-left: 12px;
      font-size: 14px;
      line-height: 24px;
      vertical-align: top;
    }

    &:hover {
      color: #1890ff;
    }
  }
}

.projectList {
  :deep(.ant-card-meta-description) {
    height: 44px;
    overflow: hidden;
    color: rgba(0, 0, 0, 0.45);
    line-height: 22px;
  }

  .cardTitle {
    font-size: 0;

    a {
      display: inline-block;
      height: 24px;
      margin-left: 12px;
      color: rgba(0, 0, 0, 0.85);
      font-size: 14px;
      line-height: 24px;
      vertical-align: top;

      &:hover {
        color: #1890ff;
      }
    }
  }

  .projectGrid {
    width: 33.33%;
  }

  .projectItemContent {
    display: flex;
    flex-basis: 100%;
    height: 20px;
    margin-top: 8px;
    overflow: hidden;
    font-size: 12px;
    line-height: 20px;
    .textOverflow();

    a {
      display: inline-block;
      flex: 1 1 0;
      color: rgba(0, 0, 0, 0.45);
      .textOverflow();

      &:hover {
        color: #1890ff;
      }
    }

    .datetime {
      flex: 0 0 auto;
      float: right;
      color: rgba(0, 0, 0, 0.25);
    }
  }
}

.datetime {
  color: rgba(0, 0, 0, 0.25);
}

@media screen and (max-width: 1200px) and (min-width: 992px) {
  .activeCard {
    margin-bottom: 24px;
  }

  .members {
    margin-bottom: 0;
  }

  .extraContent {
    margin-left: -44px;

    .statItem {
      padding: 0 16px;
    }
  }
}

@media screen and (max-width: 992px) {
  .activeCard {
    margin-bottom: 24px;
  }

  .members {
    margin-bottom: 0;
  }

  .extraContent {
    float: none;
    margin-right: 0;

    .statItem {
      padding: 0 16px;
      text-align: left;

      &::after {
        display: none;
      }
    }
  }
}

@media screen and (max-width: 768px) {
  .extraContent {
    margin-left: -16px;
  }

  .projectList {
    .projectGrid {
      width: 50%;
    }
  }
}

@media screen and (max-width: 576px) {
  .pageHeaderContent {
    display: block;

    .content {
      margin-left: 0;
    }
  }

  .extraContent {
    .statItem {
      float: none;
    }
  }
}

@media screen and (max-width: 480px) {
  .projectList {
    .projectGrid {
      width: 100%;
    }
  }
}
</style>