/*
Navicat MySQL Data Transfer

Source Server         : dber_plat_dev
Source Server Version : 50720
Source Host           : 192.168.120.3:3306
Source Database       : dber_plat

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-08 19:04:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '本平台昵称',
  `cellphone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '手机登录密码',
  `bind_id` int(11) DEFAULT NULL COMMENT '本账户被绑定的账户id，被绑定后，本账户数据将迁移到被绑定账户上，并且实现本账户',
  `_status` tinyint(4) NOT NULL COMMENT '账户状态：\r\n常规状态：\r\n1-启用\r\n2-绑定失效（被认证的其他账户绑定，数据已被迁移到其他账号上）\r\n3-登录锁定',
  `pw_expired` tinyint(4) NOT NULL DEFAULT '1' COMMENT '密码是否过期：1-否，2-是',
  `_type` tinyint(3) unsigned NOT NULL COMMENT '账户类型：1-健身者，2-私教，3-店铺管理员',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for account_third_open
-- ----------------------------
DROP TABLE IF EXISTS `account_third_open`;
CREATE TABLE `account_third_open` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '三方平台昵称',
  `open_id` varchar(50) NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `coacher_id` int(10) unsigned DEFAULT NULL,
  `_type` tinyint(3) unsigned NOT NULL COMMENT '账号平台类型：1-微信，2-QQ，3-支付宝，4-新浪微薄',
  `shop_manage_id` int(10) unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `fk_account_third_open_account_customer_1` (`customer_id`),
  KEY `fk_account_third_open_account_customer_2` (`coacher_id`),
  KEY `fk_account_third_open_account_3` (`shop_manage_id`),
  CONSTRAINT `fk_account_third_open_account_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_account_third_open_account_2` FOREIGN KEY (`coacher_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_account_third_open_account_3` FOREIGN KEY (`shop_manage_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_third_open
-- ----------------------------

-- ----------------------------
-- Table structure for booking_strategy
-- ----------------------------
DROP TABLE IF EXISTS `booking_strategy`;
CREATE TABLE `booking_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '策略名称',
  `begin_time` time NOT NULL DEFAULT '00:00:00' COMMENT '当天可预约起始时间，单位分钟',
  `end_time` time NOT NULL DEFAULT '00:14:40' COMMENT '当天可预约结束时间，单位分钟',
  `book_before_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被预约时间段前置强制占用时间',
  `book_after_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被预约时间段后置强制占用时间',
  `book_shortest_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '最短预约时长',
  `book_longest_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '最长预约时长',
  `book_current_start_offset` int(10) unsigned NOT NULL DEFAULT '55' COMMENT '预订起始时间隔当前时间至少为多长，单位分钟',
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='标的预约时间策略表\r\n所有时间没有说明时皆以分钟为单位\r\n所有预约时间区间为前闭后开';

-- ----------------------------
-- Records of booking_strategy
-- ----------------------------
INSERT INTO `booking_strategy` VALUES ('1001', '店铺订场', '10:00:00', '21:30:40', '5', '5', '60', '300', '30', null, '2018-01-07 20:54:08', '2018-01-08 10:53:58');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(20) unsigned NOT NULL,
  `enum_name` varchar(30) NOT NULL COMMENT '代码中的枚举名称',
  `value` smallint(5) unsigned NOT NULL,
  `label` varchar(20) NOT NULL,
  `content` varchar(100) DEFAULT NULL COMMENT '字典项描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_dict_dict_category_2` FOREIGN KEY (`category_id`) REFERENCES `dict_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', '1', 'HOT', '1', '热门', null, '2018-01-08 11:08:27', '2018-01-08 11:08:27');
INSERT INTO `dict` VALUES ('2', '1', 'BALL', '2', '球类', null, '2018-01-08 11:08:38', '2018-01-08 11:08:38');
INSERT INTO `dict` VALUES ('3', '2', 'YES', '1', '是', null, '2018-01-08 11:09:35', '2018-01-08 11:09:35');
INSERT INTO `dict` VALUES ('4', '2', 'NO', '2', '否', null, '2018-01-08 11:09:46', '2018-01-08 11:09:46');
INSERT INTO `dict` VALUES ('5', '3', 'VERY_ACTIVE', '1', '极活跃', null, '2018-01-08 11:27:59', '2018-01-08 11:27:59');
INSERT INTO `dict` VALUES ('6', '3', 'ACTIVE', '2', '活跃', null, '2018-01-08 11:28:13', '2018-01-08 11:28:13');
INSERT INTO `dict` VALUES ('7', '3', 'STABLY', '3', '稳定', null, '2018-01-08 11:29:03', '2018-01-08 11:29:03');
INSERT INTO `dict` VALUES ('8', '3', 'INERTIAL', '4', '惰性', null, '2018-01-08 11:30:15', '2018-01-08 11:30:15');
INSERT INTO `dict` VALUES ('9', '4', 'SYS', '1', '系统消息', null, '2018-01-08 14:11:54', '2018-01-08 14:11:54');
INSERT INTO `dict` VALUES ('10', '5', 'SHOP', '1', '店铺图片', null, '2018-01-08 15:26:24', '2018-01-08 15:26:24');
INSERT INTO `dict` VALUES ('11', '5', 'FITNESS', '3', '运动项目图片', null, '2018-01-08 15:28:00', '2018-01-08 15:28:00');
INSERT INTO `dict` VALUES ('12', '5', 'COACHER_IDENTIFICATION', '4', '教练认证头像', null, '2018-01-08 15:28:23', '2018-01-08 15:31:04');
INSERT INTO `dict` VALUES ('13', '5', 'CUSTOMER_IDENTIFICATION', '5', '用户认证头像', null, '2018-01-08 15:28:44', '2018-01-08 15:31:07');
INSERT INTO `dict` VALUES ('14', '5', 'SHOP_QR_CODE', '6', '店铺二维码', null, '2018-01-08 15:30:07', '2018-01-08 15:30:07');
INSERT INTO `dict` VALUES ('15', '5', 'COACHER_CERTIFICATE', '7', '教练认证证书', null, '2018-01-08 15:31:56', '2018-01-08 15:31:56');
INSERT INTO `dict` VALUES ('16', '5', 'FITNESS_TEST', '8', '体能测试结果', null, '2018-01-08 15:32:15', '2018-01-08 15:32:15');
INSERT INTO `dict` VALUES ('17', '6', 'AVAILABLE', '1', '可用', null, '2018-01-08 15:45:26', '2018-01-08 15:46:01');
INSERT INTO `dict` VALUES ('18', '6', 'DELETED', '2', '已删除', null, '2018-01-08 15:45:44', '2018-01-08 15:45:44');
INSERT INTO `dict` VALUES ('19', '6', 'EXPIRED', '3', '已过期', null, '2018-01-08 15:46:53', '2018-01-08 15:46:53');
INSERT INTO `dict` VALUES ('20', '7', 'PLAT', '1', '平台', null, '2018-01-08 15:59:08', '2018-01-08 15:59:08');
INSERT INTO `dict` VALUES ('21', '7', 'BILL', '2', '账单', null, '2018-01-08 15:59:16', '2018-01-08 15:59:16');
INSERT INTO `dict` VALUES ('22', '7', 'SHOP', '3', '店铺', null, '2018-01-08 15:59:27', '2018-01-08 15:59:27');
INSERT INTO `dict` VALUES ('23', '7', 'CUSTOMER', '4', '会员', null, '2018-01-08 15:59:44', '2018-01-08 15:59:44');
INSERT INTO `dict` VALUES ('24', '7', 'COACHER', '5', '教练', null, '2018-01-08 15:59:58', '2018-01-08 15:59:58');
INSERT INTO `dict` VALUES ('25', '8', 'SECOND', '2', '秒', null, '2018-01-08 16:01:51', '2018-01-08 16:19:19');
INSERT INTO `dict` VALUES ('26', '8', 'CRON', '1', 'CRON', null, '2018-01-08 16:02:05', '2018-01-08 16:19:33');
INSERT INTO `dict` VALUES ('27', '9', 'CLIENT', '1', 'client(msg-key)', null, '2018-01-08 16:10:59', '2018-01-08 16:12:23');
INSERT INTO `dict` VALUES ('28', '9', 'HTTP', '2', 'httpUrl', null, '2018-01-08 16:11:34', '2018-01-08 16:12:00');
INSERT INTO `dict` VALUES ('29', '9', 'CLASS', '3', 'class', null, '2018-01-08 16:12:49', '2018-01-08 16:12:49');
INSERT INTO `dict` VALUES ('30', '10', 'NEW', '1', '新建', null, '2018-01-08 16:15:07', '2018-01-08 16:15:07');
INSERT INTO `dict` VALUES ('31', '10', 'ENABLED', '2', '启用', null, '2018-01-08 16:15:36', '2018-01-08 16:15:36');
INSERT INTO `dict` VALUES ('32', '10', 'DISABLED', '3', '禁用', null, '2018-01-08 16:16:07', '2018-01-08 16:16:07');
INSERT INTO `dict` VALUES ('33', '11', 'INIT', '1', '初始化', null, '2018-01-08 18:06:03', '2018-01-08 18:06:03');
INSERT INTO `dict` VALUES ('34', '11', 'WAITING_EXECUTE', '2', '等待执行', null, '2018-01-08 18:06:25', '2018-01-08 18:06:25');
INSERT INTO `dict` VALUES ('35', '11', 'EXECUTING', '3', '执行中', null, '2018-01-08 18:06:37', '2018-01-08 18:06:37');
INSERT INTO `dict` VALUES ('36', '11', 'EXPIRED', '4', '过期失效', null, '2018-01-08 18:07:18', '2018-01-08 18:07:18');
INSERT INTO `dict` VALUES ('37', '11', 'SUCCESS', '5', '执行成功', null, '2018-01-08 18:07:32', '2018-01-08 18:07:32');
INSERT INTO `dict` VALUES ('38', '11', 'FAILURE', '6', '执行失败', null, '2018-01-08 18:07:45', '2018-01-08 18:07:45');
INSERT INTO `dict` VALUES ('39', '12', 'ENABLED', '1', '启用', null, '2018-01-08 18:20:25', '2018-01-08 18:20:25');
INSERT INTO `dict` VALUES ('40', '12', 'BIND_EXPIRED', '2', '绑定失效', null, '2018-01-08 18:20:47', '2018-01-08 18:20:47');
INSERT INTO `dict` VALUES ('41', '12', 'LOGIN_LOCK', '3', '锁定中', null, '2018-01-08 18:21:34', '2018-01-08 18:21:34');
INSERT INTO `dict` VALUES ('42', '13', 'CUSTOMER', '1', '健身者', null, '2018-01-08 18:24:34', '2018-01-08 18:24:34');
INSERT INTO `dict` VALUES ('43', '13', 'COACHER', '2', '教练', null, '2018-01-08 18:24:50', '2018-01-08 18:24:50');
INSERT INTO `dict` VALUES ('44', '13', 'SHOP_MANAGER', '3', '店铺管理员', null, '2018-01-08 18:25:30', '2018-01-08 18:25:30');

-- ----------------------------
-- Table structure for dict_category
-- ----------------------------
DROP TABLE IF EXISTS `dict_category`;
CREATE TABLE `dict_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `_code` varchar(30) NOT NULL,
  `category` varchar(20) NOT NULL COMMENT '字典类型名称',
  `sys` varchar(30) NOT NULL COMMENT '系统名称',
  `content` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='字典数据在对应业务系统里面一般以枚举表示\r\n相关业务方可以利用字典表数据查询了解相关系统字典信息';

-- ----------------------------
-- Records of dict_category
-- ----------------------------
INSERT INTO `dict_category` VALUES ('1', 'fitnessType', '运动类型', 'sys', null, '2018-01-08 11:08:12', '2018-01-08 16:05:47');
INSERT INTO `dict_category` VALUES ('2', 'yesNo', '是否', 'sys', null, '2018-01-08 11:09:24', '2018-01-08 16:05:57');
INSERT INTO `dict_category` VALUES ('3', 'elementActive', '元素活跃指数', 'sys', null, '2018-01-08 11:26:27', '2018-01-08 16:06:06');
INSERT INTO `dict_category` VALUES ('4', 'msgType', '消息类型', 'sys', null, '2018-01-08 14:11:38', '2018-01-08 16:06:13');
INSERT INTO `dict_category` VALUES ('5', 'imgType', '图片业务类型', 'sys', '1-店铺图片 3-系统健身运动服务项目图片 4-教练认证头像 5-用户认证头像等 6-店铺二维码 7-教练认证证书 8-体能测试结果', '2018-01-08 15:25:51', '2018-01-08 16:07:37');
INSERT INTO `dict_category` VALUES ('6', 'imgStatus', '图片状态', 'sys', '状态：1-可用，2-删除，3-过期', '2018-01-08 15:44:35', '2018-01-08 16:06:26');
INSERT INTO `dict_category` VALUES ('7', 'system', '系统', 'sys', '1-平台、2-账单、3-店铺、4-会员、5-教练等', '2018-01-08 15:58:25', '2018-01-08 16:06:33');
INSERT INTO `dict_category` VALUES ('8', 'jobTriggerType', '触发类型', 'sys', '1-cron表达式，2-秒', '2018-01-08 16:01:06', '2018-01-08 16:19:07');
INSERT INTO `dict_category` VALUES ('9', 'jobTaskType', '任务类型', 'sys', '1-client(msg-key),2-http请求,3-本地Class实现', '2018-01-08 16:09:02', '2018-01-08 16:14:19');
INSERT INTO `dict_category` VALUES ('10', 'jobStatus', '任务状态', 'sys', '1-新建，2-启用，3-停用', '2018-01-08 16:14:13', '2018-01-08 16:14:13');
INSERT INTO `dict_category` VALUES ('11', 'jobExecuteStatus', '执行状态', 'sys', '1-初始化，2-触发任务等待执行，3-执行中，4-过期失效，5-成功，6-失败', '2018-01-08 18:05:43', '2018-01-08 18:05:43');
INSERT INTO `dict_category` VALUES ('12', 'accountStatus', '账户状态', 'sys', '1-启用 2-绑定失效（被认证的其他账户绑定，数据已被迁移到其他账号上） 3-登录锁定', '2018-01-08 18:20:04', '2018-01-08 18:20:04');
INSERT INTO `dict_category` VALUES ('13', 'accountType', '账户类型', 'sys', '1-健身者，2-私教，3-店铺管理员', '2018-01-08 18:23:50', '2018-01-08 18:23:50');

-- ----------------------------
-- Table structure for element_medal
-- ----------------------------
DROP TABLE IF EXISTS `element_medal`;
CREATE TABLE `element_medal` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '按元素周期表排名',
  `name` char(1) NOT NULL COMMENT '元素名称',
  `chemical` char(2) NOT NULL COMMENT '化学式',
  `quality` smallint(6) NOT NULL COMMENT '原子量',
  `active_level` tinyint(4) NOT NULL COMMENT '活跃等级：1-活跃元素、2-半活跃元素，3-稳定元素、4-惰性元素',
  `score` smallint(6) NOT NULL DEFAULT '0' COMMENT '该元素值多少积分',
  `need_score` int(11) DEFAULT '0' COMMENT '当会员分数大于该值时，可点亮该元素勋章',
  `des` varchar(100) DEFAULT NULL COMMENT '元素介绍',
  `award` int(11) DEFAULT NULL COMMENT '元素奖励，进行一次公益活动或者个人奖励',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of element_medal
-- ----------------------------
INSERT INTO `element_medal` VALUES ('1', '氢', 'H', '1', '2', '0', '0', null, null, '2018-01-08 12:10:24');

-- ----------------------------
-- Table structure for fitness_service
-- ----------------------------
DROP TABLE IF EXISTS `fitness_service`;
CREATE TABLE `fitness_service` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(4) NOT NULL COMMENT '数据字典',
  `name` varchar(10) NOT NULL,
  `des` varchar(200) DEFAULT NULL,
  `share_site` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否支持场地共享：1-只支持场地共享，2-不支持场地共享，3-可支持、可不支持，店铺决定（但只能选择一种）',
  `_group` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否支持团体：1-支持，2-不支持',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fitness_service
-- ----------------------------
INSERT INTO `fitness_service` VALUES ('1', '1', '综合健身', null, '1', '2', '2018-01-08 11:13:15');
INSERT INTO `fitness_service` VALUES ('2', '1', '瑜伽', null, '1', '2', '2018-01-08 11:14:33');
INSERT INTO `fitness_service` VALUES ('3', '2', '台球', null, '2', '2', '2018-01-08 11:21:41');

-- ----------------------------
-- Table structure for img
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bs_id` bigint(20) unsigned NOT NULL,
  `_type` smallint(5) unsigned NOT NULL COMMENT '业务类型：\r\n1-店铺图片\r\n3-系统健身运动服务项目图片\r\n4-教练认证头像\r\n5-用户认证头像等\r\n6-店铺二维码\r\n7-教练认证证书\r\n8-体能测试结果',
  `path` varchar(100) NOT NULL COMMENT '图片路径',
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-可用，2-删除，3-过期',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bs_id` (`bs_id`,`_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='服务项目图片';

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', '1', '1', '测试', '1', '2018-01-08 15:48:47');

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `_system` smallint(20) NOT NULL COMMENT '任务所属系统:1-平台、2-账单、3-店铺、4-会员、5-教练等',
  `_status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态：1-启用，2-停用',
  `trigger_type` tinyint(3) unsigned NOT NULL COMMENT 'JOB触发类型：1-秒，2-cron表达式',
  `trigger_expression` varchar(30) NOT NULL COMMENT '触发周期表达式：秒或者cron',
  `name` varchar(30) NOT NULL,
  `task_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务类型：1-http请求，2-本地Class实现，3-client(msg-key)',
  `_task` varchar(100) NOT NULL COMMENT '任务http链接或Class类名',
  `des` varchar(100) DEFAULT NULL COMMENT '任务描述',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='job每次触发时会传入当前触发时间和上次成功触发时间两个内置参数';

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '1', '1', '2', '1', '1', '1', 'tt', null, '2018-01-08 17:31:27', '2018-01-08 17:31:27');

-- ----------------------------
-- Table structure for job_instance
-- ----------------------------
DROP TABLE IF EXISTS `job_instance`;
CREATE TABLE `job_instance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` smallint(5) unsigned NOT NULL,
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-初始化，2-触发任务等待执行，3-执行中，4-过期失效，5-成功，6-失败',
  `params` varchar(50) NOT NULL COMMENT '内置参数：包括本次执行时间，上次成功执行时间',
  `custom_params` varchar(50) DEFAULT NULL COMMENT '用户执行参数',
  `real_params` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `modify_time` (`modify_time`),
  KEY `fk_job_instance_jobs_1` (`job_id`),
  CONSTRAINT `fk_job_instance_jobs_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='job触发实例\r\n使用mq机制\r\n状态(状态管理只有使用client时启用)：\r\n1-初始化；\r\n2-触发任务等待执行（等待客户端发送开始执行状态）；\r\n3-执行中；\r\n4-过期失效（客户端定期反馈当前任务执行状况）；\r\n5-成功（客户端反馈执行结果）；\r\n6-失败（客户端反馈执行结果）；';

-- ----------------------------
-- Records of job_instance
-- ----------------------------

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消息类型：1-系统消息',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modify_time` (`modify_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('1', '1', '1', '2018-01-08 15:19:59', '测试');

-- ----------------------------
-- Table structure for vip_card_strategy
-- ----------------------------
DROP TABLE IF EXISTS `vip_card_strategy`;
CREATE TABLE `vip_card_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(3) NOT NULL COMMENT '卡片名称',
  `days` smallint(6) NOT NULL COMMENT '实际可使用天数',
  `discount_days` smallint(6) NOT NULL COMMENT '折扣天数，用来评估年卡最低购买价（折扣天数*店铺常规消费价=卡片价值）',
  `transfer_sys_discount` tinyint(4) NOT NULL COMMENT '转让系统自动折扣价百分数',
  `transfer_self_discount` tinyint(4) NOT NULL COMMENT '转让自我最大折扣百分数',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='店铺年卡销售策略';

-- ----------------------------
-- Records of vip_card_strategy
-- ----------------------------
INSERT INTO `vip_card_strategy` VALUES ('1', '月卡', '30', '20', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('2', '季卡', '90', '54', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('3', '半年卡', '180', '96', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('4', '年卡', '360', '168', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('5', '两年卡', '720', '288', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('6', '三年卡', '1080', '360', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('7', '四年卡', '1440', '408', '90', '80', '2018-01-08 12:28:24');
INSERT INTO `vip_card_strategy` VALUES ('8', '五年卡', '1800', '450', '90', '80', '2018-01-08 12:28:24');
