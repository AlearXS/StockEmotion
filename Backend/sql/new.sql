-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ruoyi-fastapi
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `apscheduler_jobs`
--

DROP TABLE IF EXISTS `apscheduler_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apscheduler_jobs` (
  `id` varchar(191) NOT NULL,
  `next_run_time` double DEFAULT NULL,
  `job_state` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_apscheduler_jobs_next_run_time` (`next_run_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apscheduler_jobs`
--

LOCK TABLES `apscheduler_jobs` WRITE;
/*!40000 ALTER TABLE `apscheduler_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `apscheduler_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-06-30 18:25:18','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-06-30 18:25:18','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-06-30 18:25:18','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-06-30 18:25:18','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-06-30 18:25:18','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-06-30 18:25:18','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','集团总公司',0,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(101,100,'0,100','深圳分公司',1,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(102,100,'0,100','长沙分公司',2,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(103,101,'0,100,101','研发部门',1,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(104,101,'0,100,101','市场部门',2,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(105,101,'0,100,101','测试部门',3,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(106,101,'0,100,101','财务部门',4,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(107,101,'0,100,101','运维部门',5,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(108,102,'0,100,102','市场部门',1,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL),(109,102,'0,100,102','财务部门',2,'年糕','15888888888','niangao@qq.com','0','0','admin','2024-06-30 18:25:17','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-06-30 18:25:18','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-06-30 18:25:18','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-06-30 18:25:18','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-06-30 18:25:18','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-06-30 18:25:18','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-06-30 18:25:18','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'停用状态'),(10,1,'默认','default','sys_job_group','','','Y','0','admin','2024-06-30 18:25:18','',NULL,'默认分组'),(11,2,'数据库','sqlalchemy','sys_job_group','','','N','0','admin','2024-06-30 18:25:18','',NULL,'数据库分组'),(12,3,'redis','redis','sys_job_group','','','N','0','admin','2024-06-30 18:25:18','',NULL,'reids分组'),(13,1,'默认','default','sys_job_executor','','','N','0','admin','2024-06-30 18:25:18','',NULL,'线程池'),(14,2,'进程池','processpool','sys_job_executor','','','N','0','admin','2024-06-30 18:25:18','',NULL,'进程池'),(15,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-06-30 18:25:18','',NULL,'系统默认是'),(16,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'系统默认否'),(17,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-06-30 18:25:18','',NULL,'通知'),(18,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-06-30 18:25:18','',NULL,'公告'),(19,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-06-30 18:25:18','',NULL,'正常状态'),(20,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'关闭状态'),(21,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-06-30 18:25:18','',NULL,'其他操作'),(22,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-06-30 18:25:18','',NULL,'新增操作'),(23,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-06-30 18:25:18','',NULL,'修改操作'),(24,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'删除操作'),(25,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-06-30 18:25:18','',NULL,'授权操作'),(26,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-06-30 18:25:18','',NULL,'导出操作'),(27,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-06-30 18:25:18','',NULL,'导入操作'),(28,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'强退操作'),(29,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-06-30 18:25:18','',NULL,'生成操作'),(30,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'清空操作'),(31,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-06-30 18:25:18','',NULL,'正常状态'),(32,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-06-30 18:25:18','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-06-30 18:25:18','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-06-30 18:25:18','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-06-30 18:25:18','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-06-30 18:25:18','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-06-30 18:25:18','',NULL,'任务分组列表'),(6,'任务执行器','sys_job_executor','0','admin','2024-06-30 18:25:18','',NULL,'任务执行器列表'),(7,'系统是否','sys_yes_no','0','admin','2024-06-30 18:25:18','',NULL,'系统是否列表'),(8,'通知类型','sys_notice_type','0','admin','2024-06-30 18:25:18','',NULL,'通知类型列表'),(9,'通知状态','sys_notice_status','0','admin','2024-06-30 18:25:18','',NULL,'通知状态列表'),(10,'操作类型','sys_oper_type','0','admin','2024-06-30 18:25:18','',NULL,'操作类型列表'),(11,'系统状态','sys_common_status','0','admin','2024-06-30 18:25:18','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'default' COMMENT '任务组名',
  `job_executor` varchar(64) DEFAULT 'default' COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','default','default','module_task.scheduler_test.job',NULL,NULL,'0/10 * * * * ?','3','1','1','admin','2024-06-30 18:25:18','admin','2024-07-01 16:11:09',''),(2,'系统默认（有参）','default','default','module_task.scheduler_test.job','test',NULL,'0/15 * * * * ?','3','1','1','admin','2024-06-30 18:25:18','',NULL,''),(3,'系统默认（多参）','default','default','module_task.scheduler_test.job','new','{\"test\": 111}','0/20 * * * * ?','3','1','1','admin','2024-06-30 18:25:18','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_executor` varchar(64) NOT NULL COMMENT '任务执行器',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_args` varchar(255) DEFAULT '' COMMENT '位置参数',
  `job_kwargs` varchar(255) DEFAULT '' COMMENT '关键字参数',
  `job_trigger` varchar(255) DEFAULT '' COMMENT '任务触发器',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'系统默认（无参）','default','default','module_task.scheduler_test:job','','{}','cron[month=\'*\', day=\'*\', hour=\'*\', minute=\'*\', second=\'0/10\']','事件类型: JobEvent, 任务ID: 1, 任务名称: 系统默认（无参）, 执行于2024-07-01 16:11:04','0','','2024-07-01 15:37:36');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-06-30 22:08:14'),(101,'nuomi','','未知','Edge 122','Windows 10','1','用户不存在','2024-06-30 22:10:16'),(102,'tuanzi','','未知','Edge 122','Windows 10','1','用户不存在','2024-06-30 22:10:26'),(103,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-06-30 22:11:27'),(104,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 09:25:11'),(105,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:23:58'),(106,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:25:51'),(107,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:26:02'),(108,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:27:20'),(109,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:34:07'),(110,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:34:36'),(111,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 10:38:55'),(112,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 11:06:35'),(113,'niangao','','未知','Edge 122','Windows 10','1','验证码错误','2024-07-01 11:58:25'),(114,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 11:58:27'),(115,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 14:33:24'),(116,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 14:51:18'),(117,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 15:00:06'),(118,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 15:02:14'),(119,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 16:01:32'),(120,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 16:11:44'),(121,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-01 16:45:02'),(122,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 09:42:04'),(123,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 14:12:55'),(124,'niangao','','未知','Edge 122','Windows 10','1','验证码错误','2024-07-02 14:12:56'),(125,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 14:12:59'),(126,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 15:13:40'),(127,'niangao','','未知','Edge 122','Windows 10','1','验证码已失效','2024-07-02 16:04:18'),(128,'niangao','','未知','Edge 122','Windows 10','1','验证码错误','2024-07-02 16:04:29'),(129,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 16:04:33'),(130,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 16:21:41'),(131,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 16:21:46'),(132,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 18:56:26'),(133,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 20:36:25'),(134,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 20:36:27'),(135,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 21:19:45'),(136,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-02 21:20:07'),(137,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 09:11:11'),(138,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 09:42:29'),(139,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 10:45:43'),(140,'admin','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 10:46:21'),(141,'年糕','','未知','Edge 122','Windows 10','1','用户不存在','2024-07-03 10:55:09'),(142,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 10:55:15'),(143,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 14:10:19'),(144,'niangao','','未知','Edge 122','Windows 10','0','登录成功','2024-07-03 15:58:23');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-06-30 18:25:18','',NULL,'系统管理目录'),(2,'相关功能',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-06-30 18:25:18','admin','2024-07-01 10:38:43','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-06-30 18:25:18','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-06-30 18:25:18','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-06-30 18:25:18','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-06-30 18:25:18','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-06-30 18:25:18','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-06-30 18:25:18','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-06-30 18:25:18','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-06-30 18:25:18','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-06-30 18:25:18','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-06-30 18:25:18','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-06-30 18:25:18','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-06-30 18:25:18','admin','2024-07-01 16:09:59','在线用户菜单'),(110,'股票概览',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-06-30 18:25:18','admin','2024-07-01 16:10:09','定时任务菜单'),(111,'股票收藏',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-06-30 18:25:18','admin','2024-07-01 10:29:43','数据监控菜单'),(112,'数据分析',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-06-30 18:25:18','admin','2024-07-01 10:30:18','服务监控菜单'),(113,'股票预测',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-06-30 18:25:18','admin','2024-07-01 10:31:21','缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-06-30 18:25:18','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-06-30 18:25:18','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-06-30 18:25:18','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-06-30 18:25:18','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-06-30 18:25:18','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-06-30 18:25:18','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-06-30 18:25:18','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-06-30 18:25:18','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-06-30 18:25:18','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-06-30 18:25:18','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-06-30 18:25:18','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-06-30 18:25:18','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-06-30 18:25:18','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-06-30 18:25:18','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-06-30 18:25:18','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-06-30 18:25:18','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-06-30 18:25:18','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-06-30 18:25:18','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-06-30 18:25:18','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-06-30 18:25:18','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 vfadmin新版本发布啦','2',_binary '新版本内容','0','admin','2024-06-30 18:25:19','',NULL,'管理员'),(2,'维护通知：2018-07-01 vfadmin系统凌晨维护','1',_binary '维护内容','0','admin','2024-06-30 18:25:19','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'角色管理',2,'module_admin.controller.role_controller.edit_system_role()','PUT',1,'admin','研发部门','/dev-api/system/role','','未知','{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"2\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [2, 109, 1046, 1047, 1048, 110, 1049, 1050, 1051, 1052, 1053, 1054, 111, 112, 113, 114]}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-06-30T22:10:02.891820\"}',0,'','2024-06-30 22:10:03',2),(101,'角色管理',2,'module_admin.controller.role_controller.edit_system_role()','PUT',1,'admin','研发部门','/dev-api/system/role','','未知','{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"2\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"admin\", \"updateTime\": \"2024-06-30T22:10:03\", \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [2, 109, 1046, 1047, 1048, 110, 1049, 1050, 1051, 1052, 1053, 1054, 111, 112, 113, 114, 3, 115, 116, 1055, 1056, 1057, 1058, 1059, 1060, 117]}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:25:25.796921\"}',0,'','2024-07-01 10:25:26',1),(102,'角色管理',2,'module_admin.controller.role_controller.edit_system_role()','PUT',1,'admin','研发部门','/dev-api/system/role','','未知','{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"2\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"admin\", \"updateTime\": \"2024-07-01T10:25:26\", \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [2, 109, 1046, 1047, 1048, 110, 1049, 1050, 1051, 1052, 1053, 1054, 111, 112, 113, 114]}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:28:15.105137\"}',0,'','2024-07-01 10:28:15',0),(103,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 111, \"menuName\": \"股票收藏\", \"parentId\": 2, \"orderNum\": 3, \"path\": \"druid\", \"component\": \"monitor/druid/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:druid:list\", \"icon\": \"druid\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"数据监控菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:29:42.703815\"}',0,'','2024-07-01 10:29:43',0),(104,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 112, \"menuName\": \"数据分析\", \"parentId\": 2, \"orderNum\": 4, \"path\": \"server\", \"component\": \"monitor/server/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:server:list\", \"icon\": \"server\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"服务监控菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:30:17.662187\"}',0,'','2024-07-01 10:30:18',0),(105,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 113, \"menuName\": \"股票预测\", \"parentId\": 2, \"orderNum\": 5, \"path\": \"cache\", \"component\": \"monitor/cache/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:cache:list\", \"icon\": \"redis\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"缓存监控菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:31:20.982235\"}',0,'','2024-07-01 10:31:21',0),(106,'用户管理',1,'module_admin.controller.user_controller.add_system_user()','POST',1,'admin','研发部门','/dev-api/system/user','','未知','{\"userName\": \"test\", \"nickName\": \"测试员\", \"password\": \"123456\", \"status\": \"0\", \"postIds\": [], \"roleIds\": [2]}','{\"code\": 200, \"msg\": \"新增成功\", \"success\": true, \"time\": \"2024-07-01T10:32:40.944956\"}',0,'','2024-07-01 10:32:41',23),(107,'用户管理',3,'module_admin.controller.user_controller.delete_system_user()','DELETE',1,'admin','研发部门','/dev-api/system/user/100','','未知','{\"user_ids\": \"100\"}','{\"code\": 200, \"msg\": \"删除成功\", \"success\": true, \"time\": \"2024-07-01T10:33:19.371233\"}',0,'','2024-07-01 10:33:19',0),(108,'角色管理',2,'module_admin.controller.role_controller.edit_system_role()','PUT',1,'admin','研发部门','/dev-api/system/role','','未知','{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"2\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"admin\", \"updateTime\": \"2024-07-01T10:28:15\", \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [2, 111, 112, 113]}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:33:58.445338\"}',0,'','2024-07-01 10:33:58',0),(109,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 2, \"menuName\": \"相关功能\", \"parentId\": 0, \"orderNum\": 2, \"path\": \"monitor\", \"component\": null, \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"M\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"\", \"icon\": \"monitor\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"系统监控目录\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T10:38:42.871233\"}',0,'','2024-07-01 10:38:43',0),(110,'角色管理',2,'module_admin.controller.role_controller.edit_system_role()','PUT',1,'admin','研发部门','/dev-api/system/role','','未知','{\"roleId\": 2, \"roleName\": \"普通角色\", \"roleKey\": \"common\", \"roleSort\": 2, \"dataScope\": \"2\", \"menuCheckStrictly\": true, \"deptCheckStrictly\": true, \"status\": \"0\", \"delFlag\": \"0\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"admin\", \"updateTime\": \"2024-07-01T10:33:58\", \"remark\": \"普通角色\", \"admin\": false, \"menuIds\": [2, 110, 1049, 1050, 1051, 1052, 1053, 1054, 111, 112, 113]}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:02:30.660737\"}',0,'','2024-07-01 16:02:31',3),(111,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 109, \"menuName\": \"股票概览\", \"parentId\": 2, \"orderNum\": 1, \"path\": \"online\", \"component\": \"monitor/online/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:online:list\", \"icon\": \"online\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"在线用户菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:08:22.747160\"}',0,'','2024-07-01 16:08:23',1),(112,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 109, \"menuName\": \"在线用户\", \"parentId\": 2, \"orderNum\": 1, \"path\": \"online\", \"component\": \"monitor/online/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:online:list\", \"icon\": \"online\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"admin\", \"updateTime\": \"2024-07-01T16:08:23\", \"remark\": \"在线用户菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:09:58.696786\"}',0,'','2024-07-01 16:09:59',1),(113,'菜单管理',2,'module_admin.controller.menu_controller.edit_system_menu()','PUT',1,'admin','研发部门','/dev-api/system/menu','','未知','{\"menuId\": 110, \"menuName\": \"股票概览\", \"parentId\": 2, \"orderNum\": 2, \"path\": \"job\", \"component\": \"monitor/job/index\", \"query\": \"\", \"isFrame\": 1, \"isCache\": 0, \"menuType\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"monitor:job:list\", \"icon\": \"job\", \"createBy\": \"admin\", \"createTime\": \"2024-06-30T18:25:18\", \"updateBy\": \"\", \"updateTime\": null, \"remark\": \"定时任务菜单\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:10:08.691072\"}',0,'','2024-07-01 16:10:09',3),(114,'定时任务管理',2,'module_admin.controller.job_controller.edit_system_job()','PUT',1,'admin','研发部门','/dev-api/monitor/job/changeStatus','','未知','{\"jobId\": 1, \"status\": \"0\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:11:04.745239\"}',0,'','2024-07-01 16:11:05',2),(115,'定时任务管理',2,'module_admin.controller.job_controller.edit_system_job()','PUT',1,'admin','研发部门','/dev-api/monitor/job/changeStatus','','未知','{\"jobId\": 1, \"status\": \"1\"}','{\"code\": 200, \"msg\": \"更新成功\", \"success\": true, \"time\": \"2024-07-01T16:11:08.596031\"}',0,'','2024-07-01 16:11:09',3);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-06-30 18:25:18','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-06-30 18:25:18','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-06-30 18:25:18','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-06-30 18:25:18','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-06-30 18:25:18','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-06-30 18:25:18','admin','2024-07-01 16:02:31','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2),(2,110),(2,111),(2,112),(2,113),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','超级管理员','00','niangao@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-03 10:46:21','admin','2024-06-30 18:25:17','',NULL,'管理员'),(2,105,'niangao','年糕','00','niangao@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-07-03 15:58:23','admin','2024-06-30 18:25:17','',NULL,'测试员'),(100,NULL,'test','测试员','00','','','0','','$2b$12$eovkKTfX52aVBYesWqk2t.fNpRnktaSbo.MEAs5Wu29MmGVJFkO86','0','2','',NULL,'admin','2024-07-01 09:24:50','admin','2024-07-01 10:33:19',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03 16:08:44
