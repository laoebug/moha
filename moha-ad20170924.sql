-- MySQL dump 10.16  Distrib 10.1.25-MariaDB, for osx10.6 (i386)
--
-- Host: localhost    Database: moha
-- ------------------------------------------------------
-- Server version	10.1.25-MariaDB

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
-- Current Database: `moha`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `moha` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `moha`;

--
-- Table structure for table `accociation`
--

DROP TABLE IF EXISTS `accociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_accociation_province1_idx` (`province_id`),
  CONSTRAINT `fk_accociation_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accociation`
--

LOCK TABLES `accociation` WRITE;
/*!40000 ALTER TABLE `accociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `accociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `controller_id` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_action_controller1_idx` (`controller_id`),
  CONSTRAINT `fk_action_controller1` FOREIGN KEY (`controller_id`) REFERENCES `controller` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approver`
--

DROP TABLE IF EXISTS `approver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `ministry_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approver_level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approver_ministry1_idx` (`ministry_id`),
  KEY `fk_approver_province1_idx` (`province_id`),
  KEY `fk_approver_approver_level1_idx` (`approver_level_id`),
  CONSTRAINT `fk_approver_approver_level1` FOREIGN KEY (`approver_level_id`) REFERENCES `approver_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_approver_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_approver_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approver`
--

LOCK TABLES `approver` WRITE;
/*!40000 ALTER TABLE `approver` DISABLE KEYS */;
INSERT INTO `approver` VALUES (1,0,1,NULL,1),(2,0,NULL,1,2),(3,0,NULL,17,2),(4,0,NULL,16,2),(5,0,NULL,6,2);
/*!40000 ALTER TABLE `approver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approver_level`
--

DROP TABLE IF EXISTS `approver_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approver_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `code` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M:Ministry\nP:Province',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approver_level`
--

LOCK TABLES `approver_level` WRITE;
/*!40000 ALTER TABLE `approver_level` DISABLE KEYS */;
INSERT INTO `approver_level` VALUES (1,'ຂັ້ນກະຊວງພາຍໃນອະນຸມັດ',0,1,'M'),(2,'ຂັ້ນແຂວງອະນຸມັດ',0,2,'P');
/*!40000 ALTER TABLE `approver_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_award_user1_idx` (`user_id`),
  CONSTRAINT `fk_award_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award`
--

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;
INSERT INTO `award` VALUES (1,'ຜົນງານ 70 ປີ ວັນສ້າງຕັ້ງ',0,2,1),(2,'ພັດທະນາການສຶກສາ ແລະ ກິລາ',0,2,NULL),(3,'ຜົນງານ 35 ປີ',0,2,NULL),(4,'ຜົນງານ 60 ປີ ວັນສ້າງຕັ້ງ',0,2,NULL),(5,'ບັ້ນ 3 ສ້າງ',0,2,NULL),(6,'ບັ້ນຕ່າງໆ',0,2,NULL);
/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_user1_idx` (`user_id`),
  CONSTRAINT `fk_book_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'ປຶ້ມກ່ອນປີ 1975',0,1,'2017-09-16 18:19:24',2),(2,'ປຶ້ມພາຍຫຼັງປົດປ່ອຍຊາດ',0,2,'2017-09-16 18:19:42',2),(3,'ເອກະສານປະເພດກະແຊັດ',0,3,'2017-09-16 18:19:57',2),(4,'ວີດີໂອ',0,4,'2017-09-16 18:20:10',2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text,
  `tel` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `remark` text,
  `user_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_branch_user1_idx` (`user_id`),
  KEY `fk_branch_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_branch_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'MOF','ກະຊວງການເງິນ','','',0,0,NULL,0,NULL,0),(2,'MOC','ກະຊວງອຸດສາຫະກຳ ແລະ ການຄ້າ','','1001231',0,0,NULL,0,NULL,0),(3,'MOH','ກະຊວງສາທະລະນະສຸກ','','',0,0,NULL,0,NULL,0),(4,'MF','ກະຊວງການຕ່າງປະເທດ','','',0,0,NULL,0,NULL,0),(5,'ກພຮ','ກະຊວງພະລັງງານ ແລະ ບໍ່ແຮ່','','',0,0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controller`
--

DROP TABLE IF EXISTS `controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller`
--

LOCK TABLES `controller` WRITE;
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_code` varchar(20) NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `record_status` varchar(1) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`),
  KEY `fk_district_user` (`input_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_district_user` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,'0101','ຈັນທະບູລີ',1,NULL,NULL,'2017-09-01 09:48:59',0),(2,'0102','ສີໂຄດຕະບອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(3,'0103','ສີສັດຕະນາກ',1,NULL,NULL,'2017-09-01 09:48:59',0),(4,'0104','ໄຊເສດຖາ',1,NULL,NULL,'2017-09-01 09:48:59',0),(5,'0105','ນາຊາຍທອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(6,'0106','ໄຊທານີ',1,NULL,NULL,'2017-09-01 09:48:59',0),(7,'0107','ຫາດຊາຍຟອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(8,'0108','ສັງທອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(9,'0109','ປາກງື່ມ',1,NULL,NULL,'2017-09-01 09:48:59',0),(10,'0201','ຜົ້ງສາລີ',2,NULL,NULL,'2017-09-01 09:48:59',0),(11,'331','ໄຊເສດຖາ',17,NULL,NULL,'2017-09-01 09:48:59',0),(12,'2901','ໄກສອນພົມວິຫານ',13,NULL,NULL,'2017-09-01 09:48:59',0),(13,'2902','ອຸທຸມພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(14,'201','ປາກຊັນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(15,'2002','ສິງ',3,NULL,NULL,'2017-09-01 09:48:59',0),(16,'2503','ຫົງສາ',8,NULL,NULL,'2017-09-01 09:48:59',0),(17,'2201','ຫ້ວຍຊາຍ',5,NULL,NULL,'2017-09-01 09:48:59',0),(18,'1905','ບຸນເໜືອ',2,NULL,NULL,'2017-09-01 09:48:59',0),(19,'1907','ບຸນໃຕ້',2,NULL,NULL,'2017-09-01 09:48:59',0),(20,'2001','ຫລວງນໍ້າທາ',3,NULL,NULL,'2017-09-01 09:48:59',0),(21,'2003','ລອງ',3,NULL,NULL,'2017-09-01 09:48:59',0),(22,'2004','ວຽງພູຄາ',3,NULL,NULL,'2017-09-01 09:48:59',0),(23,'2005','ນາແລ',3,NULL,NULL,'2017-09-01 09:48:59',0),(24,'340','ອານຸວົງ',18,NULL,NULL,'2017-09-01 09:48:59',0),(25,'2520','ຊຽງຮ່ອນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(26,'23002','ນານ',6,NULL,NULL,'2017-09-01 09:48:59',0),(27,'2225','ຕົ້ນເຜິ້ງ',5,NULL,NULL,'2017-09-01 09:48:59',0),(28,'262','ພູກູດ',9,NULL,NULL,'2017-09-01 09:48:59',0),(29,'2389','ຊຽງເງິນ',6,NULL,NULL,'2017-09-01 09:48:59',0),(30,'242','ຊໍາໃຕ້',7,NULL,NULL,'2017-09-01 09:48:59',0),(31,'301','ສາລະວັນ',14,NULL,NULL,'2017-09-01 09:48:59',0),(32,'302','ວາປີ',14,NULL,NULL,'2017-09-01 09:48:59',0),(33,'2330','ພູຄູນ',6,NULL,NULL,'2017-09-01 09:48:59',0),(34,'22123','ປາກທາ',5,NULL,NULL,'2017-09-01 09:48:59',0),(35,'22230','ຜາອຸດົມ',5,NULL,NULL,'2017-09-01 09:48:59',0),(36,'293','ໄຊບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(37,'2904','ອາດສະພັງທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(38,'295','ພະລານໄຊ',13,NULL,NULL,'2017-09-01 09:48:59',0),(39,'296','ພີນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(40,'297','ເຊໂປນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(41,'298','ວິລະບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(42,'299','ໄຊພູທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(43,'2910','ສອງຄອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(44,'2911','ທ່າປາງທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(45,'22','ປາກກະດິງ',11,NULL,NULL,'2017-09-01 09:48:59',0),(46,'23','ທ່າພະບາດ',11,NULL,NULL,'2017-09-01 09:48:59',0),(47,'24','ບໍລິຄັນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(48,'25','ວຽງທອງ',11,NULL,NULL,'2017-09-01 09:48:59',0),(49,'26','ໄຊຈໍາພອນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(50,'27','ຄໍາເກີດ',11,NULL,NULL,'2017-09-01 09:48:59',0),(51,'211','ໄຊ',4,NULL,NULL,'2017-09-01 09:48:59',0),(52,'212','ແບງ',4,NULL,NULL,'2017-09-01 09:48:59',0),(53,'213','ຮູນ',4,NULL,NULL,'2017-09-01 09:48:59',0),(54,'214','ຫຼາ',4,NULL,NULL,'2017-09-01 09:48:59',0),(55,'215','ນາໝໍ້',4,NULL,NULL,'2017-09-01 09:48:59',0),(56,'216','ງາ',4,NULL,NULL,'2017-09-01 09:48:59',0),(57,'217','ປາກແບງ',4,NULL,NULL,'2017-09-01 09:48:59',0),(58,'225','ເມິງ',5,NULL,NULL,'2017-09-01 09:48:59',0),(59,'231','ຫຼວງພຣະບາງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(60,'233','ປາກອູ',6,NULL,NULL,'2017-09-01 09:48:59',0),(61,'234','ຈອມເພັດ',6,NULL,NULL,'2017-09-01 09:48:59',0),(62,'235','ງອຍ',6,NULL,NULL,'2017-09-01 09:48:59',0),(63,'236','ນໍ້າບາກ',6,NULL,NULL,'2017-09-01 09:48:59',0),(64,'237','ວຽງຄໍາ',6,NULL,NULL,'2017-09-01 09:48:59',0),(65,'238','ໂພນໄຊ',6,NULL,NULL,'2017-09-01 09:48:59',0),(66,'239','ປາກແຊງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(67,'2310','ໂພນທອງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(68,'241','ຊ້ອນ',7,NULL,NULL,'2017-09-01 09:48:59',0),(69,'243','ວຽງໄຊ',7,NULL,NULL,'2017-09-01 09:48:59',0),(70,'244','ສົບເບົາ',7,NULL,NULL,'2017-09-01 09:48:59',0),(71,'245','ຊຽງຄໍ້',7,NULL,NULL,'2017-09-01 09:48:59',0),(72,'246','ແອດ',7,NULL,NULL,'2017-09-01 09:48:59',0),(73,'247','ຊໍາເໜືອ',7,NULL,NULL,'2017-09-01 09:48:59',0),(74,'248','ຫົວເມືອງ',7,NULL,NULL,'2017-09-01 09:48:59',0),(75,'251','ຄອບ',8,NULL,NULL,'2017-09-01 09:48:59',0),(76,'254','ເງິນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(77,'255','ໄຊສະຖານ',8,NULL,NULL,'2017-09-01 09:48:59',0),(78,'256','ໄຊຍະບູລີ',8,NULL,NULL,'2017-09-01 09:48:59',0),(79,'257','ພຽງ',8,NULL,NULL,'2017-09-01 09:48:59',0),(80,'258','ທົ່ງມີໄຊ',8,NULL,NULL,'2017-09-01 09:48:59',0),(81,'259','ປາກລາຍ',8,NULL,NULL,'2017-09-01 09:48:59',0),(82,'2510','ແກ່ນທ້າວ',8,NULL,NULL,'2017-09-01 09:48:59',0),(83,'2511','ບໍ່ແຕນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(84,'263','ຜາໄຊ',9,NULL,NULL,'2017-09-01 09:48:59',0),(85,'264','ຄໍາ',9,NULL,NULL,'2017-09-01 09:48:59',0),(86,'265','ແປກ',9,NULL,NULL,'2017-09-01 09:48:59',0),(87,'266','ໜອງແຮດ',9,NULL,NULL,'2017-09-01 09:48:59',0),(88,'267','ໝອກ',9,NULL,NULL,'2017-09-01 09:48:59',0),(89,'268','ຄູນ',9,NULL,NULL,'2017-09-01 09:48:59',0),(90,'271','ໂພນໂຮງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(91,'272','ທຸລະຄົມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(92,'273','ແກ້ວອຸດົມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(93,'274','ກາສີ',10,NULL,NULL,'2017-09-01 09:48:59',0),(94,'275','ວັງວຽງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(95,'276','ເຟືອງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(96,'277','ຊະນະຄາມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(97,'278','ແມດ',10,NULL,NULL,'2017-09-01 09:48:59',0),(98,'279','ວຽງຄໍາ',10,NULL,NULL,'2017-09-01 09:48:59',0),(99,'2710','ຫີນເຫີບ',10,NULL,NULL,'2017-09-01 09:48:59',0),(100,'2711','ໝື່ນ',10,NULL,NULL,'2017-09-01 09:48:59',0),(101,'303','ລະຄອນເພັງ',14,NULL,NULL,'2017-09-01 09:48:59',0),(102,'304','ເລົ່າງາມ',14,NULL,NULL,'2017-09-01 09:48:59',0),(103,'305','ຄົງເຊໂດນ',14,NULL,NULL,'2017-09-01 09:48:59',0),(104,'306','ຕຸ້ມລານ',14,NULL,NULL,'2017-09-01 09:48:59',0),(105,'307','ຕະໂອ້ຍ',14,NULL,NULL,'2017-09-01 09:48:59',0),(106,'308','ສະໝ້ວຍ',14,NULL,NULL,'2017-09-01 09:48:59',0),(107,'332','ຊານໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(108,'333','ສະໜາມໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(109,'334','ສາມັກຄີມີໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(110,'335','ພູວົງ',17,NULL,NULL,'2017-09-01 09:48:59',0),(111,'431','ທ່າແຂກ',12,NULL,NULL,'2017-09-01 09:48:59',0),(112,'432','ຫີນບູນ',12,NULL,NULL,'2017-09-01 09:48:59',0),(113,'433','ໜອງບົກ',12,NULL,NULL,'2017-09-01 09:48:59',0),(114,'434','ເຊບັ້ງໄຟ',12,NULL,NULL,'2017-09-01 09:48:59',0),(115,'435','ມະຫາໄຊ',12,NULL,NULL,'2017-09-01 09:48:59',0),(116,'436','ຍົມມະລາດ',12,NULL,NULL,'2017-09-01 09:48:59',0),(117,'437','ນາກາຍ',12,NULL,NULL,'2017-09-01 09:48:59',0),(118,'438','ໄຊບົວທອງ',12,NULL,NULL,'2017-09-01 09:48:59',0),(119,'439','ບົວລະພາ',12,NULL,NULL,'2017-09-01 09:48:59',0),(120,'4310','ຄູນຄໍາ',12,NULL,NULL,'2017-09-01 09:48:59',0),(121,'161','ຈໍາປາສັກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(122,'152','ທ່າແຕງ',15,NULL,NULL,'2017-09-01 09:48:59',0),(123,'1521','ລະມາມ',15,NULL,NULL,'2017-09-01 09:48:59',0),(124,'1512','ກະລືມ',15,NULL,NULL,'2017-09-01 09:48:59',0),(125,'1513','ດາກຈຶງ',15,NULL,NULL,'2017-09-01 09:48:59',0),(126,'162','ບາຈຽງຈະເລີນສຸກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(127,'163','ປາກຊ່ອງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(128,'164','ປະທຸມພອນ',16,NULL,NULL,'2017-09-01 09:48:59',0),(129,'165','ໂພນທອງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(130,'166','ສຸຂຸມາ',16,NULL,NULL,'2017-09-01 09:48:59',0),(131,'167','ມູນລະປະໂມກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(132,'168','ໂຂງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(133,'0242','ຍອດອູ',2,NULL,NULL,'2017-09-01 09:48:59',0),(134,'20203','ໃຫມ່',2,NULL,NULL,'2017-09-01 09:48:59',0),(135,'20204','ຂວາ',2,NULL,NULL,'2017-09-01 09:48:59',0),(136,'20205','ສໍາພັນ',2,NULL,NULL,'2017-09-01 09:48:59',0),(137,'5227','ປາກທາ',5,NULL,NULL,'2017-09-01 09:48:59',0),(138,'7543','ຮ້ຽມ',7,NULL,NULL,'2017-09-01 09:48:59',0),(139,'7544','ກວັນ',7,NULL,NULL,'2017-09-01 09:48:59',0),(140,'13277','ຈຳພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(141,'13278','ຊົນບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(142,'13279','ນອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(143,'13280','ອາດສະພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(144,'16111','ຊະນະສົມບູນ',16,NULL,NULL,'2017-09-01 09:48:59',0),(145,'16117','ປາກເຊ',16,NULL,NULL,'2017-09-01 09:48:59',0),(146,'183404','ທ່າໂທມ',18,NULL,NULL,'2017-09-01 09:48:59',0),(147,'18333','ລ້ອງແຈ້ງ',18,NULL,NULL,'2017-09-01 09:48:59',0),(148,'18332','ຮົ່ມ',18,NULL,NULL,'2017-09-01 09:48:59',0),(149,'18366','ລ້ອງຊານ',18,NULL,NULL,'2017-09-01 09:48:59',0);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethnic`
--

DROP TABLE IF EXISTS `ethnic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnic`
--

LOCK TABLES `ethnic` WRITE;
/*!40000 ALTER TABLE `ethnic` DISABLE KEYS */;
INSERT INTO `ethnic` VALUES (1,'ລາວ',1,0),(2,'ໄຕ',2,0),(3,'ຜູ້ໄທ',3,0);
/*!40000 ALTER TABLE `ethnic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foundation`
--

DROP TABLE IF EXISTS `foundation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foundation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_foundation_province1_idx` (`province_id`),
  CONSTRAINT `fk_foundation_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foundation`
--

LOCK TABLES `foundation` WRITE;
/*!40000 ALTER TABLE `foundation` DISABLE KEYS */;
/*!40000 ALTER TABLE `foundation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goverment_level`
--

DROP TABLE IF EXISTS `goverment_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goverment_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goverment_level`
--

LOCK TABLES `goverment_level` WRITE;
/*!40000 ALTER TABLE `goverment_level` DISABLE KEYS */;
INSERT INTO `goverment_level` VALUES (1,'ກົມ',0,0),(2,'ສະຖາບັນ',0,0),(3,'ສູນ',0,0),(4,'ະຳຫະ',1,0),(5,'area',1,0),(6,'asda',1,0),(7,'ss',1,0),(8,'dd',1,0);
/*!40000 ALTER TABLE `goverment_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goverment_unit`
--

DROP TABLE IF EXISTS `goverment_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goverment_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_goverment_unit_branch1_idx` (`branch_id`),
  CONSTRAINT `fk_goverment_unit_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goverment_unit`
--

LOCK TABLES `goverment_unit` WRITE;
/*!40000 ALTER TABLE `goverment_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `goverment_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal`
--

DROP TABLE IF EXISTS `legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `legal_type_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_legal_legal_type1_idx` (`legal_type_id`),
  CONSTRAINT `fk_legal_legal_type1` FOREIGN KEY (`legal_type_id`) REFERENCES `legal_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal`
--

LOCK TABLES `legal` WRITE;
/*!40000 ALTER TABLE `legal` DISABLE KEYS */;
INSERT INTO `legal` VALUES (1,'ວ່າດ້ວຍພົນລະເມືອງ',0,1,1),(2,'ວ່າດ້ວຍ...',0,1,2),(3,'ວ່າດ້ວຍສະມາຄົມ',0,2,3);
/*!40000 ALTER TABLE `legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_status`
--

DROP TABLE IF EXISTS `legal_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_status`
--

LOCK TABLES `legal_status` WRITE;
/*!40000 ALTER TABLE `legal_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_type`
--

DROP TABLE IF EXISTS `legal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_type`
--

LOCK TABLES `legal_type` WRITE;
/*!40000 ALTER TABLE `legal_type` DISABLE KEYS */;
INSERT INTO `legal_type` VALUES (1,'ດຳລັດ',0,1),(2,'ກົດໝາຍ',0,2);
/*!40000 ALTER TABLE `legal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `menugroup_id` int(11) DEFAULT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_menu_menugroup1_idx` (`menugroup_id`),
  KEY `fk_menu_menu1_idx` (`menu_parent_id`),
  KEY `fk_menu_user_id` (`input_id`),
  CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_menugroup1` FOREIGN KEY (`menugroup_id`) REFERENCES `menugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',NULL,'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',0,NULL,0,NULL,'2017-09-03 18:41:53'),(2,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ ..... ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(3,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(4,'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ',NULL,'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(5,'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',NULL,'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(6,'ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫ',NULL,'ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫານປະເພດຕ່າງໆ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(7,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບກ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(8,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(9,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(10,'ຈໍານວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ',NULL,'ຈໍານວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(11,'ຕາຕະລາງສັງລວມຊີວະປະຫວັດຫຍໍ້ຂອງພະນັກງານ',NULL,'ຕາຕະລາງສັງລວມຊີວະປະຫວັດຫຍໍ້ຂອງພະນັກງານ',0,NULL,1,NULL,'2017-09-03 18:45:05'),(12,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ',0,NULL,1,NULL,'2017-09-03 18:45:06'),(13,'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮ',NULL,'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ',0,NULL,0,NULL,'2017-09-03 18:45:38'),(14,'ຕາຕະລາງສະຖິຕິສັງລວມການສ້າງ ແລະ ພັດທະນາຫຼັກສູດ',NULL,'ຕາຕະລາງສະຖິຕິສັງລວມການສ້າງ ແລະ ພັດທະນາຫຼັກສູດ',0,NULL,13,NULL,'2017-09-03 18:47:12'),(15,'ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູ',NULL,'ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູນກາງ ແລະ ທ້ອງຖິ່ນ (ຕາມການສະເໜີ)',0,NULL,13,NULL,'2017-09-03 18:47:12'),(16,'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາກອນຕາມການເຊື້ອເຊີນ',0,NULL,13,NULL,'2017-09-03 18:47:12'),(17,'ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ',NULL,'ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ-ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ',0,NULL,13,NULL,'2017-09-03 18:47:12'),(18,'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ',NULL,'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ',0,NULL,13,NULL,'2017-09-03 18:47:12'),(19,'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝຸດ',0,NULL,13,NULL,'2017-09-03 18:47:12'),(20,'ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະ',NULL,'ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະນັກງານ-ລັດຖະກອນ ພາຍໃນສະຖາບັນ',0,NULL,13,NULL,'2017-09-03 18:47:13'),(21,'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',NULL,'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',0,NULL,0,NULL,'2017-09-03 18:47:24'),(22,'ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອໃນທົ່ວປະເທດ',0,NULL,21,NULL,'2017-09-03 18:48:20'),(23,'ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ ຄະນະຮັບຜິດຊອບສາສະໜາ',0,NULL,21,NULL,'2017-09-03 18:48:20'),(24,'ຕາຕະລາງເກັບກຳສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ',0,NULL,21,NULL,'2017-09-03 18:48:20'),(25,'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວແຂວງ',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວແຂວງ',0,NULL,21,NULL,'2017-09-03 18:48:20'),(26,'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວເມືອງ',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວເມືອງ',0,NULL,21,NULL,'2017-09-03 18:48:21'),(27,'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',NULL,'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',0,NULL,0,NULL,'2017-09-03 18:49:19'),(28,'ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ',NULL,'ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຝຶກອົບຮົມຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(29,'ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງກາ',NULL,'ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຍົກລະດັບ (ໄປຮຽນຕໍ່) ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(30,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(31,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(32,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(33,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(34,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(35,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(36,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(37,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(38,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)',0,NULL,27,NULL,'2017-09-03 18:50:24'),(39,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)',0,NULL,27,NULL,'2017-09-03 18:50:24'),(40,'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(41,'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(42,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(43,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(44,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(45,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:24'),(46,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:25'),(47,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:25'),(48,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)',0,NULL,27,NULL,'2017-09-03 18:50:25'),(49,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)',0,NULL,27,NULL,'2017-09-03 18:50:25'),(50,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:25'),(51,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ',NULL,'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:25'),(52,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:25'),(53,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-03 18:50:26'),(54,'ກົມຄຸ້ມຄອງພົນລະເມືອງ',NULL,'ກົມຄຸ້ມຄອງພົນລະເມືອງ',0,NULL,0,NULL,'2017-09-03 18:50:38'),(55,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ',0,NULL,54,NULL,'2017-09-03 18:51:25'),(56,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະ',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະຈໍາປີ.......',0,NULL,54,NULL,'2017-09-03 18:51:25'),(57,'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປ',NULL,'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປະຈຳປີ.......',0,NULL,54,NULL,'2017-09-03 18:51:25'),(58,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງ',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງ',0,NULL,54,NULL,'2017-09-03 18:51:25'),(59,'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເ',NULL,'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເດືອນ....... ປະຈຳປີ ............',0,NULL,54,NULL,'2017-09-03 18:51:25'),(60,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ..',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ.......... ປະຈຳປີ .............',0,NULL,54,NULL,'2017-09-03 18:51:25'),(61,'ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳ',NULL,'ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .............',0,NULL,54,NULL,'2017-09-03 18:51:25'),(62,'ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປ',NULL,'ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ..........',0,NULL,54,NULL,'2017-09-03 18:51:25'),(63,'ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປ',NULL,'ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ...........',0,NULL,54,NULL,'2017-09-03 18:51:25'),(64,'ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ',NULL,'ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .......',0,NULL,54,NULL,'2017-09-03 18:51:25'),(65,'ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອ',NULL,'ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .....',0,NULL,54,NULL,'2017-09-03 18:51:25'),(66,'ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ',NULL,'ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳປີ ...........',0,NULL,54,NULL,'2017-09-03 18:51:28'),(67,'ກົມການປົກຄອງທ້ອງຖິ່ນ',NULL,'ກົມການປົກຄອງທ້ອງຖິ່ນ',0,NULL,0,NULL,'2017-09-03 18:51:37'),(68,'ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ,',NULL,'ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ, ເຈົ້າຄອງນະຄອນ ແລະ ຮອງເຈົ້າຄອງນະຄອນ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(69,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ',NULL,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົກຄອງແຂວງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(70,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລ',NULL,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລະ ອົງການທຽບເທົ່າ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(71,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວ',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(72,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມ',NULL,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມືອງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(73,'ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າ',NULL,'ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົຄອງເມືອງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(74,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ',NULL,'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ້ອງການ ແລະ ອົງການທຽບເທົ່າ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(75,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຕົວເມືອງ',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຕົວເມືອງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(76,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຊົນນະບົດ',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຊົນນະບົດ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(77,'ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າ',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າງ',0,NULL,67,NULL,'2017-09-03 18:52:20'),(78,'ຕາຕະລາງສັງລວມຂໍ້ມູນຂັ້ນບ້ານ',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນຂັ້ນບ້ານ',0,NULL,67,NULL,'2017-09-03 18:52:21'),(79,'ກົມພັດທະນາການບໍລິຫານລັດ',NULL,'ກົມພັດທະນາການບໍລິຫານລັດ',0,NULL,0,NULL,'2017-09-03 18:52:28'),(80,'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງກາ',NULL,'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ',0,NULL,79,NULL,'2017-09-03 18:53:04'),(81,'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສ',NULL,'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)',0,NULL,79,NULL,'2017-09-03 18:53:04'),(82,'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ',NULL,'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່',0,NULL,79,NULL,'2017-09-03 18:53:04'),(83,'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່າ',NULL,'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ',0,NULL,79,NULL,'2017-09-03 18:53:04'),(84,'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ',NULL,'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ',0,NULL,79,NULL,'2017-09-03 18:53:04'),(85,'ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອ',NULL,'ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອງກະຊວງ/ອົງການລັດທຽບເທົ່າກະຊວງ',0,NULL,79,NULL,'2017-09-03 18:53:05'),(86,'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ',NULL,'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ',0,NULL,0,NULL,'2017-09-03 18:53:18'),(87,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',NULL,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',0,NULL,86,NULL,'2017-09-03 18:54:01'),(88,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',NULL,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',0,NULL,86,NULL,'2017-09-03 18:54:01'),(89,'ກົມແຜນທີ່ແຫ່ງຊາດ',NULL,'ກົມແຜນທີ່ແຫ່ງຊາດ',0,NULL,0,NULL,'2017-09-03 18:54:01'),(90,'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......',NULL,'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......',0,NULL,89,NULL,'2017-09-03 18:55:00'),(91,'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ',NULL,'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ',0,NULL,89,NULL,'2017-09-03 18:55:00'),(92,'ສະຖິຕິການຜະລິດແຜນທີ່',NULL,'ສະຖິຕິການຜະລິດແຜນທີ່',0,NULL,89,NULL,'2017-09-03 18:55:00'),(93,'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',NULL,'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',0,NULL,0,NULL,'2017-09-03 18:55:01'),(94,'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ',NULL,'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ',0,NULL,93,NULL,'2017-09-03 18:55:28'),(95,'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',NULL,'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',0,NULL,0,NULL,'2017-09-03 18:55:29'),(96,'ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົ',NULL,'ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(97,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວ',NULL,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(98,'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອ',NULL,'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(99,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັ',NULL,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(100,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂ',NULL,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(101,'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອ',NULL,'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(102,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັ',NULL,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(103,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບ',NULL,'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(104,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະ',NULL,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(105,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂ',NULL,'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',0,NULL,95,NULL,'2017-09-03 19:00:16'),(106,'ກົມແຜນການ ແລະ ການຮ່ວມມື',NULL,'ກົມແຜນການ ແລະ ການຮ່ວມມື',0,NULL,0,NULL,'2017-09-03 19:00:17'),(107,'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທ',NULL,'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ (ODA)',0,NULL,106,NULL,'2017-09-03 19:01:11'),(108,'ຕາຕະລາງສະຖິຕິການຮ່ວມມື',NULL,'ຕາຕະລາງສະຖິຕິການຮ່ວມມື',0,NULL,106,NULL,'2017-09-03 19:01:11'),(109,'ກົມຄຸ້ມຄອງລັດຖະກອນ',NULL,'ກົມຄຸ້ມຄອງລັດຖະກອນ',0,NULL,0,NULL,'2017-09-03 19:01:13'),(110,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ສະເພາະຊັ້ນ VI)',0,NULL,109,NULL,'2017-09-03 19:05:41'),(111,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ແຕ່ຊັ້ນ I-V)',0,NULL,109,NULL,'2017-09-03 19:06:06'),(112,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມວິຊາສະເພາະ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມວິຊາສະເພາະ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(113,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ',NULL,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(114,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',NULL,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(115,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານ',NULL,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(116,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບກ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(117,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ່າງໆ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(118,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ',NULL,'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ',0,NULL,109,NULL,'2017-09-03 19:10:17'),(119,'ຕາຕະລາງຈຳນວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ',NULL,'ຕາຕະລາງຈຳນວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ',0,NULL,109,NULL,'2017-09-03 19:10:18');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menugroup`
--

DROP TABLE IF EXISTS `menugroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menugroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_menugroup_user_id` (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menugroup`
--

LOCK TABLES `menugroup` WRITE;
/*!40000 ALTER TABLE `menugroup` DISABLE KEYS */;
INSERT INTO `menugroup` VALUES (1,'ການຕັ້ງຄ່າ',0,1,'2017-09-03 17:19:01'),(2,'ຜູ້ຄຸ້ມຄອງລະບົບນ',0,1,'2017-09-03 17:19:01');
/*!40000 ALTER TABLE `menugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  KEY `idx_message_language` (`language`),
  CONSTRAINT `fk_message_source_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (2,'la-LA','ເພີ່ມ'),(8,'la-LA','okaa'),(10,'la-LA',NULL),(11,'la-LA',NULL),(12,'la-LA',NULL),(13,'la-LA',NULL),(14,'la-LA',NULL),(16,'la-LA',''),(17,'la-LA',''),(18,'la-LA',''),(19,'la-LA',''),(20,'la-LA',''),(22,'la-LA','asfsdfs'),(23,'la-LA','safds'),(24,'la-LA','sfasdf'),(25,'la-LA','xxxx'),(26,'la-LA','cc'),(28,'la-LA','eee'),(29,'la-LA','dd'),(30,'la-LA','gg'),(32,'la-LA','lpp'),(33,'la-LA',''),(34,'la-LA',''),(35,'la-LA',''),(36,'la-LA',''),(37,'la-LA',''),(38,'la-LA',''),(39,'la-LA',''),(40,'la-LA',''),(41,'la-LA',''),(42,'la-LA',''),(43,'la-LA',''),(44,'la-LA',''),(45,'la-LA',''),(46,'la-LA',''),(47,'la-LA',''),(48,'la-LA',''),(49,'la-LA',''),(50,'la-LA',''),(51,'la-LA',''),(52,'la-LA',''),(53,'la-LA',''),(54,'la-LA',''),(55,'la-LA',''),(56,'la-LA',''),(57,'la-LA',''),(58,'la-LA',''),(59,'la-LA',''),(60,'la-LA',''),(61,'la-LA',''),(62,'la-LA',''),(63,'la-LA',''),(64,'la-LA',''),(65,'la-LA',''),(66,'la-LA',''),(67,'la-LA',''),(68,'la-LA',''),(69,'la-LA',''),(70,'la-LA',''),(71,'la-LA',''),(72,'la-LA',''),(73,'la-LA',''),(74,'la-LA',''),(75,'la-LA',''),(76,'la-LA',''),(77,'la-LA',''),(78,'la-LA',''),(79,'la-LA',''),(80,'la-LA',''),(81,'la-LA',''),(82,'la-LA',''),(83,'la-LA',''),(84,'la-LA',''),(85,'la-LA',''),(86,'la-LA',''),(87,'la-LA',''),(88,'la-LA',''),(89,'la-LA',''),(90,'la-LA',''),(91,'la-LA',''),(92,'la-LA',''),(93,'la-LA',''),(101,'la-LA',''),(102,'la-LA',''),(103,'la-LA',''),(104,'la-LA',''),(105,'la-LA',''),(106,'la-LA',''),(107,'la-LA',''),(108,'la-LA',''),(109,'la-LA',''),(110,'la-LA',''),(111,'la-LA',''),(112,'la-LA',''),(113,'la-LA',''),(114,'la-LA',''),(115,'la-LA',''),(116,'la-LA',''),(117,'la-LA',''),(118,'la-LA',''),(119,'la-LA',''),(120,'la-LA',''),(121,'la-LA',''),(122,'la-LA',''),(123,'la-LA',''),(124,'la-LA',''),(125,'la-LA',''),(126,'la-LA',''),(127,'la-LA',''),(128,'la-LA',''),(131,'la-LA',''),(132,'la-LA',''),(133,'la-LA',''),(134,'la-LA',''),(135,'la-LA',''),(136,'la-LA',''),(137,'la-LA',''),(138,'la-LA',''),(139,'la-LA',''),(140,'la-LA',''),(141,'la-LA',''),(142,'la-LA',''),(143,'la-LA',''),(144,'la-LA',''),(145,'la-LA',''),(146,'la-LA',''),(147,'la-LA',''),(148,'la-LA',''),(149,'la-LA',''),(150,'la-LA',''),(151,'la-LA',''),(152,'la-LA',''),(153,'la-LA',''),(154,'la-LA',''),(155,'la-LA',''),(156,'la-LA',''),(157,'la-LA',''),(158,'la-LA',''),(159,'la-LA',''),(160,'la-LA',''),(161,'la-LA',''),(162,'la-LA',''),(163,'la-LA',''),(164,'la-LA',''),(165,'la-LA',''),(166,'la-LA',''),(167,'la-LA',''),(168,'la-LA',''),(169,'la-LA',''),(170,'la-LA',''),(171,'la-LA',''),(172,'la-LA',''),(173,'la-LA',''),(174,'la-LA',''),(175,'la-LA',''),(176,'la-LA',''),(177,'la-LA',''),(178,'la-LA',''),(179,'la-LA',''),(180,'la-LA',''),(181,'la-LA',''),(182,'la-LA',''),(183,'la-LA',''),(184,'la-LA',''),(185,'la-LA',''),(186,'la-LA',''),(187,'la-LA',''),(188,'la-LA',''),(189,'la-LA',''),(190,'la-LA',''),(191,'la-LA',''),(192,'la-LA',''),(193,'la-LA',''),(194,'la-LA',''),(195,'la-LA',''),(196,'la-LA',''),(197,'la-LA',''),(198,'la-LA',''),(199,'la-LA',''),(200,'la-LA',''),(201,'la-LA',''),(202,'la-LA',''),(203,'la-LA',''),(204,'la-LA',''),(205,'la-LA',''),(206,'la-LA',''),(207,'la-LA',''),(208,'la-LA',''),(209,'la-LA',''),(210,'la-LA',''),(211,'la-LA',''),(212,'la-LA',''),(213,'la-LA',''),(214,'la-LA',''),(215,'la-LA',''),(216,'la-LA',''),(217,'la-LA',''),(218,'la-LA',''),(219,'la-LA',''),(220,'la-LA',''),(221,'la-LA',''),(222,'la-LA',''),(223,'la-LA',''),(224,'la-LA',''),(225,'la-LA',''),(226,'la-LA',''),(227,'la-LA',''),(228,'la-LA',''),(229,'la-LA',''),(230,'la-LA',''),(231,'la-LA',''),(232,'la-LA',''),(233,'la-LA',''),(234,'la-LA',''),(235,'la-LA',''),(236,'la-LA',''),(237,'la-LA',''),(238,'la-LA',''),(239,'la-LA',''),(240,'la-LA',''),(241,'la-LA',''),(242,'la-LA',''),(243,'la-LA',''),(244,'la-LA',''),(245,'la-LA',''),(246,'la-LA',''),(247,'la-LA',''),(248,'la-LA',''),(249,'la-LA',''),(250,'la-LA',''),(251,'la-LA',''),(252,'la-LA',''),(253,'la-LA',''),(254,'la-LA',''),(255,'la-LA',''),(256,'la-LA',''),(257,'la-LA',''),(258,'la-LA',''),(259,'la-LA',''),(260,'la-LA',''),(261,'la-LA',''),(262,'la-LA',''),(263,'la-LA',''),(264,'la-LA',''),(265,'la-LA',''),(266,'la-LA',''),(267,'la-LA',''),(268,'la-LA',''),(269,'la-LA',''),(270,'la-LA',''),(271,'la-LA',''),(272,'la-LA',''),(273,'la-LA',''),(274,'la-LA',''),(275,'la-LA',''),(276,'la-LA',''),(277,'la-LA',''),(278,'la-LA',''),(279,'la-LA',''),(280,'la-LA',''),(281,'la-LA',''),(282,'la-LA',''),(283,'la-LA',''),(284,'la-LA',''),(285,'la-LA',''),(286,'la-LA',''),(287,'la-LA',''),(288,'la-LA',''),(289,'la-LA',''),(290,'la-LA',''),(293,'la-LA',''),(294,'la-LA',''),(295,'la-LA',''),(296,'la-LA',''),(297,'la-LA',''),(298,'la-LA',''),(299,'la-LA',''),(300,'la-LA',''),(301,'la-LA',''),(302,'la-LA',''),(303,'la-LA',''),(308,'la-LA',''),(309,'la-LA',''),(310,'la-LA',''),(311,'la-LA',''),(312,'la-LA',''),(313,'la-LA',''),(314,'la-LA',''),(315,'la-LA',''),(316,'la-LA',''),(317,'la-LA',''),(318,'la-LA',''),(319,'la-LA',''),(320,'la-LA',''),(321,'la-LA',''),(322,'la-LA',''),(330,'la-LA',''),(331,'la-LA',''),(332,'la-LA',''),(333,'la-LA',''),(334,'la-LA',''),(335,'la-LA',''),(336,'la-LA',''),(337,'la-LA',''),(338,'la-LA',''),(339,'la-LA',''),(340,'la-LA',''),(341,'la-LA',''),(342,'la-LA',''),(343,'la-LA',''),(344,'la-LA',''),(345,'la-LA',''),(346,'la-LA',''),(347,'la-LA',''),(348,'la-LA',''),(349,'la-LA',''),(350,'la-LA',''),(351,'la-LA',''),(352,'la-LA',''),(353,'la-LA',''),(354,'la-LA',''),(355,'la-LA',''),(356,'la-LA',''),(357,'la-LA',''),(358,'la-LA',''),(359,'la-LA',''),(360,'la-LA',''),(361,'la-LA',''),(362,'la-LA',''),(363,'la-LA',''),(364,'la-LA',''),(365,'la-LA',''),(366,'la-LA',''),(367,'la-LA',''),(368,'la-LA',''),(369,'la-LA',''),(370,'la-LA',''),(371,'la-LA',''),(372,'la-LA',''),(374,'la-LA',''),(375,'la-LA',''),(376,'la-LA',''),(377,'la-LA',''),(378,'la-LA',''),(379,'la-LA',''),(380,'la-LA',''),(381,'la-LA',''),(382,'la-LA',''),(383,'la-LA',''),(384,'la-LA',''),(385,'la-LA',''),(386,'la-LA',''),(387,'la-LA',''),(388,'la-LA',''),(389,'la-LA',''),(390,'la-LA',''),(391,'la-LA',''),(392,'la-LA',''),(393,'la-LA',''),(394,'la-LA',''),(395,'la-LA',''),(396,'la-LA',''),(398,'la-LA',''),(399,'la-LA',''),(400,'la-LA',''),(437,'la-LA',''),(438,'la-LA',''),(439,'la-LA',''),(440,'la-LA',''),(441,'la-LA',''),(442,'la-LA',''),(443,'la-LA',''),(444,'la-LA',''),(445,'la-LA',''),(446,'la-LA',''),(447,'la-LA',''),(448,'la-LA',''),(477,'la-LA',''),(478,'la-LA',''),(479,'la-LA',''),(480,'la-LA',''),(481,'la-LA',''),(482,'la-LA',''),(483,'la-LA',''),(484,'la-LA',''),(485,'la-LA',''),(486,'la-LA',''),(487,'la-LA',''),(488,'la-LA',''),(489,'la-LA',''),(490,'la-LA',''),(491,'la-LA',''),(492,'la-LA',''),(493,'la-LA',''),(500,'la-LA',''),(501,'la-LA',''),(502,'la-LA',''),(503,'la-LA',''),(504,'la-LA',''),(505,'la-LA',''),(506,'la-LA',''),(507,'la-LA',''),(508,'la-LA',''),(514,'la-LA',''),(515,'la-LA',''),(516,'la-LA',''),(517,'la-LA',''),(518,'la-LA',''),(519,'la-LA',''),(520,'la-LA',''),(521,'la-LA',''),(522,'la-LA','');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1503900150),('m150207_210500_i18n_init',1503900154),('m170901_012901_init_db',1504544278),('m170901_015159_fix_menu_tabl',1504544278),('m170901_021803_tbprovin_district',1504544278),('m170903_121828_menu_vs_group',1504544278);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ministry`
--

DROP TABLE IF EXISTS `ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `code` varchar(5) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `ministry_group_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `remark` text,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `equal` int(11) DEFAULT '0' COMMENT 'equal ministry',
  PRIMARY KEY (`id`),
  KEY `fk_ministry_ministry_group1_idx` (`ministry_group_id`),
  KEY `fk_ministry_user1_idx` (`user_id`),
  CONSTRAINT `fk_ministry_ministry_group1` FOREIGN KEY (`ministry_group_id`) REFERENCES `ministry_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministry`
--

LOCK TABLES `ministry` WRITE;
/*!40000 ALTER TABLE `ministry` DISABLE KEYS */;
INSERT INTO `ministry` VALUES (1,'ກະຊວງການຄ້າ',0,NULL,'2017-09-03 17:55:59',NULL,1,2,'ກກ','2017-09-13 16:25:51',0),(2,'ກະຊວງສາທາ',0,NULL,'2017-09-03 17:56:24',NULL,2,2,'ພພ','2017-09-13 16:25:51',0),(3,'xxx',1,NULL,'2017-09-04 14:57:58',NULL,4,2,'kkk','2017-09-13 16:25:51',0),(4,'ກະຊວງສຶກສາ',0,NULL,'2017-09-10 18:08:14',NULL,3,2,'43dfh','2017-09-13 16:25:51',0),(5,'ກະຊວງພາຍໃນ',0,NULL,'2017-09-10 18:08:27',NULL,4,2,NULL,'2017-09-13 16:25:51',0);
/*!40000 ALTER TABLE `ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ministry_group`
--

DROP TABLE IF EXISTS `ministry_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ministry_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministry_group`
--

LOCK TABLES `ministry_group` WRITE;
/*!40000 ALTER TABLE `ministry_group` DISABLE KEYS */;
INSERT INTO `ministry_group` VALUES (1,'ກຸ່ມເສດຖະກິດ',0,0,'2017-09-13 16:25:04',NULL),(2,'ກຸ່ມສັງຄົມວັດທະນະທຳ',0,0,'2017-09-13 16:25:04',NULL),(3,'ກຸ່ມອະທິປະໄຕ',0,0,'2017-09-13 16:25:04',NULL);
/*!40000 ALTER TABLE `ministry_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer_level`
--

DROP TABLE IF EXISTS `officer_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officer_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_officer_level_user1_idx` (`user_id`),
  CONSTRAINT `fk_officer_level_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer_level`
--

LOCK TABLES `officer_level` WRITE;
/*!40000 ALTER TABLE `officer_level` DISABLE KEYS */;
INSERT INTO `officer_level` VALUES (1,'ກ. ຂັ້ນກະຊວງ',0,'2017-09-17 04:39:27',1,2),(2,'ຂ. ຂັ້ນແຂວງ',0,'2017-09-17 04:39:42',2,2),(3,'ຄ. ຂັ້ນເມືອງ',0,'2017-09-17 04:39:57',3,2);
/*!40000 ALTER TABLE `officer_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisation`
--

LOCK TABLES `organisation` WRITE;
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` VALUES (1,'ສະພາແຫ່ງຊາດ',0,1),(2,'ສານປະຊາຊົນສູງສຸດ',0,2);
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phiscal_year`
--

DROP TABLE IF EXISTS `phiscal_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phiscal_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) DEFAULT NULL COMMENT 'o:openning\nc:closed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phiscal_year`
--

LOCK TABLES `phiscal_year` WRITE;
/*!40000 ALTER TABLE `phiscal_year` DISABLE KEYS */;
INSERT INTO `phiscal_year` VALUES (1,'2017','2017-01-08 00:00:00','2018-01-17 00:00:00',0,'O'),(2,'2018','1970-01-01 00:00:00','1970-01-01 00:00:00',0,'O');
/*!40000 ALTER TABLE `phiscal_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_code` varchar(20) NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `record_status` varchar(1) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`province_name`),
  KEY `fk_province_user` (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'01','ນະຄອນຫລວງວຽງຈັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(2,'02','ຜົ້ງສາລີ',NULL,NULL,'2017-09-01 09:48:56',0,0),(3,'03','ຫຼວງນໍ້າທາ',NULL,NULL,'2017-09-01 09:48:56',0,0),(4,'05','ອຸດົມໄຊ',NULL,NULL,'2017-09-01 09:48:56',0,0),(5,'04','ບໍ່ແກ້ວ',NULL,NULL,'2017-09-01 09:48:56',0,0),(6,'06','ຫຼວງພະບາງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(7,'07','ຫົວພັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(8,'08','ໄຊຍະບູລີ',NULL,NULL,'2017-09-01 09:48:56',0,0),(9,'09','ຊຽງຂວາງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(10,'10','ວຽງຈັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(11,'11','ບໍລິຄໍາໄຊ',NULL,NULL,'2017-09-01 09:48:56',0,0),(12,'12','ຄໍາມ່ວນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(13,'13','ສະຫວັນນະເຂດ',NULL,NULL,'2017-09-01 09:48:56',0,0),(14,'14','ສາລະວັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(15,'15','ເຊກອງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(16,'16','ຈໍາປາສັກ',NULL,NULL,'2017-09-01 09:48:56',0,0),(17,'17','ອັດຕະປື',NULL,NULL,'2017-09-01 09:48:56',0,0),(18,'18','ໄຊສົມບູນ',NULL,NULL,'2017-09-01 09:48:56',0,0);
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator',0),(2,'Admin',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_action`
--

DROP TABLE IF EXISTS `role_has_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_action` (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `allowed` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `fk_role_has_action_action1_idx` (`action_id`),
  KEY `fk_role_has_action_role1_idx` (`role_id`),
  CONSTRAINT `fk_role_has_action_action1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_action_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_action`
--

LOCK TABLES `role_has_action` WRITE;
/*!40000 ALTER TABLE `role_has_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_menu`
--

DROP TABLE IF EXISTS `role_has_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `accessible` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `fk_role_has_menu_menu1_idx` (`menu_id`),
  KEY `fk_role_has_menu_role1_idx` (`role_id`),
  CONSTRAINT `fk_role_has_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_menu_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_menu`
--

LOCK TABLES `role_has_menu` WRITE;
/*!40000 ALTER TABLE `role_has_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_message`
--

DROP TABLE IF EXISTS `source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_source_message_category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_message`
--

LOCK TABLES `source_message` WRITE;
/*!40000 ALTER TABLE `source_message` DISABLE KEYS */;
INSERT INTO `source_message` VALUES (1,'app','Branch Groups'),(2,'app','Create Branch Group'),(3,'app','ID'),(4,'app','Name'),(5,'app','Deleted'),(6,'app','Language'),(7,'app','Translation'),(8,'app','Messages'),(9,'app','Create Message'),(10,'app','Create'),(11,'app','Update {modelClass}: '),(12,'app','Update'),(13,'app','Message'),(14,'app','Action'),(15,'app','Incorrect Requested Params'),(16,'app','Cancel'),(17,'app','Add'),(18,'app','Success'),(19,'app','Error'),(20,'app','Operation Successful'),(21,'app','test'),(22,'app','tetas'),(23,'app','sdaf'),(24,'app','sfadfsdf'),(25,'app','xxx'),(26,'app','cc'),(27,'app','adasd'),(28,'app','ee'),(29,'app','eedd'),(30,'app','gg'),(32,'app','pp'),(33,'app','Branches'),(34,'app','Create Branch'),(35,'app','Code'),(36,'app','Address'),(37,'app','Tel'),(38,'app','Branch Group ID'),(39,'app','Goverment Unit'),(40,'app','Phiscal Years'),(41,'app','Create Phiscal Year'),(42,'app','Year'),(43,'app','Start Date'),(44,'app','End Date'),(45,'app','Status'),(46,'app','Closed'),(47,'app','Opening'),(48,'app','Delete'),(49,'app','Are you sure you want to delete this item?'),(50,'app','Operation Success'),(51,'app','Date'),(52,'app','Phiscal Year'),(53,'app','Administration'),(54,'app','Dashboard'),(55,'app','Ministry'),(56,'app','Ministry Group'),(57,'app','Goverment Level'),(58,'app','Govermentlevels'),(59,'app','Create Govermentlevel'),(60,'app','New'),(61,'app','Save'),(62,'app','List'),(63,'app','New/Update'),(64,'app','Select'),(65,'app','Total'),(66,'app','Rows'),(67,'app','Row(s)'),(68,'app','New/Save'),(69,'app','Successful'),(70,'app','NO'),(71,'app','YES'),(72,'app','USERNAME'),(73,'app','PASSWORD'),(74,'app','Branch ID'),(75,'app','Effective Date'),(76,'app','User ID'),(77,'app','Last Update'),(78,'app','Phiscal Year ID'),(79,'app','Statistics'),(80,'app','Goverment Units'),(81,'app','No.'),(82,'app','Remark'),(83,'app','Statistics of Goverment Unit '),(84,'app','Select Phiscal Year'),(85,'app','Incorrect Phiscal Year'),(86,'app','Go Back'),(87,'app','Owner'),(88,'app','Operation Successfule'),(89,'app','Saved'),(90,'app','Goverment Level ID'),(91,'app','Value'),(92,'app','Stat Goverment Unit ID'),(93,'app','No Data'),(101,'app','Group'),(102,'app','Department'),(103,'app','Insitute'),(104,'app','Center'),(105,'app','Institute'),(106,'app','Create Stat Goverment Unit'),(107,'app','Stat Goverment Units'),(108,'app','Stat Goverment Unit'),(109,'app','-'),(110,'app','Office'),(111,'app','Position'),(112,'app','Stat Single Gateway Implementations'),(113,'app','Statistics of Single Gateway Implementations'),(114,'app','Service Unit Name'),(115,'app','Statistics of Goverment Structure'),(116,'app','Ministries'),(117,'app','Single Gateway Implementations'),(118,'app','Legals'),(119,'app','Legal Type'),(120,'app','Legal'),(121,'app','The Year is not allowed to input'),(122,'app','Improve'),(123,'app','Publish'),(124,'app','Statistics of Internal Legal'),(125,'app','Legal Types'),(126,'app','Create Legal Type'),(127,'app','Create Legal'),(128,'app','Legal Type ID'),(131,'app','Dashboad'),(132,'app','Level'),(133,'app','Ministry ID'),(134,'app','Province ID'),(135,'app','Approver Level ID'),(136,'app','Approver Level'),(137,'app','approver'),(138,'app','Approvers'),(139,'app','Create Approver'),(140,'app','Approver Levels'),(141,'app','Create Approver Level'),(142,'app','Province'),(143,'app','Stat Association Foundation'),(144,'app','Settings'),(145,'app','Stat Association Foundations'),(146,'app','Statistics of Associations/Foundations'),(147,'app','Association'),(148,'app','Foundation'),(149,'app','Accociations'),(150,'app','Foundations'),(151,'app','Stat Local Administration'),(152,'app','Stat Local Admins'),(153,'app','Province Head'),(154,'app','Province Vice'),(155,'app','District Head'),(156,'app','District Vice'),(157,'app','T'),(158,'app','W'),(159,'app','Village Head'),(160,'app','Village Vice'),(161,'app','Population'),(162,'app','Village'),(163,'app','Family'),(164,'app','P'),(165,'app','Statistics of Local Administration'),(166,'app','Association Foundation'),(167,'app','Local Administration'),(168,'app','Religion Teacher'),(169,'app','Population Movement'),(170,'app','Stat Population Movements'),(171,'app','District'),(172,'app','Born'),(173,'app','Die'),(174,'app','Married'),(175,'app','Divorced'),(176,'app','Move-In'),(177,'app','Move-out'),(178,'app','Real'),(179,'app','Statistics of Population Movement'),(180,'app','Stat Religion Teachers'),(181,'app','Buddhism'),(182,'app','Monk'),(183,'app','Novice'),(184,'app','Buddhis Dad'),(185,'app','Buddhis Mom'),(186,'app','Buddhis Boy'),(187,'app','Christian'),(188,'app','Bahaiy'),(189,'app','Idslam'),(190,'app','News'),(191,'app','Saturday'),(192,'app','Catolic'),(193,'app','Statistics of Religion Teacher'),(194,'app','Comparations of Population Movement'),(195,'app','Inquiry'),(196,'app','Women'),(197,'app','The Chart of Population Movement Yearly'),(198,'app','Ethnic Statistic'),(199,'app','Ethic'),(200,'app','Stat Ethnics'),(201,'app','Enthnic'),(202,'app','Search'),(203,'app','Statistics of Ehtnics'),(204,'app','Ethnics'),(205,'app','Create Ethnic'),(206,'app','Ethnic'),(207,'app','Incorrect Request Method'),(208,'app','Religion & Other Believes'),(209,'app','Statistics of Religions & Other Believes'),(210,'app','Others'),(211,'app','Other'),(212,'app','The Chart of Religions & Other Believes'),(213,'app','Christ'),(214,'app','The Chart of Religions Teacher'),(215,'app','Religion Place'),(216,'app','Stat Religion Places'),(217,'app','Temple'),(218,'app','No Monk'),(219,'app','Sim'),(220,'app','No Sim'),(221,'app','Not'),(222,'app','N'),(223,'app','The Chart of Religions Places'),(224,'app','Statistics of Religion Place'),(225,'app','Bahai'),(226,'app','Officer'),(227,'app','Overall Officer'),(228,'app','Stat Officers'),(229,'app','Create Stat Officer'),(230,'app','Statistics of Officers'),(231,'app','Overall Officers'),(232,'app','Description'),(233,'app','No. of officers'),(234,'app','Men'),(235,'app','Ministry Level'),(236,'app','Local Level'),(237,'app','Province Department'),(238,'app','District Office'),(239,'app','Officers By Ages'),(240,'app','Stat Officer Ages'),(241,'app','Statistics of Officers By Ages'),(242,'app','Officers By Degrees'),(243,'app','Stat Officer Degrees'),(244,'app','Doctor'),(245,'app','Post Master'),(246,'app','Master'),(247,'app','Post Bachelor'),(248,'app','Bachelor'),(249,'app','High'),(250,'app','Middle'),(251,'app','Begin'),(252,'app','No Degree'),(253,'app','Retire'),(254,'app','Bumnet'),(255,'app','Leave'),(256,'app','Fire'),(257,'app','Resign'),(258,'app','Lose'),(259,'app','Move to SOE'),(260,'app','Moveto Ministry'),(261,'app','Move-In Ministry'),(262,'app','Officers Resignation'),(263,'app','Stat Officer Resigns'),(264,'app','Officers Add'),(265,'app','Stat Officer Adds'),(266,'app','Create Stat Officer Add'),(267,'app','Statistics of Officers Addition'),(268,'app','By Quota'),(269,'app','From Army'),(270,'app','From SOE'),(271,'app','Officers Addition'),(272,'app','Officers Contract'),(273,'app','Stat Officer Contracts'),(274,'app','Admin Approve'),(275,'app','Admin Non Approve'),(276,'app','Officer Approve'),(277,'app','Officer Non Approve'),(278,'app','Administration By Contract'),(279,'app','Officers By Contract'),(280,'app','Officers Approve'),(281,'app','Officers Non Approve'),(282,'app','Officers Positions'),(283,'app','Stat Officer Positions'),(284,'app','Statistics of Officers By Positions'),(285,'app','Statistics Officer Positions'),(286,'app','Officers Needed'),(287,'app','Stat Officer Needs'),(288,'app','Needed Plan'),(289,'app','Officers Ministry'),(290,'app','Stat Officer Ministries'),(293,'app','Organisation'),(294,'app','Organisations'),(295,'app','Create Organisation'),(296,'app','Officers Organisation'),(297,'app','Stat Officer Organisations'),(298,'app','Officers Province'),(299,'app','Stat Officer Provinces'),(300,'app','Officers Ministry Add'),(301,'app','Stat Officer Ministries Add/Resign'),(302,'app','Officers Organisation Add'),(303,'app','Stat Officer Organisations Add/Resign'),(308,'app','Officers Province Add'),(309,'app','Stat Officer Province Adds'),(310,'app','Create Stat Officer Province Add'),(311,'app','Stat Officer Provinces Add/Resign'),(312,'app','Officers Ministry Train'),(313,'app','Technical Trainning'),(314,'app','Theory Trainning'),(315,'app','Local'),(316,'app','Oversea'),(317,'app','Stat Officer Province Trains'),(318,'app','Create Stat Officer Province Train'),(319,'app','Add/Resign'),(320,'app','Training'),(321,'app','Officers Province Train'),(322,'app','Statistics of Tranining of Ministry Officers '),(330,'app','Officers Organisation Train'),(331,'app','Stat Officer Org Trains'),(332,'app','Create Stat Officer Org Train'),(333,'app','Statistics of Tranining of Province Officers '),(334,'app','Upgrade'),(335,'app','Officers Ministry Upgrade'),(336,'app','Officers Organisation Upgrade'),(337,'app','Officers Province Upgrade'),(338,'app','Statistics of Tranining of Organisation Officers '),(339,'app','Stat Officer Province Upgrades'),(340,'app','Create Stat Officer Province Upgrade'),(341,'app','Stat Officer Provinces Traning'),(342,'app','Stat Officer Provinces Upgrade'),(343,'app','Statistics of Upgrading of Province Officers '),(344,'app','The Chart of Officers Province Training'),(345,'app','Organisation Officer Upgrading'),(346,'app','Doctor Local'),(347,'app','Doctor Oversea'),(348,'app','Master Local'),(349,'app','Master Oversea'),(350,'app','Bachelor Local'),(351,'app','Bachelor Oversea'),(352,'app','High Local'),(353,'app','High Oversea'),(354,'app','Middle Local'),(355,'app','Middle Oversea'),(356,'app','Begin Local'),(357,'app','Begin Oversea'),(358,'app','Stat Course ID'),(359,'app','Course'),(360,'app','Stat Courses'),(361,'app','Create Stat Course'),(362,'app','Statistics of Officer Training Course Development'),(363,'app','Parent'),(364,'app','Table of statistic of officer training course'),(365,'app','Insitutution Training'),(366,'app','Stat Institute Trains'),(367,'app','Title'),(368,'app','Cooperator'),(369,'app','Times'),(370,'app','Place'),(371,'app','Statistics of Institution Training'),(372,'app','Attendance'),(374,'app','Insitutution Meeting'),(375,'app','Stat Institute Meetings'),(376,'app','Create Stat Institute Meeting'),(377,'app','Statistics of Institution Meeting'),(378,'app','The Chart of Officers Organisation Training'),(379,'app','Technical Local'),(380,'app','Technical Oversea'),(381,'app','Theory Local'),(382,'app','Theory Oversea'),(383,'app','Ministry Officer Upgrading'),(384,'app','Research'),(385,'app','Stat Researches'),(386,'app','Create Stat Research'),(387,'app','Stat Researchs'),(388,'app','Goverment'),(389,'app','Dornor'),(390,'app','Scholarship'),(391,'app','Attendee'),(392,'app','Statistics of Research'),(393,'app',''),(394,'app','Performance'),(395,'app','Stat Highcoin Ministries'),(396,'app','Create Stat Highcoin Ministry'),(398,'app','Awards'),(399,'app','Create Award'),(400,'app','Award'),(437,'app','Statistics of Highcoin Ministry'),(438,'app','Stat Hornorcoin Provinces'),(439,'app','Create Stat Hornorcoin Province'),(440,'app','Stat Hornorcoin Ministries'),(441,'app','Statistics of Hornor Coin Province'),(442,'app','Stat Victorycoin Ministries'),(443,'app','Stat Victorycoin Provinces'),(444,'app','Statistics of Highcoin Province'),(445,'app','Stat Govcoin Ministries'),(446,'app','Create Stat Govcoin Ministry'),(447,'app','Stat Goverment Coin Ministries'),(448,'app','Stat Victoryoversea Ministries'),(477,'app','Stat Victoryoversea Provinces'),(478,'app','Create Stat Victoryoversea Province'),(479,'app','Stat Goverment Oversea Ministries'),(480,'app','Statistics of Govoversea Ministry'),(481,'app','Stat Govcoin Provinces'),(482,'app','Create Stat Govcoin Province'),(483,'app','Stat Goverment Coin Provinces'),(484,'app','Statistics of GovCoin Province'),(485,'app','Stat Goverment Oversea Provinces'),(486,'app','Statistics of GovOversea Province'),(487,'app','Document'),(488,'app','Stat Documents'),(489,'app','Create Stat Document'),(490,'app','Section'),(491,'app','Book Type'),(492,'app','Books'),(493,'app','Create Book'),(500,'app','Bad Request'),(501,'app','Stat Copies'),(502,'app','Activity'),(503,'app','ໄລຍະເວລາຈັດຕັ້ງປະຕິບັດ'),(504,'app','Summary'),(505,'app','Stat Map Services'),(506,'app','Statistics of Map Service'),(507,'app','Stat Map Produces'),(508,'app','Stat Explores'),(514,'app','Officer Levels'),(515,'app','Create Officer Level'),(516,'app','Stat Officer Salaries'),(517,'app','Statistics of Officers by Salary Level'),(518,'app','Stat Officer Age Levels'),(519,'app','Create Stat Officer Age Level'),(520,'app','Statistics of Officers by Degree'),(521,'app','Stat Officer Ministries Upgrade'),(522,'app','The Chart of Officers Ministry Training');
/*!40000 ALTER TABLE `source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_association_foundation`
--

DROP TABLE IF EXISTS `stat_association_foundation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_association_foundation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_association_foundation_user1_idx` (`user_id`),
  KEY `fk_stat_association_foundation_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_association_foundation_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_association_foundation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_association_foundation`
--

LOCK TABLES `stat_association_foundation` WRITE;
/*!40000 ALTER TABLE `stat_association_foundation` DISABLE KEYS */;
INSERT INTO `stat_association_foundation` VALUES (1,'2017-09-05 16:57:13',2,1,1);
/*!40000 ALTER TABLE `stat_association_foundation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_association_foundation_detail`
--

DROP TABLE IF EXISTS `stat_association_foundation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_association_foundation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association` int(11) DEFAULT NULL,
  `foundation` int(11) DEFAULT NULL,
  `remark` text,
  `stat_association_foundation_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_association_foundation_detail_stat_association_foun_idx` (`stat_association_foundation_id`),
  KEY `fk_stat_association_foundation_detail_approver1_idx` (`approver_id`),
  CONSTRAINT `fk_stat_association_foundation_detail_approver1` FOREIGN KEY (`approver_id`) REFERENCES `approver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_association_foundation_detail_stat_association_founda1` FOREIGN KEY (`stat_association_foundation_id`) REFERENCES `stat_association_foundation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_association_foundation_detail`
--

LOCK TABLES `stat_association_foundation_detail` WRITE;
/*!40000 ALTER TABLE `stat_association_foundation_detail` DISABLE KEYS */;
INSERT INTO `stat_association_foundation_detail` VALUES (1,2,4,'sdgasg',1,1),(2,23,1,'sdgkal',1,2),(3,6,4,'4',1,4),(4,2,3,NULL,1,3);
/*!40000 ALTER TABLE `stat_association_foundation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_copy`
--

DROP TABLE IF EXISTS `stat_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_copy_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_copy_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_copy_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_copy_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_copy`
--

LOCK TABLES `stat_copy` WRITE;
/*!40000 ALTER TABLE `stat_copy` DISABLE KEYS */;
INSERT INTO `stat_copy` VALUES (1,'2017-09-16 20:14:35',1,1,2);
/*!40000 ALTER TABLE `stat_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_copy_detail`
--

DROP TABLE IF EXISTS `stat_copy_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_copy_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_copy_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_copy_detail_stat_copy1_idx` (`stat_copy_id`),
  CONSTRAINT `fk_stat_copy_detail_stat_copy1` FOREIGN KEY (`stat_copy_id`) REFERENCES `stat_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_copy_detail`
--

LOCK TABLES `stat_copy_detail` WRITE;
/*!40000 ALTER TABLE `stat_copy_detail` DISABLE KEYS */;
INSERT INTO `stat_copy_detail` VALUES (2,1,'ວຽກງານວິສຫວເັ',2015,2016,'fsklajfkjljk','sss'),(4,1,'ວຽກງານວິສຫວເັ',2015,2016,'fsklajfkjljk','sss');
/*!40000 ALTER TABLE `stat_copy_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_course`
--

DROP TABLE IF EXISTS `stat_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `stat_course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_course_user1_idx` (`user_id`),
  KEY `fk_stat_course_stat_course1_idx` (`stat_course_id`),
  CONSTRAINT `fk_stat_course_stat_course1` FOREIGN KEY (`stat_course_id`) REFERENCES `stat_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_course_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_course`
--

LOCK TABLES `stat_course` WRITE;
/*!40000 ALTER TABLE `stat_course` DISABLE KEYS */;
INSERT INTO `stat_course` VALUES (1,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)',0,1,'2017-09-14 15:00:58',2,NULL),(2,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)',0,1,'2017-09-14 15:01:06',2,NULL),(3,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)',0,1,'2017-09-14 15:01:33',2,NULL);
/*!40000 ALTER TABLE `stat_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_document`
--

DROP TABLE IF EXISTS `stat_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_document_user1_idx` (`user_id`),
  KEY `fk_stat_document_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_document_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_document_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_document`
--

LOCK TABLES `stat_document` WRITE;
/*!40000 ALTER TABLE `stat_document` DISABLE KEYS */;
INSERT INTO `stat_document` VALUES (2,'2017-09-16 19:15:29',1,2,1);
/*!40000 ALTER TABLE `stat_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_document_detail`
--

DROP TABLE IF EXISTS `stat_document_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_document_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_document_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `before` int(11) DEFAULT NULL,
  `after` int(11) DEFAULT NULL,
  `after_new` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_document_detail_stat_document1_idx` (`stat_document_id`),
  KEY `fk_stat_document_detail_province1_idx` (`province_id`),
  KEY `fk_stat_document_detail_ministry1_idx` (`ministry_id`),
  KEY `fk_stat_document_detail_organisation1_idx` (`organisation_id`),
  KEY `fk_stat_document_detail_book1_idx` (`book_id`),
  CONSTRAINT `fk_stat_document_detail_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_document_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_document_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_document_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_document_detail_stat_document1` FOREIGN KEY (`stat_document_id`) REFERENCES `stat_document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_document_detail`
--

LOCK TABLES `stat_document_detail` WRITE;
/*!40000 ALTER TABLE `stat_document_detail` DISABLE KEYS */;
INSERT INTO `stat_document_detail` VALUES (1,2,NULL,1,NULL,NULL,9,8,7,'af'),(2,2,NULL,NULL,1,NULL,1,2,3,'ok'),(3,2,NULL,NULL,2,NULL,3,4,5,'aa'),(4,2,1,NULL,NULL,NULL,11,22,33,'xasgd'),(5,2,2,NULL,NULL,NULL,66,77,88,'kko'),(6,2,NULL,NULL,NULL,1,7350,NULL,NULL,NULL),(7,2,NULL,NULL,NULL,2,NULL,2000,743,'afasf');
/*!40000 ALTER TABLE `stat_document_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_ethnic`
--

DROP TABLE IF EXISTS `stat_ethnic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_ethnic_user1_idx` (`user_id`),
  KEY `fk_stat_ethnic_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_ethnic_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_ethnic_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_ethnic`
--

LOCK TABLES `stat_ethnic` WRITE;
/*!40000 ALTER TABLE `stat_ethnic` DISABLE KEYS */;
INSERT INTO `stat_ethnic` VALUES (1,'2017-09-09',1,2,1);
/*!40000 ALTER TABLE `stat_ethnic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_ethnic_detail`
--

DROP TABLE IF EXISTS `stat_ethnic_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_ethnic_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `ethnic_id` int(11) NOT NULL,
  `stat_ethnic_id` int(11) NOT NULL,
  `women` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_ethnic_detail_ethnic1_idx` (`ethnic_id`),
  KEY `fk_stat_ethnic_detail_stat_ethnic1_idx` (`stat_ethnic_id`),
  KEY `fk_stat_ethnic_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_ethnic_detail_ethnic1` FOREIGN KEY (`ethnic_id`) REFERENCES `ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_ethnic_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_ethnic_detail_stat_ethnic1` FOREIGN KEY (`stat_ethnic_id`) REFERENCES `stat_ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_ethnic_detail`
--

LOCK TABLES `stat_ethnic_detail` WRITE;
/*!40000 ALTER TABLE `stat_ethnic_detail` DISABLE KEYS */;
INSERT INTO `stat_ethnic_detail` VALUES (1,5,1,1,3,1),(2,7,2,1,4,1),(3,2,3,1,1,1),(4,8,1,1,2,2);
/*!40000 ALTER TABLE `stat_ethnic_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_explore`
--

DROP TABLE IF EXISTS `stat_explore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_explore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_explore_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_explore_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_explore_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_explore_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_explore`
--

LOCK TABLES `stat_explore` WRITE;
/*!40000 ALTER TABLE `stat_explore` DISABLE KEYS */;
INSERT INTO `stat_explore` VALUES (2,'2017-09-16 21:44:06',1,1,2);
/*!40000 ALTER TABLE `stat_explore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_explore_detail`
--

DROP TABLE IF EXISTS `stat_explore_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_explore_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `stat_explore_id` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `hm` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_explore_detail_province1_idx` (`province_id`),
  KEY `fk_stat_explore_detail_stat_explore1_idx` (`stat_explore_id`),
  CONSTRAINT `fk_stat_explore_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_explore_detail_stat_explore1` FOREIGN KEY (`stat_explore_id`) REFERENCES `stat_explore` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_explore_detail`
--

LOCK TABLES `stat_explore_detail` WRITE;
/*!40000 ALTER TABLE `stat_explore_detail` DISABLE KEYS */;
INSERT INTO `stat_explore_detail` VALUES (1,1,2,92,83,73,63,'ccc'),(2,2,2,1,2,3,4,'dada'),(3,3,2,1122,3344,5566,7788,'hhh'),(4,4,2,99,88,77,66,'sss'),(5,5,2,999,888,777,666,'sss'),(6,7,2,11,22,33,44,'asdad'),(7,8,2,91,81,71,61,'xxx');
/*!40000 ALTER TABLE `stat_explore_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govcoin_ministry`
--

DROP TABLE IF EXISTS `stat_govcoin_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govcoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_govcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_govcoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_ministry`
--

LOCK TABLES `stat_govcoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_govcoin_ministry` VALUES (1,'2017-09-16 11:26:57',1,2,1);
/*!40000 ALTER TABLE `stat_govcoin_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govcoin_ministry_detail`
--

DROP TABLE IF EXISTS `stat_govcoin_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govcoin_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_govcoin_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `labo_personal` int(11) DEFAULT NULL,
  `labo_team` int(11) DEFAULT NULL,
  `deve_personal` int(11) DEFAULT NULL,
  `deve_team` int(11) DEFAULT NULL,
  `memo_personal` int(11) DEFAULT NULL,
  `memo_team` int(11) DEFAULT NULL,
  `amer_personal` int(11) DEFAULT NULL,
  `amer_team` int(11) DEFAULT NULL,
  `fran_personal` int(11) DEFAULT NULL,
  `fran_team` int(11) DEFAULT NULL,
  `gove_personal` int(11) DEFAULT NULL,
  `gove_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_ministry_detail_stat_govcoin_ministry1_idx` (`stat_govcoin_ministry_id`),
  KEY `fk_stat_govcoin_ministry_detail_ministry1_idx` (`ministry_id`),
  KEY `fk_stat_govcoin_ministry_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_govcoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_ministry_detail_stat_govcoin_ministry1` FOREIGN KEY (`stat_govcoin_ministry_id`) REFERENCES `stat_govcoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_ministry_detail`
--

LOCK TABLES `stat_govcoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_govcoin_ministry_detail` VALUES (1,1,1,6,55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,70,NULL,'kk'),(2,1,2,6,743,29,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,389,12,NULL);
/*!40000 ALTER TABLE `stat_govcoin_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govcoin_province`
--

DROP TABLE IF EXISTS `stat_govcoin_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govcoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_province_user1_idx` (`user_id`),
  KEY `fk_stat_govcoin_province_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_govcoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_province`
--

LOCK TABLES `stat_govcoin_province` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_province` DISABLE KEYS */;
INSERT INTO `stat_govcoin_province` VALUES (1,'2017-09-16 15:47:14',1,2,1);
/*!40000 ALTER TABLE `stat_govcoin_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govcoin_province_detail`
--

DROP TABLE IF EXISTS `stat_govcoin_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govcoin_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labo_personal` int(11) DEFAULT NULL,
  `labo_team` int(11) DEFAULT NULL,
  `deve_personal` int(11) DEFAULT NULL,
  `deve_team` int(11) DEFAULT NULL,
  `memo_personal` int(11) DEFAULT NULL,
  `memo_team` int(11) DEFAULT NULL,
  `amer_personal` int(11) DEFAULT NULL,
  `amer_team` int(11) DEFAULT NULL,
  `fran_personal` int(11) DEFAULT NULL,
  `fran_team` int(11) DEFAULT NULL,
  `gove_personal` int(11) DEFAULT NULL,
  `gove_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `award_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `stat_govcoin_province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_province_detail_award1_idx` (`award_id`),
  KEY `fk_stat_govcoin_province_detail_province1_idx` (`province_id`),
  KEY `fk_stat_govcoin_province_detail_stat_govcoin_province1_idx` (`stat_govcoin_province_id`),
  CONSTRAINT `fk_stat_govcoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govcoin_province_detail_stat_govcoin_province1` FOREIGN KEY (`stat_govcoin_province_id`) REFERENCES `stat_govcoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_province_detail`
--

LOCK TABLES `stat_govcoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_province_detail` DISABLE KEYS */;
INSERT INTO `stat_govcoin_province_detail` VALUES (1,99,88,77,66,55,44,33,22,11,1,2,3,'asf',2,1,1),(2,1,2,3,4,5,6,7,8,9,0,11,22,'oiuo',3,1,1);
/*!40000 ALTER TABLE `stat_govcoin_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_goverment_unit`
--

DROP TABLE IF EXISTS `stat_goverment_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_goverment_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_statistic1_user1_idx` (`user_id`),
  KEY `fk_stat_goverment_unit_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_goverment_unit_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_statistic1_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_goverment_unit`
--

LOCK TABLES `stat_goverment_unit` WRITE;
/*!40000 ALTER TABLE `stat_goverment_unit` DISABLE KEYS */;
INSERT INTO `stat_goverment_unit` VALUES (2,2,'2017-09-04 14:58:36',1,1),(3,NULL,'2017-09-02 08:55:24',0,2);
/*!40000 ALTER TABLE `stat_goverment_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_goverment_unit_detail`
--

DROP TABLE IF EXISTS `stat_goverment_unit_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_goverment_unit_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` int(11) DEFAULT NULL,
  `insitute` int(11) DEFAULT NULL,
  `center` int(11) DEFAULT NULL,
  `stat_goverment_unit_id` int(11) NOT NULL,
  `remark` text,
  `office` int(11) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_goverment_unit_detail_stat_goverment_unit1_idx` (`stat_goverment_unit_id`),
  KEY `fk_stat_goverment_unit_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_goverment_unit_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_goverment_unit_detail_stat_goverment_unit1` FOREIGN KEY (`stat_goverment_unit_id`) REFERENCES `stat_goverment_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_goverment_unit_detail`
--

LOCK TABLES `stat_goverment_unit_detail` WRITE;
/*!40000 ALTER TABLE `stat_goverment_unit_detail` DISABLE KEYS */;
INSERT INTO `stat_goverment_unit_detail` VALUES (1,11,22,33,2,'sss',NULL,0),(2,NULL,NULL,NULL,3,NULL,NULL,0),(3,32,2,3,2,'sags',NULL,0),(4,2,22,4,2,NULL,1,0),(5,1,2,3,2,NULL,3,0),(6,1,3,1,2,'ເຫັກເັຫເັຫ',2,1),(7,2,1,3,2,'xx',1,2);
/*!40000 ALTER TABLE `stat_goverment_unit_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govoversea_ministry`
--

DROP TABLE IF EXISTS `stat_govoversea_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_govoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_govoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_ministry`
--

LOCK TABLES `stat_govoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_govoversea_ministry` VALUES (1,'2017-09-16 15:13:00',1,2,1);
/*!40000 ALTER TABLE `stat_govoversea_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govoversea_ministry_detail`
--

DROP TABLE IF EXISTS `stat_govoversea_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govoversea_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_govoversea_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `labo_personal` int(11) DEFAULT NULL,
  `labo_team` int(11) DEFAULT NULL,
  `deve_personal` int(11) DEFAULT NULL,
  `deve_team` int(11) DEFAULT NULL,
  `memo_personal` int(11) DEFAULT NULL,
  `memo_team` int(11) DEFAULT NULL,
  `amer_personal` int(11) DEFAULT NULL,
  `amer_team` int(11) DEFAULT NULL,
  `fran_personal` int(11) DEFAULT NULL,
  `fran_team` int(11) DEFAULT NULL,
  `gove_personal` int(11) DEFAULT NULL,
  `gove_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_ministry_detail_stat_govoversea_ministry_idx` (`stat_govoversea_ministry_id`),
  KEY `fk_stat_govoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  KEY `fk_stat_govoversea_ministry_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_govoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_ministry_detail_stat_govoversea_ministry1` FOREIGN KEY (`stat_govoversea_ministry_id`) REFERENCES `stat_govoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_ministry_detail`
--

LOCK TABLES `stat_govoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_govoversea_ministry_detail` VALUES (1,1,1,2,10,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,1,'່່ຫສັເາ່'),(2,1,2,3,11,22,33,44,55,66,77,88,99,1,2,3,'hj');
/*!40000 ALTER TABLE `stat_govoversea_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govoversea_province`
--

DROP TABLE IF EXISTS `stat_govoversea_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govoversea_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_govoversea_province_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_govoversea_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_province`
--

LOCK TABLES `stat_govoversea_province` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_province` DISABLE KEYS */;
INSERT INTO `stat_govoversea_province` VALUES (1,'2017-09-16 15:56:38',1,1,2);
/*!40000 ALTER TABLE `stat_govoversea_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_govoversea_province_detail`
--

DROP TABLE IF EXISTS `stat_govoversea_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_govoversea_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_govoversea_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `labo_personal` int(11) DEFAULT NULL,
  `labo_team` int(11) DEFAULT NULL,
  `deve_personal` int(11) DEFAULT NULL,
  `deve_team` int(11) DEFAULT NULL,
  `memo_personal` int(11) DEFAULT NULL,
  `memo_team` int(11) DEFAULT NULL,
  `amer_personal` int(11) DEFAULT NULL,
  `amer_team` int(11) DEFAULT NULL,
  `fran_personal` int(11) DEFAULT NULL,
  `fran_team` int(11) DEFAULT NULL,
  `gove_personal` int(11) DEFAULT NULL,
  `gove_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_province_detail_stat_govoversea_province_idx` (`stat_govoversea_province_id`),
  KEY `fk_stat_govoversea_province_detail_province1_idx` (`province_id`),
  KEY `fk_stat_govoversea_province_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_govoversea_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_govoversea_province_detail_stat_govoversea_province1` FOREIGN KEY (`stat_govoversea_province_id`) REFERENCES `stat_govoversea_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_province_detail`
--

LOCK TABLES `stat_govoversea_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_province_detail` DISABLE KEYS */;
INSERT INTO `stat_govoversea_province_detail` VALUES (1,1,1,2,1,2,3,4,5,6,7,8,9,0,99,88,'າາ'),(2,1,2,6,6,5,5,4,3,21,8,9,0,11,22,33,'7');
/*!40000 ALTER TABLE `stat_govoversea_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_highcoin_ministry`
--

DROP TABLE IF EXISTS `stat_highcoin_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_highcoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_highcoin_ministry_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_highcoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highcoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highcoin_ministry`
--

LOCK TABLES `stat_highcoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_highcoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_highcoin_ministry` VALUES (5,'2017-09-15 20:18:39',1,1,2);
/*!40000 ALTER TABLE `stat_highcoin_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_highcoin_ministry_detail`
--

DROP TABLE IF EXISTS `stat_highcoin_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_highcoin_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gold_personal` int(11) DEFAULT NULL,
  `gold_team` int(11) DEFAULT NULL,
  `hero_personal` int(11) DEFAULT NULL,
  `hero_team` int(11) DEFAULT NULL,
  `knight_personal` int(11) DEFAULT NULL,
  `knight_team` int(11) DEFAULT NULL,
  `labor_personal` int(11) DEFAULT NULL,
  `labor_team` int(11) DEFAULT NULL,
  `dev_personal` int(11) DEFAULT NULL,
  `dev_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `stat_highcoin_ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highcoin_ministry_detail_stat_highcoin_ministry1_idx` (`stat_highcoin_ministry_id`),
  KEY `fk_stat_highcoin_ministry_detail_award1_idx` (`award_id`),
  KEY `fk_stat_highcoin_ministry_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_highcoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highcoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highcoin_ministry_detail_stat_highcoin_ministry1` FOREIGN KEY (`stat_highcoin_ministry_id`) REFERENCES `stat_highcoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highcoin_ministry_detail`
--

LOCK TABLES `stat_highcoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_highcoin_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_highcoin_ministry_detail` VALUES (1,9,8,7,6,5,4,3,2,1,0,'kk',5,2,1),(2,1,2,3,4,5,6,7,8,9,10,'oo',5,2,2),(5,5,4,3,2,1,0,9,8,7,6,'5',5,3,1);
/*!40000 ALTER TABLE `stat_highcoin_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_highoversea_ministry`
--

DROP TABLE IF EXISTS `stat_highoversea_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_highoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_highoversea_ministry_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_highoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highoversea_ministry`
--

LOCK TABLES `stat_highoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_highoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_highoversea_ministry` VALUES (1,'2017-09-16 11:54:37',1,1,2);
/*!40000 ALTER TABLE `stat_highoversea_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_highoversea_ministry_detail`
--

DROP TABLE IF EXISTS `stat_highoversea_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_highoversea_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_highoversea_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `gold_personal` int(11) DEFAULT NULL,
  `gold_team` int(11) DEFAULT NULL,
  `lanx_personal` int(11) DEFAULT NULL,
  `lanx_team` int(11) DEFAULT NULL,
  `hono_personal` int(11) DEFAULT NULL,
  `hono_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highoversea_ministry_detail_stat_highoversea_minist_idx` (`stat_highoversea_ministry_id`),
  KEY `fk_stat_highoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  KEY `fk_stat_highoversea_ministry_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_highoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_highoversea_ministry_detail_stat_highoversea_ministry1` FOREIGN KEY (`stat_highoversea_ministry_id`) REFERENCES `stat_highoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highoversea_ministry_detail`
--

LOCK TABLES `stat_highoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_highoversea_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_highoversea_ministry_detail` VALUES (1,1,1,2,9,8,7,6,5,4,'zxvz'),(2,1,1,3,6,5,4,3,2,1,'nmbmn');
/*!40000 ALTER TABLE `stat_highoversea_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_hornorcoin_province`
--

DROP TABLE IF EXISTS `stat_hornorcoin_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_hornorcoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_hornorcoin_province_user1_idx` (`user_id`),
  KEY `fk_stat_hornorcoin_province_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_hornorcoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_hornorcoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hornorcoin_province`
--

LOCK TABLES `stat_hornorcoin_province` WRITE;
/*!40000 ALTER TABLE `stat_hornorcoin_province` DISABLE KEYS */;
INSERT INTO `stat_hornorcoin_province` VALUES (1,2,1,'2017-09-16 07:23:53',1);
/*!40000 ALTER TABLE `stat_hornorcoin_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_hornorcoin_province_detail`
--

DROP TABLE IF EXISTS `stat_hornorcoin_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_hornorcoin_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hero_personal` int(11) DEFAULT NULL,
  `hero_team` int(11) DEFAULT NULL,
  `knight_personal` int(11) DEFAULT NULL,
  `knight_team` int(11) DEFAULT NULL,
  `labor_personal` int(11) DEFAULT NULL,
  `labor_team` int(11) DEFAULT NULL,
  `dev_personal` int(11) DEFAULT NULL,
  `dev_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `stat_hornorcoin_province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_hornorcoin_province_detail_province1_idx` (`province_id`),
  KEY `fk_stat_hornorcoin_province_detail_award1_idx` (`award_id`),
  KEY `fk_stat_hornorcoin_province_detail_stat_hornorcoin_province_idx` (`stat_hornorcoin_province_id`),
  CONSTRAINT `fk_stat_hornorcoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_hornorcoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_hornorcoin_province_detail_stat_hornorcoin_province1` FOREIGN KEY (`stat_hornorcoin_province_id`) REFERENCES `stat_hornorcoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hornorcoin_province_detail`
--

LOCK TABLES `stat_hornorcoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_hornorcoin_province_detail` DISABLE KEYS */;
INSERT INTO `stat_hornorcoin_province_detail` VALUES (1,8,7,6,5,4,3,2,1,'zzf',1,2,1),(2,3,4,5,6,7,8,9,0,'kjhfks',1,3,1),(3,99,88,77,66,55,44,33,22,'s',1,4,1),(4,9,8,7,6,5,4,3,2,'1kk',3,6,1);
/*!40000 ALTER TABLE `stat_hornorcoin_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_institute_meeting`
--

DROP TABLE IF EXISTS `stat_institute_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_institute_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_meeting_user1_idx` (`user_id`),
  KEY `fk_stat_institute_meeting_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_institute_meeting_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_institute_meeting_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_meeting`
--

LOCK TABLES `stat_institute_meeting` WRITE;
/*!40000 ALTER TABLE `stat_institute_meeting` DISABLE KEYS */;
INSERT INTO `stat_institute_meeting` VALUES (1,'2017-09-14 17:51:28',1,2,1);
/*!40000 ALTER TABLE `stat_institute_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_institute_meeting_detail`
--

DROP TABLE IF EXISTS `stat_institute_meeting_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_institute_meeting_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `stat_institute_meeting_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_meeting_detail_stat_institute_meeting1_idx` (`stat_institute_meeting_id`),
  CONSTRAINT `fk_stat_institute_meeting_detail_stat_institute_meeting1` FOREIGN KEY (`stat_institute_meeting_id`) REFERENCES `stat_institute_meeting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_meeting_detail`
--

LOCK TABLES `stat_institute_meeting_detail` WRITE;
/*!40000 ALTER TABLE `stat_institute_meeting_detail` DISABLE KEYS */;
INSERT INTO `stat_institute_meeting_detail` VALUES (1,';ksd',72,6,'2017-09-14 00:00:00','2017-09-14 00:00:00',2,'sag',1),(2,'asdg',66,55,'2017-08-29 00:00:00','2017-09-27 00:00:00',4,'asgsg',1);
/*!40000 ALTER TABLE `stat_institute_meeting_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_institute_train`
--

DROP TABLE IF EXISTS `stat_institute_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_institute_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_train_user1_idx` (`user_id`),
  KEY `fk_stat_institute_train_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_institute_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_institute_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_train`
--

LOCK TABLES `stat_institute_train` WRITE;
/*!40000 ALTER TABLE `stat_institute_train` DISABLE KEYS */;
INSERT INTO `stat_institute_train` VALUES (2,'2017-09-14 17:24:35',1,2,1);
/*!40000 ALTER TABLE `stat_institute_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_institute_train_detail`
--

DROP TABLE IF EXISTS `stat_institute_train_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_institute_train_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_institute_train_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `cooperator` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_train_detail_stat_institute_train1_idx` (`stat_institute_train_id`),
  CONSTRAINT `fk_stat_institute_train_detail_stat_institute_train1` FOREIGN KEY (`stat_institute_train_id`) REFERENCES `stat_institute_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_train_detail`
--

LOCK TABLES `stat_institute_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_institute_train_detail` DISABLE KEYS */;
INSERT INTO `stat_institute_train_detail` VALUES (1,2,'k.shgalkj',7,6,'2017-09-05 00:00:00','2017-08-31 00:00:00','dasfs',23,'asdgs'),(2,2,'aaa',7,6,'2017-09-05 00:00:00','2017-08-31 00:00:00','dasfs',23,'asdgs'),(3,2,'sfa',2,1,'2017-09-14 00:00:00','2017-09-14 00:00:00','dasg',2,'124rf');
/*!40000 ALTER TABLE `stat_institute_train_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_legal`
--

DROP TABLE IF EXISTS `stat_legal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_legal_user1_idx` (`user_id`),
  KEY `fk_stat_legal_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_legal_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_legal_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_legal`
--

LOCK TABLES `stat_legal` WRITE;
/*!40000 ALTER TABLE `stat_legal` DISABLE KEYS */;
INSERT INTO `stat_legal` VALUES (20,'2017-09-04 18:12:12',2,1,1);
/*!40000 ALTER TABLE `stat_legal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_legal_detail`
--

DROP TABLE IF EXISTS `stat_legal_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_legal_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new` int(11) DEFAULT NULL,
  `remark` text,
  `improve` int(11) DEFAULT NULL,
  `publish` varchar(255) DEFAULT NULL,
  `stat_legal_id` int(11) NOT NULL,
  `legal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_legal_detail_stat_legal1_idx` (`stat_legal_id`),
  KEY `fk_stat_legal_detail_legal1_idx` (`legal_id`),
  CONSTRAINT `fk_stat_legal_detail_legal1` FOREIGN KEY (`legal_id`) REFERENCES `legal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_legal_detail_stat_legal1` FOREIGN KEY (`stat_legal_id`) REFERENCES `stat_legal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_legal_detail`
--

LOCK TABLES `stat_legal_detail` WRITE;
/*!40000 ALTER TABLE `stat_legal_detail` DISABLE KEYS */;
INSERT INTO `stat_legal_detail` VALUES (1,1,';lk;',0,'k.jnkl',20,1),(2,1,'ll',0,'sdfasf',20,2),(3,1,'iuiyiu',1,'pop',20,3);
/*!40000 ALTER TABLE `stat_legal_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_local_admin`
--

DROP TABLE IF EXISTS `stat_local_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_local_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_local_admin_user1_idx` (`user_id`),
  KEY `fk_stat_local_admin_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_local_admin_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_local_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_local_admin`
--

LOCK TABLES `stat_local_admin` WRITE;
/*!40000 ALTER TABLE `stat_local_admin` DISABLE KEYS */;
INSERT INTO `stat_local_admin` VALUES (8,'2017-09-18 13:09:18',2,1,1),(9,'2017-09-05 19:42:37',2,1,2);
/*!40000 ALTER TABLE `stat_local_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_local_admin_detail`
--

DROP TABLE IF EXISTS `stat_local_admin_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_local_admin_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_local_admin_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `province_head_total` int(11) DEFAULT NULL,
  `province_head_women` int(11) DEFAULT NULL,
  `province_vice_total` int(11) DEFAULT NULL,
  `province_vice_women` int(11) DEFAULT NULL,
  `district_head_total` int(11) DEFAULT NULL,
  `district_head_women` int(11) DEFAULT NULL,
  `district_vice_total` int(11) DEFAULT NULL,
  `district_vice_women` int(11) DEFAULT NULL,
  `village_head_total` int(11) DEFAULT NULL,
  `village_head_women` int(11) DEFAULT NULL,
  `village_vice_total` int(11) DEFAULT NULL,
  `village_vice_women` int(11) DEFAULT NULL,
  `population_total` int(11) DEFAULT NULL,
  `population_women` int(11) DEFAULT NULL,
  `village` int(11) DEFAULT NULL,
  `family_total` int(11) DEFAULT NULL,
  `family_poor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_local_admin_detail_stat_local_admin1_idx` (`stat_local_admin_id`),
  KEY `fk_stat_local_admin_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_local_admin_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_local_admin_detail_stat_local_admin1` FOREIGN KEY (`stat_local_admin_id`) REFERENCES `stat_local_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_local_admin_detail`
--

LOCK TABLES `stat_local_admin_detail` WRITE;
/*!40000 ALTER TABLE `stat_local_admin_detail` DISABLE KEYS */;
INSERT INTO `stat_local_admin_detail` VALUES (1,8,1,3,2,123,1,1,NULL,NULL,NULL,146,NULL,346,NULL,346,NULL,346,NULL,NULL),(2,9,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,8,13,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,8,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,8,4,NULL,NULL,NULL,NULL,34,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,34,4),(6,8,3,8,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stat_local_admin_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_map_produce`
--

DROP TABLE IF EXISTS `stat_map_produce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_map_produce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_produce_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_map_produce_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_map_produce_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_map_produce_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_produce`
--

LOCK TABLES `stat_map_produce` WRITE;
/*!40000 ALTER TABLE `stat_map_produce` DISABLE KEYS */;
INSERT INTO `stat_map_produce` VALUES (1,'2017-09-16 20:58:17',1,1,2);
/*!40000 ALTER TABLE `stat_map_produce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_map_produce_detail`
--

DROP TABLE IF EXISTS `stat_map_produce_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_map_produce_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_map_produce_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_produce_detail_stat_map_produce1_idx` (`stat_map_produce_id`),
  CONSTRAINT `fk_stat_map_produce_detail_stat_map_produce1` FOREIGN KEY (`stat_map_produce_id`) REFERENCES `stat_map_produce` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_produce_detail`
--

LOCK TABLES `stat_map_produce_detail` WRITE;
/*!40000 ALTER TABLE `stat_map_produce_detail` DISABLE KEYS */;
INSERT INTO `stat_map_produce_detail` VALUES (1,1,'ຫຫຫຫ',9817,';kjal;s'),(2,1,'vvv',1111,'aaa');
/*!40000 ALTER TABLE `stat_map_produce_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_map_service`
--

DROP TABLE IF EXISTS `stat_map_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_map_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_service_user1_idx` (`user_id`),
  KEY `fk_stat_map_service_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_map_service_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_map_service_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_service`
--

LOCK TABLES `stat_map_service` WRITE;
/*!40000 ALTER TABLE `stat_map_service` DISABLE KEYS */;
INSERT INTO `stat_map_service` VALUES (1,'2017-09-16 20:48:51',1,2,1);
/*!40000 ALTER TABLE `stat_map_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_map_service_detail`
--

DROP TABLE IF EXISTS `stat_map_service_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_map_service_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_map_service_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_service_detail_stat_map_service1_idx` (`stat_map_service_id`),
  CONSTRAINT `fk_stat_map_service_detail_stat_map_service1` FOREIGN KEY (`stat_map_service_id`) REFERENCES `stat_map_service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_service_detail`
--

LOCK TABLES `stat_map_service_detail` WRITE;
/*!40000 ALTER TABLE `stat_map_service_detail` DISABLE KEYS */;
INSERT INTO `stat_map_service_detail` VALUES (1,1,'bbb',4444,3333,2222,'c');
/*!40000 ALTER TABLE `stat_map_service_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer`
--

DROP TABLE IF EXISTS `stat_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer`
--

LOCK TABLES `stat_officer` WRITE;
/*!40000 ALTER TABLE `stat_officer` DISABLE KEYS */;
INSERT INTO `stat_officer` VALUES (1,'2017-09-09 22:29:51',1,1,2);
/*!40000 ALTER TABLE `stat_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_add`
--

DROP TABLE IF EXISTS `stat_officer_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_add_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_add_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_add`
--

LOCK TABLES `stat_officer_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_add` DISABLE KEYS */;
INSERT INTO `stat_officer_add` VALUES (1,'2017-09-10 10:42:23',1,1,2);
/*!40000 ALTER TABLE `stat_officer_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_add_detail`
--

DROP TABLE IF EXISTS `stat_officer_add_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quota_total` int(11) DEFAULT NULL,
  `quota_women` int(11) DEFAULT NULL,
  `army_total` int(11) DEFAULT NULL,
  `army_women` int(11) DEFAULT NULL,
  `soe_total` int(11) DEFAULT NULL,
  `soe_women` int(11) DEFAULT NULL,
  `stat_officer_add_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_add_detail_stat_officer_add1_idx` (`stat_officer_add_id`),
  CONSTRAINT `fk_stat_officer_add_detail_stat_officer_add1` FOREIGN KEY (`stat_officer_add_id`) REFERENCES `stat_officer_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_add_detail`
--

LOCK TABLES `stat_officer_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_add_detail` VALUES (1,9,8,7,6,5,4,1);
/*!40000 ALTER TABLE `stat_officer_add_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_age`
--

DROP TABLE IF EXISTS `stat_officer_age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_age_user1_idx` (`user_id`),
  KEY `fk_stat_officer_age_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_age_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_age_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_age`
--

LOCK TABLES `stat_officer_age` WRITE;
/*!40000 ALTER TABLE `stat_officer_age` DISABLE KEYS */;
INSERT INTO `stat_officer_age` VALUES (1,'2017-09-09 22:44:00',1,2,2),(2,'2017-09-09 22:44:11',1,2,1);
/*!40000 ALTER TABLE `stat_officer_age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_age_detail`
--

DROP TABLE IF EXISTS `stat_officer_age_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_age_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_age_id` int(11) NOT NULL,
  `total_u25` int(11) DEFAULT NULL,
  `women_u25` int(11) DEFAULT NULL,
  `total_25_30` int(11) DEFAULT NULL,
  `women_25_30` int(11) DEFAULT NULL,
  `total_31_35` int(11) DEFAULT NULL,
  `women_31_35` int(11) DEFAULT NULL,
  `total_36_40` int(11) DEFAULT NULL,
  `women_36_40` int(11) DEFAULT NULL,
  `total_41_45` int(11) DEFAULT NULL,
  `women_41_45` int(11) DEFAULT NULL,
  `total_46_50` int(11) DEFAULT NULL,
  `women_46_50` int(11) DEFAULT NULL,
  `total_51_55` int(11) DEFAULT NULL,
  `women_51_55` int(11) DEFAULT NULL,
  `total_56_60` int(11) DEFAULT NULL,
  `women_56_60` int(11) DEFAULT NULL,
  `total_61u` int(11) DEFAULT NULL,
  `women_61u` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_stat_officer_age1_idx` (`stat_officer_age_id`),
  CONSTRAINT `fk_table1_stat_officer_age1` FOREIGN KEY (`stat_officer_age_id`) REFERENCES `stat_officer_age` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_age_detail`
--

LOCK TABLES `stat_officer_age_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_age_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_age_detail` VALUES (1,1,999,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1),(2,2,99,88,77,66,55,44,33,22,11,9,84,7,6,5,4,3,2,1);
/*!40000 ALTER TABLE `stat_officer_age_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_agelevel`
--

DROP TABLE IF EXISTS `stat_officer_agelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_agelevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_agelevel_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_agelevel_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_agelevel_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_agelevel_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_agelevel`
--

LOCK TABLES `stat_officer_agelevel` WRITE;
/*!40000 ALTER TABLE `stat_officer_agelevel` DISABLE KEYS */;
INSERT INTO `stat_officer_agelevel` VALUES (3,'2017-09-18 16:23:21',1,1,2);
/*!40000 ALTER TABLE `stat_officer_agelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_agelevel_detail`
--

DROP TABLE IF EXISTS `stat_officer_agelevel_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_agelevel_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_agelevel_id` int(11) NOT NULL,
  `officer_level_id` int(11) NOT NULL,
  `total_18` int(11) DEFAULT NULL,
  `women_18` int(11) DEFAULT NULL,
  `total_20` int(11) DEFAULT NULL,
  `women_20` int(11) DEFAULT NULL,
  `total_25` int(11) DEFAULT NULL,
  `women_25` int(11) DEFAULT NULL,
  `total_30` int(11) DEFAULT NULL,
  `women_30` int(11) DEFAULT NULL,
  `total_35` int(11) DEFAULT NULL,
  `women_35` int(11) DEFAULT NULL,
  `total_40` int(11) DEFAULT NULL,
  `women_40` int(11) DEFAULT NULL,
  `total_45` int(11) DEFAULT NULL,
  `women_45` int(11) DEFAULT NULL,
  `total_50` int(11) DEFAULT NULL,
  `women_50` int(11) DEFAULT NULL,
  `total_55` int(11) DEFAULT NULL,
  `women_55` int(11) DEFAULT NULL,
  `total_60` int(11) DEFAULT NULL,
  `women_60` int(11) DEFAULT NULL,
  `total_60p` int(11) DEFAULT NULL,
  `women_60p` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_agelevel_detail_stat_officer_agelevel1_idx` (`stat_officer_agelevel_id`),
  KEY `fk_stat_officer_agelevel_detail_officer_level1_idx` (`officer_level_id`),
  CONSTRAINT `fk_stat_officer_agelevel_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_agelevel_detail_stat_officer_agelevel1` FOREIGN KEY (`stat_officer_agelevel_id`) REFERENCES `stat_officer_agelevel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_agelevel_detail`
--

LOCK TABLES `stat_officer_agelevel_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_agelevel_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_agelevel_detail` VALUES (1,3,1,2,1,9,6,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,2,8,5,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stat_officer_agelevel_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_contract`
--

DROP TABLE IF EXISTS `stat_officer_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_contract_user1_idx` (`user_id`),
  KEY `fk_stat_officer_contract_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_contract_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_contract_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_contract`
--

LOCK TABLES `stat_officer_contract` WRITE;
/*!40000 ALTER TABLE `stat_officer_contract` DISABLE KEYS */;
INSERT INTO `stat_officer_contract` VALUES (1,'2017-09-10 11:19:55',1,2,1);
/*!40000 ALTER TABLE `stat_officer_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_contract_detail`
--

DROP TABLE IF EXISTS `stat_officer_contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_contract_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_contract_id` int(11) NOT NULL,
  `admin_approve_total` int(11) DEFAULT NULL,
  `admin_approve_women` int(11) DEFAULT NULL,
  `admin_non_total` int(11) DEFAULT NULL,
  `admin_non_women` int(11) DEFAULT NULL,
  `officer_approve_total` int(11) DEFAULT NULL,
  `officer_approve_women` int(11) DEFAULT NULL,
  `officer_non_total` int(11) DEFAULT NULL,
  `officer_non_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_contract_detail_stat_officer_contract1_idx` (`stat_officer_contract_id`),
  CONSTRAINT `fk_stat_officer_contract_detail_stat_officer_contract1` FOREIGN KEY (`stat_officer_contract_id`) REFERENCES `stat_officer_contract` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_contract_detail`
--

LOCK TABLES `stat_officer_contract_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_contract_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_contract_detail` VALUES (1,1,9,8,7,6,5,4,3,2);
/*!40000 ALTER TABLE `stat_officer_contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_degree`
--

DROP TABLE IF EXISTS `stat_officer_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_offcer_degree_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_offcer_degree_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_offcer_degree_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_offcer_degree_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_degree`
--

LOCK TABLES `stat_officer_degree` WRITE;
/*!40000 ALTER TABLE `stat_officer_degree` DISABLE KEYS */;
INSERT INTO `stat_officer_degree` VALUES (1,'2017-09-10 06:07:37',1,1,2);
/*!40000 ALTER TABLE `stat_officer_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_degree_detail`
--

DROP TABLE IF EXISTS `stat_officer_degree_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_degree_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_total` int(11) DEFAULT NULL,
  `doctor_women` int(11) DEFAULT NULL,
  `post_master_total` int(11) DEFAULT NULL,
  `post_master_women` int(11) DEFAULT NULL,
  `master_total` int(11) DEFAULT NULL,
  `master_women` int(11) DEFAULT NULL,
  `post_bachelor_total` int(11) DEFAULT NULL,
  `post_bachelor_women` int(11) DEFAULT NULL,
  `bachelor_total` int(11) DEFAULT NULL,
  `bachelor_women` int(11) DEFAULT NULL,
  `high_total` int(11) DEFAULT NULL,
  `high_women` int(11) DEFAULT NULL,
  `middle_total` int(11) DEFAULT NULL,
  `middle_women` int(11) DEFAULT NULL,
  `begin_total` int(11) DEFAULT NULL,
  `begin_women` int(11) DEFAULT NULL,
  `no_total` int(11) DEFAULT NULL,
  `no_women` int(11) DEFAULT NULL,
  `stat_officer_degree_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_degree_detail_stat_officer_degree1_idx` (`stat_officer_degree_id`),
  CONSTRAINT `fk_stat_officer_degree_detail_stat_officer_degree1` FOREIGN KEY (`stat_officer_degree_id`) REFERENCES `stat_officer_degree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_degree_detail`
--

LOCK TABLES `stat_officer_degree_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_degree_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_degree_detail` VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1,1);
/*!40000 ALTER TABLE `stat_officer_degree_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_detail`
--

DROP TABLE IF EXISTS `stat_officer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_id` int(11) NOT NULL,
  `center_total` int(11) DEFAULT NULL,
  `province_total` int(11) DEFAULT NULL,
  `district_total` int(11) DEFAULT NULL,
  `center_women` int(11) DEFAULT NULL,
  `province_women` int(11) DEFAULT NULL,
  `district_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_detail_stat_officer1_idx` (`stat_officer_id`),
  CONSTRAINT `fk_stat_officer_detail_stat_officer1` FOREIGN KEY (`stat_officer_id`) REFERENCES `stat_officer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_detail`
--

LOCK TABLES `stat_officer_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_detail` VALUES (1,1,9999,77,55,88,66,40);
/*!40000 ALTER TABLE `stat_officer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry`
--

DROP TABLE IF EXISTS `stat_officer_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry`
--

LOCK TABLES `stat_officer_ministry` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry` VALUES (3,'2017-09-10 18:08:54',1,1,2);
/*!40000 ALTER TABLE `stat_officer_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_add`
--

DROP TABLE IF EXISTS `stat_officer_ministry_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_add_user1_idx` (`user_id`),
  KEY `fk_stat_officer_ministry_add_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_ministry_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_add`
--

LOCK TABLES `stat_officer_ministry_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_add` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_add` VALUES (1,'2017-09-18 13:47:55',1,2,1);
/*!40000 ALTER TABLE `stat_officer_ministry_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_add_detail`
--

DROP TABLE IF EXISTS `stat_officer_ministry_add_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_ministry_add_id` int(11) NOT NULL,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_add_detail_stat_officer_ministry_a_idx` (`stat_officer_ministry_add_id`),
  KEY `fk_stat_officer_ministry_add_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_officer_ministry_add_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_add_detail_stat_officer_ministry_add1` FOREIGN KEY (`stat_officer_ministry_add_id`) REFERENCES `stat_officer_ministry_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_add_detail`
--

LOCK TABLES `stat_officer_ministry_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_add_detail` VALUES (1,1,887,98,1),(2,1,987,876,2),(3,1,765,456,4),(4,1,70,60,5);
/*!40000 ALTER TABLE `stat_officer_ministry_add_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_detail`
--

DROP TABLE IF EXISTS `stat_officer_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_detail_stat_officer_ministry1_idx` (`stat_officer_ministry_id`),
  KEY `fk_stat_officer_ministry_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_officer_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_detail_stat_officer_ministry1` FOREIGN KEY (`stat_officer_ministry_id`) REFERENCES `stat_officer_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_detail`
--

LOCK TABLES `stat_officer_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_detail` VALUES (1,9,8,3,1),(2,7,6,3,2),(3,20,10,3,4),(4,17,14,3,5);
/*!40000 ALTER TABLE `stat_officer_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_train`
--

DROP TABLE IF EXISTS `stat_officer_ministry_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_train_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_ministry_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_train`
--

LOCK TABLES `stat_officer_ministry_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_train` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_train` VALUES (2,'2017-09-13 11:36:01',1,1,2);
/*!40000 ALTER TABLE `stat_officer_ministry_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_train_detail`
--

DROP TABLE IF EXISTS `stat_officer_ministry_train_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_train_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL,
  `stat_officer_ministry_train_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_train_detail_stat_officer_ministry_idx` (`stat_officer_ministry_train_id`),
  KEY `fk_stat_officer_ministry_train_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_officer_ministry_train_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_train_detail_stat_officer_ministry_t1` FOREIGN KEY (`stat_officer_ministry_train_id`) REFERENCES `stat_officer_ministry_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_train_detail`
--

LOCK TABLES `stat_officer_ministry_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_train_detail` VALUES (1,99,88,77,66,55,44,33,22,2,5),(2,77,66,55,44,33,22,11,5,2,2);
/*!40000 ALTER TABLE `stat_officer_ministry_train_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_upgrade`
--

DROP TABLE IF EXISTS `stat_officer_ministry_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_upgrade_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_ministry_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_upgrade`
--

LOCK TABLES `stat_officer_ministry_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_upgrade` VALUES (1,'2017-09-13 19:40:15',1,1,2);
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ministry_upgrade_detail`
--

DROP TABLE IF EXISTS `stat_officer_ministry_upgrade_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ministry_upgrade_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_in_total` int(11) DEFAULT NULL,
  `doctor_in_women` int(11) DEFAULT NULL,
  `doctor_out_total` int(11) DEFAULT NULL,
  `doctor_out_women` int(11) DEFAULT NULL,
  `master_in_total` int(11) DEFAULT NULL,
  `master_in_women` int(11) DEFAULT NULL,
  `master_out_total` int(11) DEFAULT NULL,
  `master_out_women` int(11) DEFAULT NULL,
  `bachelor_in_total` int(11) DEFAULT NULL,
  `bachelor_in_women` int(11) DEFAULT NULL,
  `bachelor_out_total` int(11) DEFAULT NULL,
  `bachelor_out_women` int(11) DEFAULT NULL,
  `high_in_total` int(11) DEFAULT NULL,
  `high_in_women` int(11) DEFAULT NULL,
  `high_out_total` int(11) DEFAULT NULL,
  `high_out_women` int(11) DEFAULT NULL,
  `middle_in_total` int(11) DEFAULT NULL,
  `middle_in_women` int(11) DEFAULT NULL,
  `middle_out_total` int(11) DEFAULT NULL,
  `middle_out_women` int(11) DEFAULT NULL,
  `begin_in_total` int(11) DEFAULT NULL,
  `begin_in_women` int(11) DEFAULT NULL,
  `begin_out_total` int(11) DEFAULT NULL,
  `begin_out_women` int(11) DEFAULT NULL,
  `stat_officer_ministry_upgrade_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_upgrade_detail_stat_officer_minist_idx` (`stat_officer_ministry_upgrade_id`),
  KEY `fk_stat_officer_ministry_upgrade_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_officer_ministry_upgrade_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_ministry_upgrade_detail_stat_officer_ministry1` FOREIGN KEY (`stat_officer_ministry_upgrade_id`) REFERENCES `stat_officer_ministry_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_upgrade_detail`
--

LOCK TABLES `stat_officer_ministry_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_upgrade_detail` VALUES (1,100,NULL,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1,999,888,777,666,555,444,1,1),(2,11,1,22,2,33,3,44,4,55,5,66,6,77,7,88,8,99,9,111,12,222,23,333,34,1,2),(3,99,9,88,8,77,7,66,6,55,5,44,4,33,3,22,2,11,1,12,2,13,3,14,4,1,4);
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_need`
--

DROP TABLE IF EXISTS `stat_officer_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_need` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_need_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_need_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_need_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_need_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_need`
--

LOCK TABLES `stat_officer_need` WRITE;
/*!40000 ALTER TABLE `stat_officer_need` DISABLE KEYS */;
INSERT INTO `stat_officer_need` VALUES (1,'2017-09-10 12:35:21',1,1,2);
/*!40000 ALTER TABLE `stat_officer_need` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_need_detail`
--

DROP TABLE IF EXISTS `stat_officer_need_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_need_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `stat_officer_need_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_need_detail_stat_officer_need1_idx` (`stat_officer_need_id`),
  CONSTRAINT `fk_stat_officer_need_detail_stat_officer_need1` FOREIGN KEY (`stat_officer_need_id`) REFERENCES `stat_officer_need` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_need_detail`
--

LOCK TABLES `stat_officer_need_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_need_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_need_detail` VALUES (1,9,8,7,1);
/*!40000 ALTER TABLE `stat_officer_need_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_org`
--

DROP TABLE IF EXISTS `stat_officer_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_org_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_org_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_org_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_org_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_org`
--

LOCK TABLES `stat_officer_org` WRITE;
/*!40000 ALTER TABLE `stat_officer_org` DISABLE KEYS */;
INSERT INTO `stat_officer_org` VALUES (1,'2017-09-10 18:31:41',1,1,2),(2,'2017-09-10 20:26:23',1,2,2);
/*!40000 ALTER TABLE `stat_officer_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_org_detail`
--

DROP TABLE IF EXISTS `stat_officer_org_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_org_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_org_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_org_detail_stat_officer_org1_idx` (`stat_officer_org_id`),
  KEY `fk_stat_officer_org_detail_organisation1_idx` (`organisation_id`),
  CONSTRAINT `fk_stat_officer_org_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_org_detail_stat_officer_org1` FOREIGN KEY (`stat_officer_org_id`) REFERENCES `stat_officer_org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_org_detail`
--

LOCK TABLES `stat_officer_org_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_org_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_org_detail` VALUES (1,11,1,1,1),(2,5,0,1,2),(3,8,7,2,1),(4,3,0,2,2);
/*!40000 ALTER TABLE `stat_officer_org_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_add`
--

DROP TABLE IF EXISTS `stat_officer_organisation_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_add_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_organisation_add_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_organisation_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_add`
--

LOCK TABLES `stat_officer_organisation_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_add` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_add` VALUES (3,'2017-09-11 18:18:39',1,1,2);
/*!40000 ALTER TABLE `stat_officer_organisation_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_add_detail`
--

DROP TABLE IF EXISTS `stat_officer_organisation_add_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_organisation_add_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_add_detail_stat_officer_organi_idx` (`stat_officer_organisation_add_id`),
  KEY `fk_stat_officer_organisation_add_detail_organisation1_idx` (`organisation_id`),
  CONSTRAINT `fk_stat_officer_organisation_add_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_add_detail_stat_officer_organisa1` FOREIGN KEY (`stat_officer_organisation_add_id`) REFERENCES `stat_officer_organisation_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_add_detail`
--

LOCK TABLES `stat_officer_organisation_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_add_detail` VALUES (1,888,77,3,1),(2,777,660,3,2);
/*!40000 ALTER TABLE `stat_officer_organisation_add_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_train`
--

DROP TABLE IF EXISTS `stat_officer_organisation_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_organisation_train_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_organisation_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_train`
--

LOCK TABLES `stat_officer_organisation_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_train` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_train` VALUES (1,'2017-09-13 18:30:00',1,1,2);
/*!40000 ALTER TABLE `stat_officer_organisation_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_train_detail`
--

DROP TABLE IF EXISTS `stat_officer_organisation_train_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_train_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL,
  `stat_officer_organisation_train_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_train_detail_stat_officer_orga_idx` (`stat_officer_organisation_train_id`),
  KEY `fk_stat_officer_organisation_train_detail_organisation1_idx` (`organisation_id`),
  CONSTRAINT `fk_stat_officer_organisation_train_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_train_detail_stat_officer_organi1` FOREIGN KEY (`stat_officer_organisation_train_id`) REFERENCES `stat_officer_organisation_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_train_detail`
--

LOCK TABLES `stat_officer_organisation_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_train_detail` VALUES (1,9,8,7,6,5,4,3,2,1,1),(2,7,6,5,4,3,2,11,1,1,2);
/*!40000 ALTER TABLE `stat_officer_organisation_train_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_upgrade`
--

DROP TABLE IF EXISTS `stat_officer_organisation_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_upgrade_user1_idx` (`user_id`),
  KEY `fk_stat_officer_organisation_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_organisation_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_upgrade`
--

LOCK TABLES `stat_officer_organisation_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_upgrade` VALUES (1,'2017-09-13 20:08:43',1,2,1);
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_organisation_upgrade_detail`
--

DROP TABLE IF EXISTS `stat_officer_organisation_upgrade_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_organisation_upgrade_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_in_total` int(11) DEFAULT NULL,
  `doctor_in_women` int(11) DEFAULT NULL,
  `doctor_out_total` int(11) DEFAULT NULL,
  `doctor_out_women` int(11) DEFAULT NULL,
  `master_in_total` int(11) DEFAULT NULL,
  `master_in_women` int(11) DEFAULT NULL,
  `master_out_total` int(11) DEFAULT NULL,
  `master_out_women` int(11) DEFAULT NULL,
  `bachelor_in_total` int(11) DEFAULT NULL,
  `bachelor_in_women` int(11) DEFAULT NULL,
  `bachelor_out_total` int(11) DEFAULT NULL,
  `bachelor_out_women` int(11) DEFAULT NULL,
  `high_in_total` int(11) DEFAULT NULL,
  `high_in_women` int(11) DEFAULT NULL,
  `high_out_total` int(11) DEFAULT NULL,
  `high_out_women` int(11) DEFAULT NULL,
  `middle_in_total` int(11) DEFAULT NULL,
  `middle_in_women` int(11) DEFAULT NULL,
  `middle_out_total` int(11) DEFAULT NULL,
  `middle_out_women` int(11) DEFAULT NULL,
  `begin_in_total` int(11) DEFAULT NULL,
  `begin_in_women` int(11) DEFAULT NULL,
  `begin_out_total` int(11) DEFAULT NULL,
  `begin_out_women` int(11) DEFAULT NULL,
  `organisation_id` int(11) NOT NULL,
  `stat_officer_organisation_upgrade_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_upgrade_detail_organisation1_idx` (`organisation_id`),
  KEY `fk_stat_officer_organisation_upgrade_detail_stat_officer_or_idx` (`stat_officer_organisation_upgrade_id`),
  CONSTRAINT `fk_stat_officer_organisation_upgrade_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_organisation_upgrade_detail_stat_officer_orga1` FOREIGN KEY (`stat_officer_organisation_upgrade_id`) REFERENCES `stat_officer_organisation_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_upgrade_detail`
--

LOCK TABLES `stat_officer_organisation_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_upgrade_detail` VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,65,4,3,2,1,0,11,1,22,2,33,3,1,1),(2,1,0,2,1,3,2,4,3,5,4,6,5,7,6,8,7,9,8,10,9,11,10,12,11,2,1);
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_position`
--

DROP TABLE IF EXISTS `stat_officer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_position_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_position_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_position_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_position_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_position`
--

LOCK TABLES `stat_officer_position` WRITE;
/*!40000 ALTER TABLE `stat_officer_position` DISABLE KEYS */;
INSERT INTO `stat_officer_position` VALUES (1,'2017-09-10 12:06:51',1,1,2);
/*!40000 ALTER TABLE `stat_officer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_position_detail`
--

DROP TABLE IF EXISTS `stat_officer_position_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_position_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p1_total` int(11) DEFAULT NULL,
  `p1_women` int(11) DEFAULT NULL,
  `p2_total` int(11) DEFAULT NULL,
  `p2_women` int(11) DEFAULT NULL,
  `p3_total` int(11) DEFAULT NULL,
  `p3_women` int(11) DEFAULT NULL,
  `p4_total` int(11) DEFAULT NULL,
  `p4_women` int(11) DEFAULT NULL,
  `p5_total` int(11) DEFAULT NULL,
  `p5_women` int(11) DEFAULT NULL,
  `p6_total` int(11) DEFAULT NULL,
  `p6_women` int(11) DEFAULT NULL,
  `p7_total` int(11) DEFAULT NULL,
  `p7_women` int(11) DEFAULT NULL,
  `p8_total` int(11) DEFAULT NULL,
  `p8_women` int(11) DEFAULT NULL,
  `stat_officer_position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_position_detail_stat_officer_position1_idx` (`stat_officer_position_id`),
  CONSTRAINT `fk_stat_officer_position_detail_stat_officer_position1` FOREIGN KEY (`stat_officer_position_id`) REFERENCES `stat_officer_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_position_detail`
--

LOCK TABLES `stat_officer_position_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_position_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_position_detail` VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,1);
/*!40000 ALTER TABLE `stat_officer_position_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province`
--

DROP TABLE IF EXISTS `stat_officer_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province`
--

LOCK TABLES `stat_officer_province` WRITE;
/*!40000 ALTER TABLE `stat_officer_province` DISABLE KEYS */;
INSERT INTO `stat_officer_province` VALUES (1,'2017-09-10 19:00:32',1,1,2),(2,'2017-09-10 20:24:10',1,2,2);
/*!40000 ALTER TABLE `stat_officer_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_add`
--

DROP TABLE IF EXISTS `stat_officer_province_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_add_user1_idx` (`user_id`),
  KEY `fk_stat_officer_province_add_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_province_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_add`
--

LOCK TABLES `stat_officer_province_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_add` DISABLE KEYS */;
INSERT INTO `stat_officer_province_add` VALUES (1,'2017-09-11 18:48:06',1,2,1);
/*!40000 ALTER TABLE `stat_officer_province_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_add_detail`
--

DROP TABLE IF EXISTS `stat_officer_province_add_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_province_add_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_add_detail_stat_officer_province_a_idx` (`stat_officer_province_add_id`),
  KEY `fk_stat_officer_province_add_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_officer_province_add_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_add_detail_stat_officer_province_add1` FOREIGN KEY (`stat_officer_province_add_id`) REFERENCES `stat_officer_province_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_add_detail`
--

LOCK TABLES `stat_officer_province_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_add_detail` VALUES (1,88,19,1,1),(2,88,77,1,17),(3,77,66,1,16),(4,50,38,1,14),(5,81,48,1,2);
/*!40000 ALTER TABLE `stat_officer_province_add_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_detail`
--

DROP TABLE IF EXISTS `stat_officer_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_detail_stat_officer_province1_idx` (`stat_officer_province_id`),
  KEY `fk_stat_officer_province_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_officer_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_detail_stat_officer_province1` FOREIGN KEY (`stat_officer_province_id`) REFERENCES `stat_officer_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_detail`
--

LOCK TABLES `stat_officer_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_detail` VALUES (1,9,0,1,17),(2,8,1,1,1),(3,7,6,1,16),(4,10,2,1,15),(5,10,10,1,18),(6,9,9,1,5),(7,7,7,1,13),(8,9,9,2,1),(9,8,4,2,2);
/*!40000 ALTER TABLE `stat_officer_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_train`
--

DROP TABLE IF EXISTS `stat_officer_province_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_train_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_province_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_train`
--

LOCK TABLES `stat_officer_province_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_train` DISABLE KEYS */;
INSERT INTO `stat_officer_province_train` VALUES (2,'2017-09-13 17:50:26',1,1,2);
/*!40000 ALTER TABLE `stat_officer_province_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_train_detail`
--

DROP TABLE IF EXISTS `stat_officer_province_train_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_train_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `stat_officer_province_train_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_train_detail_stat_officer_province_idx` (`stat_officer_province_train_id`),
  KEY `fk_stat_officer_province_train_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_officer_province_train_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_train_detail_stat_officer_province_t1` FOREIGN KEY (`stat_officer_province_train_id`) REFERENCES `stat_officer_province_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_train_detail`
--

LOCK TABLES `stat_officer_province_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_train_detail` VALUES (1,9,8,7,6,5,4,2,1,3,2);
/*!40000 ALTER TABLE `stat_officer_province_train_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_upgrade`
--

DROP TABLE IF EXISTS `stat_officer_province_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_upgrade_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_province_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_upgrade`
--

LOCK TABLES `stat_officer_province_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_province_upgrade` VALUES (1,'2017-09-13 20:30:12',1,1,2);
/*!40000 ALTER TABLE `stat_officer_province_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_province_upgrade_detail`
--

DROP TABLE IF EXISTS `stat_officer_province_upgrade_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_province_upgrade_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_in_total` int(11) DEFAULT NULL,
  `doctor_in_women` int(11) DEFAULT NULL,
  `doctor_out_total` int(11) DEFAULT NULL,
  `doctor_out_women` int(11) DEFAULT NULL,
  `master_in_total` int(11) DEFAULT NULL,
  `master_in_women` int(11) DEFAULT NULL,
  `master_out_total` int(11) DEFAULT NULL,
  `master_out_women` int(11) DEFAULT NULL,
  `bachelor_in_total` int(11) DEFAULT NULL,
  `bachelor_in_women` int(11) DEFAULT NULL,
  `bachelor_out_total` int(11) DEFAULT NULL,
  `bachelor_out_women` int(11) DEFAULT NULL,
  `high_in_total` int(11) DEFAULT NULL,
  `high_in_women` int(11) DEFAULT NULL,
  `high_out_total` int(11) DEFAULT NULL,
  `high_out_women` int(11) DEFAULT NULL,
  `middle_in_total` int(11) DEFAULT NULL,
  `middle_in_women` int(11) DEFAULT NULL,
  `middle_out_total` int(11) DEFAULT NULL,
  `middle_out_women` int(11) DEFAULT NULL,
  `begin_in_total` int(11) DEFAULT NULL,
  `begin_in_women` int(11) DEFAULT NULL,
  `begin_out_total` int(11) DEFAULT NULL,
  `begin_out_women` int(11) DEFAULT NULL,
  `stat_officer_province_upgrade_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_upgrade_detail_stat_officer_provin_idx` (`stat_officer_province_upgrade_id`),
  KEY `fk_stat_officer_province_upgrade_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_officer_province_upgrade_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_province_upgrade_detail_stat_officer_province1` FOREIGN KEY (`stat_officer_province_upgrade_id`) REFERENCES `stat_officer_province_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_upgrade_detail`
--

LOCK TABLES `stat_officer_province_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_upgrade_detail` VALUES (1,66,55,44,33,22,11,99,88,77,7,6,5,4,3,2,1,112,12,223,23,334,34,445,45,1,1),(2,11,1,22,2,33,3,44,4,55,5,66,6,77,7,88,8,99,9,100,10,110,11,120,12,1,2);
/*!40000 ALTER TABLE `stat_officer_province_upgrade_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_resign`
--

DROP TABLE IF EXISTS `stat_officer_resign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_resign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_resign_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_resign_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_resign_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_resign_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_resign`
--

LOCK TABLES `stat_officer_resign` WRITE;
/*!40000 ALTER TABLE `stat_officer_resign` DISABLE KEYS */;
INSERT INTO `stat_officer_resign` VALUES (1,'2017-09-10 07:34:57',1,1,2),(2,'2017-09-10 07:58:15',1,2,2);
/*!40000 ALTER TABLE `stat_officer_resign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_resign_detail`
--

DROP TABLE IF EXISTS `stat_officer_resign_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_resign_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_resign_id` int(11) NOT NULL,
  `retire_total` int(11) DEFAULT NULL,
  `bumnet_total` int(11) DEFAULT NULL,
  `die_total` int(11) DEFAULT NULL,
  `leave_total` int(11) DEFAULT NULL,
  `fire_total` int(11) DEFAULT NULL,
  `resign_total` int(11) DEFAULT NULL,
  `lose_total` int(11) DEFAULT NULL,
  `move_soe_total` int(11) DEFAULT NULL,
  `moveto_ministry_total` int(11) DEFAULT NULL,
  `movein_ministry_total` int(11) DEFAULT NULL,
  `retire_women` int(11) DEFAULT NULL,
  `bumnet_women` int(11) DEFAULT NULL,
  `die_women` int(11) DEFAULT NULL,
  `leave_women` int(11) DEFAULT NULL,
  `fire_women` int(11) DEFAULT NULL,
  `resign_women` int(11) DEFAULT NULL,
  `lose_women` int(11) DEFAULT NULL,
  `move_soe_women` int(11) DEFAULT NULL,
  `moveto_ministry_women` int(11) DEFAULT NULL,
  `movein_ministry_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_resign_detail_stat_officer_resign1_idx` (`stat_officer_resign_id`),
  CONSTRAINT `fk_stat_officer_resign_detail_stat_officer_resign1` FOREIGN KEY (`stat_officer_resign_id`) REFERENCES `stat_officer_resign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_resign_detail`
--

LOCK TABLES `stat_officer_resign_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_resign_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_resign_detail` VALUES (1,1,99,77,55,33,11,8,6,4,2,20,88,66,44,22,9,7,5,3,1,10),(2,2,9,7,5,3,111,88,66,44,22,100,8,6,4,2,99,77,55,33,11,89);
/*!40000 ALTER TABLE `stat_officer_resign_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_salary`
--

DROP TABLE IF EXISTS `stat_officer_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_salary_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_salary_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_officer_salary_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_salary_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_salary`
--

LOCK TABLES `stat_officer_salary` WRITE;
/*!40000 ALTER TABLE `stat_officer_salary` DISABLE KEYS */;
INSERT INTO `stat_officer_salary` VALUES (4,'2017-09-17 06:04:21',1,1,2);
/*!40000 ALTER TABLE `stat_officer_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_salary_detail`
--

DROP TABLE IF EXISTS `stat_officer_salary_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_salary_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_salary_id` int(11) NOT NULL,
  `level1_total` int(11) DEFAULT NULL,
  `level1_women` int(11) DEFAULT NULL,
  `level2_total` int(11) DEFAULT NULL,
  `level2_women` int(11) DEFAULT NULL,
  `level3_total` int(11) DEFAULT NULL,
  `level3_women` int(11) DEFAULT NULL,
  `level4_total` int(11) DEFAULT NULL,
  `level4_women` int(11) DEFAULT NULL,
  `level5_total` int(11) DEFAULT NULL,
  `level5_women` int(11) DEFAULT NULL,
  `level6_total` int(11) DEFAULT NULL,
  `level6_women` int(11) DEFAULT NULL,
  `level7_total` int(11) DEFAULT NULL,
  `level7_women` int(11) DEFAULT NULL,
  `level8_total` int(11) DEFAULT NULL,
  `level8_women` int(11) DEFAULT NULL,
  `level9_total` int(11) DEFAULT NULL,
  `level9_women` int(11) DEFAULT NULL,
  `level10_total` int(11) DEFAULT NULL,
  `level10_women` int(11) DEFAULT NULL,
  `level11_total` int(11) DEFAULT NULL,
  `level11_women` int(11) DEFAULT NULL,
  `level12_total` int(11) DEFAULT NULL,
  `level12_women` int(11) DEFAULT NULL,
  `level13_total` int(11) DEFAULT NULL,
  `level13_women` int(11) DEFAULT NULL,
  `level14_total` int(11) DEFAULT NULL,
  `level14_women` int(11) DEFAULT NULL,
  `level15_total` int(11) DEFAULT NULL,
  `level15_women` int(11) DEFAULT NULL,
  `officer_level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_salary_detail_stat_officer_salary1_idx` (`stat_officer_salary_id`),
  KEY `fk_stat_officer_salary_detail_officer_level1_idx` (`officer_level_id`),
  CONSTRAINT `fk_stat_officer_salary_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_salary_detail_stat_officer_salary1` FOREIGN KEY (`stat_officer_salary_id`) REFERENCES `stat_officer_salary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_salary_detail`
--

LOCK TABLES `stat_officer_salary_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_salary_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_salary_detail` VALUES (1,4,8,2,88,44,111,59,51,20,31,10,39,15,21,7,26,3,25,11,24,7,11,3,16,4,6,1,10,2,9,4,1),(2,4,26,13,139,77,128,51,65,33,59,28,37,12,30,5,35,7,30,7,14,3,13,1,9,2,12,2,7,0,10,1,2),(3,4,224,120,601,224,430,146,120,33,81,24,50,11,32,8,28,4,31,3,27,6,19,2,9,0,15,3,16,2,14,1,3);
/*!40000 ALTER TABLE `stat_officer_salary_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_technical`
--

DROP TABLE IF EXISTS `stat_officer_technical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_technical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_technical_user1_idx` (`user_id`),
  KEY `fk_stat_officer_technical_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_officer_technical_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_technical_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_technical`
--

LOCK TABLES `stat_officer_technical` WRITE;
/*!40000 ALTER TABLE `stat_officer_technical` DISABLE KEYS */;
INSERT INTO `stat_officer_technical` VALUES (1,'2017-09-18 15:44:08',1,2,1);
/*!40000 ALTER TABLE `stat_officer_technical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_technical_detail`
--

DROP TABLE IF EXISTS `stat_officer_technical_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_technical_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_technical_id` int(11) NOT NULL,
  `officer_level_id` int(11) NOT NULL,
  `doctor_total` int(11) DEFAULT NULL,
  `doctor_women` int(11) DEFAULT NULL,
  `post_master_total` int(11) DEFAULT NULL,
  `post_master_women` int(11) DEFAULT NULL,
  `master_total` int(11) DEFAULT NULL,
  `master_women` int(11) DEFAULT NULL,
  `post_bachelor_total` int(11) DEFAULT NULL,
  `post_bachelor_women` int(11) DEFAULT NULL,
  `bachelor_total` int(11) DEFAULT NULL,
  `bachelor_women` int(11) DEFAULT NULL,
  `high_total` int(11) DEFAULT NULL,
  `high_women` int(11) DEFAULT NULL,
  `middle_total` int(11) DEFAULT NULL,
  `middle_women` int(11) DEFAULT NULL,
  `begin_total` int(11) DEFAULT NULL,
  `begin_women` int(11) DEFAULT NULL,
  `hischool_total` int(11) DEFAULT NULL,
  `hischool_women` int(11) DEFAULT NULL,
  `second_total` int(11) DEFAULT NULL,
  `second_women` int(11) DEFAULT NULL,
  `primary_total` int(11) DEFAULT NULL,
  `primary_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_technical_detail_stat_officer_technical1_idx` (`stat_officer_technical_id`),
  KEY `fk_stat_officer_technical_detail_officer_level1_idx` (`officer_level_id`),
  CONSTRAINT `fk_stat_officer_technical_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_officer_technical_detail_stat_officer_technical1` FOREIGN KEY (`stat_officer_technical_id`) REFERENCES `stat_officer_technical` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_technical_detail`
--

LOCK TABLES `stat_officer_technical_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_technical_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_technical_detail` VALUES (1,1,1,4,2,NULL,NULL,94,27,NULL,NULL,272,126,65,28,30,6,11,3,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,1,NULL,4,NULL,32,6,NULL,NULL,354,137,180,84,39,13,4,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL,NULL,9,1,18,6,788,237,603,260,236,68,43,15,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stat_officer_technical_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_population_movement`
--

DROP TABLE IF EXISTS `stat_population_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_population_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_population_movement_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_population_movement_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_population_movement_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_population_movement_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_population_movement`
--

LOCK TABLES `stat_population_movement` WRITE;
/*!40000 ALTER TABLE `stat_population_movement` DISABLE KEYS */;
INSERT INTO `stat_population_movement` VALUES (5,'2017-09-07 16:47:52',1,1,2),(6,'2017-09-07 19:08:17',1,2,2);
/*!40000 ALTER TABLE `stat_population_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_population_movement_detail`
--

DROP TABLE IF EXISTS `stat_population_movement_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_population_movement_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district` int(11) DEFAULT NULL,
  `village` int(11) DEFAULT NULL,
  `population_total` int(11) DEFAULT NULL,
  `population_women` int(11) DEFAULT NULL,
  `born_total` int(11) DEFAULT NULL,
  `born_women` int(11) DEFAULT NULL,
  `die_total` int(11) DEFAULT NULL,
  `die_women` int(11) DEFAULT NULL,
  `married` int(11) DEFAULT NULL,
  `divorce` int(11) DEFAULT NULL,
  `movein_total` int(11) DEFAULT NULL,
  `movein_women` int(11) DEFAULT NULL,
  `moveout_total` int(11) DEFAULT NULL,
  `moveout_women` int(11) DEFAULT NULL,
  `real_total` int(11) DEFAULT NULL,
  `real_women` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `stat_population_movement_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_population_movement_detail_province1_idx` (`province_id`),
  KEY `fk_stat_population_movement_detail_stat_population_movement_idx` (`stat_population_movement_id`),
  CONSTRAINT `fk_stat_population_movement_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_population_movement_detail_stat_population_movement1` FOREIGN KEY (`stat_population_movement_id`) REFERENCES `stat_population_movement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_population_movement_detail`
--

LOCK TABLES `stat_population_movement_detail` WRITE;
/*!40000 ALTER TABLE `stat_population_movement_detail` DISABLE KEYS */;
INSERT INTO `stat_population_movement_detail` VALUES (1,35,435,345,343,234324,33,344,234,342,3,34342,234,4324,234,34,33,1,5),(2,12,23,11,1,22,2,33,3,44,4,55,5,66,6,77,7,13,5),(3,35,3,35,2,55,5,22,3,33,1,33,4,43,4,44,6,1,6);
/*!40000 ALTER TABLE `stat_population_movement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion`
--

DROP TABLE IF EXISTS `stat_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_religion_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_religion_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion`
--

LOCK TABLES `stat_religion` WRITE;
/*!40000 ALTER TABLE `stat_religion` DISABLE KEYS */;
INSERT INTO `stat_religion` VALUES (3,'2017-09-09 17:43:41',1,1,2);
/*!40000 ALTER TABLE `stat_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion_detail`
--

DROP TABLE IF EXISTS `stat_religion_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buddhis_total` int(11) DEFAULT NULL,
  `buddhis_women` int(11) DEFAULT NULL,
  `christ_news_total` int(11) DEFAULT NULL,
  `christ_news_women` int(11) DEFAULT NULL,
  `christ_sat_total` int(11) DEFAULT NULL,
  `christ_sat_women` int(11) DEFAULT NULL,
  `christ_cato_total` int(11) DEFAULT NULL,
  `christ_cato_women` int(11) DEFAULT NULL,
  `bahai_total` int(11) DEFAULT NULL,
  `bahai_women` int(11) DEFAULT NULL,
  `idslam_total` int(11) DEFAULT NULL,
  `idslam_women` int(11) DEFAULT NULL,
  `other_total` int(11) DEFAULT NULL,
  `other_women` int(11) DEFAULT NULL,
  `remark` text,
  `stat_religion_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_detail_stat_religion1_idx` (`stat_religion_id`),
  KEY `fk_stat_religion_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_religion_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_detail_stat_religion1` FOREIGN KEY (`stat_religion_id`) REFERENCES `stat_religion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_detail`
--

LOCK TABLES `stat_religion_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_detail` VALUES (1,8,7,6,5,4,3,2,1,99,88,77,66,55,44,'kkk',3,1),(2,99,9,88,8,77,7,66,6,55,5,44,4,33,3,'aaaa',3,17);
/*!40000 ALTER TABLE `stat_religion_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion_place`
--

DROP TABLE IF EXISTS `stat_religion_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_place_user1_idx` (`user_id`),
  KEY `fk_stat_religion_place_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_religion_place_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_place_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_place`
--

LOCK TABLES `stat_religion_place` WRITE;
/*!40000 ALTER TABLE `stat_religion_place` DISABLE KEYS */;
INSERT INTO `stat_religion_place` VALUES (1,'2017-09-09 19:21:20',1,2,1);
/*!40000 ALTER TABLE `stat_religion_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion_place_detail`
--

DROP TABLE IF EXISTS `stat_religion_place_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion_place_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buddhis_total` int(11) DEFAULT NULL,
  `buddhis_nomonk` int(11) DEFAULT NULL,
  `buddhis_nosim` int(11) DEFAULT NULL,
  `buddhis_sim` int(11) DEFAULT NULL,
  `christ_news_total` int(11) DEFAULT NULL,
  `christ_news_not` int(11) DEFAULT NULL,
  `christ_sat_total` int(11) DEFAULT NULL,
  `christ_sat_not` int(11) DEFAULT NULL,
  `christ_cato_total` int(11) DEFAULT NULL,
  `christ_cato_not` int(11) DEFAULT NULL,
  `bahai_total` int(11) DEFAULT NULL,
  `bahai_not` int(11) DEFAULT NULL,
  `idslam_total` int(11) DEFAULT NULL,
  `idslam_not` int(11) DEFAULT NULL,
  `remark` text,
  `stat_religion_place_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_place_stat_religion_place1_idx` (`stat_religion_place_id`),
  KEY `fk_stat_religion_place_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_religion_place_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_place_stat_religion_place1` FOREIGN KEY (`stat_religion_place_id`) REFERENCES `stat_religion_place` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_place_detail`
--

LOCK TABLES `stat_religion_place_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_place_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_place_detail` VALUES (1,99,88,66,77,55,44,33,22,11,9,8,7,6,5,'kjk',1,16),(2,77,70,4,3,33,22,11,9,8,7,6,5,4,3,'jhafjskdgh',1,1);
/*!40000 ALTER TABLE `stat_religion_place_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion_teacher`
--

DROP TABLE IF EXISTS `stat_religion_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_teacher_user1_idx` (`user_id`),
  KEY `fk_stat_religion_teacher_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_religion_teacher_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_teacher_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_teacher`
--

LOCK TABLES `stat_religion_teacher` WRITE;
/*!40000 ALTER TABLE `stat_religion_teacher` DISABLE KEYS */;
INSERT INTO `stat_religion_teacher` VALUES (1,'2017-09-09',1,2,1);
/*!40000 ALTER TABLE `stat_religion_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_religion_teacher_detail`
--

DROP TABLE IF EXISTS `stat_religion_teacher_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_religion_teacher_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_religion_teacher_id` int(11) NOT NULL,
  `buddhis_monk` int(11) DEFAULT NULL,
  `buddhis_novice` int(11) DEFAULT NULL,
  `buddhis_dad` int(11) DEFAULT NULL,
  `buddhis_mom` int(11) DEFAULT NULL,
  `buddhis_boy` int(11) DEFAULT NULL,
  `christ_news_total` int(11) DEFAULT NULL,
  `christ_news_women` int(11) DEFAULT NULL,
  `christ_sat_total` int(11) DEFAULT NULL,
  `christ_sat_women` int(11) DEFAULT NULL,
  `christ_cato_total` int(11) DEFAULT NULL,
  `christ_cato_women` int(11) DEFAULT NULL,
  `bahai_total` int(11) DEFAULT NULL,
  `bahai_women` int(11) DEFAULT NULL,
  `idslam_total` int(11) DEFAULT NULL,
  `idslam_women` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_teacher_detail_stat_religion_teacher1_idx` (`stat_religion_teacher_id`),
  KEY `fk_stat_religion_teacher_detail_province1_idx` (`province_id`),
  CONSTRAINT `fk_stat_religion_teacher_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_religion_teacher_detail_stat_religion_teacher1` FOREIGN KEY (`stat_religion_teacher_id`) REFERENCES `stat_religion_teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_teacher_detail`
--

LOCK TABLES `stat_religion_teacher_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_teacher_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_teacher_detail` VALUES (1,1,11,22,33,44,55,9,8,8,7,7,6,6,5,5,4,1,'kkkk'),(2,1,9,8,7,6,5,11,1,22,2,33,3,44,4,55,5,17,'jjj');
/*!40000 ALTER TABLE `stat_religion_teacher_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_research`
--

DROP TABLE IF EXISTS `stat_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_research_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_research_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_research_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_research_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_research`
--

LOCK TABLES `stat_research` WRITE;
/*!40000 ALTER TABLE `stat_research` DISABLE KEYS */;
INSERT INTO `stat_research` VALUES (1,'2017-09-15 17:19:17',1,1,2);
/*!40000 ALTER TABLE `stat_research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_research_detail`
--

DROP TABLE IF EXISTS `stat_research_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_research_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_research_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `attendance` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `goverment` int(11) DEFAULT NULL,
  `dornor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_research_detail_stat_research1_idx` (`stat_research_id`),
  CONSTRAINT `fk_stat_research_detail_stat_research1` FOREIGN KEY (`stat_research_id`) REFERENCES `stat_research` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_research_detail`
--

LOCK TABLES `stat_research_detail` WRITE;
/*!40000 ALTER TABLE `stat_research_detail` DISABLE KEYS */;
INSERT INTO `stat_research_detail` VALUES (1,1,'aksjgh',66,7,'2017-09-15 00:00:00','2017-09-18 00:00:00','aads',3,'21sag','sdg',1,2),(2,1,'aksjgh',31,9,'2017-09-15 00:00:00','2017-09-18 00:00:00','aads',3,'21sag','sdg',3,4);
/*!40000 ALTER TABLE `stat_research_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_single_gateway_implementation`
--

DROP TABLE IF EXISTS `stat_single_gateway_implementation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_single_gateway_implementation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_single_gateway_implementation_user1_idx` (`user_id`),
  KEY `fk_stat_single_gateway_implementation_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_single_gateway_implementation_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_single_gateway_implementation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_single_gateway_implementation`
--

LOCK TABLES `stat_single_gateway_implementation` WRITE;
/*!40000 ALTER TABLE `stat_single_gateway_implementation` DISABLE KEYS */;
INSERT INTO `stat_single_gateway_implementation` VALUES (1,2,1,'2017-09-18 14:01:19',1),(2,2,2,'2017-09-04 15:37:29',1);
/*!40000 ALTER TABLE `stat_single_gateway_implementation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_single_gateway_implementation_detail`
--

DROP TABLE IF EXISTS `stat_single_gateway_implementation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_single_gateway_implementation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_single_gateway_implementation_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` text,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_single_gateway_implementation_detail_stat_single_ga_idx` (`stat_single_gateway_implementation_id`),
  KEY `fk_stat_single_gateway_implementation_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_single_gateway_implementation_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_single_gateway_implementation_detail_stat_single_gate1` FOREIGN KEY (`stat_single_gateway_implementation_id`) REFERENCES `stat_single_gateway_implementation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_single_gateway_implementation_detail`
--

LOCK TABLES `stat_single_gateway_implementation_detail` WRITE;
/*!40000 ALTER TABLE `stat_single_gateway_implementation_detail` DISABLE KEYS */;
INSERT INTO `stat_single_gateway_implementation_detail` VALUES (1,1,'2017-09-05 00:00:00','dgsagas','sss',1),(2,1,'2017-08-28 00:00:00','ssdf','dfdsf',2),(3,2,'2017-09-21 00:00:00','sada','adasd',1),(4,1,'2017-09-04 00:00:00','234','342',4),(5,1,'2017-09-13 00:00:00','jjkjh','kjhk',5);
/*!40000 ALTER TABLE `stat_single_gateway_implementation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victorycoin_ministry`
--

DROP TABLE IF EXISTS `stat_victorycoin_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victorycoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_victorycoin_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_victorycoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_ministry`
--

LOCK TABLES `stat_victorycoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_ministry` VALUES (1,'2017-09-16 09:16:41',1,2,1);
/*!40000 ALTER TABLE `stat_victorycoin_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victorycoin_ministry_detail`
--

DROP TABLE IF EXISTS `stat_victorycoin_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victorycoin_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `free1_personal` int(11) DEFAULT NULL,
  `free1_team` int(11) DEFAULT NULL,
  `free2_personal` int(11) DEFAULT NULL,
  `free2_team` int(11) DEFAULT NULL,
  `free3_personal` int(11) DEFAULT NULL,
  `free3_team` int(11) DEFAULT NULL,
  `revo1_personal` int(11) DEFAULT NULL,
  `revo1_team` int(11) DEFAULT NULL,
  `revo2_personal` int(11) DEFAULT NULL,
  `revo2_team` int(11) DEFAULT NULL,
  `revo3_personal` int(11) DEFAULT NULL,
  `revo3_team` int(11) DEFAULT NULL,
  `labo1_personal` int(11) DEFAULT NULL,
  `labo1_team` int(11) DEFAULT NULL,
  `labo2_personal` int(11) DEFAULT NULL,
  `labo2_team` int(11) DEFAULT NULL,
  `labo3_personal` int(11) DEFAULT NULL,
  `labo3_team` int(11) DEFAULT NULL,
  `deve1_personal` int(11) DEFAULT NULL,
  `deve1_team` int(11) DEFAULT NULL,
  `deve2_personal` int(11) DEFAULT NULL,
  `deve2_team` int(11) DEFAULT NULL,
  `deve3_personal` int(11) DEFAULT NULL,
  `deve3_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `stat_victorycoin_ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_ministry_detail_stat_victorycoin_minist_idx` (`stat_victorycoin_ministry_id`),
  KEY `fk_stat_victorycoin_ministry_detail_award1_idx` (`award_id`),
  KEY `fk_stat_victorycoin_ministry_detail_ministry1_idx` (`ministry_id`),
  CONSTRAINT `fk_stat_victorycoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_ministry_detail_stat_victorycoin_ministry1` FOREIGN KEY (`stat_victorycoin_ministry_id`) REFERENCES `stat_victorycoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_ministry_detail`
--

LOCK TABLES `stat_victorycoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_ministry_detail` VALUES (1,1,NULL,3,NULL,9,4,NULL,NULL,NULL,NULL,NULL,NULL,46,7,418,51,604,396,1,1,1,NULL,1,NULL,'',1,2,1);
/*!40000 ALTER TABLE `stat_victorycoin_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victorycoin_province`
--

DROP TABLE IF EXISTS `stat_victorycoin_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victorycoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_victorycoin_province_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_victorycoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_province`
--

LOCK TABLES `stat_victorycoin_province` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_province` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_province` VALUES (1,'2017-09-16 10:15:49',1,1,2);
/*!40000 ALTER TABLE `stat_victorycoin_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victorycoin_province_detail`
--

DROP TABLE IF EXISTS `stat_victorycoin_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victorycoin_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_victorycoin_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `free1_personal` int(11) DEFAULT NULL,
  `free1_team` int(11) DEFAULT NULL,
  `free2_personal` int(11) DEFAULT NULL,
  `free2_team` int(11) DEFAULT NULL,
  `free3_personal` int(11) DEFAULT NULL,
  `free3_team` int(11) DEFAULT NULL,
  `revo1_personal` int(11) DEFAULT NULL,
  `revo1_team` int(11) DEFAULT NULL,
  `revo2_personal` int(11) DEFAULT NULL,
  `revo2_team` int(11) DEFAULT NULL,
  `revo3_personal` int(11) DEFAULT NULL,
  `revo3_team` int(11) DEFAULT NULL,
  `labo1_personal` int(11) DEFAULT NULL,
  `labo1_team` int(11) DEFAULT NULL,
  `labo2_personal` int(11) DEFAULT NULL,
  `labo2_team` int(11) DEFAULT NULL,
  `labo3_personal` int(11) DEFAULT NULL,
  `labo3_team` int(11) DEFAULT NULL,
  `deve1_personal` int(11) DEFAULT NULL,
  `deve1_team` int(11) DEFAULT NULL,
  `deve2_personal` int(11) DEFAULT NULL,
  `deve2_team` int(11) DEFAULT NULL,
  `deve3_personal` int(11) DEFAULT NULL,
  `deve3_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `award_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_province_detail_stat_victorycoin_provin_idx` (`stat_victorycoin_province_id`),
  KEY `fk_stat_victorycoin_province_detail_province1_idx` (`province_id`),
  KEY `fk_stat_victorycoin_province_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_victorycoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victorycoin_province_detail_stat_victorycoin_province1` FOREIGN KEY (`stat_victorycoin_province_id`) REFERENCES `stat_victorycoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_province_detail`
--

LOCK TABLES `stat_victorycoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_province_detail` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_province_detail` VALUES (1,1,1,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,187,209,664,454,1576,679,NULL,NULL,NULL,1,NULL,3,NULL,6);
/*!40000 ALTER TABLE `stat_victorycoin_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victoryoversea_ministry`
--

DROP TABLE IF EXISTS `stat_victoryoversea_ministry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victoryoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_victoryoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_stat_victoryoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_ministry`
--

LOCK TABLES `stat_victoryoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_ministry` VALUES (2,'2017-09-16 12:41:18',1,2,1);
/*!40000 ALTER TABLE `stat_victoryoversea_ministry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victoryoversea_ministry_detail`
--

DROP TABLE IF EXISTS `stat_victoryoversea_ministry_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victoryoversea_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `free1_personal` int(11) DEFAULT NULL,
  `free1_team` int(11) DEFAULT NULL,
  `free2_personal` int(11) DEFAULT NULL,
  `free2_team` int(11) DEFAULT NULL,
  `free3_personal` int(11) DEFAULT NULL,
  `free3_team` int(11) DEFAULT NULL,
  `revo1_personal` int(11) DEFAULT NULL,
  `revo1_team` int(11) DEFAULT NULL,
  `revo2_personal` int(11) DEFAULT NULL,
  `revo2_team` int(11) DEFAULT NULL,
  `revo3_personal` int(11) DEFAULT NULL,
  `revo3_team` int(11) DEFAULT NULL,
  `labo1_personal` int(11) DEFAULT NULL,
  `labo1_team` int(11) DEFAULT NULL,
  `labo2_personal` int(11) DEFAULT NULL,
  `labo2_team` int(11) DEFAULT NULL,
  `labo3_personal` int(11) DEFAULT NULL,
  `labo3_team` int(11) DEFAULT NULL,
  `deve1_personal` int(11) DEFAULT NULL,
  `deve1_team` int(11) DEFAULT NULL,
  `deve2_personal` int(11) DEFAULT NULL,
  `deve2_team` int(11) DEFAULT NULL,
  `deve3_personal` int(11) DEFAULT NULL,
  `deve3_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `frien_personal` int(11) DEFAULT NULL,
  `frien_team` int(11) DEFAULT NULL,
  `stat_victoryoversea_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_ministry_detail_stat_victoryoversea__idx` (`stat_victoryoversea_ministry_id`),
  KEY `fk_stat_victoryoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  KEY `fk_stat_victoryoversea_ministry_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_victoryoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_ministry_detail_stat_victoryoversea_mi1` FOREIGN KEY (`stat_victoryoversea_ministry_id`) REFERENCES `stat_victoryoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_ministry_detail`
--

LOCK TABLES `stat_victoryoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_ministry_detail` VALUES (1,NULL,NULL,13,15,107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,126,1,101,NULL,1,NULL,NULL,NULL,NULL,NULL,'dd',47,22,2,1,2),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aa',2,1,2,2,6);
/*!40000 ALTER TABLE `stat_victoryoversea_ministry_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victoryoversea_province`
--

DROP TABLE IF EXISTS `stat_victoryoversea_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victoryoversea_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_victoryoversea_province_user1_idx` (`user_id`),
  CONSTRAINT `fk_stat_victoryoversea_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_province`
--

LOCK TABLES `stat_victoryoversea_province` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_province` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_province` VALUES (1,'2017-09-16 14:56:23',1,1,2);
/*!40000 ALTER TABLE `stat_victoryoversea_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_victoryoversea_province_detail`
--

DROP TABLE IF EXISTS `stat_victoryoversea_province_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_victoryoversea_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_victoryoversea_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `free1_personal` int(11) DEFAULT NULL,
  `free1_team` int(11) DEFAULT NULL,
  `free2_personal` int(11) DEFAULT NULL,
  `free2_team` int(11) DEFAULT NULL,
  `free3_personal` int(11) DEFAULT NULL,
  `free3_team` int(11) DEFAULT NULL,
  `revo1_personal` int(11) DEFAULT NULL,
  `revo1_team` int(11) DEFAULT NULL,
  `revo2_personal` int(11) DEFAULT NULL,
  `revo2_team` int(11) DEFAULT NULL,
  `revo3_personal` int(11) DEFAULT NULL,
  `revo3_team` int(11) DEFAULT NULL,
  `labo1_personal` int(11) DEFAULT NULL,
  `labo1_team` int(11) DEFAULT NULL,
  `labo2_personal` int(11) DEFAULT NULL,
  `labo2_team` int(11) DEFAULT NULL,
  `labo3_personal` int(11) DEFAULT NULL,
  `labo3_team` int(11) DEFAULT NULL,
  `deve1_personal` int(11) DEFAULT NULL,
  `deve1_team` int(11) DEFAULT NULL,
  `deve2_personal` int(11) DEFAULT NULL,
  `deve2_team` int(11) DEFAULT NULL,
  `deve3_personal` int(11) DEFAULT NULL,
  `deve3_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `frien_personal` int(11) DEFAULT NULL,
  `frien_team` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_province_detail_stat_victoryoversea__idx` (`stat_victoryoversea_province_id`),
  KEY `fk_stat_victoryoversea_province_detail_province1_idx` (`province_id`),
  KEY `fk_stat_victoryoversea_province_detail_award1_idx` (`award_id`),
  CONSTRAINT `fk_stat_victoryoversea_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_victoryoversea_province_detail_stat_victoryoversea_pr1` FOREIGN KEY (`stat_victoryoversea_province_id`) REFERENCES `stat_victoryoversea_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_province_detail`
--

LOCK TABLES `stat_victoryoversea_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_province_detail` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_province_detail` VALUES (1,1,1,2,99,88,77,66,55,44,33,22,11,9,8,7,6,553,2,1,NULL,5,9,9,NULL,7,6,5,'lk',7,8),(2,1,9,5,8,6,6,NULL,0,7,5,3,2,5,8,9,5,NULL,2,45,7,9,8,4,3,6,9,9,'3',7,4);
/*!40000 ALTER TABLE `stat_victoryoversea_province_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `use_subcordinate`
--

DROP TABLE IF EXISTS `use_subcordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `use_subcordinate` (
  `user_id` int(11) NOT NULL,
  `subcordinate_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subcordinate_user_id`),
  KEY `fk_user_has_user_user2_idx` (`subcordinate_user_id`),
  KEY `fk_user_has_user_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2` FOREIGN KEY (`subcordinate_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `use_subcordinate`
--

LOCK TABLES `use_subcordinate` WRITE;
/*!40000 ALTER TABLE `use_subcordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `use_subcordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'A',
  `tel` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'admin','admin','Administrator','','A','',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_branch`
--

DROP TABLE IF EXISTS `user_has_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_branch` (
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`branch_id`),
  KEY `fk_user_has_branch_branch1_idx` (`branch_id`),
  KEY `fk_user_has_branch_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_branch_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_branch`
--

LOCK TABLES `user_has_branch` WRITE;
/*!40000 ALTER TABLE `user_has_branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_role`
--

DROP TABLE IF EXISTS `user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `set_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_role`
--

LOCK TABLES `user_has_role` WRITE;
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'moha'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-24 19:04:30
