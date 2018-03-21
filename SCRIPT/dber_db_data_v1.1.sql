-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dber_history
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (4,'TESTd','四川省成都市武侯区石羊场街道南站公园','123','张三','111',570,1350,NULL,1,NULL,1,NULL,'1',42,NULL,NULL,NULL,15,11,14.5,NULL,'2018-01-17 16:19:39','2018-01-17 08:19:39'),(10,'aaa','四川省成都市双流区翡翠国际公园(装修中)翡翠半岛国际社区','123','sadf','123',570,1350,NULL,NULL,NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,20,22,22,NULL,'2018-01-27 20:48:57','2018-01-27 12:48:57'),(15,NULL,NULL,NULL,NULL,NULL,570,1350,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-01-27 22:21:45','2018-01-27 14:21:45'),(16,'我的店铺','四川省成都市双流区花园社区花园社区(正通路)','111','2222','111111',570,1350,NULL,NULL,1,1,1,NULL,42,NULL,NULL,NULL,15,22,22,NULL,'2018-03-19 18:19:12','2018-03-19 10:19:12');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_customer_view_count`
--

LOCK TABLES `shop_customer_view_count` WRITE;
/*!40000 ALTER TABLE `shop_customer_view_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_customer_view_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_evaluate`
--

LOCK TABLES `shop_evaluate` WRITE;
/*!40000 ALTER TABLE `shop_evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_group`
--

LOCK TABLES `shop_group` WRITE;
/*!40000 ALTER TABLE `shop_group` DISABLE KEYS */;
INSERT INTO `shop_group` VALUES (3,7,4,11,1,2,1,0,'TESTd','瑜伽','动感单车',NULL,NULL,NULL,'2018-01-23',720,880,'2018-01-23 19:46:24','2018-01-23 11:46:24'),(4,8,4,11,1,2,1,0,'TESTd','瑜伽','动感单车','教练A',NULL,NULL,'2018-01-23',900,1040,'2018-01-23 19:50:37','2018-01-23 11:50:37'),(5,9,4,11,1,2,1,0,'TESTd','瑜伽','动感单车',NULL,NULL,NULL,'2018-01-23',1250,1300,'2018-01-23 20:09:17','2018-01-23 12:09:17'),(6,10,4,11,1,2,1,0,'TESTd','瑜伽','动感单车',NULL,NULL,NULL,'2018-01-23',1120,1200,'2018-01-23 20:31:39','2018-01-23 12:31:39'),(7,11,4,11,1,4,2,0,'TESTd','舞蹈','动感单车',NULL,NULL,NULL,'2018-01-23',580,640,'2018-01-23 20:43:07','2018-01-23 12:43:07'),(8,12,4,12,1,2,2,0,'TESTd','瑜伽','天外飞仙',NULL,NULL,NULL,'2018-01-23',950,1040,'2018-01-23 20:43:18','2018-01-23 12:43:18'),(9,13,4,11,1,2,1,0,'TESTd','瑜伽','动感单车',NULL,NULL,NULL,'2018-03-07',840,900,'2018-03-07 13:58:23','2018-03-07 05:58:23');
/*!40000 ALTER TABLE `shop_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_group_customer_booking`
--

LOCK TABLES `shop_group_customer_booking` WRITE;
/*!40000 ALTER TABLE `shop_group_customer_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_group_customer_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_position`
--

LOCK TABLES `shop_position` WRITE;
/*!40000 ALTER TABLE `shop_position` DISABLE KEYS */;
INSERT INTO `shop_position` VALUES (4,'TESTd',30605382,104056427),(10,'aaa',30537549,104082147),(16,'我的店铺',30566440,103892467);
/*!40000 ALTER TABLE `shop_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_rating`
--

LOCK TABLES `shop_rating` WRITE;
/*!40000 ALTER TABLE `shop_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_service`
--

LOCK TABLES `shop_service` WRITE;
/*!40000 ALTER TABLE `shop_service` DISABLE KEYS */;
INSERT INTO `shop_service` VALUES (1,4,1,NULL,'综合健身',3,2,0,1,1,2,0,'2018-01-20 13:41:21','2018-01-20 05:41:21'),(2,4,2,NULL,'瑜伽',2,1,0,2,1,2,1.2,'2018-01-20 13:42:36','2018-01-20 05:42:36'),(3,4,3,NULL,'台球',1,2,0,2,1,2,2,'2018-01-20 13:42:48','2018-01-20 05:42:48'),(4,4,4,NULL,'舞蹈',0,1,0.0001,1,1,1,1,'2018-01-23 20:42:49','2018-01-23 12:42:49'),(8,10,1,NULL,'综合健身',0,2,0.0001,1,1,2,1,'2018-01-27 20:56:43','2018-01-27 12:56:43'),(9,10,4,NULL,'舞蹈',0,1,0.0001,1,1,2,1,'2018-01-27 21:02:39','2018-01-27 13:02:39'),(10,10,2,NULL,'瑜伽',2,1,0.0001,2,1,2,1,'2018-01-27 21:03:42','2018-01-27 13:03:42'),(11,10,3,NULL,'台球',1,2,0.0001,2,1,2,1,'2018-01-27 21:53:59','2018-01-27 13:53:59'),(12,15,1,NULL,'综合健身',0,2,0.0001,1,1,1,1,'2018-01-27 22:23:04','2018-01-27 14:23:04'),(13,15,2,NULL,'瑜伽',0,1,0.0001,2,1,1,1,'2018-01-27 22:23:27','2018-01-27 14:23:27'),(14,16,1,NULL,'综合健身',0,2,0.0001,1,1,1,1,'2018-03-20 14:08:01','2018-03-20 06:08:01');
/*!40000 ALTER TABLE `shop_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_site`
--

LOCK TABLES `shop_site` WRITE;
/*!40000 ALTER TABLE `shop_site` DISABLE KEYS */;
INSERT INTO `shop_site` VALUES (1,4,2,'精灵屋',20,'2018-01-21 13:27:18','2018-01-21 05:27:18'),(6,4,3,'台球一号场地',2,'2018-01-21 21:19:30','2018-01-21 13:19:30'),(11,4,1,'动感单车',0,'2018-01-22 15:35:33','2018-01-22 07:35:33'),(12,4,1,'天外飞仙',0,'2018-01-22 15:36:10','2018-01-22 07:36:10'),(13,4,2,'瑜伽一号场地',1,'2018-01-27 00:09:57','2018-01-26 16:09:57'),(14,10,10,'瑜伽一号场地',1,'2018-01-27 21:03:48','2018-01-27 13:03:48'),(15,10,10,'瑜伽er号场地',1,'2018-01-27 21:04:04','2018-01-27 13:04:04'),(16,10,11,'台球一号场地',1,'2018-01-27 21:54:04','2018-01-27 13:54:04');
/*!40000 ALTER TABLE `shop_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_site_booking`
--

LOCK TABLES `shop_site_booking` WRITE;
/*!40000 ALTER TABLE `shop_site_booking` DISABLE KEYS */;
INSERT INTO `shop_site_booking` VALUES (7,11,'2018-01-23',720,880,1),(8,11,'2018-01-23',900,1040,1),(9,11,'2018-01-23',1250,1300,1),(10,11,'2018-01-23',1120,1200,1),(11,11,'2018-01-23',580,640,2),(12,12,'2018-01-23',950,1040,2),(13,11,'2018-03-07',840,900,1);
/*!40000 ALTER TABLE `shop_site_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_vip_card`
--

LOCK TABLES `shop_vip_card` WRITE;
/*!40000 ALTER TABLE `shop_vip_card` DISABLE KEYS */;
INSERT INTO `shop_vip_card` VALUES (1,4,1,'月卡',160,0,0,0,2,'2018-01-21 16:54:48','2018-01-21 08:54:48'),(2,4,2,'季卡',432,0,0,0,1,'2018-01-21 16:55:11','2018-01-21 08:55:11'),(3,4,3,'半年卡',768,0,0,0,1,'2018-01-21 16:56:43','2018-01-21 08:56:43'),(4,4,4,'年卡',1344,0,0,0,2,'2018-01-21 16:56:50','2018-01-21 08:56:50'),(5,4,6,'三年卡',2880,0,0,0,2,'2018-01-21 16:57:08','2018-01-21 08:57:08'),(6,4,5,'两年卡',2304,0,0,0,1,'2018-01-21 16:57:11','2018-01-21 08:57:11'),(7,4,7,'四年卡',3264,0,0,0,2,'2018-01-21 17:12:28','2018-01-21 09:12:28'),(8,4,8,'五年卡',3600,0,0,0,1,'2018-01-21 17:12:30','2018-01-21 09:12:30'),(12,10,1,'月卡',160,0,0,0,1,'2018-01-27 21:10:20','2018-01-27 13:10:20'),(13,15,1,'月卡',160,0,0,0,2,'2018-01-27 22:22:56','2018-01-27 14:22:56'),(14,15,2,'季卡',432,0,0,0,2,'2018-01-27 22:22:58','2018-01-27 14:22:58'),(15,15,3,'半年卡',768,0,0,0,2,'2018-01-27 22:23:17','2018-01-27 14:23:17'),(16,16,1,'月卡',160,0,0,0,2,'2018-03-19 18:28:04','2018-03-19 10:28:04'),(17,16,2,'季卡',432,0,0,0,2,'2018-03-19 18:28:06','2018-03-19 10:28:06'),(18,16,3,'半年卡',768,0,0,0,2,'2018-03-19 18:28:08','2018-03-19 10:28:08'),(19,16,4,'年卡',1344,0,0,0,2,'2018-03-19 18:28:29','2018-03-19 10:28:29'),(20,16,5,'两年卡',2304,0,0,0,2,'2018-03-19 18:28:32','2018-03-19 10:28:32'),(21,16,6,'三年卡',2880,0,0,0,2,'2018-03-19 18:28:34','2018-03-19 10:28:34'),(22,16,7,'四年卡',3264,0,0,0,2,'2018-03-19 18:28:35','2018-03-19 10:28:35'),(23,16,8,'五年卡',3600,0,0,0,2,'2018-03-20 14:13:51','2018-03-20 06:13:51');
/*!40000 ALTER TABLE `shop_vip_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_vip_card_service`
--

LOCK TABLES `shop_vip_card_service` WRITE;
/*!40000 ALTER TABLE `shop_vip_card_service` DISABLE KEYS */;
INSERT INTO `shop_vip_card_service` VALUES (4,4,3,1,'综合健身'),(5,4,3,3,'台球'),(6,4,4,2,'瑜伽'),(7,4,8,3,'台球'),(9,4,2,1,'综合健身'),(10,10,12,4,'舞蹈'),(11,10,12,1,'综合健身'),(12,15,13,1,'综合健身'),(15,4,1,4,'舞蹈');
/*!40000 ALTER TABLE `shop_vip_card_service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `coacher`
--

LOCK TABLES `coacher` WRITE;
/*!40000 ALTER TABLE `coacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_bad_record`
--

LOCK TABLES `coacher_bad_record` WRITE;
/*!40000 ALTER TABLE `coacher_bad_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_bad_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_booking`
--

LOCK TABLES `coacher_booking` WRITE;
/*!40000 ALTER TABLE `coacher_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_credential`
--

LOCK TABLES `coacher_credential` WRITE;
/*!40000 ALTER TABLE `coacher_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_customer`
--

LOCK TABLES `coacher_customer` WRITE;
/*!40000 ALTER TABLE `coacher_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_evaluate`
--

LOCK TABLES `coacher_evaluate` WRITE;
/*!40000 ALTER TABLE `coacher_evaluate` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_evaluate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_holiday`
--

LOCK TABLES `coacher_holiday` WRITE;
/*!40000 ALTER TABLE `coacher_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_rating`
--

LOCK TABLES `coacher_rating` WRITE;
/*!40000 ALTER TABLE `coacher_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_resume`
--

LOCK TABLES `coacher_resume` WRITE;
/*!40000 ALTER TABLE `coacher_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fitness_course_plan`
--

LOCK TABLES `fitness_course_plan` WRITE;
/*!40000 ALTER TABLE `fitness_course_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitness_course_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fitness_plan`
--

LOCK TABLES `fitness_plan` WRITE;
/*!40000 ALTER TABLE `fitness_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitness_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fitness_service_item`
--

LOCK TABLES `fitness_service_item` WRITE;
/*!40000 ALTER TABLE `fitness_service_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitness_service_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fitness_test`
--

LOCK TABLES `fitness_test` WRITE;
/*!40000 ALTER TABLE `fitness_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitness_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `focus_coacher`
--

LOCK TABLES `focus_coacher` WRITE;
/*!40000 ALTER TABLE `focus_coacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `focus_coacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `relation_shop`
--

LOCK TABLES `relation_shop` WRITE;
/*!40000 ALTER TABLE `relation_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation_shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `account_found`
--

LOCK TABLES `account_found` WRITE;
/*!40000 ALTER TABLE `account_found` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_found` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `active_month_bill`
--

LOCK TABLES `active_month_bill` WRITE;
/*!40000 ALTER TABLE `active_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bill_type`
--

LOCK TABLES `bill_type` WRITE;
/*!40000 ALTER TABLE `bill_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_bill`
--

LOCK TABLES `coacher_bill` WRITE;
/*!40000 ALTER TABLE `coacher_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_bonus_month_bill`
--

LOCK TABLES `coacher_bonus_month_bill` WRITE;
/*!40000 ALTER TABLE `coacher_bonus_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_bonus_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_month_bill`
--

LOCK TABLES `coacher_month_bill` WRITE;
/*!40000 ALTER TABLE `coacher_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_bill`
--

LOCK TABLES `customer_bill` WRITE;
/*!40000 ALTER TABLE `customer_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_deposit_withdraw`
--

LOCK TABLES `customer_deposit_withdraw` WRITE;
/*!40000 ALTER TABLE `customer_deposit_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_deposit_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_month_bill`
--

LOCK TABLES `customer_month_bill` WRITE;
/*!40000 ALTER TABLE `customer_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_wallet`
--

LOCK TABLES `customer_wallet` WRITE;
/*!40000 ALTER TABLE `customer_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order_bill`
--

LOCK TABLES `order_bill` WRITE;
/*!40000 ALTER TABLE `order_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plat_month_bill`
--

LOCK TABLES `plat_month_bill` WRITE;
/*!40000 ALTER TABLE `plat_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `plat_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `promotion_customer`
--

LOCK TABLES `promotion_customer` WRITE;
/*!40000 ALTER TABLE `promotion_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `promotion_month_bill`
--

LOCK TABLES `promotion_month_bill` WRITE;
/*!40000 ALTER TABLE `promotion_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_month_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `promotion_share_bill`
--

LOCK TABLES `promotion_share_bill` WRITE;
/*!40000 ALTER TABLE `promotion_share_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_share_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `promotion_strategy`
--

LOCK TABLES `promotion_strategy` WRITE;
/*!40000 ALTER TABLE `promotion_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_bill`
--

LOCK TABLES `shop_bill` WRITE;
/*!40000 ALTER TABLE `shop_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_month_bill`
--

LOCK TABLES `shop_month_bill` WRITE;
/*!40000 ALTER TABLE `shop_month_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_month_bill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `dfile`
--

LOCK TABLES `dfile` WRITE;
/*!40000 ALTER TABLE `dfile` DISABLE KEYS */;
INSERT INTO `dfile` VALUES ('10001','10',1,'001.jpg','2'),('10002','10',2,'apic23847_sc115.com.jpg','2'),('10003','10',2,'tooopen_sy_161967094653.jpg','2'),('10004','10',2,'2123f7686d354b4d1b67b99a7f657747.jpg','2'),('10005','10',2,'2123f7686d354b4d1b67b99a7f657747.jpg','2'),('10006','10',2,'2123f7686d354b4d1b67b99a7f657747.jpg','2'),('10007','10',2,'001.jpg','2'),('10008','10',2,'2123f7686d354b4d1b67b99a7f657747.jpg','2'),('10009','10',2,'tooopen_sy_161967094653.jpg','2'),('10010','10',2,'tooopen_sy_161967094653.jpg','2'),('10011','10',2,'apic23847_sc115.com.jpg','2'),('10012','10',2,'tooopen_sy_179583447187.jpg','2'),('10013','10',2,'tooopen_sy_179583447187.jpg','2'),('10014','10',2,'001.jpg','2'),('10017','4',2,'u=952120935,1748224673&fm=27&gp=0.jpg','2'),('10018','4',2,'u=3892581623,2279518303&fm=27&gp=0.jpg','2'),('10019','4',2,'u=614912110,1323629464&fm=27&gp=0.jpg','2'),('10021','4',2,'u=952120935,1748224673&fm=27&gp=0.jpg','2'),('10022','12',10,'u=1357968263,3722616166&fm=27&gp=0.jpg','2'),('10023','4',2,'u=952120935,1748224673&fm=27&gp=0.jpg','1'),('10024','16',2,'log_all.jpeg','1'),('10025','16',1,'log_all.jpeg','1'),('10026','10',1,'maomai-015.jpg','2'),('10027','10',2,'maomai-015.jpg','1'),('10028','10',2,'yading-004.jpg','1'),('10029','10',2,'weibo_meinv.jpg','1'),('10030','10',1,'qie-003.jpg','1');
/*!40000 ALTER TABLE `dfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dfile_error`
--

LOCK TABLES `dfile_error` WRITE;
/*!40000 ALTER TABLE `dfile_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `dfile_error` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `coacher_focus`
--

LOCK TABLES `coacher_focus` WRITE;
/*!40000 ALTER TABLE `coacher_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_group_course_buy`
--

LOCK TABLES `coacher_group_course_buy` WRITE;
/*!40000 ALTER TABLE `coacher_group_course_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_group_course_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `coacher_group_course_strategy`
--

LOCK TABLES `coacher_group_course_strategy` WRITE;
/*!40000 ALTER TABLE `coacher_group_course_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `coacher_group_course_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_holiday`
--

LOCK TABLES `customer_holiday` WRITE;
/*!40000 ALTER TABLE `customer_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_focus`
--

LOCK TABLES `shop_focus` WRITE;
/*!40000 ALTER TABLE `shop_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_site_customer_booking`
--

LOCK TABLES `shop_site_customer_booking` WRITE;
/*!40000 ALTER TABLE `shop_site_customer_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_site_customer_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_vip_card_customer`
--

LOCK TABLES `shop_vip_card_customer` WRITE;
/*!40000 ALTER TABLE `shop_vip_card_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_vip_card_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `shop_vip_card_transfer`
--

LOCK TABLES `shop_vip_card_transfer` WRITE;
/*!40000 ALTER TABLE `shop_vip_card_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_vip_card_transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
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
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'aa','11',NULL,NULL,NULL,1,2,1,'2018-01-14 15:15:55','2018-01-30 10:34:15'),(4,'admin',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-15 13:46:43','2018-01-30 10:34:16'),(5,'TEST',NULL,NULL,'3d4f2bf07dc1be38b20cd6e46949a1071f9d0e3d',NULL,1,2,3,'2018-01-15 16:56:49','2018-01-30 10:34:16'),(8,'admin1',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-18 14:17:22','2018-01-30 10:34:17'),(9,'admin',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,1,'2018-01-18 16:49:34','2018-01-30 10:34:17'),(10,'aaaa',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-27 20:36:23','2018-03-20 09:31:45'),(11,'bbb',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-27 21:54:35','2018-01-30 10:34:18'),(12,'bbbc',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-27 21:55:21','2018-01-30 10:34:19'),(13,'aaa',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,1,'2018-01-27 22:08:39','2018-01-30 10:34:19'),(14,'bbbce',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-27 22:17:03','2018-01-30 10:34:20'),(15,'bbbcee',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-01-27 22:21:30','2018-01-30 10:34:21'),(16,'admin11',NULL,NULL,'1f82c942befda29b6ed487a51da199f78fce7f05',NULL,1,2,3,'2018-03-19 18:19:12','2018-03-19 10:19:12');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_third_open`
--

LOCK TABLES `account_third_open` WRITE;
/*!40000 ALTER TABLE `account_third_open` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_third_open` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `booking_strategy`
--

LOCK TABLES `booking_strategy` WRITE;
/*!40000 ALTER TABLE `booking_strategy` DISABLE KEYS */;
INSERT INTO `booking_strategy` VALUES (1,'店铺订场',570,1350,5,5,60,300,30,NULL,'2018-01-07 20:54:08','2018-01-23 05:54:04');
/*!40000 ALTER TABLE `booking_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dict`
--

LOCK TABLES `dict` WRITE;
/*!40000 ALTER TABLE `dict` DISABLE KEYS */;
INSERT INTO `dict` VALUES (1,1,'HOT',1,'热门',NULL,'2018-01-08 11:08:27','2018-01-08 03:08:27'),(2,1,'BALL',2,'球类',NULL,'2018-01-08 11:08:38','2018-01-08 03:08:38'),(3,2,'YES',1,'是',NULL,'2018-01-08 11:09:35','2018-01-08 03:09:35'),(4,2,'NO',2,'否',NULL,'2018-01-08 11:09:46','2018-01-08 03:09:46'),(5,3,'VERY_ACTIVE',1,'极活跃',NULL,'2018-01-08 11:27:59','2018-01-08 03:27:59'),(6,3,'ACTIVE',2,'活跃',NULL,'2018-01-08 11:28:13','2018-01-08 03:28:13'),(7,3,'STABLY',3,'稳定',NULL,'2018-01-08 11:29:03','2018-01-08 03:29:03'),(8,3,'INERTIAL',4,'惰性',NULL,'2018-01-08 11:30:15','2018-01-08 03:30:15'),(9,4,'SYS',1,'系统消息',NULL,'2018-01-08 14:11:54','2018-01-08 06:11:54'),(10,5,'SHOP',1,'店铺主图（封面）','1','2018-01-08 15:26:24','2018-01-27 06:13:12'),(11,5,'SHOP_SERVICE',3,'店铺服务项目图片','20','2018-01-08 15:28:00','2018-01-27 06:13:25'),(12,5,'COACHER_IDENTIFICATION',4,'教练认证头像','1','2018-01-08 15:28:23','2018-01-27 06:13:29'),(13,5,'CUSTOMER_IDENTIFICATION',5,'用户认证头像','1','2018-01-08 15:28:44','2018-01-27 06:13:33'),(14,5,'MATRIX_CODE',6,'店铺二维码','1','2018-01-08 15:30:07','2018-01-27 06:13:37'),(15,5,'COACHER_CERTIFICATE',7,'教练认证证书','20','2018-01-08 15:31:56','2018-01-27 06:13:42'),(16,5,'FITNESS_TEST',8,'体能测试结果','50','2018-01-08 15:32:15','2018-01-27 06:13:48'),(17,6,'AVAILABLE',1,'可用',NULL,'2018-01-08 15:45:26','2018-01-08 07:46:01'),(18,6,'DELETED',2,'已删除',NULL,'2018-01-08 15:45:44','2018-01-08 07:45:44'),(19,6,'EXPIRED',3,'已过期',NULL,'2018-01-08 15:46:53','2018-01-08 07:46:53'),(20,7,'PLAT',1,'平台',NULL,'2018-01-08 15:59:08','2018-01-08 07:59:08'),(21,7,'BILL',2,'账单',NULL,'2018-01-08 15:59:16','2018-01-08 07:59:16'),(22,7,'SHOP',3,'店铺',NULL,'2018-01-08 15:59:27','2018-01-08 07:59:27'),(23,7,'CUSTOMER',4,'会员',NULL,'2018-01-08 15:59:44','2018-01-08 07:59:44'),(24,7,'COACHER',5,'教练',NULL,'2018-01-08 15:59:58','2018-01-08 07:59:58'),(25,8,'SECOND',2,'秒',NULL,'2018-01-08 16:01:51','2018-01-08 08:19:19'),(26,8,'CRON',1,'CRON',NULL,'2018-01-08 16:02:05','2018-01-08 08:19:33'),(27,9,'CLIENT',1,'client(msg-key)',NULL,'2018-01-08 16:10:59','2018-01-08 08:12:23'),(28,9,'HTTP',2,'httpUrl',NULL,'2018-01-08 16:11:34','2018-01-08 08:12:00'),(29,9,'CLASS',3,'class',NULL,'2018-01-08 16:12:49','2018-01-08 08:12:49'),(30,10,'NEW',1,'新建',NULL,'2018-01-08 16:15:07','2018-01-08 08:15:07'),(31,10,'ENABLED',2,'启用',NULL,'2018-01-08 16:15:36','2018-01-08 08:15:36'),(32,10,'DISABLED',3,'禁用',NULL,'2018-01-08 16:16:07','2018-01-08 08:16:07'),(33,11,'INIT',1,'初始化',NULL,'2018-01-08 18:06:03','2018-01-08 10:06:03'),(34,11,'WAITING_EXECUTE',2,'等待执行',NULL,'2018-01-08 18:06:25','2018-01-08 10:06:25'),(35,11,'EXECUTING',3,'执行中',NULL,'2018-01-08 18:06:37','2018-01-08 10:06:37'),(36,11,'EXPIRED',4,'过期失效',NULL,'2018-01-08 18:07:18','2018-01-08 10:07:18'),(37,11,'SUCCESS',5,'执行成功',NULL,'2018-01-08 18:07:32','2018-01-08 10:07:32'),(38,11,'FAILURE',6,'执行失败',NULL,'2018-01-08 18:07:45','2018-01-08 10:07:45'),(39,12,'ENABLED',1,'启用',NULL,'2018-01-08 18:20:25','2018-01-08 10:20:25'),(40,12,'BIND_EXPIRED',2,'绑定失效',NULL,'2018-01-08 18:20:47','2018-01-08 10:20:47'),(41,12,'LOGIN_LOCK',3,'锁定中',NULL,'2018-01-08 18:21:34','2018-01-08 10:21:34'),(45,14,'NEW',11,'新注册',NULL,'2018-01-09 10:55:32','2018-01-29 03:52:11'),(46,14,'AUDITING',21,'审核中',NULL,'2018-01-09 10:56:23','2018-01-29 03:52:42'),(47,14,'AUDIT_FAILURE',22,'拒绝申请',NULL,'2018-01-09 11:00:05','2018-01-29 03:53:21'),(48,14,'ENQUIRING',31,'询价中（待提交期望门店价）',NULL,'2018-01-09 11:00:53','2018-01-29 03:54:53'),(49,14,'EVALUATE_BASE_PRICE',32,'评估基础价格中',NULL,'2018-01-09 11:01:30','2018-01-29 03:56:04'),(50,14,'ENQUIRING_HIGHER',33,'期望价过高',NULL,'2018-01-09 11:02:00','2018-01-29 03:56:54'),(51,14,'ENQUIRING_LOWER',34,'期望价过低',NULL,'2018-01-09 11:02:11','2018-01-29 03:57:18'),(52,15,'YES',1,'是',NULL,'2018-01-20 19:27:51','2018-01-20 11:27:51'),(53,15,'NO',2,'否',NULL,'2018-01-20 19:28:01','2018-01-20 11:28:01'),(54,15,'SELECT',3,'店铺选择',NULL,'2018-01-20 19:28:20','2018-01-20 11:28:20'),(55,16,'ENABLE',1,'已发布',NULL,'2018-01-23 16:18:33','2018-01-23 12:39:49'),(56,16,'CANCEL',2,'已撤销',NULL,'2018-01-23 16:19:57','2018-01-23 12:39:56'),(57,16,'EXPIRED',3,'已过期',NULL,'2018-01-23 16:20:58','2018-01-23 08:20:58'),(58,5,'IDENTITY',9,'身份认证','10','2018-01-24 17:54:21','2018-01-27 06:14:00'),(59,17,'NOTOKEN',1,'无回传TOKEN',NULL,'2018-01-24 21:11:26','2018-01-24 13:11:26'),(60,17,'EXPIRE',2,'缓存验证TOKEN失效',NULL,'2018-01-24 21:12:25','2018-01-24 13:12:25'),(61,17,'ATTACK',3,'滥用或攻击',NULL,'2018-01-24 21:12:44','2018-01-24 13:12:44'),(62,18,'VALID',1,'有效',NULL,'2018-01-25 10:52:47','2018-01-25 02:52:47'),(63,18,'INVALID',2,'失效',NULL,'2018-01-25 10:53:01','2018-01-25 02:53:01'),(64,18,'DELETE',3,'已删除',NULL,'2018-01-25 10:53:16','2018-01-25 02:53:16'),(65,7,'UPLOAD',6,'上传','文件管理系统','2018-01-25 16:31:00','2018-01-25 08:31:12'),(66,5,'SHOP_SITE',10,'店铺场地图片','10','2018-01-27 00:15:38','2018-01-27 06:14:16'),(67,6,'COVER',4,'覆盖上传',NULL,'2018-01-27 12:33:26','2018-01-27 04:33:26'),(68,5,'SHOP_ENV',2,'店铺环境图片','100','2018-01-27 14:12:54','2018-01-27 06:14:33'),(69,14,'BUSINESSING_NO_SERVICE',41,'营业中（无服务）',NULL,'2018-01-29 11:58:23','2018-01-29 03:58:23'),(70,14,'BUSINESSING_WITH_SERVICE',42,'营业中（有服务）',NULL,'2018-01-29 11:58:55','2018-01-29 03:58:55'),(71,14,'BUSINESS_SUSPEND',51,'休业中',NULL,'2018-01-29 11:59:41','2018-01-29 03:59:41'),(72,14,'CLOSED',52,'已关店',NULL,'2018-01-29 12:00:07','2018-01-29 04:00:07');
/*!40000 ALTER TABLE `dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dict_category`
--

LOCK TABLES `dict_category` WRITE;
/*!40000 ALTER TABLE `dict_category` DISABLE KEYS */;
INSERT INTO `dict_category` VALUES (1,'fitnessType','运动类型','sys',NULL,'2018-01-08 11:08:12','2018-01-08 08:05:47'),(2,'yesNo','是否','sys',NULL,'2018-01-08 11:09:24','2018-01-08 08:05:57'),(3,'elementActive','元素活跃指数','sys',NULL,'2018-01-08 11:26:27','2018-01-08 08:06:06'),(4,'msgType','消息类型','sys',NULL,'2018-01-08 14:11:38','2018-01-08 08:06:13'),(5,'imgType','图片业务类型','sys','1-店铺图片 3-系统健身运动服务项目图片 4-教练认证头像 5-用户认证头像等 6-店铺二维码 7-教练认证证书 8-体能测试结果 9-身份认证图片','2018-01-08 15:25:51','2018-01-24 09:53:08'),(6,'imgStatus','图片状态','sys','状态：1-可用，2-删除，3-过期','2018-01-08 15:44:35','2018-01-08 08:06:26'),(7,'dberSystem','系统','sys','1-平台、2-账单、3-店铺、4-会员、5-教练等','2018-01-08 15:58:25','2018-01-11 13:42:51'),(8,'jobTriggerType','触发类型','sys','1-cron表达式，2-秒','2018-01-08 16:01:06','2018-01-08 08:19:07'),(9,'jobTaskType','任务类型','sys','1-client(msg-key),2-http请求,3-本地Class实现','2018-01-08 16:09:02','2018-01-08 08:14:19'),(10,'jobStatus','任务状态','sys','1-新建，2-启用，3-停用','2018-01-08 16:14:13','2018-01-08 08:14:13'),(11,'jobExecuteStatus','执行状态','sys','1-初始化，2-触发任务等待执行，3-执行中，4-过期失效，5-成功，6-失败','2018-01-08 18:05:43','2018-01-08 10:05:43'),(12,'accountStatus','账户状态','sys','1-启用 2-绑定失效（被认证的其他账户绑定，数据已被迁移到其他账号上） 3-登录锁定','2018-01-08 18:20:04','2018-01-08 10:20:04'),(13,'accountType','账户类型','sys','已删除（将来用作其他字典类型使用）','2018-01-08 18:23:50','2018-01-30 10:36:58'),(14,'shopStatus','店铺状态','sys','1-新注册  2-审核中 3-询价中  4-营业中','2018-01-09 10:40:22','2018-01-29 03:51:57'),(15,'fitnessShareSite','是否场地共享','sys','系统健身服务设置选项','2018-01-20 19:27:31','2018-01-20 11:27:31'),(16,'groupCourseBooking','团体课程排课状态','sys','1-已发布； 2-已撤销； 3-已过期；','2018-01-23 16:18:18','2018-01-23 12:40:06'),(17,'imgErrorType','异常图片类型','sys','1-没有回传token 2-超时或者token超容量后丢失token缓存 3-业务验证失败（滥用或攻击行为）','2018-01-24 21:11:02','2018-01-24 13:11:02'),(18,'imgErrorStatus','文件错误类型','sys','状态： 1-有效（对于attack类型，需要拦截） 2-失效（对于attack类型，不再拦截或者问题已解决） 3-删除（文件已从云端删除）','2018-01-25 10:52:32','2018-01-25 02:52:32');
/*!40000 ALTER TABLE `dict_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `element_medal`
--

LOCK TABLES `element_medal` WRITE;
/*!40000 ALTER TABLE `element_medal` DISABLE KEYS */;
INSERT INTO `element_medal` VALUES (1,'氢','H',1,2,0,0,NULL,NULL,'2018-01-08 04:10:24');
/*!40000 ALTER TABLE `element_medal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fitness_service`
--

LOCK TABLES `fitness_service` WRITE;
/*!40000 ALTER TABLE `fitness_service` DISABLE KEYS */;
INSERT INTO `fitness_service` VALUES (1,1,'综合健身',NULL,1,2,'2018-01-08 03:13:15'),(2,1,'瑜伽',NULL,3,1,'2018-01-20 05:26:05'),(3,2,'台球',NULL,2,2,'2018-01-08 03:21:41'),(4,1,'舞蹈',NULL,1,1,'2018-01-20 12:32:37');
/*!40000 ALTER TABLE `fitness_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,1,1,2,'1','1',1,'tt',NULL,'2018-01-08 09:31:27','2018-01-08 17:31:27');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `job_instance`
--

LOCK TABLES `job_instance` WRITE;
/*!40000 ALTER TABLE `job_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (1,'1',1,'2018-01-08 07:19:59','测试');
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vip_card_strategy`
--

LOCK TABLES `vip_card_strategy` WRITE;
/*!40000 ALTER TABLE `vip_card_strategy` DISABLE KEYS */;
INSERT INTO `vip_card_strategy` VALUES (1,'月卡',30,20,90,80,'2018-01-08 04:28:24'),(2,'季卡',90,54,90,80,'2018-01-08 04:28:24'),(3,'半年卡',180,96,90,80,'2018-01-08 04:28:24'),(4,'年卡',360,168,90,80,'2018-01-08 04:28:24'),(5,'两年卡',720,288,90,80,'2018-01-08 04:28:24'),(6,'三年卡',1080,360,90,80,'2018-01-08 04:28:24'),(7,'四年卡',1440,408,90,80,'2018-01-08 04:28:24'),(8,'五年卡',1800,450,90,80,'2018-01-08 04:28:24');
/*!40000 ALTER TABLE `vip_card_strategy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-21 10:37:06
