上市公司新闻情感与股票价格的关系，前后端框架使用[秦时明月/RuoYi-Vue3-FastAPI](https://gitee.com/zywstart/RuoYi-Vue3-FastAPI?_refluxos=a10)

<details class="details-reset details-overlay details-overlay-dark " style="box-sizing: border-box; display: block; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary class="float-right" role="button" style="box-sizing: border-box; display: list-item; cursor: pointer; float: right !important; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><div class="Link--secondary pt-1 pl-2" style="box-sizing: border-box; padding-top: var(--base-size-4, 4px) !important; padding-left: var(--base-size-8, 8px) !important; color: var(--fgColor-muted) !important;"><svg aria-label="Edit repository metadata" role="img" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-gear float-right"><path d="M8 0a8.2 8.2 0 0 1 .701.031C9.444.095 9.99.645 10.16 1.29l.288 1.107c.018.066.079.158.212.224.231.114.454.243.668.386.123.082.233.09.299.071l1.103-.303c.644-.176 1.392.021 1.82.63.27.385.506.792.704 1.218.315.675.111 1.422-.364 1.891l-.814.806c-.049.048-.098.147-.088.294.016.257.016.515 0 .772-.01.147.038.246.088.294l.814.806c.475.469.679 1.216.364 1.891a7.977 7.977 0 0 1-.704 1.217c-.428.61-1.176.807-1.82.63l-1.102-.302c-.067-.019-.177-.011-.3.071a5.909 5.909 0 0 1-.668.386c-.133.066-.194.158-.211.224l-.29 1.106c-.168.646-.715 1.196-1.458 1.26a8.006 8.006 0 0 1-1.402 0c-.743-.064-1.289-.614-1.458-1.26l-.289-1.106c-.018-.066-.079-.158-.212-.224a5.738 5.738 0 0 1-.668-.386c-.123-.082-.233-.09-.299-.071l-1.103.303c-.644.176-1.392-.021-1.82-.63a8.12 8.12 0 0 1-.704-1.218c-.315-.675-.111-1.422.363-1.891l.815-.806c.05-.048.098-.147.088-.294a6.214 6.214 0 0 1 0-.772c.01-.147-.038-.246-.088-.294l-.815-.806C.635 6.045.431 5.298.746 4.623a7.92 7.92 0 0 1 .704-1.217c.428-.61 1.176-.807 1.82-.63l1.102.302c.067.019.177.011.3-.071.214-.143.437-.272.668-.386.133-.066.194-.158.211-.224l.29-1.106C6.009.645 6.556.095 7.299.03 7.53.01 7.764 0 8 0Zm-.571 1.525c-.036.003-.108.036-.137.146l-.289 1.105c-.147.561-.549.967-.998 1.189-.173.086-.34.183-.5.29-.417.278-.97.423-1.529.27l-1.103-.303c-.109-.03-.175.016-.195.045-.22.312-.412.644-.573.99-.014.031-.021.11.059.19l.815.806c.411.406.562.957.53 1.456a4.709 4.709 0 0 0 0 .582c.032.499-.119 1.05-.53 1.456l-.815.806c-.081.08-.073.159-.059.19.162.346.353.677.573.989.02.03.085.076.195.046l1.102-.303c.56-.153 1.113-.008 1.53.27.161.107.328.204.501.29.447.222.85.629.997 1.189l.289 1.105c.029.109.101.143.137.146a6.6 6.6 0 0 0 1.142 0c.036-.003.108-.036.137-.146l.289-1.105c.147-.561.549-.967.998-1.189.173-.086.34-.183.5-.29.417-.278.97-.423 1.529-.27l1.103.303c.109.029.175-.016.195-.045.22-.313.411-.644.573-.99.014-.031.021-.11-.059-.19l-.815-.806c-.411-.406-.562-.957-.53-1.456a4.709 4.709 0 0 0 0-.582c-.032-.499.119-1.05.53-1.456l.815-.806c.081-.08.073-.159.059-.19a6.464 6.464 0 0 0-.573-.989c-.02-.03-.085-.076-.195-.046l-1.102.303c-.56.153-1.113.008-1.53-.27a4.44 4.44 0 0 0-.501-.29c-.447-.222-.85-.629-.997-1.189l-.289-1.105c-.029-.11-.101-.143-.137-.146a6.6 6.6 0 0 0-1.142 0ZM11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM9.5 8a1.5 1.5 0 1 0-3.001.001A1.5 1.5 0 0 0 9.5 8Z"></path></svg></div></summary></details>


## 平台简介

RuoYi-Vue3-FastAPI是一套全部开源的快速开发平台，毫无保留给个人及企业免费使用。

* 前端采用Vue、Element Plus，基于<u>[RuoYi-Vue3](https://github.com/yangzongzhuan/RuoYi-Vue3)</u>前端项目修改。
* 后端采用FastAPI、sqlalchemy、MySQL、Redis、OAuth2 & Jwt。
* 权限认证使用OAuth2 & Jwt，支持多终端认证系统。
* 支持加载动态权限菜单，多方式轻松权限控制。
* Vue2版本：
  - Gitte仓库地址：https://gitee.com/insistence2022/RuoYi-Vue-FastAPI
  - GitHub仓库地址：https://github.com/insistence/RuoYi-Vue-FastAPI
* 纯Python版本：
  - Gitte仓库地址：https://gitee.com/insistence2022/dash-fastapi-admin
  - GitHub仓库地址：https://github.com/insistence/Dash-FastAPI-Admin
* 特别鸣谢：<u>[RuoYi-Vue3](https://github.com/yangzongzhuan/RuoYi-Vue3)</u>

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
3.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
4.  部门管理：配置系统组织机构（公司、部门、小组）。
5.  岗位管理：配置系统用户所属担任职务。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除）任务调度包含执行结果日志。
13. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
14. 缓存监控：对系统的缓存信息查询，命令统计等。
15. 系统接口：根据业务代码自动生成相关的api接口文档。

## 演示图

<table>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/login.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/dashboard.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/user.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/role.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/menu.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/dept.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/post.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/dict.png"/></td>
    </tr>	 
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/config.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/notice.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/operLog.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/loginLog.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/online.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/job.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/server.png"/></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/cache.png"/></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/cacheList.png"></td>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/api.png"></td>
    </tr>
    <tr>
        <td><img src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/profile.png"/></td>
    </tr>
</table>

## 在线体验
- *账号：admin*
- *密码：admin123*
- 演示地址：<a href="https://vfadmin.insistence.tech">vfadmin管理系统<a>

## 项目开发及发布相关

### 开发

```bash
# 克隆项目
git clone https://gitee.com/insistence2022/RuoYi-Vue3-FastAPI.git

# 进入项目根目录
cd RuoYi-Vue3-FastAPI
```

#### 前端
```bash
# 进入前端目录
cd ruoyi-fastapi-frontend

# 安装依赖
npm install 或 yarn --registry=https://registry.npmmirror.com

# 建议不要直接使用 cnpm 安装依赖，会有各种诡异的 bug。可以通过如下操作解决 npm 下载速度慢的问题
npm install --registry=https://registry.npmmirror.com

# 启动服务
npm run dev 或 yarn dev
```

#### 后端
```bash
# 进入后端目录
cd ruoyi-fastapi-backend

# 安装项目依赖环境
pip3 install -r requirements.txt

# 配置环境
在.env.dev文件中配置开发环境的数据库和redis

# 运行sql文件
1.新建数据库ruoyi-fastapi(默认，可修改)
2.使用命令或数据库连接工具运行sql文件夹下的ruoyi-fastapi.sql

# 运行后端
python3 app.py --env=dev
```

#### 访问
```bash
# 默认账号密码
账号：admin
密码：admin123

# 浏览器访问
地址：http://localhost:80
```

### 发布

#### 前端
```bash
# 构建测试环境
npm run build:stage 或 yarn build:stage

# 构建生产环境
npm run build:prod 或 yarn build:prod
```

#### 后端
```bash
# 配置环境
在.env.prod文件中配置生产环境的数据库和redis

# 运行后端
python3 app.py --env=prod
```

## 交流与赞助
如果有对本项目及FastAPI感兴趣的朋友，欢迎加入知识星球一起交流学习，让我们一起变得更强。如果你觉得这个项目帮助到了你，你可以请作者喝杯咖啡表示鼓励☕。扫描下面微信二维码添加微信备注VF-Admin即可进群。
<table>
    <tr>
        <td><img alt="zsxq" src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/zsxq.jpg"></td>
        <td><img alt="zanzhu" src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/zanzhu.jpg"></td>
    </tr>
    <tr>
        <td><img alt="wxcode" src="https://gitee.com/insistence2022/RuoYi-Vue-FastAPI/raw/master/demo-pictures/wxcode.jpg"></td>
    </tr>
</table>