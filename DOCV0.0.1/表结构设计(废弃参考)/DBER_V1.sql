CREATE DATABASE  IF NOT EXISTS `dber_shop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_shop`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_shop
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coacher_focus`
--

DROP TABLE IF EXISTS `coacher_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_focus` (
  `id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `coacher_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `coacher_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `_copy_1` (`coacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_group_course_buy`
--

DROP TABLE IF EXISTS `coacher_group_course_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_group_course_buy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `strategy_id` smallint(5) unsigned NOT NULL,
  `num` smallint(6) NOT NULL,
  `send_num` tinyint(4) NOT NULL,
  `unit_price` int(11) NOT NULL COMMENT '单价',
  `price` double NOT NULL COMMENT '总价',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '购买日期',
  `used_count` smallint(6) NOT NULL DEFAULT '0' COMMENT '已使用数量',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-可用，2-已使用完',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_group_course_buy_coacher_group_course_strategy_1` (`strategy_id`),
  CONSTRAINT `fk_coacher_group_course_buy_coacher_group_course_strategy_1` FOREIGN KEY (`strategy_id`) REFERENCES `coacher_group_course_strategy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_group_course_strategy`
--

DROP TABLE IF EXISTS `coacher_group_course_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_group_course_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `num` smallint(6) NOT NULL,
  `send_num` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL,
  `element_medal_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '当前级别',
  `_status` tinyint(4) NOT NULL COMMENT '用户状态：\n1-暂停消费\n2-激活消费',
  `holiday_count` tinyint(4) NOT NULL DEFAULT '30',
  `fitness_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '健身次数',
  `score` int(11) NOT NULL COMMENT '积分：通过健身次数、消费私教课程获得'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='头像存储在plat_img,bs_id为用户id，若没找到则为未认证头像或认证过期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_holiday`
--

DROP TABLE IF EXISTS `customer_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_focus`
--

DROP TABLE IF EXISTS `shop_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_focus` (
  `id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `_copy_1` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_site_customer_booking`
--

DROP TABLE IF EXISTS `shop_site_customer_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_site_customer_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `site_booking_id` bigint(20) unsigned NOT NULL COMMENT '订场号',
  `site_id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL COMMENT '顾客订场用户id',
  `shop_service_id` int(10) unsigned NOT NULL,
  `_status` tinyint(4) NOT NULL COMMENT '1-新建（待支付，客户端缓存，可提交或直接支付）；\n2-待支付（已提交，服务端存储）；\n3-未支付过期（每天检查一次）；\n4-未支付取消；\n5-待消费（已付款）；\n6-已取消；\n7-已消费；',
  `shop_name` varchar(20) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `site_name` varchar(20) NOT NULL COMMENT '场馆名称冗余',
  `customer_name` varchar(20) NOT NULL COMMENT '顾客订场用户姓名（或昵称）',
  `customer_cellphone` varchar(20) NOT NULL COMMENT '顾客订场用户电话',
  `content` varchar(200) DEFAULT NULL COMMENT '场地预订事项描述 或 需求描述',
  `price` double(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '订场价格',
  `booking_date` date NOT NULL,
  `time_begin` smallint(6) NOT NULL,
  `time_end` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`,`booking_date`),
  KEY `_copy_1` (`shop_id`,`shop_service_id`,`booking_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='场地预订、预约、出租等详情表\n\n一个人只能预订一个店铺最长消费时长\n每人每天最多只能取消五次预约，超过五次强制取消将收取违约费';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_vip_card_customer`
--

DROP TABLE IF EXISTS `shop_vip_card_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_vip_card_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `shop_vip_card_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL COMMENT '从第一次激活开始，总共可使用的天数',
  `price` double NOT NULL,
  `_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：\n1-新购;\n2-启用（激活）;\n3-转让中（期间不可年卡消费，可取消转让，但暂停累计的天数会重新累积）;\n4-已转让;\n5-已过期;',
  `shop_name` varchar(20) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `card_name` char(3) NOT NULL,
  `active_date` date DEFAULT NULL COMMENT '第一次激活时间',
  `transfer_date` date DEFAULT NULL COMMENT '卡最近一次转让时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_vip_card_transfer`
--

DROP TABLE IF EXISTS `shop_vip_card_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_vip_card_transfer` (
  `id` bigint(20) unsigned NOT NULL COMMENT '使用shop_vip_card_customer的id，表示是其转让过来的',
  `shop_id` int(10) unsigned NOT NULL,
  `shop_vip_card_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人',
  `shop_name` varchar(20) NOT NULL,
  `card_name` char(3) NOT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `days` int(11) NOT NULL COMMENT '剩余可用天数',
  `price` double NOT NULL COMMENT '转让价格',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-转让中，2-已转让（已购买），3-启用（激活消费中）、4-已过期、5-取消转让（或直接删除）',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `_copy_1` (`customer_id`),
  CONSTRAINT `fk_shop_vip_card_transfer_shop_vip_card_customer_1` FOREIGN KEY (`id`) REFERENCES `shop_vip_card_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转让年卡';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
CREATE DATABASE  IF NOT EXISTS `dber_coacher` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_coacher`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_coacher
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coacher`
--

DROP TABLE IF EXISTS `coacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher` (
  `id` int(10) unsigned NOT NULL,
  `real_name` varchar(20) NOT NULL COMMENT '真实姓名',
  `birth_date` date NOT NULL COMMENT '出生年月',
  `cellphone` varchar(20) NOT NULL,
  `nation` varchar(5) NOT NULL DEFAULT '汉' COMMENT '民族',
  `score` int(10) unsigned DEFAULT NULL COMMENT '当前评估分数',
  `level` tinyint(3) unsigned DEFAULT NULL COMMENT '当前评估级别',
  `expect_price` int(10) unsigned NOT NULL COMMENT '期望私教课价格',
  `price` int(10) unsigned DEFAULT NULL COMMENT '实际私教课价格',
  `holiday_count` tinyint(3) unsigned NOT NULL DEFAULT '90' COMMENT '剩余年假天数',
  `_status` tinyint(4) NOT NULL COMMENT '教练状态：\n1-申请认证\n2-通过认证询问私教价格（同意变4、拒绝重新设置门店价格（不得超过询问价的150%）然后进入4）\n3-重新申请私教期望价格\n4-通过认证（没有服务启用提供）\n5-休假中\n6-黑名单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教练头像存储在plat_img,bs_id为教练id，若没找到则为未认证头像或认证过期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_bad_record`
--

DROP TABLE IF EXISTS `coacher_bad_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_bad_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `_type` tinyint(4) NOT NULL COMMENT '记录类型：\n1-健身课程没有按时制作健身计划\n2-健身课程没有制作健身计划\n3-健身课程迟到\n4-购买的健身计划没有按时完成\n5-私下约课行为',
  `content` varchar(500) DEFAULT NULL COMMENT '不良记录描述（可自动生成、可用户输入）',
  `score` smallint(6) DEFAULT NULL COMMENT '不良记录分数（越大越严重）',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_bad_record_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_bad_record_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='若有图片证据，存储在plat_img(bs_id为不良记录id)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_booking`
--

DROP TABLE IF EXISTS `coacher_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` bigint(20) unsigned NOT NULL,
  `booking_date` date NOT NULL COMMENT '预订日期',
  `time_begin` time NOT NULL COMMENT '使用起始时间，单位分钟',
  `time_end` time NOT NULL COMMENT '使用结束时间',
  `_type` tinyint(4) NOT NULL COMMENT '预约类型：\n1-团体课程预约\n2-体能测试预约\n3-私教课程预约',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺预约、顾客预约；\n预约策略系统统一设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_credential`
--

DROP TABLE IF EXISTS `coacher_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_credential` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '证书名称',
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '证书认证状态：1-申请认证，2-通过认证，3-认证失败，4-失效证书，5-虚假证书',
  `_type` tinyint(4) NOT NULL COMMENT '证书类型：1-身份证、2-学历证书、3-职业证书',
  `score` smallint(6) DEFAULT NULL COMMENT '证书通过认证后所得分数',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_credential_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_credential_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教练认证证书\n证书图片路径存放在plat_img_path（bs_id为证书id）中';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_customer`
--

DROP TABLE IF EXISTS `coacher_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `course_count` smallint(6) NOT NULL DEFAULT '0' COMMENT '私教课程数量',
  `test_count` smallint(6) NOT NULL DEFAULT '0' COMMENT '体能测试数量',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_customer_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_customer_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学员管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_evaluate`
--

DROP TABLE IF EXISTS `coacher_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_evaluate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(20) NOT NULL COMMENT '评价用户昵称(匿名显示***)',
  `stars` tinyint(4) NOT NULL DEFAULT '5' COMMENT '评价星数',
  `content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coacher_evaluate_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_evaluate_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_holiday`
--

DROP TABLE IF EXISTS `coacher_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coacher_holiday_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_holiday_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_rating`
--

DROP TABLE IF EXISTS `coacher_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_rating` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `year_month` date NOT NULL COMMENT '评价年月',
  `base_score` smallint(5) unsigned NOT NULL COMMENT '基本分数（数据主要来自于coacher表）',
  `credential_score` smallint(5) unsigned NOT NULL COMMENT '证书分数（主要来自于coacher_credential表）',
  `resume_score` smallint(6) NOT NULL COMMENT '履历分数',
  `fitness_class_count` tinyint(3) unsigned NOT NULL COMMENT '技术课程数量',
  `fitness_plan_count` tinyint(3) unsigned NOT NULL COMMENT '健身计划数量',
  `fitness_test_count` tinyint(3) unsigned NOT NULL COMMENT '体能测试数量',
  `customer_evaluate_score` tinyint(3) unsigned NOT NULL COMMENT '当月顾客评价平均分数（总分数*100/评价人数）',
  `late_count` tinyint(3) unsigned NOT NULL COMMENT '迟到数量',
  `score` int(10) unsigned NOT NULL COMMENT '最终分数',
  `level` tinyint(3) unsigned NOT NULL COMMENT '本月最终获评等级',
  `evalute_price` int(10) unsigned NOT NULL COMMENT '评估常规消费价格',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_rating_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_rating_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺评级管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_resume`
--

DROP TABLE IF EXISTS `coacher_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_resume` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `position` varchar(20) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `content` varchar(500) NOT NULL COMMENT '工作内容、绩效等',
  `company_phone` varchar(20) NOT NULL COMMENT '公司电话或店铺负责人电话',
  `score` smallint(6) DEFAULT NULL COMMENT '履历评分',
  PRIMARY KEY (`id`),
  KEY `fk_coacher_resume_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_coacher_resume_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教练履历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitness_course_plan`
--

DROP TABLE IF EXISTS `fitness_course_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitness_course_plan` (
  `id` bigint(20) unsigned NOT NULL,
  `coacher_booking_id` bigint(20) unsigned NOT NULL,
  `customer_id` bigint(20) unsigned NOT NULL COMMENT '课程id',
  `warm_up` varchar(200) DEFAULT NULL COMMENT '热身',
  `content` varchar(500) DEFAULT NULL COMMENT '课程内容（器械使用（含非器械使用）、每组个数重量、注意事项）',
  `relax` varchar(200) DEFAULT NULL COMMENT '放松休息',
  `dietary` varchar(200) DEFAULT NULL COMMENT '饮食建议',
  `_status` tinyint(4) NOT NULL COMMENT '计划状态：1-新建，2-推送用户，3-用户已读，4-客户满意，5-客户不满，6-已重做，7-完成',
  `coacher` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fitness_course_plan_coacher_booking_1` (`coacher_booking_id`),
  CONSTRAINT `fk_fitness_course_plan_coacher_booking_1` FOREIGN KEY (`coacher_booking_id`) REFERENCES `coacher_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitness_plan`
--

DROP TABLE IF EXISTS `fitness_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitness_plan` (
  `id` bigint(20) unsigned NOT NULL,
  `coacher_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL COMMENT '课程id',
  `warm_up` varchar(200) DEFAULT NULL COMMENT '热身',
  `content` varchar(500) DEFAULT NULL COMMENT '课程内容（器械使用（含非器械使用）、每组个数重量、注意事项）',
  `relax` varchar(200) DEFAULT NULL COMMENT '放松休息',
  `dietary` varchar(200) DEFAULT NULL COMMENT '饮食建议',
  `performance` varchar(500) DEFAULT NULL COMMENT '完成情况',
  `review` varchar(500) DEFAULT NULL COMMENT '教练检查、建议',
  `_status` tinyint(4) NOT NULL COMMENT '计划状态：\n1-新购\n2-制定中\n3-制定完成（推送用户）\n4-学员完成（主动或自动完成）\n5-教练回访\n6-完成',
  PRIMARY KEY (`id`),
  KEY `fk_fitness_plan_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_fitness_plan_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitness_service_item`
--

DROP TABLE IF EXISTS `fitness_service_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitness_service_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `service_id` smallint(5) unsigned NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `_status` tinyint(4) NOT NULL COMMENT '服务状态：1-新建，2-启用，3-停用',
  PRIMARY KEY (`id`),
  KEY `fk_fitness_service_item_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_fitness_service_item_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一个教练同一个服务只能有一条数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitness_test`
--

DROP TABLE IF EXISTS `fitness_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitness_test` (
  `id` bigint(20) unsigned NOT NULL,
  `coacher_booking_id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL COMMENT '课程id',
  `result` varchar(500) DEFAULT NULL COMMENT '测试结果（若有图片，plat_img(bs_id为体能测试id)）',
  `advice` varchar(500) DEFAULT NULL COMMENT '课程内容（器械使用（含非器械使用）、每组个数重量、注意事项）',
  `_status` tinyint(4) NOT NULL COMMENT '计划状态：\n1-新购\n2-进行中\n3-完成',
  `coacher` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fitness_test_coacher_booking_1` (`coacher_booking_id`),
  CONSTRAINT `fk_fitness_test_coacher_booking_1` FOREIGN KEY (`coacher_booking_id`) REFERENCES `coacher_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `focus_coacher`
--

DROP TABLE IF EXISTS `focus_coacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `focus_coacher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `focus_coacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_focus_coacher_coacher_1` (`coacher_id`),
  CONSTRAINT `fk_focus_coacher_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='此版本暂时不开发';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relation_shop`
--

DROP TABLE IF EXISTS `relation_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_shop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `coacher_name` varchar(20) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  `focus` tinyint(4) NOT NULL COMMENT '状态：1-关注，2-取消关注',
  `service` tinyint(4) NOT NULL DEFAULT '2' COMMENT '服务状态：1-服务中，2-未服务中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `_copy_1` (`coacher_id`,`shop_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `fk_shop_focus_coacher_1` FOREIGN KEY (`coacher_id`) REFERENCES `coacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
CREATE DATABASE  IF NOT EXISTS `dber_bill` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_bill`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_bill
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_found`
--

DROP TABLE IF EXISTS `account_found`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_found` (
  `id` int(10) unsigned NOT NULL,
  `bank_account_id` bigint(20) unsigned NOT NULL COMMENT '对应银行账户id',
  `name` varchar(0) NOT NULL COMMENT '资金账户名称',
  `_type` tinyint(4) NOT NULL COMMENT '账户类型：\n1、店铺资金\n2、顾客资金\n3、教练资金\n4、教练奖金\n5、促销基金\n6、活跃金\n7、平台资金',
  `in_amount` double unsigned NOT NULL COMMENT '历史流入的总资金',
  `out_amount` double unsigned NOT NULL COMMENT '历史流出的总资金',
  `amount` double NOT NULL COMMENT '当前可用资金',
  `unpaid` double unsigned NOT NULL COMMENT '当前待支付金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_account_found_bank_account_1` (`bank_account_id`),
  CONSTRAINT `fk_account_found_bank_account_1` FOREIGN KEY (`bank_account_id`) REFERENCES `bank_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='各账户资金每月结算流转一次\n结算完毕后，专用账户资金发放到店铺或教练真实银行账户\n包括：\n1、店铺资金\n2、顾客资金\n3、教练资金\n4、教练奖金\n5、促销基金\n6、活跃金\n7、平台资金';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_month_bill`
--

DROP TABLE IF EXISTS `active_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year_month` date NOT NULL COMMENT '账单年月',
  `coacher_debook` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `lazy_punish` int(11) NOT NULL COMMENT '懒惰惩罚',
  `active` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bs_id` int(10) unsigned NOT NULL,
  `_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '账户类型：1-店铺账户、2-私教账户、3-平台账户',
  `_status` tinyint(3) unsigned NOT NULL COMMENT '账户状态：\n1-新建\n2-启用\n3-默认（必须是启用状态的可设置为默认，一般第一个启用的直接置为默认，以后新启用一个直接询问是否设置为默认）\n4-停用\n5-删除',
  `bank_name` varchar(30) NOT NULL,
  `bank_address` varchar(50) DEFAULT NULL,
  `bank_card` varchar(20) NOT NULL,
  `bank_user_name` varchar(20) NOT NULL COMMENT '银行账户户名',
  `bank_user_cellphone` varchar(20) NOT NULL COMMENT '银行账户户主手机号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行账户信息验证通过后除手机号可修改外，其他信息不可修改';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_type`
--

DROP TABLE IF EXISTS `bill_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_type` (
  `id` smallint(5) unsigned NOT NULL COMMENT '四位数字编号',
  `name` varchar(20) NOT NULL,
  `ocustomer` tinyint(4) NOT NULL,
  `oshop` tinyint(4) NOT NULL,
  `ocoacher` tinyint(4) NOT NULL,
  `obonus` tinyint(4) NOT NULL,
  `opf` tinyint(4) NOT NULL,
  `oactive` tinyint(4) NOT NULL,
  `oplat` tinyint(4) NOT NULL,
  `icustomer` tinyint(4) NOT NULL,
  `ishop` tinyint(4) NOT NULL,
  `icoacher` tinyint(4) NOT NULL,
  `ibonus` tinyint(4) NOT NULL,
  `ipf` tinyint(4) NOT NULL,
  `iactive` tinyint(4) NOT NULL,
  `iplat` tinyint(4) NOT NULL,
  `des` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账单类型表\n100	门店消费	shop\n101	购买年卡	shop_card\n102	购买转让年卡	shop_card_transfer[_buy]\n103	场地消费费用	shop_site\n151	预约私教课程费	coacher\n152	未按时制作授课计划	coacher_no_ontime_plan\n153	没有制作授课计划	coacher_no_plan\n154	授课迟到	coacher_late\n155	未按时统计授课结果	coacher_no_ontime_result\n156	私教课退订	coacher_debook\n157	购买健身计划	fit_plan\n158	健身计划完成超时罚款	fit_plan_no_ontime\n159	体验课	trial_course\n160	体能测试费用	fit_test\n201	团体课程教练定金	group_coacher_booking\n202	团体课程教练尾款	group_coacher_final\n203	团体课程独立费用	group_price\n221	场地预订	shop_site_booking\n222	团体预订	group_price_booking\n223	场地退订	shop_site_debook\n224	团体退订	group_price_debook\n251	懒惰惩罚	lazy_punish\n252	暂停健身	fit_pause\n253	充值	deposit\n254	提现	withdraw\n301	店铺收入及费率	shop_income\n302	活跃奖励	active\n351	促销服务	promotion\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_bill`
--

DROP TABLE IF EXISTS `coacher_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_bill` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `coacher_id` int(10) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0' COMMENT '账单金额，单位分',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_coacher_bill_order_bill_1` (`order_id`),
  CONSTRAINT `fk_coacher_bill_order_bill_1` FOREIGN KEY (`order_id`) REFERENCES `order_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺收支明细账单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_bonus_month_bill`
--

DROP TABLE IF EXISTS `coacher_bonus_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_bonus_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `year_month` date NOT NULL COMMENT '账单年月',
  `coacher` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `shop_site_booking` int(11) NOT NULL COMMENT '预订式场地消费',
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_month_bill`
--

DROP TABLE IF EXISTS `coacher_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `coacher_id` int(10) unsigned NOT NULL,
  `year_month` date NOT NULL COMMENT '账单年月',
  `coacher` int(11) NOT NULL,
  `coacher_no_ontime_plan` int(11) NOT NULL,
  `coacher_no_plan` int(11) NOT NULL,
  `coacher_late` int(11) NOT NULL,
  `coacher_no_ontime_result` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `fit_plan` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `fit_test` int(11) NOT NULL,
  `group_coacher_booking` int(11) NOT NULL,
  `group_coacher_final` int(11) NOT NULL,
  `group_price` int(11) NOT NULL,
  `group_price_booking` int(11) NOT NULL,
  `group_price_debook` int(11) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_bill`
--

DROP TABLE IF EXISTS `customer_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_bill` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0' COMMENT '账单金额，单位分',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_customer_bill_order_bill_1` (`order_id`),
  CONSTRAINT `fk_customer_bill_order_bill_1` FOREIGN KEY (`order_id`) REFERENCES `order_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消费账单流水明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_deposit_withdraw`
--

DROP TABLE IF EXISTS `customer_deposit_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_deposit_withdraw` (
  `id` bigint(20) unsigned NOT NULL COMMENT '充值订单编号：yyyymmddhhMMss+（代码中生成一个五位数字的编号）',
  `customer_id` int(10) unsigned NOT NULL,
  `amount` double NOT NULL COMMENT '充值、退费金额（皆为用户实际支付或实际接收的金额）',
  `_type` tinyint(3) unsigned NOT NULL COMMENT '充值类型：1-充值，2-提现（退费）',
  `_status` tinyint(4) NOT NULL COMMENT '本平台充值状态：1-发起充值申请，2-充值中，3-充值失败，4-充值成功，5-充值撤销',
  `third_status` varchar(50) DEFAULT NULL COMMENT '其他平台返回的充值结果',
  `third_plat` varchar(255) DEFAULT NULL COMMENT '充值平台：1-支付宝，2-微信',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值提现账单表，用来记录用户实际充值提现的金额流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_month_bill`
--

DROP TABLE IF EXISTS `customer_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `year_month` date NOT NULL COMMENT '账单年月',
  `shop` int(11) NOT NULL,
  `shop_card` int(11) NOT NULL,
  `shop_card_transfer` int(11) NOT NULL COMMENT '转让年卡收入',
  `shop_card_transfer_buy` int(11) NOT NULL COMMENT '购买转让年卡支出',
  `shop_site` int(11) NOT NULL COMMENT '场地消费',
  `coacher` int(11) NOT NULL,
  `coacher_no_ontime_plan` int(11) NOT NULL,
  `coacher_no_plan` int(11) NOT NULL,
  `coacher_late` int(11) NOT NULL,
  `coacher_no_ontime_result` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `fit_plan` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `fit_test` int(11) NOT NULL,
  `group_price` int(11) NOT NULL,
  `shop_site_booking` int(11) NOT NULL COMMENT '预订式场地消费',
  `group_price_booking` int(11) NOT NULL,
  `shop_site_debook` int(11) NOT NULL COMMENT '退订场地费用',
  `group_price_debook` int(11) NOT NULL,
  `lazy_punish` int(11) NOT NULL COMMENT '懒惰惩罚',
  `fit_pause` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `withdraw` int(11) NOT NULL,
  `_active` int(11) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_wallet`
--

DROP TABLE IF EXISTS `customer_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_wallet` (
  `id` int(10) unsigned NOT NULL COMMENT '用户账户id',
  `customer_id` int(10) unsigned NOT NULL,
  `deposit_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '总充值金额',
  `withdraw_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '总提现金额',
  `gift_amount` double NOT NULL COMMENT '历史赠送总金额（如充值满赠、充值折扣），一般可与其他优惠活动叠加使用',
  `amount` double NOT NULL COMMENT '总可用金额（充值金额+赠送金额）',
  `consume_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '总消费金额（含退出手续费）',
  `remaining_amount` double NOT NULL COMMENT '当前剩余余额',
  `locked_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '被锁定的金额（一般在发生预约时发生）',
  `available_amount` double unsigned NOT NULL DEFAULT '0' COMMENT '当前剩余可用金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='可消费金额=income_amount-outpour_amount-real_consume_amount-locked_amount\n可退金额=inpour_amount-outpour_amount-real_consume_amount-locked_amount\n赠送金额=income_amount-inpour_amount(一般是充值满赠金额和充值折扣)\n充值满赠和折扣实现比较复杂，后期实现\n\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_bill`
--

DROP TABLE IF EXISTS `order_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_bill` (
  `id` bigint(20) unsigned NOT NULL COMMENT '订单编号：getTime()*1000000+(int++*1000)+bills_id',
  `_type` smallint(5) unsigned NOT NULL,
  `ocustomer` double NOT NULL,
  `oshop` double NOT NULL,
  `ocoacher` double NOT NULL,
  `obonus` double NOT NULL,
  `opf` double NOT NULL,
  `oactive` double NOT NULL,
  `oplat` double NOT NULL,
  `icustomer` double NOT NULL,
  `ishop` double NOT NULL,
  `icoacher` double NOT NULL,
  `ibonus` double NOT NULL,
  `ipf` double NOT NULL,
  `iactive` double NOT NULL,
  `iplat` double NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_bills Copy 1_bills_1` (`_type`),
  CONSTRAINT `fk_bills Copy 1_bills_1` FOREIGN KEY (`_type`) REFERENCES `bill_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表：记录各业务发生时，资金实际流向的表；\n1、业务实际发生，资金流转实际发生时将产生一笔订单；\n2、order_bill中存储各业务收支分项的汇总资金数据；\n3、实际店铺、教练、顾客业务主体的详细收支记录存储在各分项表中（shop_bill、coacher_bill、customer_bill）；';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plat_month_bill`
--

DROP TABLE IF EXISTS `plat_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plat_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year_month` date NOT NULL COMMENT '账单年月',
  `shop_card` int(11) NOT NULL,
  `shop_card_transfer` int(11) NOT NULL COMMENT '转让年卡收入',
  `coacher` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `fit_plan` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `group_price` int(11) NOT NULL,
  `shop_site_booking` int(11) NOT NULL COMMENT '预订式场地消费',
  `group_price_booking` int(11) NOT NULL,
  `shop_site_debook` int(11) NOT NULL COMMENT '退订场地费用',
  `group_price_debook` int(11) NOT NULL,
  `lazy_punish` int(11) NOT NULL COMMENT '懒惰惩罚',
  `fit_pause` int(11) NOT NULL,
  `_active` bigint(20) NOT NULL,
  `withdraw` int(11) NOT NULL,
  `shop_income` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_customer`
--

DROP TABLE IF EXISTS `promotion_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `promotion_id` int(10) unsigned NOT NULL,
  `promotion_name` varchar(50) NOT NULL COMMENT '促销名称',
  `invalid_date` date NOT NULL COMMENT '失效日期',
  `get_date` date NOT NULL COMMENT '获得日期',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-可用，2-已过期、3-已使用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`,`invalid_date`),
  KEY `fk_promotion_customer_promotion_strategy_1` (`promotion_id`),
  CONSTRAINT `fk_promotion_customer_promotion_strategy_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotion_strategy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_month_bill`
--

DROP TABLE IF EXISTS `promotion_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year_month` date NOT NULL COMMENT '账单年月',
  `shop_card_transfer` int(11) NOT NULL COMMENT '转让年卡收入',
  `coacher` int(11) NOT NULL,
  `coacher_no_ontime_result` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `fit_plan_no_ontime` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `fit_test` int(11) NOT NULL,
  `group_price` int(11) NOT NULL,
  `shop_site_booking` int(11) NOT NULL COMMENT '预订式场地消费',
  `group_price_booking` int(11) NOT NULL,
  `shop_site_debook` int(11) NOT NULL COMMENT '退订场地费用',
  `group_price_debook` int(11) NOT NULL,
  `_active` bigint(20) NOT NULL,
  `shop_income` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_share_bill`
--

DROP TABLE IF EXISTS `promotion_share_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_share_bill` (
  `id` bigint(20) unsigned NOT NULL COMMENT '使用promotion_customer的id',
  `promotion_amount` double NOT NULL COMMENT '优惠或促销价值金额',
  `price` double NOT NULL COMMENT '消费总价',
  `customer_price` double NOT NULL COMMENT '顾客差价补充金额',
  `shop_share_price` double NOT NULL COMMENT '店铺分担金额',
  `coacher_share_price` double NOT NULL COMMENT '私教分担金额',
  `coacher_bonus_share_price` double NOT NULL COMMENT '私教奖金基金分担金额',
  `promotion_share_price` double NOT NULL COMMENT '促销基金分担金额',
  `active_share_price` double unsigned NOT NULL,
  `plat_share_price` double NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_promotion_share_bill_promotion_customer_1` FOREIGN KEY (`id`) REFERENCES `promotion_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promotion_strategy`
--

DROP TABLE IF EXISTS `promotion_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_strategy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `rule_get` varchar(400) NOT NULL COMMENT '优惠使用规则描述',
  `rule_use` varchar(400) NOT NULL,
  `shop_share` tinyint(4) NOT NULL COMMENT '店铺分担百分比例',
  `coacher_share` tinyint(4) NOT NULL COMMENT '教练分担百分比例',
  `coacher_bonus_share` tinyint(4) NOT NULL COMMENT '私教奖金池分担比例',
  `promotion_share` tinyint(4) NOT NULL COMMENT '促销基金池分担比例',
  `invalid_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '失效类型：1-领取后多少天失效，2-指定失效日期',
  `invalid_count_days` smallint(6) NOT NULL DEFAULT '1' COMMENT 'invalid_type为1时表示领取后经过多少天，为2表示活动开始经过多少天失效',
  `superposition` tinyint(4) NOT NULL DEFAULT '2' COMMENT '可否叠加使用：1-可，2-否',
  `booth_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '活动界面展位：1-不需要',
  `msg` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否消息推送：1-是，2-否',
  `promotion_start_time` datetime NOT NULL COMMENT '活动开始时间',
  `promotion_end_time` datetime NOT NULL COMMENT '活动结束时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `promotion_end_time` (`promotion_end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='优惠规则、使用等暂时每个策略一个接口实现，将来需要形成统一的模板策略服务\n充值优惠（一般与其他优惠可叠加）：满赠、折扣\n分全局优惠、指定用户优惠、店铺促销优惠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_bill`
--

DROP TABLE IF EXISTS `shop_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_bill` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `shop_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0' COMMENT '账单金额，单位分',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_shop_bill_order_bill_1` (`order_id`),
  CONSTRAINT `fk_shop_bill_order_bill_1` FOREIGN KEY (`order_id`) REFERENCES `order_bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺收支明细账单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_month_bill`
--

DROP TABLE IF EXISTS `shop_month_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_month_bill` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `year_month` date NOT NULL COMMENT '账单年月',
  `shop` int(11) NOT NULL,
  `shop_card` int(11) NOT NULL,
  `shop_card_transfer` int(11) NOT NULL COMMENT '转让年卡收入',
  `shop_site` int(11) NOT NULL COMMENT '场地消费',
  `coacher` int(11) NOT NULL,
  `coacher_debook` int(11) NOT NULL,
  `trial_course` int(11) NOT NULL,
  `fit_test` int(11) NOT NULL,
  `group_coacher_booking` int(11) NOT NULL,
  `group_coacher_final` int(11) NOT NULL,
  `group_price` int(11) NOT NULL,
  `shop_site_booking` int(11) NOT NULL COMMENT '预订式场地消费',
  `group_price_booking` int(11) NOT NULL,
  `shop_site_debook` int(11) NOT NULL COMMENT '退订场地费用',
  `group_price_debook` int(11) NOT NULL,
  `_active` bigint(20) NOT NULL,
  `promotion` bigint(20) NOT NULL,
  `shop_income` bigint(20) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
CREATE DATABASE  IF NOT EXISTS `dber_upload` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_upload`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_upload
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dfile`
--

DROP TABLE IF EXISTS `dfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dfile` (
  `id` varchar(255) NOT NULL COMMENT '也作为云平台文件存储名称',
  `bs_id` varchar(255) NOT NULL,
  `_type` smallint(5) unsigned NOT NULL COMMENT '业务类型：\n1-店铺图片\n3-系统健身运动服务项目图片\n4-教练认证头像\n5-用户认证头像等\n6-店铺二维码\n7-教练认证证书\n8-体能测试结果\n9-身份认证图片',
  `sfname` varchar(100) NOT NULL COMMENT '原始文件名称',
  `_status` varchar(255) NOT NULL DEFAULT '1' COMMENT '状态：1-可用，2-删除，3-过期',
  PRIMARY KEY (`id`),
  KEY `bs_id` (`bs_id`,`_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务项目图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dfile_error`
--

DROP TABLE IF EXISTS `dfile_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dfile_error` (
  `id` varchar(255) NOT NULL COMMENT '也作为云平台存储文件名称',
  `bs_id` varchar(255) DEFAULT NULL,
  `_type` smallint(5) unsigned DEFAULT NULL COMMENT '业务类型：\n1-店铺图片\n3-系统健身运动服务项目图片\n4-教练认证头像\n5-用户认证头像等\n6-店铺二维码\n7-教练认证证书\n8-体能测试结果\n9-身份认证图片',
  `sfname` varchar(100) NOT NULL COMMENT '原始文件名称',
  `_status` varchar(255) NOT NULL DEFAULT '1' COMMENT '状态：\n1-有效（对于attack类型，需要拦截）\n2-失效（对于attack类型，不再拦截或者问题已解决）\n3-删除（文件已从云端删除）',
  `_error_type` varchar(255) NOT NULL COMMENT '1-没有回传token\n2-超时或者token超容量后丢失token缓存\n3-业务验证失败（滥用或攻击行为）',
  PRIMARY KEY (`id`),
  KEY `bs_id` (`bs_id`,`_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='异常文件信息';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
CREATE DATABASE  IF NOT EXISTS `dber_customer` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_customer`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_customer
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coacher_focus`
--

DROP TABLE IF EXISTS `coacher_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_focus` (
  `id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `coacher_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `coacher_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `_copy_1` (`coacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_group_course_buy`
--

DROP TABLE IF EXISTS `coacher_group_course_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_group_course_buy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `strategy_id` smallint(5) unsigned NOT NULL,
  `num` smallint(6) NOT NULL,
  `send_num` tinyint(4) NOT NULL,
  `unit_price` int(11) NOT NULL COMMENT '单价',
  `price` double NOT NULL COMMENT '总价',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '购买日期',
  `used_count` smallint(6) NOT NULL DEFAULT '0' COMMENT '已使用数量',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-可用，2-已使用完',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coacher_group_course_strategy`
--

DROP TABLE IF EXISTS `coacher_group_course_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coacher_group_course_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `num` smallint(6) NOT NULL,
  `send_num` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned NOT NULL,
  `element_medal_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '当前级别',
  `_status` tinyint(4) NOT NULL COMMENT '用户状态：\n1-暂停消费\n2-激活消费',
  `holiday_count` tinyint(4) NOT NULL DEFAULT '30',
  `fitness_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '健身次数',
  `score` int(11) NOT NULL COMMENT '积分：通过健身次数、消费私教课程获得'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='头像存储在plat_img,bs_id为用户id，若没找到则为未认证头像或认证过期';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_holiday`
--

DROP TABLE IF EXISTS `customer_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_focus`
--

DROP TABLE IF EXISTS `shop_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_focus` (
  `id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `shop_id` int(10) unsigned NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `shop_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `_copy_1` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_site_customer_booking`
--

DROP TABLE IF EXISTS `shop_site_customer_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_site_customer_booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `site_booking_id` bigint(20) unsigned NOT NULL COMMENT '订场号',
  `site_id` bigint(20) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL COMMENT '顾客订场用户id',
  `shop_service_id` int(10) unsigned NOT NULL,
  `_status` tinyint(4) NOT NULL COMMENT '1-新建（待支付，客户端缓存，可提交或直接支付）；\n2-待支付（已提交，服务端存储）；\n3-未支付过期（每天检查一次）；\n4-未支付取消；\n5-待消费（已付款）；\n6-已取消；\n7-已消费；',
  `shop_name` varchar(20) NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `site_name` varchar(20) NOT NULL COMMENT '场馆名称冗余',
  `customer_name` varchar(20) NOT NULL COMMENT '顾客订场用户姓名（或昵称）',
  `customer_cellphone` varchar(20) NOT NULL COMMENT '顾客订场用户电话',
  `content` varchar(200) DEFAULT NULL COMMENT '场地预订事项描述 或 需求描述',
  `price` double(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '订场价格',
  `booking_date` date NOT NULL,
  `time_begin` smallint(6) NOT NULL,
  `time_end` smallint(6) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`,`booking_date`),
  KEY `_copy_1` (`shop_id`,`shop_service_id`,`booking_date`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='场地预订、预约、出租等详情表\n\n一个人只能预订一个店铺最长消费时长\n每人每天最多只能取消五次预约，超过五次强制取消将收取违约费';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_vip_card_customer`
--

DROP TABLE IF EXISTS `shop_vip_card_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_vip_card_customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `shop_vip_card_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `days` int(11) NOT NULL COMMENT '从第一次激活开始，总共可使用的天数',
  `price` double NOT NULL,
  `_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态：\n1-新购;\n2-启用（激活）;\n3-转让中（期间不可年卡消费，可取消转让，但暂停累计的天数会重新累积）;\n4-已转让;\n5-已过期;',
  `shop_name` varchar(20) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `card_name` char(3) NOT NULL,
  `active_date` date DEFAULT NULL COMMENT '第一次激活时间',
  `transfer_date` date DEFAULT NULL COMMENT '卡最近一次转让时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_vip_card_transfer`
--

DROP TABLE IF EXISTS `shop_vip_card_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_vip_card_transfer` (
  `id` bigint(20) unsigned NOT NULL COMMENT '使用shop_vip_card_customer的id，表示是其转让过来的',
  `shop_id` int(10) unsigned NOT NULL,
  `shop_vip_card_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买人',
  `shop_name` varchar(20) NOT NULL,
  `card_name` char(3) NOT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `days` int(11) NOT NULL COMMENT '剩余可用天数',
  `price` double NOT NULL COMMENT '转让价格',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-转让中，2-已转让（已购买），3-启用（激活消费中）、4-已过期、5-取消转让（或直接删除）',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`),
  KEY `_copy_1` (`customer_id`),
  CONSTRAINT `fk_shop_vip_card_transfer_shop_vip_card_customer_1` FOREIGN KEY (`id`) REFERENCES `shop_vip_card_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转让年卡';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
CREATE DATABASE  IF NOT EXISTS `dber_plat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dber_plat`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_plat
-- ------------------------------------------------------
-- Server version	5.7.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '本平台昵称',
  `cellphone` varchar(15) DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '手机登录密码',
  `email` varchar(100) DEFAULT NULL,
  `bind_id` int(11) DEFAULT NULL COMMENT '本账户被绑定的账户id，被绑定后，本账户数据将迁移到被绑定账户上，并且失效本账户',
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '账户状态：\n常规状态：\n1-启用\n2-绑定失效（被认证的其他账户绑定，数据已被迁移到其他账号上）\n3-登录锁定',
  `pw_expired` tinyint(4) NOT NULL DEFAULT '2' COMMENT '密码是否过期：1-是，2-否',
  `_system` tinyint(3) unsigned NOT NULL COMMENT '所属平台：与字典保持一致',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户账户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_third_open`
--

DROP TABLE IF EXISTS `account_third_open`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_third_open` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '三方平台昵称',
  `open_id` varchar(50) NOT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `coacher_id` int(10) unsigned DEFAULT NULL,
  `_type` tinyint(3) unsigned NOT NULL COMMENT '账号平台类型：1-微信，2-QQ，3-支付宝，4-新浪微薄',
  `shop_manage_id` int(10) unsigned NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `open_id` (`open_id`),
  KEY `fk_account_third_open_account_customer_1` (`customer_id`),
  KEY `fk_account_third_open_account_customer_2` (`coacher_id`),
  KEY `fk_account_third_open_account_3` (`shop_manage_id`),
  CONSTRAINT `fk_account_third_open_account_1` FOREIGN KEY (`customer_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_account_third_open_account_2` FOREIGN KEY (`coacher_id`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_account_third_open_account_3` FOREIGN KEY (`shop_manage_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking_strategy`
--

DROP TABLE IF EXISTS `booking_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '1-为店铺团体课程订场策略，2-顾客预约或订场策略',
  `name` varchar(50) NOT NULL COMMENT '策略名称',
  `begin_time` smallint(6) NOT NULL DEFAULT '570' COMMENT '当天可预约起始时间，单位分钟',
  `end_time` smallint(6) NOT NULL DEFAULT '1350' COMMENT '当天可预约结束时间，单位分钟',
  `book_before_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被预约时间段前置强制占用时间',
  `book_after_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被预约时间段后置强制占用时间',
  `book_shortest_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '最短预约时长',
  `book_longest_time` int(10) unsigned NOT NULL DEFAULT '60' COMMENT '最长预约时长',
  `book_current_start_offset` int(10) unsigned NOT NULL DEFAULT '55' COMMENT '预订起始时间隔当前时间至少为多长，单位分钟',
  `content` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='标的预约时间策略表\n所有时间没有说明时皆以分钟为单位\n所有预约时间区间为前闭后开';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict`
--

DROP TABLE IF EXISTS `dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(20) unsigned NOT NULL,
  `enum_name` varchar(30) NOT NULL COMMENT '代码中的枚举名称',
  `value` smallint(5) unsigned NOT NULL,
  `label` varchar(20) NOT NULL,
  `content` varchar(100) DEFAULT NULL COMMENT '字典项描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `fk_dict_dict_category_2` FOREIGN KEY (`category_id`) REFERENCES `dict_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dict_category`
--

DROP TABLE IF EXISTS `dict_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dict_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `_code` varchar(30) NOT NULL COMMENT '代码',
  `category` varchar(20) NOT NULL COMMENT '字典类型名称',
  `sys` varchar(30) NOT NULL COMMENT '系统名称',
  `content` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='字典数据在对应业务系统里面一般以枚举表示\n相关业务方可以利用字典表数据查询了解相关系统字典信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `element_medal`
--

DROP TABLE IF EXISTS `element_medal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_medal` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '按元素周期表排名',
  `name` char(1) NOT NULL COMMENT '元素名称',
  `chemical` char(2) NOT NULL COMMENT '化学式',
  `quality` smallint(6) NOT NULL COMMENT '原子量',
  `active_level` tinyint(4) NOT NULL COMMENT '活跃等级：1-活跃元素、2-半活跃元素，3-稳定元素、4-惰性元素',
  `score` smallint(6) NOT NULL COMMENT '该元素值多少积分',
  `need_score` int(11) DEFAULT '0' COMMENT '当会员分数大于该值时，可点亮该元素勋章',
  `des` varchar(100) DEFAULT NULL COMMENT '元素介绍',
  `award` int(11) DEFAULT NULL COMMENT '元素奖励，进行一次公益活动或者个人奖励',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元素积分价值（score）=原子量*活跃等级*10\n点亮积分（need_score）=在元素周期表中，本元素及其之前的元素的积分价值之和\n点亮规则：用户积分大于点亮积分则点亮\n获得某些元素将获得奖励（公益或个人）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fitness_service`
--

DROP TABLE IF EXISTS `fitness_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fitness_service` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `category` tinyint(4) NOT NULL COMMENT '数据字典',
  `name` varchar(10) NOT NULL,
  `des` varchar(200) DEFAULT NULL,
  `share_site` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否支持场地共享：1-只支持场地共享，2-不支持场地共享，3-可支持、可不支持，店铺决定（但只能选择一种）',
  `_group` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否支持团体：1-支持，2-不支持',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `_system` smallint(20) NOT NULL COMMENT '任务所属系统:1-平台、2-账单、3-店铺、4-会员、5-教练等',
  `name` varchar(30) NOT NULL,
  `trigger_type` tinyint(3) unsigned NOT NULL COMMENT 'JOB触发类型：1-秒，2-cron表达式',
  `trigger_expression` varchar(30) NOT NULL COMMENT '触发周期表达式：秒或者cron',
  `task_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-client(msg-key),2-http请求,3-本地Class实现',
  `_task` varchar(100) NOT NULL COMMENT '任务http链接或Class类名',
  `_status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态：1-新建，2-启用，3-停用',
  `des` varchar(100) DEFAULT NULL COMMENT '任务描述',
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='job每次触发时会传入当前触发时间和上次成功触发时间两个内置参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_instance`
--

DROP TABLE IF EXISTS `job_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_instance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` smallint(5) unsigned NOT NULL,
  `params` varchar(50) NOT NULL COMMENT '内置参数：包括本次执行时间，上次成功执行时间',
  `custom_params` varchar(50) DEFAULT NULL COMMENT '用户执行参数',
  `real_params` varchar(100) DEFAULT NULL COMMENT '真实执行参数',
  `_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1-初始化，2-触发任务等待执行，3-执行中，4-过期失效，5-成功，6-失败',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `modify_time` (`modify_time`),
  KEY `fk_job_instance_jobs_1` (`job_id`),
  CONSTRAINT `fk_job_instance_jobs_1` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='job触发实例\n使用mq机制\n状态(状态管理只有使用client时启用)：\n1-初始化；\n2-触发任务等待执行（等待客户端发送开始执行状态）；\n3-执行中；\n4-过期失效（客户端定期反馈当前任务执行状况）；\n5-成功（客户端反馈执行结果）；\n6-失败（客户端反馈执行结果）；';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(100) NOT NULL,
  `bs_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消息业务类型：1-系统消息',
  `bs_id` bigint(20) NOT NULL COMMENT '接收方业务id，为0表示广播',
  `_status` tinyint(4) NOT NULL COMMENT '状态：1-新消息；2-已读；3-已过期；4-已删除',
  `dead_line` date NOT NULL COMMENT '消息失效日期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `modify_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vip_card_strategy`
--

DROP TABLE IF EXISTS `vip_card_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip_card_strategy` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(3) NOT NULL COMMENT '卡片名称',
  `days` smallint(6) NOT NULL COMMENT '实际可使用天数',
  `discount_days` smallint(6) NOT NULL COMMENT '折扣天数，用来评估年卡最低购买价（折扣天数*店铺常规消费价=卡片价值）',
  `transfer_sys_discount` tinyint(4) NOT NULL DEFAULT '90' COMMENT '转让系统自动折扣价百分数',
  `transfer_self_discount` tinyint(4) NOT NULL DEFAULT '80' COMMENT '转让自我最大折扣百分数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺年卡销售策略';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-01 10:32:17
