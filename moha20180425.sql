CREATE DATABASE  IF NOT EXISTS `moha` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `moha`;
-- MySQL dump 10.13  Distrib 5.6.38, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: moha
-- ------------------------------------------------------
-- Server version	5.6.38

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
  `class_name` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `controller_id` int(11) DEFAULT '0',
  `description` text,
  `parent_id` int(11) DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`class_name`,`method`)
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` (`id`, `class_name`, `method`, `deleted`, `controller_id`, `description`, `parent_id`, `position`) VALUES (1,'user','managerole',0,0,'ການໃຫ້ສິດ',0,3),(2,'user','manageuser',0,0,'ຜູ້ໃຊ້ລະບົບ',0,2),(3,'#','#',0,0,'ກົມ',0,4),(4,'#','#',0,0,'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ',3,1),(5,'ministry','index',0,0,'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ\n',4,1),(12,'stat-goverment-unit','index',0,0,'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)',4,2),(19,'#','#',0,0,'ຕັ້ງຄ່າ',0,1),(20,'message','index',0,0,'ແປພາສາ',19,2),(21,'phiscal-year','index',0,0,'ສົກປີ',19,1),(22,'#','#',0,0,' ກົມການປົກຄອງທ້ອງຖິ່ນ',3,2),(23,'#','#',0,0,' ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',3,3),(24,'#','#',0,0,' ກົມຄຸ້ມຄອງພົນລະເມືອງ',3,4),(25,'#','#',0,0,' ກົມຄຸ້ມຄອງລັດຖະກອນ',3,5),(26,'#','#',0,0,' ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',3,6),(27,'#','#',0,0,' ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ',3,7),(28,'#','#',0,0,' ກົມສຳເນົາເອກະສານແຫ່ງຊາດ',3,8),(29,'#','#',0,0,' ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',3,9),(30,'#','#',0,0,' ກົມແຜນທີ່ແຫ່ງຊາດ',3,10),(31,'#','#',0,0,' ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',3,11),(32,'#','#',0,0,' ຫ້ອງການກະຊວງ',3,12),(33,'#','#',0,0,' ກົມແຜນການ ແລະ ການຮ່ວມມື',3,13),(34,'#','#',0,0,' ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',3,14),(35,'#','#',0,0,' ກົມກວດກາ',3,15),(36,'stat-single-gateway-implementation','index',0,0,' ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ',4,3),(37,'stat-legal','index',0,0,' ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່',4,4),(38,'stat-association-foundation','index',0,0,' ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ',4,5),(39,'stat-local-admin','index',0,0,' ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ',22,1),(40,'stat-ethnic','index',0,0,' ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ',23,1),(41,'stat-religion','index',0,0,' ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ',23,2),(42,'stat-religion-teacher','index',0,0,' ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ',23,1),(43,'stat-religion-place','index',0,0,' ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ',23,4),(44,'stat-population-movement','index',0,0,' ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ',24,1),(45,'stat-population-movement-chart','index',0,0,' ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ',24,2),(46,'stat-officer','index',0,0,' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ',25,1),(47,'stat-officer-age','index',0,0,' ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ',25,2),(48,'stat-officer-degree','index',0,0,' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ',25,3),(49,'stat-officer-resign','index',0,0,' ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',25,4),(50,'stat-officer-add','index',0,0,' ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ',25,5),(51,'stat-officer-contract','index',0,0,' ຈຳນວນພະນັກງານຕາມສັນຍາ',25,6),(52,'stat-officer-position','index',0,0,' ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ',25,7),(53,'stat-officer-need','index',0,0,' ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່',25,8),(54,'stat-officer-ministry','index',0,0,' ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ',25,9),(55,'stat-officer-org','index',0,0,' ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ',25,10),(56,'stat-officer-province','index',0,0,' ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ',25,11),(57,'stat-officer-ministry-add','index',0,0,' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ',25,12),(58,'stat-officer-organisation-add','index',0,0,' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ',25,13),(59,'stat-officer-province-add','index',0,0,' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ',25,14),(60,'stat-officer-ministry-train','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,1),(61,'stat-officer-organisation-train','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,2),(62,'stat-officer-province-train','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,3),(63,'stat-officer-ministry-upgrade','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,4),(64,'stat-officer-organisation-upgrade','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,5),(65,'stat-officer-province-upgrade','index',0,0,' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',26,6),(66,'stat-course','index',0,0,' ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ',27,1),(67,'stat-institute-train','index',0,0,' ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ',27,1),(68,'stat-institute-meeting','index',0,0,' ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ',27,3),(69,'stat-research','index',0,0,' ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ',27,4),(70,'stat-document','index',0,0,' ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',28,1),(71,'statcopy','index',0,0,' ສະຖິຕິການສັງລວມ ການສຳເນົາ',28,2),(72,'stat-highcoin-ministry','index',0,0,' ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ',29,1),(73,'stat-hornorcoin-province','index',0,0,' ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ',29,2),(74,'stat-victorycoin-ministry','index',0,0,' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ',29,3),(75,'stat-victorycoin-province','index',0,0,' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',29,4),(76,'stat-govcoin-ministry','index',0,0,' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ',29,5),(77,'stat-highoversea-ministry','index',0,0,' ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',29,6),(78,'stat-victoryoversea-ministry','index',0,0,' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',29,7),(79,'stat-victoryoversea-province','index',0,0,' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',29,8),(80,'stat-govoversea-ministry','index',0,0,' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',29,9),(81,'stat-govcoin-province','index',0,0,' ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ',29,10),(82,'stat-govoversea-province','index',0,0,' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',29,11),(83,'stat-map-service','index',0,0,' ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ',30,1),(84,'stat-map-produce','index',0,0,' ສະຖິຕິການຜະລິດແຜນທີ່',30,2),(85,'stat-explore','index',0,0,' ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......',30,3),(86,'#','index',0,0,' ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ',30,4),(87,'stat-explore','index',0,0,' ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ',31,1),(88,'stat-officer-salary','index',0,0,' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V',34,1),(89,'stat-officer-technical','index',0,0,' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ',34,2),(90,'stat-officer-age-level','index',0,0,' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ',34,3),(91,'stat-officer-ethnic','index',0,0,' ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',34,4),(92,'stat-position','index',0,0,' ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ',34,5),(93,'stat-officer-new','index',0,0,' ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ',34,6),(94,'#','index',0,0,' ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',34,7),(95,'#','index',0,0,' ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ',34,8),(96,'#','index',0,0,' ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ',34,9),(97,'stat-officer-ethnic','index',0,0,' ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ',34,10),(98,'stat-oda','index',0,0,'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ',33,1),(99,'user','addrole',0,0,'ເພີ່ມ/Add ບົດບາດ',1,1),(100,'user','updaterole',0,0,'ແກ້ໄຂ/Edit ບົດບາດ',1,2),(101,'user','deleterole',0,0,'ລຶບ/Delete ບົດບາດ',1,3),(102,'user','savemenuandaction',0,0,'ບັນທຶກລາຍການເມນູ(ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຫັນ ຫລື ບໍ່ເຫັນລາຍການເມນູ)',1,4),(103,'user','savemenuandaction',0,0,'ບັນທຶກລາຍການຟັງຊັ່ນ(Action ເພື່ອ ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຮັດຫຍັງໄດ້ແດ່)',1,5),(104,'user','listmenu',0,0,'ສະແດງລາຍການເມນູ(Menu)',1,6),(105,'user','listaction',0,0,'ສະແດງລາຍການຟັງຊັ່ນ(Action)',1,7),(106,'ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',5,1),(107,'ministry','delete',0,0,'ລຶບ/Delete',5,2),(108,'ministry','print',0,0,'ພິມ/Print',5,3),(109,'ministry','download',0,0,'ສົ່ງອອກ/Export',5,4),(110,'ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',5,5),(111,'ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',5,6),(112,'ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',5,7),(113,'ministry','inquiry',0,0,'Inquiry',5,8),(114,'ministry','enquiry',0,0,'Enquiry',5,9),(115,'ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',5,10),(116,'stat-goverment-unit','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',12,1),(117,'stat-goverment-unit','delete',0,0,'ລຶບ/Delete',12,2),(118,'stat-goverment-unit','print',0,0,'ພິມ/Print',12,3),(119,'stat-goverment-unit','download',0,0,'ສົ່ງອອກ/Export',12,4),(120,'stat-goverment-unit','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',12,5),(121,'stat-goverment-unit','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',12,6),(122,'stat-goverment-unit','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',12,7),(123,'stat-goverment-unit','inquiry',0,0,'Inquiry',12,8),(124,'stat-goverment-unit','enquiry',0,0,'Enquiry',12,9),(125,'stat-goverment-unit','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',12,10),(126,'stat-single-gateway-implementation','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',36,1),(127,'stat-single-gateway-implementation','delete',0,0,'ລຶບ/Delete',36,2),(128,'stat-single-gateway-implementation','print',0,0,'ພິມ/Print',36,3),(129,'stat-single-gateway-implementation','download',0,0,'ສົ່ງອອກ/Export',36,4),(130,'stat-single-gateway-implementation','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',36,5),(131,'stat-single-gateway-implementation','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',36,6),(132,'stat-single-gateway-implementation','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',36,7),(133,'stat-single-gateway-implementation','inquiry',0,0,'Inquiry',36,8),(134,'stat-single-gateway-implementation','enquiry',0,0,'Enquiry',36,9),(135,'stat-single-gateway-implementation','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',36,10),(136,'stat-legal','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',37,1),(137,'stat-legal','delete',0,0,'ລຶບ/Delete',37,2),(138,'stat-legal','print',0,0,'ພິມ/Print',37,3),(139,'stat-legal','download',0,0,'ສົ່ງອອກ/Export',37,4),(140,'stat-legal','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',37,5),(141,'stat-legal','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',37,6),(142,'stat-legal','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',37,7),(143,'stat-legal','inquiry',0,0,'Inquiry',37,8),(144,'stat-legal','enquiry',0,0,'Enquiry',37,9),(145,'stat-legal','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',37,10),(146,'stat-association-foundation','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',38,1),(147,'stat-association-foundation','delete',0,0,'ລຶບ/Delete',38,2),(148,'stat-association-foundation','print',0,0,'ພິມ/Print',38,3),(149,'stat-association-foundation','download',0,0,'ສົ່ງອອກ/Export',38,4),(150,'stat-association-foundation','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',38,5),(151,'stat-association-foundation','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',38,6),(152,'stat-association-foundation','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',38,7),(153,'stat-association-foundation','inquiry',0,0,'Inquiry',38,8),(154,'stat-association-foundation','enquiry',0,0,'Enquiry',38,9),(155,'stat-association-foundation','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',38,10),(156,'stat-local-admin','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',39,1),(157,'stat-local-admin','delete',0,0,'ລຶບ/Delete',39,2),(158,'stat-local-admin','print',0,0,'ພິມ/Print',39,3),(159,'stat-local-admin','download',0,0,'ສົ່ງອອກ/Export',39,4),(160,'stat-local-admin','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',39,5),(161,'stat-local-admin','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',39,6),(162,'stat-local-admin','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',39,7),(163,'stat-local-admin','inquiry',0,0,'Inquiry',39,8),(164,'stat-local-admin','enquiry',0,0,'Enquiry',39,9),(165,'stat-local-admin','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',39,10),(166,'stat-ethnic','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',40,1),(167,'stat-ethnic','delete',0,0,'ລຶບ/Delete',40,2),(168,'stat-ethnic','print',0,0,'ພິມ/Print',40,3),(169,'stat-ethnic','download',0,0,'ສົ່ງອອກ/Export',40,4),(170,'stat-ethnic','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',40,5),(171,'stat-ethnic','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',40,6),(172,'stat-ethnic','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',40,7),(173,'stat-ethnic','inquiry',0,0,'Inquiry',40,8),(174,'stat-ethnic','enquiry',0,0,'Enquiry',40,9),(175,'stat-ethnic','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',40,10),(176,'stat-religion','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',41,1),(177,'stat-religion','delete',0,0,'ລຶບ/Delete',41,2),(178,'stat-religion','print',0,0,'ພິມ/Print',41,3),(179,'stat-religion','download',0,0,'ສົ່ງອອກ/Export',41,4),(180,'stat-religion','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',41,5),(181,'stat-religion','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',41,6),(182,'stat-religion','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',41,7),(183,'stat-religion','inquiry',0,0,'Inquiry',41,8),(184,'stat-religion','enquiry',0,0,'Enquiry',41,9),(185,'stat-religion','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',41,10),(186,'stat-religion-teacher','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',42,1),(187,'stat-religion-teacher','delete',0,0,'ລຶບ/Delete',42,2),(188,'stat-religion-teacher','print',0,0,'ພິມ/Print',42,3),(189,'stat-religion-teacher','download',0,0,'ສົ່ງອອກ/Export',42,4),(190,'stat-religion-teacher','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',42,5),(191,'stat-religion-teacher','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',42,6),(192,'stat-religion-teacher','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',42,7),(193,'stat-religion-teacher','inquiry',0,0,'Inquiry',42,8),(194,'stat-religion-teacher','enquiry',0,0,'Enquiry',42,9),(195,'stat-religion-teacher','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',42,10),(196,'stat-religion-place','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',43,1),(197,'stat-religion-place','delete',0,0,'ລຶບ/Delete',43,2),(198,'stat-religion-place','print',0,0,'ພິມ/Print',43,3),(199,'stat-religion-place','download',0,0,'ສົ່ງອອກ/Export',43,4),(200,'stat-religion-place','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',43,5),(201,'stat-religion-place','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',43,6),(202,'stat-religion-place','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',43,7),(203,'stat-religion-place','inquiry',0,0,'Inquiry',43,8),(204,'stat-religion-place','enquiry',0,0,'Enquiry',43,9),(205,'stat-religion-place','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',43,10),(206,'stat-population-movement','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',44,1),(207,'stat-population-movement','delete',0,0,'ລຶບ/Delete',44,2),(208,'stat-population-movement','print',0,0,'ພິມ/Print',44,3),(209,'stat-population-movement','download',0,0,'ສົ່ງອອກ/Export',44,4),(210,'stat-population-movement','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',44,5),(211,'stat-population-movement','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',44,6),(212,'stat-population-movement','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',44,7),(213,'stat-population-movement','inquiry',0,0,'Inquiry',44,8),(214,'stat-population-movement','enquiry',0,0,'Enquiry',44,9),(215,'stat-population-movement','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',44,10),(216,'stat-population-movement-chart','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',45,1),(217,'stat-population-movement-chart','delete',0,0,'ລຶບ/Delete',45,2),(218,'stat-population-movement-chart','print',0,0,'ພິມ/Print',45,3),(219,'stat-population-movement-chart','download',0,0,'ສົ່ງອອກ/Export',45,4),(220,'stat-population-movement-chart','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',45,5),(221,'stat-population-movement-chart','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',45,6),(222,'stat-population-movement-chart','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',45,7),(223,'stat-population-movement-chart','inquiry',0,0,'Inquiry',45,8),(224,'stat-population-movement-chart','enquiry',0,0,'Enquiry',45,9),(225,'stat-population-movement-chart','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',45,10),(226,'stat-officer','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',46,1),(227,'stat-officer','delete',0,0,'ລຶບ/Delete',46,2),(228,'stat-officer','print',0,0,'ພິມ/Print',46,3),(229,'stat-officer','download',0,0,'ສົ່ງອອກ/Export',46,4),(230,'stat-officer','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',46,5),(231,'stat-officer','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',46,6),(232,'stat-officer','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',46,7),(233,'stat-officer','inquiry',0,0,'Inquiry',46,8),(234,'stat-officer','enquiry',0,0,'Enquiry',46,9),(235,'stat-officer','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',46,10),(236,'stat-officer-age','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',47,1),(237,'stat-officer-age','delete',0,0,'ລຶບ/Delete',47,2),(238,'stat-officer-age','print',0,0,'ພິມ/Print',47,3),(239,'stat-officer-age','download',0,0,'ສົ່ງອອກ/Export',47,4),(240,'stat-officer-age','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',47,5),(241,'stat-officer-age','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',47,6),(242,'stat-officer-age','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',47,7),(243,'stat-officer-age','inquiry',0,0,'Inquiry',47,8),(244,'stat-officer-age','enquiry',0,0,'Enquiry',47,9),(245,'stat-officer-age','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',47,10),(246,'stat-officer-degree','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',48,1),(247,'stat-officer-degree','delete',0,0,'ລຶບ/Delete',48,2),(248,'stat-officer-degree','print',0,0,'ພິມ/Print',48,3),(249,'stat-officer-degree','download',0,0,'ສົ່ງອອກ/Export',48,4),(250,'stat-officer-degree','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',48,5),(251,'stat-officer-degree','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',48,6),(252,'stat-officer-degree','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',48,7),(253,'stat-officer-degree','inquiry',0,0,'Inquiry',48,8),(254,'stat-officer-degree','enquiry',0,0,'Enquiry',48,9),(255,'stat-officer-degree','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',48,10),(256,'stat-officer-resign','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',49,1),(257,'stat-officer-resign','delete',0,0,'ລຶບ/Delete',49,2),(258,'stat-officer-resign','print',0,0,'ພິມ/Print',49,3),(259,'stat-officer-resign','download',0,0,'ສົ່ງອອກ/Export',49,4),(260,'stat-officer-resign','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',49,5),(261,'stat-officer-resign','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',49,6),(262,'stat-officer-resign','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',49,7),(263,'stat-officer-resign','inquiry',0,0,'Inquiry',49,8),(264,'stat-officer-resign','enquiry',0,0,'Enquiry',49,9),(265,'stat-officer-resign','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',49,10),(266,'stat-officer-add','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',50,1),(267,'stat-officer-add','delete',0,0,'ລຶບ/Delete',50,2),(268,'stat-officer-add','print',0,0,'ພິມ/Print',50,3),(269,'stat-officer-add','download',0,0,'ສົ່ງອອກ/Export',50,4),(270,'stat-officer-add','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',50,5),(271,'stat-officer-add','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',50,6),(272,'stat-officer-add','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',50,7),(273,'stat-officer-add','inquiry',0,0,'Inquiry',50,8),(274,'stat-officer-add','enquiry',0,0,'Enquiry',50,9),(275,'stat-officer-add','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',50,10),(276,'stat-officer-contract','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',51,1),(277,'stat-officer-contract','delete',0,0,'ລຶບ/Delete',51,2),(278,'stat-officer-contract','print',0,0,'ພິມ/Print',51,3),(279,'stat-officer-contract','download',0,0,'ສົ່ງອອກ/Export',51,4),(280,'stat-officer-contract','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',51,5),(281,'stat-officer-contract','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',51,6),(282,'stat-officer-contract','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',51,7),(283,'stat-officer-contract','inquiry',0,0,'Inquiry',51,8),(284,'stat-officer-contract','enquiry',0,0,'Enquiry',51,9),(285,'stat-officer-contract','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',51,10),(286,'stat-officer-position','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',52,1),(287,'stat-officer-position','delete',0,0,'ລຶບ/Delete',52,2),(288,'stat-officer-position','print',0,0,'ພິມ/Print',52,3),(289,'stat-officer-position','download',0,0,'ສົ່ງອອກ/Export',52,4),(290,'stat-officer-position','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',52,5),(291,'stat-officer-position','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',52,6),(292,'stat-officer-position','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',52,7),(293,'stat-officer-position','inquiry',0,0,'Inquiry',52,8),(294,'stat-officer-position','enquiry',0,0,'Enquiry',52,9),(295,'stat-officer-position','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',52,10),(296,'stat-officer-need','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',53,1),(297,'stat-officer-need','delete',0,0,'ລຶບ/Delete',53,2),(298,'stat-officer-need','print',0,0,'ພິມ/Print',53,3),(299,'stat-officer-need','download',0,0,'ສົ່ງອອກ/Export',53,4),(300,'stat-officer-need','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',53,5),(301,'stat-officer-need','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',53,6),(302,'stat-officer-need','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',53,7),(303,'stat-officer-need','inquiry',0,0,'Inquiry',53,8),(304,'stat-officer-need','enquiry',0,0,'Enquiry',53,9),(305,'stat-officer-need','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',53,10),(306,'stat-officer-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',54,1),(307,'stat-officer-ministry','delete',0,0,'ລຶບ/Delete',54,2),(308,'stat-officer-ministry','print',0,0,'ພິມ/Print',54,3),(309,'stat-officer-ministry','download',0,0,'ສົ່ງອອກ/Export',54,4),(310,'stat-officer-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',54,5),(311,'stat-officer-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',54,6),(312,'stat-officer-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',54,7),(313,'stat-officer-ministry','inquiry',0,0,'Inquiry',54,8),(314,'stat-officer-ministry','enquiry',0,0,'Enquiry',54,9),(315,'stat-officer-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',54,10),(316,'stat-officer-org','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',55,1),(317,'stat-officer-org','delete',0,0,'ລຶບ/Delete',55,2),(318,'stat-officer-org','print',0,0,'ພິມ/Print',55,3),(319,'stat-officer-org','download',0,0,'ສົ່ງອອກ/Export',55,4),(320,'stat-officer-org','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',55,5),(321,'stat-officer-org','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',55,6),(322,'stat-officer-org','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',55,7),(323,'stat-officer-org','inquiry',0,0,'Inquiry',55,8),(324,'stat-officer-org','enquiry',0,0,'Enquiry',55,9),(325,'stat-officer-org','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',55,10),(326,'stat-officer-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',56,1),(327,'stat-officer-province','delete',0,0,'ລຶບ/Delete',56,2),(328,'stat-officer-province','print',0,0,'ພິມ/Print',56,3),(329,'stat-officer-province','download',0,0,'ສົ່ງອອກ/Export',56,4),(330,'stat-officer-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',56,5),(331,'stat-officer-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',56,6),(332,'stat-officer-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',56,7),(333,'stat-officer-province','inquiry',0,0,'Inquiry',56,8),(334,'stat-officer-province','enquiry',0,0,'Enquiry',56,9),(335,'stat-officer-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',56,10),(336,'stat-officer-ministry-add','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',57,1),(337,'stat-officer-ministry-add','delete',0,0,'ລຶບ/Delete',57,2),(338,'stat-officer-ministry-add','print',0,0,'ພິມ/Print',57,3),(339,'stat-officer-ministry-add','download',0,0,'ສົ່ງອອກ/Export',57,4),(340,'stat-officer-ministry-add','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',57,5),(341,'stat-officer-ministry-add','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',57,6),(342,'stat-officer-ministry-add','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',57,7),(343,'stat-officer-ministry-add','inquiry',0,0,'Inquiry',57,8),(344,'stat-officer-ministry-add','enquiry',0,0,'Enquiry',57,9),(345,'stat-officer-ministry-add','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',57,10),(346,'stat-officer-organisation-add','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',58,1),(347,'stat-officer-organisation-add','delete',0,0,'ລຶບ/Delete',58,2),(348,'stat-officer-organisation-add','print',0,0,'ພິມ/Print',58,3),(349,'stat-officer-organisation-add','download',0,0,'ສົ່ງອອກ/Export',58,4),(350,'stat-officer-organisation-add','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',58,5),(351,'stat-officer-organisation-add','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',58,6),(352,'stat-officer-organisation-add','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',58,7),(353,'stat-officer-organisation-add','inquiry',0,0,'Inquiry',58,8),(354,'stat-officer-organisation-add','enquiry',0,0,'Enquiry',58,9),(355,'stat-officer-organisation-add','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',58,10),(356,'stat-officer-province-add','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',59,1),(357,'stat-officer-province-add','delete',0,0,'ລຶບ/Delete',59,2),(358,'stat-officer-province-add','print',0,0,'ພິມ/Print',59,3),(359,'stat-officer-province-add','download',0,0,'ສົ່ງອອກ/Export',59,4),(360,'stat-officer-province-add','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',59,5),(361,'stat-officer-province-add','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',59,6),(362,'stat-officer-province-add','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',59,7),(363,'stat-officer-province-add','inquiry',0,0,'Inquiry',59,8),(364,'stat-officer-province-add','enquiry',0,0,'Enquiry',59,9),(365,'stat-officer-province-add','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',59,10),(366,'stat-officer-ministry-train','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',60,1),(367,'stat-officer-ministry-train','delete',0,0,'ລຶບ/Delete',60,2),(368,'stat-officer-ministry-train','print',0,0,'ພິມ/Print',60,3),(369,'stat-officer-ministry-train','download',0,0,'ສົ່ງອອກ/Export',60,4),(370,'stat-officer-ministry-train','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',60,5),(371,'stat-officer-ministry-train','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',60,6),(372,'stat-officer-ministry-train','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',60,7),(373,'stat-officer-ministry-train','inquiry',0,0,'Inquiry',60,8),(374,'stat-officer-ministry-train','enquiry',0,0,'Enquiry',60,9),(375,'stat-officer-ministry-train','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',60,10),(376,'stat-officer-organisation-train','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',61,1),(377,'stat-officer-organisation-train','delete',0,0,'ລຶບ/Delete',61,2),(378,'stat-officer-organisation-train','print',0,0,'ພິມ/Print',61,3),(379,'stat-officer-organisation-train','download',0,0,'ສົ່ງອອກ/Export',61,4),(380,'stat-officer-organisation-train','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',61,5),(381,'stat-officer-organisation-train','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',61,6),(382,'stat-officer-organisation-train','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',61,7),(383,'stat-officer-organisation-train','inquiry',0,0,'Inquiry',61,8),(384,'stat-officer-organisation-train','enquiry',0,0,'Enquiry',61,9),(385,'stat-officer-organisation-train','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',61,10),(386,'stat-officer-province-train','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',62,1),(387,'stat-officer-province-train','delete',0,0,'ລຶບ/Delete',62,2),(388,'stat-officer-province-train','print',0,0,'ພິມ/Print',62,3),(389,'stat-officer-province-train','download',0,0,'ສົ່ງອອກ/Export',62,4),(390,'stat-officer-province-train','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',62,5),(391,'stat-officer-province-train','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',62,6),(392,'stat-officer-province-train','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',62,7),(393,'stat-officer-province-train','inquiry',0,0,'Inquiry',62,8),(394,'stat-officer-province-train','enquiry',0,0,'Enquiry',62,9),(395,'stat-officer-province-train','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',62,10),(396,'stat-officer-ministry-upgrade','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',63,1),(397,'stat-officer-ministry-upgrade','delete',0,0,'ລຶບ/Delete',63,2),(398,'stat-officer-ministry-upgrade','print',0,0,'ພິມ/Print',63,3),(399,'stat-officer-ministry-upgrade','download',0,0,'ສົ່ງອອກ/Export',63,4),(400,'stat-officer-ministry-upgrade','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',63,5),(401,'stat-officer-ministry-upgrade','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',63,6),(402,'stat-officer-ministry-upgrade','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',63,7),(403,'stat-officer-ministry-upgrade','inquiry',0,0,'Inquiry',63,8),(404,'stat-officer-ministry-upgrade','enquiry',0,0,'Enquiry',63,9),(405,'stat-officer-ministry-upgrade','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',63,10),(406,'stat-officer-organisation-upgrade','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',64,1),(407,'stat-officer-organisation-upgrade','delete',0,0,'ລຶບ/Delete',64,2),(408,'stat-officer-organisation-upgrade','print',0,0,'ພິມ/Print',64,3),(409,'stat-officer-organisation-upgrade','download',0,0,'ສົ່ງອອກ/Export',64,4),(410,'stat-officer-organisation-upgrade','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',64,5),(411,'stat-officer-organisation-upgrade','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',64,6),(412,'stat-officer-organisation-upgrade','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',64,7),(413,'stat-officer-organisation-upgrade','inquiry',0,0,'Inquiry',64,8),(414,'stat-officer-organisation-upgrade','enquiry',0,0,'Enquiry',64,9),(415,'stat-officer-organisation-upgrade','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',64,10),(416,'stat-officer-province-upgrade','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',65,1),(417,'stat-officer-province-upgrade','delete',0,0,'ລຶບ/Delete',65,2),(418,'stat-officer-province-upgrade','print',0,0,'ພິມ/Print',65,3),(419,'stat-officer-province-upgrade','download',0,0,'ສົ່ງອອກ/Export',65,4),(420,'stat-officer-province-upgrade','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',65,5),(421,'stat-officer-province-upgrade','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',65,6),(422,'stat-officer-province-upgrade','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',65,7),(423,'stat-officer-province-upgrade','inquiry',0,0,'Inquiry',65,8),(424,'stat-officer-province-upgrade','enquiry',0,0,'Enquiry',65,9),(425,'stat-officer-province-upgrade','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',65,10),(426,'stat-course','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',66,1),(427,'stat-course','delete',0,0,'ລຶບ/Delete',66,2),(428,'stat-course','print',0,0,'ພິມ/Print',66,3),(429,'stat-course','download',0,0,'ສົ່ງອອກ/Export',66,4),(430,'stat-course','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',66,5),(431,'stat-course','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',66,6),(432,'stat-course','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',66,7),(433,'stat-course','inquiry',0,0,'Inquiry',66,8),(434,'stat-course','enquiry',0,0,'Enquiry',66,9),(435,'stat-course','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',66,10),(436,'stat-institute-train','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',67,1),(437,'stat-institute-train','delete',0,0,'ລຶບ/Delete',67,2),(438,'stat-institute-train','print',0,0,'ພິມ/Print',67,3),(439,'stat-institute-train','download',0,0,'ສົ່ງອອກ/Export',67,4),(440,'stat-institute-train','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',67,5),(441,'stat-institute-train','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',67,6),(442,'stat-institute-train','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',67,7),(443,'stat-institute-train','inquiry',0,0,'Inquiry',67,8),(444,'stat-institute-train','enquiry',0,0,'Enquiry',67,9),(445,'stat-institute-train','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',67,10),(446,'stat-institute-meeting','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',68,1),(447,'stat-institute-meeting','delete',0,0,'ລຶບ/Delete',68,2),(448,'stat-institute-meeting','print',0,0,'ພິມ/Print',68,3),(449,'stat-institute-meeting','download',0,0,'ສົ່ງອອກ/Export',68,4),(450,'stat-institute-meeting','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',68,5),(451,'stat-institute-meeting','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',68,6),(452,'stat-institute-meeting','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',68,7),(453,'stat-institute-meeting','inquiry',0,0,'Inquiry',68,8),(454,'stat-institute-meeting','enquiry',0,0,'Enquiry',68,9),(455,'stat-institute-meeting','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',68,10),(456,'stat-research','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',69,1),(457,'stat-research','delete',0,0,'ລຶບ/Delete',69,2),(458,'stat-research','print',0,0,'ພິມ/Print',69,3),(459,'stat-research','download',0,0,'ສົ່ງອອກ/Export',69,4),(460,'stat-research','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',69,5),(461,'stat-research','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',69,6),(462,'stat-research','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',69,7),(463,'stat-research','inquiry',0,0,'Inquiry',69,8),(464,'stat-research','enquiry',0,0,'Enquiry',69,9),(465,'stat-research','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',69,10),(466,'stat-document','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',70,1),(467,'stat-document','delete',0,0,'ລຶບ/Delete',70,2),(468,'stat-document','print',0,0,'ພິມ/Print',70,3),(469,'stat-document','download',0,0,'ສົ່ງອອກ/Export',70,4),(470,'stat-document','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',70,5),(471,'stat-document','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',70,6),(472,'stat-document','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',70,7),(473,'stat-document','inquiry',0,0,'Inquiry',70,8),(474,'stat-document','enquiry',0,0,'Enquiry',70,9),(475,'stat-document','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',70,10),(476,'statcopy','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',71,1),(477,'statcopy','delete',0,0,'ລຶບ/Delete',71,2),(478,'statcopy','print',0,0,'ພິມ/Print',71,3),(479,'statcopy','download',0,0,'ສົ່ງອອກ/Export',71,4),(480,'statcopy','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',71,5),(481,'statcopy','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',71,6),(482,'statcopy','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',71,7),(483,'statcopy','inquiry',0,0,'Inquiry',71,8),(484,'statcopy','enquiry',0,0,'Enquiry',71,9),(485,'statcopy','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',71,10),(486,'stat-highcoin-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',72,1),(487,'stat-highcoin-ministry','delete',0,0,'ລຶບ/Delete',72,2),(488,'stat-highcoin-ministry','print',0,0,'ພິມ/Print',72,3),(489,'stat-highcoin-ministry','download',0,0,'ສົ່ງອອກ/Export',72,4),(490,'stat-highcoin-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',72,5),(491,'stat-highcoin-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',72,6),(492,'stat-highcoin-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',72,7),(493,'stat-highcoin-ministry','inquiry',0,0,'Inquiry',72,8),(494,'stat-highcoin-ministry','enquiry',0,0,'Enquiry',72,9),(495,'stat-highcoin-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',72,10),(496,'stat-hornorcoin-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',73,1),(497,'stat-hornorcoin-province','delete',0,0,'ລຶບ/Delete',73,2),(498,'stat-hornorcoin-province','print',0,0,'ພິມ/Print',73,3),(499,'stat-hornorcoin-province','download',0,0,'ສົ່ງອອກ/Export',73,4),(500,'stat-hornorcoin-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',73,5),(501,'stat-hornorcoin-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',73,6),(502,'stat-hornorcoin-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',73,7),(503,'stat-hornorcoin-province','inquiry',0,0,'Inquiry',73,8),(504,'stat-hornorcoin-province','enquiry',0,0,'Enquiry',73,9),(505,'stat-hornorcoin-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',73,10),(506,'stat-victorycoin-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',74,1),(507,'stat-victorycoin-ministry','delete',0,0,'ລຶບ/Delete',74,2),(508,'stat-victorycoin-ministry','print',0,0,'ພິມ/Print',74,3),(509,'stat-victorycoin-ministry','download',0,0,'ສົ່ງອອກ/Export',74,4),(510,'stat-victorycoin-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',74,5),(511,'stat-victorycoin-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',74,6),(512,'stat-victorycoin-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',74,7),(513,'stat-victorycoin-ministry','inquiry',0,0,'Inquiry',74,8),(514,'stat-victorycoin-ministry','enquiry',0,0,'Enquiry',74,9),(515,'stat-victorycoin-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',74,10),(516,'stat-victorycoin-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',75,1),(517,'stat-victorycoin-province','delete',0,0,'ລຶບ/Delete',75,2),(518,'stat-victorycoin-province','print',0,0,'ພິມ/Print',75,3),(519,'stat-victorycoin-province','download',0,0,'ສົ່ງອອກ/Export',75,4),(520,'stat-victorycoin-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',75,5),(521,'stat-victorycoin-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',75,6),(522,'stat-victorycoin-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',75,7),(523,'stat-victorycoin-province','inquiry',0,0,'Inquiry',75,8),(524,'stat-victorycoin-province','enquiry',0,0,'Enquiry',75,9),(525,'stat-victorycoin-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',75,10),(526,'stat-govcoin-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',76,1),(527,'stat-govcoin-ministry','delete',0,0,'ລຶບ/Delete',76,2),(528,'stat-govcoin-ministry','print',0,0,'ພິມ/Print',76,3),(529,'stat-govcoin-ministry','download',0,0,'ສົ່ງອອກ/Export',76,4),(530,'stat-govcoin-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',76,5),(531,'stat-govcoin-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',76,6),(532,'stat-govcoin-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',76,7),(533,'stat-govcoin-ministry','inquiry',0,0,'Inquiry',76,8),(534,'stat-govcoin-ministry','enquiry',0,0,'Enquiry',76,9),(535,'stat-govcoin-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',76,10),(536,'stat-highoversea-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',77,1),(537,'stat-highoversea-ministry','delete',0,0,'ລຶບ/Delete',77,2),(538,'stat-highoversea-ministry','print',0,0,'ພິມ/Print',77,3),(539,'stat-highoversea-ministry','download',0,0,'ສົ່ງອອກ/Export',77,4),(540,'stat-highoversea-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',77,5),(541,'stat-highoversea-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',77,6),(542,'stat-highoversea-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',77,7),(543,'stat-highoversea-ministry','inquiry',0,0,'Inquiry',77,8),(544,'stat-highoversea-ministry','enquiry',0,0,'Enquiry',77,9),(545,'stat-highoversea-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',77,10),(546,'stat-victoryoversea-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',78,1),(547,'stat-victoryoversea-ministry','delete',0,0,'ລຶບ/Delete',78,2),(548,'stat-victoryoversea-ministry','print',0,0,'ພິມ/Print',78,3),(549,'stat-victoryoversea-ministry','download',0,0,'ສົ່ງອອກ/Export',78,4),(550,'stat-victoryoversea-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',78,5),(551,'stat-victoryoversea-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',78,6),(552,'stat-victoryoversea-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',78,7),(553,'stat-victoryoversea-ministry','inquiry',0,0,'Inquiry',78,8),(554,'stat-victoryoversea-ministry','enquiry',0,0,'Enquiry',78,9),(555,'stat-victoryoversea-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',78,10),(556,'stat-victoryoversea-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',79,1),(557,'stat-victoryoversea-province','delete',0,0,'ລຶບ/Delete',79,2),(558,'stat-victoryoversea-province','print',0,0,'ພິມ/Print',79,3),(559,'stat-victoryoversea-province','download',0,0,'ສົ່ງອອກ/Export',79,4),(560,'stat-victoryoversea-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',79,5),(561,'stat-victoryoversea-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',79,6),(562,'stat-victoryoversea-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',79,7),(563,'stat-victoryoversea-province','inquiry',0,0,'Inquiry',79,8),(564,'stat-victoryoversea-province','enquiry',0,0,'Enquiry',79,9),(565,'stat-victoryoversea-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',79,10),(566,'stat-govoversea-ministry','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',80,1),(567,'stat-govoversea-ministry','delete',0,0,'ລຶບ/Delete',80,2),(568,'stat-govoversea-ministry','print',0,0,'ພິມ/Print',80,3),(569,'stat-govoversea-ministry','download',0,0,'ສົ່ງອອກ/Export',80,4),(570,'stat-govoversea-ministry','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',80,5),(571,'stat-govoversea-ministry','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',80,6),(572,'stat-govoversea-ministry','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',80,7),(573,'stat-govoversea-ministry','inquiry',0,0,'Inquiry',80,8),(574,'stat-govoversea-ministry','enquiry',0,0,'Enquiry',80,9),(575,'stat-govoversea-ministry','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',80,10),(576,'stat-govcoin-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',81,1),(577,'stat-govcoin-province','delete',0,0,'ລຶບ/Delete',81,2),(578,'stat-govcoin-province','print',0,0,'ພິມ/Print',81,3),(579,'stat-govcoin-province','download',0,0,'ສົ່ງອອກ/Export',81,4),(580,'stat-govcoin-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',81,5),(581,'stat-govcoin-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',81,6),(582,'stat-govcoin-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',81,7),(583,'stat-govcoin-province','inquiry',0,0,'Inquiry',81,8),(584,'stat-govcoin-province','enquiry',0,0,'Enquiry',81,9),(585,'stat-govcoin-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',81,10),(586,'stat-govoversea-province','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',82,1),(587,'stat-govoversea-province','delete',0,0,'ລຶບ/Delete',82,2),(588,'stat-govoversea-province','print',0,0,'ພິມ/Print',82,3),(589,'stat-govoversea-province','download',0,0,'ສົ່ງອອກ/Export',82,4),(590,'stat-govoversea-province','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',82,5),(591,'stat-govoversea-province','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',82,6),(592,'stat-govoversea-province','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',82,7),(593,'stat-govoversea-province','inquiry',0,0,'Inquiry',82,8),(594,'stat-govoversea-province','enquiry',0,0,'Enquiry',82,9),(595,'stat-govoversea-province','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',82,10),(596,'stat-map-service','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',83,1),(597,'stat-map-service','delete',0,0,'ລຶບ/Delete',83,2),(598,'stat-map-service','print',0,0,'ພິມ/Print',83,3),(599,'stat-map-service','download',0,0,'ສົ່ງອອກ/Export',83,4),(600,'stat-map-service','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',83,5),(601,'stat-map-service','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',83,6),(602,'stat-map-service','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',83,7),(603,'stat-map-service','inquiry',0,0,'Inquiry',83,8),(604,'stat-map-service','enquiry',0,0,'Enquiry',83,9),(605,'stat-map-service','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',83,10),(606,'stat-map-produce','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',84,1),(607,'stat-map-produce','delete',0,0,'ລຶບ/Delete',84,2),(608,'stat-map-produce','print',0,0,'ພິມ/Print',84,3),(609,'stat-map-produce','download',0,0,'ສົ່ງອອກ/Export',84,4),(610,'stat-map-produce','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',84,5),(611,'stat-map-produce','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',84,6),(612,'stat-map-produce','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',84,7),(613,'stat-map-produce','inquiry',0,0,'Inquiry',84,8),(614,'stat-map-produce','enquiry',0,0,'Enquiry',84,9),(615,'stat-map-produce','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',84,10),(616,'stat-explore','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',85,1),(617,'stat-explore','delete',0,0,'ລຶບ/Delete',85,2),(618,'stat-explore','print',0,0,'ພິມ/Print',85,3),(619,'stat-explore','download',0,0,'ສົ່ງອອກ/Export',85,4),(620,'stat-explore','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',85,5),(621,'stat-explore','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',85,6),(622,'stat-explore','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',85,7),(623,'stat-explore','inquiry',0,0,'Inquiry',85,8),(624,'stat-explore','enquiry',0,0,'Enquiry',85,9),(625,'stat-explore','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',85,10),(626,'#','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',86,1),(627,'#','delete',0,0,'ລຶບ/Delete',86,2),(628,'#','print',0,0,'ພິມ/Print',86,3),(629,'#','download',0,0,'ສົ່ງອອກ/Export',86,4),(630,'#','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',86,5),(631,'#','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',86,6),(632,'#','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',86,7),(633,'#','inquiry',0,0,'Inquiry',86,8),(634,'#','enquiry',0,0,'Enquiry',86,9),(635,'#','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',86,10),(636,'stat-explore','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',87,1),(637,'stat-explore','delete',0,0,'ລຶບ/Delete',87,2),(638,'stat-explore','print',0,0,'ພິມ/Print',87,3),(639,'stat-explore','download',0,0,'ສົ່ງອອກ/Export',87,4),(640,'stat-explore','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',87,5),(641,'stat-explore','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',87,6),(642,'stat-explore','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',87,7),(643,'stat-explore','inquiry',0,0,'Inquiry',87,8),(644,'stat-explore','enquiry',0,0,'Enquiry',87,9),(645,'stat-explore','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',87,10),(646,'stat-officer-salary','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',88,1),(647,'stat-officer-salary','delete',0,0,'ລຶບ/Delete',88,2),(648,'stat-officer-salary','print',0,0,'ພິມ/Print',88,3),(649,'stat-officer-salary','download',0,0,'ສົ່ງອອກ/Export',88,4),(650,'stat-officer-salary','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',88,5),(651,'stat-officer-salary','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',88,6),(652,'stat-officer-salary','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',88,7),(653,'stat-officer-salary','inquiry',0,0,'Inquiry',88,8),(654,'stat-officer-salary','enquiry',0,0,'Enquiry',88,9),(655,'stat-officer-salary','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',88,10),(656,'stat-officer-technical','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',89,1),(657,'stat-officer-technical','delete',0,0,'ລຶບ/Delete',89,2),(658,'stat-officer-technical','print',0,0,'ພິມ/Print',89,3),(659,'stat-officer-technical','download',0,0,'ສົ່ງອອກ/Export',89,4),(660,'stat-officer-technical','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',89,5),(661,'stat-officer-technical','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',89,6),(662,'stat-officer-technical','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',89,7),(663,'stat-officer-technical','inquiry',0,0,'Inquiry',89,8),(664,'stat-officer-technical','enquiry',0,0,'Enquiry',89,9),(665,'stat-officer-technical','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',89,10),(666,'stat-officer-age-level','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',90,1),(667,'stat-officer-age-level','delete',0,0,'ລຶບ/Delete',90,2),(668,'stat-officer-age-level','print',0,0,'ພິມ/Print',90,3),(669,'stat-officer-age-level','download',0,0,'ສົ່ງອອກ/Export',90,4),(670,'stat-officer-age-level','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',90,5),(671,'stat-officer-age-level','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',90,6),(672,'stat-officer-age-level','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',90,7),(673,'stat-officer-age-level','inquiry',0,0,'Inquiry',90,8),(674,'stat-officer-age-level','enquiry',0,0,'Enquiry',90,9),(675,'stat-officer-age-level','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',90,10),(676,'stat-officer-ethnic','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',91,1),(677,'stat-officer-ethnic','delete',0,0,'ລຶບ/Delete',91,2),(678,'stat-officer-ethnic','print',0,0,'ພິມ/Print',91,3),(679,'stat-officer-ethnic','download',0,0,'ສົ່ງອອກ/Export',91,4),(680,'stat-officer-ethnic','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',91,5),(681,'stat-officer-ethnic','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',91,6),(682,'stat-officer-ethnic','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',91,7),(683,'stat-officer-ethnic','inquiry',0,0,'Inquiry',91,8),(684,'stat-officer-ethnic','enquiry',0,0,'Enquiry',91,9),(685,'stat-officer-ethnic','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',91,10),(686,'stat-position','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',92,1),(687,'stat-position','delete',0,0,'ລຶບ/Delete',92,2),(688,'stat-position','print',0,0,'ພິມ/Print',92,3),(689,'stat-position','download',0,0,'ສົ່ງອອກ/Export',92,4),(690,'stat-position','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',92,5),(691,'stat-position','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',92,6),(692,'stat-position','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',92,7),(693,'stat-position','inquiry',0,0,'Inquiry',92,8),(694,'stat-position','enquiry',0,0,'Enquiry',92,9),(695,'stat-position','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',92,10),(696,'stat-officer-new','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',93,1),(697,'stat-officer-new','delete',0,0,'ລຶບ/Delete',93,2),(698,'stat-officer-new','print',0,0,'ພິມ/Print',93,3),(699,'stat-officer-new','download',0,0,'ສົ່ງອອກ/Export',93,4),(700,'stat-officer-new','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',93,5),(701,'stat-officer-new','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',93,6),(702,'stat-officer-new','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',93,7),(703,'stat-officer-new','inquiry',0,0,'Inquiry',93,8),(704,'stat-officer-new','enquiry',0,0,'Enquiry',93,9),(705,'stat-officer-new','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',93,10),(706,'#','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',94,1),(707,'#','delete',0,0,'ລຶບ/Delete',94,2),(708,'#','print',0,0,'ພິມ/Print',94,3),(709,'#','download',0,0,'ສົ່ງອອກ/Export',94,4),(710,'#','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',94,5),(711,'#','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',94,6),(712,'#','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',94,7),(713,'#','inquiry',0,0,'Inquiry',94,8),(714,'#','enquiry',0,0,'Enquiry',94,9),(715,'#','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',94,10),(716,'#','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',95,1),(717,'#','delete',0,0,'ລຶບ/Delete',95,2),(718,'#','print',0,0,'ພິມ/Print',95,3),(719,'#','download',0,0,'ສົ່ງອອກ/Export',95,4),(720,'#','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',95,5),(721,'#','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',95,6),(722,'#','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',95,7),(723,'#','inquiry',0,0,'Inquiry',95,8),(724,'#','enquiry',0,0,'Enquiry',95,9),(725,'#','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',95,10),(726,'#','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',96,1),(727,'#','delete',0,0,'ລຶບ/Delete',96,2),(728,'#','print',0,0,'ພິມ/Print',96,3),(729,'#','download',0,0,'ສົ່ງອອກ/Export',96,4),(730,'#','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',96,5),(731,'#','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',96,6),(732,'#','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',96,7),(733,'#','inquiry',0,0,'Inquiry',96,8),(734,'#','enquiry',0,0,'Enquiry',96,9),(735,'#','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',96,10),(736,'stat-officer-ethnic','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',97,1),(737,'stat-officer-ethnic','delete',0,0,'ລຶບ/Delete',97,2),(738,'stat-officer-ethnic','print',0,0,'ພິມ/Print',97,3),(739,'stat-officer-ethnic','download',0,0,'ສົ່ງອອກ/Export',97,4),(740,'stat-officer-ethnic','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',97,5),(741,'stat-officer-ethnic','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',97,6),(742,'stat-officer-ethnic','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',97,7),(743,'stat-officer-ethnic','inquiry',0,0,'Inquiry',97,8),(744,'stat-officer-ethnic','enquiry',0,0,'Enquiry',97,9),(745,'stat-officer-ethnic','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',97,10),(746,'stat-oda','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',98,1),(747,'stat-oda','delete',0,0,'ລຶບ/Delete',98,2),(748,'stat-oda','print',0,0,'ພິມ/Print',98,3),(749,'stat-oda','download',0,0,'ສົ່ງອອກ/Export',98,4),(750,'stat-oda','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',98,5),(751,'stat-oda','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',98,6),(752,'stat-oda','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',98,7),(753,'stat-oda','inquiry',0,0,'Inquiry',98,8),(754,'stat-oda','enquiry',0,0,'Enquiry',98,9),(755,'stat-oda','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',98,10),(756,'#','save',0,0,'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ',35,1),(757,'#','delete',0,0,'ລຶບ/Delete',35,2),(758,'#','print',0,0,'ພິມ/Print',35,3),(759,'#','download',0,0,'ສົ່ງອອກ/Export',35,4),(760,'#','updload',0,0,'ອັບໂຫຼດເອກະສານອ້າງອີງ',35,5),(761,'#','deletefile',0,0,'ລຶບເອກະສານອ້າງອີງ',35,6),(762,'#','get',0,0,'ໂຫຼດສົກປີ/Load Phiscal Year',35,7),(763,'#','inquiry',0,0,'Inquiry',35,8),(764,'#','enquiry',0,0,'Enquiry',35,9),(765,'#','getreferences',0,0,'ສະແດງເອກະສານອ້າງອີງ',35,10),(766,'user','manageuser',0,0,'ເພີ່ມ/Add ຜູ້ໃຊ້',2,1),(767,'user','manageuser',0,0,'ແກ້ໄຂ/Edit ຜູ້ໃຊ້',2,2),(768,'user','subordinateandbranch',0,0,'ບັນທຶກ ແລະ ບໍລິຫານ (Subordinate(s))',2,3),(769,'user','subordinateandbranch',0,0,'ບັນທຶກ ແລະ ບໍລິຫານບັນດາກົມ (Department(s))',2,4),(770,'user','subordinateandbranch',0,0,'ບັນທຶກ ແລະ ບໍລິຫານບັນດາແຂວງ (Province(s))',2,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approver`
--

LOCK TABLES `approver` WRITE;
/*!40000 ALTER TABLE `approver` DISABLE KEYS */;
INSERT INTO `approver` (`id`, `deleted`, `ministry_id`, `province_id`, `approver_level_id`) VALUES (1,0,27,NULL,1),(2,0,NULL,1,2),(3,0,NULL,17,2),(4,0,NULL,16,2),(5,0,NULL,6,2),(6,0,NULL,15,2),(7,0,NULL,14,2),(8,0,NULL,13,2),(9,0,NULL,12,2),(10,0,NULL,11,2),(11,0,NULL,10,2),(12,0,NULL,9,2),(13,0,NULL,8,2),(14,0,NULL,7,2),(15,0,NULL,5,2),(16,0,NULL,4,2),(17,0,NULL,3,2),(18,0,NULL,2,2),(19,0,NULL,18,2);
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
INSERT INTO `approver_level` (`id`, `name`, `deleted`, `position`, `code`) VALUES (1,'ຂັ້ນກະຊວງພາຍໃນອະນຸມັດ',0,1,'M'),(2,'ຂັ້ນແຂວງອະນຸມັດ',0,2,'P');
/*!40000 ALTER TABLE `approver_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phiscal_year_id` int(11) NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `issued_no` varchar(255) DEFAULT NULL,
  `issued_by` varchar(255) DEFAULT NULL,
  `data` blob,
  `dir` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attachment_menu1_idx` (`menu_id`),
  KEY `fk_attachment_user1_idx` (`user_id`),
  KEY `fk_attachment_phiscal_year1_idx` (`phiscal_year_id`),
  CONSTRAINT `fk_attachment_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attachment_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attachment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` (`menu_id`, `name`, `deleted`, `user_id`, `id`, `phiscal_year_id`, `upload_date`, `issued_date`, `issued_no`, `issued_by`, `data`, `dir`, `original_name`) VALUES (100,'stat_highcoin_ministry_2017_10_19_002128.jpg',1,1,1,1,'2017-10-19 00:21:28','2017-10-04 00:00:00','0','gg',NULL,'2017','10520821_764675226942214_7408213358830219784_o.jpg'),(71,'stat_local_admin_2017_10_19_020704.xlsx',1,1,2,1,'2017-10-19 02:07:04','2017-10-18 00:00:00','ຢຟໂ','ເດດດດດ',NULL,'2017','ImportList.xlsx'),(71,'stat_local_admin_2017_10_19_020730.eddx',1,1,3,1,'2017-10-19 02:07:30','2017-10-18 00:00:00','1212121','ກດກດກດ',NULL,'2017','Finger print network.eddx'),(91,'stat_map_service_2018_03_20_082434.png',1,1,4,1,'2018-03-20 08:24:34','2018-03-30 00:00:00','sg','sdgasd',NULL,'2018','lemon.png');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
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
INSERT INTO `award` (`id`, `name`, `deleted`, `user_id`, `position`) VALUES (1,'ຜົນງານ 70 ປີ ວັນສ້າງຕັ້ງ',0,2,1),(2,'ພັດທະນາການສຶກສາ ແລະ ກິລາ',0,2,NULL),(3,'ຜົນງານ 35 ປີ',0,2,NULL),(4,'ຜົນງານ 60 ປີ ວັນສ້າງຕັ້ງ',0,2,NULL),(5,'ບັ້ນ 3 ສ້າງ',0,2,NULL),(6,'ບັ້ນຕ່າງໆ',0,2,NULL);
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
INSERT INTO `book` (`id`, `name`, `deleted`, `position`, `last_update`, `user_id`) VALUES (1,'ປຶ້ມກ່ອນປີ 1975',0,1,'2017-09-16 18:19:24',2),(2,'ປຶ້ມພາຍຫຼັງປົດປ່ອຍຊາດ',0,2,'2017-09-16 18:19:42',2),(3,'ເອກະສານປະເພດກະແຊັດ',0,3,'2017-09-16 18:19:57',2),(4,'ວີດີໂອ',0,4,'2017-09-16 18:20:10',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` (`id`, `code`, `name`, `address`, `tel`, `deleted`, `position`, `remark`, `user_id`, `last_update`, `ministry_id`) VALUES (1,NULL,'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',NULL,NULL,0,1,NULL,1,NULL,27),(2,NULL,'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮ',NULL,NULL,0,1,NULL,1,NULL,27),(3,NULL,'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',NULL,NULL,0,1,NULL,1,NULL,27),(4,NULL,'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',NULL,NULL,0,1,NULL,1,NULL,27),(5,NULL,'ກົມຄຸ້ມຄອງພົນລະເມືອງ',NULL,NULL,0,1,NULL,1,NULL,27),(6,NULL,'ກົມການປົກຄອງທ້ອງຖິ່ນ',NULL,NULL,0,1,NULL,1,NULL,27),(7,NULL,'ກົມພັດທະນາການບໍລິຫານລັດ',NULL,NULL,0,1,NULL,1,NULL,27),(8,NULL,'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ',NULL,NULL,0,1,NULL,1,NULL,27),(9,NULL,'ກົມແຜນທີ່ແຫ່ງຊາດ',NULL,NULL,0,1,NULL,1,NULL,27),(10,NULL,'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',NULL,NULL,0,1,NULL,1,NULL,27),(11,NULL,'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',NULL,NULL,0,1,NULL,1,NULL,27),(12,NULL,'ກົມແຜນການ ແລະ ການຮ່ວມມື',NULL,NULL,0,1,NULL,1,NULL,27),(13,NULL,'ກົມຄຸ້ມຄອງລັດຖະກອນ',NULL,NULL,0,1,NULL,1,NULL,27);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `code` varchar(20) NOT NULL,
  `value` text,
  PRIMARY KEY (`code`),
  UNIQUE KEY `content_code_uindex` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`code`, `value`) VALUES ('ADDRESS','ບ້ານ ໂພນເຄັງ ເມືອງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ'),('EMAIL','info@moha.gov.la'),('LAT','17.9833176'),('LON','102.6315113'),('MAPZOOM','18'),('TELEPHONE','021 222 222'),('WEBSITE','phoubao.com');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
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
INSERT INTO `district` (`id`, `district_code`, `district_name`, `province_id`, `record_status`, `input_id`, `input_dt_stamp`, `deleted`) VALUES (1,'0101','ຈັນທະບູລີ',1,NULL,NULL,'2017-09-01 09:48:59',0),(2,'0102','ສີໂຄດຕະບອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(3,'0103','ສີສັດຕະນາກ',1,NULL,NULL,'2017-09-01 09:48:59',0),(4,'0104','ໄຊເສດຖາ',1,NULL,NULL,'2017-09-01 09:48:59',0),(5,'0105','ນາຊາຍທອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(6,'0106','ໄຊທານີ',1,NULL,NULL,'2017-09-01 09:48:59',0),(7,'0107','ຫາດຊາຍຟອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(8,'0108','ສັງທອງ',1,NULL,NULL,'2017-09-01 09:48:59',0),(9,'0109','ປາກງື່ມ',1,NULL,NULL,'2017-09-01 09:48:59',0),(10,'0201','ຜົ້ງສາລີ',2,NULL,NULL,'2017-09-01 09:48:59',0),(11,'331','ໄຊເສດຖາ',17,NULL,NULL,'2017-09-01 09:48:59',0),(12,'2901','ໄກສອນພົມວິຫານ',13,NULL,NULL,'2017-09-01 09:48:59',0),(13,'2902','ອຸທຸມພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(14,'201','ປາກຊັນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(15,'2002','ສິງ',3,NULL,NULL,'2017-09-01 09:48:59',0),(16,'2503','ຫົງສາ',8,NULL,NULL,'2017-09-01 09:48:59',0),(17,'2201','ຫ້ວຍຊາຍ',5,NULL,NULL,'2017-09-01 09:48:59',0),(18,'1905','ບຸນເໜືອ',2,NULL,NULL,'2017-09-01 09:48:59',0),(19,'1907','ບຸນໃຕ້',2,NULL,NULL,'2017-09-01 09:48:59',0),(20,'2001','ຫລວງນໍ້າທາ',3,NULL,NULL,'2017-09-01 09:48:59',0),(21,'2003','ລອງ',3,NULL,NULL,'2017-09-01 09:48:59',0),(22,'2004','ວຽງພູຄາ',3,NULL,NULL,'2017-09-01 09:48:59',0),(23,'2005','ນາແລ',3,NULL,NULL,'2017-09-01 09:48:59',0),(24,'340','ອານຸວົງ',18,NULL,NULL,'2017-09-01 09:48:59',0),(25,'2520','ຊຽງຮ່ອນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(26,'23002','ນານ',6,NULL,NULL,'2017-09-01 09:48:59',0),(27,'2225','ຕົ້ນເຜິ້ງ',5,NULL,NULL,'2017-09-01 09:48:59',0),(28,'262','ພູກູດ',9,NULL,NULL,'2017-09-01 09:48:59',0),(29,'2389','ຊຽງເງິນ',6,NULL,NULL,'2017-09-01 09:48:59',0),(30,'242','ຊໍາໃຕ້',7,NULL,NULL,'2017-09-01 09:48:59',0),(31,'301','ສາລະວັນ',14,NULL,NULL,'2017-09-01 09:48:59',0),(32,'302','ວາປີ',14,NULL,NULL,'2017-09-01 09:48:59',0),(33,'2330','ພູຄູນ',6,NULL,NULL,'2017-09-01 09:48:59',0),(34,'22123','ປາກທາ',5,NULL,NULL,'2017-09-01 09:48:59',0),(35,'22230','ຜາອຸດົມ',5,NULL,NULL,'2017-09-01 09:48:59',0),(36,'293','ໄຊບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(37,'2904','ອາດສະພັງທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(38,'295','ພະລານໄຊ',13,NULL,NULL,'2017-09-01 09:48:59',0),(39,'296','ພີນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(40,'297','ເຊໂປນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(41,'298','ວິລະບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(42,'299','ໄຊພູທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(43,'2910','ສອງຄອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(44,'2911','ທ່າປາງທອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(45,'22','ປາກກະດິງ',11,NULL,NULL,'2017-09-01 09:48:59',0),(46,'23','ທ່າພະບາດ',11,NULL,NULL,'2017-09-01 09:48:59',0),(47,'24','ບໍລິຄັນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(48,'25','ວຽງທອງ',11,NULL,NULL,'2017-09-01 09:48:59',0),(49,'26','ໄຊຈໍາພອນ',11,NULL,NULL,'2017-09-01 09:48:59',0),(50,'27','ຄໍາເກີດ',11,NULL,NULL,'2017-09-01 09:48:59',0),(51,'211','ໄຊ',4,NULL,NULL,'2017-09-01 09:48:59',0),(52,'212','ແບງ',4,NULL,NULL,'2017-09-01 09:48:59',0),(53,'213','ຮູນ',4,NULL,NULL,'2017-09-01 09:48:59',0),(54,'214','ຫຼາ',4,NULL,NULL,'2017-09-01 09:48:59',0),(55,'215','ນາໝໍ້',4,NULL,NULL,'2017-09-01 09:48:59',0),(56,'216','ງາ',4,NULL,NULL,'2017-09-01 09:48:59',0),(57,'217','ປາກແບງ',4,NULL,NULL,'2017-09-01 09:48:59',0),(58,'225','ເມິງ',5,NULL,NULL,'2017-09-01 09:48:59',0),(59,'231','ຫຼວງພຣະບາງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(60,'233','ປາກອູ',6,NULL,NULL,'2017-09-01 09:48:59',0),(61,'234','ຈອມເພັດ',6,NULL,NULL,'2017-09-01 09:48:59',0),(62,'235','ງອຍ',6,NULL,NULL,'2017-09-01 09:48:59',0),(63,'236','ນໍ້າບາກ',6,NULL,NULL,'2017-09-01 09:48:59',0),(64,'237','ວຽງຄໍາ',6,NULL,NULL,'2017-09-01 09:48:59',0),(65,'238','ໂພນໄຊ',6,NULL,NULL,'2017-09-01 09:48:59',0),(66,'239','ປາກແຊງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(67,'2310','ໂພນທອງ',6,NULL,NULL,'2017-09-01 09:48:59',0),(68,'241','ຊ້ອນ',7,NULL,NULL,'2017-09-01 09:48:59',0),(69,'243','ວຽງໄຊ',7,NULL,NULL,'2017-09-01 09:48:59',0),(70,'244','ສົບເບົາ',7,NULL,NULL,'2017-09-01 09:48:59',0),(71,'245','ຊຽງຄໍ້',7,NULL,NULL,'2017-09-01 09:48:59',0),(72,'246','ແອດ',7,NULL,NULL,'2017-09-01 09:48:59',0),(73,'247','ຊໍາເໜືອ',7,NULL,NULL,'2017-09-01 09:48:59',0),(74,'248','ຫົວເມືອງ',7,NULL,NULL,'2017-09-01 09:48:59',0),(75,'251','ຄອບ',8,NULL,NULL,'2017-09-01 09:48:59',0),(76,'254','ເງິນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(77,'255','ໄຊສະຖານ',8,NULL,NULL,'2017-09-01 09:48:59',0),(78,'256','ໄຊຍະບູລີ',8,NULL,NULL,'2017-09-01 09:48:59',0),(79,'257','ພຽງ',8,NULL,NULL,'2017-09-01 09:48:59',0),(80,'258','ທົ່ງມີໄຊ',8,NULL,NULL,'2017-09-01 09:48:59',0),(81,'259','ປາກລາຍ',8,NULL,NULL,'2017-09-01 09:48:59',0),(82,'2510','ແກ່ນທ້າວ',8,NULL,NULL,'2017-09-01 09:48:59',0),(83,'2511','ບໍ່ແຕນ',8,NULL,NULL,'2017-09-01 09:48:59',0),(84,'263','ຜາໄຊ',9,NULL,NULL,'2017-09-01 09:48:59',0),(85,'264','ຄໍາ',9,NULL,NULL,'2017-09-01 09:48:59',0),(86,'265','ແປກ',9,NULL,NULL,'2017-09-01 09:48:59',0),(87,'266','ໜອງແຮດ',9,NULL,NULL,'2017-09-01 09:48:59',0),(88,'267','ໝອກ',9,NULL,NULL,'2017-09-01 09:48:59',0),(89,'268','ຄູນ',9,NULL,NULL,'2017-09-01 09:48:59',0),(90,'271','ໂພນໂຮງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(91,'272','ທຸລະຄົມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(92,'273','ແກ້ວອຸດົມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(93,'274','ກາສີ',10,NULL,NULL,'2017-09-01 09:48:59',0),(94,'275','ວັງວຽງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(95,'276','ເຟືອງ',10,NULL,NULL,'2017-09-01 09:48:59',0),(96,'277','ຊະນະຄາມ',10,NULL,NULL,'2017-09-01 09:48:59',0),(97,'278','ແມດ',10,NULL,NULL,'2017-09-01 09:48:59',0),(98,'279','ວຽງຄໍາ',10,NULL,NULL,'2017-09-01 09:48:59',0),(99,'2710','ຫີນເຫີບ',10,NULL,NULL,'2017-09-01 09:48:59',0),(100,'2711','ໝື່ນ',10,NULL,NULL,'2017-09-01 09:48:59',0),(101,'303','ລະຄອນເພັງ',14,NULL,NULL,'2017-09-01 09:48:59',0),(102,'304','ເລົ່າງາມ',14,NULL,NULL,'2017-09-01 09:48:59',0),(103,'305','ຄົງເຊໂດນ',14,NULL,NULL,'2017-09-01 09:48:59',0),(104,'306','ຕຸ້ມລານ',14,NULL,NULL,'2017-09-01 09:48:59',0),(105,'307','ຕະໂອ້ຍ',14,NULL,NULL,'2017-09-01 09:48:59',0),(106,'308','ສະໝ້ວຍ',14,NULL,NULL,'2017-09-01 09:48:59',0),(107,'332','ຊານໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(108,'333','ສະໜາມໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(109,'334','ສາມັກຄີມີໄຊ',17,NULL,NULL,'2017-09-01 09:48:59',0),(110,'335','ພູວົງ',17,NULL,NULL,'2017-09-01 09:48:59',0),(111,'431','ທ່າແຂກ',12,NULL,NULL,'2017-09-01 09:48:59',0),(112,'432','ຫີນບູນ',12,NULL,NULL,'2017-09-01 09:48:59',0),(113,'433','ໜອງບົກ',12,NULL,NULL,'2017-09-01 09:48:59',0),(114,'434','ເຊບັ້ງໄຟ',12,NULL,NULL,'2017-09-01 09:48:59',0),(115,'435','ມະຫາໄຊ',12,NULL,NULL,'2017-09-01 09:48:59',0),(116,'436','ຍົມມະລາດ',12,NULL,NULL,'2017-09-01 09:48:59',0),(117,'437','ນາກາຍ',12,NULL,NULL,'2017-09-01 09:48:59',0),(118,'438','ໄຊບົວທອງ',12,NULL,NULL,'2017-09-01 09:48:59',0),(119,'439','ບົວລະພາ',12,NULL,NULL,'2017-09-01 09:48:59',0),(120,'4310','ຄູນຄໍາ',12,NULL,NULL,'2017-09-01 09:48:59',0),(121,'161','ຈໍາປາສັກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(122,'152','ທ່າແຕງ',15,NULL,NULL,'2017-09-01 09:48:59',0),(123,'1521','ລະມາມ',15,NULL,NULL,'2017-09-01 09:48:59',0),(124,'1512','ກະລືມ',15,NULL,NULL,'2017-09-01 09:48:59',0),(125,'1513','ດາກຈຶງ',15,NULL,NULL,'2017-09-01 09:48:59',0),(126,'162','ບາຈຽງຈະເລີນສຸກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(127,'163','ປາກຊ່ອງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(128,'164','ປະທຸມພອນ',16,NULL,NULL,'2017-09-01 09:48:59',0),(129,'165','ໂພນທອງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(130,'166','ສຸຂຸມາ',16,NULL,NULL,'2017-09-01 09:48:59',0),(131,'167','ມູນລະປະໂມກ',16,NULL,NULL,'2017-09-01 09:48:59',0),(132,'168','ໂຂງ',16,NULL,NULL,'2017-09-01 09:48:59',0),(133,'0242','ຍອດອູ',2,NULL,NULL,'2017-09-01 09:48:59',0),(134,'20203','ໃຫມ່',2,NULL,NULL,'2017-09-01 09:48:59',0),(135,'20204','ຂວາ',2,NULL,NULL,'2017-09-01 09:48:59',0),(136,'20205','ສໍາພັນ',2,NULL,NULL,'2017-09-01 09:48:59',0),(137,'5227','ປາກທາ',5,NULL,NULL,'2017-09-01 09:48:59',0),(138,'7543','ຮ້ຽມ',7,NULL,NULL,'2017-09-01 09:48:59',0),(139,'7544','ກວັນ',7,NULL,NULL,'2017-09-01 09:48:59',0),(140,'13277','ຈຳພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(141,'13278','ຊົນບູລີ',13,NULL,NULL,'2017-09-01 09:48:59',0),(142,'13279','ນອງ',13,NULL,NULL,'2017-09-01 09:48:59',0),(143,'13280','ອາດສະພອນ',13,NULL,NULL,'2017-09-01 09:48:59',0),(144,'16111','ຊະນະສົມບູນ',16,NULL,NULL,'2017-09-01 09:48:59',0),(145,'16117','ປາກເຊ',16,NULL,NULL,'2017-09-01 09:48:59',0),(146,'183404','ທ່າໂທມ',18,NULL,NULL,'2017-09-01 09:48:59',0),(147,'18333','ລ້ອງແຈ້ງ',18,NULL,NULL,'2017-09-01 09:48:59',0),(148,'18332','ຮົ່ມ',18,NULL,NULL,'2017-09-01 09:48:59',0),(149,'18366','ລ້ອງຊານ',18,NULL,NULL,'2017-09-01 09:48:59',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnic`
--

LOCK TABLES `ethnic` WRITE;
/*!40000 ALTER TABLE `ethnic` DISABLE KEYS */;
INSERT INTO `ethnic` (`id`, `name`, `position`, `deleted`) VALUES (1,'ລາວ',1,0),(2,'ໄຕ',2,0),(3,'ຜູ້ໄທ',3,0),(4,'ລື້',4,0),(5,'ຍວນ',5,0),(6,'ຢັ້ງ',6,0),(7,'ແຊກ',7,0),(8,'ໄທເໜືອ',8,0),(9,'ກຶຶມມຸ',9,0),(10,'ໄປ່ຣ',10,0),(11,'ຊິງມູນ',11,0),(12,'ຜ່ອງ',12,0),(13,'ແທ່ນ',13,0),(14,'ເອິດູ',14,0),(15,'ບິດ',15,0),(16,'ລະເມດ',16,0),(17,'ສາມຕ່າວ',17,0),(18,'ກະຕາງ',18,0),(19,'ມະກອງ',19,0),(20,'ຕຣີ',20,0),(21,'ຢຣຸ',21,0),(22,'ຕຣຽງ',22,0),(23,'ຕະໂອ້ຍ',23,0),(24,'ແຢະ',24,0),(25,'ເບຣົາ',25,0),(26,'ກະຕູ',26,0),(27,'ຮາຣັກ',27,0),(28,'ໂອຍ',28,0),(29,'ກຣຽງ',29,0),(30,'ເຈັງ',30,0),(31,'ສະດາງ',31,0),(32,'ຊ່ວຍ',32,0),(33,'ລະວີ',33,0),(34,'ຍະເຫີນ',34,0),(35,'ປະໂກະ',35,0),(36,'ຂະແມ',36,0),(37,'ຕຸ້ມ',37,0),(38,'ງວນ',38,0),(39,'ມ້ອຍ',39,0),(40,'ກຣີ',40,0),(41,'ມົ້ງ',41,0),(42,'ອິວມຽນ',42,0),(43,'ອາຄາ',43,0),(44,'ຜູ້ນ້ອຍ',44,0),(45,'ລາຫູ',45,0),(46,'ສີລາ',46,0),(47,'ຮາຍີ',47,0),(48,'ໂລໂລ',48,0),(49,'ຫໍ້',49,0);
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
INSERT INTO `goverment_level` (`id`, `name`, `deleted`, `position`) VALUES (1,'ກົມ',0,0),(2,'ສະຖາບັນ',0,0),(3,'ສູນ',0,0),(4,'ະຳຫະ',1,0),(5,'area',1,0),(6,'asda',1,0),(7,'ss',1,0),(8,'dd',1,0);
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
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text,
  `post_date` datetime NOT NULL,
  `replied` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
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
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_legal_legal_type1_idx` (`legal_type_id`),
  CONSTRAINT `fk_legal_legal_type1` FOREIGN KEY (`legal_type_id`) REFERENCES `legal_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal`
--

LOCK TABLES `legal` WRITE;
/*!40000 ALTER TABLE `legal` DISABLE KEYS */;
INSERT INTO `legal` (`id`, `name`, `deleted`, `legal_type_id`, `position`) VALUES (1,'ກົດໝາຍວ່າດ້ວຍການປົກຄອງທ້ອງຖິ່ນ',0,2,1),(2,'ກົດໝາຍວ່າດ້ວຍພະນັກງານລັດຖະກອນ',0,2,2),(3,'ດຳລັດວ່າດ້ວຍສະມາຄົມ',0,1,3),(4,'ດຳລັດວ່າດ້ວຍມູນນິທິ',0,1,NULL),(5,'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງກະຊວງພາຍໃນ',0,1,NULL),(6,'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງອົງການປົກຄອງບ້ານ',0,1,NULL),(7,'ດຳລັດວ່າດ້ວຍການອອກໃບອະນຸຍາດສຳລັບ ນັກສຳຫຼວດວັດແທກ',0,1,NULL),(8,'ດຳລັດວ່າດ້ວຍການຝຶກອົບຮົມ ແລະ ພັດທະນາ ລັດຖະກອນແຫ່ງ ສປປ ລາວ',0,1,NULL),(9,'ດຳລັດວ່າດ້ວຍການປະເມີນຜົນພະນັກງານ-ລັດຖະກອນແຫ່ງ ສປປ ລາວ',0,1,NULL),(10,'ດຳລັດວ່າດ້ວຍລະບົບກົງຈັກການຈັດຕັ້ງ ຂອງອົງການບໍລິຫານແຫ່ງລັດ',0,1,NULL),(11,'ດຳລັດວ່າດ້ວຍການວາງແຜນກຳນົດລັດຖະກອນ',0,1,NULL),(12,'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງພະນັກງານລັດວິສາຫະກິດ',0,1,NULL),(13,'ດຳລັດວ່າດ້ວຍຕຳແໜ່ງວິຊາການຂອງລັດຖະກອນແຫ່ງ ສປປ ລາວ',0,1,NULL),(14,'ດຳລັດວ່າດ້ວຍການກຳນົດຕຳແໜ່ງງານ',0,1,NULL),(15,'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ນໍາໃຊ້ກາປະທັບ',0,1,NULL),(16,'ດຳລັດວ່າດ້ວຍການເພີ່ມທະວີວຽກງານແຂ່ງຂັນ-ຍ້ອງຍໍ',0,1,NULL),(17,'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ປົກປ້ອງການເຄື່ອນໄຫວສາສະໜາຢູ່ ສປປ ລາວ',0,1,NULL),(18,'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ແກ້ໄຂວຽກງານເຂດແດນເຊື່ອມຕໍ່ລະຫວ່າງນະຄອນຫຼວງວຽງຈັນ, ແຂວງກັບແຂວງ ທົ່ວປະເທດ',0,3,NULL),(19,'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ',0,3,NULL),(20,'ຂໍ້ຕົກລົງວ່າດ້ວຍການມອບ-ໂອນບາງວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ໃຫ້ບັນດາກະຊວງ, ອົງການທຽບເທົ່າຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ',0,4,NULL),(21,'ຂໍ້ຕົກລັງວ່າດ້ວຍການແບ່ງຄວາມຮັບຜິດຊອບວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ລະຫວ່າງຄະນະຈັດຕັ້ງແຂວງ ກັບພະແນກພາຍໃນແຂວງ ຫ້ອງການຈັດຕັ້ງເມືອງ, ເທດສະບານ ແລະ ນະຄອນ ກັບຫ້ອງການພາຍໃນເມືອງ, ເທດສະບານ ແລະ ນະຄອນ',0,4,NULL),(22,'ຂໍ້ຕົກລົງວ່າດ້ວຍປະຕິບັດພັນທະ ແລະ ການປະກອບສ່ວນຂອງຊຸມຊົນໃນການພັດທະນາບ້ານ',0,4,NULL),(23,' ຂໍ້ຕົກລົງວ່າດວ້ຍການຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ',0,4,NULL),(24,'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ',0,4,NULL),(25,'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ',0,4,NULL),(26,'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງບັນດາກົມ ທຽບເທົ່າ, ພະແນກພາຍໃນຂັ້ນແຂວງ ແລະ ຫ້ອງການພາຍໃນເມືອງ',0,5,NULL),(27,'ຂໍ້ຕົກລົງວ່າດ້ວຍການອອກເອກະສານທາງການຕອງອົງການປົກຄອງບ້ານ',0,5,NULL),(28,'ຂໍ້ຕົກລົງວ່າດ້ວຍການເກັບເງິນປະກອບສ່ວນພັດທະນາບ້ານຂອງປະຊາຊົນ',0,5,NULL),(29,'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ຕົວໜັງສື ໃນການຮ່າງທຸລະກຳ (Font) ແລະເອກະສານຂອງກະຊວງພາຍໃນ',0,5,NULL),(30,'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງແລະ ການເຄື່ອນໄຫວຂອງໜ່ວຍງານຈັດຕັ້ງໝາຍເຫດທາງລັດຖະການ ແລະ ການປະເພມີນຜົນກະທົບຂອງນນິຕິກຳ ຂອງກະຊວງພາຍໃນ',0,5,NULL),(31,'ຂໍ້ຕົກລົງວ່າດ້ວຍການຍົກຍ້າຍພົນລະເມືອງ',0,5,NULL),(32,'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ເອກະສານກ່ຽວກັບວຽກງານທະບຽນຄອບຄົວ',0,5,NULL),(33,'ຄຳແນະນຳ ກ່ຽວກັບການຈັດຕັ້ງປະຕິບັດ ຄຳສັ່ງຂອງລັດຖະມົນຕີ ສະບັບເລກທີ 56/ນຍ',0,6,NULL),(34,'ຄຳແນະນຳກ່ຽວກັບການກວດຜ່ານບັນຊີຈຳນວນພົນຂອງພະນັກງານ-ລັດຖະກອນ',0,6,NULL),(35,'ຄຳແນະນຳກ່ຽວກັບການຈັດຕັ້ງກົດໝາຍວ່າດ້ວຍພະນັກງານ-ລັດຖະກອນ',0,6,NULL),(36,'ຄຳແນະນຳກ່ຽວກັບການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ',0,6,NULL),(37,'ແຈ້ງການກ່ຽວກັບການປ່ຽນແປງງວດໃນການຮັບບັນຈຸລັດຖະກອນ ແລະ ການຈັດຊັ້ນຂັ້ນເງິນເດືອນລັດຖະກອນ',0,7,NULL),(38,'ແຈ້ງການກ່ຽວກັບລາຍງານ ສະພາບກັນປັບປຸງສັບຂ້ອນວຽກງານຂອງຂະແໜງການພາຍໃນ',0,7,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_type`
--

LOCK TABLES `legal_type` WRITE;
/*!40000 ALTER TABLE `legal_type` DISABLE KEYS */;
INSERT INTO `legal_type` (`id`, `name`, `deleted`, `position`) VALUES (1,'ດຳລັດ',0,1),(2,'ກົດໝາຍ',0,2),(3,'ຄຳສັ່ງຂອງນາຍົກ ລັດຖະມົນຕີ',0,3),(4,'ຂໍ້ຕົກລົງຂອງ ນາຍົກ ລັດຖະມົນຕີ',0,4),(5,'ຂໍ້ຕົກລົງຂອງ ລັດຖະມົນຕີກະຊວງພາຍໃນ',0,5),(6,'ຄຳແນະນໍາ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ',0,6),(7,'ລະບຽບການຕ່າງໆ',0,7);
/*!40000 ALTER TABLE `legal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `link_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `link`
--

LOCK TABLES `link` WRITE;
/*!40000 ALTER TABLE `link` DISABLE KEYS */;
/*!40000 ALTER TABLE `link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `menugroup_id` int(11) DEFAULT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `position` int(11) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `has_province` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_menu_menugroup1_idx` (`menugroup_id`),
  KEY `fk_menu_menu1_idx` (`menu_parent_id`),
  KEY `fk_menu_user_id` (`input_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `name`, `url`, `icon`, `description`, `deleted`, `menugroup_id`, `menu_parent_id`, `input_id`, `input_dt_stamp`, `position`, `table_name`, `has_province`) VALUES (1,'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',NULL,NULL,'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ',0,NULL,3,NULL,'2017-09-03 18:41:53',14,NULL,NULL),(2,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V','stat-officer-salary',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V',0,NULL,1,NULL,'2017-09-03 18:45:05',1,'stat_officer_salary',NULL),(3,'ປ້ອນຂໍ້ມູນ','#',NULL,'ກົມ',0,NULL,0,1,'2017-09-25 20:17:01',2,'#',NULL),(13,'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ',NULL,NULL,'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ',0,NULL,3,NULL,'2017-09-03 18:45:38',7,NULL,NULL),(14,'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ','stat-course',NULL,'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ',0,NULL,13,NULL,'2017-09-03 18:47:12',1,'stat_course',NULL),(21,'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',NULL,NULL,'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ',0,NULL,3,NULL,'2017-09-03 18:47:24',3,NULL,NULL),(22,'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ','stat-religion',NULL,'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ',0,NULL,21,NULL,'2017-09-03 18:48:20',2,'stat_religion',1),(23,'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ','stat-religion-teacher',NULL,'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ',0,NULL,21,NULL,'2017-09-03 18:48:20',3,'stat_religion_teacher',1),(24,'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ','stat-religion-place',NULL,'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ',0,NULL,21,NULL,'2017-09-03 18:48:20',4,'stat_religion_place',1),(25,'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ','stat-ethnic',NULL,'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ',0,NULL,21,NULL,'2017-09-03 18:48:20',1,'stat_ethnic',1),(27,'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',NULL,NULL,'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ',0,NULL,3,NULL,'2017-09-03 18:49:19',6,NULL,NULL),(54,'ກົມຄຸ້ມຄອງພົນລະເມືອງ',NULL,NULL,'ກົມຄຸ້ມຄອງພົນລະເມືອງ',0,NULL,3,NULL,'2017-09-03 18:50:38',4,NULL,NULL),(56,'ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ','stat-population-movement',NULL,'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ',0,NULL,54,NULL,'2017-09-03 18:51:25',1,'stat_population_movement',1),(57,'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ','stat-population-movement-chart',NULL,'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ',1,NULL,54,NULL,'2017-09-03 18:51:25',2,'stat_population_movement_chart',NULL),(67,'ກົມການປົກຄອງທ້ອງຖິ່ນ',NULL,NULL,'ກົມການປົກຄອງທ້ອງຖິ່ນ',0,NULL,3,NULL,'2017-09-03 18:51:37',2,NULL,NULL),(71,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ','stat-local-admin',NULL,'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ',0,NULL,67,NULL,'2017-09-03 18:52:20',NULL,'stat_local_admin',1),(79,'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ',NULL,NULL,'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ',0,NULL,3,NULL,'2017-09-03 18:52:28',1,NULL,NULL),(80,'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ','ministry',NULL,'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ',0,NULL,79,NULL,'2017-09-03 18:53:04',1,'ministry',NULL),(81,'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)','stat-goverment-unit',NULL,'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)',0,NULL,79,NULL,'2017-09-03 18:53:04',2,'stat_goverment_unit',NULL),(82,'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່','stat-legal',NULL,'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່',0,NULL,79,NULL,'2017-09-03 18:53:04',4,'stat_legal',NULL),(83,'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ','stat-single-gateway-implementation',NULL,'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ',0,NULL,79,NULL,'2017-09-03 18:53:04',3,'stat_single_gateway_implementation',NULL),(84,'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ','stat-association-foundation',NULL,'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ',0,NULL,79,NULL,'2017-09-03 18:53:04',5,'stat_association_foundation',NULL),(86,'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ','',NULL,'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ',0,NULL,3,NULL,'2017-09-03 18:53:18',8,'',NULL),(87,'ສະຖິຕິການສັງລວມ ການສຳເນົາ','stat-copy',NULL,'ສະຖິຕິການສັງລວມ ການສຳເນົາ',0,NULL,86,NULL,'2017-09-03 18:54:01',2,'stat_copy',NULL),(88,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ','stat-document',NULL,'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ',0,NULL,86,NULL,'2017-09-03 18:54:01',1,'stat_document',NULL),(89,'ກົມແຜນທີ່ແຫ່ງຊາດ',NULL,NULL,'ກົມແຜນທີ່ແຫ່ງຊາດ',0,NULL,3,NULL,'2017-09-03 18:54:01',10,NULL,NULL),(90,'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......','stat-explore',NULL,'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......',0,NULL,89,NULL,'2017-09-03 18:55:00',3,'stat_explore',1),(91,'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ','stat-map-service',NULL,'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ',0,NULL,89,NULL,'2017-09-03 18:55:00',1,'stat_map_service',NULL),(92,'ສະຖິຕິການຜະລິດແຜນທີ່','stat-map-produce',NULL,'ສະຖິຕິການຜະລິດແຜນທີ່',0,NULL,89,NULL,'2017-09-03 18:55:00',2,'stat_map_produce',NULL),(93,'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',NULL,NULL,'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່',0,NULL,3,NULL,'2017-09-03 18:55:01',11,NULL,NULL),(94,'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ','stat-explore',NULL,'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ',0,NULL,93,NULL,'2017-09-03 18:55:28',NULL,'stat_explore',1),(95,'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',NULL,NULL,'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ',0,NULL,3,NULL,'2017-09-03 18:55:29',9,NULL,NULL),(96,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ','stat-victorycoin-province',NULL,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',0,NULL,95,NULL,'2017-09-03 19:00:16',4,'stat_victorycoin_province',1),(97,'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ','stat-govcoin-province',NULL,'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ',0,NULL,95,NULL,'2017-09-03 19:00:16',10,'stat_govcoin_province',1),(98,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ','stat-govcoin-ministry',NULL,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16',5,'stat_govcoin_ministry',NULL),(99,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ','stat-victoryoversea-ministry',NULL,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16',7,'stat_victoryoversea_ministry',NULL),(100,'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ','stat-highcoin-ministry',NULL,'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16',1,'stat_highcoin_ministry',NULL),(101,'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ','stat-highoversea-ministry',NULL,'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16',6,'stat_highoversea_ministry',NULL),(102,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ','stat-govoversea-ministry',NULL,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ',0,NULL,95,NULL,'2017-09-03 19:00:16',9,'stat_govoversea_ministry',NULL),(103,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ','stat-victoryoversea-province',NULL,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',0,NULL,95,NULL,'2017-09-03 19:00:16',8,'stat_victoryoversea_province',1),(104,'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ','stat-hornorcoin-province',NULL,'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ',0,NULL,95,NULL,'2017-09-03 19:00:16',2,'stat_hornorcoin_province',1),(105,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ','stat-victorycoin-ministry',NULL,'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ',0,NULL,95,NULL,'2017-09-03 19:00:16',3,'stat_victorycoin_ministry',NULL),(106,'ກົມແຜນການ ແລະ ການຮ່ວມມື',NULL,NULL,'ກົມແຜນການ ແລະ ການຮ່ວມມື',0,NULL,3,NULL,'2017-09-03 19:00:17',13,NULL,NULL),(109,'ກົມຄຸ້ມຄອງລັດຖະກອນ',NULL,NULL,'ກົມຄຸ້ມຄອງລັດຖະກອນ',0,NULL,3,NULL,'2017-09-03 19:01:13',5,NULL,NULL),(110,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ','stat-officer',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ',0,NULL,109,NULL,'2017-09-03 19:05:41',1,'stat_officer',NULL),(111,'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່','stat-officer-need',NULL,'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່',0,NULL,109,NULL,'2017-09-03 19:06:06',8,'stat_officer_need',NULL),(112,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ','stat-officer-degree',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ',0,NULL,109,NULL,'2017-09-03 19:10:17',3,'stat_officer_degree',NULL),(113,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ','stat-officer-age',NULL,'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ',0,NULL,109,NULL,'2017-09-03 19:10:17',2,'stat_officer_age',NULL),(114,'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ','stat-officer-org',NULL,'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ',0,NULL,109,NULL,'2017-09-03 19:10:17',10,'stat_officer_org',NULL),(115,'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ','stat-officer-position',NULL,'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ',0,NULL,109,NULL,'2017-09-03 19:10:17',7,'stat_officer_position',NULL),(116,'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ','stat-officer-add',NULL,'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ',0,NULL,109,NULL,'2017-09-03 19:10:17',5,'stat_officer_add',NULL),(117,'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ','stat-officer-resign',NULL,'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',0,NULL,109,NULL,'2017-09-03 19:10:17',4,'stat_officer_resign',NULL),(118,'ຈຳນວນພະນັກງານຕາມສັນຍາ','stat-officer-contract',NULL,'ຈຳນວນພະນັກງານຕາມສັນຍາ',0,NULL,109,NULL,'2017-09-03 19:10:17',6,'stat_officer_contract',NULL),(119,'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ','stat-officer-ministry',NULL,'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ',0,NULL,109,NULL,'2017-09-03 19:10:18',9,'stat_officer_ministry',NULL),(120,'ຫ້ອງການກະຊວງ',NULL,NULL,'ຫ້ອງການກະຊວງ',1,NULL,3,NULL,'2017-09-19 08:37:26',12,NULL,NULL),(122,'ກົມກວດກາ',NULL,NULL,'ກົມກວດກາ',0,NULL,3,NULL,'2017-09-19 08:43:44',15,NULL,NULL),(441,'ຜູ້ໃຊ້ລະບົບ','user/manageuser',NULL,'ຜູ້ໃຊ້ລະບົບ',0,NULL,0,NULL,'2017-09-19 09:25:56',16,'user/manageuser',NULL),(442,'ສິດແລະບົດບາດ','user/managerole',NULL,'ສິດແລະບົດບາດ',0,NULL,0,NULL,'2017-09-19 09:27:25',17,'user/managerole',NULL),(443,'ຕັ້ງຄ່າ',NULL,NULL,'ຕັ້ງຄ່າ',0,NULL,0,NULL,'2017-09-19 09:27:34',18,NULL,NULL),(444,'ກຳນົດຂໍ້ມູນປີ','phiscal-year','fa fa-circle-o','ສົກປີ',0,1,443,1,'2017-09-19 09:27:34',1,'phiscal_year',NULL),(445,'ແປຄຳສັບ','message','','ແປຄຳສັບ',0,1,443,1,'2017-09-19 09:27:34',99,'message',NULL),(446,'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ','stat-officer-province',NULL,'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ',0,NULL,109,NULL,'2017-09-25 19:11:04',11,'stat_officer_province',1),(447,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ','stat-officer-ministry-add',NULL,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ',0,NULL,109,NULL,'2017-09-25 19:16:43',12,'stat_officer_ministry_add',NULL),(448,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ','stat-officer-organisation-add',NULL,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ',0,NULL,109,NULL,'2017-09-25 19:18:36',13,'stat_officer_organisation_add',NULL),(449,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ','stat-officer-province-add',NULL,'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ',0,NULL,109,NULL,'2017-09-25 19:19:33',14,'stat_officer_province_add',1),(450,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-ministry-train',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:22:58',1,'stat_officer_ministry_train',NULL),(451,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-organisation-train',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:24:15',2,'stat_officer_organisation_train',NULL),(452,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-province-train',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:25:30',3,'stat_officer_province_train',1),(453,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-ministry-upgrade',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:27:21',4,'stat_officer_ministry_upgrade',NULL),(454,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-organisation-upgrade',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:28:50',5,'stat_officer_organisation_upgrade',NULL),(457,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ','stat-officer-province-upgrade',NULL,'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ',0,NULL,27,NULL,'2017-09-25 19:29:59',6,'stat_officer_province_upgrade',1),(458,'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ','stat-institute-train',NULL,'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ',0,NULL,13,NULL,'2017-09-25 19:33:51',2,'stat_institute_train',NULL),(460,'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ','stat-institute-meeting',NULL,'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ',0,NULL,13,NULL,'2017-09-25 19:37:21',3,'stat_institute_meeting',NULL),(461,'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ','stat-research',NULL,'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ',0,NULL,13,NULL,'2017-09-25 19:39:45',4,'stat_research',NULL),(462,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ','stat-govoversea-province',NULL,'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ',0,NULL,95,NULL,'2017-09-25 19:59:15',11,'stat_govoversea_province',1),(463,'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ','stat-investment',NULL,'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ',0,NULL,89,NULL,'2017-09-25 20:05:03',4,'stat_investment',NULL),(464,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ','stat-officer-technical',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ',0,NULL,1,NULL,'2017-09-25 20:09:25',2,'stat_officer_technical',NULL),(465,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ','stat-officer-age-level',NULL,'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ',0,NULL,1,NULL,'2017-09-25 20:11:26',3,'stat_officer_age_level',NULL),(466,'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ','stat-officer-ethnic',NULL,'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ',0,NULL,1,NULL,'2017-09-25 20:12:20',3,'stat_officer_ethnic',NULL),(467,'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ','stat-position',NULL,'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ',0,NULL,1,NULL,'2017-09-25 20:14:05',4,'stat_position',NULL),(469,'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ','stat-officer-new',NULL,'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ',0,NULL,1,NULL,'2017-09-25 20:15:04',5,'stat_officer_new',NULL),(471,'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ','stat-resign',NULL,'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ',0,NULL,1,NULL,'2017-09-25 20:15:59',6,'stat_resign',NULL),(472,'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ','stat-contract',NULL,'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ',0,NULL,1,NULL,'2017-09-25 20:16:26',7,'stat_contract',NULL),(473,'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ','stat-oda',NULL,'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ',0,NULL,106,NULL,'2017-09-25 20:17:01',8,'stat_oda',NULL),(475,'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ','stat-officer-ethnic',NULL,'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ',0,NULL,1,NULL,'2017-09-25 20:17:01',9,'stat_officer_ethnic',NULL),(476,'ຊົນເຜົ່າ','ethnic','fa fa-circle-o','ຊົນເຜົ່າ',0,1,443,1,'2017-09-19 09:27:34',3,'ethnic',NULL),(477,'ແຂວງ','province','fa fa-circle-o','ແຂວງ',0,1,443,1,'2017-09-19 09:27:34',2,'province',NULL),(478,'ຜູ້ອະນຸມັດ ມູນນິທິ','approver','fa fa-circle-o','ຜູ້ອະນຸມັດ ມູນນິທິ',0,1,443,1,'2017-09-19 09:27:34',4,'approver',NULL),(479,'ຍ້ອງຍໍຜົນງານ','award','fa fa-circle-o','ຍ້ອງຍໍຜົນງານ',0,1,443,1,'2017-09-19 09:27:34',5,'award',NULL),(480,' ເອກະສານປະເພດປຶ້ມ','book','fa fa-circle-o',' ເອກະສານປະເພດປຶ້ມ',0,1,443,1,'2017-09-19 09:27:34',7,'book',NULL),(481,'ປະເພດນິຕິກຳ','legal-type','fa fa-circle-o','ປະເພດນິຕິກຳ',0,1,443,1,'2017-09-19 09:27:34',8,'legal_type',NULL),(482,'ນິຕິກຳ','legal','fa fa-circle-o','ນິຕິກຳ',0,1,443,1,'2017-09-19 09:27:34',9,'legal',NULL),(483,'ໜ້າຫຼັກ','site/index',NULL,'ໜ້າຫຼັກ',0,NULL,0,NULL,'2017-09-19 09:27:34',1,NULL,NULL),(484,'ລາຍງານ','report',NULL,'ລາຍງານ',0,1,0,NULL,'2018-02-01 22:42:03',3,NULL,0);
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
INSERT INTO `menugroup` (`id`, `name`, `deleted`, `input_id`, `input_dt_stamp`) VALUES (1,'ການຕັ້ງຄ່າ',0,1,'2017-09-03 17:19:01'),(2,'ຜູ້ຄຸ້ມຄອງລະບົບນ',0,1,'2017-09-03 17:19:01');
/*!40000 ALTER TABLE `menugroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text,
  PRIMARY KEY (`id`,`language`),
  CONSTRAINT `FK_message_source_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`id`, `language`, `translation`) VALUES (1,'en','ປ່ຽນລະຫັດຜ່ານ'),(2,'en','ແກ້ໄຂໂປຣຟາຍ'),(3,'en','ໂປຣຟາຍ'),(4,'en','ອອກຈາກລະບົບ'),(7,'en','ລະດັບ'),(9,'en','ໜ່ວຍກິດ'),(12,'en','ຫຼັກສູດ'),(12,'lo','ຫຼັກສູດ'),(13,'en','ີຄະນະ'),(13,'lo','ຄະນະ'),(14,'en','ໂຄຕ່າ'),(15,'en','ສົກປີ'),(15,'lo','ສົກສືກສາ'),(20,'en','ພາກວິຊາ'),(20,'lo','ພາກວິຊາ'),(37,'lo','ສະໝັກເສັງ'),(40,'lo','ກ່ຽວກັບ'),(41,'lo','ຕິດຕໍ່'),(50,'en','ລະຫັດ'),(63,'lo','ສົກສືກສາ'),(70,'lo','ຫຼັກສູດ'),(73,'lo','ວິຊາ'),(98,'lo','ເຂົ້າສູ່ລະບົບ'),(170,'lo','ຊື່ໃຊ້ເຂົ້າລະບົບ'),(171,'lo','ລະຫັດລັບ'),(211,'lo','ວິຊາ'),(328,'lo','ຕັ້ງຄ່າຂໍ້ມູນພື້ນຖານ'),(519,'lo','ຈື່ຂ້ອຍໄວ້'),(520,'lo','ເຂົ້າສູ່ລະບົບ'),(523,'lo','ວິທະຍາເຂດ,ອາຄານ,ຫ້ອງ'),(639,'lo','ຄະນະ'),(640,'lo','ຫຼັກສູດ'),(667,'lo','ຄະນະ'),(700,'lo','ພາກວິຊາ'),(871,'la-LA',''),(872,'la-LA',''),(873,'la-LA',''),(874,'la-LA',''),(875,'la-LA',''),(876,'la-LA',''),(877,'la-LA',''),(878,'la-LA',''),(879,'la-LA',''),(880,'la-LA',''),(881,'la-LA',''),(882,'la-LA',''),(883,'la-LA',''),(3464,'en','ຄະນະວິຊາ'),(3464,'lo','ຄະນະ'),(3465,'en','ຜູ້ໃຊ້'),(3466,'en','ປັບປຸງໃບເກັບເງິນ'),(3467,'en','ໃບແຈ້ງຫນີ້ນັກຮຽນ'),(3468,'en','ລາຍການ ໜີ້ຄ້າງຈ່າຍ ຂອງນັກສຶກສາ'),(3469,'en','ນໍາເຂົ້າລາຍການ ການຊໍາລະ ຂອງນັກສຶກສາ'),(3470,'en','ໃບຮັບເງິນຂອງນັກຮຽນ'),(3471,'en','ຈັດການ ໃບຮັບເງິນ ຂອງນັກສຶກສາ'),(3527,'en','ມະຫາວິທະຍາໄລແຫ່ງຊາດລາວ'),(3528,'en','ໃບເກັບເງິນ ເລກທີ'),(3529,'en','ວັນທີ ອອກບິນ ເກັບເງິນ'),(3530,'en','ຊໍາລະກ່ອນວັນທີ:'),(3531,'en','ສົກປີຮຽນ'),(3531,'lo','ສົກສືກສາ'),(3533,'en','ຊື່ເຕັມ'),(3534,'en','ບໍ່'),(3535,'en','ລວມ'),(3536,'en','ສ່ວນລົດ'),(3537,'en','ຍອດເງິນ ຄັ້ງກ່ອນ'),(3538,'en','ລວມທັງໝົດ'),(3539,'en','ການລົງທະບຽນ ວິຊາຮຽນ'),(3540,'en','ນັກ​ຮຽນ-'),(3541,'en','ຕື່ມ'),(3542,'en','ວິຊາເລືອກ'),(3543,'en','ລາ​ຄາ​ຕໍ່​ຫົວຫນ່ວຍ'),(3544,'en','ມູນຄ່າລວມ'),(3545,'en','ມື້'),(3546,'en','ເວລາ'),(3547,'en','ໂມງຕໍາກັນ!'),(3548,'en','ເພີ່ມຫຼັກສູດນີ້ແລ້ວ!'),(3549,'en','ເລືອກຫຼັກສູດ ບໍ່ໃຫ້ກາຍ 20 ໜ່ວຍກິດ'),(3550,'en','ລາຍການ'),(3551,'en','ຕ້ອງການທີ່ພັກ'),(3552,'en','ຊາດ'),(3553,'en','ມືຖື'),(3554,'en','ໂທລະສັບ'),(3555,'en','ອີເມວ'),(3556,'en','ລາຍຊື່ນັກຮຽນ'),(3557,'en','ເພີ່ມນັກສຶກສາ'),(3558,'en','ຂໍ້ມູນນັກສຶກສາ'),(3559,'en','ຊື່​ແລະ​ນາມ​ສະ​ກຸນ'),(3560,'en','ເພດ:'),(3561,'en','ວັນ​ເດືອນ​ປີ​ເກີດ'),(3562,'en','ສັນຊາດ'),(3563,'en','ສາດສະຫນາ'),(3564,'en','ສະຖານະການສົມລົດ'),(3565,'en','ມືຖື'),(3566,'en','ເບີໂທລະສັບ'),(3567,'en','ທີ່​ຢູ່​ອີ​ເມວ'),(3568,'en','ເປັນນັກສຶກສາຕໍ່ເນື່ອງ'),(3569,'en','ເປັນນັກສຶກສາໂກ່ຕ້າ'),(3570,'en','ພິການ'),(3571,'en','ຕ້ອງການທີ່ພັກ'),(3572,'en','ເຮັດວຽກກ່ອນທີ່ຈະເຂົ້າຮຽນ'),(3573,'en','ຂໍ້ມູນທີ່ຢູ່'),(3574,'en','ຂໍ້ມູນຕິດຕໍ່ ໃນກໍລະນີ ສຸກເສີນ'),(3575,'en','ບ້ານ'),(3576,'en','ເມືອງ'),(3588,'en','ຂໍ້ມູນ ການຮັບເຂົ້າຮຽນ'),(3589,'en','ອັບເດດຂໍ້ມູນນັກຮຽນ'),(3590,'en','ລົງທະບຽນ ສໍາເລັດ'),(3591,'en','ອາຈານ'),(3592,'en','ຕາຕະລາງສໍາລັບຄູ:'),(3593,'en','ຫລັກສູດ:'),(3594,'en','ຊື່ຫ້ອງ:'),(3595,'en','ຫ້ອງ:'),(3598,'en','ເບິ່ງສະຖານທີ່ສອບເສັງ'),(3599,'en','ປ່ຽນແປງ ສະຖານທີ່ສອບເສັງ'),(3608,'lo','ພາກວິຊາ'),(3609,'lo','ຫຼັກສູດ'),(3830,'lo','ວິຊາ & ຫຼັກສູດ'),(3833,'en','ຄະແນນ');
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
INSERT INTO `migration` (`version`, `apply_time`) VALUES ('m000000_000000_base',1503900150),('m150207_210500_i18n_init',1503900154),('m170901_012901_init_db',1504544278),('m170901_015159_fix_menu_tabl',1504544278),('m170901_021803_tbprovin_district',1504544278),('m170903_121828_menu_vs_group',1504544278),('m170906_113344_tb_usr_role',1506254686),('m170906_114910_fix_ministry_tb',1506254686),('m170918_182247_addmenu_data',1506254686),('m170924_115836_arran_menu',1506267236),('m170924_131215_fn_procedure',1506267236),('m170930_040230_tbl_action',1507973535),('m170930_063144_fnNPro',1507973535),('m171004_163823_drop_func',1507973535),('m171004_182033_user_subordinate',1507973535),('m171011_065021_tb_usr_usr_hs_province',1507973535);
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
  KEY `fk_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministry`
--

LOCK TABLES `ministry` WRITE;
/*!40000 ALTER TABLE `ministry` DISABLE KEYS */;
INSERT INTO `ministry` (`id`, `name`, `deleted`, `code`, `last_update`, `ministry_group_id`, `position`, `user_id`, `remark`, `input_dt_stamp`, `equal`) VALUES (1,'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້',0,'1','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(2,'ກະຊວງ ການເງິນ',0,'2','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(3,'ກະຊວງ ການຕ່າງປະເທດ',0,'3','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(4,'ສະພາແຫ່ງຊາດ',0,'4','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(5,'ສານປະຊາຊົນສູງສຸດ',0,'5','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(6,'ກະຊວງ ຍຸຕິທໍາ',0,'6','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(25,'ກະຊວງ ສຶກສາທິການ ແລະ ກິລາ',0,'26','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(26,'ສູນກາງຊາວໜຸ່ມ',0,'27','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(27,'ກະຊວງ ພາຍໃນ',0,'28','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(28,'ກະຊວງ ສາທາລະນະສຸກ',0,'29','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(29,'ກະຊວງ ໂຍທາທິການ ແລະ ຂົນສົ່ງ',0,'30','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(30,'ກະຊວງ ຖະແຫຼງຂ່າວ, ວັດທະນະທໍາ ແລະ ທ່ອງທ່ຽວ',0,'31','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(31,'ກະຊວງ ແຜນການ ແລະ ການລົງທຶນ',0,'32','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(32,'ກະຊວງ ແຮງງານ ແລະ ສະຫວັດດີການສັງຄົມ',0,'33','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(33,'ກະຊວງ ໄປສະນີ, ໂທລະຄົມມະນາຄົມ ແລະ ການສື່ສານ',0,'34','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(34,'ກະຊວງ ຊັບພະຍາກອນທໍາມະຊາດ ແລະ ສິ່ງແວດລ້ອມ',0,'35','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(35,'ກະຊວງ ວິທະຍາສາດ ແລະ ເທັກໂນໂລຊີ',0,'36','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(36,'ສະພາແຫ່ງຊາດ',0,'37','2017-09-06 19:58:52',4,0,NULL,NULL,'2017-09-06 19:58:52',0),(37,'ສານປະຊາຊົນສູງສຸດ',0,'38','2017-09-06 19:58:52',4,0,NULL,NULL,'2017-09-06 19:58:52',0),(38,'ກະຊວງ ພະລັງງານ ແລະ ບໍ່ແຮ່',0,'39','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(39,'ກະຊວງ ອຸດສາຫະກຳ ແລະ ການຄ້າ',0,'40','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(40,'ອົງການກວດກາລັດຖະບານ',0,'41','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(41,'ຫ້ອງວ່າການລັດຖະບານ',0,'42','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(42,'ທະນາຄານແຫ່ງ ສປປລາວ',0,'43','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(52,'ກະຊວງ ຍຸຕິທໍາ',0,'53','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(53,'ກະຊວງ ປ້ອງກັນປະເທດ',0,'54','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(54,'ກະຊວງ ປ້ອງກັນຄວາມສະຫງົບ',0,'55','2017-09-06 19:58:52',1,0,NULL,NULL,'2017-09-06 19:58:52',0),(55,'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ',0,'56','2017-09-06 19:58:52',5,0,NULL,NULL,'2017-09-06 19:58:52',0),(56,'ສະຖາບັນການເມືອງການປົກຄອງແຫ່ງຊາດ',0,'57','2017-09-06 19:58:52',5,0,NULL,NULL,'2017-09-06 19:58:52',0),(57,'ອົງການກວດສອບແຫ່ງລັດ',0,'58','2017-09-06 19:58:52',2,0,NULL,NULL,'2017-09-06 19:58:52',0),(58,'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້',1,'1','2017-10-15 04:00:36',1,0,1,NULL,'2017-09-06 19:58:52',0),(59,'asdads',0,NULL,'2018-03-16 16:50:27',NULL,0,1,NULL,'2018-03-16 22:50:27',0),(60,'asda',0,NULL,'2018-03-16 16:50:40',NULL,0,1,NULL,'2018-03-16 22:50:40',0),(61,'asdad',1,NULL,'2018-03-19 02:50:47',1,0,1,NULL,'2018-03-16 22:54:28',0),(62,'sgsdg',0,NULL,'2018-03-22 14:57:00',1,0,1,NULL,'2018-03-22 20:57:00',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministry_group`
--

LOCK TABLES `ministry_group` WRITE;
/*!40000 ALTER TABLE `ministry_group` DISABLE KEYS */;
INSERT INTO `ministry_group` (`id`, `name`, `deleted`, `position`, `input_dt_stamp`, `user_id`) VALUES (1,'ກະຊວງ',0,1,'2017-09-06 19:58:39',NULL),(2,'ອົງການທຽບເທົ່າ',0,1,'2017-09-06 19:58:39',NULL),(3,'ແຂວງ, ນະຄອນຫລວງ',0,1,'2017-09-06 19:58:39',NULL),(4,'ອົງການຈັດຕັ້ງສຸນກາງ',0,1,'2017-09-06 19:58:39',NULL),(5,'ສະຖາບັນ ແລະ ອົງການ',0,1,'2017-09-06 19:58:39',NULL),(6,'ອື່ນໆ',0,1,'2017-09-06 19:58:39',NULL);
/*!40000 ALTER TABLE `ministry_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `show` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_notice_user1_idx` (`user_id`),
  CONSTRAINT `fk_notice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`id`, `created_date`, `title`, `content`, `start_date`, `end_date`, `show`, `user_id`, `position`, `deleted`) VALUES (1,'2018-02-02 17:10:20','sagsg','gsgsdag','0000-00-00 00:00:00','0000-00-00 00:00:00',1,1,1,1),(2,'2018-02-22 15:51:05','Test','<p><a href=\"http://upload/2018/notice-20180222155042-3681630233.xlsx\">Click here</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"upload/2018/notice-20180222154928-8466616635.png\" style=\"height:269px; width:300px\" /></p>\r\n','2018-02-22 00:00:00','2018-03-08 00:00:00',1,1,4,1),(3,'2018-02-22 15:58:07','sdads','<p><img alt=\"\" src=\"/moha/web/upload/2018/notice-20180222155703-9115425481.jpg\" style=\"height:192px; width:108px\" /></p>\r\n\r\n<p>asfasfasf</p>\r\n\r\n<p>asfasf<a href=\"/moha/web/upload/2018/notice-20180222155740-2777930590.pdf\">download</a></p>\r\n','0000-00-00 00:00:00','0000-00-00 00:00:00',1,1,3,1),(4,'2018-03-25 06:37:00','sgasd','<p>sdgasd</p>\r\n','2018-03-16 00:00:00','2018-03-19 00:00:00',1,1,NULL,1),(5,'2018-03-25 06:37:20','sdgasdg','<p>sdgasdg</p>\r\n','2018-03-14 00:00:00','1970-01-01 00:00:00',0,1,NULL,1),(6,'2018-03-25 06:50:11','asdgads','<p>sdgasd</p>\r\n','1970-01-01 00:00:00','1970-01-01 00:00:00',0,1,NULL,0);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
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
  KEY `fk_officer_level_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer_level`
--

LOCK TABLES `officer_level` WRITE;
/*!40000 ALTER TABLE `officer_level` DISABLE KEYS */;
INSERT INTO `officer_level` (`id`, `name`, `deleted`, `last_update`, `position`, `user_id`) VALUES (1,'ກ. ຂັ້ນກະຊວງ',0,'2017-09-17 04:39:27',1,2),(2,'ຂ. ຂັ້ນແຂວງ',0,'2017-09-17 04:39:42',2,2),(3,'ຄ. ຂັ້ນເມືອງ',0,'2017-09-17 04:39:57',3,2);
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
INSERT INTO `organisation` (`id`, `name`, `deleted`, `position`) VALUES (1,'ສະພາແຫ່ງຊາດ',0,1),(2,'ສານປະຊາຊົນສູງສຸດ',0,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phiscal_year`
--

LOCK TABLES `phiscal_year` WRITE;
/*!40000 ALTER TABLE `phiscal_year` DISABLE KEYS */;
INSERT INTO `phiscal_year` (`id`, `year`, `start_date`, `end_date`, `deleted`, `status`) VALUES (1,'2017','2017-01-08 00:00:00','2018-01-17 00:00:00',0,'O'),(2,'2018','1970-01-01 00:00:00','1970-01-01 00:00:00',0,'C'),(3,'2019','2018-01-01 00:00:00','2018-01-31 00:00:00',0,'C');
/*!40000 ALTER TABLE `phiscal_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `name`, `deleted`, `position`) VALUES (1,'ໂຄງການລົງທຶນຂອງລັດ',0,1),(2,'ບັນດາໂຄງການບໍລິຫານວິຊາການ',0,2),(3,'ວຽກງານການພິມ',0,3),(4,'ວຽກງານການກວດກາ, ສ້ອມແປງ ແລະ ຢັ້ງຢືນອຸປະກອນເຄື່ອງມືສຳຫຼວດ',0,4),(5,'ວຽກງານພົວພັນ, ຮ່ວມມື ກັບຕ່າງປະເທດ',0,5);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
INSERT INTO `province` (`id`, `province_code`, `province_name`, `record_status`, `input_id`, `input_dt_stamp`, `deleted`, `position`) VALUES (1,'01','ນະຄອນຫລວງວຽງຈັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(2,'02','ຜົ້ງສາລີ',NULL,NULL,'2017-09-01 09:48:56',0,0),(3,'03','ຫຼວງນໍ້າທາ',NULL,NULL,'2017-09-01 09:48:56',0,0),(4,'05','ອຸດົມໄຊ',NULL,NULL,'2017-09-01 09:48:56',0,0),(5,'04','ບໍ່ແກ້ວ',NULL,NULL,'2017-09-01 09:48:56',0,0),(6,'06','ຫຼວງພະບາງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(7,'07','ຫົວພັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(8,'08','ໄຊຍະບູລີ',NULL,NULL,'2017-09-01 09:48:56',0,0),(9,'09','ຊຽງຂວາງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(10,'10','ວຽງຈັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(11,'11','ບໍລິຄໍາໄຊ',NULL,NULL,'2017-09-01 09:48:56',0,0),(12,'12','ຄໍາມ່ວນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(13,'13','ສະຫວັນນະເຂດ',NULL,NULL,'2017-09-01 09:48:56',0,0),(14,'14','ສາລະວັນ',NULL,NULL,'2017-09-01 09:48:56',0,0),(15,'15','ເຊກອງ',NULL,NULL,'2017-09-01 09:48:56',0,0),(16,'16','ຈໍາປາສັກ',NULL,NULL,'2017-09-01 09:48:56',0,0),(17,'17','ອັດຕະປື',NULL,NULL,'2017-09-01 09:48:56',0,0),(18,'18','ໄຊສົມບູນ',NULL,NULL,'2017-09-01 09:48:56',0,0);
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
  `user_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_province` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_role_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `name`, `deleted`, `user_id`, `input_dt_stamp`, `is_province`) VALUES (1,'Super Admin',0,1,'2017-09-24 19:04:46',NULL),(2,'Vientiane Province',0,1,'2017-10-10 18:16:13',1),(3,'CMS',0,1,'2017-10-26 23:33:33',0),(4,'DPC',0,1,'2017-11-01 01:51:50',NULL);
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
  KEY `fk_role_has_action_role1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_action`
--

LOCK TABLES `role_has_action` WRITE;
/*!40000 ALTER TABLE `role_has_action` DISABLE KEYS */;
INSERT INTO `role_has_action` (`role_id`, `action_id`, `allowed`) VALUES (2,1,'1'),(2,2,'1'),(2,3,'1'),(2,4,'1'),(2,5,'1'),(2,12,'1'),(2,19,'1'),(2,20,'1'),(2,21,'1'),(2,22,'1'),(2,23,'1'),(2,24,'1'),(2,25,'1'),(2,26,'1'),(2,27,'1'),(2,28,'1'),(2,29,'1'),(2,30,'1'),(2,31,'1'),(2,32,'1'),(2,33,'1'),(2,34,'1'),(2,35,'1'),(2,36,'1'),(2,37,'1'),(2,38,'1'),(2,39,'1'),(2,40,'1'),(2,41,'1'),(2,42,'1'),(2,43,'1'),(2,44,'1'),(2,45,'1'),(2,46,'1'),(2,47,'1'),(2,48,'1'),(2,49,'1'),(2,50,'1'),(2,51,'1'),(2,52,'1'),(2,53,'1'),(2,54,'1'),(2,55,'1'),(2,56,'1'),(2,57,'1'),(2,58,'1'),(2,59,'1'),(2,60,'1'),(2,61,'1'),(2,62,'1'),(2,63,'1'),(2,64,'1'),(2,65,'1'),(2,66,'1'),(2,67,'1'),(2,68,'1'),(2,69,'1'),(2,70,'1'),(2,71,'1'),(2,72,'1'),(2,73,'1'),(2,74,'1'),(2,75,'1'),(2,76,'1'),(2,77,'1'),(2,78,'1'),(2,79,'1'),(2,80,'1'),(2,81,'1'),(2,82,'1'),(2,83,'1'),(2,84,'1'),(2,85,'1'),(2,86,'1'),(2,87,'1'),(2,88,'1'),(2,89,'1'),(2,90,'1'),(2,91,'1'),(2,92,'1'),(2,93,'1'),(2,94,'1'),(2,95,'1'),(2,96,'1'),(2,97,'1'),(2,98,'1'),(2,99,'1'),(2,100,'1'),(2,101,'1'),(2,102,'1'),(2,103,'1'),(2,104,'1'),(2,105,'1'),(2,106,'1'),(2,107,'1'),(2,108,'1'),(2,109,'1'),(2,110,'1'),(2,111,'1'),(2,112,'1'),(2,113,'1'),(2,114,'1'),(2,115,'1'),(2,116,'1'),(2,117,'1'),(2,118,'1'),(2,119,'1'),(2,120,'1'),(2,121,'1'),(2,122,'1'),(2,123,'1'),(2,124,'1'),(2,125,'1'),(2,126,'1'),(2,127,'1'),(2,128,'1'),(2,129,'1'),(2,130,'1'),(2,131,'1'),(2,132,'1'),(2,133,'1'),(2,134,'1'),(2,135,'1'),(2,136,'1'),(2,137,'1'),(2,138,'1'),(2,139,'1'),(2,140,'1'),(2,141,'1'),(2,142,'1'),(2,143,'1'),(2,144,'1'),(2,145,'1'),(2,146,'1'),(2,147,'1'),(2,148,'1'),(2,149,'1'),(2,150,'1'),(2,151,'1'),(2,152,'1'),(2,153,'1'),(2,154,'1'),(2,155,'1'),(2,156,'1'),(2,157,'1'),(2,158,'1'),(2,159,'1'),(2,160,'1'),(2,161,'1'),(2,162,'1'),(2,163,'1'),(2,164,'1'),(2,165,'1'),(2,166,'1'),(2,167,'1'),(2,168,'1'),(2,169,'1'),(2,170,'1'),(2,171,'1'),(2,172,'1'),(2,173,'1'),(2,174,'1'),(2,175,'1'),(2,176,'1'),(2,177,'1'),(2,178,'1'),(2,179,'1'),(2,180,'1'),(2,181,'1'),(2,182,'1'),(2,183,'1'),(2,184,'1'),(2,185,'1'),(2,186,'1'),(2,187,'1'),(2,188,'1'),(2,189,'1'),(2,190,'1'),(2,191,'1'),(2,192,'1'),(2,193,'1'),(2,194,'1'),(2,195,'1'),(2,196,'1'),(2,197,'1'),(2,198,'1'),(2,199,'1'),(2,200,'1'),(2,201,'1'),(2,202,'1'),(2,203,'1'),(2,204,'1'),(2,205,'1'),(2,206,'1'),(2,207,'1'),(2,208,'1'),(2,209,'1'),(2,210,'1'),(2,211,'1'),(2,212,'1'),(2,213,'1'),(2,214,'1'),(2,215,'1'),(2,216,'1'),(2,217,'1'),(2,218,'1'),(2,219,'1'),(2,220,'1'),(2,221,'1'),(2,222,'1'),(2,223,'1'),(2,224,'1'),(2,225,'1'),(2,226,'1'),(2,227,'1'),(2,228,'1'),(2,229,'1'),(2,230,'1'),(2,231,'1'),(2,232,'1'),(2,233,'1'),(2,234,'1'),(2,235,'1'),(2,236,'1'),(2,237,'1'),(2,238,'1'),(2,239,'1'),(2,240,'1'),(2,241,'1'),(2,242,'1'),(2,243,'1'),(2,244,'1'),(2,245,'1'),(2,246,'1'),(2,247,'1'),(2,248,'1'),(2,249,'1'),(2,250,'1'),(2,251,'1'),(2,252,'1'),(2,253,'1'),(2,254,'1'),(2,255,'1'),(2,256,'1'),(2,257,'1'),(2,258,'1'),(2,259,'1'),(2,260,'1'),(2,261,'1'),(2,262,'1'),(2,263,'1'),(2,264,'1'),(2,265,'1'),(2,266,'1'),(2,267,'1'),(2,268,'1'),(2,269,'1'),(2,270,'1'),(2,271,'1'),(2,272,'1'),(2,273,'1'),(2,274,'1'),(2,275,'1'),(2,276,'1'),(2,277,'1'),(2,278,'1'),(2,279,'1'),(2,280,'1'),(2,281,'1'),(2,282,'1'),(2,283,'1'),(2,284,'1'),(2,285,'1'),(2,286,'1'),(2,287,'1'),(2,288,'1'),(2,289,'1'),(2,290,'1'),(2,291,'1'),(2,292,'1'),(2,293,'1'),(2,294,'1'),(2,295,'1'),(2,296,'1'),(2,297,'1'),(2,298,'1'),(2,299,'1'),(2,300,'1'),(2,301,'1'),(2,302,'1'),(2,303,'1'),(2,304,'1'),(2,305,'1'),(2,306,'1'),(2,307,'1'),(2,308,'1'),(2,309,'1'),(2,310,'1'),(2,311,'1'),(2,312,'1'),(2,313,'1'),(2,314,'1'),(2,315,'1'),(2,316,'1'),(2,317,'1'),(2,318,'1'),(2,319,'1'),(2,320,'1'),(2,321,'1'),(2,322,'1'),(2,323,'1'),(2,324,'1'),(2,325,'1'),(2,326,'1'),(2,327,'1'),(2,328,'1'),(2,329,'1'),(2,330,'1'),(2,331,'1'),(2,332,'1'),(2,333,'1'),(2,334,'1'),(2,335,'1'),(2,336,'1'),(2,337,'1'),(2,338,'1'),(2,339,'1'),(2,340,'1'),(2,341,'1'),(2,342,'1'),(2,343,'1'),(2,344,'1'),(2,345,'1'),(2,346,'1'),(2,347,'1'),(2,348,'1'),(2,349,'1'),(2,350,'1'),(2,351,'1'),(2,352,'1'),(2,353,'1'),(2,354,'1'),(2,355,'1'),(2,356,'1'),(2,357,'1'),(2,358,'1'),(2,359,'1'),(2,360,'1'),(2,361,'1'),(2,362,'1'),(2,363,'1'),(2,364,'1'),(2,365,'1'),(2,366,'1'),(2,367,'1'),(2,368,'1'),(2,369,'1'),(2,370,'1'),(2,371,'1'),(2,372,'1'),(2,373,'1'),(2,374,'1'),(2,375,'1'),(2,376,'1'),(2,377,'1'),(2,378,'1'),(2,379,'1'),(2,380,'1'),(2,381,'1'),(2,382,'1'),(2,383,'1'),(2,384,'1'),(2,385,'1'),(2,386,'1'),(2,387,'1'),(2,388,'1'),(2,389,'1'),(2,390,'1'),(2,391,'1'),(2,392,'1'),(2,393,'1'),(2,394,'1'),(2,395,'1'),(2,396,'1'),(2,397,'1'),(2,398,'1'),(2,399,'1'),(2,400,'1'),(2,401,'1'),(2,402,'1'),(2,403,'1'),(2,404,'1'),(2,405,'1'),(2,406,'1'),(2,407,'1'),(2,408,'1'),(2,409,'1'),(2,410,'1'),(2,411,'1'),(2,412,'1'),(2,413,'1'),(2,414,'1'),(2,415,'1'),(2,416,'1'),(2,417,'1'),(2,418,'1'),(2,419,'1'),(2,420,'1'),(2,421,'1'),(2,422,'1'),(2,423,'1'),(2,424,'1'),(2,425,'1'),(2,426,'1'),(2,427,'1'),(2,428,'1'),(2,429,'1'),(2,430,'1'),(2,431,'1'),(2,432,'1'),(2,433,'1'),(2,434,'1'),(2,435,'1'),(2,436,'1'),(2,437,'1'),(2,438,'1'),(2,439,'1'),(2,440,'1'),(2,441,'1'),(2,442,'1'),(2,443,'1'),(2,444,'1'),(2,445,'1'),(2,446,'1'),(2,447,'1'),(2,448,'1'),(2,449,'1'),(2,450,'1'),(2,451,'1'),(2,452,'1'),(2,453,'1'),(2,454,'1'),(2,455,'1'),(2,456,'1'),(2,457,'1'),(2,458,'1'),(2,459,'1'),(2,460,'1'),(2,461,'1'),(2,462,'1'),(2,463,'1'),(2,464,'1'),(2,465,'1'),(2,466,'1'),(2,467,'1'),(2,468,'1'),(2,469,'1'),(2,470,'1'),(2,471,'1'),(2,472,'1'),(2,473,'1'),(2,474,'1'),(2,475,'1'),(2,476,'1'),(2,477,'1'),(2,478,'1'),(2,479,'1'),(2,480,'1'),(2,481,'1'),(2,482,'1'),(2,483,'1'),(2,484,'1'),(2,485,'1'),(2,486,'1'),(2,487,'1'),(2,488,'1'),(2,489,'1'),(2,490,'1'),(2,491,'1'),(2,492,'1'),(2,493,'1'),(2,494,'1'),(2,495,'1'),(2,496,'1'),(2,497,'1'),(2,498,'1'),(2,499,'1'),(2,500,'1'),(2,501,'1'),(2,502,'1'),(2,503,'1'),(2,504,'1'),(2,505,'1'),(2,506,'1'),(2,507,'1'),(2,508,'1'),(2,509,'1'),(2,510,'1'),(2,511,'1'),(2,512,'1'),(2,513,'1'),(2,514,'1'),(2,515,'1'),(2,516,'1'),(2,517,'1'),(2,518,'1'),(2,519,'1'),(2,520,'1'),(2,521,'1'),(2,522,'1'),(2,523,'1'),(2,524,'1'),(2,525,'1'),(2,526,'1'),(2,527,'1'),(2,528,'1'),(2,529,'1'),(2,530,'1'),(2,531,'1'),(2,532,'1'),(2,533,'1'),(2,534,'1'),(2,535,'1'),(2,536,'1'),(2,537,'1'),(2,538,'1'),(2,539,'1'),(2,540,'1'),(2,541,'1'),(2,542,'1'),(2,543,'1'),(2,544,'1'),(2,545,'1'),(2,546,'1'),(2,547,'1'),(2,548,'1'),(2,549,'1'),(2,550,'1'),(2,551,'1'),(2,552,'1'),(2,553,'1'),(2,554,'1'),(2,555,'1'),(2,556,'1'),(2,557,'1'),(2,558,'1'),(2,559,'1'),(2,560,'1'),(2,561,'1'),(2,562,'1'),(2,563,'1'),(2,564,'1'),(2,565,'1'),(2,566,'1'),(2,567,'1'),(2,568,'1'),(2,569,'1'),(2,570,'1'),(2,571,'1'),(2,572,'1'),(2,573,'1'),(2,574,'1'),(2,575,'1'),(2,576,'1'),(2,577,'1'),(2,578,'1'),(2,579,'1'),(2,580,'1'),(2,581,'1'),(2,582,'1'),(2,583,'1'),(2,584,'1'),(2,585,'1'),(2,586,'1'),(2,587,'1'),(2,588,'1'),(2,589,'1'),(2,590,'1'),(2,591,'1'),(2,592,'1'),(2,593,'1'),(2,594,'1'),(2,595,'1'),(2,596,'1'),(2,597,'1'),(2,598,'1'),(2,599,'1'),(2,600,'1'),(2,601,'1'),(2,602,'1'),(2,603,'1'),(2,604,'1'),(2,605,'1'),(2,606,'1'),(2,607,'1'),(2,608,'1'),(2,609,'1'),(2,610,'1'),(2,611,'1'),(2,612,'1'),(2,613,'1'),(2,614,'1'),(2,615,'1'),(2,616,'1'),(2,617,'1'),(2,618,'1'),(2,619,'1'),(2,620,'1'),(2,621,'1'),(2,622,'1'),(2,623,'1'),(2,624,'1'),(2,625,'1'),(2,626,'1'),(2,627,'1'),(2,628,'1'),(2,629,'1'),(2,630,'1'),(2,631,'1'),(2,632,'1'),(2,633,'1'),(2,634,'1'),(2,635,'1'),(2,636,'1'),(2,637,'1'),(2,638,'1'),(2,639,'1'),(2,640,'1'),(2,641,'1'),(2,642,'1'),(2,643,'1'),(2,644,'1'),(2,645,'1'),(2,646,'1'),(2,647,'1'),(2,648,'1'),(2,649,'1'),(2,650,'1'),(2,651,'1'),(2,652,'1'),(2,653,'1'),(2,654,'1'),(2,655,'1'),(2,656,'1'),(2,657,'1'),(2,658,'1'),(2,659,'1'),(2,660,'1'),(2,661,'1'),(2,662,'1'),(2,663,'1'),(2,664,'1'),(2,665,'1'),(2,666,'1'),(2,667,'1'),(2,668,'1'),(2,669,'1'),(2,670,'1'),(2,671,'1'),(2,672,'1'),(2,673,'1'),(2,674,'1'),(2,675,'1'),(2,676,'1'),(2,677,'1'),(2,678,'1'),(2,679,'1'),(2,680,'1'),(2,681,'1'),(2,682,'1'),(2,683,'1'),(2,684,'1'),(2,685,'1'),(2,686,'1'),(2,687,'1'),(2,688,'1'),(2,689,'1'),(2,690,'1'),(2,691,'1'),(2,692,'1'),(2,693,'1'),(2,694,'1'),(2,695,'1'),(2,696,'1'),(2,697,'1'),(2,698,'1'),(2,699,'1'),(2,700,'1'),(2,701,'1'),(2,702,'1'),(2,703,'1'),(2,704,'1'),(2,705,'1'),(2,706,'1'),(2,707,'1'),(2,708,'1'),(2,709,'1'),(2,710,'1'),(2,711,'1'),(2,712,'1'),(2,713,'1'),(2,714,'1'),(2,715,'1'),(2,716,'1'),(2,717,'1'),(2,718,'1'),(2,719,'1'),(2,720,'1'),(2,721,'1'),(2,722,'1'),(2,723,'1'),(2,724,'1'),(2,725,'1'),(2,726,'1'),(2,727,'1'),(2,728,'1'),(2,729,'1'),(2,730,'1'),(2,731,'1'),(2,732,'1'),(2,733,'1'),(2,734,'1'),(2,735,'1'),(2,736,'1'),(2,737,'1'),(2,738,'1'),(2,739,'1'),(2,740,'1'),(2,741,'1'),(2,742,'1'),(2,743,'1'),(2,744,'1'),(2,745,'1'),(2,746,'1'),(2,747,'1'),(2,748,'1'),(2,749,'1'),(2,750,'1'),(2,751,'1'),(2,752,'1'),(2,753,'1'),(2,754,'1'),(2,755,'1'),(2,756,'1'),(2,757,'1'),(2,758,'1'),(2,759,'1'),(2,760,'1'),(2,761,'1'),(2,762,'1'),(2,763,'1'),(2,764,'1'),(2,765,'1'),(2,766,'1'),(2,767,'1'),(2,768,'1'),(2,769,'1'),(2,770,'1'),(3,1,'1'),(3,2,'1'),(3,3,'1'),(3,4,'1'),(3,5,'1'),(3,12,'1'),(3,19,'1'),(3,20,'1'),(3,21,'1'),(3,22,'1'),(3,23,'1'),(3,24,'1'),(3,25,'1'),(3,26,'1'),(3,27,'1'),(3,28,'1'),(3,29,'1'),(3,30,'1'),(3,31,'1'),(3,32,'1'),(3,33,'1'),(3,34,'1'),(3,35,'1'),(3,36,'1'),(3,37,'1'),(3,38,'1'),(3,39,'1'),(3,40,'1'),(3,41,'1'),(3,42,'1'),(3,43,'1'),(3,44,'1'),(3,45,'1'),(3,46,'1'),(3,47,'1'),(3,48,'1'),(3,49,'1'),(3,50,'1'),(3,51,'1'),(3,52,'1'),(3,53,'1'),(3,54,'1'),(3,55,'1'),(3,56,'1'),(3,57,'1'),(3,58,'1'),(3,59,'1'),(3,60,'1'),(3,61,'1'),(3,62,'1'),(3,63,'1'),(3,64,'1'),(3,65,'1'),(3,66,'1'),(3,67,'1'),(3,68,'1'),(3,69,'1'),(3,70,'1'),(3,71,'1'),(3,72,'1'),(3,73,'1'),(3,74,'1'),(3,75,'1'),(3,76,'1'),(3,77,'1'),(3,78,'1'),(3,79,'1'),(3,80,'1'),(3,81,'1'),(3,82,'1'),(3,83,'1'),(3,84,'1'),(3,85,'1'),(3,86,'1'),(3,87,'1'),(3,88,'1'),(3,89,'1'),(3,90,'1'),(3,91,'1'),(3,92,'1'),(3,93,'1'),(3,94,'1'),(3,95,'1'),(3,96,'1'),(3,97,'1'),(3,98,'1'),(3,99,'1'),(3,100,'1'),(3,101,'1'),(3,102,'1'),(3,103,'1'),(3,104,'1'),(3,105,'1'),(3,106,'1'),(3,107,'1'),(3,108,'1'),(3,109,'1'),(3,110,'1'),(3,111,'1'),(3,112,'1'),(3,113,'1'),(3,114,'1'),(3,115,'1'),(3,116,'1'),(3,117,'1'),(3,118,'1'),(3,119,'1'),(3,120,'1'),(3,121,'1'),(3,122,'1'),(3,123,'1'),(3,124,'1'),(3,125,'1'),(3,126,'1'),(3,127,'1'),(3,128,'1'),(3,129,'1'),(3,130,'1'),(3,131,'1'),(3,132,'1'),(3,133,'1'),(3,134,'1'),(3,135,'1'),(3,136,'1'),(3,137,'1'),(3,138,'1'),(3,139,'1'),(3,140,'1'),(3,141,'1'),(3,142,'1'),(3,143,'1'),(3,144,'1'),(3,145,'1'),(3,146,'1'),(3,147,'1'),(3,148,'1'),(3,149,'1'),(3,150,'1'),(3,151,'1'),(3,152,'1'),(3,153,'1'),(3,154,'1'),(3,155,'1'),(3,156,'1'),(3,157,'1'),(3,158,'1'),(3,159,'1'),(3,160,'1'),(3,161,'1'),(3,162,'1'),(3,163,'1'),(3,164,'1'),(3,165,'1'),(3,166,'1'),(3,167,'1'),(3,168,'1'),(3,169,'1'),(3,170,'1'),(3,171,'1'),(3,172,'1'),(3,173,'1'),(3,174,'1'),(3,175,'1'),(3,176,'1'),(3,177,'1'),(3,178,'1'),(3,179,'1'),(3,180,'1'),(3,181,'1'),(3,182,'1'),(3,183,'1'),(3,184,'1'),(3,185,'1'),(3,186,'1'),(3,187,'1'),(3,188,'1'),(3,189,'1'),(3,190,'1'),(3,191,'1'),(3,192,'1'),(3,193,'1'),(3,194,'1'),(3,195,'1'),(3,196,'1'),(3,197,'1'),(3,198,'1'),(3,199,'1'),(3,200,'1'),(3,201,'1'),(3,202,'1'),(3,203,'1'),(3,204,'1'),(3,205,'1'),(3,206,'1'),(3,207,'1'),(3,208,'1'),(3,209,'1'),(3,210,'1'),(3,211,'1'),(3,212,'1'),(3,213,'1'),(3,214,'1'),(3,215,'1'),(3,216,'1'),(3,217,'1'),(3,218,'1'),(3,219,'1'),(3,220,'1'),(3,221,'1'),(3,222,'1'),(3,223,'1'),(3,224,'1'),(3,225,'1'),(3,226,'1'),(3,227,'1'),(3,228,'1'),(3,229,'1'),(3,230,'1'),(3,231,'1'),(3,232,'1'),(3,233,'1'),(3,234,'1'),(3,235,'1'),(3,236,'1'),(3,237,'1'),(3,238,'1'),(3,239,'1'),(3,240,'1'),(3,241,'1'),(3,242,'1'),(3,243,'1'),(3,244,'1'),(3,245,'1'),(3,246,'1'),(3,247,'1'),(3,248,'1'),(3,249,'1'),(3,250,'1'),(3,251,'1'),(3,252,'1'),(3,253,'1'),(3,254,'1'),(3,255,'1'),(3,256,'1'),(3,257,'1'),(3,258,'1'),(3,259,'1'),(3,260,'1'),(3,261,'1'),(3,262,'1'),(3,263,'1'),(3,264,'1'),(3,265,'1'),(3,266,'1'),(3,267,'1'),(3,268,'1'),(3,269,'1'),(3,270,'1'),(3,271,'1'),(3,272,'1'),(3,273,'1'),(3,274,'1'),(3,275,'1'),(3,276,'1'),(3,277,'1'),(3,278,'1'),(3,279,'1'),(3,280,'1'),(3,281,'1'),(3,282,'1'),(3,283,'1'),(3,284,'1'),(3,285,'1'),(3,286,'1'),(3,287,'1'),(3,288,'1'),(3,289,'1'),(3,290,'1'),(3,291,'1'),(3,292,'1'),(3,293,'1'),(3,294,'1'),(3,295,'1'),(3,296,'1'),(3,297,'1'),(3,298,'1'),(3,299,'1'),(3,300,'1'),(3,301,'1'),(3,302,'1'),(3,303,'1'),(3,304,'1'),(3,305,'1'),(3,306,'1'),(3,307,'1'),(3,308,'1'),(3,309,'1'),(3,310,'1'),(3,311,'1'),(3,312,'1'),(3,313,'1'),(3,314,'1'),(3,315,'1'),(3,316,'1'),(3,317,'1'),(3,318,'1'),(3,319,'1'),(3,320,'1'),(3,321,'1'),(3,322,'1'),(3,323,'1'),(3,324,'1'),(3,325,'1'),(3,326,'1'),(3,327,'1'),(3,328,'1'),(3,329,'1'),(3,330,'1'),(3,331,'1'),(3,332,'1'),(3,333,'1'),(3,334,'1'),(3,335,'1'),(3,336,'1'),(3,337,'1'),(3,338,'1'),(3,339,'1'),(3,340,'1'),(3,341,'1'),(3,342,'1'),(3,343,'1'),(3,344,'1'),(3,345,'1'),(3,346,'1'),(3,347,'1'),(3,348,'1'),(3,349,'1'),(3,350,'1'),(3,351,'1'),(3,352,'1'),(3,353,'1'),(3,354,'1'),(3,355,'1'),(3,356,'1'),(3,357,'1'),(3,358,'1'),(3,359,'1'),(3,360,'1'),(3,361,'1'),(3,362,'1'),(3,363,'1'),(3,364,'1'),(3,365,'1'),(3,366,'1'),(3,367,'1'),(3,368,'1'),(3,369,'1'),(3,370,'1'),(3,371,'1'),(3,372,'1'),(3,373,'1'),(3,374,'1'),(3,375,'1'),(3,376,'1'),(3,377,'1'),(3,378,'1'),(3,379,'1'),(3,380,'1'),(3,381,'1'),(3,382,'1'),(3,383,'1'),(3,384,'1'),(3,385,'1'),(3,386,'1'),(3,387,'1'),(3,388,'1'),(3,389,'1'),(3,390,'1'),(3,391,'1'),(3,392,'1'),(3,393,'1'),(3,394,'1'),(3,395,'1'),(3,396,'1'),(3,397,'1'),(3,398,'1'),(3,399,'1'),(3,400,'1'),(3,401,'1'),(3,402,'1'),(3,403,'1'),(3,404,'1'),(3,405,'1'),(3,406,'1'),(3,407,'1'),(3,408,'1'),(3,409,'1'),(3,410,'1'),(3,411,'1'),(3,412,'1'),(3,413,'1'),(3,414,'1'),(3,415,'1'),(3,416,'1'),(3,417,'1'),(3,418,'1'),(3,419,'1'),(3,420,'1'),(3,421,'1'),(3,422,'1'),(3,423,'1'),(3,424,'1'),(3,425,'1'),(3,426,'1'),(3,427,'1'),(3,428,'1'),(3,429,'1'),(3,430,'1'),(3,431,'1'),(3,432,'1'),(3,433,'1'),(3,434,'1'),(3,435,'1'),(3,436,'1'),(3,437,'1'),(3,438,'1'),(3,439,'1'),(3,440,'1'),(3,441,'1'),(3,442,'1'),(3,443,'1'),(3,444,'1'),(3,445,'1'),(3,446,'1'),(3,447,'1'),(3,448,'1'),(3,449,'1'),(3,450,'1'),(3,451,'1'),(3,452,'1'),(3,453,'1'),(3,454,'1'),(3,455,'1'),(3,456,'1'),(3,457,'1'),(3,458,'1'),(3,459,'1'),(3,460,'1'),(3,461,'1'),(3,462,'1'),(3,463,'1'),(3,464,'1'),(3,465,'1'),(3,466,'1'),(3,467,'1'),(3,468,'1'),(3,469,'1'),(3,470,'1'),(3,471,'1'),(3,472,'1'),(3,473,'1'),(3,474,'1'),(3,475,'1'),(3,476,'1'),(3,477,'1'),(3,478,'1'),(3,479,'1'),(3,480,'1'),(3,481,'1'),(3,482,'1'),(3,483,'1'),(3,484,'1'),(3,485,'1'),(3,486,'1'),(3,487,'1'),(3,488,'1'),(3,489,'1'),(3,490,'1'),(3,491,'1'),(3,492,'1'),(3,493,'1'),(3,494,'1'),(3,495,'1'),(3,496,'1'),(3,497,'1'),(3,498,'1'),(3,499,'1'),(3,500,'1'),(3,501,'1'),(3,502,'1'),(3,503,'1'),(3,504,'1'),(3,505,'1'),(3,506,'1'),(3,507,'1'),(3,508,'1'),(3,509,'1'),(3,510,'1'),(3,511,'1'),(3,512,'1'),(3,513,'1'),(3,514,'1'),(3,515,'1'),(3,516,'1'),(3,517,'1'),(3,518,'1'),(3,519,'1'),(3,520,'1'),(3,521,'1'),(3,522,'1'),(3,523,'1'),(3,524,'1'),(3,525,'1'),(3,526,'1'),(3,527,'1'),(3,528,'1'),(3,529,'1'),(3,530,'1'),(3,531,'1'),(3,532,'1'),(3,533,'1'),(3,534,'1'),(3,535,'1'),(3,536,'1'),(3,537,'1'),(3,538,'1'),(3,539,'1'),(3,540,'1'),(3,541,'1'),(3,542,'1'),(3,543,'1'),(3,544,'1'),(3,545,'1'),(3,546,'1'),(3,547,'1'),(3,548,'1'),(3,549,'1'),(3,550,'1'),(3,551,'1'),(3,552,'1'),(3,553,'1'),(3,554,'1'),(3,555,'1'),(3,556,'1'),(3,557,'1'),(3,558,'1'),(3,559,'1'),(3,560,'1'),(3,561,'1'),(3,562,'1'),(3,563,'1'),(3,564,'1'),(3,565,'1'),(3,566,'1'),(3,567,'1'),(3,568,'1'),(3,569,'1'),(3,570,'1'),(3,571,'1'),(3,572,'1'),(3,573,'1'),(3,574,'1'),(3,575,'1'),(3,576,'1'),(3,577,'1'),(3,578,'1'),(3,579,'1'),(3,580,'1'),(3,581,'1'),(3,582,'1'),(3,583,'1'),(3,584,'1'),(3,585,'1'),(3,586,'1'),(3,587,'1'),(3,588,'1'),(3,589,'1'),(3,590,'1'),(3,591,'1'),(3,592,'1'),(3,593,'1'),(3,594,'1'),(3,595,'1'),(3,596,'1'),(3,597,'1'),(3,598,'1'),(3,599,'1'),(3,600,'1'),(3,601,'1'),(3,602,'1'),(3,603,'1'),(3,604,'1'),(3,605,'1'),(3,606,'1'),(3,607,'1'),(3,608,'1'),(3,609,'1'),(3,610,'1'),(3,611,'1'),(3,612,'1'),(3,613,'1'),(3,614,'1'),(3,615,'1'),(3,616,'1'),(3,617,'1'),(3,618,'1'),(3,619,'1'),(3,620,'1'),(3,621,'1'),(3,622,'1'),(3,623,'1'),(3,624,'1'),(3,625,'1'),(3,626,'1'),(3,627,'1'),(3,628,'1'),(3,629,'1'),(3,630,'1'),(3,631,'1'),(3,632,'1'),(3,633,'1'),(3,634,'1'),(3,635,'1'),(3,636,'1'),(3,637,'1'),(3,638,'1'),(3,639,'1'),(3,640,'1'),(3,641,'1'),(3,642,'1'),(3,643,'1'),(3,644,'1'),(3,645,'1'),(3,646,'1'),(3,647,'1'),(3,648,'1'),(3,649,'1'),(3,650,'1'),(3,651,'1'),(3,652,'1'),(3,653,'1'),(3,654,'1'),(3,655,'1'),(3,656,'1'),(3,657,'1'),(3,658,'1'),(3,659,'1'),(3,660,'1'),(3,661,'1'),(3,662,'1'),(3,663,'1'),(3,664,'1'),(3,665,'1'),(3,666,'1'),(3,667,'1'),(3,668,'1'),(3,669,'1'),(3,670,'1'),(3,671,'1'),(3,672,'1'),(3,673,'1'),(3,674,'1'),(3,675,'1'),(3,676,'1'),(3,677,'1'),(3,678,'1'),(3,679,'1'),(3,680,'1'),(3,681,'1'),(3,682,'1'),(3,683,'1'),(3,684,'1'),(3,685,'1'),(3,686,'1'),(3,687,'1'),(3,688,'1'),(3,689,'1'),(3,690,'1'),(3,691,'1'),(3,692,'1'),(3,693,'1'),(3,694,'1'),(3,695,'1'),(3,696,'1'),(3,697,'1'),(3,698,'1'),(3,699,'1'),(3,700,'1'),(3,701,'1'),(3,702,'1'),(3,703,'1'),(3,704,'1'),(3,705,'1'),(3,706,'1'),(3,707,'1'),(3,708,'1'),(3,709,'1'),(3,710,'1'),(3,711,'1'),(3,712,'1'),(3,713,'1'),(3,714,'1'),(3,715,'1'),(3,716,'1'),(3,717,'1'),(3,718,'1'),(3,719,'1'),(3,720,'1'),(3,721,'1'),(3,722,'1'),(3,723,'1'),(3,724,'1'),(3,725,'1'),(3,726,'1'),(3,727,'1'),(3,728,'1'),(3,729,'1'),(3,730,'1'),(3,731,'1'),(3,732,'1'),(3,733,'1'),(3,734,'1'),(3,735,'1'),(3,736,'1'),(3,737,'1'),(3,738,'1'),(3,739,'1'),(3,740,'1'),(3,741,'1'),(3,742,'1'),(3,743,'1'),(3,744,'1'),(3,745,'1'),(3,746,'1'),(3,747,'1'),(3,748,'1'),(3,749,'1'),(3,750,'1'),(3,751,'1'),(3,752,'1'),(3,753,'1'),(3,754,'1'),(3,755,'1'),(3,756,'1'),(3,757,'1'),(3,758,'1'),(3,759,'1'),(3,760,'1'),(3,761,'1'),(3,762,'1'),(3,763,'1'),(3,764,'1'),(3,765,'1'),(3,766,'1'),(3,767,'1'),(3,768,'1'),(3,769,'1'),(3,770,'1'),(4,1,'1'),(4,2,'1'),(4,3,'1'),(4,4,'1'),(4,5,'1'),(4,12,'1'),(4,19,'1'),(4,20,'1'),(4,21,'1'),(4,22,'1'),(4,23,'1'),(4,24,'1'),(4,25,'1'),(4,26,'1'),(4,27,'1'),(4,28,'1'),(4,29,'1'),(4,30,'1'),(4,31,'1'),(4,32,'1'),(4,33,'1'),(4,34,'1'),(4,35,'1'),(4,36,'1'),(4,37,'1'),(4,38,'1'),(4,39,'1'),(4,40,'1'),(4,41,'1'),(4,42,'1'),(4,43,'1'),(4,44,'1'),(4,45,'1'),(4,46,'1'),(4,47,'1'),(4,48,'1'),(4,49,'1'),(4,50,'1'),(4,51,'1'),(4,52,'1'),(4,53,'1'),(4,54,'1'),(4,55,'1'),(4,56,'1'),(4,57,'1'),(4,58,'1'),(4,59,'1'),(4,60,'1'),(4,61,'1'),(4,62,'1'),(4,63,'1'),(4,64,'1'),(4,65,'1'),(4,66,'1'),(4,67,'1'),(4,68,'1'),(4,69,'1'),(4,70,'1'),(4,71,'1'),(4,72,'1'),(4,73,'1'),(4,74,'1'),(4,75,'1'),(4,76,'1'),(4,77,'1'),(4,78,'1'),(4,79,'1'),(4,80,'1'),(4,81,'1'),(4,82,'1'),(4,83,'1'),(4,84,'1'),(4,85,'1'),(4,86,'1'),(4,87,'1'),(4,88,'1'),(4,89,'1'),(4,90,'1'),(4,91,'1'),(4,92,'1'),(4,93,'1'),(4,94,'1'),(4,95,'1'),(4,96,'1'),(4,97,'1'),(4,98,'1'),(4,99,'1'),(4,100,'1'),(4,101,'1'),(4,102,'1'),(4,103,'1'),(4,104,'1'),(4,105,'1'),(4,106,'1'),(4,107,'1'),(4,108,'1'),(4,109,'1'),(4,110,'1'),(4,111,'1'),(4,112,'1'),(4,113,'1'),(4,114,'1'),(4,115,'1'),(4,116,'1'),(4,117,'1'),(4,118,'1'),(4,119,'1'),(4,120,'1'),(4,121,'1'),(4,122,'1'),(4,123,'1'),(4,124,'1'),(4,125,'1'),(4,126,'1'),(4,127,'1'),(4,128,'1'),(4,129,'1'),(4,130,'1'),(4,131,'1'),(4,132,'1'),(4,133,'1'),(4,134,'1'),(4,135,'1'),(4,136,'1'),(4,137,'1'),(4,138,'1'),(4,139,'1'),(4,140,'1'),(4,141,'1'),(4,142,'1'),(4,143,'1'),(4,144,'1'),(4,145,'1'),(4,146,'1'),(4,147,'1'),(4,148,'1'),(4,149,'1'),(4,150,'1'),(4,151,'1'),(4,152,'1'),(4,153,'1'),(4,154,'1'),(4,155,'1'),(4,156,'1'),(4,157,'1'),(4,158,'1'),(4,159,'1'),(4,160,'1'),(4,161,'1'),(4,162,'1'),(4,163,'1'),(4,164,'1'),(4,165,'1'),(4,166,'1'),(4,167,'1'),(4,168,'1'),(4,169,'1'),(4,170,'1'),(4,171,'1'),(4,172,'1'),(4,173,'1'),(4,174,'1'),(4,175,'1'),(4,176,'1'),(4,177,'1'),(4,178,'1'),(4,179,'1'),(4,180,'1'),(4,181,'1'),(4,182,'1'),(4,183,'1'),(4,184,'1'),(4,185,'1'),(4,186,'1'),(4,187,'1'),(4,188,'1'),(4,189,'1'),(4,190,'1'),(4,191,'1'),(4,192,'1'),(4,193,'1'),(4,194,'1'),(4,195,'1'),(4,196,'1'),(4,197,'1'),(4,198,'1'),(4,199,'1'),(4,200,'1'),(4,201,'1'),(4,202,'1'),(4,203,'1'),(4,204,'1'),(4,205,'1'),(4,206,'1'),(4,207,'1'),(4,208,'1'),(4,209,'1'),(4,210,'1'),(4,211,'1'),(4,212,'1'),(4,213,'1'),(4,214,'1'),(4,215,'1'),(4,216,'1'),(4,217,'1'),(4,218,'1'),(4,219,'1'),(4,220,'1'),(4,221,'1'),(4,222,'1'),(4,223,'1'),(4,224,'1'),(4,225,'1'),(4,226,'1'),(4,227,'1'),(4,228,'1'),(4,229,'1'),(4,230,'1'),(4,231,'1'),(4,232,'1'),(4,233,'1'),(4,234,'1'),(4,235,'1'),(4,236,'1'),(4,237,'1'),(4,238,'1'),(4,239,'1'),(4,240,'1'),(4,241,'1'),(4,242,'1'),(4,243,'1'),(4,244,'1'),(4,245,'1'),(4,246,'1'),(4,247,'1'),(4,248,'1'),(4,249,'1'),(4,250,'1'),(4,251,'1'),(4,252,'1'),(4,253,'1'),(4,254,'1'),(4,255,'1'),(4,256,'1'),(4,257,'1'),(4,258,'1'),(4,259,'1'),(4,260,'1'),(4,261,'1'),(4,262,'1'),(4,263,'1'),(4,264,'1'),(4,265,'1'),(4,266,'1'),(4,267,'1'),(4,268,'1'),(4,269,'1'),(4,270,'1'),(4,271,'1'),(4,272,'1'),(4,273,'1'),(4,274,'1'),(4,275,'1'),(4,276,'1'),(4,277,'1'),(4,278,'1'),(4,279,'1'),(4,280,'1'),(4,281,'1'),(4,282,'1'),(4,283,'1'),(4,284,'1'),(4,285,'1'),(4,286,'1'),(4,287,'1'),(4,288,'1'),(4,289,'1'),(4,290,'1'),(4,291,'1'),(4,292,'1'),(4,293,'1'),(4,294,'1'),(4,295,'1'),(4,296,'1'),(4,297,'1'),(4,298,'1'),(4,299,'1'),(4,300,'1'),(4,301,'1'),(4,302,'1'),(4,303,'1'),(4,304,'1'),(4,305,'1'),(4,306,'1'),(4,307,'1'),(4,308,'1'),(4,309,'1'),(4,310,'1'),(4,311,'1'),(4,312,'1'),(4,313,'1'),(4,314,'1'),(4,315,'1'),(4,316,'1'),(4,317,'1'),(4,318,'1'),(4,319,'1'),(4,320,'1'),(4,321,'1'),(4,322,'1'),(4,323,'1'),(4,324,'1'),(4,325,'1'),(4,326,'1'),(4,327,'1'),(4,328,'1'),(4,329,'1'),(4,330,'1'),(4,331,'1'),(4,332,'1'),(4,333,'1'),(4,334,'1'),(4,335,'1'),(4,336,'1'),(4,337,'1'),(4,338,'1'),(4,339,'1'),(4,340,'1'),(4,341,'1'),(4,342,'1'),(4,343,'1'),(4,344,'1'),(4,345,'1'),(4,346,'1'),(4,347,'1'),(4,348,'1'),(4,349,'1'),(4,350,'1'),(4,351,'1'),(4,352,'1'),(4,353,'1'),(4,354,'1'),(4,355,'1'),(4,356,'1'),(4,357,'1'),(4,358,'1'),(4,359,'1'),(4,360,'1'),(4,361,'1'),(4,362,'1'),(4,363,'1'),(4,364,'1'),(4,365,'1'),(4,366,'1'),(4,367,'1'),(4,368,'1'),(4,369,'1'),(4,370,'1'),(4,371,'1'),(4,372,'1'),(4,373,'1'),(4,374,'1'),(4,375,'1'),(4,376,'1'),(4,377,'1'),(4,378,'1'),(4,379,'1'),(4,380,'1'),(4,381,'1'),(4,382,'1'),(4,383,'1'),(4,384,'1'),(4,385,'1'),(4,386,'1'),(4,387,'1'),(4,388,'1'),(4,389,'1'),(4,390,'1'),(4,391,'1'),(4,392,'1'),(4,393,'1'),(4,394,'1'),(4,395,'1'),(4,396,'1'),(4,397,'1'),(4,398,'1'),(4,399,'1'),(4,400,'1'),(4,401,'1'),(4,402,'1'),(4,403,'1'),(4,404,'1'),(4,405,'1'),(4,406,'1'),(4,407,'1'),(4,408,'1'),(4,409,'1'),(4,410,'1'),(4,411,'1'),(4,412,'1'),(4,413,'1'),(4,414,'1'),(4,415,'1'),(4,416,'1'),(4,417,'1'),(4,418,'1'),(4,419,'1'),(4,420,'1'),(4,421,'1'),(4,422,'1'),(4,423,'1'),(4,424,'1'),(4,425,'1'),(4,426,'1'),(4,427,'1'),(4,428,'1'),(4,429,'1'),(4,430,'1'),(4,431,'1'),(4,432,'1'),(4,433,'1'),(4,434,'1'),(4,435,'1'),(4,436,'1'),(4,437,'1'),(4,438,'1'),(4,439,'1'),(4,440,'1'),(4,441,'1'),(4,442,'1'),(4,443,'1'),(4,444,'1'),(4,445,'1'),(4,446,'1'),(4,447,'1'),(4,448,'1'),(4,449,'1'),(4,450,'1'),(4,451,'1'),(4,452,'1'),(4,453,'1'),(4,454,'1'),(4,455,'1'),(4,456,'1'),(4,457,'1'),(4,458,'1'),(4,459,'1'),(4,460,'1'),(4,461,'1'),(4,462,'1'),(4,463,'1'),(4,464,'1'),(4,465,'1'),(4,466,'1'),(4,467,'1'),(4,468,'1'),(4,469,'1'),(4,470,'1'),(4,471,'1'),(4,472,'1'),(4,473,'1'),(4,474,'1'),(4,475,'1'),(4,476,'1'),(4,477,'1'),(4,478,'1'),(4,479,'1'),(4,480,'1'),(4,481,'1'),(4,482,'1'),(4,483,'1'),(4,484,'1'),(4,485,'1'),(4,486,'1'),(4,487,'1'),(4,488,'1'),(4,489,'1'),(4,490,'1'),(4,491,'1'),(4,492,'1'),(4,493,'1'),(4,494,'1'),(4,495,'1'),(4,496,'1'),(4,497,'1'),(4,498,'1'),(4,499,'1'),(4,500,'1'),(4,501,'1'),(4,502,'1'),(4,503,'1'),(4,504,'1'),(4,505,'1'),(4,506,'1'),(4,507,'1'),(4,508,'1'),(4,509,'1'),(4,510,'1'),(4,511,'1'),(4,512,'1'),(4,513,'1'),(4,514,'1'),(4,515,'1'),(4,516,'1'),(4,517,'1'),(4,518,'1'),(4,519,'1'),(4,520,'1'),(4,521,'1'),(4,522,'1'),(4,523,'1'),(4,524,'1'),(4,525,'1'),(4,526,'1'),(4,527,'1'),(4,528,'1'),(4,529,'1'),(4,530,'1'),(4,531,'1'),(4,532,'1'),(4,533,'1'),(4,534,'1'),(4,535,'1'),(4,536,'1'),(4,537,'1'),(4,538,'1'),(4,539,'1'),(4,540,'1'),(4,541,'1'),(4,542,'1'),(4,543,'1'),(4,544,'1'),(4,545,'1'),(4,546,'1'),(4,547,'1'),(4,548,'1'),(4,549,'1'),(4,550,'1'),(4,551,'1'),(4,552,'1'),(4,553,'1'),(4,554,'1'),(4,555,'1'),(4,556,'1'),(4,557,'1'),(4,558,'1'),(4,559,'1'),(4,560,'1'),(4,561,'1'),(4,562,'1'),(4,563,'1'),(4,564,'1'),(4,565,'1'),(4,566,'1'),(4,567,'1'),(4,568,'1'),(4,569,'1'),(4,570,'1'),(4,571,'1'),(4,572,'1'),(4,573,'1'),(4,574,'1'),(4,575,'1'),(4,576,'1'),(4,577,'1'),(4,578,'1'),(4,579,'1'),(4,580,'1'),(4,581,'1'),(4,582,'1'),(4,583,'1'),(4,584,'1'),(4,585,'1'),(4,586,'1'),(4,587,'1'),(4,588,'1'),(4,589,'1'),(4,590,'1'),(4,591,'1'),(4,592,'1'),(4,593,'1'),(4,594,'1'),(4,595,'1'),(4,596,'1'),(4,597,'1'),(4,598,'1'),(4,599,'1'),(4,600,'1'),(4,601,'1'),(4,602,'1'),(4,603,'1'),(4,604,'1'),(4,605,'1'),(4,606,'1'),(4,607,'1'),(4,608,'1'),(4,609,'1'),(4,610,'1'),(4,611,'1'),(4,612,'1'),(4,613,'1'),(4,614,'1'),(4,615,'1'),(4,616,'1'),(4,617,'1'),(4,618,'1'),(4,619,'1'),(4,620,'1'),(4,621,'1'),(4,622,'1'),(4,623,'1'),(4,624,'1'),(4,625,'1'),(4,626,'1'),(4,627,'1'),(4,628,'1'),(4,629,'1'),(4,630,'1'),(4,631,'1'),(4,632,'1'),(4,633,'1'),(4,634,'1'),(4,635,'1'),(4,636,'1'),(4,637,'1'),(4,638,'1'),(4,639,'1'),(4,640,'1'),(4,641,'1'),(4,642,'1'),(4,643,'1'),(4,644,'1'),(4,645,'1'),(4,646,'1'),(4,647,'1'),(4,648,'1'),(4,649,'1'),(4,650,'1'),(4,651,'1'),(4,652,'1'),(4,653,'1'),(4,654,'1'),(4,655,'1'),(4,656,'1'),(4,657,'1'),(4,658,'1'),(4,659,'1'),(4,660,'1'),(4,661,'1'),(4,662,'1'),(4,663,'1'),(4,664,'1'),(4,665,'1'),(4,666,'1'),(4,667,'1'),(4,668,'1'),(4,669,'1'),(4,670,'1'),(4,671,'1'),(4,672,'1'),(4,673,'1'),(4,674,'1'),(4,675,'1'),(4,676,'1'),(4,677,'1'),(4,678,'1'),(4,679,'1'),(4,680,'1'),(4,681,'1'),(4,682,'1'),(4,683,'1'),(4,684,'1'),(4,685,'1'),(4,686,'1'),(4,687,'1'),(4,688,'1'),(4,689,'1'),(4,690,'1'),(4,691,'1'),(4,692,'1'),(4,693,'1'),(4,694,'1'),(4,695,'1'),(4,696,'1'),(4,697,'1'),(4,698,'1'),(4,699,'1'),(4,700,'1'),(4,701,'1'),(4,702,'1'),(4,703,'1'),(4,704,'1'),(4,705,'1'),(4,706,'1'),(4,707,'1'),(4,708,'1'),(4,709,'1'),(4,710,'1'),(4,711,'1'),(4,712,'1'),(4,713,'1'),(4,714,'1'),(4,715,'1'),(4,716,'1'),(4,717,'1'),(4,718,'1'),(4,719,'1'),(4,720,'1'),(4,721,'1'),(4,722,'1'),(4,723,'1'),(4,724,'1'),(4,725,'1'),(4,726,'1'),(4,727,'1'),(4,728,'1'),(4,729,'1'),(4,730,'1'),(4,731,'1'),(4,732,'1'),(4,733,'1'),(4,734,'1'),(4,735,'1'),(4,736,'1'),(4,737,'1'),(4,738,'1'),(4,739,'1'),(4,740,'1'),(4,741,'1'),(4,742,'1'),(4,743,'1'),(4,744,'1'),(4,745,'1'),(4,746,'1'),(4,747,'1'),(4,748,'1'),(4,749,'1'),(4,750,'1'),(4,751,'1'),(4,752,'1'),(4,753,'1'),(4,754,'1'),(4,755,'1'),(4,756,'1'),(4,757,'1'),(4,758,'1'),(4,759,'1'),(4,760,'1'),(4,761,'1'),(4,762,'1'),(4,763,'1'),(4,764,'1'),(4,765,'1'),(4,766,'1'),(4,767,'1'),(4,768,'1'),(4,769,'1'),(4,770,'1');
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
  KEY `fk_role_has_menu_role1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_menu`
--

LOCK TABLES `role_has_menu` WRITE;
/*!40000 ALTER TABLE `role_has_menu` DISABLE KEYS */;
INSERT INTO `role_has_menu` (`role_id`, `menu_id`, `accessible`) VALUES (1,1,'1'),(1,2,'1'),(1,3,'1'),(1,13,'1'),(1,14,'1'),(1,21,'1'),(1,22,'1'),(1,23,'1'),(1,24,'1'),(1,25,'1'),(1,27,'1'),(1,54,'1'),(1,56,'1'),(1,67,'1'),(1,71,'1'),(1,79,'1'),(1,80,'1'),(1,81,'1'),(1,82,'1'),(1,83,'1'),(1,84,'1'),(1,86,'1'),(1,87,'1'),(1,88,'1'),(1,89,'1'),(1,90,'1'),(1,91,'1'),(1,92,'1'),(1,93,'1'),(1,94,'1'),(1,95,'1'),(1,96,'1'),(1,97,'1'),(1,98,'1'),(1,99,'1'),(1,100,'1'),(1,101,'1'),(1,102,'1'),(1,103,'1'),(1,104,'1'),(1,105,'1'),(1,106,'1'),(1,109,'1'),(1,110,'1'),(1,111,'1'),(1,112,'1'),(1,113,'1'),(1,114,'1'),(1,115,'1'),(1,116,'1'),(1,117,'1'),(1,118,'1'),(1,119,'1'),(1,122,'1'),(1,441,'1'),(1,442,'1'),(1,443,'1'),(1,444,'1'),(1,445,'1'),(1,446,'1'),(1,447,'1'),(1,448,'1'),(1,449,'1'),(1,450,'1'),(1,451,'1'),(1,452,'1'),(1,453,'1'),(1,454,'1'),(1,457,'1'),(1,458,'1'),(1,460,'1'),(1,461,'1'),(1,462,'1'),(1,463,'1'),(1,464,'1'),(1,465,'1'),(1,466,'1'),(1,467,'1'),(1,469,'1'),(1,471,'1'),(1,472,'1'),(1,473,'1'),(1,476,'1'),(1,477,'1'),(1,478,'1'),(1,479,'1'),(1,480,'1'),(1,481,'1'),(1,482,'1'),(1,483,'1'),(1,484,'1'),(2,3,'1'),(2,21,'1'),(2,22,'1'),(2,23,'1'),(2,24,'1'),(2,25,'1'),(2,27,'1'),(2,54,'1'),(2,56,'1'),(2,67,'1'),(2,71,'1'),(2,89,'1'),(2,90,'1'),(2,93,'1'),(2,94,'1'),(2,95,'1'),(2,96,'1'),(2,97,'1'),(2,103,'1'),(2,104,'1'),(2,109,'1'),(2,446,'1'),(2,449,'1'),(2,452,'1'),(2,457,'1'),(2,462,'1'),(3,3,'1'),(3,109,'1'),(3,110,'1'),(3,111,'1'),(3,112,'1'),(3,113,'1'),(3,114,'1'),(3,115,'1'),(3,116,'1'),(3,117,'1'),(3,118,'1'),(3,119,'1'),(3,446,'1'),(3,447,'1'),(3,448,'1'),(3,449,'1'),(4,1,'1'),(4,2,'1'),(4,3,'1'),(4,13,'1'),(4,14,'1'),(4,21,'1'),(4,22,'1'),(4,23,'1'),(4,24,'1'),(4,25,'1'),(4,27,'1'),(4,54,'1'),(4,56,'1'),(4,67,'1'),(4,71,'1'),(4,79,'1'),(4,80,'1'),(4,81,'1'),(4,82,'1'),(4,83,'1'),(4,84,'1'),(4,86,'1'),(4,87,'1'),(4,88,'1'),(4,89,'1'),(4,90,'1'),(4,91,'1'),(4,92,'1'),(4,93,'1'),(4,94,'1'),(4,95,'1'),(4,96,'1'),(4,97,'1'),(4,98,'1'),(4,99,'1'),(4,100,'1'),(4,101,'1'),(4,102,'1'),(4,103,'1'),(4,104,'1'),(4,105,'1'),(4,106,'1'),(4,109,'1'),(4,110,'1'),(4,111,'1'),(4,112,'1'),(4,113,'1'),(4,114,'1'),(4,115,'1'),(4,116,'1'),(4,117,'1'),(4,118,'1'),(4,119,'1'),(4,122,'1'),(4,441,'1'),(4,442,'1'),(4,443,'1'),(4,444,'1'),(4,445,'1'),(4,446,'1'),(4,447,'1'),(4,448,'1'),(4,449,'1'),(4,450,'1'),(4,451,'1'),(4,452,'1'),(4,453,'1'),(4,454,'1'),(4,457,'1'),(4,458,'1'),(4,460,'1'),(4,461,'1'),(4,462,'1'),(4,463,'1'),(4,464,'1'),(4,465,'1'),(4,466,'1'),(4,467,'1'),(4,469,'1'),(4,471,'1'),(4,472,'1'),(4,473,'1'),(4,475,'1'),(4,483,'1'),(4,484,'1');
/*!40000 ALTER TABLE `role_has_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_academic_year`
--

DROP TABLE IF EXISTS `sis_academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_academic_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_year` char(7) NOT NULL COMMENT 'e.g 2013-17',
  `next_admission_code` smallint(5) unsigned zerofill NOT NULL DEFAULT '00001' COMMENT 'restart from 1 each academic_year',
  `admission_start_date` datetime NOT NULL,
  `admission_end_date` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(3) unsigned zerofill NOT NULL,
  `academic_start_date` date NOT NULL COMMENT 'The date of the first September weekday of the academic year (not include Saturday and Sunday) ',
  `academic_end_date` date NOT NULL COMMENT 'The last date of August (31 August) of the following year',
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_year_UNIQUE` (`academic_year`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_academic_year`
--

LOCK TABLES `sis_academic_year` WRITE;
/*!40000 ALTER TABLE `sis_academic_year` DISABLE KEYS */;
INSERT INTO `sis_academic_year` (`id`, `academic_year`, `next_admission_code`, `admission_start_date`, `admission_end_date`, `active`, `is_open`, `set_order`, `academic_start_date`, `academic_end_date`) VALUES (1,'2017-18',00001,'2017-07-01 00:00:00','2017-08-31 00:00:00',1,1,001,'2017-09-01','2018-07-31'),(2,'2019-20',00001,'2019-07-01 00:00:00','2019-08-31 00:00:00',1,1,001,'2019-09-01','2020-08-31'),(3,'2020-21',00002,'2020-07-01 00:00:00','2020-08-31 00:00:00',1,1,002,'2020-09-01','2021-08-31'),(4,'2018-19',00001,'2018-07-01 00:00:00','2018-08-31 00:00:00',1,1,003,'2018-09-01','2019-08-31'),(5,'2021-22',00001,'2021-07-01 00:00:00','2021-08-31 00:00:00',1,1,003,'2021-09-01','2022-08-31'),(7,'2022-23',00001,'2022-07-01 00:00:00','2022-07-30 00:00:00',1,1,003,'2022-08-01','2023-07-30');
/*!40000 ALTER TABLE `sis_academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_admission`
--

DROP TABLE IF EXISTS `sis_admission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_admission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admission_name` varchar(100) NOT NULL,
  `admission_code` char(9) NOT NULL,
  `created` datetime NOT NULL,
  `start_admission_date` date NOT NULL,
  `end_admission_date` date NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `start_admission_late_date` date NOT NULL,
  `end_admission_late_date` date NOT NULL,
  `status` enum('New','Opened','Closed') NOT NULL DEFAULT 'New',
  `invoice_template_quota_id` int(11) DEFAULT NULL,
  `invoice_template_quota_late_id` int(11) DEFAULT NULL,
  `invoice_template_non_quota_id` int(11) DEFAULT NULL,
  `invoice_template_non_quota_late_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index16` (`academic_year_id`,`admission_code`),
  KEY `fk_sis_admission_sis_academic_year1_idx` (`academic_year_id`),
  CONSTRAINT `fk_sis_admission_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_admission`
--

LOCK TABLES `sis_admission` WRITE;
/*!40000 ALTER TABLE `sis_admission` DISABLE KEYS */;
INSERT INTO `sis_admission` (`id`, `admission_name`, `admission_code`, `created`, `start_admission_date`, `end_admission_date`, `academic_year_id`, `start_admission_late_date`, `end_admission_late_date`, `status`, `invoice_template_quota_id`, `invoice_template_quota_late_id`, `invoice_template_non_quota_id`, `invoice_template_non_quota_late_id`) VALUES (2,'ຮັບ​ນັກ​ສຶກ​ສາ​ໃໝ່​ສົກ​ຮຽນ 2018-2019','2018','2018-02-02 17:24:02','2018-09-01','2018-09-30',4,'2018-10-01','2018-11-30','New',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sis_admission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_admission_checklist`
--

DROP TABLE IF EXISTS `sis_admission_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_admission_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_id` int(11) NOT NULL,
  `checklist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'enable if prospective student has the document',
  `uploaded_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COMMENT 'reason for fail checklist (optional)',
  PRIMARY KEY (`id`),
  KEY `fk_sis_admission_checklist_sis_document_type1_idx` (`document_type_id`),
  CONSTRAINT `fk_sis_admission_checklist_sis_document_type1` FOREIGN KEY (`document_type_id`) REFERENCES `sis_document_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_admission_checklist`
--

LOCK TABLES `sis_admission_checklist` WRITE;
/*!40000 ALTER TABLE `sis_admission_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_admission_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_application_entry_method`
--

DROP TABLE IF EXISTS `sis_application_entry_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_application_entry_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_method` varchar(60) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_application_entry_method`
--

LOCK TABLES `sis_application_entry_method` WRITE;
/*!40000 ALTER TABLE `sis_application_entry_method` DISABLE KEYS */;
INSERT INTO `sis_application_entry_method` (`id`, `entry_method`, `active`, `set_order`) VALUES (1,'Online',1,01),(2,'Manual',1,02),(3,'Load',1,03);
/*!40000 ALTER TABLE `sis_application_entry_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_application_form`
--

DROP TABLE IF EXISTS `sis_application_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_application_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_code` char(5) NOT NULL,
  `title_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `telphone_no` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sms_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'notify or not notify to sms (0 or 1)',
  `email_notification` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'notify or not notify to email (0 or 1)',
  `ethnic_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL COMMENT 'currently living province',
  `district_id` int(11) NOT NULL COMMENT 'currently living district',
  `village_id` int(11) NOT NULL COMMENT 'currently living village',
  `graduated_year_id` int(11) NOT NULL,
  `province_graduated` int(11) NOT NULL,
  `picture_file` varchar(100) DEFAULT NULL COMMENT 'picture file name of the application',
  `entrance_id` int(11) NOT NULL,
  `applicant_status_id` int(11) NOT NULL,
  `entry_method_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `graduated_school` varchar(255) NOT NULL,
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Male 0 and Female 1',
  `seat_no` varchar(3) DEFAULT NULL,
  `non_diploma` varchar(1) DEFAULT '0' COMMENT '0: unselected\n1: selected',
  PRIMARY KEY (`id`),
  UNIQUE KEY `applicant_code_UNIQUE` (`applicant_code`),
  KEY `fk_sis_application_sis_title1_idx` (`title_id`),
  KEY `fk_sis_application_sis_ethnic1_idx` (`ethnic_id`),
  KEY `fk_sis_application_sis_province1_idx` (`province_id`),
  KEY `fk_sis_application_sis_district1_idx` (`district_id`),
  KEY `fk_sis_application_sis_village1_idx` (`village_id`),
  KEY `fk_sis_application_sis_graduated_year1_idx` (`graduated_year_id`),
  KEY `fk_sis_application_sis_province2_idx` (`province_graduated`),
  KEY `fk_sis_application_sis_entrance1_idx` (`entrance_id`),
  KEY `fk_sis_application_sis_application_status1_idx` (`applicant_status_id`),
  KEY `fk_sis_application_sis_application_entry_method1_idx` (`entry_method_id`),
  CONSTRAINT `fk_sis_application_sis_application_entry_method1` FOREIGN KEY (`entry_method_id`) REFERENCES `sis_application_entry_method` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_application_status1` FOREIGN KEY (`applicant_status_id`) REFERENCES `sis_application_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_district1` FOREIGN KEY (`district_id`) REFERENCES `sis_district` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_entrance1` FOREIGN KEY (`entrance_id`) REFERENCES `sis_entrance` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_ethnic1` FOREIGN KEY (`ethnic_id`) REFERENCES `sis_ethnic` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_graduated_year1` FOREIGN KEY (`graduated_year_id`) REFERENCES `sis_graduated_year` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_province1` FOREIGN KEY (`province_id`) REFERENCES `sis_province` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_province2` FOREIGN KEY (`province_graduated`) REFERENCES `sis_province` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_title1` FOREIGN KEY (`title_id`) REFERENCES `sis_title` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_application_sis_village1` FOREIGN KEY (`village_id`) REFERENCES `sis_village` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_application_form`
--

LOCK TABLES `sis_application_form` WRITE;
/*!40000 ALTER TABLE `sis_application_form` DISABLE KEYS */;
INSERT INTO `sis_application_form` (`id`, `applicant_code`, `title_id`, `first_name`, `last_name`, `birth_date`, `mobile_no`, `telphone_no`, `email`, `sms_notification`, `email_notification`, `ethnic_id`, `province_id`, `district_id`, `village_id`, `graduated_year_id`, `province_graduated`, `picture_file`, `entrance_id`, `applicant_status_id`, `entry_method_id`, `created`, `graduated_school`, `gender`, `seat_no`, `non_diploma`) VALUES (1,'00001',1,'ແກະ​ນ້ອຍ','​ລອຍ​ລົມ','1992-02-06','45678912',NULL,NULL,0,0,2,3,19,1125,7,3,'2018-19_00001.jpg',8,1,1,'2018-02-01 04:59:12','ມັດ​ທະ​ຍົມ​ຈ່າ​ແກ້ວ',0,NULL,'1'),(2,'00002',2,'Tadam','KHAODY','1999-05-07','56666666','02056565656','tadam@yahoo.com',0,0,7,4,28,1384,6,1,'2018-19_00002.jpg',8,1,1,'2018-02-01 05:01:03','ມສ ວຽງຈັນ',0,NULL,'1'),(3,'00003',2,'ພອນທິບ','ທິດາພອນ','1990-07-14','020 77884787',NULL,NULL,0,0,1,10,82,4902,3,10,'2018-19_00003.jpg',8,1,2,'2018-02-01 05:01:24','ມສ ນາອັນ',0,'2','1'),(4,'00004',2,'ກຸກ​ໄກ່','​ສີ​ນົນ​ໄຊ','2000-06-22','77589635',NULL,NULL,0,0,1,1,5,177,7,1,'2018-19_00004.jpg',8,1,1,'2018-02-01 05:02:18','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ນາ​ຄູນ​ນ້ອຍ',0,NULL,'1'),(5,'00005',1,'ນ້ອຍສຸດຕິພົງ','ພອນສະຫວັດ','1998-10-12','56568881','020456788','noy@gmail.com',0,0,1,13,103,5999,7,13,'2018-19_00005.jpg',8,1,1,'2018-02-01 05:03:43','ມສ ອຸທຸມພອນ',0,NULL,'1'),(6,'00006',1,'ຈັນທະພອນ','ວົງໄຊ','1992-05-23','020 79988585',NULL,NULL,0,0,3,17,142,8183,5,17,'2018-19_00006.jpg',8,1,2,'2018-02-01 05:04:02','ມສ ດາກປອກໄໝ່',0,'2','1'),(7,'00007',2,'ສອນ​ນາ​ລີ','ສີ​ສຸ​ພັນ','1995-09-12','55668485',NULL,NULL,0,0,4,9,65,3989,7,9,'2018-19_00007.jpg',8,1,1,'2018-02-01 05:05:11','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ໂພນ​ໄຊ​ເໜືອ',0,NULL,'1'),(8,'00008',2,'Soumethta','Ladasone','1999-12-08','5978243','021896345','s_ta@gmail.com',0,0,1,1,4,155,7,1,'2018-19_00008.jpg',8,1,1,'2018-02-01 05:05:57','ມປ ສີນາກ',0,NULL,'1'),(9,'00009',2,'ແອນນີ່','ທອງລາ','1991-09-03','020 22569877',NULL,NULL,0,0,8,4,23,1750,3,4,'2018-19_00009.jpg',8,1,2,'2018-02-01 05:06:27','ມສ ຕາດມ່ວນ',0,'2','1'),(10,'00010',2,'ນ້ອຍ','ຈັນ​ທະ​ຈອນ','1994-07-18','9958632',NULL,NULL,0,0,7,6,34,2105,5,6,'2018-19_00010.jpg',8,1,1,'2018-02-01 05:07:21','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ວຽງ​ແກ້ວ',0,NULL,'1'),(11,'00011',1,'Soutthikhone','Douangdy','1998-07-08','56792466','021 312198','soutthikone@gmail.com',0,0,2,16,138,7955,7,16,'2018-19_00011.jpg',8,1,1,'2018-02-01 05:08:21','ມປ ເມືອງໂຂງ',0,NULL,'1'),(12,'00012',2,'ວັນທອງ','ສອງໃຈ','1998-02-11','22435678','021 777888','van@gmail.com',0,0,7,2,12,763,7,2,'2018-19_00012.jpg',8,1,1,'2018-02-01 05:09:18','ບ. ຂວາ',0,NULL,'0'),(13,'00013',1,'ສາຍ​ທາ​ລາ','ນ້ອຍ​ແຕ່​ໃຈ','1996-06-13','55833245',NULL,NULL,0,0,5,10,78,4764,6,10,'2018-19_00013.jpg',8,1,1,'2018-02-01 05:09:38','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ນາ​ຫວ້ານ',0,NULL,'1'),(14,'00014',1,'ແກະດຳ','ຫຼາກສີ','1989-08-07','020 55998987',NULL,NULL,0,0,12,15,126,8274,1,15,'2018-19_00014.jpg',8,1,2,'2018-02-01 05:09:39','ມສ ປະເລ',0,'2','1'),(15,'00015',2,'​ເກາະ​ເຢັງ','​ຢາງ','2000-07-02','99658321',NULL,NULL,0,0,2,10,73,4552,6,10,'2018-19_00015.jpg',8,1,1,'2018-02-01 05:12:11','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ຊົນ​ເຜົ່າ​ຫຼັກ 52',0,NULL,'1'),(17,'00017',2,'ກາບແກ້ວ','ມະນີວອນ','2000-07-23','020 99998874',NULL,NULL,0,0,6,2,10,982,4,2,'2018-19_00017.jpg',8,1,2,'2018-02-01 06:33:38','ມສ ຂຸນສຸກນ້ອຍ',0,NULL,'0'),(18,'00018',1,'ໂຈ','ນັດ','2000-02-01','33333330','2222221','Jo@gamail.com',0,0,1,16,129,7440,6,16,'2018-19_00018.jpg',8,1,1,'2018-02-01 06:36:09','ໂພນໄຊ',0,NULL,'1'),(19,'00019',1,'ທະນະພອນ','ລັດສະໄໝ','1996-07-01','020 22332256',NULL,NULL,0,0,16,16,129,7450,4,16,'2018-19_00019.jpg',8,1,2,'2018-02-01 06:38:48','ມສ ກົກເດືອ',0,NULL,'0'),(20,'00020',1,'ຍາວເຢີ','ຍາວຍາວ','2000-11-02','020 56669888',NULL,NULL,0,0,7,3,18,1244,5,2,'2018-19_00020.jpg',8,1,2,'2018-02-01 06:49:32','ມສ ຫ້ອຍຫອຍ',0,NULL,'1'),(21,'00021',2,'ເຜີ້ງ','ນ້ອຍ','1999-02-02','55555555','02177777','perng@gmail.com',0,0,1,6,35,2223,6,10,'2018-19_00021.jpg',8,1,1,'2018-02-01 07:07:51','ພູນ້ອຍ',0,NULL,'0'),(22,'00022',1,'ສຸກສັນ','ລາວວຽງ','2000-02-05','020 55448787',NULL,NULL,0,0,16,9,65,4005,5,9,'2018-19_00022.jpg',8,1,2,'2018-02-01 07:08:19','ມສ ໂພນສະຫວັນໄຕ້',0,NULL,'1'),(23,'00023',2,'ສຸກ','ວິໄລ','1998-02-12','4444444','02188888','Souk@gmail.com',0,0,1,3,17,1324,7,3,'2018-19_00023.jpg',8,1,1,'2018-02-01 09:04:24','ພູນ້ອຍ',0,NULL,'0'),(24,'00024',2,'ນົກນ້ອຍ','ມະໄລພອນ','1994-11-14','020 22665588',NULL,NULL,0,0,8,6,35,8638,4,6,'2018-19_00024.jpg',8,1,2,'2018-02-01 07:35:00','ມສ ກົ້ວຕະລຸນ',0,'1','1'),(26,'00026',1,'ປອຍຟ້າຍ','ອຸໄລພອນ','2000-07-05','020 55564748',NULL,NULL,0,0,17,13,109,6417,6,13,'2018-19_00026.jpg',8,1,2,'2018-02-01 07:40:09','ມສ ນາຫວ້າ',0,NULL,'1'),(27,'00027',3,'ເທບພອນ','ພົງສະຫວັນ','2001-12-22','020 54478774',NULL,NULL,0,0,15,12,93,5369,6,12,'2018-19_00027.jpg',8,1,2,'2018-02-01 07:42:08','ມສ ກຸງສີ',0,'3','0'),(28,'00028',2,'ສີສຸກ','ພອນໄຊ','2001-11-11','020 55669996',NULL,NULL,0,0,10,16,130,7491,5,16,'2018-19_00028.jpg',8,1,2,'2018-02-01 08:21:49','ມສ ຫ້ວຍຢາງ',0,NULL,'0'),(29,'00029',2,'ສອນ​ສະ​ຫວັນ','ວັນ​ນະ​ສີ','1995-10-07','58947232',NULL,NULL,0,0,4,1,6,263,6,1,'2018-19_00029.jpg',8,1,1,'2018-02-01 08:28:57','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍ​ສາ​ທິດ',0,NULL,'0'),(30,'00030',2,'ແກ້ວ​ຕາ','ຂາ​ເລາະ','2000-02-15','57814235',NULL,NULL,0,0,4,1,3,91,7,1,'2018-19_00030.jpg',8,1,1,'2018-02-01 08:34:26','ມັດ​ທະ​ຍົມ​ຕອນ​ປາຍນາ​ໄຊ​',0,NULL,'0');
/*!40000 ALTER TABLE `sis_application_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_application_form_init_view`
--

DROP TABLE IF EXISTS `sis_application_form_init_view`;
/*!50001 DROP VIEW IF EXISTS `sis_application_form_init_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_application_form_init_view` AS SELECT 
 1 AS `id`,
 1 AS `entrance_id`,
 1 AS `applicant_code`,
 1 AS `title_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birth_date`,
 1 AS `mobile_no`,
 1 AS `telphone_no`,
 1 AS `email`,
 1 AS `sms_notification`,
 1 AS `email_notification`,
 1 AS `ethnic_id`,
 1 AS `province_id`,
 1 AS `district_id`,
 1 AS `village_id`,
 1 AS `graduated_year_id`,
 1 AS `province_graduated`,
 1 AS `picture_file`,
 1 AS `applicant_status_id`,
 1 AS `entry_method_id`,
 1 AS `created`,
 1 AS `graduated_school`,
 1 AS `gender`,
 1 AS `entrance_name`,
 1 AS `academic_year`,
 1 AS `start_exam_date`,
 1 AS `end_exam_date`,
 1 AS `open_status`,
 1 AS `application_deadline`,
 1 AS `active`,
 1 AS `title_description`,
 1 AS `ethnic_name`,
 1 AS `province_name`,
 1 AS `district_name`,
 1 AS `village_name`,
 1 AS `graduated_year`,
 1 AS `province_graduated_name`,
 1 AS `application_status`,
 1 AS `entry_method`,
 1 AS `curriculum_id1`,
 1 AS `curriculum_id2`,
 1 AS `exam_site_id`,
 1 AS `exam_building_id`,
 1 AS `exam_room_id`,
 1 AS `exam_result_id`,
 1 AS `is_notified`,
 1 AS `notified_date`,
 1 AS `result_status`,
 1 AS `rank`,
 1 AS `curriculum_id_final`,
 1 AS `curriculum_name_final`,
 1 AS `faculty_name_final`,
 1 AS `faculty_id_final`,
 1 AS `department_id_final`,
 1 AS `department_name_final`,
 1 AS `exam_seat_id`,
 1 AS `seat_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sis_application_form_view`
--

DROP TABLE IF EXISTS `sis_application_form_view`;
/*!50001 DROP VIEW IF EXISTS `sis_application_form_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_application_form_view` AS SELECT 
 1 AS `id`,
 1 AS `entrance_id`,
 1 AS `applicant_code`,
 1 AS `title_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `birth_date`,
 1 AS `mobile_no`,
 1 AS `telphone_no`,
 1 AS `email`,
 1 AS `sms_notification`,
 1 AS `email_notification`,
 1 AS `ethnic_id`,
 1 AS `province_id`,
 1 AS `district_id`,
 1 AS `village_id`,
 1 AS `graduated_year_id`,
 1 AS `province_graduated`,
 1 AS `picture_file`,
 1 AS `applicant_status_id`,
 1 AS `entry_method_id`,
 1 AS `created`,
 1 AS `graduated_school`,
 1 AS `gender`,
 1 AS `entrance_name`,
 1 AS `academic_year`,
 1 AS `start_exam_date`,
 1 AS `end_exam_date`,
 1 AS `open_status`,
 1 AS `application_deadline`,
 1 AS `active`,
 1 AS `title_description`,
 1 AS `ethnic_name`,
 1 AS `province_name`,
 1 AS `district_name`,
 1 AS `village_name`,
 1 AS `graduated_year`,
 1 AS `province_graduated_name`,
 1 AS `application_status`,
 1 AS `entry_method`,
 1 AS `curriculum_id1`,
 1 AS `curriculum_id2`,
 1 AS `exam_site_id`,
 1 AS `exam_building_id`,
 1 AS `exam_room_id`,
 1 AS `exam_result_id`,
 1 AS `is_notified`,
 1 AS `notified_date`,
 1 AS `result_status`,
 1 AS `rank`,
 1 AS `curriculum_id_final`,
 1 AS `curriculum_name_final`,
 1 AS `faculty_name_final`,
 1 AS `faculty_id_final`,
 1 AS `department_id_final`,
 1 AS `department_name_final`,
 1 AS `exam_seat_id`,
 1 AS `seat_no`,
 1 AS `curriculum_name1`,
 1 AS `faculty_name1`,
 1 AS `faculty_id1`,
 1 AS `department_name1`,
 1 AS `department_id1`,
 1 AS `curriculum_name2`,
 1 AS `faculty_name2`,
 1 AS `faculty_id2`,
 1 AS `department_name2`,
 1 AS `department_id2`,
 1 AS `site_name`,
 1 AS `building_name`,
 1 AS `room_name`,
 1 AS `degree`,
 1 AS `curriculum_group_id1`,
 1 AS `curriculum_group_name1`,
 1 AS `curriculum_group_id2`,
 1 AS `curriculum_group_name2`,
 1 AS `degree_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_application_status`
--

DROP TABLE IF EXISTS `sis_application_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_application_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_status` varchar(60) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `application_status_UNIQUE` (`application_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_application_status`
--

LOCK TABLES `sis_application_status` WRITE;
/*!40000 ALTER TABLE `sis_application_status` DISABLE KEYS */;
INSERT INTO `sis_application_status` (`id`, `application_status`, `active`, `set_order`) VALUES (1,'Approved',1,01),(2,'Waiting',1,02),(3,'Cancel',1,03);
/*!40000 ALTER TABLE `sis_application_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_attendance`
--

DROP TABLE IF EXISTS `sis_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lectured_date` datetime NOT NULL,
  `course_section_id` int(11) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `recorded_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_attendance_sis_course_section1_idx` (`course_section_id`),
  CONSTRAINT `fk_sis_attendance_sis_course_section1` FOREIGN KEY (`course_section_id`) REFERENCES `sis_course_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_attendance`
--

LOCK TABLES `sis_attendance` WRITE;
/*!40000 ALTER TABLE `sis_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_attendance_report`
--

DROP TABLE IF EXISTS `sis_attendance_report`;
/*!50001 DROP VIEW IF EXISTS `sis_attendance_report`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_attendance_report` AS SELECT 
 1 AS `enrolment_no`,
 1 AS `student_code`,
 1 AS `title`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `present`,
 1 AS `absent`,
 1 AS `late`,
 1 AS `reason`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_building`
--

DROP TABLE IF EXISTS `sis_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_name` varchar(200) NOT NULL,
  `builind_code` varchar(45) NOT NULL,
  `campus_id` int(11) NOT NULL,
  `shared` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'shared building for many faculties',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `builind_code_UNIQUE` (`builind_code`),
  KEY `fk_building_campus1_idx` (`campus_id`),
  CONSTRAINT `fk_building_campus1` FOREIGN KEY (`campus_id`) REFERENCES `sis_campus` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_building`
--

LOCK TABLES `sis_building` WRITE;
/*!40000 ALTER TABLE `sis_building` DISABLE KEYS */;
INSERT INTO `sis_building` (`id`, `building_name`, `builind_code`, `campus_id`, `shared`, `active`, `set_order`) VALUES (1,'C','C',1,0,1,03),(2,'E','05',5,1,1,01),(3,'Q','02',5,0,1,02),(4,'N','03',5,0,1,03),(5,'R','04',5,1,1,04),(6,'EN','01',2,0,1,01),(8,'PO','101',1,0,1,01),(9,'PL','102',1,0,1,01),(12,'TR','2',2,0,1,06),(20,'X','3',7,0,1,01),(22,'M','4',7,0,1,09);
/*!40000 ALTER TABLE `sis_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_campus`
--

DROP TABLE IF EXISTS `sis_campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_campus`
--

LOCK TABLES `sis_campus` WRITE;
/*!40000 ALTER TABLE `sis_campus` DISABLE KEYS */;
INSERT INTO `sis_campus` (`id`, `campus_name`, `active`, `set_order`) VALUES (1,'ວິ​ທະ​ຍາ​ເຂດດອນ​ນົກ​ຂຸ້ມ',1,09),(2,'ວິ​ທະ​ຍາ​ເຂດໂສກ​ປ່າ​ຫຼ​ວງ',1,01),(3,'ວິ​ທະ​ຍາ​ເຂດຕາດ​ທອງ',1,02),(4,'ວິ​ທະ​ຍາ​ເຂດນາ​ບົງ',1,03),(5,'ຄະ​ນະ​ວິ​ທະ​ຍາ​ສາດ​ທຳ​ມະ​ຊາດ',1,01),(7,'ວິ​ທະ​ຍາ​ເຂດດົງ​ໂດກ',1,01);
/*!40000 ALTER TABLE `sis_campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_certificate_degree`
--

DROP TABLE IF EXISTS `sis_certificate_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_certificate_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_name` varchar(60) NOT NULL,
  `degree_eng_name` varchar(60) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_certificate_degree`
--

LOCK TABLES `sis_certificate_degree` WRITE;
/*!40000 ALTER TABLE `sis_certificate_degree` DISABLE KEYS */;
INSERT INTO `sis_certificate_degree` (`id`, `degree_name`, `degree_eng_name`, `active`, `set_order`) VALUES (1,'ຊັ້ນສູງ','Higher Diploma',1,01),(2,'ປະລິນຍາຕີຣ','Bachelor',1,02),(3,'ປະລິນຍາໂທ','Master',1,03);
/*!40000 ALTER TABLE `sis_certificate_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_cof_view`
--

DROP TABLE IF EXISTS `sis_cof_view`;
/*!50001 DROP VIEW IF EXISTS `sis_cof_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_cof_view` AS SELECT 
 1 AS `id`,
 1 AS `course_id`,
 1 AS `academic_year_id`,
 1 AS `semester_id`,
 1 AS `total_section`,
 1 AS `exam_start`,
 1 AS `exam_finish`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `status`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `course_eng_name`,
 1 AS `credit`,
 1 AS `lecture_hour`,
 1 AS `lab_hour`,
 1 AS `description`,
 1 AS `faculty_id`,
 1 AS `faculty_abbr`,
 1 AS `faculty_name`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_course_code`,
 1 AS `department_name`,
 1 AS `department_eng_name`,
 1 AS `department_course_code`,
 1 AS `department_id`,
 1 AS `course_status_id`,
 1 AS `course_abbr_name`,
 1 AS `is_shared`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_course`
--

DROP TABLE IF EXISTS `sis_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` char(8) NOT NULL,
  `course_name` varchar(250) NOT NULL,
  `course_eng_name` varchar(250) NOT NULL,
  `credit` tinyint(1) unsigned NOT NULL COMMENT 'Total credits',
  `lecture_hour` tinyint(1) unsigned NOT NULL COMMENT 'Lecture hour per week',
  `lab_hour` tinyint(1) unsigned NOT NULL COMMENT 'Lab hour per week',
  `practice_hour` tinyint(1) unsigned NOT NULL COMMENT 'Tuition hour per week',
  `description` longtext,
  `faculty_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  `course_status_id` int(11) NOT NULL,
  `course_abbr_name` char(2) NOT NULL COMMENT 'Must use uppercase letters',
  `is_shared` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 not share, 1 share. Check with sis_curriculum_course if more than one record in the table mean shared course',
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_code_UNIQUE` (`course_code`),
  KEY `fk_course_faculty1_idx` (`faculty_id`),
  KEY `fk_course_department1_idx` (`department_id`),
  KEY `fk_sis_course_sis_course_status1_idx` (`course_status_id`),
  CONSTRAINT `fk_course_department1` FOREIGN KEY (`department_id`) REFERENCES `sis_department` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_course_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `sis_faculty` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_course_sis_course_status1` FOREIGN KEY (`course_status_id`) REFERENCES `sis_course_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course`
--

LOCK TABLES `sis_course` WRITE;
/*!40000 ALTER TABLE `sis_course` DISABLE KEYS */;
INSERT INTO `sis_course` (`id`, `course_code`, `course_name`, `course_eng_name`, `credit`, `lecture_hour`, `lab_hour`, `practice_hour`, `description`, `faculty_id`, `department_id`, `active`, `set_order`, `course_status_id`, `course_abbr_name`, `is_shared`) VALUES (1,'131EL111','ພາ​ສາ​ອັງ​ກິດ 1 ','English 1',2,0,2,3,NULL,5,5,1,01,3,'EL',0),(3,'S00LS101','ລາວ​ສຶກ​ສາ 1','Lao Studies 1',2,2,0,0,NULL,5,5,1,02,3,'LS',0),(4,'S00PO101','ການ​ເມືອງ','Political',2,2,0,0,NULL,5,6,1,01,3,'PO',0),(5,'5AIEL101','ພາສາອັງກິດທົ່ວໄປ 1','General English 1',2,2,0,0,NULL,4,2,1,01,3,'EL',0),(6,'5AIEL102','ພາສາອັງກິດທົ່ວໄປ 2','Genaral English 2',2,2,0,0,NULL,4,2,1,02,3,'EL',0),(7,'900LS101','ລາວສຶກສາ 1','Lao studies 1',2,0,0,0,NULL,4,2,1,03,3,'LS',0),(8,'900LS102','ລາວສຶກສາ 2','Lao studies 2',2,2,0,0,NULL,4,2,1,04,3,'LS',0),(9,'700PY101','ຈິດຕະວິທະຍາທົ່ວໄປ','General Psychology',2,2,0,0,NULL,4,2,1,05,3,'PY',0),(10,'5AIMT101','ຄະນິດສາດ','Mathematics',2,2,0,0,NULL,4,2,1,07,3,'MT',0),(11,'SA1EL101','ພາສາອັງກິດສຳລັບສະຖາປັດຕະຍະກຳ 1','eNGLISH lANGUEGE FOR ARCHITECTURE ',2,2,0,0,NULL,4,2,1,09,3,'EL',0),(12,'SB1BM111','ວັດສະດຸກໍ່ສ້າງ','BUILDING MATERIALS',2,2,0,2,NULL,4,2,1,10,3,'BM',0),(13,'5B1SM211','ກຳລັງວັດສະດຸ','STRENGHT OF MATERIALS',2,2,0,0,NULL,4,2,1,11,3,'SM',0),(14,'5B1CM211','ວິທີການກໍ່ສ້າງ','CONSTRUCTION METHOLOGY 1',2,2,0,0,NULL,4,2,1,12,3,'CM',0),(15,'5B1CM212','ວິທີການກໍ່ສ້າງ 2','CONSTRUCTION METHOLOGY 2',2,2,0,0,NULL,4,2,1,13,3,'CM',0),(16,'5A1AD211','ຮູບລາຍລະອຽດທາງດ້ານສະຖາປັດຕະຍະກຳ','ARCHITECTURE DETAIL',2,2,0,0,NULL,4,2,1,00,3,'AD',0),(17,'5A1HW321','ປະຫວັດສາດສະຖາປັດຕະຍະກຳຕາເວັນຕົກ','HISTORY OF WESTERN ARCHITECTURAL',2,2,0,0,NULL,4,2,1,14,3,'HW',0),(18,'5A1SR311','ສະຖິຕິສຳລັບການວິໃຈ','STATISTICS FOR RESEARCH',2,2,0,0,NULL,4,2,1,15,3,'SR',0),(19,'5U1LC321','ພູມີສະຖາປັດ','LANSCAP ARCHITECTURE',2,2,0,0,NULL,4,2,1,16,3,'LC',0),(20,'5A1CV321','ການອະນຸລັກເບື້ອງຕົ້ນ','INTRODUCTION TO CONSERVATION',2,1,3,0,NULL,4,2,1,16,3,'CV',0),(21,'SB1CE421','ປະມານລາຄາ','COST ESTIMATION',2,2,0,0,NULL,4,2,1,17,3,'CE',0),(22,'5A1LA421','ສະຖາປັດຕະຍະກຳລາວ','LAO ARCHITECTURAL',2,2,0,0,NULL,4,2,1,18,3,'LA',0),(23,'5A1AC421','ການອະນຸລັກສະຖາປັດຕະຍະກຳ','ARCHITECTURAL CONSERATION',2,2,0,0,NULL,4,2,1,19,3,'AC',0),(24,'5A1LV421','ສະຖາປັດຕະຍະກຳລາວທ້ອງຖິ່ນ','LAO CONSEVATION ARCHITECTURE',2,2,0,0,NULL,4,2,1,18,3,'LV',0),(25,'5B1PE521','ຫລັກເສດຖະສາດ','PRINCIPLES OF ECONOMICS',2,2,0,0,NULL,4,2,1,20,3,'PE',0),(26,'5B1RC321','ການອອກແບບຄອນກີດເສີມເຫຼັກ','REENFORCES CONCRETE DESIGN',3,3,0,0,NULL,4,2,1,21,3,'RC',0),(27,'5U1UP221','ການວາງຜັງເມືອງແລະແຜນເຂດເບື້ອງຕົ້ນ','INTRO OF URBAN REGIONAL PLANNING',2,2,0,0,NULL,4,2,1,22,3,'UP',0),(28,'5A1AD121','ໂຄງການອອກແບບສະຖາປັດຕະຍະກຳ 1','ARCHITECTURAL PROJECT DESIGN 1',4,2,6,0,NULL,4,2,1,23,3,'AD',0),(29,'5A1SD324','ການວາດໂຄງສ້າງ 4','SKETCH DESIGN 4',2,1,3,0,NULL,4,2,1,24,3,'SD',0),(30,'111CH111','ເຄ​ມີ​ສາດ','Chemistry',3,2,2,0,NULL,5,5,1,03,3,'CH',0),(31,'131EL122','ພາ​ສາ​ອັງ​ກິດ 2 ','English 2',2,0,2,3,NULL,5,5,1,04,4,'EL',0),(32,'111CO121','ຄອມ​ພິວ​ເຕີ','Computer',2,1,2,0,NULL,5,5,1,05,3,'CO',0),(33,'131EL233','ພາ​ສາ​ອັງ​ກິດ 3','English 3',2,0,2,3,NULL,5,5,1,06,3,'EL',0),(34,'111CM231','ພູມ​ອາ​ກາດ ​ແລະ ອຸ​ຕຸ​ນິ​ຍົມ​ວິ​ທະ​ຍາ','Climate and Hydromenteorology',2,2,0,0,NULL,5,5,1,07,3,'CM',0),(35,'131EL224','ພາ​ສາ​ອັງ​ກິດ 4','English 4',2,0,2,3,NULL,5,5,1,08,3,'EL',0),(36,'141SP221','ບັນ​ຫາ​ສັງ​ຄົມ','Social Problem',2,2,0,0,NULL,5,5,1,09,3,'SP',0),(37,'131EL321','ພາ​ສາ​ອັງ​ກິດ 5','English 5',2,0,2,3,NULL,5,5,1,10,3,'EL',0),(38,'141HR321','ມະ​ນຸດ​ສຳ​ພັນ','Human Relationship',2,2,0,0,NULL,5,5,1,11,3,'HR',0),(39,'141RM331','ວິ​ທີ​ວິ​ໄຈ','Research Methodology',3,2,0,3,NULL,5,5,1,12,3,'RM',0),(40,'141BH331','ອຸ​ທົກ​ວິ​ທະ​ຍາ','Hydrology',3,2,2,0,NULL,5,5,1,13,3,'BH',0),(41,'121WM331','ການ​ຄຸ້ມ​ຄອງ​ອ່າງ​ໂຕ່ງ','Watershed Management',3,2,2,0,NULL,5,5,1,14,4,'WM',0),(42,'141PW331','ການ​ຄຸ້ມ​ຄອງ​ລ​ະ​ບົບ​ນ້ຳ​ໃຊ້','Management Water Supply System',3,2,2,0,NULL,5,5,1,15,3,'PW',0),(43,'121DM421','ການກ​ຽມ​ພ້ອມ​ຮັບ​ມື​ກັບ​ໄພ​ພິ​ບັດ​ທຳ​ມະ​ຊາດ','ການກ​ຽມ​ພ້ອມ​ຮັບ​ມື​ກັບ​ໄພ​ພິ​ບັດ​ທຳ​ມະ​ຊາດ',2,2,0,0,NULL,5,5,1,15,3,'DM',0),(44,'111CE412','ສະ​ຖິ​ຕິ​ເພື່ອ​ການ​ວິ​ໄຈ','ສະ​ຖິ​ຕິ​ເພື່ອ​ການ​ວິ​ໄຈ',2,2,0,0,NULL,5,5,1,16,3,'CE',0),(45,'141PP431','ໂຄງ​ການ​ບົດ​ຈົບ​ຊັ້ນ','ໂຄງ​ການ​ບົດ​ຈົບ​ຊັ້ນ',6,0,0,30,NULL,5,5,1,17,3,'PP',0),(46,'5A1TS521','ວິທະຍານິພົນ','thesis',20,17,6,3,NULL,4,2,1,25,3,'TS',0),(47,'5U1UC431','ການອະນຸລັກຊຸມຊົນເມືອງ','URBAN CONSERVATION',2,1,3,0,NULL,4,2,1,26,3,'UC',0),(48,'5A1MS121','ວິຊາບັງຄັບ1','Require course1',2,2,0,0,NULL,4,2,1,00,3,'MS',0),(49,'5A1SM221','ວິຊາບັງຄັບ2','Require course2',2,2,0,0,NULL,4,2,1,27,3,'SM',0),(50,'5B2RC321','ການອອກແບບຄອນກີດເສີມເຫຼັກ','REENFORCES CONCRETE DESIGN',3,3,0,0,NULL,4,2,1,21,3,'RC',0),(51,'5B2RC322','ການອອກແບບຄອນກີດເສີມເຫຼັກ','REENFORCES CONCRETE DESIGN',3,3,0,0,NULL,4,2,1,21,3,'RC',0),(52,'121WM332','ການ​ຄຸ້ມ​ຄອງ​ອ່າງ​ໂຕ່ງ','Watershed Management',3,2,2,0,NULL,5,5,1,14,3,'WM',0),(53,'121WM333','ການ​ຄຸ້ມ​ຄອງ​ອ່າງ​ໂຕ່ງ','Watershed Management',3,2,2,0,NULL,5,5,1,14,2,'WM',0),(55,'131EL133','ພາ​ສາ​ອັງ​ກິດ 2','English 2',2,0,2,3,NULL,5,5,1,04,3,'EL',0),(56,'131EL101','ພາ​ສາ​ອັງ​ກິດ 1 ','English 1',2,0,2,3,NULL,5,6,1,01,3,'EL',0),(57,'F30PO101','ການ​ເມືອງ','Politice',2,2,0,0,NULL,5,6,1,02,3,'PO',0),(58,'131PP111','ເສດ​ຖະ​ສາດ​ການ​ເມືອງ​ແລະ​ການ​ວາງ​ແຜນ','Political Economic and Planning',3,2,0,3,NULL,5,6,1,03,3,'PP',0),(59,'131EL112','ພາ​ສາ​ອັງ​ກິດ 2','English 2',2,2,0,0,NULL,5,6,1,04,3,'EL',0),(60,'131EL213','ພາ​ສາ​ອັງ​ກິດ 3','English 3',2,0,2,3,NULL,5,6,1,06,3,'EL',0),(61,'EOOPB345','ການ​ຮຽນ​ອີງ​ໃສ່​ບັນ​ຫາ','Problem Baselearning',2,1,0,3,NULL,5,6,1,07,3,'PB',0),(62,'131EL214','ພາ​ສາ​ອັງ​ກິດ 4','English 4',2,0,4,0,NULL,5,6,1,07,3,'EL',0),(63,'S10CM324','ອຸ​ຕຸ​ນິ​ຍົມ​ແລະ​ອຸ​ທົກ​ກະ​ສາດ','Meteodrology and Hydrology',3,2,0,3,NULL,5,6,1,08,3,'CM',0),(64,'131EL315','ພາ​ສາ​ອັງ​ກິດ 5(ກາ​ນ​ພັດ​ທະ​ນາ)','English 5',2,0,2,3,NULL,5,6,1,09,3,'EL',0),(65,'S10GS436','GIS&RS','GIS&RS',3,1,2,3,NULL,5,6,1,10,3,'GS',0),(66,'950CR111','ພຶ້ນຖານກົດໝາຍອາຍາ','1Criminal Law',4,3,2,0,NULL,1,15,1,01,3,'CR',0),(67,'131AM321','ການ​ບໍ​ລິ​ຫານ​ແລະ​ຄຸ້ມ​ຄອງ​ໂຄງ​ການ','Administration and Management Project',3,2,2,0,NULL,5,6,1,11,3,'AM',0),(68,'131EL316','ພາ​ສາ​ອັງ​ກິດ 6(ການ​ພັດ​ທະ​ນາ)','English 6',2,0,4,0,NULL,5,6,1,12,3,'EL',0),(69,'5B1PY101','ຈິດຕະວິທະຍາທົ່ວໄປ','General Psychology',2,2,0,0,NULL,4,3,1,28,3,'PY',0),(70,'131FA411','ຄວາມ​ສຳ​ພັນ​ລະ​ຫວ່າງ​ປະ​ເທດ','International Relation',2,2,0,0,NULL,5,6,1,13,3,'FA',0),(71,'920SL111','ທີດສະດີລັດ ແລະ ກົດໝາຍ','State of Low',2,1,2,0,NULL,1,15,1,02,3,'SL',0),(72,'131PD411','ປະ​ຊາ​ກອນ​ແລະ​ການ​ພັດ​ທະ​ນາ','ປະ​ຊາ​ກອນ​ແລະ​ການ​ພັດ​ທະ​ນາ',3,2,0,3,NULL,5,6,1,14,3,'PD',0),(73,'SOOLS101','ລາວສຶກສາ 1','Lao studies 1',2,2,0,0,NULL,4,3,1,30,3,'LS',0),(74,'131FP421','ຝຶກ​ງານ','ຝຶກ​ງານ',3,0,0,9,NULL,5,6,1,16,3,'FP',1),(75,'5B1PH101','ຟີຊິກສາດ','Physics',2,2,0,0,NULL,4,3,1,31,3,'PH',0),(76,'900JO101','ການຈັດຕັ້ງອັງການຍຸຕິທຳ','Justice Organistation',2,2,0,0,NULL,1,15,1,03,3,'JO',0),(77,'131TH421','ຂຽນ​ບົດ','ຂຽນ​ບົດ',6,0,6,9,NULL,5,6,1,17,3,'TH',0),(78,'900PL101','ນິຕິປັດຊະຍາ','Philosophy of Low',2,2,0,0,NULL,1,15,1,04,3,'PL',0),(79,'821MA111','ຄະນິດສາດ 1','Mathematics 1',3,2,2,0,NULL,7,8,1,01,3,'MA',0),(80,'5B1BM111','ວັດສະດຸກໍ່ສ້າງ ແລະ ການທົດລອງ','Construction material and Lab',2,2,0,0,NULL,4,3,1,32,3,'BM',0),(81,'901FL221','ກົດໝາຍຄອບຄົວ','Family Law',2,1,2,0,NULL,1,15,1,05,3,'FL',0),(82,'920EL223','ກົດໝາຍປົກປັກຮັກສາສີ່ງແວດລ້ອມ','Environmental Law',2,1,2,0,NULL,1,15,1,06,3,'EL',0),(83,'821ST111','ສະຖິຕິ 1','Statistics 1',3,2,2,0,NULL,7,8,1,02,3,'ST',0),(84,'5A1AD111','ການແຕ້ມແບບສະຖາປັດຕະຍະກຳ 1','Architectural Drawing 1',2,1,3,0,NULL,4,3,1,33,3,'AD',0),(85,'910Fl224','ກົດໝາຍແຮງງານ','Labor Law',2,1,2,0,NULL,1,15,1,07,3,'FL',0),(86,'5B1TC121','ວິທີການກໍ່ສ້າງ 1','CONSTRUCTION METHOLOGY 1',2,2,0,0,NULL,4,3,1,34,3,'TC',0),(87,'800EL102','ພາສາອັງກິດ 2','English 2',2,2,0,0,NULL,7,8,1,03,3,'EL',1),(88,'920BP234','ຄວາມຮູ້ພື້ນຖານລັດຖະສາດ','Basic Political science',2,2,0,0,NULL,1,15,1,08,3,'BP',0),(89,'5B1TC222','ວິທີການກໍ່ສ້າງ 2','CONSTRUCTION METHOLOGY 2',2,2,0,0,NULL,4,3,1,35,3,'TC',0),(90,'920AM335','ຈັນຍາບັນຂອງນັກປົກຄອງ','Moral Administration',2,2,0,0,NULL,1,15,1,09,3,'AM',0),(91,'821OM111','ການບໍລິຫານຫ້ອງການ','Office Management',2,2,0,0,NULL,7,8,1,04,3,'OM',0),(92,'920IA335','ຄວາມຮູ້ພື້ນຖານການບໍລິຫານລັດ','Interoduction to Public Administration',2,2,0,0,NULL,1,15,1,10,3,'IA',0),(93,'5A1AD212','ໂຄງການອອກແບບສະຖາປັດຕະຍະກຳ 2','Architectural Drawing 2',2,1,3,0,NULL,4,3,1,36,3,'AD',0),(94,'5A1HB211','ປະຫວັດສາດອາຄານ','History of building',2,2,0,0,NULL,4,3,1,37,3,'HB',0),(95,'821QA211','ເຕັກນິກປະລິມານ','Quantitative Analysis',3,2,2,0,NULL,7,8,1,05,3,'QA',0),(96,'810MI210','ເສດຖະສາດຈຸລະພາກ','Micro Economics',2,2,0,0,NULL,7,8,1,06,3,'MI',0),(97,'920AL336','ກົດໝາຍປົກຄອງພາກສະເພາະ','Administrative Law',4,3,2,0,NULL,1,15,1,11,3,'AL',0),(98,'821PO221','ການບໍລິຫານການຜະລິດ ແລະ ການດຳເນີນງານ','Production and Operation Management',3,2,2,0,NULL,7,8,1,07,3,'PO',0),(99,'5B1SV111','ການວັດແທກ1','Servey1',2,1,3,0,NULL,4,3,1,38,3,'SV',0),(100,'810MA210','ເສດຖະສາດມະຫາພາກ','Macro Economics',2,2,0,0,NULL,7,8,1,08,3,'MA',0),(101,'5B1AS211','ລະບົບໂຄງສ້າງສະຖາປັດຕະຍະກຳ','Architectural Structure Systems',2,2,0,0,NULL,4,3,1,39,3,'AS',0),(102,'400EL102','ພາ​ສາ​ອັງ​ກິດ 1','English 1',2,1,2,0,'English 1',8,14,1,01,3,'EL',1),(103,'400PE101','ກາຍ​ຍະ​ສຶກ​ສາ','ກາຍ​ຍະ​ສຶກ​ສາ',1,1,1,0,'ກາຍ​ຍະ​ສຶກ​ສາ',8,14,1,01,3,'PE',1),(104,'411SO114','ສັງ​ຄົມ​ວິ​ທະ​ຍາ','Social Science',2,2,0,0,'Social Science',8,14,1,01,3,'SO',1),(105,'400EL112','ພາ​ສາ​ອັງ​ກິດ 2','English 2',2,1,2,0,'English 2',8,14,1,01,3,'EL',1),(106,'400EL202','ພາ​ສາ​ອັງ​ກິດ 3','English 3',1,1,1,0,'English 3',8,14,1,01,3,'EL',1),(107,'431MT211','ອຸ​ຕຸ​ນິ​ຍົມ​ວິ​ທະ​ຍາ','Meteorology',2,1,2,0,'Meteorology',8,14,1,01,3,'MT',1),(108,'431PW313','ວິ​ທີ​ຂຽນ​ບົດ​ໂຄງ​ການ​ຈົບ​ຊັ້ນ','ວິ​ທີ​ຂຽນ​ບົດ​ໂຄງ​ການ​ຈົບ​ຊັ້ນ',2,1,2,0,'ວິ​ທີ​ຂຽນ​ບົດ​ໂຄງ​ການ​ຈົບ​ຊັ້ນ',8,14,1,01,3,'PW',1),(109,'411PP213','ວາງ​ແຜນ​ແລະ​ການ​ຄຸ້ມ​ຄອງ​ໂຄງ​ການ','ວາງ​ແຜນ​ແລະ​ການ​ຄຸ້ມ​ຄອງ​ໂຄງ​ການ',2,1,2,0,'ວາງ​ແຜນ​ແລະ​ການ​ຄຸ້ມ​ຄອງ​ໂຄງ​ການ',8,14,1,01,3,'PP',1),(110,'411IM322','ກົນ​ຈັກ​ອຸດ​ສາ​ຫະ​ກຳ','ກົນ​ຈັກ​ອຸດ​ສາ​ຫະ​ກຳ',3,2,2,0,'ກົນ​ຈັກ​ອຸດ​ສາ​ຫະ​ກຳ',8,14,1,01,3,'IM',0),(111,'411FH325','ການ​​ຂຸດ​ຄົ້ນ​ໄມ້','ການ​​ຂຸດ​ຄົ້ນ​ໄມ້',2,2,0,0,'ການ​​ຂຸດ​ຄົ້ນ​ໄມ້',8,14,1,01,3,'FH',0),(112,'411WC321','ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ຜະ​ລິດ​ໄມ້​ປະ​ກອບ','ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ຜະ​ລິດ​ໄມ້​ປະ​ກອບ',2,2,0,0,'ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ຜະ​ລິດ​ໄມ້​ປະ​ກອບ',8,14,1,01,3,'WC',0),(113,'411WD322','ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ອົບ​ໄມ້​ແປ​ຮູບ','ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ອົບ​ໄມ້​ແປ​ຮູບ',3,2,2,0,'ເຕັກ​ໂນ​ໂລ​ຊີ​ການ​ອົບ​ໄມ້​ແປ​ຮູບ',8,14,1,01,3,'WD',0),(114,'411FM423','ການ​ຕະ​ຫຼາດ​ຜະ​ລິດ​ຕະ​ພັນ​ປ່າ​ໄມ້','ການ​ຕະ​ຫຼາດ​ຜະ​ລິດ​ຕະ​ພັນ​ປ່າ​ໄມ້',3,2,2,0,'ການ​ຕະ​ຫຼາດ​ຜະ​ລິດ​ຕະ​ພັນ​ປ່າ​ໄມ້',8,14,1,01,3,'FM',0),(115,'411FB423','ຄຸ້ມ​ຄອງ​ທຸ​ລະ​ກິດ​ປ່າ​ໄມ້','ຄຸ້ມ​ຄອງ​ທຸ​ລະ​ກິດ​ປ່າ​ໄມ້',3,2,2,0,'ຄຸ້ມ​ຄອງ​ທຸ​ລະ​ກິດ​ປ່າ​ໄມ້',8,14,1,01,3,'FB',0),(116,'441EP422','ການ​ວາງ​ແຜນ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ','ການ​ວາງ​ແຜນ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ',3,2,2,0,'ການ​ວາງ​ແຜນ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ',8,14,1,01,3,'EP',0),(117,'441ET421','ການ​ຈັດ​ການ​ການ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ','ການ​ຈັດ​ການ​ການ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ',3,2,2,0,'ການ​ຈັດ​ການ​ການ​ທ່ອງ​ທ່ຽວ​ອະ​ນຸ​ລັກ',8,14,1,01,3,'ET',0),(118,'821HR321','ການບໍລິການຊັບພະຍາກອນມະນຸດ','Human Resources Management',3,2,2,0,NULL,7,8,1,09,3,'HR',0),(119,'920HA336','ການບໍລິຫານລຸກຄະລາກອນ','Administration Humane Resource',4,3,2,0,NULL,1,15,1,12,3,'HA',0),(120,'920BL437','ການເງິນແຫ່ງລັດ','State Buget Law',4,3,2,0,NULL,1,15,1,13,3,'BL',0),(121,'821BC321','ການບໍລິຫານການສື່ສານທາງທຸລະກິດ','Business Communication Management',2,2,0,0,NULL,7,8,1,10,3,'BC',0),(122,'5B1CE321','ເສດຖະສາດການກໍ່ສ້າງ','Construction Economics',2,2,0,0,NULL,4,3,1,40,3,'CE',0),(123,'920LS437','ພາວະຜູ້ນຳ','Leadership',2,2,0,0,NULL,1,15,1,14,3,'LS',0),(124,'5D1HL321','ຊົນລະສາດ','Hydraulics',2,2,0,0,NULL,4,3,1,41,3,'HL',0),(125,'920TE438','ຂຽນ ແລະ ປ້ອງກັນບົດວິທະຍານິພັນ ຫຼື ສອບປະມວນ','Thesis Writing and presentation or Final Examination',4,0,4,0,NULL,1,15,1,15,3,'TE',0),(126,'821RM321','ວິທີການຄົ້ນຄວ້າວິໄຈ','Research Methodology',3,2,2,0,NULL,7,8,1,11,3,'RM',0),(127,'920IS438','ຝຶກງານ','Intership',6,0,12,0,NULL,1,15,1,16,3,'IS',0),(128,'822CB321','ພຶດຕິກຳຜູ້ບໍລິໂພກ','Consumer Behavior',2,2,0,0,NULL,7,8,1,12,3,'CB',0),(129,'821PJ421','ການບໍລິຫານໂຄງການ','Project Management',3,2,2,0,NULL,7,8,1,13,3,'PJ',0),(130,'5A1CE321','ການປະມານລາຄາ1','Cost Estimate1',2,1,2,0,NULL,4,3,1,42,3,'CE',0),(131,'821EN421','ການປະກອບກິດຈະການໃໝ່','New Venture Creation and Entrepreneurship',3,2,2,0,NULL,7,8,1,14,3,'EN',0),(132,'821SE421','ສຳມະນາ','Semina',2,0,2,2,NULL,7,8,1,15,3,'SE',0),(133,'821FP421','ຂຽນ ແລະ ປ້ອງກັນບົດໂຄງການຈົບຊັ້ນ','Graduation Project',6,0,4,20,NULL,7,8,1,16,3,'FP',0),(134,'5B1BM231','ການຄວບຄຸມພະລັງງານໃນອາຄານ','Building Energy Control',2,2,0,0,NULL,4,3,1,43,3,'BM',0),(135,'5A1PP331','ວິທີການນຳສະເໜີໂຄງການ','Project Presentation',2,2,0,0,NULL,4,3,1,44,3,'PP',0),(136,'5B1CM321','ກົນຈັກໃນການກໍ່ສ້າງ','Construction Machine',2,2,0,0,NULL,4,3,1,45,3,'CM',0),(137,'5B1CE322','ການປະມານລາຄາ2','Cost Estimate2',2,1,2,0,NULL,4,3,1,46,3,'CE',0),(138,'421FP322','ພະ​ຍາດ-ບົ້ງ​ແມງ','ພະ​ຍາດ-ບົ້ງ​ແມງ',3,2,2,0,'ພະ​ຍາດ-ບົ້ງ​ແມງ',8,11,1,01,3,'FP',0),(139,'421SC321','ວິ​ທະ​ຍາ​ວັດ​ແທກ​ປ່າ​ໄມ້','ວິ​ທະ​ຍາ​ວັດ​ແທກ​ປ່າ​ໄມ້',3,2,2,0,'ວິ​ທະ​ຍາ​ວັດ​ແທກ​ປ່າ​ໄມ້',8,11,1,01,3,'SC',0),(140,'431SC322','ອະ​ນຸ​ລັກ​ດິນ','ອະ​ນຸ​ລັກ​ດິນ',2,1,2,0,'ອະ​ນຸ​ລັກ​ດິນ',8,11,1,01,3,'SC',0),(141,'431AF321','ກະ​ສິ​ກຳ-ປ່າ​ໄມ້','ກະ​ສິ​ກຳ-ປ່າ​ໄມ້',2,1,2,0,'ກະ​ສິ​ກຳ-ປ່າ​ໄມ້',8,11,1,01,3,'AF',0),(142,'412CF427','ປ່າ​ໄມ້​ສັງ​ຄົມ','ປ່າ​ໄມ້​ສັງ​ຄົມ',3,2,2,0,'ປ່າ​ໄມ້​ສັງ​ຄົມ',8,11,1,01,3,'CF',0),(143,'421NM423','ຈັດ​ສັນ​ຄຸ້ມ​ຄອງ​ເຄື່ອງ​ປ່າ​ຂອງ​ດົງ','ຈັດ​ສັນ​ຄຸ້ມ​ຄອງ​ເຄື່ອງ​ປ່າ​ຂອງ​ດົງ',3,2,2,0,'ຈັດ​ສັນ​ຄຸ້ມ​ຄອງ​ເຄື່ອງ​ປ່າ​ຂອງ​ດົງ',8,11,1,01,3,'NM',0),(144,'420PW407','ບົດ​ໂຄ​ງການ​ຈົບ​ຊັ້ນ​','ບົດ​ໂຄ​ງການ​ຈົບ​ຊັ້ນ​',6,0,6,0,'ບົດ​ໂຄງ​ການ​ຈົບ​ຊັ້ນ​',8,11,1,01,3,'PW',1),(182,'910CL111','ພື້ນຖານກົດໝາຍແພ່ງ 1','Civil Law1',4,3,2,0,NULL,1,16,1,01,3,'CL',0),(183,'910RL111','ພື້ນຖານກົດໝາຍໂຣມັນ','Roman Law',2,1,2,0,NULL,1,16,1,01,3,'RL',0),(184,'900HR101','ພຶ້ນຖານສິດທິມະນຸດ','Human Right',2,1,2,0,NULL,1,16,1,01,3,'HR',0),(186,'390IH221','ປະຫວັດສາດການພົວພັນສາກົນ','History of International Relations',4,3,2,0,NULL,1,16,1,01,3,'IH',0),(187,'930SI211','ສະຖາບັນຕົ້ນຕໍລັດ','Institutional Systems of Major Countries',2,1,2,0,NULL,1,16,1,01,3,'SI',0),(188,'900IO221','ອົງການຈັດຕັ້ງສາກົນ','International Organization',2,1,2,0,NULL,1,16,1,01,3,'IO',0),(189,'930IL221','ກົດໝາຍລະຫວ່າງຊາດພາກລັດ 1','Public International Law 1',4,3,2,0,NULL,1,16,1,01,3,'IL',0),(191,'390ER321','ການພົວພັນເສດຖະກິດສາກົນ','International Economic Relations',2,1,2,0,NULL,1,16,1,01,3,'ER',0),(192,'930IP321','ກົດໝາຍລະຫວ່າງຊາດສ່ວນບຸກຄົນ','Private International Law',4,3,2,0,NULL,1,16,1,01,3,'IP',0),(193,'930IC321','ການແກ້ໄຂຂໍ້ຂັດແຍ້ງສາກົນ','International Conflict Solution',2,1,2,0,NULL,1,16,1,01,3,'IC',0),(194,'900PO401','ແນວທາງນະໂຍບາຍ','Policy driection',2,2,0,0,NULL,1,16,1,01,3,'PO',0),(195,'920CG431','ການປົກຄອງສົມທຽງ','Comparative government',4,3,2,0,NULL,1,16,1,01,3,'CG',0),(196,'930IS420','ລົງຝຶກງານ 2 ເດືອນ','Tratning',6,0,0,24,NULL,1,16,1,01,3,'IS',0),(197,'930TE421','ບົດໂຄງການຈົບຊັ້ນ ຫຼື ສອບເສັງຈົບຊັ້ນ','Thesis or Exam',4,0,0,16,NULL,1,16,1,01,3,'TE',0),(198,'810HL101','ປະຫວັດສາດເສດຖະກິດລາວ','History Economy of Laos',2,2,0,0,NULL,7,7,1,01,3,'HL',0),(199,'930TR321','ທິດສະດີການພົວພັນສາກົນ','Theories of International Relation',2,1,2,0,NULL,1,16,1,17,3,'TR',0),(200,'810PE111','ຫຼັກເສດຖະສາດ','Principles of Economics',2,2,0,0,NULL,7,7,1,02,3,'PE',0),(201,'5U1TU411','ເຕັກນິກຜັງເມືອງ','Technical Urban',2,2,0,0,NULL,4,3,1,48,3,'TU',0),(202,'5B1FP421','ໂຄງການຈົບຊັ້ນ','Final Project',6,0,9,9,NULL,4,3,1,49,3,'FP',0),(203,'810MT112','ຄະນິດສາດ 2','Mathematics 2',3,2,2,0,NULL,7,7,1,03,3,'MT',0),(204,'800CP101','ຄອມພິວເຕີ','Computer',3,2,0,6,NULL,7,7,1,04,3,'CP',0),(205,'930IL322','ກົດໝາຍລະຫວ່າງຊາດພາກລັດ 2','Public International Law 2',4,3,2,0,NULL,1,16,1,18,3,'IL',0),(206,'810EC221','ພາສາອັງກິດສຳຫຼັບເສດຖະສາດ ແລະ ການຄ້າ 2','English for Economics and Commerce 2',2,2,0,0,NULL,7,7,1,05,3,'EC',0),(207,'910CL121','ພື້ນຖານກົດໝາຍແພ່ງ 1','Civil Law1',4,3,2,0,NULL,1,15,1,19,3,'CL',0),(208,'851CE211','ເສດຖະສາດປຽບທຽບ','Comparative Economics',3,3,0,0,NULL,7,7,1,06,3,'CE',0),(209,'910CL122','ພື້ນຖານກົດໝາຍແພ່ງ 2','Civil Law2',2,1,2,2,NULL,1,15,1,20,3,'CL',0),(210,'811MB221','ເສດຖະສາດເງິນຕາ ແລະ ການທະຫານ','Money and Banking Economics',3,3,0,0,NULL,7,7,1,07,3,'MB',0),(211,'811ME221','ເສດຖະສາດການບໍລິຫານ','Managerial Economics',3,2,2,0,NULL,7,7,1,08,3,'ME',0),(212,'811BU321','ເສດຖະສາງົບປະມານ','Budgetary Economics',3,3,0,0,NULL,7,7,1,09,3,'BU',0),(213,'812PA321','ການວາງແຜນ ແລະ ປະເມີນໂຄງການ','Project Planing and Appraisal',3,2,2,0,NULL,7,7,1,10,3,'PA',0),(214,'811SM321','ຕະຫຼາດຫຼັກຊັບ','Security Market',3,3,0,0,NULL,7,7,1,11,3,'SM',0),(215,'851IF321','ການເງິນລະຫວ່າງປະເທດ','International Finace',3,3,0,0,NULL,7,7,1,12,3,'IF',0),(216,'813RE421','ວິທີການວິໄຈ','Research Method',3,3,0,0,NULL,7,7,1,13,3,'AD',0),(217,'811PE421','ເສດຖະສາດສາທາລະນະ','Public Economics3',3,3,0,0,NULL,7,7,1,14,3,'PE',0),(218,'813SE421','ສຳມະນາ','Semina',2,0,0,6,NULL,7,7,1,15,3,'SE',0),(219,'813UP421','ຂຽນ ແລະ ປ້ອງກັນບົດໂຄງການຈົບຊັ້ນ','Graduation Porject',6,0,4,20,NULL,7,7,1,16,3,'UP',0),(220,'810MA212','ເສດຖະສາດມະຫາພາກ 2','Macro Economics 2',3,2,2,0,NULL,7,7,1,15,3,'MA',0),(221,'920CA435','ການບໍລິຫານໂຕເມືອງ','City Administration',2,2,0,0,NULL,1,15,1,21,3,'CA',0),(222,'811PF221','ເສດຖະສາດການເງິນພາກລັດ','Public Economics and Finace',3,3,0,0,NULL,7,7,1,16,3,'PF',0),(223,'431LP322','ວາງ​ແຜນ​ນຳ​ໃຊ້​ທີ່​ດິນ','Land of Planing',3,2,2,0,NULL,8,11,1,15,3,'LP',1),(224,'930AS423','ອົງການຈັດຕັ້ງອາຊຽນ','ASEAN',2,1,2,0,NULL,1,15,1,22,3,'AS',0),(225,'431WM421','ຈັດ​ສັນ​ແຫຼ່ງ​ນ້ຳ','Water Management',4,2,3,3,NULL,8,11,1,16,3,'WM',1),(226,'900LG101','ຕັກກະວິທະຍາ','Logic',2,2,0,0,NULL,1,15,1,23,3,'LG',0),(227,'811FI221','ທິດສະດີຕະຫຼາດການເງິນ ແລະ ສະຖາບັນການເງິນ','Financial Market Theory and Institution',3,3,0,0,NULL,7,7,1,17,3,'FI',0),(228,'851IE322','ເສດຖະສາດລະຫວ່າງປະເທດ 2','International Economics 2',3,2,2,0,NULL,7,7,1,18,3,'IE',0),(229,'810MT111','ຄະນິດສາດ 1','Mathematics 1',3,2,2,0,NULL,7,7,1,18,3,'MT',0),(230,'810MA111','ເສດຖະສາດມະຫາພາກ 1','Macro Economics 1',3,2,2,0,NULL,7,7,1,19,3,'MA',1),(231,'810MI212','ເສດຖະສາດຈຸລາພາກ 2','Micro Economics 2',3,2,2,0,NULL,7,7,1,19,3,'MI',0),(232,'851IE221','ເສດຖະສາດລະຫວ່າງປະເທດ 1','International Economics 1',3,2,2,0,NULL,7,7,1,20,3,'IE',0),(233,'920CG433','ການປົກຄອງສົມທຽບ','Comparative Goverment',4,3,2,0,NULL,1,16,1,24,3,'CG',0),(234,'900CO111','ກົດໝາຍລັດຖະທຳມະນູນ','Constitution Law',4,3,2,0,NULL,1,16,1,28,3,'CO',0),(235,'5B1SS421','ການອອກແບບລະບົບສຸຂາພິບານ','Sanitary System Design',3,2,3,0,NULL,4,3,1,50,3,'SS',0),(236,'311CH101','ເຄມີທົ່ວໄປ','Gneral Chemistry',3,2,0,2,NULL,2,13,1,51,3,'CH',0),(237,'900JO106','ການຈັດຕັ້ງອັງການຍຸຕິທຳ','Justice Organistation',2,1,2,0,NULL,1,16,1,26,3,'JO',0),(238,'311EL101','ພາສາອັງກິດ1','ພາສາອັງກິດ1',2,2,0,0,NULL,2,13,1,52,3,'EL',0),(239,'311MA101','ຄະນິດສາດ1','Mathematics1',3,2,2,0,NULL,2,13,1,53,3,'MA',0),(240,'311EL112','ພາສາອັງກິດ2','Genaral English 2',2,2,0,0,NULL,2,13,1,54,3,'EL',0),(241,'311MA112','ຄະນິດສາດ2','Mathematics2',3,2,2,0,NULL,2,13,1,54,3,'MA',0),(242,'311ED111','ແຕ້ມແບບວິສະວະກຳ','ແຕ້ມແບບວິສະວະກຳ',3,2,2,0,NULL,2,13,1,55,3,'ED',0),(243,'311CP111','ຄອມພິວເຕີ','Computer1',2,1,3,0,NULL,2,13,1,56,3,'CP',0),(244,'311EL213','ພາສາອັງກິດ3','Genaral English 3',2,2,0,0,NULL,2,13,1,56,3,'EL',0),(245,'800EL101','ພາສາອັງກິດ 1','English 1',2,2,0,0,NULL,7,8,1,17,3,'EL',0),(246,'311MA213','ຄະນິດສາດ3','Mathematics3',3,2,2,0,NULL,2,13,1,57,3,'MA',0),(247,'311EM211','ກົນລະສາດວິສະວະກກຳ','ກົນລະສາດວິສະວະກກຳ',3,3,0,0,NULL,2,13,1,58,3,'EM',0),(248,'821CC431','ການບໍລິຫານຂ້າມວັດທະນາທຳ','Cross Culture Management',2,2,0,0,NULL,7,8,1,18,3,'CC',0),(249,'311HD211','ຊົນລະສາດ','ຊົນລະສາດ',2,2,0,0,NULL,2,13,1,59,3,'HD',0),(250,'311MM221','ກົນລະສາດວັດສະດຸ1','ກົນລະສາດວັດສະດຸ1',3,3,0,0,NULL,2,13,1,60,3,'MM',0),(251,'311CM221','ວັດສະດຸກໍ່ສ້າງ','ວັດສະດຸກໍ່ສ້າງ',3,2,0,1,NULL,2,13,1,61,3,'CM',0),(252,'311SV211','ການສຳຫຼວດວັດແທກ1','ການສຳຫຼວດວັດແທກ1',3,2,3,0,NULL,2,13,1,62,3,'SV',0),(253,'311SM221','ກົນລະສາດດິນ','ກົນລະສາດດິນ',3,3,0,0,NULL,2,13,1,63,3,'SM',0),(254,'311RM421','ວິສະວະກຳຂົວ','ວິສະວະກຳຂົວ',3,3,0,0,NULL,2,13,1,64,3,'RM',0),(255,'311TS421','ອອກແບບໂຄງສ້າງໄມ້ ແລະ ໂຄງສ້າງຝາກໍ່','Wood structure Design',3,3,0,0,NULL,2,13,1,65,3,'TS',0),(256,'311MS421','ການກວດສອບ ແລະ ການບຳລຸງຮັກສາ','ການກວດສອບ ແລະ ການບຳລຸງຮັກສາ',2,2,0,2,NULL,2,13,1,66,3,'MS',0),(257,'311AR431','ເບຕົງເສີມເຫຼັກຂັ້ນສູງ','ເບຕົງເສີມເຫຼັກຂັ້ນສູງ',2,1,2,0,NULL,2,13,1,67,3,'AR',0),(258,'311FP421','ໂຄງການຈົບຊັ້ນ','ໂຄງການຈົບຊັ້ນ',4,4,0,0,NULL,2,13,1,68,3,'FP',0),(259,'311SV322','ການສຳຫຼວດວັດແທກ2','ການສຳຫຼວດວັດແທກ2',3,2,3,0,NULL,2,13,1,69,3,'SV',0),(260,'311PC431','ອອກແບບເບຕົງອັດແຮງ','ອອກແບບເບຕົງອັດແຮງ',2,1,2,0,NULL,2,13,1,71,3,'PC',0),(261,'841BA321','ບັນຊີການທະນາຄານ 1','Bank Account 1',3,2,2,0,NULL,7,7,1,20,3,'BA',0),(262,'311SS421','ການອອກແບບໂຄງສ້າງເຫຼັກ','ການອອກແບບໂຄງສ້າງເຫຼັກ',3,3,0,0,NULL,2,13,1,72,3,'SS',0),(263,'311BS421','ອອກແບບໂຄງສ້າງອາຄານ','ອອກແບບໂຄງສ້າງອາຄານ',3,2,1,0,NULL,2,13,1,73,3,'BS',0),(264,'381HP101','ຟີຊິກສາດ 1','Physics 1',3,2,2,0,NULL,2,12,1,01,3,'HP',0),(266,'382MA101','ຄະນິດສາດ1','Mathematics 1',2,2,0,0,NULL,2,12,1,01,3,'MA',0),(267,'382MA102','ຄະນິດສາດ2','Mathematics 2',2,2,0,0,NULL,2,12,1,01,3,'MA',0),(268,'382EE211','ພາສາອັງກິດສຳລັບວິສະວະກຳ','English for Engineering',2,0,4,0,NULL,2,12,1,01,3,'EE',0),(269,'382MA211','ຄະນິດສາດ3','Mathematics 3',3,2,0,2,NULL,2,12,1,01,3,'MA',0),(270,'382GA111','ບັນຊີທົ່ວໄປ','General Accounting',2,2,0,0,NULL,2,12,1,01,3,'GA',0),(271,'382MN111','ການຄຸ້ມຄອງວິສະວະກຳ','Management Engineering',2,2,0,0,NULL,2,12,1,01,3,'ME',0),(272,'380OP321','ອັອບເຈັກອໍເລັນເຕັດໂປແກຣມມີ່ງ','Object Oriented',3,3,0,0,NULL,2,12,1,01,3,'OP',0),(273,'382WA321','ການບໍລິຫານວິນໂດເຊີເວີ','Windows Server Managerment',3,3,0,0,NULL,2,12,1,01,3,'WA',0),(274,'382LA321','ການບໍລິຫານລີນຸກເຊີວີ','Linux Server Managerment',3,3,0,0,NULL,2,12,1,01,3,'LA',0),(275,'382JL431','ພາສາຢີ່ປຸ່ນເບື້ອງຕົ້ນ','Basic Japanese language',2,2,0,0,NULL,2,12,1,01,3,'JL',0),(276,'382CP111','ໂປຣແກຣມຄອມພີວເຕີ 1','Computer Programming 1',3,2,2,0,NULL,2,12,1,01,3,'CP',0),(277,'382PC111','ພຶ້ນຖານການສື່ສານ','Fundamental of Communication',3,3,0,0,NULL,2,12,1,01,3,'PC',0),(278,'382WB111','ເຕັກໂນໂລຊີເວັບ','Web Technology',3,2,2,0,NULL,2,12,1,01,3,'WT',0),(279,'382CP211','ໂປຣແກຣມຄອມພີວເຕີ 2','Computer Programming 2',3,2,2,0,NULL,2,12,1,01,3,'CP',0),(280,'382DL211','ການອອກແບບດີຈີຕອນ','Digital Logical',3,3,0,0,NULL,2,12,1,01,3,'DL',0),(281,'382CN221','ເຂືອຄ່າຍຄອມພີວເຕ','Computer Network',3,3,0,0,NULL,2,12,1,01,3,'CN',0),(282,'382SW211','ວິສະວະກຳຊັ້ອບແວ','Software Engineering',3,3,0,0,NULL,2,12,1,01,3,'SW',0),(283,'382SD321','ການວິເຄາະ ແລະ ອອກແບບລະບົບ','Systeem Analysis And Design',3,2,2,0,NULL,2,12,1,01,3,'SA',0),(284,'382JP311','ຈາວາໂປແກຣມມິ່ງ','Java Programming',3,3,0,0,NULL,2,12,1,01,3,'JP',0),(285,'382DB321','ລະບົບຖານຂໍ້ມູນ 1','Database 1',3,2,2,0,NULL,2,12,1,01,3,'DB',0),(286,'382IS321','ຄວາມປອດໄພທາງຂໍມູນ','Data security',3,3,0,0,NULL,2,12,1,01,3,'IS',0),(287,'382DB421','ລະບົບຖານຂໍ້ມູນ 2','Database 2',3,2,2,0,NULL,2,12,1,01,3,'DB',0),(288,'382WP420','ເວັບໂປຣແກຣມມີ່ງ','Web Programming',3,3,0,0,NULL,2,12,1,01,3,'WP',0),(289,'382PJ431','ຂຽນ ແລະ ປ້ອງກັນບົດວິທະຍານິພົນ','Thesis',3,0,6,0,NULL,2,12,1,01,3,'PJ',0),(290,'382IP431','ຝຶກງານ','Intership',2,0,240,0,NULL,2,12,1,01,3,'IP',0),(291,'382EP431','ພາສາອັງກິດສະເພາະດ້ານ','English specific',2,0,4,0,NULL,2,12,1,01,3,'EP',0),(292,'311CT321','ວິທະຍາການກໍ່ສ້າງ','ວິທະຍາການກໍ່ສ້າງ',3,3,0,0,NULL,2,13,1,74,3,'CT',0),(293,'311MM322','ກົນລະສາດວັດສະດຸ2','ກົນລະສາດວັດສະດຸ2',3,3,0,0,NULL,2,13,1,75,3,'MM',0),(294,'311SA321','ວິເຄາະໂຄງສ້າງ','ວິເຄາະໂຄງສ້າງ',3,3,0,0,NULL,2,13,1,76,3,'SA',0),(295,'311WS321','ວິສະວະກຳນ້ຳປະປາ','ວິສະວະກຳນ້ຳປະປາ',3,3,0,0,NULL,2,13,1,76,3,'WS',0);
/*!40000 ALTER TABLE `sis_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_course_category`
--

DROP TABLE IF EXISTS `sis_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) NOT NULL,
  `category_code` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'a number starts from 0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course_category`
--

LOCK TABLES `sis_course_category` WRITE;
/*!40000 ALTER TABLE `sis_course_category` DISABLE KEYS */;
INSERT INTO `sis_course_category` (`id`, `category_name`, `category_code`, `active`, `set_order`) VALUES (1,'ໝວດວິຊາຄວາມຮູ້ພື້ນຖານທົ່ວໄປ',0,1,01),(2,'ໝວດວິຊາຄວາມຮູ້ພື້ນຖານວິຊາສະເພາະ',0,1,02),(3,'ໝວດວິຊາສະເພາະ',0,1,03),(4,'ບົດໂຄງການ ຫຼື ວິທະຍານິພົນ',0,1,04),(5,'ໝວດວິຊາເລືອກ',0,1,05);
/*!40000 ALTER TABLE `sis_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_course_enrolment`
--

DROP TABLE IF EXISTS `sis_course_enrolment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course_enrolment` (
  `enrolment_no` char(9) NOT NULL COMMENT 'format Eyy000000',
  `enrolment_date` date NOT NULL,
  `student_code` char(20) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `account_code` char(11) NOT NULL COMMENT 'format nn-nn-nn-nn',
  `description` varchar(200) NOT NULL,
  `total_course` tinyint(3) unsigned NOT NULL,
  `total_credit` tinyint(3) unsigned NOT NULL,
  `total_amount` decimal(12,2) unsigned NOT NULL,
  `paid_status_id` int(11) NOT NULL,
  PRIMARY KEY (`enrolment_no`),
  KEY `fk_sis_course_enrolment_sis_student1_idx` (`student_code`),
  KEY `fk_sis_course_enrolment_sis_academic_year1_idx` (`academic_year_id`),
  KEY `fk_sis_course_enrolment_sis_semester1_idx` (`semester_id`),
  KEY `fk_sis_course_enrolment_sis_entrolment_status1_idx` (`paid_status_id`),
  CONSTRAINT `fk_sis_course_enrolment_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_course_enrolment_sis_entrolment_status1` FOREIGN KEY (`paid_status_id`) REFERENCES `sis_paid_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_course_enrolment_sis_semester1` FOREIGN KEY (`semester_id`) REFERENCES `sis_semester` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_course_enrolment_sis_student1` FOREIGN KEY (`student_code`) REFERENCES `sis_student` (`student_code`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course_enrolment`
--

LOCK TABLES `sis_course_enrolment` WRITE;
/*!40000 ALTER TABLE `sis_course_enrolment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_course_enrolment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_course_enrolment_detail_view`
--

DROP TABLE IF EXISTS `sis_course_enrolment_detail_view`;
/*!50001 DROP VIEW IF EXISTS `sis_course_enrolment_detail_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_course_enrolment_detail_view` AS SELECT 
 1 AS `id`,
 1 AS `enrolment_no`,
 1 AS `course_id`,
 1 AS `course_section_id`,
 1 AS `credit`,
 1 AS `enrolment_date`,
 1 AS `academic_year_id`,
 1 AS `semester_id`,
 1 AS `account_code`,
 1 AS `description`,
 1 AS `total_course`,
 1 AS `total_credit`,
 1 AS `total_amount`,
 1 AS `paid_status_id`,
 1 AS `course_offer_id`,
 1 AS `section_max`,
 1 AS `section_enrol`,
 1 AS `section_available`,
 1 AS `room_id`,
 1 AS `teacher_name`,
 1 AS `teacher_id`,
 1 AS `class_name`,
 1 AS `student_code`,
 1 AS `title_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `eng_first_name`,
 1 AS `eng_last_name`,
 1 AS `gender`,
 1 AS `birth_date`,
 1 AS `nationality_id`,
 1 AS `religion_id`,
 1 AS `marital_status_id`,
 1 AS `address_province_id`,
 1 AS `address_district_id`,
 1 AS `address_village_id`,
 1 AS `mobile_no`,
 1 AS `telephone_no`,
 1 AS `email_address`,
 1 AS `picture_file`,
 1 AS `faculty_id`,
 1 AS `curriculum_id`,
 1 AS `is_continuity_student`,
 1 AS `is_quota_student`,
 1 AS `is_disability`,
 1 AS `required_domitory`,
 1 AS `is_work_before_admission`,
 1 AS `emergency_contact_name`,
 1 AS `emergency_phone_no`,
 1 AS `emergency_province_id`,
 1 AS `emergency_district_id`,
 1 AS `emergency_village_id`,
 1 AS `student_status_id`,
 1 AS `created`,
 1 AS `latest_modified`,
 1 AS `citizen_id_card`,
 1 AS `household_book`,
 1 AS `invoice_template_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_course_offer`
--

DROP TABLE IF EXISTS `sis_course_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `total_section` smallint(5) unsigned NOT NULL,
  `exam_start` datetime NOT NULL,
  `exam_finish` datetime NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  `status` enum('Ready','Not Ready') NOT NULL DEFAULT 'Ready',
  PRIMARY KEY (`id`),
  KEY `fk_course_offer_course1_idx` (`course_id`),
  KEY `fk_sis_course_offer_sis_academic_year1_idx` (`academic_year_id`),
  KEY `fk_sis_course_offer_sis_semester1_idx` (`semester_id`),
  CONSTRAINT `fk_sis_course_offer_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sis_course_offer_sis_course1` FOREIGN KEY (`course_id`) REFERENCES `sis_course` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_course_offer_sis_semester1` FOREIGN KEY (`semester_id`) REFERENCES `sis_semester` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course_offer`
--

LOCK TABLES `sis_course_offer` WRITE;
/*!40000 ALTER TABLE `sis_course_offer` DISABLE KEYS */;
INSERT INTO `sis_course_offer` (`id`, `course_id`, `academic_year_id`, `semester_id`, `total_section`, `exam_start`, `exam_finish`, `active`, `set_order`, `status`) VALUES (1,183,4,1,2,'2019-01-30 00:00:00','2019-01-31 00:00:00',1,01,'Ready'),(2,182,4,1,2,'2019-01-31 00:00:00','2019-01-31 00:00:00',1,01,'Ready'),(3,79,4,1,2,'2019-03-01 00:00:00','2019-03-01 00:00:00',1,01,'Ready'),(5,83,4,1,2,'2019-03-02 00:00:00','2019-03-02 00:00:00',1,01,'Ready'),(7,245,4,1,2,'2019-03-03 00:00:00','2019-03-03 00:00:00',1,01,'Ready'),(11,87,4,2,2,'2019-07-01 00:00:00','2019-07-01 00:00:00',1,01,'Ready'),(12,91,4,2,2,'2019-07-02 00:00:00','2019-07-02 00:00:00',1,01,'Ready'),(14,95,2,1,2,'2020-03-01 00:00:00','2020-03-01 00:00:00',1,01,'Ready'),(16,96,2,1,2,'2020-03-02 00:00:00','2020-03-02 00:00:00',1,01,'Ready'),(18,98,2,2,2,'2020-07-01 00:00:00','2020-07-01 00:00:00',1,01,'Ready'),(20,100,2,2,2,'2020-07-02 00:00:00','2020-07-02 00:00:00',1,01,'Ready'),(22,118,3,1,2,'2021-03-01 00:00:00','2021-03-01 00:00:00',1,01,'Ready'),(24,121,3,1,2,'2021-03-02 00:00:00','2021-03-02 00:00:00',1,01,'Ready'),(26,126,3,2,2,'2021-07-01 00:00:00','2021-07-01 00:00:00',1,01,'Ready'),(27,188,2,2,2,'2020-07-05 00:00:00','2020-07-05 00:00:00',1,01,'Ready'),(28,128,3,2,2,'2021-07-01 00:00:00','2021-07-01 00:00:00',1,01,'Ready'),(29,189,2,2,2,'2020-08-07 00:00:00','2020-08-07 00:00:00',1,01,'Ready'),(30,129,5,1,2,'2022-03-01 00:00:00','2022-03-01 00:00:00',1,01,'Ready'),(31,186,4,2,2,'2019-07-07 00:00:00','2019-07-07 00:00:00',1,01,'Ready'),(32,187,4,2,2,'2019-07-08 00:00:00','2019-07-08 00:00:00',1,01,'Ready'),(33,131,5,1,2,'2022-03-02 00:00:00','2022-03-02 00:00:00',1,01,'Ready'),(34,132,5,2,2,'2022-07-01 00:00:00','2022-07-01 00:00:00',1,01,'Ready'),(35,186,2,1,2,'2019-02-02 00:00:00','2019-02-02 00:00:00',1,01,'Ready'),(36,133,5,2,2,'2022-07-02 00:00:00','2022-07-02 00:00:00',1,01,'Ready'),(37,187,2,1,2,'2019-02-03 00:00:00','2019-02-03 00:00:00',1,01,'Ready'),(38,205,3,1,2,'2021-01-30 00:00:00','2021-01-30 00:00:00',1,01,'Ready'),(39,191,3,1,2,'2021-01-29 00:00:00','2021-01-29 00:00:00',1,01,'Ready'),(40,192,3,2,2,'2021-06-29 00:00:00','2021-06-29 00:00:00',1,01,'Ready'),(41,193,3,2,2,'2021-06-28 00:00:00','2021-06-28 00:00:00',1,01,'Ready'),(42,236,4,1,3,'2019-01-10 00:00:00','2019-01-10 00:00:00',1,01,'Ready'),(43,194,5,1,2,'2022-02-02 00:00:00','2022-02-02 00:00:00',1,01,'Ready'),(44,238,4,1,2,'2019-01-08 00:00:00','2019-01-08 00:00:00',1,01,'Ready'),(45,233,5,1,2,'2022-02-03 00:00:00','2022-02-03 00:00:00',1,01,'Ready'),(46,229,4,1,2,'2019-03-01 00:00:00','2019-03-01 00:00:00',1,01,'Ready'),(47,198,4,1,2,'2019-03-02 00:00:00','2019-03-02 00:00:00',1,01,'Ready'),(48,239,4,1,2,'2019-01-06 00:00:00','2019-01-06 00:00:00',1,01,'Ready'),(49,196,5,2,1,'2022-03-01 00:00:00','2022-05-30 00:00:00',1,01,'Ready'),(50,200,4,1,2,'2019-03-03 00:00:00','2019-03-03 00:00:00',1,01,'Ready'),(51,197,5,2,2,'2022-02-01 00:00:00','2022-06-30 00:00:00',1,01,'Ready'),(52,230,4,2,2,'2019-07-01 00:00:00','2019-07-01 00:00:00',1,01,'Ready'),(53,240,4,2,2,'2019-07-07 00:00:00','2019-07-07 00:00:00',1,01,'Ready'),(54,241,4,2,2,'2019-07-07 00:00:00','2019-07-07 00:00:00',1,01,'Ready'),(55,207,4,1,2,'2019-01-25 00:00:00','2019-01-25 00:00:00',1,01,'Ready'),(56,203,4,2,2,'2019-07-03 00:00:00','2019-07-03 00:00:00',1,01,'Ready'),(57,242,4,2,2,'2019-07-15 00:00:00','2019-07-15 00:00:00',1,01,'Ready'),(58,66,4,1,2,'2019-01-27 00:00:00','2019-01-27 00:00:00',1,01,'Ready'),(59,204,4,2,2,'2019-07-04 00:00:00','2019-07-04 00:00:00',1,01,'Ready'),(60,243,4,2,2,'2019-07-14 00:00:00','2019-07-14 00:00:00',1,01,'Ready'),(61,206,2,1,2,'2020-03-01 00:00:00','2020-03-01 00:00:00',1,01,'Ready'),(63,231,2,1,2,'2020-03-02 00:00:00','2020-03-02 00:00:00',1,01,'Ready'),(65,220,2,1,2,'2020-03-03 00:00:00','2020-03-03 00:00:00',1,01,'Ready'),(67,208,2,1,2,'2020-03-04 00:00:00','2020-03-04 00:00:00',1,01,'Ready'),(68,210,2,2,2,'2020-07-01 00:00:00','2020-07-01 00:00:00',1,01,'Ready'),(69,244,2,1,3,'2020-01-20 00:00:00','2020-01-20 00:00:00',1,01,'Ready'),(70,76,4,2,2,'2019-07-31 00:00:00','2019-07-31 00:00:00',1,01,'Ready'),(71,211,2,2,2,'2020-07-02 00:00:00','2020-07-02 00:00:00',1,01,'Ready'),(72,78,4,2,2,'2019-07-30 00:00:00','2019-07-30 00:00:00',1,01,'Ready'),(73,222,2,2,2,'2020-07-03 00:00:00','2020-07-03 00:00:00',1,01,'Ready'),(74,209,4,2,2,'2019-07-29 00:00:00','2019-07-29 00:00:00',1,01,'Ready'),(75,227,2,2,2,'2020-07-04 00:00:00','2020-07-04 00:00:00',1,01,'Ready'),(76,246,2,1,2,'2020-02-12 00:00:00','2020-02-12 00:00:00',1,01,'Ready'),(77,232,2,2,2,'2020-07-05 00:00:00','2020-07-05 00:00:00',1,01,'Ready'),(78,81,2,1,2,'2020-01-28 00:00:00','2020-01-28 00:00:00',1,01,'Ready'),(79,56,4,1,3,'2019-01-15 00:00:00','2019-01-15 00:00:00',1,01,'Ready'),(80,82,2,1,2,'2020-01-29 00:00:00','2020-01-29 00:00:00',1,01,'Ready'),(82,249,2,1,2,'2020-01-30 00:00:00','2020-01-30 00:00:00',1,01,'Ready'),(83,57,4,1,2,'2019-01-16 00:00:00','2019-01-16 00:00:00',1,01,'Ready'),(84,224,2,1,2,'2020-01-27 00:00:00','2020-01-27 00:00:00',1,01,'Ready'),(87,85,2,2,2,'2020-06-30 00:00:00','2020-06-30 00:00:00',1,01,'Ready'),(88,88,2,2,2,'2020-06-29 00:00:00','2020-06-29 00:00:00',1,01,'Ready'),(92,90,3,1,2,'2021-01-29 00:00:00','2021-01-29 00:00:00',1,01,'Ready'),(93,92,3,1,2,'2021-01-28 00:00:00','2021-01-28 00:00:00',1,01,'Ready'),(94,221,3,1,2,'2021-01-26 00:00:00','2021-01-26 00:00:00',1,01,'Ready'),(96,97,3,2,2,'2021-06-29 00:00:00','2021-06-29 00:00:00',1,01,'Ready'),(97,92,3,2,2,'2021-06-28 00:00:00','2021-06-28 00:00:00',1,01,'Ready'),(98,221,3,2,2,'2021-07-01 00:00:00','2021-07-01 00:00:00',1,01,'Ready'),(99,228,3,1,2,'2021-03-01 00:00:00','2021-03-01 00:00:00',1,01,'Ready'),(100,60,2,1,3,'2020-01-15 00:00:00','2020-01-15 00:00:00',1,01,'Ready'),(101,212,3,1,2,'2021-03-02 00:00:00','2021-03-02 00:00:00',1,01,'Ready'),(102,71,4,1,2,'2019-02-03 00:00:00','2019-02-03 00:00:00',1,01,'Ready'),(103,213,3,1,2,'2021-03-03 00:00:00','2021-03-03 00:00:00',1,01,'Ready'),(104,59,4,2,3,'2019-07-20 00:00:00','2019-07-20 00:00:00',1,01,'Ready'),(105,123,5,1,2,'2022-01-28 00:00:00','2022-01-28 00:00:00',1,01,'Ready'),(106,214,3,2,2,'2021-07-01 00:00:00','2021-07-01 00:00:00',1,01,'Ready'),(107,120,5,1,2,'2022-02-05 00:00:00','2022-02-05 00:00:00',1,01,'Ready'),(108,215,3,2,2,'2021-07-02 00:00:00','2021-07-02 00:00:00',1,01,'Ready'),(109,61,2,1,2,'2020-01-16 00:00:00','2020-01-16 00:00:00',1,01,'Ready'),(110,216,5,1,2,'2022-03-01 00:00:00','2022-03-01 00:00:00',1,01,'Ready'),(111,127,5,2,1,'2022-02-10 00:00:00','1970-01-01 07:00:00',1,01,'Ready'),(112,217,5,1,2,'2022-03-02 00:00:00','2022-03-02 00:00:00',1,01,'Ready'),(113,125,5,2,1,'2022-02-01 00:00:00','1970-01-01 07:00:00',1,01,'Ready'),(114,218,5,2,2,'2022-07-01 00:00:00','2022-07-01 00:00:00',1,01,'Ready'),(115,219,5,2,2,'2022-07-02 00:00:00','2022-07-02 00:00:00',1,01,'Ready'),(116,62,2,2,3,'2020-07-20 00:00:00','2020-07-20 00:00:00',1,01,'Ready'),(118,63,2,2,2,'2020-07-21 00:00:00','2020-07-21 00:00:00',1,01,'Ready'),(119,10,4,1,2,'2019-01-30 00:00:00','2019-01-30 00:00:00',1,01,'Ready'),(120,64,3,1,3,'2021-01-20 00:00:00','2021-01-20 00:00:00',1,01,'Ready'),(121,65,3,1,1,'2021-01-24 00:00:00','2021-01-24 00:00:00',1,01,'Ready'),(122,5,4,1,2,'2019-01-31 00:00:00','2019-01-31 00:00:00',1,01,'Ready'),(123,68,3,2,3,'2021-07-15 00:00:00','2021-07-15 00:00:00',1,01,'Ready'),(124,250,2,2,2,'2021-07-07 00:00:00','2021-07-07 00:00:00',1,01,'Ready'),(125,7,4,1,2,'2019-01-29 00:00:00','2019-01-29 00:00:00',1,01,'Ready'),(126,67,3,2,2,'2021-07-24 00:00:00','2021-07-24 00:00:00',1,01,'Ready'),(127,9,4,1,2,'2019-01-25 00:00:00','2019-01-25 00:00:00',1,01,'Ready'),(128,251,2,2,2,'2021-07-16 00:00:00','2021-07-16 00:00:00',1,01,'Ready'),(129,70,5,1,2,'2022-01-22 00:00:00','2022-01-22 00:00:00',1,01,'Ready'),(130,72,5,1,2,'2022-01-25 00:00:00','2022-01-25 00:00:00',1,01,'Ready'),(131,8,4,2,2,'2019-06-25 00:00:00','2019-06-25 00:00:00',1,01,'Ready'),(132,252,2,2,2,'2021-07-27 00:00:00','2021-07-27 00:00:00',1,01,'Ready'),(133,74,5,2,1,'2022-07-01 00:00:00','2022-07-01 00:00:00',1,01,'Ready'),(134,77,5,2,1,'2022-08-20 00:00:00','2022-08-20 00:00:00',1,01,'Ready'),(135,6,4,2,2,'2019-06-30 00:00:00','2019-06-30 00:00:00',1,01,'Ready'),(136,12,4,2,2,'2019-06-28 00:00:00','2019-06-28 00:00:00',1,01,'Ready'),(137,13,2,1,2,'2020-01-30 00:00:00','2020-01-30 00:00:00',1,01,'Ready'),(138,14,2,1,2,'2020-01-31 00:00:00','2020-01-31 00:00:00',1,01,'Ready'),(141,15,2,2,2,'2020-06-30 00:00:00','2020-06-30 00:00:00',1,01,'Ready'),(142,16,2,2,2,'2020-06-29 00:00:00','2020-06-29 00:00:00',1,01,'Ready'),(143,138,3,1,2,'2021-03-01 00:00:00','2021-03-01 00:00:00',1,01,'Ready'),(144,102,4,1,3,'2019-01-20 00:00:00','2019-01-20 00:00:00',1,01,'Ready'),(145,27,2,2,2,'2020-06-26 00:00:00','2020-06-26 00:00:00',1,01,'Ready'),(146,103,4,1,2,'2019-01-22 00:00:00','2019-01-22 00:00:00',1,01,'Ready'),(147,105,4,2,3,'2019-07-25 00:00:00','2019-07-25 00:00:00',1,01,'Ready'),(148,139,3,1,2,'2021-03-02 00:00:00','2021-03-02 00:00:00',1,01,'Ready'),(149,104,4,2,2,'2019-07-27 00:00:00','2019-07-27 00:00:00',1,01,'Ready'),(150,106,2,1,3,'2020-01-16 00:00:00','2020-01-16 00:00:00',1,01,'Ready'),(151,107,2,1,2,'2020-01-18 00:00:00','2020-01-18 00:00:00',1,01,'Ready'),(152,108,2,2,2,'2020-07-24 00:00:00','2020-07-24 00:00:00',1,01,'Ready'),(153,109,2,2,2,'2020-07-29 00:00:00','2020-07-29 00:00:00',1,01,'Ready'),(154,18,3,1,2,'2021-01-25 00:00:00','2021-01-25 00:00:00',1,01,'Ready'),(155,17,3,1,2,'2021-01-26 00:00:00','2021-01-26 00:00:00',1,01,'Ready'),(156,26,3,1,2,'2021-01-27 00:00:00','2021-01-27 00:00:00',1,01,'Ready'),(157,223,3,1,2,'2021-03-03 00:00:00','2021-03-03 00:00:00',1,01,'Ready'),(158,140,3,2,2,'2021-07-01 00:00:00','2021-07-01 00:00:00',1,01,'Ready'),(159,141,3,2,2,'2021-07-02 00:00:00','2021-07-02 00:00:00',1,01,'Ready'),(160,19,3,2,2,'2021-06-30 00:00:00','2021-06-30 00:00:00',1,01,'Ready'),(161,142,5,1,2,'2022-03-01 00:00:00','2022-03-01 00:00:00',1,01,'Ready'),(162,143,5,1,2,'2022-03-02 00:00:00','2022-03-02 00:00:00',1,01,'Ready'),(163,144,5,2,2,'2022-07-01 00:00:00','2022-07-01 00:00:00',1,01,'Ready'),(164,110,3,1,2,'2021-02-20 00:00:00','2021-02-20 00:00:00',1,01,'Ready'),(165,20,3,2,2,'2021-06-29 00:00:00','2021-06-29 00:00:00',1,01,'Ready'),(166,111,3,1,2,'2021-02-24 00:00:00','2021-02-24 00:00:00',1,01,'Ready'),(167,112,3,2,2,'2021-07-25 00:00:00','2021-07-25 00:00:00',1,01,'Ready'),(168,22,5,1,2,'2022-02-01 00:00:00','2022-02-01 00:00:00',1,01,'Ready'),(169,113,3,2,2,'2021-07-28 00:00:00','2021-07-28 00:00:00',1,01,'Ready'),(170,21,5,1,2,'2022-02-02 00:00:00','2022-02-02 00:00:00',1,01,'Ready'),(171,114,5,1,2,'2022-02-25 00:00:00','2022-02-25 00:00:00',1,01,'Ready'),(172,292,3,1,2,'2021-02-06 00:00:00','2021-02-06 00:00:00',1,01,'Ready'),(173,29,5,1,2,'2022-02-03 00:00:00','2022-02-03 00:00:00',1,01,'Ready'),(174,115,5,1,2,'2022-02-28 00:00:00','2022-02-28 00:00:00',1,01,'Ready'),(175,293,3,1,2,'2021-02-12 00:00:00','2021-02-12 00:00:00',1,01,'Ready'),(176,23,5,2,2,'2022-07-01 00:00:00','2022-07-01 00:00:00',1,01,'Ready'),(177,259,3,1,2,'2021-02-19 00:00:00','2021-02-19 00:00:00',1,01,'Ready'),(178,24,5,2,2,'2022-07-04 00:00:00','2022-07-04 00:00:00',1,01,'Ready'),(179,25,7,1,2,'2013-01-30 00:00:00','2013-01-30 00:00:00',1,01,'Ready'),(180,46,7,2,2,'2023-02-01 00:00:00','2023-07-30 00:00:00',1,01,'Ready'),(181,75,4,1,2,'2019-01-30 00:00:00','2019-01-30 00:00:00',1,01,'Ready'),(182,253,3,2,2,'2021-07-08 00:00:00','2021-07-08 00:00:00',1,01,'Ready'),(183,73,4,1,2,'2019-01-31 00:00:00','2019-01-31 00:00:00',1,01,'Ready'),(184,295,3,2,2,'2021-07-27 00:00:00','2021-07-27 00:00:00',1,01,'Ready'),(185,69,4,1,2,'2019-01-29 00:00:00','2019-01-29 00:00:00',1,01,'Ready'),(186,86,4,2,2,'2019-07-02 00:00:00','2019-07-02 00:00:00',1,01,'Ready'),(187,263,5,1,2,'2023-02-12 00:00:00','2023-02-12 00:00:00',1,01,'Ready'),(188,84,4,2,2,'2019-07-03 00:00:00','2019-07-03 00:00:00',1,01,'Ready'),(189,262,5,1,2,'2023-02-20 00:00:00','2023-02-20 00:00:00',1,01,'Ready'),(190,89,2,1,2,'2020-01-30 00:00:00','2020-01-30 00:00:00',1,01,'Ready'),(191,254,5,2,2,'2023-07-19 00:00:00','2023-07-19 00:00:00',1,01,'Ready'),(192,94,2,2,2,'2020-06-30 00:00:00','2020-06-30 00:00:00',1,01,'Ready'),(193,101,2,2,2,'2020-06-29 00:00:00','2020-06-29 00:00:00',1,01,'Ready'),(194,258,5,2,1,'2023-06-27 00:00:00','2023-06-27 00:00:00',1,01,'Ready'),(196,124,3,1,2,'2021-01-25 00:00:00','2021-01-25 00:00:00',1,01,'Ready'),(197,260,5,2,2,'2023-06-13 00:00:00','2023-06-13 00:00:00',1,01,'Ready'),(198,130,3,1,2,'2021-01-26 00:00:00','2021-01-26 00:00:00',1,01,'Ready'),(199,93,3,1,2,'2021-01-27 00:00:00','2021-01-27 00:00:00',1,01,'Ready'),(200,257,5,2,2,'2023-06-13 00:00:00','2023-06-13 00:00:00',1,01,'Ready'),(201,255,5,2,2,'2023-06-14 00:00:00','2023-06-14 00:00:00',1,01,'Ready'),(202,136,3,2,2,'2021-07-30 00:00:00','2021-07-30 00:00:00',1,01,'Ready'),(203,137,3,2,2,'2021-07-29 00:00:00','2021-07-29 00:00:00',1,01,'Ready'),(204,256,5,2,2,'2023-06-28 00:00:00','2023-06-28 00:00:00',1,01,'Ready'),(205,235,5,1,2,'2022-01-31 00:00:00','2022-01-31 00:00:00',1,01,'Ready'),(206,201,5,1,2,'2022-02-01 00:00:00','2022-02-01 00:00:00',1,01,'Ready'),(207,135,5,1,2,'2022-02-02 00:00:00','2022-02-02 00:00:00',1,01,'Ready'),(208,202,5,2,1,'2022-02-01 00:00:00','2022-08-01 00:00:00',1,01,'Ready');
/*!40000 ALTER TABLE `sis_course_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_course_offer_view`
--

DROP TABLE IF EXISTS `sis_course_offer_view`;
/*!50001 DROP VIEW IF EXISTS `sis_course_offer_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_course_offer_view` AS SELECT 
 1 AS `id`,
 1 AS `course_id`,
 1 AS `academic_year_id`,
 1 AS `semester_id`,
 1 AS `total_section`,
 1 AS `exam_start`,
 1 AS `exam_finish`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `status`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `course_eng_name`,
 1 AS `credit`,
 1 AS `lecture_hour`,
 1 AS `lab_hour`,
 1 AS `description`,
 1 AS `faculty_id`,
 1 AS `faculty_abbr`,
 1 AS `faculty_name`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_course_code`,
 1 AS `department_name`,
 1 AS `department_eng_name`,
 1 AS `department_course_code`,
 1 AS `department_id`,
 1 AS `course_status_id`,
 1 AS `course_abbr_name`,
 1 AS `is_shared`,
 1 AS `course_offer_id`,
 1 AS `section_max`,
 1 AS `section_enrol`,
 1 AS `section_available`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_course_section`
--

DROP TABLE IF EXISTS `sis_course_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_offer_id` int(11) NOT NULL,
  `section_max` smallint(5) unsigned NOT NULL COMMENT 'maximum number of students in this section',
  `section_enrol` smallint(5) unsigned NOT NULL,
  `section_available` smallint(5) unsigned NOT NULL,
  `teacher_name` varchar(100) DEFAULT NULL COMMENT 'teacher name of this section',
  `room_id` int(11) NOT NULL,
  `class_name` varchar(45) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL COMMENT 'Only user who has Lecturer role',
  PRIMARY KEY (`id`),
  KEY `fk_course_section_course_offer1_idx` (`course_offer_id`),
  KEY `fk_course_section_room1_idx` (`room_id`),
  KEY `fk_sis_course_section_sums_user1_idx` (`teacher_id`),
  CONSTRAINT `fk_course_section_course_offer1` FOREIGN KEY (`course_offer_id`) REFERENCES `sis_course_offer` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_course_section_room1` FOREIGN KEY (`room_id`) REFERENCES `sis_room` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sis_course_section_sums_user1` FOREIGN KEY (`teacher_id`) REFERENCES `sums_user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course_section`
--

LOCK TABLES `sis_course_section` WRITE;
/*!40000 ALTER TABLE `sis_course_section` DISABLE KEYS */;
INSERT INTO `sis_course_section` (`id`, `course_offer_id`, `section_max`, `section_enrol`, `section_available`, `teacher_name`, `room_id`, `class_name`, `teacher_id`) VALUES (1,185,2,0,2,'lecture  ',26,'X101',20);
/*!40000 ALTER TABLE `sis_course_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_course_section_offer_view`
--

DROP TABLE IF EXISTS `sis_course_section_offer_view`;
/*!50001 DROP VIEW IF EXISTS `sis_course_section_offer_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_course_section_offer_view` AS SELECT 
 1 AS `id`,
 1 AS `course_offer_id`,
 1 AS `section_max`,
 1 AS `section_enrol`,
 1 AS `section_available`,
 1 AS `teacher_name`,
 1 AS `room_id`,
 1 AS `class_name`,
 1 AS `teacher_id`,
 1 AS `course_id`,
 1 AS `academic_year_id`,
 1 AS `semester_id`,
 1 AS `total_section`,
 1 AS `exam_start`,
 1 AS `exam_finish`,
 1 AS `course_offer_status`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `course_eng_name`,
 1 AS `course_abbr_name`,
 1 AS `credit`,
 1 AS `lecture_hour`,
 1 AS `lab_hour`,
 1 AS `practice_hour`,
 1 AS `description`,
 1 AS `faculty_id`,
 1 AS `department_id`,
 1 AS `course_status_id`,
 1 AS `is_shared`,
 1 AS `department_course_code`,
 1 AS `department_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_course_code`,
 1 AS `faculty_name`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_eng_abbr`,
 1 AS `is_faculty`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `sis_course_section_view`
--

DROP TABLE IF EXISTS `sis_course_section_view`;
/*!50001 DROP VIEW IF EXISTS `sis_course_section_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_course_section_view` AS SELECT 
 1 AS `id`,
 1 AS `course_offer_id`,
 1 AS `section_max`,
 1 AS `section_enrol`,
 1 AS `section_available`,
 1 AS `teacher_name`,
 1 AS `room_id`,
 1 AS `class_name`,
 1 AS `teacher_id`,
 1 AS `course_id`,
 1 AS `academic_year_id`,
 1 AS `semester_id`,
 1 AS `total_section`,
 1 AS `exam_start`,
 1 AS `exam_finish`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_course_status`
--

DROP TABLE IF EXISTS `sis_course_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_course_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` char(1) NOT NULL,
  `status_name` varchar(45) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_course_status`
--

LOCK TABLES `sis_course_status` WRITE;
/*!40000 ALTER TABLE `sis_course_status` DISABLE KEYS */;
INSERT INTO `sis_course_status` (`id`, `status_code`, `status_name`, `active`, `set_order`) VALUES (1,'N','New',1,01),(2,'A','Approving',1,02),(3,'O','Opened',1,03),(4,'R','Rejected',1,04),(5,'C','Closed',1,05);
/*!40000 ALTER TABLE `sis_course_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_curriclum_course_view`
--

DROP TABLE IF EXISTS `sis_curriclum_course_view`;
/*!50001 DROP VIEW IF EXISTS `sis_curriclum_course_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_curriclum_course_view` AS SELECT 
 1 AS `course_id`,
 1 AS `curriculum_id`,
 1 AS `course_category_id`,
 1 AS `id`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `course_eng_name`,
 1 AS `credit`,
 1 AS `lecture_hour`,
 1 AS `lab_hour`,
 1 AS `practice_hour`,
 1 AS `description`,
 1 AS `faculty_id`,
 1 AS `department_id`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `course_status_id`,
 1 AS `course_abbr_name`,
 1 AS `is_shared`,
 1 AS `category_code`,
 1 AS `category_name`,
 1 AS `curriculum_course_code`,
 1 AS `curriculum_eng_name`,
 1 AS `curriculum_name`,
 1 AS `department_course_code`,
 1 AS `department_eng_name`,
 1 AS `department_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_course_code`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_curriculum`
--

DROP TABLE IF EXISTS `sis_curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_curriculum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL COMMENT 'Department that responsible for the curriculum',
  `curriculum_name` varchar(200) NOT NULL,
  `curriculum_eng_name` varchar(200) NOT NULL,
  `certificate_degree_id` int(11) NOT NULL,
  `certificate_title` varchar(200) NOT NULL,
  `certificate_eng_title` varchar(200) NOT NULL,
  `total_credit` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  `curriculum_status_id` int(11) NOT NULL,
  `is_continuity` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 for normal, 1 for continuity curriculum',
  `curriculum_course_code` char(3) NOT NULL,
  `total_year_study` tinyint(1) unsigned NOT NULL COMMENT 'e.g 4 for 4-year study',
  `curriculum_group_id` int(11) NOT NULL,
  `curriculum_name_prefix` varchar(200) NOT NULL,
  `curriculum_eng_name_prefix` varchar(200) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curriculum_name_UNIQUE` (`curriculum_name`),
  KEY `fk_sis_curriculum_sis_faculty1_idx` (`faculty_id`),
  KEY `fk_sis_curriculum_sis_department1_idx` (`department_id`),
  KEY `fk_sis_curriculum_sis_certificate_degree1_idx` (`certificate_degree_id`),
  KEY `fk_sis_curriculum_sis_curriculum_status1_idx` (`curriculum_status_id`),
  KEY `fk_sis_curriculum_sis_curriculum_group1_idx` (`curriculum_group_id`),
  KEY `fk_sis_curriculum_sis_academic_year1_idx` (`academic_year_id`),
  CONSTRAINT `fk_sis_curriculum_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_curriculum_sis_certificate_degree1` FOREIGN KEY (`certificate_degree_id`) REFERENCES `sis_certificate_degree` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_curriculum_sis_curriculum_group1` FOREIGN KEY (`curriculum_group_id`) REFERENCES `sis_curriculum_group` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_curriculum_sis_curriculum_status1` FOREIGN KEY (`curriculum_status_id`) REFERENCES `sis_curriculum_status` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_sis_curriculum_sis_department1` FOREIGN KEY (`department_id`) REFERENCES `sis_department` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_curriculum_sis_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `sis_faculty` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_curriculum`
--

LOCK TABLES `sis_curriculum` WRITE;
/*!40000 ALTER TABLE `sis_curriculum` DISABLE KEYS */;
INSERT INTO `sis_curriculum` (`id`, `faculty_id`, `department_id`, `curriculum_name`, `curriculum_eng_name`, `certificate_degree_id`, `certificate_title`, `certificate_eng_title`, `total_credit`, `active`, `set_order`, `curriculum_status_id`, `is_continuity`, `curriculum_course_code`, `total_year_study`, `curriculum_group_id`, `curriculum_name_prefix`, `curriculum_eng_name_prefix`, `academic_year_id`) VALUES (1,5,5,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ຈັດ​ການ​ສິ່ງ​ແວດ​ລ້ອມ 2017-18','Bachelor Program of Science in Environment Management 2017-18',2,'​ປະ​ລິ​ນຍາ​ຕີ​ວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ຈັດ​ການ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Science in Environment Management',142,1,01,5,0,'BEM',4,1,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ຈັດ​ການ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor Program of Science in Environment Management',1),(2,4,2,'Bachelor of Achitecture 2017-18','Bachelor of Achitecture 2017-18',2,'Bachelor','Bachelor',176,1,01,5,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',1),(3,5,5,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ 2017-18','Bachelor of Environment Science Program in Environment Technology 2017-18',2,'​ປະ​ລິ​ນຍາ​ຕີ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Technology',600,1,02,4,0,'BET',4,1,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',1),(4,5,5,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',2,'​ປະ​ລິ​ນຍາ​ຕີ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Technology',600,1,02,4,0,'BET',4,1,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',1),(7,4,2,'Bachelor of Achitecture','Bachelor of Achitecture ',2,'Bachelor','Bachelor',176,1,01,6,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',1),(8,5,5,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ 2022-23','Bachelor of Environment Science Program in Environment Technology 2012-23',2,'​ປະ​ລິ​ນຍາ​ຕີ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Technology',600,1,02,4,0,'BET',4,1,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',1),(9,4,2,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ຈັດ​ການ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Management',2,'Bachelor','Bachelor',176,1,01,5,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',1),(10,4,2,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີສະ​ຖາ​ປັດ​ຕະ​ຍະ​ກຳ​ສາດ ສາ​ຂາ​ວິ​ຊາ​ອອກ​ແບບ​ຜະ​ລິດ​ຕະ​ພັນ','Bachelor of Architecture  program in product design',2,'Bachelor','Bachelor',176,1,01,5,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',1),(11,6,9,'Bachelor of Hotel Management 2017-18','Bachelor of Hotel Management 2017-18',2,'Bachelor','Bachelor',600,1,01,6,0,'001',5,3,'Bachelor of Hotel Management','Bachelor of Hotel Management',1),(12,7,7,'Bachelor of Economic Development Planning 2017-18','Bachelor of Economic Development Planning 2017-18',2,'Bachelor','Bachelor',600,1,01,6,0,'001',5,2,'Bachelor of Economic Development Planning','Bachelor of Economic Development Planning',1),(13,8,14,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີເສດ​ຖະ​ສາດ​ປ່າ​ໄມ້ ແລະ ເຕັກ​ໂນ​ໂລ​ຊີ​ປຸງ​ແຕ່ງ​ໄມ້ 2018-19','Bachelor of Science in Forestry Major in Wood Technology and Forest Economics  2018-19',2,'ປະ​ລິນ​ຍາ​ຕີ ປ່າ​ໄມ້ ສາ​ຂາ​ເສດ​ຖະ​ສາດ​ປ່າ​ໄມ້ ແລະ ເຕັກ​ໂນ​ໂລ​ຊີ​ປຸງ​ແຕ່ງ​ໄມ້','Bachelor of Science in Forestry Major in Wood Technology and Forest Economics ',141,1,01,6,0,'WFE',4,3,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີເສດ​ຖະ​ສາດ​ປ່າ​ໄມ້ ແລະ ເຕັກ​ໂນ​ໂລ​ຊີ​ປຸງ​ແຕ່ງ​ໄມ້','Bachelor of Science in Forestry Major in Wood Technology and Forest Economics ',4),(14,1,15,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ 2018-19','Bachelor of  Law Specializing in Politicalscience Program 2018-19',2,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ','Bachelor of Administeration',146,1,01,3,0,'BOA',4,2,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ','Bachelor of  Law Specializing in Politicalscience Program',4),(15,8,11,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ປ່າ​ໄມ້ 2018-19','Bachelor of Science Program in Forestry Management 2018-19',2,'ປະ​ລິນ​ຍາ​ຕີ ສາ​ຂາ​ການ​ຈັດ​ສັນ - ຄຸ້ມ​ຄອງ​ປ່າ​ໄມ້','Bachelor of Science in Forestry Management',140,1,02,6,0,'BFM',4,3,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ປ່າ​ໄມ້','Bachelor of Science Program in Forestry Management',4),(16,4,3,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ 2018-19','Bachelor program of Architecture Program in Building Technology 2018-19',2,'ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ',135,1,02,3,0,'ວອ',4,1,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','Bachelor program of Architecture Program in Building Technology',4),(17,1,15,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ ','Bachelor of Law Specializing in Politicalscience Program ',2,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ','Bachelor of Administeration',146,1,01,6,0,'BOA',4,2,'ປະລິນຍາຕີລັດຖະສາດສາຂາການປົກຄອງ','Bachelor of  Law Specializing in Politicalscience Program',4),(18,4,2,'ປະ​ລິ​ຍາ​ຕີ​ສະ​ຖາ​ປັດ​ຕະ​ຍາ​ກຳ​ສາດ','Bachelor of Achitecture',2,'Bachelor','Bachelor',176,1,01,6,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',1),(19,1,16,'ຫຼັກສູດປະລິນຍາຕີສີລະປະສາດສາຂາການຕ່າງປະເທດ 2018-19','Bechelor of Arts Program In Foreign Affair 2018-19',2,'ປະລິນຍາຕີສີລະປະສາດສາຂາການຕ່າງປະເທດ','Bechelor of Arts In Foreign Affair',146,1,02,6,0,'BFA',4,2,'ຫຼັກສູດປະລິນຍາຕີສີລະປະສາດສາຂາການຕ່າງປະເທດ','Bechelor of Arts Program In Foreign Affair',4),(20,5,6,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ວາງ​ແຜນ​ພັດ​ທະ​ນາ 2018-19','Bachelor of Environment Science Program in Environment Development Planning 2018-19',2,'​ປະ​ລິ​ນຍາ​ຕີ​ວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ວາງ​ແຜນ​ພັດ​ທະ​ນາ','Bachelor of Environment Science Program in Environment Development Planning',144,1,03,6,0,'BDP',4,3,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ການ​ວາງ​ແຜນ​ພັດ​ທະ​ນາ','Bachelor of Environment Science Program in Environment Development Planning',4),(21,5,5,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ 2018-19','Bachelor of Environment Science Program in Environment Technology 2018-19',2,'​ປະ​ລິ​ນຍາ​ຕີ​ວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',145,1,02,6,0,'BET',4,3,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ ສາ​ຂາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Bachelor of Environment Science Program in Environment Technology',4),(22,7,8,'ຫຼັກສູດປະລິນຍາຕີບໍລິຫານທຸລະກິດ ສາຂາບໍລິຫານທຸລະກິດທົ່ວໄປ 2018-19','Bachelor of Business Administration Program in General Business Management 2018-19',2,'ປະລິນຍາຕີບໍລິຫານທຸລະກິດ ສາຂາບໍລິຫານທຸລະກິດທົ່ວໄປ','Bachelor of Business Administration Program in General Business Management',131,1,01,6,0,'BBA',4,2,'ຫຼັກສູດປະລິນຍາຕີບໍລິຫານທຸລະກິດ ສາຂາບໍລິຫານທຸລະກິດທົ່ວໄປ','Bachelor of Business Administration Program in General Business Management',4),(23,4,3,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','Bachelor program of Architecture Program in Building Technology',2,'ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ',135,1,02,6,0,'ວອ',4,1,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','Bachelor program of Architecture Program in Building Technology',4),(24,4,2,'Bachelor of Achitecture 2018-19','Bachelor of Achitecture 2018-19',2,'Bachelor','Bachelor',176,1,01,6,0,'001',5,1,'Bachelor of Achitecture','Bachelor of Achitecture',4),(25,4,3,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ 2017-18','Bachelor program of Architecture Program in Building Technology',2,'ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','ປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ',135,1,02,2,0,'ວອ',4,1,'ຫຼັກສູດປະລິນຍາຕີ ສະຖາປັດຕະຍະກຳສາດ ສາຂາວິຊາວິທະຍາການອາຄານ','Bachelor program of Architecture Program in Building Technology',4),(26,7,7,'ຫຼັກ​ສູດ​ປະ​ລິນ​ຍາ​ຕີ​ເສດ​ຖະ​ສາດ​ສາ​ຂາ​ເສດ​ຖະ​ສາດ​ພາກ​ລັດ 2018-19','Bachelor of Economic Program in public Economic 2018-19',2,'ປະ​ລິນ​ຍາ​ຕີ​ເສດ​ຖະ​ສາດ​ສາ​ຂາ​ເສດ​ຖະ​ສາດ​ພາກ​ລັດ','Bachelor of Sciences in public Economic',139,1,02,6,0,'BPE',4,2,'ຫຼັກ​ສູດ​ປະ​ລິນ​ຍາ​ຕີ​ເສດ​ຖະ​ສາດ​ສາ​ຂາ​ເສດ​ຖະ​ສາດ​ພາກ​ລັດ','Bachelor of Economic Program in public Economic',4),(27,2,13,'ຫຼັກສູດປະລິນຍາຕີວິສະວະກຳສາດ ສາຂາວິສະວະກຳໂຍທາ 2018-19','Bachelor of Engineering Program in Civil Engineering 2018-19',2,'ປະລິນຍາຕີ ວິສະວະກຳສາດສາຂາວິສະວະກຳໂຍທາ','Bachelor of Engineering  in Civil Engineering',148,1,02,6,0,'CE',4,1,'ຫຼັກສູດປະລິນຍາຕີວິສະວະກຳສາດ ສາຂາວິສະວະກຳໂຍທາ','Bachelor of Engineering Program in Civil Engineering',4),(28,2,12,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​​ສະ​ວະ​ກຳ​ສາດ ສາ​ຂາ ເຕັກ​ໂນ​ໂລ​ຊີ​ຂໍ້​ມູນ​ຂ່າວ​ສານ 2018-19','Bachelor of Engineering Program in Information Technology 2018-19',2,'ປະ​ກາ​ສະ​ນິ​ຍາ​ບັດ​ປະ​ລິນ​ຍາ​ຕີ ວິ​ສະ​ວະ​ກຳ​ສາດ​ສາ​ຂາ​ເຕັກ​ໂນ​ໂລ​ຊີ​ຂໍ້​ມູນ​ຂ່າວ​ສານ','Bachelor of Engineering  in Information Technology',149,1,02,6,0,'EIT',4,1,'ຫຼັກ​ສູດ​ປະ​ລິ​ນຍາ​ຕີວິ​​ສະ​ວະ​ກຳ​ສາດ ສາ​ຂາ ເຕັກ​ໂນ​ໂລ​ຊີ​ຂໍ້​ມູນ​ຂ່າວ​ສານ','Bachelor of Engineering Program in Information Technology',4);
/*!40000 ALTER TABLE `sis_curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_curriculum_admission_view`
--

DROP TABLE IF EXISTS `sis_curriculum_admission_view`;
/*!50001 DROP VIEW IF EXISTS `sis_curriculum_admission_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_curriculum_admission_view` AS SELECT 
 1 AS `id`,
 1 AS `faculty_id`,
 1 AS `department_id`,
 1 AS `curriculum_name`,
 1 AS `curriculum_eng_name`,
 1 AS `certificate_degree_id`,
 1 AS `certificate_title`,
 1 AS `certificate_eng_title`,
 1 AS `total_credit`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `curriculum_status_id`,
 1 AS `is_continuity`,
 1 AS `curriculum_course_code`,
 1 AS `total_year_study`,
 1 AS `curriculum_group_id`,
 1 AS `curriculum_name_prefix`,
 1 AS `curriculum_eng_name_prefix`,
 1 AS `academic_year_id`,
 1 AS `status_code`,
 1 AS `status_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_course_code`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_name`,
 1 AS `department_course_code`,
 1 AS `department_eng_name`,
 1 AS `department_name`,
 1 AS `academic_year`,
 1 AS `academic_start_date`,
 1 AS `academic_end_date`,
 1 AS `degree_name`,
 1 AS `degree_eng_name`,
 1 AS `curriculum_group_name`,
 1 AS `group_no`,
 1 AS `admission_id`,
 1 AS `quota`,
 1 AS `admission_code`,
 1 AS `admission_name`,
 1 AS `start_admission_date`,
 1 AS `end_admission_date`,
 1 AS `start_admission_late_date`,
 1 AS `end_admission_late_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_curriculum_group`
--

DROP TABLE IF EXISTS `sis_curriculum_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_curriculum_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_no` char(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_no_UNIQUE` (`group_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_curriculum_group`
--

LOCK TABLES `sis_curriculum_group` WRITE;
/*!40000 ALTER TABLE `sis_curriculum_group` DISABLE KEYS */;
INSERT INTO `sis_curriculum_group` (`id`, `group_no`, `name`, `active`) VALUES (1,'001','ຫຼັກສູດກຸ່ມ A',1),(2,'002','ຫຼັກສູດກຸ່ມ B',1),(3,'003','ຫຼັກສູດກຸ່ມ C',1);
/*!40000 ALTER TABLE `sis_curriculum_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_curriculum_status`
--

DROP TABLE IF EXISTS `sis_curriculum_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_curriculum_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` char(1) NOT NULL,
  `status_name` varchar(45) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_curriculum_status`
--

LOCK TABLES `sis_curriculum_status` WRITE;
/*!40000 ALTER TABLE `sis_curriculum_status` DISABLE KEYS */;
INSERT INTO `sis_curriculum_status` (`id`, `status_code`, `status_name`, `active`, `set_order`) VALUES (1,'N','New',1,01),(2,'A','Approving',1,02),(3,'O','Opened',1,03),(4,'R','Rejected',1,04),(5,'C','Closed',1,05),(6,'E','Entrance',1,06);
/*!40000 ALTER TABLE `sis_curriculum_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_curriculum_view`
--

DROP TABLE IF EXISTS `sis_curriculum_view`;
/*!50001 DROP VIEW IF EXISTS `sis_curriculum_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_curriculum_view` AS SELECT 
 1 AS `id`,
 1 AS `faculty_id`,
 1 AS `department_id`,
 1 AS `curriculum_name`,
 1 AS `curriculum_eng_name`,
 1 AS `certificate_degree_id`,
 1 AS `certificate_title`,
 1 AS `certificate_eng_title`,
 1 AS `total_credit`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `curriculum_status_id`,
 1 AS `is_continuity`,
 1 AS `curriculum_course_code`,
 1 AS `total_year_study`,
 1 AS `curriculum_group_id`,
 1 AS `curriculum_name_prefix`,
 1 AS `curriculum_eng_name_prefix`,
 1 AS `academic_year_id`,
 1 AS `status_code`,
 1 AS `status_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_course_code`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_name`,
 1 AS `department_course_code`,
 1 AS `department_eng_name`,
 1 AS `department_name`,
 1 AS `academic_year`,
 1 AS `academic_start_date`,
 1 AS `academic_end_date`,
 1 AS `degree_name`,
 1 AS `degree_eng_name`,
 1 AS `curriculum_group_name`,
 1 AS `group_no`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_department`
--

DROP TABLE IF EXISTS `sis_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) NOT NULL,
  `department_name` varchar(120) NOT NULL,
  `department_eng_name` varchar(120) NOT NULL,
  `department_course_code` char(2) NOT NULL COMMENT 'construct from faculty course code',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_department_sis_faculty1_idx` (`faculty_id`),
  CONSTRAINT `fk_sis_department_sis_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `sis_faculty` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_department`
--

LOCK TABLES `sis_department` WRITE;
/*!40000 ALTER TABLE `sis_department` DISABLE KEYS */;
INSERT INTO `sis_department` (`id`, `faculty_id`, `department_name`, `department_eng_name`, `department_course_code`, `active`, `set_order`) VALUES (2,4,'ພາກວິ​ຊາ​ສະ​ຖາ​ປັດຕະ​ຍະ​ກຳ​ສາດ','Department of Architecture','1',1,01),(3,4,'ພາກວິຊາ ວິທະຍາການອາຄານ','Department of Architecture Program in Building Technology','2',1,02),(4,5,'ພາກວິ​ຊາ​ວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ','Environment Science','ES',1,01),(5,5,'ພາກວິ​ຊາ​ເທັກ​ໂນ​ໂລ​ຊີ​ສິ່ງ​ແວດ​ລ້ອມ','Department of Environment Technology','ET',1,02),(6,5,'ພາກວິ​ຊາ​ການ​ວາງ​ແຜນ​ພັດ​ທະ​ນາ','Department of Development Planning','DP',1,03),(7,7,'ພາກວິ​ຊາ​ເສດ​ຖະ​ສາດ','Department of Economic','EC',1,01),(8,7,'ພາກວິ​ຊາ​ບໍ​ລິ​ຫານ','Department of Management','DM',1,02),(9,6,'ພາກວິ​ຊາ​ການ​ໂຮງ​ແຮມ','Department of Hotel Management','HM',1,01),(10,6,'ພາກວິ​ຊາ​ທ່ອງ​ທ່ຽວ','Department of Touris','DT',1,02),(11,8,'ພາກວິຊາ ຄຸ້ມ​ຄອງ​ຈັດ​ສັນ​ປ່າ​ໄມ້','Department of Forest Management','1',1,01),(12,2,'ວິສະວະກຳຄອມພີວເຕີ ແລະ ໄອທີ','Computer Engineering and IT','1',1,01),(13,2,'ພາກວິຊາວິສະວະກຳໂຍທາ','Department of Civil Engineering','2',1,02),(14,8,'ພາກວິຊາ ​​ເສດຖະສາດ​ປ່າ​ໄມ້ ​ແລະ ​ເຕັກ​ໂນ​ໂລ​ຊີ​ປຸງ​ແຕ່ງ​ໄມ້, ສາຂາ​ວິຊາ​ປ່າ​ໄມ້​ຊຸມ​ຊົນ ​ແລະ​ ພັດທະນາ​ຊົນນະບົດ','Department of Forestry in wood Technology and Forest Economics','2',1,02),(15,1,'ພາກວິຊາລັດຖະສາດ','Department of Politics','1',1,01),(16,1,'ພາກວິຊາພົວພັນສາກົນ.','Department of International Relations','2',1,02);
/*!40000 ALTER TABLE `sis_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_district`
--

DROP TABLE IF EXISTS `sis_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_district_sis_province1_idx` (`province_id`),
  CONSTRAINT `fk_sis_district_sis_province1` FOREIGN KEY (`province_id`) REFERENCES `sis_province` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_district`
--

LOCK TABLES `sis_district` WRITE;
/*!40000 ALTER TABLE `sis_district` DISABLE KEYS */;
INSERT INTO `sis_district` (`id`, `province_id`, `district_name`, `active`, `set_order`) VALUES (1,1,'ຈັນທະບູລີ',1,001),(2,1,'ສີໂຄດຕະບອ',1,002),(3,1,'ໄຊເສດຖາ',1,003),(4,1,'ສີສັດຕະນາ',1,004),(5,1,'ນາຊາຍທອງ',1,005),(6,1,'ໄຊຖານີ',1,006),(7,1,'ຫາດຊາຍຟອງ',1,007),(8,1,'ສັງທອງ',1,008),(9,1,'ໃໝ່ ເຂດປາກງື້່',1,009),(10,2,'ຜົ້ງສາລີ',1,010),(11,2,'ໃໝ່',1,011),(12,2,'ຂວາ',1,012),(13,2,'ສຳພັນ',1,013),(14,2,'ບຸ່ນເໜືອ',1,014),(15,2,'ຍອດອູ',1,015),(16,2,'ບຸ່ນໃຕ້',1,016),(17,3,'ນ້ຳທາ',1,017),(18,3,'ສິງ',1,018),(19,3,'ລອງ',1,019),(20,3,'ວຽງພູຄາ',1,020),(21,3,'ນາແລ',1,021),(22,4,'ໄຊ',1,022),(23,4,'ລາ',1,023),(24,4,'ນາໝໍ້',1,024),(25,4,'ງາ',1,025),(26,4,'ເບັງ',1,026),(27,4,'ຫຸນ',1,027),(28,4,'ປາກແບ່ງ',1,028),(29,5,'ຫ້ວຍຊາຍ',1,029),(30,5,'ຕົ້ນເຜິ້ງ',1,030),(31,5,'ເມີງ',1,031),(32,5,'ຜາອຸດົມ',1,032),(33,5,'ປາກທາ',1,033),(34,6,'ຫຼວງພະບາງ',1,034),(35,6,'ຊຽງເງິນ',1,035),(36,6,'ນ່ານ',1,036),(37,6,'ປາກອູ',1,037),(38,6,'ນ້ຳບາກ',1,038),(39,6,'ງອຍ',1,039),(40,6,'ປາກແຊງ',1,040),(41,6,'ໂພນໄຊ',1,041),(42,6,'ຈອມເພັດ',1,042),(43,6,'ວຽງຄຳ',1,043),(44,6,'ພູຄູນ',1,044),(45,6,'ໂພນທອງ',1,045),(46,7,'ຊຳເໜືອ',1,046),(47,7,'ຊຽງຄໍ້',1,047),(48,7,'ວຽງທອງ',1,048),(49,7,'ວຽງໄຊ',1,049),(50,7,'ຫົວເມືອງ',1,050),(51,7,'ຊຳໃຕ້',1,051),(52,7,'ສົບເບົາ',1,052),(53,7,'ແອດ',1,053),(54,8,'ໄຊຍະບູລີ',1,054),(55,8,'ຄອບ',1,055),(56,8,'ຫົງສາ',1,056),(57,8,'ຍືນ',1,057),(58,8,'ຊຽງຮ່ອນ',1,058),(59,8,'ພຽງ',1,059),(60,8,'ປາກລາຍ',1,060),(61,8,'ແກ່ນທ້າວ',1,061),(62,8,'ບໍ່ແຕນ',1,062),(63,8,'ທົ່ງມີໄຊ',1,063),(64,8,'ໄຊສະຖານ',1,064),(65,9,'ແປກ',1,065),(66,9,'ຄຳ',1,066),(67,9,'ໜອງແຮດ',1,067),(68,9,'ຄູນ',1,068),(69,9,'ໝອກໃໝ່',1,069),(70,9,'ພູກູດ',1,070),(71,9,'ຜາໄຊ',1,071),(72,9,'ທາໂທມ',1,072),(73,10,'ໂພນຮົງ',1,073),(74,10,'ທຸລະຄົມ',1,074),(75,10,'ແກ້ວອຸດົມ',1,075),(76,10,'ກາສີ',1,076),(77,10,'ວັງວຽງ',1,077),(78,10,'ເຟືອງ',1,078),(79,10,'ຊະນະຄາມ',1,079),(80,10,'ແມດ',1,080),(81,10,'ຫີນເຫີບ',1,081),(82,10,'ວຽງຄຳ',1,082),(83,10,'ຮົ່ມ',1,083),(84,10,'ໄຊສົມບູນ',1,084),(85,10,'ມູນ',1,085),(86,11,'ປາກຊັນ',1,086),(87,11,'ທ່າພະບາດ',1,087),(88,11,'ປາກກະດິງ',1,088),(89,11,'ບໍລິຄັນ',1,089),(90,11,'ຄຳເກີດ',1,090),(91,11,'ວຽງທອງ',1,091),(92,11,'ໄຊຈຳພອນ',1,092),(93,12,'ທ່າແຂກ',1,093),(94,12,'ມະຫາໄຊ',1,094),(95,12,'ໜອງບົກ',1,095),(96,12,'ຫີນບູນ',1,096),(97,12,'ຍົມມະລາດ',1,097),(98,12,'ບົວລະພາ',1,098),(99,12,'ນາກາຍ',1,099),(100,12,'ເຊບັ້ງໄຟ',1,100),(101,12,'ໄຊບົວທອງ',1,101),(102,13,'ຄັນທະບູລີ',1,102),(103,13,'ອຸທຸມພອນ',1,103),(104,13,'ອາດສະພັງທ',1,104),(105,13,'ພິນ',1,105),(106,13,'ເຊໂປນ',1,106),(107,13,'ນອງ',1,107),(108,13,'ທ່າປາງທອງ',1,108),(109,13,'ສອງຄອນ',1,109),(110,13,'ຈຳພອນ',1,110),(111,13,'ຊົນບູລີ',1,111),(112,13,'ໄຊບູລີ',1,112),(113,13,'ວິລະບູລີ',1,113),(114,13,'ອາດສະພອນ',1,114),(115,13,'ໄຊພູທອງ',1,115),(116,13,'ທ່າພະລານໄຊ',1,116),(117,14,'ສາລະວັນ',1,117),(118,14,'ຕາໂອຍ',1,118),(119,14,'ຕຸ້ມລານ',1,119),(120,14,'ລະຄອນເພັງ',1,120),(121,14,'ວາປີ',1,121),(122,14,'ຄົງເຊໂດນ',1,122),(123,14,'ເຫຼົ່າງາມ',1,123),(124,14,'ສະມ້ວຍ',1,124),(125,15,'ລາມາມ',1,125),(126,15,'ກະເລິມ',1,126),(127,15,'ດັກຈຶງ',1,127),(128,15,'ທ່າແຕງ',1,128),(129,16,'ປາກເຊ',1,129),(130,16,'ສະນະສົມບູ',1,130),(131,16,'ບາຈຽງຈະເລ',1,131),(132,16,'ປາກຊ່ອງ',1,132),(133,16,'ປະທຸມພອນ',1,133),(134,16,'ໂພນທອງ',1,134),(135,16,'ຈຳປາສັກ',1,135),(136,16,'ສຸກຸມມາ',1,136),(137,16,'ມຸນລະປະໂມ',1,137),(138,16,'ໂຂງ',1,138),(139,17,'ໄຊເສດຖາ',1,139),(140,17,'ສາມະຄີໄຊ',1,140),(141,17,'ສະໜາມໄຊ',1,141),(142,17,'ສານໄຊ',1,142),(143,17,'ພູວົງ',1,143),(144,7,'ກວນ',1,144),(145,7,'ໍ​​ຊອນ',1,145);
/*!40000 ALTER TABLE `sis_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_document_type`
--

DROP TABLE IF EXISTS `sis_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_type_name` varchar(200) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_document_type`
--

LOCK TABLES `sis_document_type` WRITE;
/*!40000 ALTER TABLE `sis_document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_dormitory`
--

DROP TABLE IF EXISTS `sis_dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building_code` varchar(45) NOT NULL,
  `building_name` varchar(200) NOT NULL,
  `number_of_floor` int(11) NOT NULL DEFAULT '1',
  `room_per_floor` int(11) NOT NULL,
  `number_of_bath_room` int(11) DEFAULT NULL,
  `campus_id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `dormitory_type_id` int(11) DEFAULT NULL,
  `number_of_room` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_dormitory_sis_campus1_idx` (`campus_id`),
  KEY `fk_sis_dormitory_sis_faculty1_idx` (`faculty_id`),
  KEY `fk_sis_dormitory_sis_dormitory_type1_idx` (`dormitory_type_id`),
  CONSTRAINT `fk_sis_dormitory_sis_campus1` FOREIGN KEY (`campus_id`) REFERENCES `sis_campus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_dormitory_sis_dormitory_type1` FOREIGN KEY (`dormitory_type_id`) REFERENCES `sis_dormitory_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_dormitory_sis_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `sis_faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_dormitory`
--

LOCK TABLES `sis_dormitory` WRITE;
/*!40000 ALTER TABLE `sis_dormitory` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_dormitory_room`
--

DROP TABLE IF EXISTS `sis_dormitory_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_dormitory_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(45) NOT NULL,
  `room_name` varchar(200) NOT NULL,
  `room_fee` decimal(12,2) NOT NULL,
  `number_of_bed` int(10) unsigned NOT NULL,
  `dormitory_id` int(11) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_dormitory_room_sis_dormitory1_idx` (`dormitory_id`),
  KEY `fk_sis_dormitory_room_sis_room_type1_idx` (`room_type_id`),
  CONSTRAINT `fk_sis_dormitory_room_sis_dormitory1` FOREIGN KEY (`dormitory_id`) REFERENCES `sis_dormitory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_dormitory_room_sis_room_type1` FOREIGN KEY (`room_type_id`) REFERENCES `sis_room_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_dormitory_room`
--

LOCK TABLES `sis_dormitory_room` WRITE;
/*!40000 ALTER TABLE `sis_dormitory_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_dormitory_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_dormitory_room_view`
--

DROP TABLE IF EXISTS `sis_dormitory_room_view`;
/*!50001 DROP VIEW IF EXISTS `sis_dormitory_room_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_dormitory_room_view` AS SELECT 
 1 AS `id`,
 1 AS `room_number`,
 1 AS `room_name`,
 1 AS `room_fee`,
 1 AS `number_of_bed`,
 1 AS `dormitory_id`,
 1 AS `number_of_student`,
 1 AS `available_bed`,
 1 AS `building_code`,
 1 AS `building_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_name`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_course_code`,
 1 AS `campus_id`,
 1 AS `campus_name`,
 1 AS `room_type_id`,
 1 AS `type_description`,
 1 AS `type_eng_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_dormitory_type`
--

DROP TABLE IF EXISTS `sis_dormitory_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_dormitory_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_code` varchar(10) NOT NULL,
  `type_description` varchar(200) NOT NULL,
  `type_eng_description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_code_UNIQUE` (`type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_dormitory_type`
--

LOCK TABLES `sis_dormitory_type` WRITE;
/*!40000 ALTER TABLE `sis_dormitory_type` DISABLE KEYS */;
INSERT INTO `sis_dormitory_type` (`id`, `type_code`, `type_description`, `type_eng_description`) VALUES (1,'001','ຫໍພັກຊາຍ','Men Dormitory'),(2,'002','ຫໍພັກຍິງ','Women Dormitory'),(3,'003','ຫໍພັກພະນັກງານ','Staff Dormitory');
/*!40000 ALTER TABLE `sis_dormitory_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_entrance`
--

DROP TABLE IF EXISTS `sis_entrance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_entrance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entrance_name` varchar(60) NOT NULL,
  `academic_year` char(7) NOT NULL COMMENT 'e.g. 2012-13',
  `start_exam_date` date NOT NULL,
  `end_exam_date` date NOT NULL,
  `open_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'set to 1 to open (ONLY ONE RECORD OPENING AT A TIME), 0 to close.',
  `application_deadline` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `academic_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_year_UNIQUE` (`academic_year`),
  KEY `fk_sis_entrance_sis_academic_year1_idx` (`academic_year_id`),
  CONSTRAINT `fk_sis_entrance_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_entrance`
--

LOCK TABLES `sis_entrance` WRITE;
/*!40000 ALTER TABLE `sis_entrance` DISABLE KEYS */;
INSERT INTO `sis_entrance` (`id`, `entrance_name`, `academic_year`, `start_exam_date`, `end_exam_date`, `open_status`, `application_deadline`, `active`, `academic_year_id`) VALUES (8,'ສອບເສັງເຂົ້າ ມຊ ສົກຮຽນ 2018-19','2018-19','2018-08-05','2018-08-10',0,'2018-07-30',1,4);
/*!40000 ALTER TABLE `sis_entrance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_ethnic`
--

DROP TABLE IF EXISTS `sis_ethnic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ethnic_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ethnic_name_UNIQUE` (`ethnic_name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_ethnic`
--

LOCK TABLES `sis_ethnic` WRITE;
/*!40000 ALTER TABLE `sis_ethnic` DISABLE KEYS */;
INSERT INTO `sis_ethnic` (`id`, `ethnic_name`, `active`, `set_order`) VALUES (1,'ລາວລຸ່ມ',1,01),(2,'ລາວສູງ',1,02),(3,'ລາວເທິງ',1,03),(4,'ລາວ',1,04),(5,'ໄຕ',1,05),(6,'ຜູ້ໄທ',1,06),(7,'ລື້',1,07),(8,'ຍວນ',1,08),(9,'ຢັ້ງ',1,09),(10,'ແຊກ',1,10),(11,'ໄທເໜືອ',1,11),(12,'ກືມມຸ',1,12),(13,'ໄປຣ',1,13),(14,'ຊີງມູນ',1,14),(15,'ຜ້ອງ',1,15),(16,'ແທ່ນ',1,16),(17,'ເອີດູ',1,17),(18,'ບິດ',1,18),(19,'ລະເມດ',1,19),(20,'ສາມຕ່າວ',1,20),(21,'ກະຕາງ',1,21),(22,'ມະກອງ',1,22),(23,'ຕຣີ',1,23),(24,'ຢຣຸ',1,24),(25,'ຕຣຽງ',1,25),(26,'ຕະໂອ້ຍ',1,26),(27,'ແຢະ',1,27),(28,'ເບຣົາ',1,28),(29,'ກະຕູ',1,29),(30,'ຮາຣັກ',1,30),(31,'ໂອຍ',1,31),(32,'ກຣຽງ',1,32),(33,'ເຈັງ',1,33),(34,'ສະດາງ',1,34),(35,'ຊ່ວຍ',1,35),(36,'ຍະເຫີນ',1,36),(37,'ລະວີ',1,37),(38,'ປະໂກະ',1,38),(39,'ຂະແມ',1,39),(40,'ຕຸມ',1,40),(41,'ງວນ',1,41),(42,'ມ້ອຍ',1,42),(43,'ກຣີ',1,43),(44,'ອາຄາ',1,44),(45,'ພູນ້ອຍ',1,45),(46,'ລາຫູ',1,46),(47,'ສີລາ',1,47),(48,'ຮ່າຍີ',1,48),(49,'ໂລໂລ',1,49),(50,'ຫໍ້',1,50),(51,'ມົ້ງ',1,51),(52,'ອີວມຽນ',1,52);
/*!40000 ALTER TABLE `sis_ethnic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_exam_building`
--

DROP TABLE IF EXISTS `sis_exam_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_exam_building` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_site_id` int(11) NOT NULL,
  `building_code` varchar(45) NOT NULL,
  `building_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_exam_building_sis_exam_site1_idx` (`exam_site_id`),
  CONSTRAINT `fk_sis_exam_building_sis_exam_site1` FOREIGN KEY (`exam_site_id`) REFERENCES `sis_exam_site` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_exam_building`
--

LOCK TABLES `sis_exam_building` WRITE;
/*!40000 ALTER TABLE `sis_exam_building` DISABLE KEYS */;
INSERT INTO `sis_exam_building` (`id`, `exam_site_id`, `building_code`, `building_name`, `active`, `set_order`) VALUES (1,1,'01','ຕຶກ E',1,01),(2,1,'02','ຕຶກ B',1,02),(3,2,'01','ຕິກ ກ',1,01),(4,2,'02','ຕຶກ ນ',1,02),(5,3,'01','ຕຶກ 1',1,01);
/*!40000 ALTER TABLE `sis_exam_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_exam_room`
--

DROP TABLE IF EXISTS `sis_exam_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_exam_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_building_id` int(11) NOT NULL,
  `room_name` varchar(45) NOT NULL,
  `room_seat` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_exam_room_sis_exam_building1_idx` (`exam_building_id`),
  CONSTRAINT `fk_sis_exam_room_sis_exam_building1` FOREIGN KEY (`exam_building_id`) REFERENCES `sis_exam_building` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_exam_room`
--

LOCK TABLES `sis_exam_room` WRITE;
/*!40000 ALTER TABLE `sis_exam_room` DISABLE KEYS */;
INSERT INTO `sis_exam_room` (`id`, `exam_building_id`, `room_name`, `room_seat`, `active`, `set_order`) VALUES (1,1,'E-101',10,1,01),(2,1,'E-102',10,1,02),(3,1,'E-103',10,1,03),(4,2,'B-101',10,1,01),(5,2,'B-102',10,1,02),(6,2,'B-103',10,1,03),(7,3,'ກ-101',10,1,01),(8,3,'ກ-102',10,1,02),(9,3,'ກ-103',10,1,03),(10,4,'ນ-101',10,1,01),(11,4,'ນ-102',10,1,02),(12,4,'ນ-103',10,1,03),(13,5,'ຫ້ອງ 1/1',10,1,01),(14,5,'ຫ້ອງ 1/2',10,1,02);
/*!40000 ALTER TABLE `sis_exam_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_exam_site`
--

DROP TABLE IF EXISTS `sis_exam_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_exam_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  `curriculum_group_id` int(11) NOT NULL,
  `beginning_seat_no` varchar(5) DEFAULT NULL,
  `site_no` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_exam_site_sis_curriculum_group1_idx` (`curriculum_group_id`),
  CONSTRAINT `fk_sis_exam_site_sis_curriculum_group1` FOREIGN KEY (`curriculum_group_id`) REFERENCES `sis_curriculum_group` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_exam_site`
--

LOCK TABLES `sis_exam_site` WRITE;
/*!40000 ALTER TABLE `sis_exam_site` DISABLE KEYS */;
INSERT INTO `sis_exam_site` (`id`, `site_name`, `active`, `set_order`, `curriculum_group_id`, `beginning_seat_no`, `site_no`) VALUES (1,'ດົງໂດກ',1,01,1,NULL,'1'),(2,'ໂສກປ່າຫຼວງ',1,02,2,NULL,'2'),(3,'ມສ ວຽງຈັນ',1,01,3,NULL,'3');
/*!40000 ALTER TABLE `sis_exam_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_faculty`
--

DROP TABLE IF EXISTS `sis_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` varchar(120) NOT NULL,
  `faculty_eng_name` varchar(120) NOT NULL,
  `faculty_abbr` varchar(5) NOT NULL,
  `faculty_eng_abbr` varchar(5) NOT NULL,
  `faculty_course_code` char(1) NOT NULL,
  `is_faculty` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Disable if not faculty. Made for some offices that provide education service.',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  `code2` varchar(2) NOT NULL,
  `code4` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faculty_name_UNIQUE` (`faculty_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_faculty`
--

LOCK TABLES `sis_faculty` WRITE;
/*!40000 ALTER TABLE `sis_faculty` DISABLE KEYS */;
INSERT INTO `sis_faculty` (`id`, `faculty_name`, `faculty_eng_name`, `faculty_abbr`, `faculty_eng_abbr`, `faculty_course_code`, `is_faculty`, `active`, `set_order`, `code2`, `code4`) VALUES (1,'ຄະນະນິຕິສາດ-ລັດຖະສາດ','Faculty of Law and Political Sciences','ຄນລ','FLP','1',1,1,01,'8','8'),(2,'ຄະນະວິສະວະກຳສາດ','Faculty of Engineering','ຄວສ','FEN','2',1,1,02,'02','02'),(4,'ຄະ​ນະ​ສະ​ຖາ​ປັດ​ຕະ​ຍະ​ກຳສາດ','Faculty of Architecture','ຄ​ສ​ປ','FAR','5',1,1,145,'05','5'),(5,'ຄະ​ນະ​ວິ​ທະ​ຍາ​ສາດ​ສິ່ງ​ແວດ​ລ້ອມ','Faculty of Environment Science','ຄ​ສວ','FES','1',1,1,02,'ES','1012'),(6,'ຄະ​ນະ​ວິ​ທະ​ຍາ​ສາດ​ສັງ​ຄົມ','Faculty of Social','ຄ​ສ​ຄ','FOS','5',1,1,03,'FS','BSES'),(7,'ຄະ​ນະ​ເສດ​ຖ​ະ​ສາດ ແລະ ບໍ​ລິ​ຫານ​ທຸ​ລະ​ກິດ','Faculty of Economic and Management','ຄ​ສບ','FEB','6',1,1,06,'FB','FEBM'),(8,'ຄະນະວິທະຍາສາດປ່າໄມ້','Faculty of Forestry','ຄປມ','FOF','6',1,1,06,'6','6'),(9,'ຄະນະວິທະຍາສາດທຳມະຊາດ','Faculty of Natural Sciences','ຄວທ','FNS','9',1,1,09,'09','09'),(10,'ຄະນະອັກສອນສາດ','Faculty of Letter','ຄອສ','FOL','3',1,1,10,'10','10'),(11,'ຄະນະສຶກສາສາດ','Faculty of Education','ຄສສ','FOE','4',1,1,11,'11','11'),(12,'ຄະນະຊັບພະຍາກອນນໍ້າ','Faculty o f Water Resources ','ຄຊນ','FWR','7',1,1,12,'12','12'),(13,'ຄະນະກະເສດສາດ','Faculty of Agriculture','ຄກສ','FOA','9',1,1,13,'13','13'),(14,'ຄະນະວິທະຍາສາດການກິລາ','Faculty of Sport Sciences','ຄວກ','FSS','1',1,1,14,'14','14');
/*!40000 ALTER TABLE `sis_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_grade_letter`
--

DROP TABLE IF EXISTS `sis_grade_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_grade_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_letter` varchar(2) NOT NULL COMMENT 'e.g. A, B+',
  `description` varchar(45) NOT NULL,
  `eng_description` varchar(45) NOT NULL,
  `grade_point` decimal(3,2) NOT NULL DEFAULT '0.00',
  `is_calculated` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0 not calculate, 1 calculate',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_grade_letter`
--

LOCK TABLES `sis_grade_letter` WRITE;
/*!40000 ALTER TABLE `sis_grade_letter` DISABLE KEYS */;
INSERT INTO `sis_grade_letter` (`id`, `grade_letter`, `description`, `eng_description`, `grade_point`, `is_calculated`, `active`, `set_order`) VALUES (1,'A','ດີເລີດ','Excellent',4.00,1,1,01),(2,'B+','ດີຫຼາຍ','Very Good',3.50,1,1,02),(3,'B','ດີ','Good',3.00,1,1,03),(4,'C+','ດີພໍໃຊ້','Fairly Good',2.50,1,1,04),(5,'C','ພໍໃຊ້ໄດ້','Fair',2.00,1,1,05),(6,'D+','ອ່ອນ','Poor',1.50,1,1,06),(7,'D','ອ່ອນຫຼາຍ','Very Poor',1.00,1,1,07),(8,'F','ຕົກ','Fail',0.00,1,1,08),(9,'I','ບໍ່ສົມບູນ','Incomplete',0.00,0,1,09),(10,'S','ຜ່ານ','Satisfy',0.00,0,1,10),(11,'U','ບໍ່ຜ່ານ','Unsatisfy',0.00,0,1,11),(12,'T','ໂອນໄດ້','Transfer',0.00,0,1,12),(13,'W','ຖອນ','Withdraw',0.00,0,1,13),(14,'E','ຍົກເວັ້ນ','Except',0.00,0,1,14),(15,'O','ສືບຕໍ່','Continue',0.00,0,1,15),(16,'N','ລົງທະບຽນໃໝ່','New Enrolment',0.00,0,1,16);
/*!40000 ALTER TABLE `sis_grade_letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_graduated_year`
--

DROP TABLE IF EXISTS `sis_graduated_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_graduated_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `academic_year` char(7) NOT NULL COMMENT 'e.g. 2012-13',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `academic_year_UNIQUE` (`academic_year`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_graduated_year`
--

LOCK TABLES `sis_graduated_year` WRITE;
/*!40000 ALTER TABLE `sis_graduated_year` DISABLE KEYS */;
INSERT INTO `sis_graduated_year` (`id`, `academic_year`, `active`) VALUES (1,'2010-11',1),(2,'2011-12',1),(3,'2012-13',1),(4,'2013-14',1),(5,'2014-15',1),(6,'2015-16',1),(7,'2017-18',1);
/*!40000 ALTER TABLE `sis_graduated_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_marital_status`
--

DROP TABLE IF EXISTS `sis_marital_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marital_status_name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_marital_status`
--

LOCK TABLES `sis_marital_status` WRITE;
/*!40000 ALTER TABLE `sis_marital_status` DISABLE KEYS */;
INSERT INTO `sis_marital_status` (`id`, `marital_status_name`, `active`, `set_order`) VALUES (1,'Single',1,01),(2,'Married',1,02),(3,'Divorced',1,03);
/*!40000 ALTER TABLE `sis_marital_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_mass_born_level`
--

DROP TABLE IF EXISTS `sis_mass_born_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_mass_born_level` (
  `id` int(11) NOT NULL,
  `born_level_description` varchar(100) NOT NULL,
  `born_level_eng_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_mass_born_level`
--

LOCK TABLES `sis_mass_born_level` WRITE;
/*!40000 ALTER TABLE `sis_mass_born_level` DISABLE KEYS */;
INSERT INTO `sis_mass_born_level` (`id`, `born_level_description`, `born_level_eng_description`) VALUES (1,'ຊົນຊັ້ນກໍາມະກອນ','Laborer');
/*!40000 ALTER TABLE `sis_mass_born_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_mass_member_type`
--

DROP TABLE IF EXISTS `sis_mass_member_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_mass_member_type` (
  `id` int(11) NOT NULL COMMENT 'Student, Staff, Others',
  `type_description` varchar(100) NOT NULL,
  `type_eng_description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_mass_member_type`
--

LOCK TABLES `sis_mass_member_type` WRITE;
/*!40000 ALTER TABLE `sis_mass_member_type` DISABLE KEYS */;
INSERT INTO `sis_mass_member_type` (`id`, `type_description`, `type_eng_description`) VALUES (1,'ນັກສືກສາ','Student'),(2,'ພະນັກງານ','Staff');
/*!40000 ALTER TABLE `sis_mass_member_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_myappliedworkplace_view`
--

DROP TABLE IF EXISTS `sis_myappliedworkplace_view`;
/*!50001 DROP VIEW IF EXISTS `sis_myappliedworkplace_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_myappliedworkplace_view` AS SELECT 
 1 AS `id`,
 1 AS `title`,
 1 AS `description`,
 1 AS `amount`,
 1 AS `start_apply_date`,
 1 AS `end_apply_date`,
 1 AS `status`,
 1 AS `user_id`,
 1 AS `student_code`,
 1 AS `title_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `eng_first_name`,
 1 AS `eng_last_name`,
 1 AS `gender`,
 1 AS `birth_date`,
 1 AS `nationality_id`,
 1 AS `religion_id`,
 1 AS `marital_status_id`,
 1 AS `address_province_id`,
 1 AS `address_district_id`,
 1 AS `address_village_id`,
 1 AS `mobile_no`,
 1 AS `telephone_no`,
 1 AS `email_address`,
 1 AS `picture_file`,
 1 AS `faculty_id`,
 1 AS `curriculum_id`,
 1 AS `is_continuity_student`,
 1 AS `is_quota_student`,
 1 AS `is_disability`,
 1 AS `required_domitory`,
 1 AS `is_work_before_admission`,
 1 AS `emergency_contact_name`,
 1 AS `emergency_phone_no`,
 1 AS `emergency_province_id`,
 1 AS `emergency_district_id`,
 1 AS `emergency_village_id`,
 1 AS `student_status_id`,
 1 AS `created`,
 1 AS `latest_modified`,
 1 AS `citizen_id_card`,
 1 AS `household_book`,
 1 AS `invoice_template_id`,
 1 AS `arttached_files`,
 1 AS `statusapplied`,
 1 AS `applied_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_nationality`
--

DROP TABLE IF EXISTS `sis_nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(3) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_nationality`
--

LOCK TABLES `sis_nationality` WRITE;
/*!40000 ALTER TABLE `sis_nationality` DISABLE KEYS */;
INSERT INTO `sis_nationality` (`id`, `nationality_name`, `active`, `set_order`) VALUES (1,'Afghan',1,001),(2,'Albanian',1,002),(3,'Algerian',1,003),(4,'American',1,004),(5,'Andorran',1,005),(6,'Angolan',1,006),(7,'Antiguans',1,007),(8,'Argentinean',1,008),(9,'Armenian',1,009),(10,'Australian',1,010),(11,'Austrian',1,011),(12,'Azerbaijani',1,012),(13,'Bahamian',1,013),(14,'Bahraini',1,014),(15,'Bangladeshi',1,015),(16,'Barbadian',1,016),(17,'Barbudans',1,017),(18,'Batswana',1,018),(19,'Belarusian',1,019),(20,'Belgian',1,020),(21,'Belizean',1,021),(22,'Beninese',1,022),(23,'Bhutanese',1,023),(24,'Bolivian',1,024),(25,'Bosnian',1,025),(26,'Brazilian',1,026),(27,'British',1,027),(28,'Bruneian',1,028),(29,'Bulgarian',1,029),(30,'Burkinabe',1,030),(31,'Burmese',1,031),(32,'Burundian',1,032),(33,'Cambodian',1,033),(34,'Cameroonian',1,034),(35,'Canadian',1,035),(36,'Cape Verdean',1,036),(37,'Central African',1,037),(38,'Chadian',1,038),(39,'Chilean',1,039),(40,'Chinese',1,040),(41,'Colombian',1,041),(42,'Comoran',1,042),(43,'Congolese',1,043),(44,'Costa Rican',1,044),(45,'Croatian',1,045),(46,'Cuban',1,046),(47,'Cypriot',1,047),(48,'Czech',1,048),(49,'Danish',1,049),(50,'Djibouti',1,050),(51,'Dominican',1,051),(52,'Dutch',1,052),(53,'East Timorese',1,053),(54,'Ecuadorean',1,054),(55,'Egyptian',1,055),(56,'Emirian',1,056),(57,'Equatorial Guinean',1,057),(58,'Eritrean',1,058),(59,'Estonian',1,059),(60,'Ethiopian',1,060),(61,'Fijian',1,061),(62,'Filipino',1,062),(63,'Finnish',1,063),(64,'French',1,064),(65,'Gabonese',1,065),(66,'Gambian',1,066),(67,'Georgian',1,067),(68,'German',1,068),(69,'Ghanaian',1,069),(70,'Greek',1,070),(71,'Grenadian',1,071),(72,'Guatemalan',1,072),(73,'Guinea-Bissauan',1,073),(74,'Guinean',1,074),(75,'Guyanese',1,075),(76,'Haitian',1,076),(77,'Herzegovinian',1,077),(78,'Honduran',1,078),(79,'Hungarian',1,079),(80,'I-Kiribati',1,080),(81,'Icelander',1,081),(82,'Indian',1,082),(83,'Indonesian',1,083),(84,'Iranian',1,084),(85,'Iraqi',1,085),(86,'Irish',1,086),(87,'Israeli',1,087),(88,'Italian',1,088),(89,'Ivorian',1,089),(90,'Jamaican',1,090),(91,'Japanese',1,091),(92,'Jordanian',1,092),(93,'Kazakhstani',1,093),(94,'Kenyan',1,094),(95,'Kittian and Nevisian',1,095),(96,'Kuwaiti',1,096),(97,'Kyrgyz',1,097),(98,'Laotian',1,000),(99,'Latvian',1,099),(100,'Lebanese',1,100),(101,'Liberian',1,101),(102,'Libyan',1,102),(103,'Liechtensteiner',1,103),(104,'Lithuanian',1,104),(105,'Luxembourger',1,105),(106,'Macedonian',1,106),(107,'Malagasy',1,107),(108,'Malawian',1,108),(109,'Malaysian',1,109),(110,'Maldivan',1,110),(111,'Malian',1,111),(112,'Maltese',1,112),(113,'Marshallese',1,113),(114,'Mauritanian',1,114),(115,'Mauritian',1,115),(116,'Mexican',1,116),(117,'Micronesian',1,117),(118,'Moldovan',1,118),(119,'Monacan',1,119),(120,'Mongolian',1,120),(121,'Moroccan',1,121),(122,'Mosotho',1,122),(123,'Motswana',1,123),(124,'Mozambican',1,124),(125,'Namibian',1,125),(126,'Nauruan',1,126),(127,'Nepalese',1,127),(128,'New Zealander',1,128),(129,'Nicaraguan',1,129),(130,'Nigerian',1,130),(131,'Nigerien',1,131),(132,'North Korean',1,132),(133,'Northern Irish',1,133),(134,'Norwegian',1,134),(135,'Omani',1,135),(136,'Pakistani',1,136),(137,'Palauan',1,137),(138,'Panamanian',1,138),(139,'Papua New Guinean',1,139),(140,'Paraguayan',1,140),(141,'Peruvian',1,141),(142,'Polish',1,142),(143,'Portuguese',1,143),(144,'Qatari',1,144),(145,'Romanian',1,145),(146,'Russian',1,146),(147,'Rwandan',1,147),(148,'Saint Lucian',1,148),(149,'Salvadoran',1,149),(150,'Samoan',1,150),(151,'San Marinese',1,151),(152,'Sao Tomean',1,152),(153,'Saudi',1,153),(154,'Scottish',1,154),(155,'Senegalese',1,155),(156,'Serbian',1,156),(157,'Seychellois',1,157),(158,'Sierra Leonean',1,158),(159,'Singaporean',1,159),(160,'Slovakian',1,160),(161,'Slovenian',1,161),(162,'Solomon Islander',1,162),(163,'Somali',1,163),(164,'South African',1,164),(165,'South Korean',1,165),(166,'Spanish',1,166),(167,'Sri Lankan',1,167),(168,'Sudanese',1,168),(169,'Surinamer',1,169),(170,'Swazi',1,170),(171,'Swedish',1,171),(172,'Swiss',1,172),(173,'Syrian',1,173),(174,'Taiwanese',1,174),(175,'Tajik',1,175),(176,'Tanzanian',1,176),(177,'Thai',1,177),(178,'Togolese',1,178),(179,'Tongan',1,179),(180,'Trinidadian or Tobagonian',1,180),(181,'Tunisian',1,181),(182,'Turkish',1,182),(183,'Tuvaluan',1,183),(184,'Ugandan',1,184),(185,'Ukrainian',1,185),(186,'Uruguayan',1,186),(187,'Uzbekistani',1,187),(188,'Venezuelan',1,188),(189,'Vietnamese',1,189),(190,'Welsh',1,190),(191,'Yemenite',1,191),(192,'Zambian',1,192),(193,'Zimbabwean',1,193);
/*!40000 ALTER TABLE `sis_nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_open_curriculum_view`
--

DROP TABLE IF EXISTS `sis_open_curriculum_view`;
/*!50001 DROP VIEW IF EXISTS `sis_open_curriculum_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_open_curriculum_view` AS SELECT 
 1 AS `entrance_id`,
 1 AS `curriculum_id`,
 1 AS `faculty_id`,
 1 AS `quota`,
 1 AS `created_date_time`,
 1 AS `academic_year`,
 1 AS `start_exam_date`,
 1 AS `end_exam_date`,
 1 AS `open_status`,
 1 AS `application_deadline`,
 1 AS `department_id`,
 1 AS `curriculum_name`,
 1 AS `curriculum_eng_name`,
 1 AS `certificate_degree_id`,
 1 AS `certificate_title`,
 1 AS `certificate_eng_title`,
 1 AS `total_credit`,
 1 AS `curriculum_status_id`,
 1 AS `is_continuity`,
 1 AS `curriculum_course_code`,
 1 AS `total_year_study`,
 1 AS `curriculum_group_id`,
 1 AS `curriculum_group_name`,
 1 AS `curriculum_group_no`,
 1 AS `degree_name`,
 1 AS `degree_eng_name`,
 1 AS `faculty_name`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_course_code`,
 1 AS `is_faculty`,
 1 AS `applied_applicant`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_paid_status`
--

DROP TABLE IF EXISTS `sis_paid_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_paid_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_code` char(1) NOT NULL,
  `status_name` varchar(45) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `set_order` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_paid_status`
--

LOCK TABLES `sis_paid_status` WRITE;
/*!40000 ALTER TABLE `sis_paid_status` DISABLE KEYS */;
INSERT INTO `sis_paid_status` (`id`, `status_code`, `status_name`, `active`, `set_order`) VALUES (1,'A','Not Paid',1,1),(2,'B','Paid',1,2);
/*!40000 ALTER TABLE `sis_paid_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_prefer_semester`
--

DROP TABLE IF EXISTS `sis_prefer_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_prefer_semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) NOT NULL,
  `eng_description` varchar(200) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_prefer_semester`
--

LOCK TABLES `sis_prefer_semester` WRITE;
/*!40000 ALTER TABLE `sis_prefer_semester` DISABLE KEYS */;
INSERT INTO `sis_prefer_semester` (`id`, `description`, `eng_description`, `active`, `set_order`) VALUES (1,'ພາກຮຽນທີ 3','Semester 3',1,03),(2,'ພາກຮຽນທີ 1','Semester 1',1,01),(3,'ພາກຮຽນທີ 2','Semester 2',1,02);
/*!40000 ALTER TABLE `sis_prefer_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_prefer_study_view`
--

DROP TABLE IF EXISTS `sis_prefer_study_view`;
/*!50001 DROP VIEW IF EXISTS `sis_prefer_study_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_prefer_study_view` AS SELECT 
 1 AS `curriculum_id`,
 1 AS `course_id`,
 1 AS `prefer_year_id`,
 1 AS `prefer_semester_id`,
 1 AS `id`,
 1 AS `faculty_id`,
 1 AS `department_id`,
 1 AS `curriculum_name`,
 1 AS `curriculum_eng_name`,
 1 AS `certificate_degree_id`,
 1 AS `certificate_title`,
 1 AS `certificate_eng_title`,
 1 AS `total_credit`,
 1 AS `active`,
 1 AS `set_order`,
 1 AS `curriculum_status_id`,
 1 AS `is_continuity`,
 1 AS `curriculum_course_code`,
 1 AS `total_year_study`,
 1 AS `curriculum_group_id`,
 1 AS `curriculum_name_prefix`,
 1 AS `curriculum_eng_name_prefix`,
 1 AS `academic_year_id`,
 1 AS `department_course_code`,
 1 AS `department_name`,
 1 AS `department_eng_name`,
 1 AS `faculty_abbr`,
 1 AS `faculty_course_code`,
 1 AS `faculty_eng_abbr`,
 1 AS `faculty_eng_name`,
 1 AS `faculty_name`,
 1 AS `is_faculty`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `course_eng_name`,
 1 AS `credit`,
 1 AS `lecture_hour`,
 1 AS `lab_hour`,
 1 AS `practice_hour`,
 1 AS `description`,
 1 AS `course_status_id`,
 1 AS `course_abbr_name`,
 1 AS `is_shared`,
 1 AS `academic_year`,
 1 AS `academic_start_date`,
 1 AS `academic_end_date`,
 1 AS `admission_start_date`,
 1 AS `admission_end_date`,
 1 AS `is_open`,
 1 AS `next_admission_code`,
 1 AS `prefer_year_description`,
 1 AS `prefer_year_eng_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_province`
--

DROP TABLE IF EXISTS `sis_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `province_name_UNIQUE` (`province_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_province`
--

LOCK TABLES `sis_province` WRITE;
/*!40000 ALTER TABLE `sis_province` DISABLE KEYS */;
INSERT INTO `sis_province` (`id`, `province_name`, `active`, `set_order`) VALUES (1,'ນະຄອນຫຼວງວຽງຈັນ',1,01),(2,'ຜົ້ງສາລີ',1,02),(3,'ຫຼວງນໍ້າທາ',1,03),(4,'ອຸດົມໄຊ',1,04),(5,'ບໍ່ແກ້ວ',1,05),(6,'ຫຼວງພະບາງ',1,06),(7,'ຫົວພັນ',1,07),(8,'ໄຊຍະບູລີ',1,08),(9,'ຊຽງຂວາງ',1,09),(10,'ແຂວງວຽງຈັນ',1,10),(11,'ບໍລິຄຳໄຊ',1,11),(12,'ຄຳມ່ວນ',1,12),(13,'ສະຫວັນນະເຂດ',1,13),(14,'ສາລະວັນ',1,14),(15,'ເຊກອງ',1,15),(16,'ຈຳປາສັກ',1,16),(17,'ອັດຕະປື',1,17),(18,'ໄຊສົມບູນ',1,18);
/*!40000 ALTER TABLE `sis_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_religion`
--

DROP TABLE IF EXISTS `sis_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `religion_name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_religion`
--

LOCK TABLES `sis_religion` WRITE;
/*!40000 ALTER TABLE `sis_religion` DISABLE KEYS */;
INSERT INTO `sis_religion` (`id`, `religion_name`, `active`, `set_order`) VALUES (1,'Budism',1,01),(2,'Catholic',1,02);
/*!40000 ALTER TABLE `sis_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_room`
--

DROP TABLE IF EXISTS `sis_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) NOT NULL,
  `room_seat` smallint(5) unsigned NOT NULL,
  `building_id` int(11) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_building1_idx` (`building_id`),
  CONSTRAINT `fk_room_building1` FOREIGN KEY (`building_id`) REFERENCES `sis_building` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_room`
--

LOCK TABLES `sis_room` WRITE;
/*!40000 ALTER TABLE `sis_room` DISABLE KEYS */;
INSERT INTO `sis_room` (`id`, `room_name`, `room_seat`, `building_id`, `active`, `set_order`) VALUES (1,'1',20,2,1,01),(2,'2',20,2,1,02),(3,'3',30,2,1,03),(4,'212',30,3,1,01),(5,'2',20,3,1,02),(6,'3',30,3,1,03),(7,'1',30,4,1,01),(8,'2',20,4,1,02),(9,'3',20,4,1,03),(10,'107',30,5,1,01),(11,'101',35,6,1,01),(12,'102',20,6,1,02),(13,'103',20,6,1,03),(14,'104',20,6,1,04),(15,'201',20,6,1,04),(16,'202',20,6,1,05),(17,'203',20,6,1,06),(18,'101',25,8,1,01),(19,'102',30,8,1,02),(20,'103',20,8,1,03),(21,'104',35,8,1,04),(22,'105',35,8,1,05),(23,'101',35,12,1,02),(24,'201',25,9,1,01),(25,'202',25,9,1,02),(26,'X101',10,20,1,01),(27,'203',25,9,1,03),(28,'204',25,9,1,04),(29,'X102',10,20,1,02),(30,'205',25,9,1,05),(31,'X103',10,20,1,03),(32,'M101',10,22,1,04),(33,'X104',10,20,1,05),(34,'X105',10,20,1,06),(35,'M102',10,22,1,07),(36,'M103',10,22,1,08),(37,'M104',10,22,1,09),(38,'M105',10,22,1,10),(39,'107',35,12,1,03),(40,'108',30,12,1,04),(41,'109',35,12,1,04),(42,'109',25,12,1,06);
/*!40000 ALTER TABLE `sis_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_room_type`
--

DROP TABLE IF EXISTS `sis_room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_description` varchar(200) NOT NULL,
  `type_eng_description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_room_type`
--

LOCK TABLES `sis_room_type` WRITE;
/*!40000 ALTER TABLE `sis_room_type` DISABLE KEYS */;
INSERT INTO `sis_room_type` (`id`, `type_description`, `type_eng_description`) VALUES (1,'ຫ້ອງແອ','Room With AC'),(2,'ຫ້ອງພັດລົມ','Room With Fan');
/*!40000 ALTER TABLE `sis_room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_scolarship`
--

DROP TABLE IF EXISTS `sis_scolarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_scolarship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scholarship_name` varchar(255) NOT NULL,
  `scholarship_name_eng` varchar(255) NOT NULL,
  `active` enum('0','1') DEFAULT '1',
  `amount` int(10) unsigned DEFAULT '0',
  `sponsors_id` int(10) unsigned NOT NULL,
  `max_student` int(11) NOT NULL DEFAULT '0',
  `nb_student_assigned` int(10) unsigned NOT NULL DEFAULT '0',
  `sis_scolarship_payment_methode_id` int(10) unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_sis_scolarship_sis_sponsors1_idx` (`sponsors_id`),
  KEY `fk_sis_scolarship_sis_scolarship_payment_methode1_idx` (`sis_scolarship_payment_methode_id`),
  CONSTRAINT `fk_sis_scolarship_sis_scolarship_payment_methode1` FOREIGN KEY (`sis_scolarship_payment_methode_id`) REFERENCES `sis_scolarship_payment_methode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_scolarship_sis_sponsors1` FOREIGN KEY (`sponsors_id`) REFERENCES `sis_sponsors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_scolarship`
--

LOCK TABLES `sis_scolarship` WRITE;
/*!40000 ALTER TABLE `sis_scolarship` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_scolarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_scolarship_payment_methode`
--

DROP TABLE IF EXISTS `sis_scolarship_payment_methode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_scolarship_payment_methode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) NOT NULL,
  `payment_type_eng` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_type_UNIQUE` (`payment_type`),
  UNIQUE KEY `payment_type_eng_UNIQUE` (`payment_type_eng`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_scolarship_payment_methode`
--

LOCK TABLES `sis_scolarship_payment_methode` WRITE;
/*!40000 ALTER TABLE `sis_scolarship_payment_methode` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_scolarship_payment_methode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `sis_sec_view`
--

DROP TABLE IF EXISTS `sis_sec_view`;
/*!50001 DROP VIEW IF EXISTS `sis_sec_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `sis_sec_view` AS SELECT 
 1 AS `course_offer_id`,
 1 AS `section_max`,
 1 AS `section_enrol`,
 1 AS `section_available`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sis_section_template`
--

DROP TABLE IF EXISTS `sis_section_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_section_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sis_section_template_sis_academic_year1_idx` (`academic_year_id`),
  KEY `fk_sis_section_template_sis_curriculum1_idx` (`curriculum_id`),
  CONSTRAINT `fk_sis_section_template_sis_academic_year1` FOREIGN KEY (`academic_year_id`) REFERENCES `sis_academic_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sis_section_template_sis_curriculum1` FOREIGN KEY (`curriculum_id`) REFERENCES `sis_curriculum` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_section_template`
--

LOCK TABLES `sis_section_template` WRITE;
/*!40000 ALTER TABLE `sis_section_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_section_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_semester`
--

DROP TABLE IF EXISTS `sis_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `eng_description` varchar(45) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_semester`
--

LOCK TABLES `sis_semester` WRITE;
/*!40000 ALTER TABLE `sis_semester` DISABLE KEYS */;
INSERT INTO `sis_semester` (`id`, `description`, `eng_description`, `active`, `set_order`) VALUES (1,'ພາກຮຽນທີ 1','Semester 1',1,01),(2,'ພາກຮຽນທີ 2','Semester 2',1,02),(3,'ພາກຮຽນທີ 3','Semester 3',1,03);
/*!40000 ALTER TABLE `sis_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_sponsors`
--

DROP TABLE IF EXISTS `sis_sponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_sponsors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sponsor_name` varchar(255) NOT NULL,
  `sponsor_name_eng` varchar(255) NOT NULL,
  `active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_sponsors`
--

LOCK TABLES `sis_sponsors` WRITE;
/*!40000 ALTER TABLE `sis_sponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_sponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_student`
--

DROP TABLE IF EXISTS `sis_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_student` (
  `student_code` char(20) NOT NULL,
  `title_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `eng_first_name` varchar(100) NOT NULL,
  `eng_last_name` varchar(100) DEFAULT NULL,
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 Male, 1 Female',
  `birth_date` date NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `religion_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `address_province_id` int(11) NOT NULL,
  `address_district_id` int(11) NOT NULL,
  `address_village_id` int(11) NOT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `telephone_no` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `picture_file` varchar(100) DEFAULT NULL,
  `faculty_id` int(11) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `is_continuity_student` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_quota_student` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_disability` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `required_domitory` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_work_before_admission` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emergency_contact_name` varchar(200) NOT NULL,
  `emergency_phone_no` varchar(200) NOT NULL,
  `emergency_province_id` int(11) NOT NULL,
  `emergency_district_id` int(11) NOT NULL,
  `emergency_village_id` int(11) NOT NULL,
  `student_status_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `latest_modified` datetime DEFAULT NULL,
  `citizen_id_card` varchar(45) NOT NULL COMMENT 'required by bank',
  `household_book` varchar(200) NOT NULL COMMENT 'required by bank',
  `invoice_template_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`student_code`),
  KEY `fk_sis_student_sis_title1_idx` (`title_id`),
  KEY `fk_sis_student_sis_nationality1_idx` (`nationality_id`),
  KEY `fk_sis_student_sis_religion1_idx` (`religion_id`),
  KEY `fk_sis_student_sis_marital_status1_idx` (`marital_status_id`),
  KEY `fk_sis_student_sis_province1_idx` (`address_province_id`),
  KEY `fk_sis_student_sis_district1_idx` (`address_district_id`),
  KEY `fk_sis_student_sis_village1_idx` (`address_village_id`),
  KEY `fk_sis_student_sis_faculty1_idx` (`faculty_id`),
  KEY `fk_sis_student_sis_curriculum1_idx` (`curriculum_id`),
  KEY `fk_sis_student_sis_province2_idx` (`emergency_province_id`),
  KEY `fk_sis_student_sis_district2_idx` (`emergency_district_id`),
  KEY `fk_sis_student_sis_village2_idx` (`emergency_village_id`),
  KEY `fk_sis_student_sis_student_status1_idx` (`student_status_id`),
  CONSTRAINT `fk_student_curriculum1` FOREIGN KEY (`curriculum_id`) REFERENCES `sis_curriculum` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_district1` FOREIGN KEY (`address_district_id`) REFERENCES `sis_district` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_district2` FOREIGN KEY (`emergency_district_id`) REFERENCES `sis_district` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_faculty1` FOREIGN KEY (`faculty_id`) REFERENCES `sis_faculty` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_marital_status1` FOREIGN KEY (`marital_status_id`) REFERENCES `sis_marital_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_nationality1` FOREIGN KEY (`nationality_id`) REFERENCES `sis_nationality` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_province1` FOREIGN KEY (`address_province_id`) REFERENCES `sis_province` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_province2` FOREIGN KEY (`emergency_province_id`) REFERENCES `sis_province` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_religion1` FOREIGN KEY (`religion_id`) REFERENCES `sis_religion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_student_status1` FOREIGN KEY (`student_status_id`) REFERENCES `sis_student_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_title1` FOREIGN KEY (`title_id`) REFERENCES `sis_title` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_village1` FOREIGN KEY (`address_village_id`) REFERENCES `sis_village` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_student_village2` FOREIGN KEY (`emergency_village_id`) REFERENCES `sis_village` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_student`
--

LOCK TABLES `sis_student` WRITE;
/*!40000 ALTER TABLE `sis_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sis_student_bank`
--

DROP TABLE IF EXISTS `sis_student_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sis_student_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_code` tinyint(2) unsigned zerofill NOT NULL,
  `bank_name` varchar(200) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `set_order` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_code_UNIQUE` (`bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sis_student_bank`
--

LOCK TABLES `sis_student_bank` WRITE;
/*!40000 ALTER TABLE `sis_student_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `sis_student_bank` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_message`
--

LOCK TABLES `source_message` WRITE;
/*!40000 ALTER TABLE `source_message` DISABLE KEYS */;
INSERT INTO `source_message` (`id`, `category`, `message`) VALUES (1,'app','Branch Groups'),(2,'app','Create Branch Group'),(3,'app','ID'),(4,'app','Name'),(5,'app','Deleted'),(6,'app','Language'),(7,'app','Translation'),(8,'app','Messages'),(9,'app','Create Message'),(10,'app','Create'),(11,'app','Update {modelClass}: '),(12,'app','Update'),(13,'app','Message'),(14,'app','Action'),(15,'app','Incorrect Requested Params'),(16,'app','Cancel'),(17,'app','Add'),(18,'app','Success'),(19,'app','Error'),(20,'app','Operation Successful'),(21,'app','test'),(22,'app','tetas'),(23,'app','sdaf'),(24,'app','sfadfsdf'),(25,'app','xxx'),(26,'app','cc'),(27,'app','adasd'),(28,'app','ee'),(29,'app','eedd'),(30,'app','gg'),(32,'app','pp'),(33,'app','Branches'),(34,'app','Create Branch'),(35,'app','Code'),(36,'app','Address'),(37,'app','Tel'),(38,'app','Branch Group ID'),(39,'app','Goverment Unit'),(40,'app','Phiscal Years'),(41,'app','Create Phiscal Year'),(42,'app','Year'),(43,'app','Start Date'),(44,'app','End Date'),(45,'app','Status'),(46,'app','Closed'),(47,'app','Opening'),(48,'app','Delete'),(49,'app','Are you sure you want to delete this item?'),(50,'app','Operation Success'),(51,'app','Date'),(52,'app','Phiscal Year'),(53,'app','Administration'),(54,'app','Dashboard'),(55,'app','Ministry'),(56,'app','Ministry Group'),(57,'app','Goverment Level'),(58,'app','Govermentlevels'),(59,'app','Create Govermentlevel'),(60,'app','New'),(61,'app','Save'),(62,'app','List'),(63,'app','New/Update'),(64,'app','Select'),(65,'app','Total'),(66,'app','Rows'),(67,'app','Row(s)'),(68,'app','New/Save'),(69,'app','Successful'),(70,'app','NO'),(71,'app','YES'),(72,'app','USERNAME'),(73,'app','PASSWORD'),(74,'app','Branch ID'),(75,'app','Effective Date'),(76,'app','User ID'),(77,'app','Last Update'),(78,'app','Phiscal Year ID'),(79,'app','Statistics'),(80,'app','Goverment Units'),(81,'app','No.'),(82,'app','Remark'),(83,'app','Statistics of Goverment Unit '),(84,'app','Select Phiscal Year'),(85,'app','Incorrect Phiscal Year'),(86,'app','Go Back'),(87,'app','Owner'),(88,'app','Operation Successfule'),(89,'app','Saved'),(90,'app','Goverment Level ID'),(91,'app','Value'),(92,'app','Stat Goverment Unit ID'),(93,'app','No Data'),(101,'app','Group'),(102,'app','Department'),(103,'app','Insitute'),(104,'app','Center'),(105,'app','Institute'),(106,'app','Create Stat Goverment Unit'),(107,'app','Stat Goverment Units'),(108,'app','Stat Goverment Unit'),(109,'app','-'),(110,'app','Office'),(111,'app','Position'),(112,'app','Stat Single Gateway Implementations'),(113,'app','Statistics of Single Gateway Implementations'),(114,'app','Service Unit Name'),(115,'app','Statistics of Goverment Structure'),(116,'app','Ministries'),(117,'app','Single Gateway Implementations'),(118,'app','Legals'),(119,'app','Legal Type'),(120,'app','Legal'),(121,'app','The Year is not allowed to input'),(122,'app','Improve'),(123,'app','Publish'),(124,'app','Statistics of Internal Legal'),(125,'app','Legal Types'),(126,'app','Create Legal Type'),(127,'app','Create Legal'),(128,'app','Legal Type ID'),(131,'app','Dashboad'),(132,'app','Level'),(133,'app','Ministry ID'),(134,'app','Province ID'),(135,'app','Approver Level ID'),(136,'app','Approver Level'),(137,'app','approver'),(138,'app','Approvers'),(139,'app','Create Approver'),(140,'app','Approver Levels'),(141,'app','Create Approver Level'),(142,'app','Province'),(143,'app','Stat Association Foundation'),(144,'app','Settings'),(145,'app','Stat Association Foundations'),(146,'app','Statistics of Associations/Foundations'),(147,'app','Association'),(148,'app','Foundation'),(149,'app','Accociations'),(150,'app','Foundations'),(151,'app','Stat Local Administration'),(152,'app','Stat Local Admins'),(153,'app','Province Head'),(154,'app','Province Vice'),(155,'app','District Head'),(156,'app','District Vice'),(157,'app','T'),(158,'app','W'),(159,'app','Village Head'),(160,'app','Village Vice'),(161,'app','Population'),(162,'app','Village'),(163,'app','Family'),(164,'app','P'),(165,'app','Statistics of Local Administration'),(166,'app','Association Foundation'),(167,'app','Local Administration'),(168,'app','Religion Teacher'),(169,'app','Population Movement'),(170,'app','Stat Population Movements'),(171,'app','District'),(172,'app','Born'),(173,'app','Die'),(174,'app','Married'),(175,'app','Divorced'),(176,'app','Move-In'),(177,'app','Move-out'),(178,'app','Real'),(179,'app','Statistics of Population Movement'),(180,'app','Stat Religion Teachers'),(181,'app','Buddhism'),(182,'app','Monk'),(183,'app','Novice'),(184,'app','Buddhis Dad'),(185,'app','Buddhis Mom'),(186,'app','Buddhis Boy'),(187,'app','Christian'),(188,'app','Bahaiy'),(189,'app','Idslam'),(190,'app','News'),(191,'app','Saturday'),(192,'app','Catolic'),(193,'app','Statistics of Religion Teacher'),(194,'app','Comparations of Population Movement'),(195,'app','Inquiry'),(196,'app','Women'),(197,'app','The Chart of Population Movement Yearly'),(198,'app','Ethnic Statistic'),(199,'app','Ethic'),(200,'app','Stat Ethnics'),(201,'app','Enthnic'),(202,'app','Search'),(203,'app','Statistics of Ehtnics'),(204,'app','Ethnics'),(205,'app','Create Ethnic'),(206,'app','Ethnic'),(207,'app','Inccorect Request Method'),(208,'app','Religion & Other Believes'),(209,'app','Statistics of Religions & Other Believes'),(210,'app','Others'),(211,'app','Other'),(212,'app','The Chart of Religions & Other Believes'),(213,'app','Christ'),(214,'app','The Chart of Religions Teacher'),(215,'app','Religion Place'),(216,'app','Stat Religion Places'),(217,'app','Temple'),(218,'app','No Monk'),(219,'app','Sim'),(220,'app','No Sim'),(221,'app','Not'),(222,'app','N'),(223,'app','The Chart of Religions Places'),(224,'app','Statistics of Religion Place'),(225,'app','Bahai'),(226,'app','Officer'),(227,'app','Overall Officer'),(228,'app','Stat Officers'),(229,'app','Create Stat Officer'),(230,'app','Statistics of Officers'),(231,'app','Overall Officers'),(232,'app','Description'),(233,'app','No. of officers'),(234,'app','Men'),(235,'app','Ministry Level'),(236,'app','Local Level'),(237,'app','Province Department'),(238,'app','District Office'),(239,'app','Officers By Ages'),(240,'app','Stat Officer Ages'),(241,'app','Statistics of Officers By Ages'),(242,'app','Officers By Degrees'),(243,'app','Stat Officer Degrees'),(244,'app','Doctor'),(245,'app','Post Master'),(246,'app','Master'),(247,'app','Post Bachelor'),(248,'app','Bachelor'),(249,'app','High'),(250,'app','Middle'),(251,'app','Begin'),(252,'app','No Degree'),(253,'app','Retire'),(254,'app','Bumnet'),(255,'app','Leave'),(256,'app','Fire'),(257,'app','Resign'),(258,'app','Lose'),(259,'app','Move to SOE'),(260,'app','Moveto Ministry'),(261,'app','Move-In Ministry'),(262,'app','Officers Resignation'),(263,'app','Stat Officer Resigns'),(264,'app','Officers Add'),(265,'app','Stat Officer Adds'),(266,'app','Create Stat Officer Add'),(267,'app','Statistics of Officers Addition'),(268,'app','By Quota'),(269,'app','From Army'),(270,'app','From SOE'),(271,'app','Officers Addition'),(272,'app','Officers Contract'),(273,'app','Stat Officer Contracts'),(274,'app','Admin Approve'),(275,'app','Admin Non Approve'),(276,'app','Officer Approve'),(277,'app','Officer Non Approve'),(278,'app','Administration By Contract'),(279,'app','Officers By Contract'),(280,'app','Officers Approve'),(281,'app','Officers Non Approve'),(282,'app','Officers Positions'),(283,'app','Stat Officer Positions'),(284,'app','Statistics of Officers By Positions'),(285,'app','Statistics Officer Positions'),(286,'app','Officers Needed'),(287,'app','Stat Officer Needs'),(288,'app','Needed Plan'),(289,'app','Officers Ministry'),(290,'app','Stat Officer Ministries'),(293,'app','Organisation'),(294,'app','Organisations'),(295,'app','Create Organisation'),(296,'app','Officers Organisation'),(297,'app','Stat Officer Organisations'),(298,'app','Officers Province'),(299,'app','Stat Officer Provinces'),(300,'app','Officers Ministry Add'),(301,'app','Stat Officer Ministries Add/Resign'),(302,'app','Officers Organisation Add'),(303,'app','Stat Officer Organisations Add/Resign'),(308,'app','Officers Province Add'),(309,'app','Stat Officer Province Adds'),(310,'app','Create Stat Officer Province Add'),(311,'app','Stat Officer Provinces Add/Resign'),(312,'app','Officers Ministry Train'),(313,'app','Technical Trainning'),(314,'app','Theory Trainning'),(315,'app','Local'),(316,'app','Oversea'),(317,'app','Stat Officer Province Trains'),(318,'app','Create Stat Officer Province Train'),(319,'app','Add/Resign'),(320,'app','Training'),(321,'app','Officers Province Train'),(322,'app','Statistics of Tranining of Ministry Officers '),(330,'app','Officers Organisation Train'),(331,'app','Stat Officer Org Trains'),(332,'app','Create Stat Officer Org Train'),(333,'app','Statistics of Tranining of Province Officers '),(334,'app','Upgrade'),(335,'app','Officers Ministry Upgrade'),(336,'app','Officers Organisation Upgrade'),(337,'app','Officers Province Upgrade'),(338,'app','Statistics of Tranining of Organisation Officers '),(339,'app','Stat Officer Province Upgrades'),(340,'app','Create Stat Officer Province Upgrade'),(341,'app','Stat Officer Provinces Traning'),(342,'app','Stat Officer Provinces Upgrade'),(343,'app','Statistics of Upgrading of Province Officers '),(344,'app','The Chart of Officers Province Training'),(345,'app','Organisation Officer Upgrading'),(346,'app','Doctor Local'),(347,'app','Doctor Oversea'),(348,'app','Master Local'),(349,'app','Master Oversea'),(350,'app','Bachelor Local'),(351,'app','Bachelor Oversea'),(352,'app','High Local'),(353,'app','High Oversea'),(354,'app','Middle Local'),(355,'app','Middle Oversea'),(356,'app','Begin Local'),(357,'app','Begin Oversea'),(358,'app','Stat Course ID'),(359,'app','Course'),(360,'app','Stat Courses'),(361,'app','Create Stat Course'),(362,'app','Statistics of Officer Training Course Development'),(363,'app','Parent'),(364,'app','Table of statistic of officer training course'),(365,'app','Insitutution Training'),(366,'app','Stat Institute Trains'),(367,'app','Title'),(368,'app','Cooperator'),(369,'app','Times'),(370,'app','Place'),(371,'app','Statistics of Institution Training'),(372,'app','Attendance'),(374,'app','Insitutution Meeting'),(375,'app','Stat Institute Meetings'),(376,'app','Create Stat Institute Meeting'),(377,'app','Statistics of Institution Meeting'),(378,'app','The Chart of Officers Organisation Training'),(379,'app','Technical Local'),(380,'app','Technical Oversea'),(381,'app','Theory Local'),(382,'app','Theory Oversea'),(383,'app','Ministry Officer Upgrading'),(384,'app','Research'),(385,'app','Stat Researches'),(386,'app','Create Stat Research'),(387,'app','Stat Researchs'),(388,'app','Goverment'),(389,'app','Dornor'),(390,'app','Scholarship'),(391,'app','Attendee'),(392,'app','Statistics of Research'),(393,'app',''),(394,'app','Performance'),(395,'app','Stat Highcoin Ministries'),(396,'app','Create Stat Highcoin Ministry'),(398,'app','Awards'),(399,'app','Create Award'),(400,'app','Award'),(437,'app','Statistics of Highcoin Ministry'),(438,'app','Stat Hornorcoin Provinces'),(439,'app','Create Stat Hornorcoin Province'),(440,'app','Stat Hornorcoin Ministries'),(441,'app','Statistics of Hornor Coin Province'),(442,'app','Stat Victorycoin Ministries'),(443,'app','Stat Victorycoin Provinces'),(444,'app','Statistics of Highcoin Province'),(445,'app','Stat Govcoin Ministries'),(446,'app','Create Stat Govcoin Ministry'),(447,'app','Stat Goverment Coin Ministries'),(448,'app','Stat Victoryoversea Ministries'),(477,'app','Stat Victoryoversea Provinces'),(478,'app','Create Stat Victoryoversea Province'),(479,'app','Stat Goverment Oversea Ministries'),(480,'app','Statistics of Govoversea Ministry'),(481,'app','Stat Govcoin Provinces'),(482,'app','Create Stat Govcoin Province'),(483,'app','Stat Goverment Coin Provinces'),(484,'app','Statistics of GovCoin Province'),(485,'app','Stat Goverment Oversea Provinces'),(486,'app','Statistics of GovOversea Province'),(487,'app','Document'),(488,'app','Stat Documents'),(489,'app','Create Stat Document'),(490,'app','Section'),(491,'app','Book Type'),(492,'app','Books'),(493,'app','Create Book'),(500,'app','Bad Request'),(501,'app','Stat Copies'),(502,'app','Activity'),(503,'app','ໄລຍະເວລາຈັດຕັ້ງປະຕິບັດ'),(504,'app','Summary'),(505,'app','Stat Map Services'),(506,'app','Statistics of Map Service'),(507,'app','Stat Map Produces'),(508,'app','Stat Explores'),(514,'app','Officer Levels'),(515,'app','Create Officer Level'),(516,'app','Stat Officer Salaries'),(517,'app','Statistics of Officers by Salary Level'),(518,'app','Stat Officer Age Levels'),(519,'app','Create Stat Officer Age Level'),(520,'app','Statistics of Officers by Degree'),(521,'app','Stat Officer Ministries Upgrade'),(522,'app','The Chart of Officers Ministry Training'),(523,'app','ກົມພັດທະນາການບໍລິຫານລັດ'),(524,'app','ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງກາ'),(525,'app','ລາຍງານ'),(526,'app','ປ້ອນຂໍ້ມູນ'),(527,'app','ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສ'),(528,'app','ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ'),(529,'app','ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່າ'),(530,'app','ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ'),(531,'app','ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອ'),(532,'app','ກົມການປົກຄອງທ້ອງຖິ່ນ'),(533,'app','ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ,'),(534,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ'),(535,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລ'),(536,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວ'),(537,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມ'),(538,'app','ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າ'),(539,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ'),(540,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຕົວເມືອງ'),(541,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຊົນນະບົດ'),(542,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າ'),(543,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນຂັ້ນບ້ານ'),(544,'app','ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ'),(545,'app','ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄ'),(546,'app','ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ'),(547,'app','ຕາຕະລາງເກັບກຳສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ'),(548,'app','ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວແຂວງ'),(549,'app','ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວເມືອງ'),(550,'app','ກົມຄຸ້ມຄອງພົນລະເມືອງ'),(551,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ'),(552,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະ'),(553,'app','ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປ'),(554,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງ'),(555,'app','ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເ'),(556,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ..'),(557,'app','ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳ'),(558,'app','ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປ'),(559,'app','ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປ'),(560,'app','ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ'),(561,'app','ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອ'),(562,'app','ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ'),(563,'app','ກົມຄຸ້ມຄອງລັດຖະກອນ'),(564,'app','ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິ'),(565,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນ'),(566,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມວິຊາສະເພາະ'),(567,'app','ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ'),(568,'app','ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),(569,'app','ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານ'),(570,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບກ'),(571,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ'),(572,'app','ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ'),(573,'app','ຕາຕະລາງຈຳນວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ'),(574,'app','ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ'),(575,'app','ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ'),(576,'app','ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງກາ'),(577,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ'),(578,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາ'),(579,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່'),(580,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ'),(581,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ'),(582,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ'),(583,'app','ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເ'),(584,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສ'),(585,'app','ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮ'),(586,'app','ຕາຕະລາງສະຖິຕິສັງລວມການສ້າງ ແລະ ພັດທະນາຫຼັກສູດ'),(587,'app','ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູ'),(588,'app','ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາ'),(589,'app','ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ'),(590,'app','ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ'),(591,'app','ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝ'),(592,'app','ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະ'),(593,'app','ກົມສຳເນົາເອກະສານແຫ່ງຊາດ'),(594,'app','ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ'),(595,'app','ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ'),(596,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົ'),(597,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວ'),(598,'app','ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອ'),(599,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັ'),(600,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂ'),(601,'app','ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອ'),(602,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັ'),(603,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບ'),(604,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະ'),(605,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂ'),(606,'app','ກົມແຜນທີ່ແຫ່ງຊາດ'),(607,'app','ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......'),(608,'app','ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ'),(609,'app','ສະຖິຕິການຜະລິດແຜນທີ່'),(610,'app','ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່'),(611,'app','ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ'),(612,'app','ຫ້ອງການກະຊວງ'),(613,'app','ກົມແຜນການ ແລະ ການຮ່ວມມື'),(614,'app','ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທ'),(615,'app','ຕາຕະລາງສະຖິຕິການຮ່ວມມື'),(616,'app','ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ'),(617,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ'),(618,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາ'),(619,'app','ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ'),(620,'app','ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),(621,'app','ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫ'),(622,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບກ'),(623,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ'),(624,'app','ຈໍານວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ'),(625,'app','ຕາຕະລາງສັງລວມຊີວະປະຫວັດຫຍໍ້ຂອງພະນັກງານ'),(626,'app','ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍ'),(627,'app','ກົມກວດກາ'),(628,'app','ຜູ້ໃຊ້ລະບົບ'),(629,'app','ສິດແລະບົດບາດ'),(630,'app','ຕັ້ງຄ່າ'),(631,'app','Roles'),(632,'app','Create Role'),(633,'app','Input Dt Stamp'),(634,'app','ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)'),(635,'app','ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ'),(636,'app','ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ'),(637,'app','ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່'),(638,'app','ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອງກະຊວງ/ອົງການລັດທຽບເທົ່າກະຊວງ'),(639,'app','ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ, ເຈົ້າຄອງນະຄອນ ແລະ ຮອງເຈົ້າຄອງນະຄອນ'),(640,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົກຄອງແຂວງ'),(641,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລະ ອົງການທຽບເທົ່າ'),(642,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ'),(643,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມືອງ'),(644,'app','ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົຄອງເມືອງ'),(645,'app','ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ້ອງການ ແລະ ອົງການທຽບເທົ່າ'),(646,'app','ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າງ'),(647,'app','ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອໃນທົ່ວປະເທດ'),(648,'app','ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ ຄະນະຮັບຜິດຊອບສາສະໜາ'),(649,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະຈໍາປີ.......'),(650,'app','ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປະຈຳປີ.......'),(651,'app','ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເດືອນ....... ປະຈຳປີ ............'),(652,'app','ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ.......... ປະຈຳປີ .............'),(653,'app','ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .............'),(654,'app','ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ..........'),(655,'app','ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ...........'),(656,'app','ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .......'),(657,'app','ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .....'),(658,'app','ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳປີ ...........'),(659,'app','ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ສະເພາະຊັ້ນ VI)'),(660,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ແຕ່ຊັ້ນ I-V)'),(661,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ'),(662,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ່າງໆ'),(663,'app','ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຝຶກອົບຮົມຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(664,'app','ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຍົກລະດັບ (ໄປຮຽນຕໍ່) ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(665,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),(666,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),(667,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາຍໃນປະເທດ'),(668,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່າງປະເທດ'),(669,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ'),(670,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ'),(671,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ'),(672,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ'),(673,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)'),(674,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)'),(675,'app','ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),(676,'app','ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),(677,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),(678,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),(679,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),(680,'app','ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),(681,'app','ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ'),(682,'app','ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູນກາງ ແລະ ທ້ອງຖິ່ນ (ຕາມການສະເໜີ)'),(683,'app','ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາກອນຕາມການເຊື້ອເຊີນ'),(684,'app','ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ-ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ'),(685,'app','ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝຸດ'),(686,'app','ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະນັກງານ-ລັດຖະກອນ ພາຍໃນສະຖາບັນ'),(687,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ'),(688,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ'),(689,'app','ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),(690,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),(691,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),(692,'app','ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),(693,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),(694,'app','ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),(695,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),(696,'app','ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),(697,'app','ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ (ODA)'),(698,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ ..... ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ'),(699,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ'),(700,'app','ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),(701,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ'),(702,'app','ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ'),(703,'app','User Control'),(704,'app','Role Name'),(705,'app','Created Date Time'),(706,'app','New Record'),(707,'app','Menu Item(s)'),(708,'app','Aaction Item(s)'),(709,'app','ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ'),(710,'app','ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ'),(711,'app','ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ '),(712,'app','ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ'),(713,'app','ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ'),(714,'app','ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ'),(715,'app','ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ'),(716,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ'),(717,'app','ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ'),(718,'app','ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ'),(719,'app','ຈຳນວນພະນັກງານຕາມສັນຍາ'),(720,'app','ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),(721,'app','ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່'),(722,'app','ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ'),(723,'app','ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ'),(724,'app','ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ'),(725,'app','ສະຖິຕິການສັງລວມ ການສຳເນົາ'),(726,'app','ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),(727,'app','ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ'),(728,'app','ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ'),(729,'app','ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),(730,'app','ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),(731,'app','ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),(732,'app','ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),(733,'app','ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),(734,'app','ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),(735,'app','ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),(736,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V'),(737,'app','Inccorect Phiscal Year'),(738,'app','Womwn'),(739,'app','ພະ'),(740,'app','ຈົວ'),(741,'app','ພໍ່ຂາວ'),(742,'app','ແມ່ຂາວ'),(743,'app','ສັງກະລີ'),(744,'app','ປະເພດ'),(747,'app','Stat Officer Organisations Upgrade'),(748,'app','Statistics of Document Copy'),(749,'app','ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ'),(750,'app','ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ'),(751,'app','ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ'),(752,'app','ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ'),(753,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(754,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(755,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(756,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(757,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(758,'app','ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),(759,'app','ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ'),(760,'app','ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ'),(761,'app','ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),(762,'app','ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ'),(763,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ'),(764,'app','ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ'),(765,'app','ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),(766,'app','ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),(767,'app','ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ'),(768,'app','ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ'),(769,'app','ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ'),(770,'app','Stat Officer Ethnics'),(771,'app','Create Stat Officer Ethnic'),(772,'app','Stat Positions'),(773,'app','Create Stat Position'),(774,'app','Stat Officer News'),(775,'app','Create Stat Officer New'),(776,'app','ກົມ'),(777,'app','User Name'),(778,'app','First Name'),(779,'app','Last Name'),(780,'app','Telephone'),(781,'app','Email'),(782,'app','Role'),(783,'app','Input Date Time Stamp'),(784,'app','Plase select'),(785,'app','Add Role'),(786,'app','Add Record'),(787,'app','Action Item(s)'),(788,'app','Subordinate'),(789,'app','Selecct All'),(790,'app','Stat Odas'),(804,'app','Clear'),(805,'app','Inccorect Request'),(806,'app','Data Not Found'),(807,'app','Is Province'),(808,'app','Is Province Role'),(809,'app','Save Role'),(810,'app','Update Role'),(811,'app','Delete Role'),(812,'app','Subordinate(s)'),(813,'app','Department(s)'),(814,'app','Province(s)'),(815,'app','User List'),(816,'app','Select All'),(817,'app','Department List'),(818,'app','Data has been save success fully!'),(819,'app','Unauthorized'),(820,'app','HTTP Error 401 Unauthorized operation'),(821,'app','You are not authorized to access this page due to invalid authentication'),(822,'app','Please contact administrator'),(823,'app','ທັງໝົດ'),(824,'app','ບໍ່ອະນຸຍາດ'),(825,'app','HTTP Error 401- You are not authorized to access this operaton due to invalid authentication'),(826,'app','Subordinate List'),(827,'app','Province Code'),(828,'app','Province Name'),(829,'app','Record Status'),(830,'app','Input ID'),(831,'app','ລະຫັດ'),(832,'app','ຊື່ຜູ້ໃຊ້'),(833,'app','ລະຫດັຜ່ານ'),(834,'app','ຊື່ແທ້'),(835,'app','ນາມສະກຸນ'),(836,'app','ສະຖານະ'),(837,'app','ເບີໂທ'),(838,'app','ອີເມວ'),(839,'app','ລຶບ'),(840,'app','ສິດ ແລະ ໜ້າທີ່'),(841,'app','ແຂວງ'),(842,'app','Created Date'),(843,'app','Content'),(844,'app','Show'),(845,'app','Notices'),(846,'app','Create Notice'),(847,'app','Update Notice: {nameAttribute}'),(848,'app','Url'),(849,'app','Icon'),(850,'app','Menugroup ID'),(851,'app','Menu Parent ID'),(852,'app','Table Name'),(853,'app','Search:'),(854,'app','Search Keyword'),(855,'app','Display'),(856,'app','records'),(857,'app','per'),(858,'app','page'),(859,'app','Sorry , Nothing found'),(860,'app','Showing'),(861,'app','to'),(862,'app','of'),(863,'app','entries'),(864,'app','No records available'),(865,'app','filtered from'),(866,'app','total records'),(867,'app','First'),(868,'app','Last'),(869,'app','Previous'),(870,'app','Next'),(871,'app','Please enter a value for'),(872,'app','{attribute}'),(873,'app','Remembe Me'),(874,'app','ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ'),(875,'app',' is required'),(876,'app','Contents'),(877,'app','Create Content'),(878,'app','Update Content: {nameAttribute}'),(879,'app','Links'),(880,'app','Create Link'),(881,'app','Search keyword by static table name or department name'),(882,'app','Department Name'),(883,'app','Incorrect username or password.');
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
  KEY `fk_stat_association_foundation_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_association_foundation`
--

LOCK TABLES `stat_association_foundation` WRITE;
/*!40000 ALTER TABLE `stat_association_foundation` DISABLE KEYS */;
INSERT INTO `stat_association_foundation` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES (1,'2017-11-27 08:04:27',1,1,1);
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
  KEY `fk_stat_association_foundation_detail_approver1_idx` (`approver_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_association_foundation_detail`
--

LOCK TABLES `stat_association_foundation_detail` WRITE;
/*!40000 ALTER TABLE `stat_association_foundation_detail` DISABLE KEYS */;
INSERT INTO `stat_association_foundation_detail` (`id`, `association`, `foundation`, `remark`, `stat_association_foundation_id`, `approver_id`) VALUES (1,43,9,'',1,1),(2,23,1,'sdgkal',1,2),(3,6,4,'4',1,4),(4,2,3,NULL,1,3),(5,4,1,NULL,1,5);
/*!40000 ALTER TABLE `stat_association_foundation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_contract`
--

DROP TABLE IF EXISTS `stat_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_contract_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_contract_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_contract`
--

LOCK TABLES `stat_contract` WRITE;
/*!40000 ALTER TABLE `stat_contract` DISABLE KEYS */;
INSERT INTO `stat_contract` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-10-10 17:11:11',1,1,1);
/*!40000 ALTER TABLE `stat_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_contract_detail`
--

DROP TABLE IF EXISTS `stat_contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_contract_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_contract_id` int(11) NOT NULL,
  `officer_level_id` int(11) NOT NULL,
  `quota_manage_total` int(11) DEFAULT NULL,
  `quota_manage_women` int(11) DEFAULT NULL,
  `quota_technic_total` int(11) DEFAULT NULL,
  `quota_technic_women` int(11) DEFAULT NULL,
  `nonquota_manage_total` int(11) DEFAULT NULL,
  `nonquota_manage_women` int(11) DEFAULT NULL,
  `nonquota_technic_total` int(11) DEFAULT NULL,
  `nonquota_technic_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_contract_detail_stat_contract1_idx` (`stat_contract_id`),
  KEY `fk_stat_contract_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_contract_detail`
--

LOCK TABLES `stat_contract_detail` WRITE;
/*!40000 ALTER TABLE `stat_contract_detail` DISABLE KEYS */;
INSERT INTO `stat_contract_detail` (`id`, `stat_contract_id`, `officer_level_id`, `quota_manage_total`, `quota_manage_women`, `quota_technic_total`, `quota_technic_women`, `nonquota_manage_total`, `nonquota_manage_women`, `nonquota_technic_total`, `nonquota_technic_women`) VALUES (1,1,1,9,8,7,6,5,4,3,2),(2,1,2,99,88,77,66,55,44,33,22);
/*!40000 ALTER TABLE `stat_contract_detail` ENABLE KEYS */;
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
  KEY `fk_stat_copy_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_copy`
--

LOCK TABLES `stat_copy` WRITE;
/*!40000 ALTER TABLE `stat_copy` DISABLE KEYS */;
INSERT INTO `stat_copy` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-16 20:14:35',1,1,1);
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
  KEY `fk_stat_copy_detail_stat_copy1_idx` (`stat_copy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_copy_detail`
--

LOCK TABLES `stat_copy_detail` WRITE;
/*!40000 ALTER TABLE `stat_copy_detail` DISABLE KEYS */;
INSERT INTO `stat_copy_detail` (`id`, `stat_copy_id`, `activity`, `start_year`, `end_year`, `summary`, `remark`) VALUES (2,1,'ວຽກງານວິສຫວເັ',2015,2016,'fsklajfkjljk','sss'),(4,1,'ວຽກງານວິສຫວເັ',2015,2016,'fsklajfkjljk','sss');
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
  `saved` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_course_user1_idx` (`user_id`),
  KEY `fk_stat_course_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_course`
--

LOCK TABLES `stat_course` WRITE;
/*!40000 ALTER TABLE `stat_course` DISABLE KEYS */;
INSERT INTO `stat_course` (`id`, `saved`, `last_update`, `user_id`, `phiscal_year_id`) VALUES (32,1,'2018-01-05 16:00:30',1,1);
/*!40000 ALTER TABLE `stat_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_course_detail`
--

DROP TABLE IF EXISTS `stat_course_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_course_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_course_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_course_detail_stat_course1_idx` (`stat_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_course_detail`
--

LOCK TABLES `stat_course_detail` WRITE;
/*!40000 ALTER TABLE `stat_course_detail` DISABLE KEYS */;
INSERT INTO `stat_course_detail` (`id`, `stat_course_id`, `name`, `deleted`, `parent_id`, `position`) VALUES (13,32,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)',0,0,1),(14,32,'ຫຼັກສູດການບໍລິຫານລັດ',0,13,1),(15,32,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນໃໝ່',0,13,2),(16,32,'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນທີ່ (ທີ່ສຳເລັດ)',0,0,2),(17,32,'ຫຼັກສູດສຳລັບຜູ້ບໍລິຫານລະດັບສູງຂອງ ສປປ ລາວ ຮ່ວມມືກັບສະຖາບັນລັດຖະກອນສິງກະໂປ',0,0,3),(18,32,'ຫຼັກສູດການວາງແຜນ ງົບປະມານ ແລະ ການຄຸ້ມຄອງການເງິນ',0,16,1),(19,32,'ຫຼັກສູດການບໍລິຫານຫ້ອງການ',0,13,3),(20,32,'ຫຼັກສູດການເປັນຄູຝຶກທີ່ດີ',0,13,4),(21,32,'ຫຼັກສູດຝຶກອົບຮົມຜູ້ບໍລິຫານທົ່ວໄປ',0,16,2),(22,32,'ຫຼັກສູດການຮຽນຮູ້ການເປັນຜູ້ນໍາ ໂມດູນ 1 ແລະ 2',0,16,3),(23,32,'ຫຼັກສູດ 1A ຂ້ອຍຕ້ອງການນໍາພາ',0,17,1),(24,32,'ຫຼັກສູດ 1B ຂ້ອຍສາມາດປ່ຽນແປງ',0,17,2),(25,32,'ຫຼັກສູດ 2A ພວກເຮົາມີວິໄສທັດ',0,17,3),(26,32,'ຫຼັກສູດ 2B ພວກເຮົາສາມາດລິເລີ່ມ',0,17,4),(27,32,'ຫຼັກສູດ 3 ພວກເຮົາເຮັດວຽກຮ່ວມກັນ',0,17,5),(28,32,'ຫຼັກສູດຝຶກອົບຮົມ (ທີ່ກຳລັງດຳເນີນພັດທະນາ)',0,0,4),(29,32,'ຫຼັກສູດຄຸ້ມຄອງບຸກຄະລາກອນ',0,28,1);
/*!40000 ALTER TABLE `stat_course_detail` ENABLE KEYS */;
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
  KEY `fk_stat_document_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_document`
--

LOCK TABLES `stat_document` WRITE;
/*!40000 ALTER TABLE `stat_document` DISABLE KEYS */;
INSERT INTO `stat_document` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (2,'2017-09-16 19:15:29',1,1,1);
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
  KEY `fk_stat_document_detail_book1_idx` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_document_detail`
--

LOCK TABLES `stat_document_detail` WRITE;
/*!40000 ALTER TABLE `stat_document_detail` DISABLE KEYS */;
INSERT INTO `stat_document_detail` (`id`, `stat_document_id`, `province_id`, `ministry_id`, `organisation_id`, `book_id`, `before`, `after`, `after_new`, `remark`) VALUES (1,2,NULL,1,NULL,NULL,9,8,7,'af'),(2,2,NULL,NULL,1,NULL,1,2,3,'ok'),(3,2,NULL,NULL,2,NULL,3,4,5,'aa'),(4,2,1,NULL,NULL,NULL,11,22,33,'xasgd'),(5,2,2,NULL,NULL,NULL,66,77,88,'kko'),(6,2,NULL,NULL,NULL,1,7350,NULL,NULL,NULL),(7,2,NULL,NULL,NULL,2,NULL,2000,743,'afasf');
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
  KEY `fk_stat_ethnic_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_ethnic`
--

LOCK TABLES `stat_ethnic` WRITE;
/*!40000 ALTER TABLE `stat_ethnic` DISABLE KEYS */;
INSERT INTO `stat_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2018-02-21',1,1,1);
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
  KEY `fk_stat_ethnic_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_ethnic_detail`
--

LOCK TABLES `stat_ethnic_detail` WRITE;
/*!40000 ALTER TABLE `stat_ethnic_detail` DISABLE KEYS */;
INSERT INTO `stat_ethnic_detail` (`id`, `total`, `ethnic_id`, `stat_ethnic_id`, `women`, `province_id`) VALUES (1,6,1,1,4,1),(2,7,2,1,4,1),(3,2,3,1,1,1),(4,8,1,1,2,2),(5,2,4,1,1,4),(6,3,5,1,2,2);
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
  KEY `fk_stat_explore_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_explore`
--

LOCK TABLES `stat_explore` WRITE;
/*!40000 ALTER TABLE `stat_explore` DISABLE KEYS */;
INSERT INTO `stat_explore` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (2,'2017-11-28 03:32:26',1,1,1);
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
  KEY `fk_stat_explore_detail_stat_explore1_idx` (`stat_explore_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_explore_detail`
--

LOCK TABLES `stat_explore_detail` WRITE;
/*!40000 ALTER TABLE `stat_explore_detail` DISABLE KEYS */;
INSERT INTO `stat_explore_detail` (`id`, `province_id`, `stat_explore_id`, `mark`, `point`, `hm`, `km`, `remark`) VALUES (1,1,2,92,83,73,63,'ccc'),(2,2,2,1,2,3,4,'dada'),(3,3,2,1122,3344,5566,7788,'hhh');
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
  KEY `fk_stat_govcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_ministry`
--

LOCK TABLES `stat_govcoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_govcoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-16 11:26:57',1,1,1);
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
  KEY `fk_stat_govcoin_ministry_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_ministry_detail`
--

LOCK TABLES `stat_govcoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_govcoin_ministry_detail` (`id`, `stat_govcoin_ministry_id`, `ministry_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES (2,1,2,6,743,29,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,389,12,NULL);
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
  KEY `fk_stat_govcoin_province_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_province`
--

LOCK TABLES `stat_govcoin_province` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_province` DISABLE KEYS */;
INSERT INTO `stat_govcoin_province` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-16 15:47:14',1,1,1);
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
  KEY `fk_stat_govcoin_province_detail_stat_govcoin_province1_idx` (`stat_govcoin_province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govcoin_province_detail`
--

LOCK TABLES `stat_govcoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_govcoin_province_detail` DISABLE KEYS */;
INSERT INTO `stat_govcoin_province_detail` (`id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`, `award_id`, `province_id`, `stat_govcoin_province_id`) VALUES (1,99,88,77,66,55,44,33,22,11,1,2,3,'asf',2,1,1);
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
  KEY `fk_stat_goverment_unit_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_goverment_unit`
--

LOCK TABLES `stat_goverment_unit` WRITE;
/*!40000 ALTER TABLE `stat_goverment_unit` DISABLE KEYS */;
INSERT INTO `stat_goverment_unit` (`id`, `user_id`, `last_update`, `saved`, `phiscal_year_id`) VALUES (2,4,'2017-11-27 08:00:29',1,1),(3,1,'2017-09-02 08:55:24',0,2);
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
  KEY `fk_stat_goverment_unit_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_goverment_unit_detail`
--

LOCK TABLES `stat_goverment_unit_detail` WRITE;
/*!40000 ALTER TABLE `stat_goverment_unit_detail` DISABLE KEYS */;
INSERT INTO `stat_goverment_unit_detail` (`id`, `department`, `insitute`, `center`, `stat_goverment_unit_id`, `remark`, `office`, `ministry_id`) VALUES (1,11,22,33,2,'sss',NULL,0),(2,NULL,NULL,NULL,3,NULL,NULL,0),(3,32,2,3,2,'sags',NULL,0),(4,2,22,4,2,NULL,1,0),(5,1,2,3,2,NULL,3,0),(6,16,1,1,2,NULL,1,1),(7,11,0,1,2,NULL,1,2);
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
  KEY `fk_stat_govoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_ministry`
--

LOCK TABLES `stat_govoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_govoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-16 15:13:00',1,1,1);
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
  KEY `fk_stat_govoversea_ministry_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_ministry_detail`
--

LOCK TABLES `stat_govoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_ministry_detail` DISABLE KEYS */;
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
  KEY `fk_stat_govoversea_province_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_province`
--

LOCK TABLES `stat_govoversea_province` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_province` DISABLE KEYS */;
INSERT INTO `stat_govoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-16 15:56:38',1,1,1);
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
  KEY `fk_stat_govoversea_province_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_govoversea_province_detail`
--

LOCK TABLES `stat_govoversea_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_govoversea_province_detail` DISABLE KEYS */;
INSERT INTO `stat_govoversea_province_detail` (`id`, `stat_govoversea_province_id`, `province_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES (1,1,1,2,1,2,3,4,5,6,7,8,9,0,99,88,'າາ');
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
  KEY `fk_stat_highcoin_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highcoin_ministry`
--

LOCK TABLES `stat_highcoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_highcoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_highcoin_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (5,'2018-03-19 18:08:18',1,1,1);
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
  KEY `fk_stat_highcoin_ministry_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highcoin_ministry_detail`
--

LOCK TABLES `stat_highcoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_highcoin_ministry_detail` DISABLE KEYS */;
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
  KEY `fk_stat_highoversea_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highoversea_ministry`
--

LOCK TABLES `stat_highoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_highoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_highoversea_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-16 11:54:37',1,1,1);
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
  KEY `fk_stat_highoversea_ministry_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_highoversea_ministry_detail`
--

LOCK TABLES `stat_highoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_highoversea_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_highoversea_ministry_detail` (`id`, `stat_highoversea_ministry_id`, `ministry_id`, `award_id`, `gold_personal`, `gold_team`, `lanx_personal`, `lanx_team`, `hono_personal`, `hono_team`, `remark`) VALUES (1,1,1,2,9,8,7,6,5,4,'zxvz'),(2,1,1,3,6,5,4,3,2,1,'nmbmn');
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
  KEY `fk_stat_hornorcoin_province_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hornorcoin_province`
--

LOCK TABLES `stat_hornorcoin_province` WRITE;
/*!40000 ALTER TABLE `stat_hornorcoin_province` DISABLE KEYS */;
INSERT INTO `stat_hornorcoin_province` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES (1,1,1,'2017-09-16 07:23:53',1);
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
  KEY `fk_stat_hornorcoin_province_detail_stat_hornorcoin_province_idx` (`stat_hornorcoin_province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_hornorcoin_province_detail`
--

LOCK TABLES `stat_hornorcoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_hornorcoin_province_detail` DISABLE KEYS */;
INSERT INTO `stat_hornorcoin_province_detail` (`id`, `hero_personal`, `hero_team`, `knight_personal`, `knight_team`, `labor_personal`, `labor_team`, `dev_personal`, `dev_team`, `remark`, `province_id`, `award_id`, `stat_hornorcoin_province_id`) VALUES (1,8,7,6,5,4,3,2,1,'zzf',1,2,1),(2,3,4,5,6,7,8,9,0,'kjhfks',1,3,1);
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
  KEY `fk_stat_institute_meeting_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_meeting`
--

LOCK TABLES `stat_institute_meeting` WRITE;
/*!40000 ALTER TABLE `stat_institute_meeting` DISABLE KEYS */;
INSERT INTO `stat_institute_meeting` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-14 17:51:28',1,1,1);
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
  KEY `fk_stat_institute_meeting_detail_stat_institute_meeting1_idx` (`stat_institute_meeting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_meeting_detail`
--

LOCK TABLES `stat_institute_meeting_detail` WRITE;
/*!40000 ALTER TABLE `stat_institute_meeting_detail` DISABLE KEYS */;
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
  KEY `fk_stat_institute_train_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_train`
--

LOCK TABLES `stat_institute_train` WRITE;
/*!40000 ALTER TABLE `stat_institute_train` DISABLE KEYS */;
INSERT INTO `stat_institute_train` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (2,'2017-09-14 17:24:35',1,1,1);
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
  KEY `fk_stat_institute_train_detail_stat_institute_train1_idx` (`stat_institute_train_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_institute_train_detail`
--

LOCK TABLES `stat_institute_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_institute_train_detail` DISABLE KEYS */;
INSERT INTO `stat_institute_train_detail` (`id`, `stat_institute_train_id`, `title`, `total`, `women`, `start_date`, `end_date`, `cooperator`, `times`, `place`) VALUES (1,2,'k.shgalkj',7,6,'2017-09-05 00:00:00','2017-08-31 00:00:00','dasfs',23,'asdgs'),(2,2,'aaa',7,6,'2017-09-05 00:00:00','2017-08-31 00:00:00','dasfs',23,'asdgs');
/*!40000 ALTER TABLE `stat_institute_train_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_investment`
--

DROP TABLE IF EXISTS `stat_investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_investment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_investment_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_investment_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_investment`
--

LOCK TABLES `stat_investment` WRITE;
/*!40000 ALTER TABLE `stat_investment` DISABLE KEYS */;
INSERT INTO `stat_investment` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2018-01-06 16:40:48',1,1,1);
/*!40000 ALTER TABLE `stat_investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_investment_detail`
--

DROP TABLE IF EXISTS `stat_investment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_investment_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_investment_id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `implement` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_investment_detail_stat_investment1_idx` (`stat_investment_id`),
  KEY `fk_stat_investment_detail_project1_idx` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_investment_detail`
--

LOCK TABLES `stat_investment_detail` WRITE;
/*!40000 ALTER TABLE `stat_investment_detail` DISABLE KEYS */;
INSERT INTO `stat_investment_detail` (`id`, `stat_investment_id`, `place`, `description`, `implement`, `remark`, `project_id`, `deleted`) VALUES (2,1,'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່','ຈັດຊື້ອຸປະກອນເຄື່ອງມືສຳຫຼວດ ເຄື່ອງຮັບສັນຍານດາວທຽມ 3 ຊຸດ, ກ້ອງເກັບລາຍລະອຽດພື້ນທີ່ 2 ຊຸດ ກະແຈບັນຊາ (key)','2015-2017','ສຳລັບແຕ້ມແຜນທີ່ 1 ຊຸດ',1,0),(3,1,'ເຂື່ອນໄຟຟ້ານໍ້າເປີນ ເມືອງ ຫົວເມືອງ ແຂວງ ຫົວພັນ','ສຳຫຼວດວັດແທກ ແລພ ຄຳນວນຄິດໄລ່','8/9/2012','ຈຳນວນ 6 ຊຸດ',2,0),(4,1,'ເຂື່ອນໄຟຟ້າພະລັງງານລົມ ເມືອງ ບົວລະພາ ແຂວງ ຄຳມ່ວນ','ສຳຫຼວດວັດແທກແຜນທີ່ພູມສັນຖານ ມາດຕາສ່ວນ 1:2.000',NULL,'ແຜນທີ່ມາດຕາສ່ວນ 1:2000 = 24 ຮຕ',2,0),(5,1,'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່','ແຜນທີ່ຂໍ້ມູນຂ່າວສານພູມສາດ ມາດຕາສ່ວນ 1:10.000 ເທດສະບານ ເມືອງ ປາກຊັນ ແລະ ເມືອງ ສາລະວັນ','2014-2016','12 ຊຸດ = 60 ແຜ່ນ',3,0),(6,1,'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່','ກວດກາສ້ອມແປງ ແລະ ອອກໃບຢັ້ງຢືນອຸປະກອນເຄື່ອງມືສຳຫຼວດ','2014-2016','25 ເທື່ອຄັ້ງ',4,0),(7,1,'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່','ສ້າງແຜນທີ່ຂໍ້ມູນຂ່າວສານພູມສາດ ລະບົບດິຈິຕອນ ມາດຕາສ່ວນ 1:20,000 ນະຄອນຫຼວງວຽງຈັນ','2014-2017','593 ແຜນນໍ້າເບີ = 460 ກິໂລຕາແມັດ',5,0);
/*!40000 ALTER TABLE `stat_investment_detail` ENABLE KEYS */;
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
  KEY `fk_stat_legal_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_legal`
--

LOCK TABLES `stat_legal` WRITE;
/*!40000 ALTER TABLE `stat_legal` DISABLE KEYS */;
INSERT INTO `stat_legal` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES (20,'2018-02-21 18:12:33',1,1,1);
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
  KEY `fk_stat_legal_detail_legal1_idx` (`legal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_legal_detail`
--

LOCK TABLES `stat_legal_detail` WRITE;
/*!40000 ALTER TABLE `stat_legal_detail` DISABLE KEYS */;
INSERT INTO `stat_legal_detail` (`id`, `new`, `remark`, `improve`, `publish`, `stat_legal_id`, `legal_id`) VALUES (1,1,';lk;',0,'k.jnkl',20,1),(2,1,'',1,'25/13/2017',20,2),(3,1,'iuiyiu',1,'pop',20,3),(4,0,NULL,1,'19 ທັນວາ 2017',20,4),(5,1,'asasf',0,'a12asf',20,28);
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
  KEY `fk_stat_local_admin_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_local_admin`
--

LOCK TABLES `stat_local_admin` WRITE;
/*!40000 ALTER TABLE `stat_local_admin` DISABLE KEYS */;
INSERT INTO `stat_local_admin` (`id`, `last_update`, `user_id`, `saved`, `phiscal_year_id`) VALUES (8,'2017-10-19 01:54:38',1,1,1),(9,'2017-09-05 19:42:37',1,1,2);
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
  KEY `fk_stat_local_admin_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_local_admin_detail`
--

LOCK TABLES `stat_local_admin_detail` WRITE;
/*!40000 ALTER TABLE `stat_local_admin_detail` DISABLE KEYS */;
INSERT INTO `stat_local_admin_detail` (`id`, `stat_local_admin_id`, `province_id`, `province_head_total`, `province_head_women`, `province_vice_total`, `province_vice_women`, `district_head_total`, `district_head_women`, `district_vice_total`, `district_vice_women`, `village_head_total`, `village_head_women`, `village_vice_total`, `village_vice_women`, `population_total`, `population_women`, `village`, `family_total`, `family_poor`) VALUES (1,8,1,3,2,123,1,1,NULL,NULL,NULL,146,NULL,346,NULL,346,NULL,346,NULL,NULL),(2,9,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,8,13,2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,8,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,8,4,NULL,NULL,NULL,NULL,34,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,34,4),(6,8,3,8,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,8,6,23,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  KEY `fk_stat_map_produce_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_produce`
--

LOCK TABLES `stat_map_produce` WRITE;
/*!40000 ALTER TABLE `stat_map_produce` DISABLE KEYS */;
INSERT INTO `stat_map_produce` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-16 20:58:17',1,1,1);
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
  KEY `fk_stat_map_produce_detail_stat_map_produce1_idx` (`stat_map_produce_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_produce_detail`
--

LOCK TABLES `stat_map_produce_detail` WRITE;
/*!40000 ALTER TABLE `stat_map_produce_detail` DISABLE KEYS */;
INSERT INTO `stat_map_produce_detail` (`id`, `stat_map_produce_id`, `activity`, `amount`, `remark`) VALUES (2,1,'vvv',1111,'aaa');
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
  KEY `fk_stat_map_service_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_service`
--

LOCK TABLES `stat_map_service` WRITE;
/*!40000 ALTER TABLE `stat_map_service` DISABLE KEYS */;
INSERT INTO `stat_map_service` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-16 20:48:51',1,1,1);
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
  KEY `fk_stat_map_service_detail_stat_map_service1_idx` (`stat_map_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_map_service_detail`
--

LOCK TABLES `stat_map_service_detail` WRITE;
/*!40000 ALTER TABLE `stat_map_service_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_map_service_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_oda`
--

DROP TABLE IF EXISTS `stat_oda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_oda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_oda_user1_idx` (`user_id`),
  KEY `fk_stat_oda_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_oda`
--

LOCK TABLES `stat_oda` WRITE;
/*!40000 ALTER TABLE `stat_oda` DISABLE KEYS */;
INSERT INTO `stat_oda` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (3,'2018-01-09 01:54:53',1,1,1);
/*!40000 ALTER TABLE `stat_oda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_oda_detail`
--

DROP TABLE IF EXISTS `stat_oda_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_oda_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_oda_id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `free` int(11) DEFAULT NULL,
  `loan` int(11) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `receive` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_oda_detail_stat_oda1_idx` (`stat_oda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_oda_detail`
--

LOCK TABLES `stat_oda_detail` WRITE;
/*!40000 ALTER TABLE `stat_oda_detail` DISABLE KEYS */;
INSERT INTO `stat_oda_detail` (`id`, `stat_oda_id`, `code`, `name`, `start_year`, `end_year`, `amount`, `free`, `loan`, `organisation`, `receive`, `deleted`) VALUES (1,3,'eee','wet',2011,2012,1231414,1,NULL,'koida',24124,0),(2,3,'t3','51251',213,1241,3528,NULL,1,'aaa',3623,1),(3,3,'dhs','dhsd',234,234,456,NULL,1,'4324',435,1),(4,3,'jhb','dfhd',1245,2351,875837,NULL,1,'dhsdh',23532,1);
/*!40000 ALTER TABLE `stat_oda_detail` ENABLE KEYS */;
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
  KEY `fk_stat_officer_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer`
--

LOCK TABLES `stat_officer` WRITE;
/*!40000 ALTER TABLE `stat_officer` DISABLE KEYS */;
INSERT INTO `stat_officer` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-24 19:05:07',1,1,1);
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
  KEY `fk_stat_officer_add_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_add`
--

LOCK TABLES `stat_officer_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_add` DISABLE KEYS */;
INSERT INTO `stat_officer_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 10:42:23',1,1,1);
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
  KEY `fk_stat_officer_add_detail_stat_officer_add1_idx` (`stat_officer_add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_add_detail`
--

LOCK TABLES `stat_officer_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_add_detail` (`id`, `quota_total`, `quota_women`, `army_total`, `army_women`, `soe_total`, `soe_women`, `stat_officer_add_id`) VALUES (1,9,8,7,6,5,4,1);
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
  KEY `fk_stat_officer_age_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_age`
--

LOCK TABLES `stat_officer_age` WRITE;
/*!40000 ALTER TABLE `stat_officer_age` DISABLE KEYS */;
INSERT INTO `stat_officer_age` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-09 22:44:00',1,1,2),(2,'2017-09-09 22:44:11',1,1,1);
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
  KEY `fk_table1_stat_officer_age1_idx` (`stat_officer_age_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_age_detail`
--

LOCK TABLES `stat_officer_age_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_age_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_age_detail` (`id`, `stat_officer_age_id`, `total_u25`, `women_u25`, `total_25_30`, `women_25_30`, `total_31_35`, `women_31_35`, `total_36_40`, `women_36_40`, `total_41_45`, `women_41_45`, `total_46_50`, `women_46_50`, `total_51_55`, `women_51_55`, `total_56_60`, `women_56_60`, `total_61u`, `women_61u`) VALUES (1,1,999,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1),(2,2,99,88,77,66,55,44,33,22,11,9,84,7,6,5,4,3,2,1);
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
  KEY `fk_stat_officer_agelevel_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_agelevel`
--

LOCK TABLES `stat_officer_agelevel` WRITE;
/*!40000 ALTER TABLE `stat_officer_agelevel` DISABLE KEYS */;
INSERT INTO `stat_officer_agelevel` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (3,'2017-09-26 17:07:39',1,1,1);
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
  KEY `fk_stat_officer_agelevel_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_agelevel_detail`
--

LOCK TABLES `stat_officer_agelevel_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_agelevel_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_agelevel_detail` (`id`, `stat_officer_agelevel_id`, `officer_level_id`, `total_18`, `women_18`, `total_20`, `women_20`, `total_25`, `women_25`, `total_30`, `women_30`, `total_35`, `women_35`, `total_40`, `women_40`, `total_45`, `women_45`, `total_50`, `women_50`, `total_55`, `women_55`, `total_60`, `women_60`, `total_60p`, `women_60p`) VALUES (1,3,1,2,1,9,6,8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,3,2,8,5,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,3,8,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  KEY `fk_stat_officer_contract_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_contract`
--

LOCK TABLES `stat_officer_contract` WRITE;
/*!40000 ALTER TABLE `stat_officer_contract` DISABLE KEYS */;
INSERT INTO `stat_officer_contract` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-10 11:19:55',1,1,1);
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
  KEY `fk_stat_officer_contract_detail_stat_officer_contract1_idx` (`stat_officer_contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_contract_detail`
--

LOCK TABLES `stat_officer_contract_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_contract_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_contract_detail` (`id`, `stat_officer_contract_id`, `admin_approve_total`, `admin_approve_women`, `admin_non_total`, `admin_non_women`, `officer_approve_total`, `officer_approve_women`, `officer_non_total`, `officer_non_women`) VALUES (1,1,9,8,7,6,5,4,3,2);
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
  KEY `fk_stat_offcer_degree_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_degree`
--

LOCK TABLES `stat_officer_degree` WRITE;
/*!40000 ALTER TABLE `stat_officer_degree` DISABLE KEYS */;
INSERT INTO `stat_officer_degree` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 06:07:37',1,1,1);
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
  KEY `fk_stat_officer_degree_detail_stat_officer_degree1_idx` (`stat_officer_degree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_degree_detail`
--

LOCK TABLES `stat_officer_degree_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_degree_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_degree_detail` (`id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `no_total`, `no_women`, `stat_officer_degree_id`) VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1,1);
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
  KEY `fk_stat_officer_detail_stat_officer1_idx` (`stat_officer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_detail`
--

LOCK TABLES `stat_officer_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_detail` (`id`, `stat_officer_id`, `center_total`, `province_total`, `district_total`, `center_women`, `province_women`, `district_women`) VALUES (1,1,888,77,55,88,66,40);
/*!40000 ALTER TABLE `stat_officer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ethnic`
--

DROP TABLE IF EXISTS `stat_officer_ethnic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ethnic_user1_idx` (`user_id`),
  KEY `fk_stat_officer_ethnic_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ethnic`
--

LOCK TABLES `stat_officer_ethnic` WRITE;
/*!40000 ALTER TABLE `stat_officer_ethnic` DISABLE KEYS */;
INSERT INTO `stat_officer_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (9,'2017-10-01 14:34:48',1,1,1);
/*!40000 ALTER TABLE `stat_officer_ethnic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_ethnic_detail`
--

DROP TABLE IF EXISTS `stat_officer_ethnic_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_ethnic_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_ethnic_id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `officer_level_id` int(11) NOT NULL,
  `ethnic_id` int(11) NOT NULL,
  `women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ethnic_detail_stat_officer_ethnic1_idx` (`stat_officer_ethnic_id`),
  KEY `fk_stat_officer_ethnic_detail_officer_level1_idx` (`officer_level_id`),
  KEY `fk_stat_officer_ethnic_detail_ethnic1_idx` (`ethnic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ethnic_detail`
--

LOCK TABLES `stat_officer_ethnic_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ethnic_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ethnic_detail` (`id`, `stat_officer_ethnic_id`, `total`, `officer_level_id`, `ethnic_id`, `women`) VALUES (1,9,9,1,1,7),(2,9,4,1,7,1),(3,9,8,3,1,5);
/*!40000 ALTER TABLE `stat_officer_ethnic_detail` ENABLE KEYS */;
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
  KEY `fk_stat_officer_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry`
--

LOCK TABLES `stat_officer_ministry` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (3,'2017-09-10 18:08:54',1,1,1);
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
  KEY `fk_stat_officer_ministry_add_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_add`
--

LOCK TABLES `stat_officer_ministry_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_add` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-25 18:39:51',1,1,1);
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
  KEY `fk_stat_officer_ministry_add_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_add_detail`
--

LOCK TABLES `stat_officer_ministry_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_add_detail` (`id`, `stat_officer_ministry_add_id`, `add`, `resign`, `ministry_id`) VALUES (1,1,887,98,1),(2,1,987,876,2),(3,1,765,456,4),(4,1,70,60,5),(5,1,9,3,30),(6,1,555,444,42);
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
  KEY `fk_stat_officer_ministry_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_detail`
--

LOCK TABLES `stat_officer_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_detail` (`id`, `total`, `women`, `stat_officer_ministry_id`, `ministry_id`) VALUES (1,9,8,3,1),(2,7,6,3,2),(3,20,10,3,4),(4,17,14,3,5);
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
  KEY `fk_stat_officer_ministry_train_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_train`
--

LOCK TABLES `stat_officer_ministry_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_train` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (2,'2018-02-12 15:54:29',1,1,1);
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
  KEY `fk_stat_officer_ministry_train_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_train_detail`
--

LOCK TABLES `stat_officer_ministry_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_ministry_train_id`, `ministry_id`) VALUES (1,99,88,77,66,55,44,33,22,2,5),(2,77,66,55,44,33,22,11,5,2,2),(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,40),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,35),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,31),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,29),(8,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,26);
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
  KEY `fk_stat_officer_ministry_upgrade_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_upgrade`
--

LOCK TABLES `stat_officer_ministry_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-13 19:40:15',1,1,1);
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
  KEY `fk_stat_officer_ministry_upgrade_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_ministry_upgrade_detail`
--

LOCK TABLES `stat_officer_ministry_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_ministry_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_ministry_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_ministry_upgrade_id`, `ministry_id`) VALUES (1,100,NULL,77,66,55,44,33,22,11,9,8,7,6,5,4,3,2,1,999,888,777,666,555,444,1,1),(2,11,1,22,2,33,3,44,4,55,5,66,6,77,7,88,8,99,9,111,12,222,23,333,34,1,2),(3,99,9,88,8,77,7,66,6,55,5,44,4,33,3,22,2,11,1,12,2,13,3,14,4,1,4);
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
  KEY `fk_stat_officer_need_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_need`
--

LOCK TABLES `stat_officer_need` WRITE;
/*!40000 ALTER TABLE `stat_officer_need` DISABLE KEYS */;
INSERT INTO `stat_officer_need` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 12:35:21',1,1,1);
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
  KEY `fk_stat_officer_need_detail_stat_officer_need1_idx` (`stat_officer_need_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_need_detail`
--

LOCK TABLES `stat_officer_need_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_need_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_need_detail` (`id`, `center`, `province`, `district`, `stat_officer_need_id`) VALUES (1,9,8,7,1);
/*!40000 ALTER TABLE `stat_officer_need_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_new`
--

DROP TABLE IF EXISTS `stat_officer_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_new_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_new_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_new`
--

LOCK TABLES `stat_officer_new` WRITE;
/*!40000 ALTER TABLE `stat_officer_new` DISABLE KEYS */;
INSERT INTO `stat_officer_new` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-10-03 16:18:43',1,1,1);
/*!40000 ALTER TABLE `stat_officer_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_officer_new_detail`
--

DROP TABLE IF EXISTS `stat_officer_new_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_officer_new_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_new_id` int(11) NOT NULL,
  `officer_level_id` int(11) NOT NULL,
  `new_total` int(11) DEFAULT NULL,
  `ministry_total` int(11) DEFAULT NULL,
  `army_total` int(11) DEFAULT NULL,
  `soe_total` int(11) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  `need` int(11) DEFAULT NULL,
  `new_women` int(11) DEFAULT NULL,
  `ministry_women` int(11) DEFAULT NULL,
  `army_women` int(11) DEFAULT NULL,
  `soe_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_new_detail_stat_officer_new1_idx` (`stat_officer_new_id`),
  KEY `fk_stat_officer_new_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_new_detail`
--

LOCK TABLES `stat_officer_new_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_new_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_new_detail` (`id`, `stat_officer_new_id`, `officer_level_id`, `new_total`, `ministry_total`, `army_total`, `soe_total`, `quota`, `need`, `new_women`, `ministry_women`, `army_women`, `soe_women`) VALUES (1,1,1,9,7,5,3,1,0,8,6,4,2),(2,1,2,99,77,55,33,11,1,88,66,44,22),(3,1,3,11,22,33,44,55,5,1,2,3,4);
/*!40000 ALTER TABLE `stat_officer_new_detail` ENABLE KEYS */;
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
  KEY `fk_stat_officer_org_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_org`
--

LOCK TABLES `stat_officer_org` WRITE;
/*!40000 ALTER TABLE `stat_officer_org` DISABLE KEYS */;
INSERT INTO `stat_officer_org` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 18:31:41',1,1,1),(2,'2017-09-10 20:26:23',1,2,1);
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
  KEY `fk_stat_officer_org_detail_organisation1_idx` (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_org_detail`
--

LOCK TABLES `stat_officer_org_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_org_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_org_detail` (`id`, `total`, `women`, `stat_officer_org_id`, `organisation_id`) VALUES (1,11,1,1,1),(2,5,0,1,2),(3,8,7,2,1),(4,3,0,2,2);
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
  KEY `fk_stat_officer_organisation_add_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_add`
--

LOCK TABLES `stat_officer_organisation_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_add` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (3,'2017-09-11 18:18:39',1,1,1);
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
  KEY `fk_stat_officer_organisation_add_detail_organisation1_idx` (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_add_detail`
--

LOCK TABLES `stat_officer_organisation_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_add_detail` (`id`, `add`, `resign`, `stat_officer_organisation_add_id`, `organisation_id`) VALUES (1,888,77,3,1),(2,777,660,3,2);
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
  KEY `fk_stat_officer_organisation_train_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_train`
--

LOCK TABLES `stat_officer_organisation_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_train` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-13 18:30:00',1,1,1);
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
  KEY `fk_stat_officer_organisation_train_detail_organisation1_idx` (`organisation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_train_detail`
--

LOCK TABLES `stat_officer_organisation_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_organisation_train_id`, `organisation_id`) VALUES (1,9,8,7,6,5,4,3,2,1,1),(2,7,6,5,4,3,2,11,1,1,2);
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
  KEY `fk_stat_officer_organisation_upgrade_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_upgrade`
--

LOCK TABLES `stat_officer_organisation_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_upgrade` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-13 20:08:43',1,1,1);
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
  KEY `fk_stat_officer_organisation_upgrade_detail_stat_officer_or_idx` (`stat_officer_organisation_upgrade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_organisation_upgrade_detail`
--

LOCK TABLES `stat_officer_organisation_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_organisation_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_organisation_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `organisation_id`, `stat_officer_organisation_upgrade_id`) VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,65,4,3,2,1,0,11,1,22,2,33,3,1,1),(2,1,0,2,1,3,2,4,3,5,4,6,5,7,6,8,7,9,8,10,9,11,10,12,11,2,1);
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
  KEY `fk_stat_officer_position_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_position`
--

LOCK TABLES `stat_officer_position` WRITE;
/*!40000 ALTER TABLE `stat_officer_position` DISABLE KEYS */;
INSERT INTO `stat_officer_position` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 12:06:51',1,1,1);
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
  KEY `fk_stat_officer_position_detail_stat_officer_position1_idx` (`stat_officer_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_position_detail`
--

LOCK TABLES `stat_officer_position_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_position_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_position_detail` (`id`, `p1_total`, `p1_women`, `p2_total`, `p2_women`, `p3_total`, `p3_women`, `p4_total`, `p4_women`, `p5_total`, `p5_women`, `p6_total`, `p6_women`, `p7_total`, `p7_women`, `p8_total`, `p8_women`, `stat_officer_position_id`) VALUES (1,99,88,77,66,55,44,33,22,11,9,8,7,6,5,4,3,1);
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
  KEY `fk_stat_officer_province_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province`
--

LOCK TABLES `stat_officer_province` WRITE;
/*!40000 ALTER TABLE `stat_officer_province` DISABLE KEYS */;
INSERT INTO `stat_officer_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-25 18:37:17',1,1,1),(2,'2017-09-10 20:24:10',1,2,1);
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
  KEY `fk_stat_officer_province_add_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_add`
--

LOCK TABLES `stat_officer_province_add` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_add` DISABLE KEYS */;
INSERT INTO `stat_officer_province_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-11 18:48:06',1,1,1);
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
  KEY `fk_stat_officer_province_add_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_add_detail`
--

LOCK TABLES `stat_officer_province_add_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_add_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_add_detail` (`id`, `add`, `resign`, `stat_officer_province_add_id`, `province_id`) VALUES (1,88,19,1,1),(2,88,77,1,17),(3,77,66,1,16),(4,50,38,1,14),(5,81,48,1,2);
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
  KEY `fk_stat_officer_province_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_detail`
--

LOCK TABLES `stat_officer_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_detail` (`id`, `total`, `women`, `stat_officer_province_id`, `province_id`) VALUES (1,9,0,1,17),(2,8,1,1,1),(3,7,6,1,16),(4,10,2,1,15),(5,10,10,1,18),(6,9,9,1,5),(7,7,7,1,13),(8,9,9,2,1),(9,8,4,2,2),(10,8,4,1,4);
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
  KEY `fk_stat_officer_province_train_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_train`
--

LOCK TABLES `stat_officer_province_train` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_train` DISABLE KEYS */;
INSERT INTO `stat_officer_province_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (2,'2018-02-21 18:29:05',1,1,1);
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
  KEY `fk_stat_officer_province_train_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_train_detail`
--

LOCK TABLES `stat_officer_province_train_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_train_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `stat_officer_province_train_id`, `province_id`, `theo_out_total`, `theo_out_women`) VALUES (1,9,8,7,6,5,4,2,1,3,2),(2,NULL,NULL,NULL,NULL,NULL,NULL,2,2,NULL,NULL);
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
  KEY `fk_stat_officer_province_upgrade_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_upgrade`
--

LOCK TABLES `stat_officer_province_upgrade` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_upgrade` DISABLE KEYS */;
INSERT INTO `stat_officer_province_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-13 20:30:12',1,1,1);
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
  KEY `fk_stat_officer_province_upgrade_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_province_upgrade_detail`
--

LOCK TABLES `stat_officer_province_upgrade_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_province_upgrade_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_province_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_province_upgrade_id`, `province_id`) VALUES (1,66,55,44,33,22,11,99,88,77,7,6,5,4,3,2,1,112,12,223,23,334,34,445,45,1,1),(2,11,1,22,2,33,3,44,4,55,5,66,6,77,7,88,8,99,9,100,10,110,11,120,12,1,2);
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
  KEY `fk_stat_officer_resign_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_resign`
--

LOCK TABLES `stat_officer_resign` WRITE;
/*!40000 ALTER TABLE `stat_officer_resign` DISABLE KEYS */;
INSERT INTO `stat_officer_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-10 07:34:57',1,1,1),(2,'2017-09-10 07:58:15',1,2,1);
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
  KEY `fk_stat_officer_resign_detail_stat_officer_resign1_idx` (`stat_officer_resign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_resign_detail`
--

LOCK TABLES `stat_officer_resign_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_resign_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_resign_detail` (`id`, `stat_officer_resign_id`, `retire_total`, `bumnet_total`, `die_total`, `leave_total`, `fire_total`, `resign_total`, `lose_total`, `move_soe_total`, `moveto_ministry_total`, `movein_ministry_total`, `retire_women`, `bumnet_women`, `die_women`, `leave_women`, `fire_women`, `resign_women`, `lose_women`, `move_soe_women`, `moveto_ministry_women`, `movein_ministry_women`) VALUES (1,1,99,77,55,33,11,8,6,4,2,20,88,66,44,22,9,7,5,3,1,10),(2,2,9,7,5,3,111,88,66,44,22,100,8,6,4,2,99,77,55,33,11,89);
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
  KEY `fk_stat_officer_salary_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_salary`
--

LOCK TABLES `stat_officer_salary` WRITE;
/*!40000 ALTER TABLE `stat_officer_salary` DISABLE KEYS */;
INSERT INTO `stat_officer_salary` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (4,'2017-09-17 06:04:21',1,1,1);
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
  KEY `fk_stat_officer_salary_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_salary_detail`
--

LOCK TABLES `stat_officer_salary_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_salary_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_salary_detail` (`id`, `stat_officer_salary_id`, `level1_total`, `level1_women`, `level2_total`, `level2_women`, `level3_total`, `level3_women`, `level4_total`, `level4_women`, `level5_total`, `level5_women`, `level6_total`, `level6_women`, `level7_total`, `level7_women`, `level8_total`, `level8_women`, `level9_total`, `level9_women`, `level10_total`, `level10_women`, `level11_total`, `level11_women`, `level12_total`, `level12_women`, `level13_total`, `level13_women`, `level14_total`, `level14_women`, `level15_total`, `level15_women`, `officer_level_id`) VALUES (1,4,8,2,88,44,111,59,51,20,31,10,39,15,21,7,26,3,25,11,24,7,11,3,16,4,6,1,10,2,9,4,1),(2,4,26,13,139,77,128,51,65,33,59,28,37,12,30,5,35,7,30,7,14,3,13,1,9,2,12,2,7,0,10,1,2),(3,4,224,120,601,224,430,146,120,33,81,24,50,11,32,8,28,4,31,3,27,6,19,2,9,0,15,3,16,2,14,1,3);
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
  KEY `fk_stat_officer_technical_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_technical`
--

LOCK TABLES `stat_officer_technical` WRITE;
/*!40000 ALTER TABLE `stat_officer_technical` DISABLE KEYS */;
INSERT INTO `stat_officer_technical` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-18 15:44:08',1,1,1);
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
  KEY `fk_stat_officer_technical_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_officer_technical_detail`
--

LOCK TABLES `stat_officer_technical_detail` WRITE;
/*!40000 ALTER TABLE `stat_officer_technical_detail` DISABLE KEYS */;
INSERT INTO `stat_officer_technical_detail` (`id`, `stat_officer_technical_id`, `officer_level_id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `hischool_total`, `hischool_women`, `second_total`, `second_women`, `primary_total`, `primary_women`) VALUES (1,1,1,4,2,NULL,NULL,94,27,NULL,NULL,272,126,65,28,30,6,11,3,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,2,1,NULL,4,NULL,32,6,NULL,NULL,354,137,180,84,39,13,4,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL,NULL,9,1,18,6,788,237,603,260,236,68,43,15,NULL,NULL,NULL,NULL,NULL,NULL);
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
  KEY `fk_stat_population_movement_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_population_movement`
--

LOCK TABLES `stat_population_movement` WRITE;
/*!40000 ALTER TABLE `stat_population_movement` DISABLE KEYS */;
INSERT INTO `stat_population_movement` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (5,'2017-11-29 03:23:18',1,1,1),(6,'2017-09-07 19:08:17',1,2,1);
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
  KEY `fk_stat_population_movement_detail_stat_population_movement_idx` (`stat_population_movement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_population_movement_detail`
--

LOCK TABLES `stat_population_movement_detail` WRITE;
/*!40000 ALTER TABLE `stat_population_movement_detail` DISABLE KEYS */;
INSERT INTO `stat_population_movement_detail` (`id`, `district`, `village`, `population_total`, `population_women`, `born_total`, `born_women`, `die_total`, `die_women`, `married`, `divorce`, `movein_total`, `movein_women`, `moveout_total`, `moveout_women`, `real_total`, `real_women`, `province_id`, `stat_population_movement_id`) VALUES (1,9,481,826807,409961,7403,3708,1816,782,1874,502,4351,2147,2220,1096,831663,411726,1,5),(2,15,1022,969700,486600,9408,4872,4668,2375,3756,747,3488,1650,3879,2118,974049,488629,13,5),(3,35,3,35,2,55,5,22,3,33,1,33,4,43,4,44,6,1,6),(4,7,521,184593,90355,1475,779,431,186,263,45,697,308,1286,317,185048,92238,2,5),(5,5,367,181904,90146,2437,1187,527,225,1003,135,1173,609,671,375,184316,91342,3,5),(6,7,470,312108,155754,3019,1495,598,237,760,120,67,41,121,62,314475,156991,4,5),(7,5,255,178735,89270,4725,2425,819,300,625,242,1017,405,1081,720,183126,91080,5,5),(8,12,754,448653,218905,3066,1448,699,272,1125,136,1507,724,1282,636,451245,220169,6,5),(9,10,723,302792,148025,1547,785,445,196,409,39,293,157,594,290,301876,147595,7,5),(10,11,430,384399,186615,3390,1674,681,324,1131,242,956,456,678,318,387386,188103,8,5),(11,7,480,259362,127788,2836,1426,542,247,654,108,1195,619,775,432,262076,129154,9,5),(12,11,433,444973,220887,4242,2121,1125,491,1475,286,1730,875,1585,878,444863,222855,10,5),(13,7,291,288824,139850,3256,1595,802,242,1022,249,76,30,48,25,291371,141208,11,5),(14,10,574,408352,205522,3501,1848,710,295,1047,245,602,307,298,157,411447,207225,12,5),(15,8,579,410522,207206,2610,1361,686,298,728,155,1344,607,1094,519,407288,205393,14,5),(16,4,197,117367,58434,1771,862,217,53,196,51,804,505,400,97,119325,59651,15,5),(17,10,643,703896,359779,3997,1989,1773,567,1732,211,925,399,1185,412,700093,354157,16,5),(18,5,146,142958,72708,867,470,363,146,404,93,419,196,312,165,142856,71845,17,5),(19,5,93,88494,43512,2196,1172,255,103,241,32,676,367,301,185,90810,44763,18,5);
/*!40000 ALTER TABLE `stat_population_movement_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_position`
--

DROP TABLE IF EXISTS `stat_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_position_user1_idx` (`user_id`),
  KEY `fk_stat_position_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_position`
--

LOCK TABLES `stat_position` WRITE;
/*!40000 ALTER TABLE `stat_position` DISABLE KEYS */;
INSERT INTO `stat_position` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (2,'2017-10-01 16:09:21',1,1,1);
/*!40000 ALTER TABLE `stat_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_position_detail`
--

DROP TABLE IF EXISTS `stat_position_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_position_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position1_total` int(11) DEFAULT NULL,
  `position1_women` int(11) DEFAULT NULL,
  `position2_total` int(11) DEFAULT NULL,
  `position2_women` int(11) DEFAULT NULL,
  `position3_total` int(11) DEFAULT NULL,
  `position3_women` int(11) DEFAULT NULL,
  `position4_total` int(11) DEFAULT NULL,
  `position4_women` int(11) DEFAULT NULL,
  `position5_total` int(11) DEFAULT NULL,
  `position5_women` int(11) DEFAULT NULL,
  `position6_total` int(11) DEFAULT NULL,
  `position6_women` int(11) DEFAULT NULL,
  `position7_total` int(11) DEFAULT NULL,
  `position7_women` int(11) DEFAULT NULL,
  `position8_total` int(11) DEFAULT NULL,
  `position8_women` int(11) DEFAULT NULL,
  `officer_level_id` int(11) NOT NULL,
  `stat_position_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_position_detail_officer_level1_idx` (`officer_level_id`),
  KEY `fk_stat_position_detail_stat_position1_idx` (`stat_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_position_detail`
--

LOCK TABLES `stat_position_detail` WRITE;
/*!40000 ALTER TABLE `stat_position_detail` DISABLE KEYS */;
INSERT INTO `stat_position_detail` (`id`, `position1_total`, `position1_women`, `position2_total`, `position2_women`, `position3_total`, `position3_women`, `position4_total`, `position4_women`, `position5_total`, `position5_women`, `position6_total`, `position6_women`, `position7_total`, `position7_women`, `position8_total`, `position8_women`, `officer_level_id`, `stat_position_id`) VALUES (1,9,5,4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2),(2,8,6,4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2);
/*!40000 ALTER TABLE `stat_position_detail` ENABLE KEYS */;
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
  KEY `fk_stat_religion_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion`
--

LOCK TABLES `stat_religion` WRITE;
/*!40000 ALTER TABLE `stat_religion` DISABLE KEYS */;
INSERT INTO `stat_religion` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (3,'2017-12-13 03:53:08',1,1,1);
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
  KEY `fk_stat_religion_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_detail`
--

LOCK TABLES `stat_religion_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_detail` (`id`, `buddhis_total`, `buddhis_women`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `other_total`, `other_women`, `remark`, `stat_religion_id`, `province_id`) VALUES (1,779505,404206,8568,4345,725,264,1251,669,192,85,68,29,NULL,NULL,'',3,1),(2,127286,66247,2840,1934,37,NULL,663,228,NULL,NULL,NULL,NULL,12132,5608,'',3,17),(3,769581,390466,18510,9708,NULL,NULL,2224,1121,35,20,NULL,NULL,48871,23833,NULL,3,13),(4,20,2,5,2,8,1,20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,5),(5,54283,27188,1765,835,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,120392,58611,NULL,3,2),(6,37936,18302,1130,570,141,78,NULL,NULL,NULL,NULL,NULL,NULL,143194,72836,NULL,3,3),(7,78517,40396,3752,1986,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,226167,110232,NULL,3,4),(8,181213,89571,5839,2896,855,421,3319,1607,NULL,NULL,NULL,NULL,251819,123442,NULL,3,6),(9,84123,42025,600,294,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,222846,110053,NULL,3,7),(10,279346,135213,2511,1309,187,105,862,441,NULL,NULL,NULL,NULL,104480,51035,NULL,3,8),(11,124330,56762,4110,2178,750,435,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'66721',3,9),(12,270793,135715,15472,7861,94,46,5108,2404,NULL,NULL,NULL,NULL,166556,77164,NULL,3,10),(13,201722,100966,8958,4412,450,244,6110,2518,15,8,NULL,NULL,71734,38638,NULL,3,11),(14,377089,190057,283,168,73,40,9017,4611,NULL,NULL,NULL,NULL,24985,12349,NULL,3,12),(15,308601,158663,2241,1161,208,112,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,14),(16,37246,20696,608,335,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,81471,38620,NULL,3,15),(17,NULL,NULL,3554,1790,17188,8642,141,81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,16),(18,127286,66247,2840,1934,37,NULL,663,228,NULL,NULL,NULL,NULL,12132,5608,NULL,3,18);
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
  KEY `fk_stat_religion_place_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_place`
--

LOCK TABLES `stat_religion_place` WRITE;
/*!40000 ALTER TABLE `stat_religion_place` DISABLE KEYS */;
INSERT INTO `stat_religion_place` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-09 19:21:20',1,1,1);
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
  KEY `fk_stat_religion_place_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_place_detail`
--

LOCK TABLES `stat_religion_place_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_place_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_place_detail` (`id`, `buddhis_total`, `buddhis_nomonk`, `buddhis_nosim`, `buddhis_sim`, `christ_news_total`, `christ_news_not`, `christ_sat_total`, `christ_sat_not`, `christ_cato_total`, `christ_cato_not`, `bahai_total`, `bahai_not`, `idslam_total`, `idslam_not`, `remark`, `stat_religion_place_id`, `province_id`) VALUES (1,99,88,66,77,55,44,33,22,11,9,8,7,6,5,'kjk',1,16),(2,77,70,4,3,33,22,11,9,8,7,6,5,4,3,'jhafjskdgh',1,1);
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
  KEY `fk_stat_religion_teacher_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_teacher`
--

LOCK TABLES `stat_religion_teacher` WRITE;
/*!40000 ALTER TABLE `stat_religion_teacher` DISABLE KEYS */;
INSERT INTO `stat_religion_teacher` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-12-13',1,1,1);
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
  KEY `fk_stat_religion_teacher_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_religion_teacher_detail`
--

LOCK TABLES `stat_religion_teacher_detail` WRITE;
/*!40000 ALTER TABLE `stat_religion_teacher_detail` DISABLE KEYS */;
INSERT INTO `stat_religion_teacher_detail` (`id`, `stat_religion_teacher_id`, `buddhis_monk`, `buddhis_novice`, `buddhis_dad`, `buddhis_mom`, `buddhis_boy`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `province_id`, `remark`) VALUES (1,1,112770,3712,5,213,215,24,3,4,1,6,2,NULL,NULL,2,NULL,1,''),(2,1,214,585,NULL,1,1,2840,1934,37,NULL,269,138,NULL,NULL,NULL,NULL,17,''),(3,1,53,540,NULL,NULL,NULL,1136,571,141,78,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL),(4,1,52,130,NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL);
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
  KEY `fk_stat_research_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_research`
--

LOCK TABLES `stat_research` WRITE;
/*!40000 ALTER TABLE `stat_research` DISABLE KEYS */;
INSERT INTO `stat_research` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2018-03-19 17:44:13',1,1,1);
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
  KEY `fk_stat_research_detail_stat_research1_idx` (`stat_research_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_research_detail`
--

LOCK TABLES `stat_research_detail` WRITE;
/*!40000 ALTER TABLE `stat_research_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat_research_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_resign`
--

DROP TABLE IF EXISTS `stat_resign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_resign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_resign_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_resign_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_resign`
--

LOCK TABLES `stat_resign` WRITE;
/*!40000 ALTER TABLE `stat_resign` DISABLE KEYS */;
INSERT INTO `stat_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-10-10 15:36:58',1,1,1);
/*!40000 ALTER TABLE `stat_resign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat_resign_detail`
--

DROP TABLE IF EXISTS `stat_resign_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stat_resign_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `retire_total` int(11) DEFAULT NULL,
  `retire_women` int(11) DEFAULT NULL,
  `bumnet_total` int(11) DEFAULT NULL,
  `bumnet_women` int(11) DEFAULT NULL,
  `stat_resign_id` int(11) NOT NULL,
  `die_total` int(11) DEFAULT NULL,
  `die_women` int(11) DEFAULT NULL,
  `officer_level_id` int(11) NOT NULL,
  `leave_total` int(11) DEFAULT NULL,
  `leave_women` int(11) DEFAULT NULL,
  `fire_total` int(11) DEFAULT NULL,
  `fire_women` int(11) DEFAULT NULL,
  `resign_total` int(11) DEFAULT NULL,
  `resign_women` int(11) DEFAULT NULL,
  `lose_total` int(11) DEFAULT NULL,
  `lose_women` int(11) DEFAULT NULL,
  `army_total` int(11) DEFAULT NULL,
  `army_women` int(11) DEFAULT NULL,
  `ministry_total` int(11) DEFAULT NULL,
  `ministry_women` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_resign_detail_stat_resign1_idx` (`stat_resign_id`),
  KEY `fk_stat_resign_detail_officer_level1_idx` (`officer_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_resign_detail`
--

LOCK TABLES `stat_resign_detail` WRITE;
/*!40000 ALTER TABLE `stat_resign_detail` DISABLE KEYS */;
INSERT INTO `stat_resign_detail` (`id`, `retire_total`, `retire_women`, `bumnet_total`, `bumnet_women`, `stat_resign_id`, `die_total`, `die_women`, `officer_level_id`, `leave_total`, `leave_women`, `fire_total`, `fire_women`, `resign_total`, `resign_women`, `lose_total`, `lose_women`, `army_total`, `army_women`, `ministry_total`, `ministry_women`) VALUES (1,99,88,77,66,1,55,44,1,33,22,11,1,22,2,33,3,44,4,55,5),(2,99,9,88,8,1,77,7,2,66,6,55,5,44,4,33,3,22,2,11,1);
/*!40000 ALTER TABLE `stat_resign_detail` ENABLE KEYS */;
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
  KEY `fk_stat_single_gateway_implementation_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_single_gateway_implementation`
--

LOCK TABLES `stat_single_gateway_implementation` WRITE;
/*!40000 ALTER TABLE `stat_single_gateway_implementation` DISABLE KEYS */;
INSERT INTO `stat_single_gateway_implementation` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES (1,1,1,'2018-03-19 15:58:33',1),(2,1,2,'2017-09-04 15:37:29',1);
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
  KEY `fk_stat_single_gateway_implementation_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_single_gateway_implementation_detail`
--

LOCK TABLES `stat_single_gateway_implementation_detail` WRITE;
/*!40000 ALTER TABLE `stat_single_gateway_implementation_detail` DISABLE KEYS */;
INSERT INTO `stat_single_gateway_implementation_detail` (`id`, `stat_single_gateway_implementation_id`, `start_date`, `name`, `remark`, `ministry_id`) VALUES (1,1,'2018-03-15 00:00:00','OK','okaa',1),(2,1,'2017-08-28 00:00:00','ssdf','dfdsf',2),(3,2,'2017-09-21 00:00:00','sada','adasd',1),(4,1,'2017-09-04 00:00:00','234','342',4),(5,1,'2017-09-13 00:00:00','jjkjh','kjhk',5),(6,1,'1970-01-01 00:00:00',NULL,NULL,30),(7,1,NULL,NULL,NULL,34);
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
  KEY `fk_stat_victorycoin_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_ministry`
--

LOCK TABLES `stat_victorycoin_ministry` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_ministry` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (1,'2017-09-16 09:16:41',1,1,1);
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
  KEY `fk_stat_victorycoin_ministry_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_ministry_detail`
--

LOCK TABLES `stat_victorycoin_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_ministry_detail` DISABLE KEYS */;
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
  KEY `fk_stat_victorycoin_province_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_province`
--

LOCK TABLES `stat_victorycoin_province` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_province` DISABLE KEYS */;
INSERT INTO `stat_victorycoin_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2018-03-19 18:38:31',1,1,1);
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
  KEY `fk_stat_victorycoin_province_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victorycoin_province_detail`
--

LOCK TABLES `stat_victorycoin_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_victorycoin_province_detail` DISABLE KEYS */;
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
  KEY `fk_stat_victoryoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_ministry`
--

LOCK TABLES `stat_victoryoversea_ministry` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_ministry` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES (2,'2017-09-16 12:41:18',1,1,1);
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
  KEY `fk_stat_victoryoversea_ministry_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_ministry_detail`
--

LOCK TABLES `stat_victoryoversea_ministry_detail` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_ministry_detail` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_ministry_detail` (`id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`, `stat_victoryoversea_ministry_id`, `ministry_id`, `award_id`) VALUES (1,NULL,NULL,13,15,107,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,126,1,101,NULL,1,NULL,NULL,NULL,NULL,NULL,'dd',47,22,2,1,2),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aa',2,1,2,2,6);
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
  KEY `fk_stat_victoryoversea_province_user1_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_province`
--

LOCK TABLES `stat_victoryoversea_province` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_province` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES (1,'2017-09-16 14:56:23',1,1,1);
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
  KEY `fk_stat_victoryoversea_province_detail_award1_idx` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_victoryoversea_province_detail`
--

LOCK TABLES `stat_victoryoversea_province_detail` WRITE;
/*!40000 ALTER TABLE `stat_victoryoversea_province_detail` DISABLE KEYS */;
INSERT INTO `stat_victoryoversea_province_detail` (`id`, `stat_victoryoversea_province_id`, `province_id`, `award_id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`) VALUES (1,1,1,2,99,88,77,66,55,44,33,22,11,9,8,7,6,553,2,1,NULL,5,9,9,NULL,7,6,5,'lk',7,8);
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
  KEY `fk_user_has_user_user1_idx` (`user_id`)
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
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_user_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`, `role_id`, `user_id`, `input_dt_stamp`) VALUES (1,'admin','admin','Administrator','','A','',NULL,0,1,NULL,'2017-10-14 16:32:15'),(2,'vtp','123','ຫ້ອງການພາຍໃນ ແຂວງວຽງຈັນ','VTP','A','1','',0,2,1,'2017-10-25 23:56:01'),(3,'csm','123','Civil Servant Management','CSM','A','123','',0,3,2,'2017-10-26 23:35:12'),(4,'dpc','123','Department of Planning and Cooperation','MoHA','A','212545','',0,4,1,'2017-11-01 01:51:22');
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
  KEY `fk_user_has_branch_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_branch`
--

LOCK TABLES `user_has_branch` WRITE;
/*!40000 ALTER TABLE `user_has_branch` DISABLE KEYS */;
INSERT INTO `user_has_branch` (`user_id`, `branch_id`) VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(1,12),(2,12),(4,12),(2,13),(3,13);
/*!40000 ALTER TABLE `user_has_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_province`
--

DROP TABLE IF EXISTS `user_has_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_province` (
  `user_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`province_id`),
  KEY `fk_user_has_province_idx` (`province_id`),
  KEY `fk_user_has_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_province`
--

LOCK TABLES `user_has_province` WRITE;
/*!40000 ALTER TABLE `user_has_province` DISABLE KEYS */;
INSERT INTO `user_has_province` (`user_id`, `province_id`) VALUES (2,1),(3,1),(4,1),(2,2),(3,2),(4,2),(2,3),(3,3),(4,3),(2,4),(3,4),(4,4),(2,5),(3,5),(4,5),(2,6),(3,6),(4,6),(2,7),(3,7),(4,7),(2,8),(3,8),(4,8),(2,9),(3,9),(4,9),(2,10),(3,10),(4,10),(2,11),(3,11),(4,11),(2,12),(3,12),(4,12),(2,13),(3,13),(4,13),(2,14),(3,14),(4,14),(2,15),(3,15),(4,15),(2,16),(3,16),(4,16),(2,17),(3,17),(4,17),(2,18),(3,18),(4,18);
/*!40000 ALTER TABLE `user_has_province` ENABLE KEYS */;
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
  KEY `fk_user_has_role_user1_idx` (`user_id`)
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
-- Table structure for table `user_subordinate`
--

DROP TABLE IF EXISTS `user_subordinate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_subordinate` (
  `user_id` int(11) NOT NULL,
  `subordinate_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subordinate_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subordinate`
--

LOCK TABLES `user_subordinate` WRITE;
/*!40000 ALTER TABLE `user_subordinate` DISABLE KEYS */;
INSERT INTO `user_subordinate` (`user_id`, `subordinate_user_id`) VALUES (1,2),(1,3),(1,4),(2,1),(2,3),(2,4),(3,1),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `user_subordinate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'moha'
--

--
-- Dumping routines for database 'moha'
--

--
-- Final view structure for view `sis_application_form_init_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_application_form_init_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_application_form_init_view` AS select 1 AS `id`,1 AS `entrance_id`,1 AS `applicant_code`,1 AS `title_id`,1 AS `first_name`,1 AS `last_name`,1 AS `birth_date`,1 AS `mobile_no`,1 AS `telphone_no`,1 AS `email`,1 AS `sms_notification`,1 AS `email_notification`,1 AS `ethnic_id`,1 AS `province_id`,1 AS `district_id`,1 AS `village_id`,1 AS `graduated_year_id`,1 AS `province_graduated`,1 AS `picture_file`,1 AS `applicant_status_id`,1 AS `entry_method_id`,1 AS `created`,1 AS `graduated_school`,1 AS `gender`,1 AS `entrance_name`,1 AS `academic_year`,1 AS `start_exam_date`,1 AS `end_exam_date`,1 AS `open_status`,1 AS `application_deadline`,1 AS `active`,1 AS `title_description`,1 AS `ethnic_name`,1 AS `province_name`,1 AS `district_name`,1 AS `village_name`,1 AS `graduated_year`,1 AS `province_graduated_name`,1 AS `application_status`,1 AS `entry_method`,1 AS `curriculum_id1`,1 AS `curriculum_id2`,1 AS `exam_site_id`,1 AS `exam_building_id`,1 AS `exam_room_id`,1 AS `exam_result_id`,1 AS `is_notified`,1 AS `notified_date`,1 AS `result_status`,1 AS `rank`,1 AS `curriculum_id_final`,1 AS `curriculum_name_final`,1 AS `faculty_name_final`,1 AS `faculty_id_final`,1 AS `department_id_final`,1 AS `department_name_final`,1 AS `exam_seat_id`,1 AS `seat_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_application_form_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_application_form_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_application_form_view` AS select 1 AS `id`,1 AS `entrance_id`,1 AS `applicant_code`,1 AS `title_id`,1 AS `first_name`,1 AS `last_name`,1 AS `birth_date`,1 AS `mobile_no`,1 AS `telphone_no`,1 AS `email`,1 AS `sms_notification`,1 AS `email_notification`,1 AS `ethnic_id`,1 AS `province_id`,1 AS `district_id`,1 AS `village_id`,1 AS `graduated_year_id`,1 AS `province_graduated`,1 AS `picture_file`,1 AS `applicant_status_id`,1 AS `entry_method_id`,1 AS `created`,1 AS `graduated_school`,1 AS `gender`,1 AS `entrance_name`,1 AS `academic_year`,1 AS `start_exam_date`,1 AS `end_exam_date`,1 AS `open_status`,1 AS `application_deadline`,1 AS `active`,1 AS `title_description`,1 AS `ethnic_name`,1 AS `province_name`,1 AS `district_name`,1 AS `village_name`,1 AS `graduated_year`,1 AS `province_graduated_name`,1 AS `application_status`,1 AS `entry_method`,1 AS `curriculum_id1`,1 AS `curriculum_id2`,1 AS `exam_site_id`,1 AS `exam_building_id`,1 AS `exam_room_id`,1 AS `exam_result_id`,1 AS `is_notified`,1 AS `notified_date`,1 AS `result_status`,1 AS `rank`,1 AS `curriculum_id_final`,1 AS `curriculum_name_final`,1 AS `faculty_name_final`,1 AS `faculty_id_final`,1 AS `department_id_final`,1 AS `department_name_final`,1 AS `exam_seat_id`,1 AS `seat_no`,1 AS `curriculum_name1`,1 AS `faculty_name1`,1 AS `faculty_id1`,1 AS `department_name1`,1 AS `department_id1`,1 AS `curriculum_name2`,1 AS `faculty_name2`,1 AS `faculty_id2`,1 AS `department_name2`,1 AS `department_id2`,1 AS `site_name`,1 AS `building_name`,1 AS `room_name`,1 AS `degree`,1 AS `curriculum_group_id1`,1 AS `curriculum_group_name1`,1 AS `curriculum_group_id2`,1 AS `curriculum_group_name2`,1 AS `degree_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_attendance_report`
--

/*!50001 DROP VIEW IF EXISTS `sis_attendance_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_attendance_report` AS select 1 AS `enrolment_no`,1 AS `student_code`,1 AS `title`,1 AS `first_name`,1 AS `last_name`,1 AS `present`,1 AS `absent`,1 AS `late`,1 AS `reason` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_cof_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_cof_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_cof_view` AS select 1 AS `id`,1 AS `course_id`,1 AS `academic_year_id`,1 AS `semester_id`,1 AS `total_section`,1 AS `exam_start`,1 AS `exam_finish`,1 AS `active`,1 AS `set_order`,1 AS `status`,1 AS `course_code`,1 AS `course_name`,1 AS `course_eng_name`,1 AS `credit`,1 AS `lecture_hour`,1 AS `lab_hour`,1 AS `description`,1 AS `faculty_id`,1 AS `faculty_abbr`,1 AS `faculty_name`,1 AS `faculty_eng_name`,1 AS `faculty_eng_abbr`,1 AS `faculty_course_code`,1 AS `department_name`,1 AS `department_eng_name`,1 AS `department_course_code`,1 AS `department_id`,1 AS `course_status_id`,1 AS `course_abbr_name`,1 AS `is_shared` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_course_enrolment_detail_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_course_enrolment_detail_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_course_enrolment_detail_view` AS select 1 AS `id`,1 AS `enrolment_no`,1 AS `course_id`,1 AS `course_section_id`,1 AS `credit`,1 AS `enrolment_date`,1 AS `academic_year_id`,1 AS `semester_id`,1 AS `account_code`,1 AS `description`,1 AS `total_course`,1 AS `total_credit`,1 AS `total_amount`,1 AS `paid_status_id`,1 AS `course_offer_id`,1 AS `section_max`,1 AS `section_enrol`,1 AS `section_available`,1 AS `room_id`,1 AS `teacher_name`,1 AS `teacher_id`,1 AS `class_name`,1 AS `student_code`,1 AS `title_id`,1 AS `first_name`,1 AS `last_name`,1 AS `eng_first_name`,1 AS `eng_last_name`,1 AS `gender`,1 AS `birth_date`,1 AS `nationality_id`,1 AS `religion_id`,1 AS `marital_status_id`,1 AS `address_province_id`,1 AS `address_district_id`,1 AS `address_village_id`,1 AS `mobile_no`,1 AS `telephone_no`,1 AS `email_address`,1 AS `picture_file`,1 AS `faculty_id`,1 AS `curriculum_id`,1 AS `is_continuity_student`,1 AS `is_quota_student`,1 AS `is_disability`,1 AS `required_domitory`,1 AS `is_work_before_admission`,1 AS `emergency_contact_name`,1 AS `emergency_phone_no`,1 AS `emergency_province_id`,1 AS `emergency_district_id`,1 AS `emergency_village_id`,1 AS `student_status_id`,1 AS `created`,1 AS `latest_modified`,1 AS `citizen_id_card`,1 AS `household_book`,1 AS `invoice_template_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_course_offer_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_course_offer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_course_offer_view` AS select 1 AS `id`,1 AS `course_id`,1 AS `academic_year_id`,1 AS `semester_id`,1 AS `total_section`,1 AS `exam_start`,1 AS `exam_finish`,1 AS `active`,1 AS `set_order`,1 AS `status`,1 AS `course_code`,1 AS `course_name`,1 AS `course_eng_name`,1 AS `credit`,1 AS `lecture_hour`,1 AS `lab_hour`,1 AS `description`,1 AS `faculty_id`,1 AS `faculty_abbr`,1 AS `faculty_name`,1 AS `faculty_eng_name`,1 AS `faculty_eng_abbr`,1 AS `faculty_course_code`,1 AS `department_name`,1 AS `department_eng_name`,1 AS `department_course_code`,1 AS `department_id`,1 AS `course_status_id`,1 AS `course_abbr_name`,1 AS `is_shared`,1 AS `course_offer_id`,1 AS `section_max`,1 AS `section_enrol`,1 AS `section_available` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_course_section_offer_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_course_section_offer_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_course_section_offer_view` AS select 1 AS `id`,1 AS `course_offer_id`,1 AS `section_max`,1 AS `section_enrol`,1 AS `section_available`,1 AS `teacher_name`,1 AS `room_id`,1 AS `class_name`,1 AS `teacher_id`,1 AS `course_id`,1 AS `academic_year_id`,1 AS `semester_id`,1 AS `total_section`,1 AS `exam_start`,1 AS `exam_finish`,1 AS `course_offer_status`,1 AS `course_code`,1 AS `course_name`,1 AS `course_eng_name`,1 AS `course_abbr_name`,1 AS `credit`,1 AS `lecture_hour`,1 AS `lab_hour`,1 AS `practice_hour`,1 AS `description`,1 AS `faculty_id`,1 AS `department_id`,1 AS `course_status_id`,1 AS `is_shared`,1 AS `department_course_code`,1 AS `department_name`,1 AS `faculty_abbr`,1 AS `faculty_course_code`,1 AS `faculty_name`,1 AS `faculty_eng_name`,1 AS `faculty_eng_abbr`,1 AS `is_faculty` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_course_section_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_course_section_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_course_section_view` AS select 1 AS `id`,1 AS `course_offer_id`,1 AS `section_max`,1 AS `section_enrol`,1 AS `section_available`,1 AS `teacher_name`,1 AS `room_id`,1 AS `class_name`,1 AS `teacher_id`,1 AS `course_id`,1 AS `academic_year_id`,1 AS `semester_id`,1 AS `total_section`,1 AS `exam_start`,1 AS `exam_finish`,1 AS `status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_curriclum_course_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_curriclum_course_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_curriclum_course_view` AS select 1 AS `course_id`,1 AS `curriculum_id`,1 AS `course_category_id`,1 AS `id`,1 AS `course_code`,1 AS `course_name`,1 AS `course_eng_name`,1 AS `credit`,1 AS `lecture_hour`,1 AS `lab_hour`,1 AS `practice_hour`,1 AS `description`,1 AS `faculty_id`,1 AS `department_id`,1 AS `active`,1 AS `set_order`,1 AS `course_status_id`,1 AS `course_abbr_name`,1 AS `is_shared`,1 AS `category_code`,1 AS `category_name`,1 AS `curriculum_course_code`,1 AS `curriculum_eng_name`,1 AS `curriculum_name`,1 AS `department_course_code`,1 AS `department_eng_name`,1 AS `department_name`,1 AS `faculty_abbr`,1 AS `faculty_course_code`,1 AS `faculty_eng_abbr`,1 AS `faculty_eng_name`,1 AS `faculty_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_curriculum_admission_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_curriculum_admission_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_curriculum_admission_view` AS select 1 AS `id`,1 AS `faculty_id`,1 AS `department_id`,1 AS `curriculum_name`,1 AS `curriculum_eng_name`,1 AS `certificate_degree_id`,1 AS `certificate_title`,1 AS `certificate_eng_title`,1 AS `total_credit`,1 AS `active`,1 AS `set_order`,1 AS `curriculum_status_id`,1 AS `is_continuity`,1 AS `curriculum_course_code`,1 AS `total_year_study`,1 AS `curriculum_group_id`,1 AS `curriculum_name_prefix`,1 AS `curriculum_eng_name_prefix`,1 AS `academic_year_id`,1 AS `status_code`,1 AS `status_name`,1 AS `faculty_abbr`,1 AS `faculty_course_code`,1 AS `faculty_eng_abbr`,1 AS `faculty_eng_name`,1 AS `faculty_name`,1 AS `department_course_code`,1 AS `department_eng_name`,1 AS `department_name`,1 AS `academic_year`,1 AS `academic_start_date`,1 AS `academic_end_date`,1 AS `degree_name`,1 AS `degree_eng_name`,1 AS `curriculum_group_name`,1 AS `group_no`,1 AS `admission_id`,1 AS `quota`,1 AS `admission_code`,1 AS `admission_name`,1 AS `start_admission_date`,1 AS `end_admission_date`,1 AS `start_admission_late_date`,1 AS `end_admission_late_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_curriculum_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_curriculum_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_curriculum_view` AS select 1 AS `id`,1 AS `faculty_id`,1 AS `department_id`,1 AS `curriculum_name`,1 AS `curriculum_eng_name`,1 AS `certificate_degree_id`,1 AS `certificate_title`,1 AS `certificate_eng_title`,1 AS `total_credit`,1 AS `active`,1 AS `set_order`,1 AS `curriculum_status_id`,1 AS `is_continuity`,1 AS `curriculum_course_code`,1 AS `total_year_study`,1 AS `curriculum_group_id`,1 AS `curriculum_name_prefix`,1 AS `curriculum_eng_name_prefix`,1 AS `academic_year_id`,1 AS `status_code`,1 AS `status_name`,1 AS `faculty_abbr`,1 AS `faculty_course_code`,1 AS `faculty_eng_abbr`,1 AS `faculty_eng_name`,1 AS `faculty_name`,1 AS `department_course_code`,1 AS `department_eng_name`,1 AS `department_name`,1 AS `academic_year`,1 AS `academic_start_date`,1 AS `academic_end_date`,1 AS `degree_name`,1 AS `degree_eng_name`,1 AS `curriculum_group_name`,1 AS `group_no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_dormitory_room_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_dormitory_room_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_dormitory_room_view` AS select 1 AS `id`,1 AS `room_number`,1 AS `room_name`,1 AS `room_fee`,1 AS `number_of_bed`,1 AS `dormitory_id`,1 AS `number_of_student`,1 AS `available_bed`,1 AS `building_code`,1 AS `building_name`,1 AS `faculty_abbr`,1 AS `faculty_name`,1 AS `faculty_eng_name`,1 AS `faculty_course_code`,1 AS `campus_id`,1 AS `campus_name`,1 AS `room_type_id`,1 AS `type_description`,1 AS `type_eng_description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_myappliedworkplace_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_myappliedworkplace_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_myappliedworkplace_view` AS select 1 AS `id`,1 AS `title`,1 AS `description`,1 AS `amount`,1 AS `start_apply_date`,1 AS `end_apply_date`,1 AS `status`,1 AS `user_id`,1 AS `student_code`,1 AS `title_id`,1 AS `first_name`,1 AS `last_name`,1 AS `eng_first_name`,1 AS `eng_last_name`,1 AS `gender`,1 AS `birth_date`,1 AS `nationality_id`,1 AS `religion_id`,1 AS `marital_status_id`,1 AS `address_province_id`,1 AS `address_district_id`,1 AS `address_village_id`,1 AS `mobile_no`,1 AS `telephone_no`,1 AS `email_address`,1 AS `picture_file`,1 AS `faculty_id`,1 AS `curriculum_id`,1 AS `is_continuity_student`,1 AS `is_quota_student`,1 AS `is_disability`,1 AS `required_domitory`,1 AS `is_work_before_admission`,1 AS `emergency_contact_name`,1 AS `emergency_phone_no`,1 AS `emergency_province_id`,1 AS `emergency_district_id`,1 AS `emergency_village_id`,1 AS `student_status_id`,1 AS `created`,1 AS `latest_modified`,1 AS `citizen_id_card`,1 AS `household_book`,1 AS `invoice_template_id`,1 AS `arttached_files`,1 AS `statusapplied`,1 AS `applied_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_open_curriculum_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_open_curriculum_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_open_curriculum_view` AS select 1 AS `entrance_id`,1 AS `curriculum_id`,1 AS `faculty_id`,1 AS `quota`,1 AS `created_date_time`,1 AS `academic_year`,1 AS `start_exam_date`,1 AS `end_exam_date`,1 AS `open_status`,1 AS `application_deadline`,1 AS `department_id`,1 AS `curriculum_name`,1 AS `curriculum_eng_name`,1 AS `certificate_degree_id`,1 AS `certificate_title`,1 AS `certificate_eng_title`,1 AS `total_credit`,1 AS `curriculum_status_id`,1 AS `is_continuity`,1 AS `curriculum_course_code`,1 AS `total_year_study`,1 AS `curriculum_group_id`,1 AS `curriculum_group_name`,1 AS `curriculum_group_no`,1 AS `degree_name`,1 AS `degree_eng_name`,1 AS `faculty_name`,1 AS `faculty_eng_name`,1 AS `faculty_abbr`,1 AS `faculty_eng_abbr`,1 AS `faculty_course_code`,1 AS `is_faculty`,1 AS `applied_applicant` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_prefer_study_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_prefer_study_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_prefer_study_view` AS select 1 AS `curriculum_id`,1 AS `course_id`,1 AS `prefer_year_id`,1 AS `prefer_semester_id`,1 AS `id`,1 AS `faculty_id`,1 AS `department_id`,1 AS `curriculum_name`,1 AS `curriculum_eng_name`,1 AS `certificate_degree_id`,1 AS `certificate_title`,1 AS `certificate_eng_title`,1 AS `total_credit`,1 AS `active`,1 AS `set_order`,1 AS `curriculum_status_id`,1 AS `is_continuity`,1 AS `curriculum_course_code`,1 AS `total_year_study`,1 AS `curriculum_group_id`,1 AS `curriculum_name_prefix`,1 AS `curriculum_eng_name_prefix`,1 AS `academic_year_id`,1 AS `department_course_code`,1 AS `department_name`,1 AS `department_eng_name`,1 AS `faculty_abbr`,1 AS `faculty_course_code`,1 AS `faculty_eng_abbr`,1 AS `faculty_eng_name`,1 AS `faculty_name`,1 AS `is_faculty`,1 AS `course_code`,1 AS `course_name`,1 AS `course_eng_name`,1 AS `credit`,1 AS `lecture_hour`,1 AS `lab_hour`,1 AS `practice_hour`,1 AS `description`,1 AS `course_status_id`,1 AS `course_abbr_name`,1 AS `is_shared`,1 AS `academic_year`,1 AS `academic_start_date`,1 AS `academic_end_date`,1 AS `admission_start_date`,1 AS `admission_end_date`,1 AS `is_open`,1 AS `next_admission_code`,1 AS `prefer_year_description`,1 AS `prefer_year_eng_description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sis_sec_view`
--

/*!50001 DROP VIEW IF EXISTS `sis_sec_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sis_sec_view` AS select 1 AS `course_offer_id`,1 AS `section_max`,1 AS `section_enrol`,1 AS `section_available` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-25  8:28:11
