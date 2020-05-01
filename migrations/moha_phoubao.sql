-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2017 at 07:52 PM
-- Server version: 5.6.36-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moha`
--

-- --------------------------------------------------------

--
-- Table structure for table `accociation`
--
drop  database IF  EXISTS `moha`;
create database IF NOT EXISTS `moha`;
use `moha`;
set foreign_key_checks=0;

CREATE TABLE IF NOT EXISTS `accociation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_accociation_province1_idx` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `controller_id` int(11) DEFAULT '0',
  `description` text,
  `parent_id` int(11) DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`class_name`,`method`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=771 ;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`id`, `class_name`, `method`, `deleted`, `controller_id`, `description`, `parent_id`, `position`) VALUES
(1, 'User', 'managerole', 0, 0, 'ການໃຫ້ສິດ', 0, 3),
(2, 'User', 'manageuser', 0, 0, 'ຜູ້ໃຊ້ລະບົບ', 0, 2),
(3, '#', '#', 0, 0, 'ກົມ', 0, 4),
(4, '#', '#', 0, 0, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', 3, 1),
(5, 'ministry', 'index', 0, 0, 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ\n', 4, 1),
(6, 'Ministry', 'enquiry', 0, 0, 'Enquiry', 5, 1),
(7, 'Ministry', 'save', 0, 0, 'ເພີ່ມ/Add ', 5, 2),
(8, 'Ministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 5, 3),
(9, 'Ministry', 'delete', 0, 0, 'ລືບ/Delete', 5, 4),
(10, 'Ministry', 'print', 0, 0, 'ພິມ/Print', 5, 5),
(11, 'Ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 5, 6),
(12, 'stat-goverment-unit', 'index', 0, 0, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)', 4, 2),
(13, 'stat-goverment-unit', 'get', 0, 0, 'Load Phiscal Year and Ministry', 12, 1),
(14, 'stat-goverment-unit', 'save', 0, 0, 'ເພີ່ມ/Add ', 12, 2),
(15, 'stat-goverment-unit', 'save', 0, 0, 'ແກ້ໄຂ/Edit', 12, 3),
(16, 'stat-goverment-unit', 'delete', 1, 0, 'ລືບ/Delete', 12, 4),
(17, 'stat-goverment-unit', 'print', 0, 0, 'ພິມ/Print', 12, 5),
(18, 'stat-goverment-unit', 'download', 0, 0, 'ສົ່ງອອກ/Export', 12, 6),
(19, '#', '#', 0, 0, 'ຕັ້ງຄ່າ', 0, 1),
(20, 'message', 'index', 0, 0, 'ແປພາສາ', 19, 2),
(21, 'phiscal-year', 'index', 0, 0, 'ສົກປີ', 19, 1),
(22, '#', '#', 0, 0, ' ກົມການປົກຄອງທ້ອງຖິ່ນ', 3, 2),
(23, '#', '#', 0, 0, ' ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', 3, 3),
(24, '#', '#', 0, 0, ' ກົມຄຸ້ມຄອງພົນລະເມືອງ', 3, 4),
(25, '#', '#', 0, 0, ' ກົມຄຸ້ມຄອງລັດຖະກອນ', 3, 5),
(26, '#', '#', 0, 0, ' ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 3, 6),
(27, '#', '#', 0, 0, ' ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', 3, 7),
(28, '#', '#', 0, 0, ' ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', 3, 8),
(29, '#', '#', 0, 0, ' ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 3, 9),
(30, '#', '#', 0, 0, ' ກົມແຜນທີ່ແຫ່ງຊາດ', 3, 10),
(31, '#', '#', 0, 0, ' ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', 3, 11),
(32, '#', '#', 0, 0, ' ຫ້ອງການກະຊວງ', 3, 12),
(33, '#', '#', 0, 0, ' ກົມແຜນການ ແລະ ການຮ່ວມມື', 3, 13),
(34, '#', '#', 0, 0, ' ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 3, 14),
(35, '#', '#', 0, 0, ' ກົມກວດກາ', 3, 15),
(36, 'stat-single-gateway-implementation', 'index', 0, 0, ' ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 4, 3),
(37, 'stat-legal', 'index', 0, 0, ' ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 4, 4),
(38, 'stat-association-foundation', 'index', 0, 0, ' ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 4, 5),
(39, 'stat-local-admin', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 22, 1),
(40, 'stat-ethnic', 'index', 0, 0, ' ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 23, 1),
(41, 'stat-religion', 'index', 0, 0, ' ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ', 23, 2),
(42, 'stat-religion-teacher', 'index', 0, 0, ' ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 23, 1),
(43, 'stat-religion-place', 'index', 0, 0, ' ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 23, 4),
(44, 'stat-population-movement', 'index', 0, 0, ' ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ', 24, 1),
(45, 'stat-population-movement-chart', 'index', 0, 0, ' ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 24, 2),
(46, 'stat-officer', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 25, 1),
(47, 'stat-officer-age', 'index', 0, 0, ' ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 25, 2),
(48, 'stat-officer-degree', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 25, 3),
(49, 'stat-officer-resign', 'index', 0, 0, ' ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 25, 4),
(50, 'stat-officer-add', 'index', 0, 0, ' ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 25, 5),
(51, 'stat-officer-contract', 'index', 0, 0, ' ຈຳນວນພະນັກງານຕາມສັນຍາ', 25, 6),
(52, 'stat-officer-position', 'index', 0, 0, ' ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 25, 7),
(53, 'stat-officer-need', 'index', 0, 0, ' ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 25, 8),
(54, 'stat-officer-ministry', 'index', 0, 0, ' ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 25, 9),
(55, 'stat-officer-org', 'index', 0, 0, ' ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 25, 10),
(56, 'stat-officer-province', 'index', 0, 0, ' ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 25, 11),
(57, 'stat-officer-ministry-add', 'index', 0, 0, ' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 25, 12),
(58, 'stat-officer-organisation-add', 'index', 0, 0, ' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 25, 13),
(59, 'stat-officer-province-add', 'index', 0, 0, ' ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 25, 14),
(60, 'stat-officer-ministry-train', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 1),
(61, 'stat-officer-organisation-train', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 2),
(62, 'stat-officer-province-train', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 3),
(63, 'stat-officer-ministry-upgrade', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 4),
(64, 'stat-officer-organisation-upgrade', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 5),
(65, 'stat-officer-province-upgrade', 'index', 0, 0, ' ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 26, 6),
(66, 'stat-course', 'index', 0, 0, ' ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 27, 1),
(67, 'stat-institute-train', 'index', 0, 0, ' ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 27, 1),
(68, 'stat-institute-meeting', 'index', 0, 0, ' ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 27, 3),
(69, 'stat-research', 'index', 0, 0, ' ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 27, 4),
(70, 'stat-document', 'index', 0, 0, ' ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 28, 1),
(71, 'statcopy', 'index', 0, 0, ' ສະຖິຕິການສັງລວມ ການສຳເນົາ', 28, 2),
(72, 'stat-highcoin-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 29, 1),
(73, 'stat-hornorcoin-province', 'index', 0, 0, ' ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 29, 2),
(74, 'stat-victorycoin-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 29, 3),
(75, 'stat-victorycoin-province', 'index', 0, 0, ' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 29, 4),
(76, 'stat-govcoin-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 29, 5),
(77, 'stat-highoversea-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 29, 6),
(78, 'stat-victoryoversea-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 29, 7),
(79, 'stat-victoryoversea-province', 'index', 0, 0, ' ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 29, 8),
(80, 'stat-govoversea-ministry', 'index', 0, 0, ' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 29, 9),
(81, 'stat-govcoin-province', 'index', 0, 0, ' ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 29, 10),
(82, 'stat-govoversea-province', 'index', 0, 0, ' ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 29, 11),
(83, 'stat-map-service', 'index', 0, 0, ' ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 30, 1),
(84, 'stat-map-produce', 'index', 0, 0, ' ສະຖິຕິການຜະລິດແຜນທີ່', 30, 2),
(85, 'stat-explore', 'index', 0, 0, ' ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 30, 3),
(86, 'NULL', 'index', 0, 0, ' ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 30, 4),
(87, 'stat-explore', 'index', 0, 0, ' ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 31, 1),
(88, 'stat-officer-salary', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 34, 1),
(89, 'stat-officer-technical', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 34, 2),
(90, 'stat-officer-age-level', 'index', 0, 0, ' ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 34, 3),
(91, 'stat-officer-ethnic', 'index', 0, 0, ' ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 34, 4),
(92, 'stat-position', 'index', 0, 0, ' ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 34, 5),
(93, 'stat-officer-new', 'index', 0, 0, ' ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 34, 6),
(94, '#', 'index', 0, 0, ' ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 34, 7),
(95, '#', 'index', 0, 0, ' ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 34, 8),
(96, '#', 'index', 0, 0, ' ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 34, 9),
(97, 'stat-officer-ethnic', 'index', 0, 0, ' ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ', 34, 10),
(98, 'User', 'manageuser', 0, 0, 'ເພີ່ມ/Add ຜູ້ໃຊ້', 2, 1),
(99, 'User', 'manageuser', 0, 0, 'ແກ້ໄຂ/Edit ຜູ້ໃຊ້', 2, 2),
(100, 'User', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານ (Subordinate(s))', 2, 3),
(101, 'User', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານບັນດາກົມ (Department(s))', 2, 4),
(102, 'User', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານບັນດາແຂວງ (Province(s))', 2, 5),
(103, 'User', 'addrole', 0, 0, 'ເພີ່ມ/Add ບົດບາດ', 1, 1),
(104, 'User', 'updaterole', 0, 0, 'ແກ້ໄຂ/Edit ບົດບາດ', 1, 2),
(105, 'User', 'deleterole', 0, 0, 'ລຶບ/Delete ບົດບາດ', 1, 3),
(106, 'User', 'savemenuandaction', 0, 0, 'ບັນທຶກລາຍການເມນູ(ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຫັນ ຫລື ບໍ່ເຫັນລາຍການເມນູ)', 1, 4),
(107, 'User', 'savemenuandaction', 0, 0, 'ບັນທຶກລາຍການຟັງຊັ່ນ(Action ເພື່ອ ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຮັດຫຍັງໄດ້ແດ່)', 1, 5),
(108, 'User', 'listmenu', 0, 0, 'ສະແດງລາຍການເມນູ(Menu)', 1, 5),
(109, 'User', 'listaction', 0, 0, 'ສະແດງລາຍການຟັງຊັ່ນ(Action)', 1, 5),
(111, 'stat-single-gateway-implementation', 'enquiry', 0, 0, ' Enquiry', 36, 1),
(112, 'stat-legal', 'enquiry', 0, 0, ' Enquiry', 37, 1),
(113, 'stat-association-foundation', 'enquiry', 0, 0, ' Enquiry', 38, 1),
(114, 'stat-local-admin', 'enquiry', 0, 0, ' Enquiry', 39, 1),
(115, 'stat-ethnic', 'enquiry', 0, 0, ' Enquiry', 40, 1),
(116, 'stat-religion', 'enquiry', 0, 0, ' Enquiry', 41, 1),
(117, 'stat-religion-teacher', 'enquiry', 0, 0, ' Enquiry', 42, 2),
(118, 'stat-religion-place', 'enquiry', 0, 0, ' Enquiry', 43, 1),
(119, 'stat-population-movement', 'enquiry', 0, 0, ' Enquiry', 44, 1),
(120, 'stat-population-movement-chart', 'enquiry', 0, 0, ' Enquiry', 45, 1),
(121, 'stat-officer', 'enquiry', 0, 0, ' Enquiry', 46, 1),
(122, 'statofficerage', 'enquiry', 0, 0, ' Enquiry', 47, 1),
(123, 'statofficerdegree', 'enquiry', 0, 0, ' Enquiry', 48, 1),
(124, 'statofficerresign', 'enquiry', 0, 0, ' Enquiry', 49, 1),
(125, 'statofficeradd', 'enquiry', 0, 0, ' Enquiry', 50, 1),
(126, 'statofficercontract', 'enquiry', 0, 0, ' Enquiry', 51, 1),
(127, 'statofficerposition', 'enquiry', 0, 0, ' Enquiry', 52, 1),
(128, 'statofficerneed', 'enquiry', 0, 0, ' Enquiry', 53, 1),
(129, 'statofficerministry', 'enquiry', 0, 0, ' Enquiry', 54, 1),
(130, 'statofficerorg', 'enquiry', 0, 0, ' Enquiry', 55, 1),
(131, 'statofficerprovince', 'enquiry', 0, 0, ' Enquiry', 56, 1),
(132, 'statofficerministry-add', 'enquiry', 0, 0, ' Enquiry', 57, 1),
(133, 'statofficerorganisation-add', 'enquiry', 0, 0, ' Enquiry', 58, 1),
(134, 'statofficerprovince-add', 'enquiry', 0, 0, ' Enquiry', 59, 1),
(135, 'statofficerministrytrain', 'enquiry', 0, 0, ' Enquiry', 60, 1),
(136, 'statofficerorganisationtrain', 'enquiry', 0, 0, ' Enquiry', 61, 1),
(137, 'statofficerprovincetrain', 'enquiry', 0, 0, ' Enquiry', 62, 1),
(138, 'statofficerministryupgrade', 'enquiry', 0, 0, ' Enquiry', 63, 1),
(139, 'statoffice-orgupgrade', 'enquiry', 0, 0, ' Enquiry', 64, 1),
(140, 'statofficer-province-upgrade', 'enquiry', 0, 0, ' Enquiry', 65, 1),
(141, 'statcourse', 'enquiry', 0, 0, ' Enquiry', 66, 1),
(142, 'statinstitutetrain', 'enquiry', 0, 0, ' Enquiry', 67, 1),
(143, 'statinstitutemeeting', 'enquiry', 0, 0, ' Enquiry', 68, 1),
(144, 'statresearch', 'enquiry', 0, 0, ' Enquiry', 69, 1),
(145, 'statdocument', 'enquiry', 0, 0, ' Enquiry', 70, 1),
(146, 'statcopy', 'enquiry', 0, 0, ' Enquiry', 71, 1),
(147, 'stathighcoinministry', 'enquiry', 0, 0, ' Enquiry', 72, 1),
(148, 'stathornorcoinprovince', 'enquiry', 0, 0, ' Enquiry', 73, 1),
(149, 'statvictorycoinministry', 'enquiry', 0, 0, ' Enquiry', 74, 1),
(150, 'statvictorycoinprovince', 'enquiry', 0, 0, ' Enquiry', 75, 1),
(151, 'statgovcoinministry', 'enquiry', 0, 0, ' Enquiry', 76, 1),
(152, 'stathighoverseaministry', 'enquiry', 0, 0, ' Enquiry', 77, 1),
(153, 'statvictoryoverseaministry', 'enquiry', 0, 0, ' Enquiry', 78, 1),
(154, 'statvictoryoverseaprovince', 'enquiry', 0, 0, ' Enquiry', 79, 1),
(155, 'statgovoverseaministry', 'enquiry', 0, 0, ' Enquiry', 80, 1),
(156, 'statgovcoinprovince', 'enquiry', 0, 0, ' Enquiry', 81, 1),
(157, 'statgovoverseaprovince', 'enquiry', 0, 0, ' Enquiry', 82, 1),
(158, 'statmapservice', 'enquiry', 0, 0, ' Enquiry', 83, 1),
(159, 'statmapproduce', 'enquiry', 0, 0, ' Enquiry', 84, 1),
(160, 'statexplore', 'enquiry', 0, 0, ' Enquiry', 85, 1),
(161, 'NULL', 'enquiry', 0, 0, ' Enquiry', 86, 1),
(162, 'statexplore', 'enquiry', 0, 0, ' Enquiry', 87, 1),
(163, 'statofficersalary', 'enquiry', 0, 0, ' Enquiry', 88, 1),
(164, 'statofficertechnical', 'enquiry', 0, 0, ' Enquiry', 89, 1),
(165, 'statofficeragelevel', 'enquiry', 0, 0, ' Enquiry', 90, 1),
(166, 'statofficerethnic', 'enquiry', 0, 0, ' Enquiry', 91, 1),
(167, 'statposition', 'enquiry', 0, 0, ' Enquiry', 92, 1),
(168, 'statofficernew', 'enquiry', 0, 0, ' Enquiry', 93, 1),
(169, '#', 'enquiry', 0, 0, ' Enquiry', 94, 1),
(170, '#', 'enquiry', 0, 0, ' Enquiry', 95, 1),
(171, '#', 'enquiry', 0, 0, ' Enquiry', 96, 1),
(172, 'statofficerethnic', 'enquiry', 0, 0, ' Enquiry', 97, 1),
(173, 'stat-single-gateway-implementation', 'save', 0, 0, ' ເພີ່ມ/Add', 36, 2),
(174, 'stat-legal', 'save', 0, 0, ' ເພີ່ມ/Add', 37, 2),
(175, 'stat-association-foundation', 'save', 0, 0, ' ເພີ່ມ/Add', 38, 2),
(176, 'stat-local-admin', 'save', 0, 0, ' ເພີ່ມ/Add', 39, 2),
(177, 'stat-ethnic', 'save', 0, 0, ' ເພີ່ມ/Add', 40, 2),
(178, 'stat-religion', 'save', 0, 0, ' ເພີ່ມ/Add', 41, 2),
(179, 'stat-religion-teacher', 'save', 0, 0, ' ເພີ່ມ/Add', 42, 3),
(180, 'stat-religion-place', 'save', 0, 0, ' ເພີ່ມ/Add', 43, 2),
(181, 'stat-population-movement', 'save', 0, 0, ' ເພີ່ມ/Add', 44, 2),
(182, 'stat-population-movement-chart', 'save', 0, 0, ' ເພີ່ມ/Add', 45, 2),
(183, 'stat-officer', 'save', 0, 0, ' ເພີ່ມ/Add', 46, 2),
(184, 'statofficerage', 'save', 0, 0, ' ເພີ່ມ/Add', 47, 2),
(185, 'statofficerdegree', 'save', 0, 0, ' ເພີ່ມ/Add', 48, 2),
(186, 'statofficerresign', 'save', 0, 0, ' ເພີ່ມ/Add', 49, 2),
(187, 'statofficeradd', 'save', 0, 0, ' ເພີ່ມ/Add', 50, 2),
(188, 'statofficercontract', 'save', 0, 0, ' ເພີ່ມ/Add', 51, 2),
(189, 'statofficerposition', 'save', 0, 0, ' ເພີ່ມ/Add', 52, 2),
(190, 'statofficerneed', 'save', 0, 0, ' ເພີ່ມ/Add', 53, 2),
(191, 'statofficerministry', 'save', 0, 0, ' ເພີ່ມ/Add', 54, 2),
(192, 'statofficerorg', 'save', 0, 0, ' ເພີ່ມ/Add', 55, 2),
(193, 'statofficerprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 56, 2),
(194, 'statofficerministry-add', 'save', 0, 0, ' ເພີ່ມ/Add', 57, 2),
(195, 'statofficerorganisation-add', 'save', 0, 0, ' ເພີ່ມ/Add', 58, 2),
(196, 'statofficerprovince-add', 'save', 0, 0, ' ເພີ່ມ/Add', 59, 2),
(197, 'statofficerministrytrain', 'save', 0, 0, ' ເພີ່ມ/Add', 60, 2),
(198, 'statofficerorganisationtrain', 'save', 0, 0, ' ເພີ່ມ/Add', 61, 2),
(199, 'statofficerprovincetrain', 'save', 0, 0, ' ເພີ່ມ/Add', 62, 2),
(200, 'statofficerministryupgrade', 'save', 0, 0, ' ເພີ່ມ/Add', 63, 2),
(201, 'statoffice-orgupgrade', 'save', 0, 0, ' ເພີ່ມ/Add', 64, 2),
(202, 'statofficer-province-upgrade', 'save', 0, 0, ' ເພີ່ມ/Add', 65, 2),
(203, 'statcourse', 'save', 0, 0, ' ເພີ່ມ/Add', 66, 2),
(204, 'statinstitutetrain', 'save', 0, 0, ' ເພີ່ມ/Add', 67, 2),
(205, 'statinstitutemeeting', 'save', 0, 0, ' ເພີ່ມ/Add', 68, 2),
(206, 'statresearch', 'save', 0, 0, ' ເພີ່ມ/Add', 69, 2),
(207, 'statdocument', 'save', 0, 0, ' ເພີ່ມ/Add', 70, 2),
(208, 'statcopy', 'save', 0, 0, ' ເພີ່ມ/Add', 71, 2),
(209, 'stathighcoinministry', 'save', 0, 0, ' ເພີ່ມ/Add', 72, 2),
(210, 'stathornorcoinprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 73, 2),
(211, 'statvictorycoinministry', 'save', 0, 0, ' ເພີ່ມ/Add', 74, 2),
(212, 'statvictorycoinprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 75, 2),
(213, 'statgovcoinministry', 'save', 0, 0, ' ເພີ່ມ/Add', 76, 2),
(214, 'stathighoverseaministry', 'save', 0, 0, ' ເພີ່ມ/Add', 77, 2),
(215, 'statvictoryoverseaministry', 'save', 0, 0, ' ເພີ່ມ/Add', 78, 2),
(216, 'statvictoryoverseaprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 79, 2),
(217, 'statgovoverseaministry', 'save', 0, 0, ' ເພີ່ມ/Add', 80, 2),
(218, 'statgovcoinprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 81, 2),
(219, 'statgovoverseaprovince', 'save', 0, 0, ' ເພີ່ມ/Add', 82, 2),
(220, 'statmapservice', 'save', 0, 0, ' ເພີ່ມ/Add', 83, 2),
(221, 'statmapproduce', 'save', 0, 0, ' ເພີ່ມ/Add', 84, 2),
(222, 'statexplore', 'save', 0, 0, ' ເພີ່ມ/Add', 85, 2),
(223, 'NULL', 'save', 0, 0, ' ເພີ່ມ/Add', 86, 2),
(224, 'statexplore', 'save', 0, 0, ' ເພີ່ມ/Add', 87, 2),
(225, 'statofficersalary', 'save', 0, 0, ' ເພີ່ມ/Add', 88, 2),
(226, 'statofficertechnical', 'save', 0, 0, ' ເພີ່ມ/Add', 89, 2),
(227, 'statofficeragelevel', 'save', 0, 0, ' ເພີ່ມ/Add', 90, 2),
(228, 'statofficerethnic', 'save', 0, 0, ' ເພີ່ມ/Add', 91, 2),
(229, 'statposition', 'save', 0, 0, ' ເພີ່ມ/Add', 92, 2),
(230, 'statofficernew', 'save', 0, 0, ' ເພີ່ມ/Add', 93, 2),
(231, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 94, 2),
(232, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 95, 2),
(233, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 96, 2),
(234, 'statofficerethnic', 'save', 0, 0, ' ເພີ່ມ/Add', 97, 2),
(235, 'stat-single-gateway-implementation', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 36, 3),
(236, 'stat-legal', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 37, 3),
(237, 'stat-association-foundation', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 38, 3),
(238, 'stat-local-admin', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 39, 3),
(239, 'stat-ethnic', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 40, 3),
(240, 'stat-religion', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 41, 3),
(241, 'stat-religion-teacher', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 42, 4),
(242, 'stat-religion-place', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 43, 3),
(243, 'stat-population-movement', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 44, 3),
(244, 'stat-population-movement-chart', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 45, 3),
(245, 'stat-officer', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 46, 3),
(246, 'statofficerage', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 47, 3),
(247, 'statofficerdegree', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 48, 3),
(248, 'statofficerresign', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 49, 3),
(249, 'statofficeradd', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 50, 3),
(250, 'statofficercontract', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 51, 3),
(251, 'statofficerposition', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 52, 3),
(252, 'statofficerneed', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 53, 3),
(253, 'statofficerministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 54, 3),
(254, 'statofficerorg', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 55, 3),
(255, 'statofficerprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 56, 3),
(256, 'statofficerministry-add', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 57, 3),
(257, 'statofficerorganisation-add', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 58, 3),
(258, 'statofficerprovince-add', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 59, 3),
(259, 'statofficerministrytrain', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 60, 3),
(260, 'statofficerorganisationtrain', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 61, 3),
(261, 'statofficerprovincetrain', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 62, 3),
(262, 'statofficerministryupgrade', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 63, 3),
(263, 'statoffice-orgupgrade', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 64, 3),
(264, 'statofficer-province-upgrade', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 65, 3),
(265, 'statcourse', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 66, 3),
(266, 'statinstitutetrain', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 67, 3),
(267, 'statinstitutemeeting', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 68, 3),
(268, 'statresearch', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 69, 3),
(269, 'statdocument', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 70, 3),
(270, 'statcopy', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 71, 3),
(271, 'stathighcoinministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 72, 3),
(272, 'stathornorcoinprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 73, 3),
(273, 'statvictorycoinministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 74, 3),
(274, 'statvictorycoinprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 75, 3),
(275, 'statgovcoinministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 76, 3),
(276, 'stathighoverseaministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 77, 3),
(277, 'statvictoryoverseaministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 78, 3),
(278, 'statvictoryoverseaprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 79, 3),
(279, 'statgovoverseaministry', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 80, 3),
(280, 'statgovcoinprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 81, 3),
(281, 'statgovoverseaprovince', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 82, 3),
(282, 'statmapservice', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 83, 3),
(283, 'statmapproduce', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 84, 3),
(284, 'statexplore', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 85, 3),
(285, 'NULL', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 86, 3),
(286, 'statexplore', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 87, 3),
(287, 'statofficersalary', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 88, 3),
(288, 'statofficertechnical', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 89, 3),
(289, 'statofficeragelevel', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 90, 3),
(290, 'statofficerethnic', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 91, 3),
(291, 'statposition', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 92, 3),
(292, 'statofficernew', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 93, 3),
(293, '#', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 94, 3),
(294, '#', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 95, 3),
(295, '#', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 96, 3),
(296, 'statofficerethnic', 'save', 1, 0, 'ແກ້ໄຂ/Edit', 97, 3),
(297, 'stat-single-gateway-implementation', 'delete', 0, 0, ' ລືບ/Delete', 36, 4),
(298, 'stat-legal', 'delete', 0, 0, ' ລືບ/Delete', 37, 4),
(299, 'stat-association-foundation', 'delete', 0, 0, ' ລືບ/Delete', 38, 4),
(300, 'stat-local-admin', 'delete', 0, 0, ' ລືບ/Delete', 39, 4),
(301, 'stat-ethnic', 'delete', 0, 0, ' ລືບ/Delete', 40, 4),
(302, 'stat-religion', 'delete', 0, 0, ' ລືບ/Delete', 41, 4),
(303, 'stat-religion-teacher', 'delete', 0, 0, ' ລືບ/Delete', 42, 5),
(304, 'stat-religion-place', 'delete', 0, 0, ' ລືບ/Delete', 43, 4),
(305, 'stat-population-movement', 'delete', 0, 0, ' ລືບ/Delete', 44, 4),
(306, 'stat-population-movement-chart', 'delete', 0, 0, ' ລືບ/Delete', 45, 4),
(307, 'stat-officer', 'delete', 0, 0, ' ລືບ/Delete', 46, 4),
(308, 'statofficerage', 'delete', 0, 0, ' ລືບ/Delete', 47, 4),
(309, 'statofficerdegree', 'delete', 0, 0, ' ລືບ/Delete', 48, 4),
(310, 'statofficerresign', 'delete', 0, 0, ' ລືບ/Delete', 49, 4),
(311, 'statofficeradd', 'delete', 0, 0, ' ລືບ/Delete', 50, 4),
(312, 'statofficercontract', 'delete', 0, 0, ' ລືບ/Delete', 51, 4),
(313, 'statofficerposition', 'delete', 0, 0, ' ລືບ/Delete', 52, 4),
(314, 'statofficerneed', 'delete', 0, 0, ' ລືບ/Delete', 53, 4),
(315, 'statofficerministry', 'delete', 0, 0, ' ລືບ/Delete', 54, 4),
(316, 'statofficerorg', 'delete', 0, 0, ' ລືບ/Delete', 55, 4),
(317, 'statofficerprovince', 'delete', 0, 0, ' ລືບ/Delete', 56, 4),
(318, 'statofficerministry-add', 'delete', 0, 0, ' ລືບ/Delete', 57, 4),
(319, 'statofficerorganisation-add', 'delete', 0, 0, ' ລືບ/Delete', 58, 4),
(320, 'statofficerprovince-add', 'delete', 0, 0, ' ລືບ/Delete', 59, 4),
(321, 'statofficerministrytrain', 'delete', 0, 0, ' ລືບ/Delete', 60, 4),
(322, 'statofficerorganisationtrain', 'delete', 0, 0, ' ລືບ/Delete', 61, 4),
(323, 'statofficerprovincetrain', 'delete', 0, 0, ' ລືບ/Delete', 62, 4),
(324, 'statofficerministryupgrade', 'delete', 0, 0, ' ລືບ/Delete', 63, 4),
(325, 'statoffice-orgupgrade', 'delete', 0, 0, ' ລືບ/Delete', 64, 4),
(326, 'statofficer-province-upgrade', 'delete', 0, 0, ' ລືບ/Delete', 65, 4),
(327, 'statcourse', 'delete', 0, 0, ' ລືບ/Delete', 66, 4),
(328, 'statinstitutetrain', 'delete', 0, 0, ' ລືບ/Delete', 67, 4),
(329, 'statinstitutemeeting', 'delete', 0, 0, ' ລືບ/Delete', 68, 4),
(330, 'statresearch', 'delete', 0, 0, ' ລືບ/Delete', 69, 4),
(331, 'statdocument', 'delete', 0, 0, ' ລືບ/Delete', 70, 4),
(332, 'statcopy', 'delete', 0, 0, ' ລືບ/Delete', 71, 4),
(333, 'stathighcoinministry', 'delete', 0, 0, ' ລືບ/Delete', 72, 4),
(334, 'stathornorcoinprovince', 'delete', 0, 0, ' ລືບ/Delete', 73, 4),
(335, 'statvictorycoinministry', 'delete', 0, 0, ' ລືບ/Delete', 74, 4),
(336, 'statvictorycoinprovince', 'delete', 0, 0, ' ລືບ/Delete', 75, 4),
(337, 'statgovcoinministry', 'delete', 0, 0, ' ລືບ/Delete', 76, 4),
(338, 'stathighoverseaministry', 'delete', 0, 0, ' ລືບ/Delete', 77, 4),
(339, 'statvictoryoverseaministry', 'delete', 0, 0, ' ລືບ/Delete', 78, 4),
(340, 'statvictoryoverseaprovince', 'delete', 0, 0, ' ລືບ/Delete', 79, 4),
(341, 'statgovoverseaministry', 'delete', 0, 0, ' ລືບ/Delete', 80, 4),
(342, 'statgovcoinprovince', 'delete', 0, 0, ' ລືບ/Delete', 81, 4),
(343, 'statgovoverseaprovince', 'delete', 0, 0, ' ລືບ/Delete', 82, 4),
(344, 'statmapservice', 'delete', 0, 0, ' ລືບ/Delete', 83, 4),
(345, 'statmapproduce', 'delete', 0, 0, ' ລືບ/Delete', 84, 4),
(346, 'statexplore', 'delete', 0, 0, ' ລືບ/Delete', 85, 4),
(347, 'NULL', 'delete', 0, 0, ' ລືບ/Delete', 86, 4),
(348, 'statexplore', 'delete', 0, 0, ' ລືບ/Delete', 87, 4),
(349, 'statofficersalary', 'delete', 0, 0, ' ລືບ/Delete', 88, 4),
(350, 'statofficertechnical', 'delete', 0, 0, ' ລືບ/Delete', 89, 4),
(351, 'statofficeragelevel', 'delete', 0, 0, ' ລືບ/Delete', 90, 4),
(352, 'statofficerethnic', 'delete', 0, 0, ' ລືບ/Delete', 91, 4),
(353, 'statposition', 'delete', 0, 0, ' ລືບ/Delete', 92, 4),
(354, 'statofficernew', 'delete', 0, 0, ' ລືບ/Delete', 93, 4),
(355, '#', 'delete', 0, 0, ' ລືບ/Delete', 94, 4),
(356, '#', 'delete', 0, 0, ' ລືບ/Delete', 95, 4),
(357, '#', 'delete', 0, 0, ' ລືບ/Delete', 96, 4),
(358, 'statofficerethnic', 'delete', 0, 0, ' ລືບ/Delete', 97, 4),
(359, 'stat-single-gateway-implementation', 'print', 0, 0, ' ພິມ/Print', 36, 5),
(360, 'stat-legal', 'print', 0, 0, ' ພິມ/Print', 37, 5),
(361, 'stat-association-foundation', 'print', 0, 0, ' ພິມ/Print', 38, 5),
(362, 'stat-local-admin', 'print', 0, 0, ' ພິມ/Print', 39, 5),
(363, 'stat-ethnic', 'print', 0, 0, ' ພິມ/Print', 40, 5),
(364, 'stat-religion', 'print', 0, 0, ' ພິມ/Print', 41, 5),
(365, 'stat-religion-teacher', 'print', 0, 0, ' ພິມ/Print', 42, 6),
(366, 'stat-religion-place', 'print', 0, 0, ' ພິມ/Print', 43, 5),
(367, 'stat-population-movement', 'print', 0, 0, ' ພິມ/Print', 44, 5),
(368, 'stat-population-movement-chart', 'print', 0, 0, ' ພິມ/Print', 45, 5),
(369, 'stat-officer', 'print', 0, 0, ' ພິມ/Print', 46, 5),
(370, 'statofficerage', 'print', 0, 0, ' ພິມ/Print', 47, 5),
(371, 'statofficerdegree', 'print', 0, 0, ' ພິມ/Print', 48, 5),
(372, 'statofficerresign', 'print', 0, 0, ' ພິມ/Print', 49, 5),
(373, 'statofficeradd', 'print', 0, 0, ' ພິມ/Print', 50, 5),
(374, 'statofficercontract', 'print', 0, 0, ' ພິມ/Print', 51, 5),
(375, 'statofficerposition', 'print', 0, 0, ' ພິມ/Print', 52, 5),
(376, 'statofficerneed', 'print', 0, 0, ' ພິມ/Print', 53, 5),
(377, 'statofficerministry', 'print', 0, 0, ' ພິມ/Print', 54, 5),
(378, 'statofficerorg', 'print', 0, 0, ' ພິມ/Print', 55, 5),
(379, 'statofficerprovince', 'print', 0, 0, ' ພິມ/Print', 56, 5),
(380, 'statofficerministry-add', 'print', 0, 0, ' ພິມ/Print', 57, 5),
(381, 'statofficerorganisation-add', 'print', 0, 0, ' ພິມ/Print', 58, 5),
(382, 'statofficerprovince-add', 'print', 0, 0, ' ພິມ/Print', 59, 5),
(383, 'statofficerministrytrain', 'print', 0, 0, ' ພິມ/Print', 60, 5),
(384, 'statofficerorganisationtrain', 'print', 0, 0, ' ພິມ/Print', 61, 5),
(385, 'statofficerprovincetrain', 'print', 0, 0, ' ພິມ/Print', 62, 5),
(386, 'statofficerministryupgrade', 'print', 0, 0, ' ພິມ/Print', 63, 5),
(387, 'statoffice-orgupgrade', 'print', 0, 0, ' ພິມ/Print', 64, 5),
(388, 'statofficer-province-upgrade', 'print', 0, 0, ' ພິມ/Print', 65, 5),
(389, 'statcourse', 'print', 0, 0, ' ພິມ/Print', 66, 5),
(390, 'statinstitutetrain', 'print', 0, 0, ' ພິມ/Print', 67, 5),
(391, 'statinstitutemeeting', 'print', 0, 0, ' ພິມ/Print', 68, 5),
(392, 'statresearch', 'print', 0, 0, ' ພິມ/Print', 69, 5),
(393, 'statdocument', 'print', 0, 0, ' ພິມ/Print', 70, 5),
(394, 'statcopy', 'print', 0, 0, ' ພິມ/Print', 71, 5),
(395, 'stathighcoinministry', 'print', 0, 0, ' ພິມ/Print', 72, 5),
(396, 'stathornorcoinprovince', 'print', 0, 0, ' ພິມ/Print', 73, 5),
(397, 'statvictorycoinministry', 'print', 0, 0, ' ພິມ/Print', 74, 5),
(398, 'statvictorycoinprovince', 'print', 0, 0, ' ພິມ/Print', 75, 5),
(399, 'statgovcoinministry', 'print', 0, 0, ' ພິມ/Print', 76, 5),
(400, 'stathighoverseaministry', 'print', 0, 0, ' ພິມ/Print', 77, 5),
(401, 'statvictoryoverseaministry', 'print', 0, 0, ' ພິມ/Print', 78, 5),
(402, 'statvictoryoverseaprovince', 'print', 0, 0, ' ພິມ/Print', 79, 5),
(403, 'statgovoverseaministry', 'print', 0, 0, ' ພິມ/Print', 80, 5),
(404, 'statgovcoinprovince', 'print', 0, 0, ' ພິມ/Print', 81, 5),
(405, 'statgovoverseaprovince', 'print', 0, 0, ' ພິມ/Print', 82, 5),
(406, 'statmapservice', 'print', 0, 0, ' ພິມ/Print', 83, 5),
(407, 'statmapproduce', 'print', 0, 0, ' ພິມ/Print', 84, 5),
(408, 'statexplore', 'print', 0, 0, ' ພິມ/Print', 85, 5),
(409, 'NULL', 'print', 0, 0, ' ພິມ/Print', 86, 5),
(410, 'statexplore', 'print', 0, 0, ' ພິມ/Print', 87, 5),
(411, 'statofficersalary', 'print', 0, 0, ' ພິມ/Print', 88, 5),
(412, 'statofficertechnical', 'print', 0, 0, ' ພິມ/Print', 89, 5),
(413, 'statofficeragelevel', 'print', 0, 0, ' ພິມ/Print', 90, 5),
(414, 'statofficerethnic', 'print', 0, 0, ' ພິມ/Print', 91, 5),
(415, 'statposition', 'print', 0, 0, ' ພິມ/Print', 92, 5),
(416, 'statofficernew', 'print', 0, 0, ' ພິມ/Print', 93, 5),
(417, '#', 'print', 0, 0, ' ພິມ/Print', 94, 5),
(418, '#', 'print', 0, 0, ' ພິມ/Print', 95, 5),
(419, '#', 'print', 0, 0, ' ພິມ/Print', 96, 5),
(420, 'statofficerethnic', 'print', 0, 0, ' ພິມ/Print', 97, 5),
(421, 'statofficerethnic', 'download', 0, 0, ' ສົ່ງອອກ/Export', 97, 6),
(422, 'stat-single-gateway-implementation', 'download', 0, 0, ' ສົ່ງອອກ/Export', 36, 6),
(423, 'stat-legal', 'download', 0, 0, ' ສົ່ງອອກ/Export', 37, 6),
(424, 'stat-association-foundation', 'download', 0, 0, ' ສົ່ງອອກ/Export', 38, 6),
(425, 'stat-local-admin', 'download', 0, 0, ' ສົ່ງອອກ/Export', 39, 6),
(426, 'stat-ethnic', 'download', 0, 0, ' ສົ່ງອອກ/Export', 40, 6),
(427, 'stat-religion', 'download', 0, 0, ' ສົ່ງອອກ/Export', 41, 6),
(428, 'stat-religion-teacher', 'download', 0, 0, ' ສົ່ງອອກ/Export', 42, 7),
(429, 'stat-religion-place', 'download', 0, 0, ' ສົ່ງອອກ/Export', 43, 6),
(430, 'stat-population-movement', 'download', 0, 0, ' ສົ່ງອອກ/Export', 44, 6),
(431, 'stat-population-movement-chart', 'download', 0, 0, ' ສົ່ງອອກ/Export', 45, 6),
(432, 'stat-officer', 'download', 0, 0, ' ສົ່ງອອກ/Export', 46, 6),
(433, 'statofficerage', 'download', 0, 0, ' ສົ່ງອອກ/Export', 47, 6),
(434, 'statofficerdegree', 'download', 0, 0, ' ສົ່ງອອກ/Export', 48, 6),
(435, 'statofficerresign', 'download', 0, 0, ' ສົ່ງອອກ/Export', 49, 6),
(436, 'statofficeradd', 'download', 0, 0, ' ສົ່ງອອກ/Export', 50, 6),
(437, 'statofficercontract', 'download', 0, 0, ' ສົ່ງອອກ/Export', 51, 6),
(438, 'statofficerposition', 'download', 0, 0, ' ສົ່ງອອກ/Export', 52, 6),
(439, 'statofficerneed', 'download', 0, 0, ' ສົ່ງອອກ/Export', 53, 6),
(440, 'statofficerministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 54, 6),
(441, 'statofficerorg', 'download', 0, 0, ' ສົ່ງອອກ/Export', 55, 6),
(442, 'statofficerprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 56, 6),
(443, 'statofficerministry-add', 'download', 0, 0, ' ສົ່ງອອກ/Export', 57, 6),
(444, 'statofficerorganisation-add', 'download', 0, 0, ' ສົ່ງອອກ/Export', 58, 6),
(445, 'statofficerprovince-add', 'download', 0, 0, ' ສົ່ງອອກ/Export', 59, 6),
(446, 'statofficerministrytrain', 'download', 0, 0, ' ສົ່ງອອກ/Export', 60, 6),
(447, 'statofficerorganisationtrain', 'download', 0, 0, ' ສົ່ງອອກ/Export', 61, 6),
(448, 'statofficerprovincetrain', 'download', 0, 0, ' ສົ່ງອອກ/Export', 62, 6),
(449, 'statofficerministryupgrade', 'download', 0, 0, ' ສົ່ງອອກ/Export', 63, 6),
(450, 'statoffice-orgupgrade', 'download', 0, 0, ' ສົ່ງອອກ/Export', 64, 6),
(451, 'statofficer-province-upgrade', 'download', 0, 0, ' ສົ່ງອອກ/Export', 65, 6),
(452, 'statcourse', 'download', 0, 0, ' ສົ່ງອອກ/Export', 66, 6),
(453, 'statinstitutetrain', 'download', 0, 0, ' ສົ່ງອອກ/Export', 67, 6),
(454, 'statinstitutemeeting', 'download', 0, 0, ' ສົ່ງອອກ/Export', 68, 6),
(455, 'statresearch', 'download', 0, 0, ' ສົ່ງອອກ/Export', 69, 6),
(456, 'statdocument', 'download', 0, 0, ' ສົ່ງອອກ/Export', 70, 6),
(457, 'statcopy', 'download', 0, 0, ' ສົ່ງອອກ/Export', 71, 6),
(458, 'stathighcoinministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 72, 6),
(459, 'stathornorcoinprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 73, 6),
(460, 'statvictorycoinministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 74, 6),
(461, 'statvictorycoinprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 75, 6),
(462, 'statgovcoinministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 76, 6),
(463, 'stathighoverseaministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 77, 6),
(464, 'statvictoryoverseaministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 78, 6),
(465, 'statvictoryoverseaprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 79, 6),
(466, 'statgovoverseaministry', 'download', 0, 0, ' ສົ່ງອອກ/Export', 80, 6),
(467, 'statgovcoinprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 81, 6),
(468, 'statgovoverseaprovince', 'download', 0, 0, ' ສົ່ງອອກ/Export', 82, 6),
(469, 'statmapservice', 'download', 0, 0, ' ສົ່ງອອກ/Export', 83, 6),
(470, 'statmapproduce', 'download', 0, 0, ' ສົ່ງອອກ/Export', 84, 6),
(471, 'statexplore', 'download', 0, 0, ' ສົ່ງອອກ/Export', 85, 6),
(472, 'NULL', 'download', 0, 0, ' ສົ່ງອອກ/Export', 86, 6),
(473, 'statexplore', 'download', 0, 0, ' ສົ່ງອອກ/Export', 87, 6),
(474, 'statofficersalary', 'download', 0, 0, ' ສົ່ງອອກ/Export', 88, 6),
(475, 'statofficertechnical', 'download', 0, 0, ' ສົ່ງອອກ/Export', 89, 6),
(476, 'statofficeragelevel', 'download', 0, 0, ' ສົ່ງອອກ/Export', 90, 6),
(477, 'statofficerethnic', 'download', 0, 0, ' ສົ່ງອອກ/Export', 91, 6),
(478, 'statposition', 'download', 0, 0, ' ສົ່ງອອກ/Export', 92, 6),
(479, 'statofficernew', 'download', 0, 0, ' ສົ່ງອອກ/Export', 93, 6),
(480, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 94, 6),
(481, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 95, 6),
(482, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 96, 6),
(483, '#', 'enquiry', 0, 0, ' Enquiry', 32, 1),
(484, '#', 'enquiry', 0, 0, ' Enquiry', 33, 1),
(486, '#', 'enquiry', 0, 0, ' Enquiry', 35, 1),
(487, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 32, 2),
(488, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 33, 2),
(490, '#', 'save', 0, 0, ' ເພີ່ມ/Add', 35, 2),
(495, '#', 'delete', 0, 0, ' ລືບ/Delete', 32, 4),
(496, '#', 'delete', 0, 0, ' ລືບ/Delete', 33, 4),
(498, '#', 'delete', 0, 0, ' ລືບ/Delete', 35, 4),
(499, '#', 'print', 0, 0, ' ພິມ/Print', 32, 5),
(500, '#', 'print', 0, 0, ' ພິມ/Print', 33, 5),
(502, '#', 'print', 0, 0, ' ພິມ/Print', 35, 5),
(503, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 32, 6),
(504, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 33, 6),
(506, '#', 'download', 0, 0, ' ສົ່ງອອກ/Export', 35, 6),
(507, 'stat-officer', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 46, 7),
(508, 'stat-goverment-unit', 'enquiry', 0, 0, ' Enquiry', 12, 7),
(509, 'stat-goverment-unit', 'inquiry', 0, 0, ' Inquiry', 12, 8),
(510, 'stat-goverment-unit', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 12, 9),
(511, 'stat-goverment-unit', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 12, 10),
(512, 'stat-goverment-unit', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 12, 11),
(513, 'stat-single-gateway-implementation', 'inquiry', 0, 0, ' Inquiry', 36, 7),
(514, 'stat-single-gateway-implementation', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 36, 8),
(515, 'stat-single-gateway-implementation', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 36, 9),
(516, 'stat-single-gateway-implementation', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 36, 10),
(517, 'stat-single-gateway-implementation', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 36, 11),
(518, 'stat-legal', 'inquiry', 0, 0, ' Inquiry', 37, 7),
(519, 'stat-legal', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 37, 8),
(520, 'stat-legal', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 37, 9),
(521, 'stat-legal', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 37, 10),
(522, 'stat-legal', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 37, 11),
(523, 'stat-association-foundation', 'inquiry', 0, 0, ' Inquiry', 38, 7),
(524, 'stat-association-foundation', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 38, 8),
(525, 'stat-association-foundation', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 38, 9),
(526, 'stat-association-foundation', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 38, 10),
(527, 'stat-association-foundation', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 38, 11),
(528, 'stat-local-admin', 'inquiry', 0, 0, ' Inquiry', 39, 7),
(529, 'stat-local-admin', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 39, 8),
(530, 'stat-local-admin', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 39, 9),
(531, 'stat-local-admin', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 39, 10),
(532, 'stat-local-admin', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 39, 11),
(533, 'stat-ethnic', 'inquiry', 0, 0, ' Inquiry', 40, 7),
(534, 'stat-ethnic', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 40, 8),
(535, 'stat-ethnic', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 40, 9),
(536, 'stat-ethnic', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 40, 10),
(537, 'stat-ethnic', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 40, 11),
(538, 'stat-religion', 'inquiry', 0, 0, ' Inquiry', 41, 7),
(539, 'stat-religion', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 41, 8),
(540, 'stat-religion', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 41, 9),
(541, 'stat-religion', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 41, 10),
(542, 'stat-religion', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 41, 11),
(543, 'stat-religion-teacher', 'inquiry', 0, 0, ' Inquiry', 42, 8),
(544, 'stat-religion-teacher', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 42, 9),
(545, 'stat-religion-teacher', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 42, 10),
(546, 'stat-religion-teacher', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 42, 11),
(547, 'stat-religion-teacher', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 42, 12),
(548, 'stat-religion-place', 'inquiry', 0, 0, ' Inquiry', 43, 7),
(549, 'stat-religion-place', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 43, 8),
(550, 'stat-religion-place', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 43, 9),
(551, 'stat-religion-place', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 43, 10),
(552, 'stat-religion-place', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 43, 11),
(553, 'stat-population-movement', 'inquiry', 0, 0, ' Inquiry', 44, 7),
(554, 'stat-population-movement', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 44, 8),
(555, 'stat-population-movement', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 44, 9),
(556, 'stat-population-movement', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 44, 10),
(557, 'stat-population-movement', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 44, 11),
(558, 'stat-population-movement-chart', 'inquiry', 0, 0, ' Inquiry', 45, 7),
(559, 'stat-population-movement-chart', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 45, 8),
(560, 'stat-population-movement-chart', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 45, 9);
INSERT INTO `action` (`id`, `class_name`, `method`, `deleted`, `controller_id`, `description`, `parent_id`, `position`) VALUES
(561, 'stat-population-movement-chart', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 45, 10),
(562, 'stat-population-movement-chart', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 45, 11),
(563, 'stat-officer', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 46, 8),
(564, 'stat-officer', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 46, 9),
(565, 'stat-officer', 'deletefile', 0, 0, ' ລຶບເອກະສານອ້າງອີງ', 46, 10),
(566, 'stat-officer-age', 'inquiry', 0, 0, 'Inquiry', 47, 7),
(567, 'stat-officer-degree', 'inquiry', 0, 0, 'Inquiry', 48, 7),
(568, 'stat-officer-resign', 'inquiry', 0, 0, 'Inquiry', 49, 7),
(569, 'stat-officer-add', 'inquiry', 0, 0, 'Inquiry', 50, 7),
(570, 'stat-officer-contract', 'inquiry', 0, 0, 'Inquiry', 51, 7),
(571, 'stat-officer-position', 'inquiry', 0, 0, 'Inquiry', 52, 7),
(572, 'stat-officer-need', 'inquiry', 0, 0, 'Inquiry', 53, 7),
(573, 'stat-officer-ministry', 'inquiry', 0, 0, 'Inquiry', 54, 7),
(574, 'stat-officer-org', 'inquiry', 0, 0, 'Inquiry', 55, 7),
(575, 'stat-officer-province', 'inquiry', 0, 0, 'Inquiry', 56, 7),
(576, 'stat-officer-ministry-add', 'inquiry', 0, 0, 'Inquiry', 57, 7),
(577, 'stat-officer-organisation-add', 'inquiry', 0, 0, 'Inquiry', 58, 7),
(578, 'stat-officer-province-add', 'inquiry', 0, 0, 'Inquiry', 59, 7),
(579, 'stat-officer-ministry-train', 'inquiry', 0, 0, 'Inquiry', 60, 7),
(580, 'stat-officer-organisation-train', 'inquiry', 0, 0, 'Inquiry', 61, 7),
(581, 'stat-officer-province-train', 'inquiry', 0, 0, 'Inquiry', 62, 7),
(582, 'stat-officer-ministry-upgrade', 'inquiry', 0, 0, 'Inquiry', 63, 7),
(583, 'stat-officer-organisation-upgrade', 'inquiry', 0, 0, 'Inquiry', 64, 7),
(584, 'stat-officer-province-upgrade', 'inquiry', 0, 0, 'Inquiry', 65, 7),
(585, 'stat-course', 'inquiry', 0, 0, 'Inquiry', 66, 7),
(586, 'stat-institute-train', 'inquiry', 0, 0, 'Inquiry', 67, 7),
(587, 'stat-institute-meeting', 'inquiry', 0, 0, 'Inquiry', 68, 7),
(588, 'stat-research', 'inquiry', 0, 0, 'Inquiry', 69, 7),
(589, 'stat-document', 'inquiry', 0, 0, 'Inquiry', 70, 7),
(590, 'statcopy', 'inquiry', 0, 0, 'Inquiry', 71, 7),
(591, 'stat-highcoin-ministry', 'inquiry', 0, 0, 'Inquiry', 72, 7),
(592, 'stat-hornorcoin-province', 'inquiry', 0, 0, 'Inquiry', 73, 7),
(593, 'stat-victorycoin-ministry', 'inquiry', 0, 0, 'Inquiry', 74, 7),
(594, 'stat-victorycoin-province', 'inquiry', 0, 0, 'Inquiry', 75, 7),
(595, 'stat-govcoin-ministry', 'inquiry', 0, 0, 'Inquiry', 76, 7),
(596, 'stat-highoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 77, 7),
(597, 'stat-victoryoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 78, 7),
(598, 'stat-victoryoversea-province', 'inquiry', 0, 0, 'Inquiry', 79, 7),
(599, 'stat-govoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 80, 7),
(600, 'stat-govcoin-province', 'inquiry', 0, 0, 'Inquiry', 81, 7),
(601, 'stat-govoversea-province', 'inquiry', 0, 0, 'Inquiry', 82, 7),
(602, 'stat-map-service', 'inquiry', 0, 0, 'Inquiry', 83, 7),
(603, 'stat-map-produce', 'inquiry', 0, 0, 'Inquiry', 84, 7),
(604, 'stat-explore', 'inquiry', 0, 0, 'Inquiry', 85, 7),
(605, 'NULL', 'inquiry', 0, 0, 'Inquiry', 86, 7),
(606, 'stat-explore', 'inquiry', 0, 0, 'Inquiry', 87, 7),
(607, 'stat-officer-age', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 47, 8),
(608, 'stat-officer-degree', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 48, 8),
(609, 'stat-officer-resign', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 49, 8),
(610, 'stat-officer-add', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 50, 8),
(611, 'stat-officer-contract', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 51, 8),
(612, 'stat-officer-position', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 52, 8),
(613, 'stat-officer-need', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 53, 8),
(614, 'stat-officer-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 54, 8),
(615, 'stat-officer-org', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 55, 8),
(616, 'stat-officer-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 56, 8),
(617, 'stat-officer-ministry-add', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 57, 8),
(618, 'stat-officer-organisation-add', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 58, 8),
(619, 'stat-officer-province-add', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 59, 8),
(620, 'stat-officer-ministry-train', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 60, 8),
(621, 'stat-officer-organisation-train', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 61, 8),
(622, 'stat-officer-province-train', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 62, 8),
(623, 'stat-officer-ministry-upgrade', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 63, 8),
(624, 'stat-officer-organisation-upgrade', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 64, 8),
(625, 'stat-officer-province-upgrade', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 65, 8),
(626, 'stat-course', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 66, 8),
(627, 'stat-institute-train', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 67, 8),
(628, 'stat-institute-meeting', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 68, 8),
(629, 'stat-research', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 69, 8),
(630, 'stat-document', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 70, 8),
(631, 'statcopy', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 71, 8),
(632, 'stat-highcoin-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 72, 8),
(633, 'stat-hornorcoin-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 73, 8),
(634, 'stat-victorycoin-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 74, 8),
(635, 'stat-victorycoin-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 75, 8),
(636, 'stat-govcoin-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 76, 8),
(637, 'stat-highoversea-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 77, 8),
(638, 'stat-victoryoversea-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 78, 8),
(639, 'stat-victoryoversea-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 79, 8),
(640, 'stat-govoversea-ministry', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 80, 8),
(641, 'stat-govcoin-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 81, 8),
(642, 'stat-govoversea-province', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 82, 8),
(643, 'stat-map-service', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 83, 8),
(644, 'stat-map-produce', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 84, 8),
(645, 'stat-explore', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 85, 8),
(646, 'NULL', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 86, 8),
(647, 'stat-explore', 'updload', 0, 0, 'ອັບໂຫຼເອກະສານອ້າງອີງ', 87, 8),
(648, 'stat-officer-age', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 47, 9),
(649, 'stat-officer-degree', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 48, 9),
(650, 'stat-officer-resign', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 49, 9),
(651, 'stat-officer-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 50, 9),
(652, 'stat-officer-contract', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 51, 9),
(653, 'stat-officer-position', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 52, 9),
(654, 'stat-officer-need', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 53, 9),
(655, 'stat-officer-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 54, 9),
(656, 'stat-officer-org', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 55, 9),
(657, 'stat-officer-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 56, 9),
(658, 'stat-officer-ministry-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 57, 9),
(659, 'stat-officer-organisation-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 58, 9),
(660, 'stat-officer-province-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 59, 9),
(661, 'stat-officer-ministry-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 60, 9),
(662, 'stat-officer-organisation-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 61, 9),
(663, 'stat-officer-province-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 62, 9),
(664, 'stat-officer-ministry-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 63, 9),
(665, 'stat-officer-organisation-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 64, 9),
(666, 'stat-officer-province-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 65, 9),
(667, 'stat-course', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 66, 9),
(668, 'stat-institute-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 67, 9),
(669, 'stat-institute-meeting', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 68, 9),
(670, 'stat-research', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 69, 9),
(671, 'stat-document', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 70, 9),
(672, 'statcopy', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 71, 9),
(673, 'stat-highcoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 72, 9),
(674, 'stat-hornorcoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 73, 9),
(675, 'stat-victorycoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 74, 9),
(676, 'stat-victorycoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 75, 9),
(677, 'stat-govcoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 76, 9),
(678, 'stat-highoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 77, 9),
(679, 'stat-victoryoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 78, 9),
(680, 'stat-victoryoversea-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 79, 9),
(681, 'stat-govoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 80, 9),
(682, 'stat-govcoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 81, 9),
(683, 'stat-govoversea-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 82, 9),
(684, 'stat-map-service', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 83, 9),
(685, 'stat-map-produce', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 84, 9),
(686, 'stat-explore', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 85, 9),
(687, 'NULL', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 86, 9),
(688, 'stat-explore', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 87, 9),
(689, 'stat-officer-age', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 47, 10),
(690, 'stat-officer-degree', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 48, 10),
(691, 'stat-officer-resign', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 49, 10),
(692, 'stat-officer-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 50, 10),
(693, 'stat-officer-contract', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 51, 10),
(694, 'stat-officer-position', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 52, 10),
(695, 'stat-officer-need', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 53, 10),
(696, 'stat-officer-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 54, 10),
(697, 'stat-officer-org', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 55, 10),
(698, 'stat-officer-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 56, 10),
(699, 'stat-officer-ministry-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 57, 10),
(700, 'stat-officer-organisation-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 58, 10),
(701, 'stat-officer-province-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 59, 10),
(702, 'stat-officer-ministry-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 60, 10),
(703, 'stat-officer-organisation-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 61, 10),
(704, 'stat-officer-province-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 62, 10),
(705, 'stat-officer-ministry-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 63, 10),
(706, 'stat-officer-organisation-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 64, 10),
(707, 'stat-officer-province-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 65, 10),
(708, 'stat-course', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 66, 10),
(709, 'stat-institute-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 67, 10),
(710, 'stat-institute-meeting', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 68, 10),
(711, 'stat-research', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 69, 10),
(712, 'stat-document', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 70, 10),
(713, 'statcopy', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 71, 10),
(714, 'stat-highcoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 72, 10),
(715, 'stat-hornorcoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 73, 10),
(716, 'stat-victorycoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 74, 10),
(717, 'stat-victorycoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 75, 10),
(718, 'stat-govcoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 76, 10),
(719, 'stat-highoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 77, 10),
(720, 'stat-victoryoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 78, 10),
(721, 'stat-victoryoversea-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 79, 10),
(722, 'stat-govoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 80, 10),
(723, 'stat-govcoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 81, 10),
(724, 'stat-govoversea-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 82, 10),
(725, 'stat-map-service', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 83, 10),
(726, 'stat-map-produce', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 84, 10),
(727, 'stat-explore', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 85, 10),
(728, 'NULL', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 86, 10),
(729, 'stat-explore', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 87, 10),
(730, 'stat-officer-age', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 47, 11),
(731, 'stat-officer-degree', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 48, 11),
(732, 'stat-officer-resign', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 49, 11),
(733, 'stat-officer-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 50, 11),
(734, 'stat-officer-contract', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 51, 11),
(735, 'stat-officer-position', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 52, 11),
(736, 'stat-officer-need', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 53, 11),
(737, 'stat-officer-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 54, 11),
(738, 'stat-officer-org', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 55, 11),
(739, 'stat-officer-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 56, 11),
(740, 'stat-officer-ministry-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 57, 11),
(741, 'stat-officer-organisation-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 58, 11),
(742, 'stat-officer-province-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 59, 11),
(743, 'stat-officer-ministry-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 60, 11),
(744, 'stat-officer-organisation-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 61, 11),
(745, 'stat-officer-province-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 62, 11),
(746, 'stat-officer-ministry-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 63, 11),
(747, 'stat-officer-organisation-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 64, 11),
(748, 'stat-officer-province-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 65, 11),
(749, 'stat-course', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 66, 11),
(750, 'stat-institute-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 67, 11),
(751, 'stat-institute-meeting', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 68, 11),
(752, 'stat-research', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 69, 11),
(753, 'stat-document', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 70, 11),
(754, 'statcopy', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 71, 11),
(755, 'stat-highcoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 72, 11),
(756, 'stat-hornorcoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 73, 11),
(757, 'stat-victorycoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 74, 11),
(758, 'stat-victorycoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 75, 11),
(759, 'stat-govcoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 76, 11),
(760, 'stat-highoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 77, 11),
(761, 'stat-victoryoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 78, 11),
(762, 'stat-victoryoversea-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 79, 11),
(763, 'stat-govoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 80, 11),
(764, 'stat-govcoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 81, 11),
(765, 'stat-govoversea-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 82, 11),
(766, 'stat-map-service', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 83, 11),
(767, 'stat-map-produce', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 84, 11),
(768, 'stat-explore', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 85, 11),
(769, 'NULL', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 86, 11),
(770, 'stat-explore', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phisical Year', 87, 11);

-- --------------------------------------------------------

--
-- Table structure for table `approver`
--

CREATE TABLE IF NOT EXISTS `approver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `ministry_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approver_level_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approver_ministry1_idx` (`ministry_id`),
  KEY `fk_approver_province1_idx` (`province_id`),
  KEY `fk_approver_approver_level1_idx` (`approver_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `approver`
--

INSERT INTO `approver` (`id`, `deleted`, `ministry_id`, `province_id`, `approver_level_id`) VALUES
(1, 0, 1, NULL, 1),
(2, 0, NULL, 1, 2),
(3, 0, NULL, 17, 2),
(4, 0, NULL, 16, 2),
(5, 0, NULL, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `approver_level`
--

CREATE TABLE IF NOT EXISTS `approver_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `code` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M:Ministry\nP:Province',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `approver_level`
--

INSERT INTO `approver_level` (`id`, `name`, `deleted`, `position`, `code`) VALUES
(1, 'ຂັ້ນກະຊວງພາຍໃນອະນຸມັດ', 0, 1, 'M'),
(2, 'ຂັ້ນແຂວງອະນຸມັດ', 0, 2, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
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
  KEY `fk_attachment_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`menu_id`, `name`, `deleted`, `user_id`, `id`, `phiscal_year_id`, `upload_date`, `issued_date`, `issued_no`, `issued_by`, `data`, `dir`, `original_name`) VALUES
(100, 'stat_highcoin_ministry_2017_10_19_002128.jpg', 1, 1, 1, 1, '2017-10-19 00:21:28', '2017-10-04 00:00:00', '0', 'gg', NULL, '2017', '10520821_764675226942214_7408213358830219784_o.jpg'),
(71, 'stat_local_admin_2017_10_19_020704.xlsx', 0, 1, 2, 1, '2017-10-19 02:07:04', '2017-10-18 00:00:00', 'ຢຟໂ', 'ເດດດດດ', NULL, '2017', 'ImportList.xlsx'),
(71, 'stat_local_admin_2017_10_19_020730.eddx', 1, 1, 3, 1, '2017-10-19 02:07:30', '2017-10-18 00:00:00', '1212121', 'ກດກດກດ', NULL, '2017', 'Finger print network.eddx');

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE IF NOT EXISTS `award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_award_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`id`, `name`, `deleted`, `user_id`, `position`) VALUES
(1, 'ຜົນງານ 70 ປີ ວັນສ້າງຕັ້ງ', 0, 2, 1),
(2, 'ພັດທະນາການສຶກສາ ແລະ ກິລາ', 0, 2, NULL),
(3, 'ຜົນງານ 35 ປີ', 0, 2, NULL),
(4, 'ຜົນງານ 60 ປີ ວັນສ້າງຕັ້ງ', 0, 2, NULL),
(5, 'ບັ້ນ 3 ສ້າງ', 0, 2, NULL),
(6, 'ບັ້ນຕ່າງໆ', 0, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_book_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `deleted`, `position`, `last_update`, `user_id`) VALUES
(1, 'ປຶ້ມກ່ອນປີ 1975', 0, 1, '2017-09-16 18:19:24', 2),
(2, 'ປຶ້ມພາຍຫຼັງປົດປ່ອຍຊາດ', 0, 2, '2017-09-16 18:19:42', 2),
(3, 'ເອກະສານປະເພດກະແຊັດ', 0, 3, '2017-09-16 18:19:57', 2),
(4, 'ວີດີໂອ', 0, 4, '2017-09-16 18:20:10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
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
  KEY `fk_branch_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `code`, `name`, `address`, `tel`, `deleted`, `position`, `remark`, `user_id`, `last_update`, `ministry_id`) VALUES
(1, NULL, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(2, NULL, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(3, NULL, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(4, NULL, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(5, NULL, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(6, NULL, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(7, NULL, 'ກົມພັດທະນາການບໍລິຫານລັດ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(8, NULL, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(9, NULL, 'ກົມແຜນທີ່ແຫ່ງຊາດ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(10, NULL, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(11, NULL, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(12, NULL, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', NULL, NULL, 0, 1, NULL, 1, NULL, 27),
(13, NULL, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', NULL, NULL, 0, 1, NULL, 1, NULL, 27);

-- --------------------------------------------------------

--
-- Table structure for table `controller`
--

CREATE TABLE IF NOT EXISTS `controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE IF NOT EXISTS `district` (
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
  KEY `fk_district_user` (`input_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `district_code`, `district_name`, `province_id`, `record_status`, `input_id`, `input_dt_stamp`, `deleted`) VALUES
(1, '0101', 'ຈັນທະບູລີ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(2, '0102', 'ສີໂຄດຕະບອງ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(3, '0103', 'ສີສັດຕະນາກ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(4, '0104', 'ໄຊເສດຖາ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(5, '0105', 'ນາຊາຍທອງ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(6, '0106', 'ໄຊທານີ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(7, '0107', 'ຫາດຊາຍຟອງ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(8, '0108', 'ສັງທອງ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(9, '0109', 'ປາກງື່ມ', 1, NULL, NULL, '2017-09-01 09:48:59', 0),
(10, '0201', 'ຜົ້ງສາລີ', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(11, '331', 'ໄຊເສດຖາ', 17, NULL, NULL, '2017-09-01 09:48:59', 0),
(12, '2901', 'ໄກສອນພົມວິຫານ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(13, '2902', 'ອຸທຸມພອນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(14, '201', 'ປາກຊັນ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(15, '2002', 'ສິງ', 3, NULL, NULL, '2017-09-01 09:48:59', 0),
(16, '2503', 'ຫົງສາ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(17, '2201', 'ຫ້ວຍຊາຍ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(18, '1905', 'ບຸນເໜືອ', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(19, '1907', 'ບຸນໃຕ້', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(20, '2001', 'ຫລວງນໍ້າທາ', 3, NULL, NULL, '2017-09-01 09:48:59', 0),
(21, '2003', 'ລອງ', 3, NULL, NULL, '2017-09-01 09:48:59', 0),
(22, '2004', 'ວຽງພູຄາ', 3, NULL, NULL, '2017-09-01 09:48:59', 0),
(23, '2005', 'ນາແລ', 3, NULL, NULL, '2017-09-01 09:48:59', 0),
(24, '340', 'ອານຸວົງ', 18, NULL, NULL, '2017-09-01 09:48:59', 0),
(25, '2520', 'ຊຽງຮ່ອນ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(26, '23002', 'ນານ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(27, '2225', 'ຕົ້ນເຜິ້ງ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(28, '262', 'ພູກູດ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(29, '2389', 'ຊຽງເງິນ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(30, '242', 'ຊໍາໃຕ້', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(31, '301', 'ສາລະວັນ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(32, '302', 'ວາປີ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(33, '2330', 'ພູຄູນ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(34, '22123', 'ປາກທາ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(35, '22230', 'ຜາອຸດົມ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(36, '293', 'ໄຊບູລີ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(37, '2904', 'ອາດສະພັງທອງ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(38, '295', 'ພະລານໄຊ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(39, '296', 'ພີນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(40, '297', 'ເຊໂປນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(41, '298', 'ວິລະບູລີ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(42, '299', 'ໄຊພູທອງ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(43, '2910', 'ສອງຄອນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(44, '2911', 'ທ່າປາງທອງ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(45, '22', 'ປາກກະດິງ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(46, '23', 'ທ່າພະບາດ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(47, '24', 'ບໍລິຄັນ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(48, '25', 'ວຽງທອງ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(49, '26', 'ໄຊຈໍາພອນ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(50, '27', 'ຄໍາເກີດ', 11, NULL, NULL, '2017-09-01 09:48:59', 0),
(51, '211', 'ໄຊ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(52, '212', 'ແບງ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(53, '213', 'ຮູນ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(54, '214', 'ຫຼາ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(55, '215', 'ນາໝໍ້', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(56, '216', 'ງາ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(57, '217', 'ປາກແບງ', 4, NULL, NULL, '2017-09-01 09:48:59', 0),
(58, '225', 'ເມິງ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(59, '231', 'ຫຼວງພຣະບາງ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(60, '233', 'ປາກອູ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(61, '234', 'ຈອມເພັດ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(62, '235', 'ງອຍ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(63, '236', 'ນໍ້າບາກ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(64, '237', 'ວຽງຄໍາ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(65, '238', 'ໂພນໄຊ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(66, '239', 'ປາກແຊງ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(67, '2310', 'ໂພນທອງ', 6, NULL, NULL, '2017-09-01 09:48:59', 0),
(68, '241', 'ຊ້ອນ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(69, '243', 'ວຽງໄຊ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(70, '244', 'ສົບເບົາ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(71, '245', 'ຊຽງຄໍ້', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(72, '246', 'ແອດ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(73, '247', 'ຊໍາເໜືອ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(74, '248', 'ຫົວເມືອງ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(75, '251', 'ຄອບ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(76, '254', 'ເງິນ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(77, '255', 'ໄຊສະຖານ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(78, '256', 'ໄຊຍະບູລີ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(79, '257', 'ພຽງ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(80, '258', 'ທົ່ງມີໄຊ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(81, '259', 'ປາກລາຍ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(82, '2510', 'ແກ່ນທ້າວ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(83, '2511', 'ບໍ່ແຕນ', 8, NULL, NULL, '2017-09-01 09:48:59', 0),
(84, '263', 'ຜາໄຊ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(85, '264', 'ຄໍາ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(86, '265', 'ແປກ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(87, '266', 'ໜອງແຮດ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(88, '267', 'ໝອກ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(89, '268', 'ຄູນ', 9, NULL, NULL, '2017-09-01 09:48:59', 0),
(90, '271', 'ໂພນໂຮງ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(91, '272', 'ທຸລະຄົມ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(92, '273', 'ແກ້ວອຸດົມ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(93, '274', 'ກາສີ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(94, '275', 'ວັງວຽງ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(95, '276', 'ເຟືອງ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(96, '277', 'ຊະນະຄາມ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(97, '278', 'ແມດ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(98, '279', 'ວຽງຄໍາ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(99, '2710', 'ຫີນເຫີບ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(100, '2711', 'ໝື່ນ', 10, NULL, NULL, '2017-09-01 09:48:59', 0),
(101, '303', 'ລະຄອນເພັງ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(102, '304', 'ເລົ່າງາມ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(103, '305', 'ຄົງເຊໂດນ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(104, '306', 'ຕຸ້ມລານ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(105, '307', 'ຕະໂອ້ຍ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(106, '308', 'ສະໝ້ວຍ', 14, NULL, NULL, '2017-09-01 09:48:59', 0),
(107, '332', 'ຊານໄຊ', 17, NULL, NULL, '2017-09-01 09:48:59', 0),
(108, '333', 'ສະໜາມໄຊ', 17, NULL, NULL, '2017-09-01 09:48:59', 0),
(109, '334', 'ສາມັກຄີມີໄຊ', 17, NULL, NULL, '2017-09-01 09:48:59', 0),
(110, '335', 'ພູວົງ', 17, NULL, NULL, '2017-09-01 09:48:59', 0),
(111, '431', 'ທ່າແຂກ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(112, '432', 'ຫີນບູນ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(113, '433', 'ໜອງບົກ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(114, '434', 'ເຊບັ້ງໄຟ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(115, '435', 'ມະຫາໄຊ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(116, '436', 'ຍົມມະລາດ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(117, '437', 'ນາກາຍ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(118, '438', 'ໄຊບົວທອງ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(119, '439', 'ບົວລະພາ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(120, '4310', 'ຄູນຄໍາ', 12, NULL, NULL, '2017-09-01 09:48:59', 0),
(121, '161', 'ຈໍາປາສັກ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(122, '152', 'ທ່າແຕງ', 15, NULL, NULL, '2017-09-01 09:48:59', 0),
(123, '1521', 'ລະມາມ', 15, NULL, NULL, '2017-09-01 09:48:59', 0),
(124, '1512', 'ກະລືມ', 15, NULL, NULL, '2017-09-01 09:48:59', 0),
(125, '1513', 'ດາກຈຶງ', 15, NULL, NULL, '2017-09-01 09:48:59', 0),
(126, '162', 'ບາຈຽງຈະເລີນສຸກ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(127, '163', 'ປາກຊ່ອງ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(128, '164', 'ປະທຸມພອນ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(129, '165', 'ໂພນທອງ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(130, '166', 'ສຸຂຸມາ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(131, '167', 'ມູນລະປະໂມກ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(132, '168', 'ໂຂງ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(133, '0242', 'ຍອດອູ', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(134, '20203', 'ໃຫມ່', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(135, '20204', 'ຂວາ', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(136, '20205', 'ສໍາພັນ', 2, NULL, NULL, '2017-09-01 09:48:59', 0),
(137, '5227', 'ປາກທາ', 5, NULL, NULL, '2017-09-01 09:48:59', 0),
(138, '7543', 'ຮ້ຽມ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(139, '7544', 'ກວັນ', 7, NULL, NULL, '2017-09-01 09:48:59', 0),
(140, '13277', 'ຈຳພອນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(141, '13278', 'ຊົນບູລີ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(142, '13279', 'ນອງ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(143, '13280', 'ອາດສະພອນ', 13, NULL, NULL, '2017-09-01 09:48:59', 0),
(144, '16111', 'ຊະນະສົມບູນ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(145, '16117', 'ປາກເຊ', 16, NULL, NULL, '2017-09-01 09:48:59', 0),
(146, '183404', 'ທ່າໂທມ', 18, NULL, NULL, '2017-09-01 09:48:59', 0),
(147, '18333', 'ລ້ອງແຈ້ງ', 18, NULL, NULL, '2017-09-01 09:48:59', 0),
(148, '18332', 'ຮົ່ມ', 18, NULL, NULL, '2017-09-01 09:48:59', 0),
(149, '18366', 'ລ້ອງຊານ', 18, NULL, NULL, '2017-09-01 09:48:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ethnic`
--

CREATE TABLE IF NOT EXISTS `ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `ethnic`
--

INSERT INTO `ethnic` (`id`, `name`, `position`, `deleted`) VALUES
(1, 'ລາວ', 1, 0),
(2, 'ໄຕ', 2, 0),
(3, 'ຜູ້ໄທ', 3, 0),
(4, 'ລື້', 4, 0),
(5, 'ຍວນ', 5, 0),
(6, 'ຢັ້ງ', 6, 0),
(7, 'ແຊກ', 7, 0),
(8, 'ໄທເໜືອ', 8, 0),
(9, 'ກຶຶມມຸ', 9, 0),
(10, 'ໄປ່ຣ', 10, 0),
(11, 'ຊິງມູນ', 11, 0),
(12, 'ຜ່ອງ', 12, 0),
(13, 'ແທ່ນ', 13, 0),
(14, 'ເອິດູ', 14, 0),
(15, 'ບິດ', 15, 0),
(16, 'ລະເມດ', 16, 0),
(17, 'ສາມຕ່າວ', 17, 0),
(18, 'ກະຕາງ', 18, 0),
(19, 'ມະກອງ', 19, 0),
(20, 'ຕຣີ', 20, 0),
(21, 'ຢຣຸ', 21, 0),
(22, 'ຕຣຽງ', 22, 0),
(23, 'ຕະໂອ້ຍ', 23, 0),
(24, 'ແຢະ', 24, 0),
(25, 'ເບຣົາ', 25, 0),
(26, 'ກະຕູ', 26, 0),
(27, 'ຮາຣັກ', 27, 0),
(28, 'ໂອຍ', 28, 0),
(29, 'ກຣຽງ', 29, 0),
(30, 'ເຈັງ', 30, 0),
(31, 'ສະດາງ', 31, 0),
(32, 'ຊ່ວຍ', 32, 0),
(33, 'ລະວີ', 33, 0),
(34, 'ຍະເຫີນ', 34, 0),
(35, 'ປະໂກະ', 35, 0),
(36, 'ຂະແມ', 36, 0),
(37, 'ຕຸ້ມ', 37, 0),
(38, 'ງວນ', 38, 0),
(39, 'ມ້ອຍ', 39, 0),
(40, 'ກຣີ', 40, 0),
(41, 'ມົ້ງ', 41, 0),
(42, 'ອິວມຽນ', 42, 0),
(43, 'ອາຄາ', 43, 0),
(44, 'ຜູ້ນ້ອຍ', 44, 0),
(45, 'ລາຫູ', 45, 0),
(46, 'ສີລາ', 46, 0),
(47, 'ຮາຍີ', 47, 0),
(48, 'ໂລໂລ', 48, 0),
(49, 'ຫໍ້', 49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `foundation`
--

CREATE TABLE IF NOT EXISTS `foundation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_foundation_province1_idx` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `goverment_level`
--

CREATE TABLE IF NOT EXISTS `goverment_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `goverment_level`
--

INSERT INTO `goverment_level` (`id`, `name`, `deleted`, `position`) VALUES
(1, 'ກົມ', 0, 0),
(2, 'ສະຖາບັນ', 0, 0),
(3, 'ສູນ', 0, 0),
(4, 'ະຳຫະ', 1, 0),
(5, 'area', 1, 0),
(6, 'asda', 1, 0),
(7, 'ss', 1, 0),
(8, 'dd', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `goverment_unit`
--

CREATE TABLE IF NOT EXISTS `goverment_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_goverment_unit_branch1_idx` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `legal`
--

CREATE TABLE IF NOT EXISTS `legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `legal_type_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_legal_legal_type1_idx` (`legal_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `legal`
--

INSERT INTO `legal` (`id`, `name`, `deleted`, `legal_type_id`, `position`) VALUES
(1, 'ກົດໝາຍວ່າດ້ວຍການປົກຄອງທ້ອງຖິ່ນ', 0, 2, 1),
(2, 'ກົດໝາຍວ່າດ້ວຍພະນັກງານລັດຖະກອນ', 0, 2, 2),
(3, 'ດຳລັດວ່າດ້ວຍສະມາຄົມ', 0, 1, 3),
(4, 'ດຳລັດວ່າດ້ວຍມູນນິທິ', 0, 1, NULL),
(5, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງກະຊວງພາຍໃນ', 0, 1, NULL),
(6, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງອົງການປົກຄອງບ້ານ', 0, 1, NULL),
(7, 'ດຳລັດວ່າດ້ວຍການອອກໃບອະນຸຍາດສຳລັບ ນັກສຳຫຼວດວັດແທກ', 0, 1, NULL),
(8, 'ດຳລັດວ່າດ້ວຍການຝຶກອົບຮົມ ແລະ ພັດທະນາ ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 0, 1, NULL),
(9, 'ດຳລັດວ່າດ້ວຍການປະເມີນຜົນພະນັກງານ-ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 0, 1, NULL),
(10, 'ດຳລັດວ່າດ້ວຍລະບົບກົງຈັກການຈັດຕັ້ງ ຂອງອົງການບໍລິຫານແຫ່ງລັດ', 0, 1, NULL),
(11, 'ດຳລັດວ່າດ້ວຍການວາງແຜນກຳນົດລັດຖະກອນ', 0, 1, NULL),
(12, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງພະນັກງານລັດວິສາຫະກິດ', 0, 1, NULL),
(13, 'ດຳລັດວ່າດ້ວຍຕຳແໜ່ງວິຊາການຂອງລັດຖະກອນແຫ່ງ ສປປ ລາວ', 0, 1, NULL),
(14, 'ດຳລັດວ່າດ້ວຍການກຳນົດຕຳແໜ່ງງານ', 0, 1, NULL),
(15, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ນໍາໃຊ້ກາປະທັບ', 0, 1, NULL),
(16, 'ດຳລັດວ່າດ້ວຍການເພີ່ມທະວີວຽກງານແຂ່ງຂັນ-ຍ້ອງຍໍ', 0, 1, NULL),
(17, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ປົກປ້ອງການເຄື່ອນໄຫວສາສະໜາຢູ່ ສປປ ລາວ', 0, 1, NULL),
(18, 'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ແກ້ໄຂວຽກງານເຂດແດນເຊື່ອມຕໍ່ລະຫວ່າງນະຄອນຫຼວງວຽງຈັນ, ແຂວງກັບແຂວງ ທົ່ວປະເທດ', 0, 3, NULL),
(19, 'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ', 0, 3, NULL),
(20, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການມອບ-ໂອນບາງວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ໃຫ້ບັນດາກະຊວງ, ອົງການທຽບເທົ່າຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 0, 4, NULL),
(21, 'ຂໍ້ຕົກລັງວ່າດ້ວຍການແບ່ງຄວາມຮັບຜິດຊອບວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ລະຫວ່າງຄະນະຈັດຕັ້ງແຂວງ ກັບພະແນກພາຍໃນແຂວງ ຫ້ອງການຈັດຕັ້ງເມືອງ, ເທດສະບານ ແລະ ນະຄອນ ກັບຫ້ອງການພາຍໃນເມືອງ, ເທດສະບານ ແລະ ນະຄອນ', 0, 4, NULL),
(22, 'ຂໍ້ຕົກລົງວ່າດ້ວຍປະຕິບັດພັນທະ ແລະ ການປະກອບສ່ວນຂອງຊຸມຊົນໃນການພັດທະນາບ້ານ', 0, 4, NULL),
(23, ' ຂໍ້ຕົກລົງວ່າດວ້ຍການຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 0, 4, NULL),
(24, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 0, 4, NULL),
(25, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 0, 4, NULL),
(26, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງບັນດາກົມ ທຽບເທົ່າ, ພະແນກພາຍໃນຂັ້ນແຂວງ ແລະ ຫ້ອງການພາຍໃນເມືອງ', 0, 5, NULL),
(27, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການອອກເອກະສານທາງການຕອງອົງການປົກຄອງບ້ານ', 0, 5, NULL),
(28, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການເກັບເງິນປະກອບສ່ວນພັດທະນາບ້ານຂອງປະຊາຊົນ', 0, 5, NULL),
(29, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ຕົວໜັງສື ໃນການຮ່າງທຸລະກຳ (Font) ແລະເອກະສານຂອງກະຊວງພາຍໃນ', 0, 5, NULL),
(30, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງແລະ ການເຄື່ອນໄຫວຂອງໜ່ວຍງານຈັດຕັ້ງໝາຍເຫດທາງລັດຖະການ ແລະ ການປະເພມີນຜົນກະທົບຂອງນນິຕິກຳ ຂອງກະຊວງພາຍໃນ', 0, 5, NULL),
(31, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຍົກຍ້າຍພົນລະເມືອງ', 0, 5, NULL),
(32, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ເອກະສານກ່ຽວກັບວຽກງານທະບຽນຄອບຄົວ', 0, 5, NULL),
(33, 'ຄຳແນະນຳ ກ່ຽວກັບການຈັດຕັ້ງປະຕິບັດ ຄຳສັ່ງຂອງລັດຖະມົນຕີ ສະບັບເລກທີ 56/ນຍ', 0, 6, NULL),
(34, 'ຄຳແນະນຳກ່ຽວກັບການກວດຜ່ານບັນຊີຈຳນວນພົນຂອງພະນັກງານ-ລັດຖະກອນ', 0, 6, NULL),
(35, 'ຄຳແນະນຳກ່ຽວກັບການຈັດຕັ້ງກົດໝາຍວ່າດ້ວຍພະນັກງານ-ລັດຖະກອນ', 0, 6, NULL),
(36, 'ຄຳແນະນຳກ່ຽວກັບການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ', 0, 6, NULL),
(37, 'ແຈ້ງການກ່ຽວກັບການປ່ຽນແປງງວດໃນການຮັບບັນຈຸລັດຖະກອນ ແລະ ການຈັດຊັ້ນຂັ້ນເງິນເດືອນລັດຖະກອນ', 0, 7, NULL),
(38, 'ແຈ້ງການກ່ຽວກັບລາຍງານ ສະພາບກັນປັບປຸງສັບຂ້ອນວຽກງານຂອງຂະແໜງການພາຍໃນ', 0, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `legal_status`
--

CREATE TABLE IF NOT EXISTS `legal_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `legal_type`
--

CREATE TABLE IF NOT EXISTS `legal_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `legal_type`
--

INSERT INTO `legal_type` (`id`, `name`, `deleted`, `position`) VALUES
(1, 'ດຳລັດ', 0, 1),
(2, 'ກົດໝາຍ', 0, 2),
(3, 'ຄຳສັ່ງຂອງນາຍົກ ລັດຖະມົນຕີ', 0, 3),
(4, 'ຂໍ້ຕົກລົງຂອງ ນາຍົກ ລັດຖະມົນຕີ', 0, 4),
(5, 'ຂໍ້ຕົກລົງຂອງ ລັດຖະມົນຕີກະຊວງພາຍໃນ', 0, 5),
(6, 'ຄຳແນະນໍາ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ', 0, 6),
(7, 'ລະບຽບການຕ່າງໆ', 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
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
  PRIMARY KEY (`id`),
  KEY `fk_menu_menugroup1_idx` (`menugroup_id`),
  KEY `fk_menu_menu1_idx` (`menu_parent_id`),
  KEY `fk_menu_user_id` (`input_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=476 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `icon`, `description`, `deleted`, `menugroup_id`, `menu_parent_id`, `input_id`, `input_dt_stamp`, `position`, `table_name`) VALUES
(1, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', NULL, NULL, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 0, NULL, 3, NULL, '2017-09-03 18:41:53', 14, NULL),
(2, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 'stat-officer-salary', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 0, NULL, 1, NULL, '2017-09-03 18:45:05', 1, 'stat_officer_salary'),
(3, 'ກົມ', '#', NULL, 'ກົມ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 1, '#'),
(13, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', NULL, NULL, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', 0, NULL, 3, NULL, '2017-09-03 18:45:38', 7, NULL),
(14, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 'stat-course', NULL, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 0, NULL, 13, NULL, '2017-09-03 18:47:12', 1, 'stat_course'),
(21, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', NULL, NULL, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', 0, NULL, 3, NULL, '2017-09-03 18:47:24', 3, NULL),
(22, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 'stat-religion', NULL, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 2, 'stat_religion'),
(23, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 'stat-religion-teacher', NULL, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 3, 'stat_religion_teacher'),
(24, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 'stat-religion-place', NULL, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 4, 'stat_religion_place'),
(25, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 'stat-ethnic', NULL, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 1, 'stat_ethnic'),
(27, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', NULL, NULL, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 18:49:19', 6, NULL),
(54, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', NULL, NULL, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', 0, NULL, 3, NULL, '2017-09-03 18:50:38', 4, NULL),
(56, 'ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ', 'stat-population-movement', NULL, 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ', 0, NULL, 54, NULL, '2017-09-03 18:51:25', 1, 'stat_population_movement'),
(57, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 'stat-population-movement-chart', NULL, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 0, NULL, 54, NULL, '2017-09-03 18:51:25', 2, 'stat_population_movement_chart'),
(67, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', NULL, NULL, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', 0, NULL, 3, NULL, '2017-09-03 18:51:37', 2, NULL),
(71, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 'stat-local-admin', NULL, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 0, NULL, 67, NULL, '2017-09-03 18:52:20', NULL, 'stat_local_admin'),
(79, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', NULL, NULL, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', 0, NULL, 3, NULL, '2017-09-03 18:52:28', 1, NULL),
(80, 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ', 'ministry', NULL, 'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 1, 'ministry'),
(81, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 'stat-goverment-unit', NULL, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 2, 'stat_goverment_unit'),
(82, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 'stat-legal', NULL, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 4, 'stat_legal'),
(83, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 'stat-single-gateway-implementation', NULL, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 3, 'stat_single_gateway_implementation'),
(84, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 'stat-association-foundation', NULL, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 5, 'stat_association_foundation'),
(86, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', '', NULL, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:53:18', 8, ''),
(87, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 'stat-copy', NULL, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 2, 'stat_copy'),
(88, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 'stat-document', NULL, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 1, 'stat_document'),
(89, 'ກົມແຜນທີ່ແຫ່ງຊາດ', NULL, NULL, 'ກົມແຜນທີ່ແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:54:01', 10, NULL),
(90, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 'stat-explore', NULL, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 3, 'stat_explore'),
(91, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 'stat-map-service', NULL, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 1, 'stat_map_service'),
(92, 'ສະຖິຕິການຜະລິດແຜນທີ່', 'stat-map-produce', NULL, 'ສະຖິຕິການຜະລິດແຜນທີ່', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 2, 'stat_map_produce'),
(93, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', NULL, NULL, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', 0, NULL, 3, NULL, '2017-09-03 18:55:01', 11, NULL),
(94, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 'stat-explore', NULL, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 0, NULL, 93, NULL, '2017-09-03 18:55:28', NULL, 'stat_explore'),
(95, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', NULL, NULL, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 0, NULL, 3, NULL, '2017-09-03 18:55:29', 9, NULL),
(96, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victorycoin-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 4, 'stat_victorycoin_province'),
(97, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 'stat-govcoin-province', NULL, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 10, 'stat_govcoin_province'),
(98, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govcoin-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 5, 'stat_govcoin_ministry'),
(99, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-victoryoversea-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 7, 'stat_victoryoversea_ministry'),
(100, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highcoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 1, 'stat_highcoin_ministry'),
(101, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highoversea-ministry', NULL, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 6, 'stat_highoversea_ministry'),
(102, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govoversea-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 9, 'stat_govoversea_ministry'),
(103, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victoryoversea-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 8, 'stat_victoryoversea_province'),
(104, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 'stat-hornorcoin-province', NULL, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 2, 'stat_hornorcoin_province'),
(105, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 'stat-victorycoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 3, 'stat_victorycoin_ministry'),
(106, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', NULL, NULL, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 0, NULL, 3, NULL, '2017-09-03 19:00:17', 13, NULL),
(109, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', NULL, NULL, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 19:01:13', 5, NULL),
(110, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 'stat-officer', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 0, NULL, 109, NULL, '2017-09-03 19:05:41', 1, 'stat_officer'),
(111, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 'stat-officer-need', NULL, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 0, NULL, 109, NULL, '2017-09-03 19:06:06', 8, 'stat_officer_need'),
(112, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 'stat-officer-degree', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 3, 'stat_officer_degree'),
(113, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age', NULL, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 2, 'stat_officer_age'),
(114, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-org', NULL, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 10, 'stat_officer_org'),
(115, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-officer-position', NULL, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 7, 'stat_officer_position'),
(116, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 'stat-officer-add', NULL, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 5, 'stat_officer_add'),
(117, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-officer-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 4, 'stat_officer_resign'),
(118, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 'stat-officer-contract', NULL, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 6, 'stat_officer_contract'),
(119, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 'stat-officer-ministry', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 0, NULL, 109, NULL, '2017-09-03 19:10:18', 9, 'stat_officer_ministry'),
(120, 'ຫ້ອງການກະຊວງ', NULL, NULL, 'ຫ້ອງການກະຊວງ', 0, NULL, 3, NULL, '2017-09-19 08:37:26', 12, NULL),
(122, 'ກົມກວດກາ', NULL, NULL, 'ກົມກວດກາ', 0, NULL, 3, NULL, '2017-09-19 08:43:44', 15, NULL),
(441, 'ຜູ້ໃຊ້ລະບົບ', 'user/manageuser', NULL, 'ຜູ້ໃຊ້ລະບົບ', 0, NULL, 0, NULL, '2017-09-19 09:25:56', 16, 'user/manageuser'),
(442, 'ສິດແລະບົດບາດ', 'user/managerole', NULL, 'ສິດແລະບົດບາດ', 0, NULL, 0, NULL, '2017-09-19 09:27:25', 17, 'user/managerole'),
(443, 'ຕັ້ງຄ່າ', NULL, NULL, 'ຕັ້ງຄ່າ', 0, NULL, 0, NULL, '2017-09-19 09:27:34', 18, NULL),
(444, 'Phiscal Year', 'phiscal-year', 'fa fa-circle-o', 'Phiscal Year', 0, 1, 443, 1, '2017-09-19 09:27:34', 1, 'phiscal_year'),
(445, 'Translation', 'message', '', 'Translation', 0, 1, 443, 1, '2017-09-19 09:27:34', 2, 'message'),
(446, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 'stat-officer-province', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 0, NULL, 109, NULL, '2017-09-25 19:11:04', 11, 'stat_officer_province'),
(447, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 'stat-officer-ministry-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 0, NULL, 109, NULL, '2017-09-25 19:16:43', 12, 'stat_officer_ministry_add'),
(448, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-organisation-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-25 19:18:36', 13, 'stat_officer_organisation_add'),
(449, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 'stat-officer-province-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 0, NULL, 109, NULL, '2017-09-25 19:19:33', 14, 'stat_officer_province_add'),
(450, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:22:58', 1, 'stat_officer_ministry_train'),
(451, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-organisation-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:24:15', 2, 'stat_officer_organisation_train'),
(452, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:25:30', 3, 'stat_officer_province_train'),
(453, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:27:21', 4, 'stat_officer_ministry_upgrade'),
(454, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-organisation-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:28:50', 5, 'stat_officer_organisation_upgrade'),
(457, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:29:59', 6, 'stat_officer_province_upgrade'),
(458, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 'stat-institute-train', NULL, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 0, NULL, 13, NULL, '2017-09-25 19:33:51', 2, 'stat_institute_train'),
(460, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 'stat-institute-meeting', NULL, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 0, NULL, 13, NULL, '2017-09-25 19:37:21', 3, 'stat_institute_meeting'),
(461, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 'stat-research', NULL, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 0, NULL, 13, NULL, '2017-09-25 19:39:45', 4, 'stat_research'),
(462, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-govoversea-province', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-25 19:59:15', 11, 'stat_govoversea_province'),
(463, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', NULL, NULL, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 0, NULL, 89, NULL, '2017-09-25 20:05:03', 4, NULL),
(464, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 'stat-officer-technical', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 0, NULL, 1, NULL, '2017-09-25 20:09:25', 2, 'stat_officer_technical'),
(465, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age-level', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 1, NULL, '2017-09-25 20:11:26', 3, 'stat_officer_age_level'),
(466, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 'stat-officer-ethnic', NULL, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 0, NULL, 1, NULL, '2017-09-25 20:12:20', 3, 'stat_officer_ethnic'),
(467, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-position', NULL, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:14:05', 4, 'stat_position'),
(469, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 'stat-officer-new', NULL, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:04', 5, 'stat_officer_new'),
(471, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:59', 6, 'stat_resign'),
(472, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 'stat-contract', NULL, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 0, NULL, 1, NULL, '2017-09-25 20:16:26', 7, 'stat_contract'),
(473, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 'stat-oda', NULL, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 0, NULL, 106, NULL, '2017-09-25 20:17:01', 8, 'stat_oda'),
(475, 'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ', 'stat-officer-ethnic', NULL, 'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ', 0, NULL, 1, NULL, '2017-09-25 20:17:01', 9, 'stat_officer_ethnic');

-- --------------------------------------------------------

--
-- Table structure for table `menugroup`
--

CREATE TABLE IF NOT EXISTS `menugroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_menugroup_user_id` (`input_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `menugroup`
--

INSERT INTO `menugroup` (`id`, `name`, `deleted`, `input_id`, `input_dt_stamp`) VALUES
(1, 'ການຕັ້ງຄ່າ', 0, 1, '2017-09-03 17:19:01'),
(2, 'ຜູ້ຄຸ້ມຄອງລະບົບນ', 0, 1, '2017-09-03 17:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`,`language`),
  KEY `idx_message_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `language`, `translation`) VALUES
(2, 'la-LA', 'ເພີ່ມ'),
(8, 'la-LA', 'okaa'),
(10, 'la-LA', NULL),
(11, 'la-LA', NULL),
(12, 'la-LA', NULL),
(13, 'la-LA', NULL),
(14, 'la-LA', NULL),
(16, 'la-LA', ''),
(17, 'la-LA', ''),
(18, 'la-LA', ''),
(19, 'la-LA', ''),
(20, 'la-LA', ''),
(22, 'la-LA', 'asfsdfs'),
(23, 'la-LA', 'safds'),
(24, 'la-LA', 'sfasdf'),
(25, 'la-LA', 'xxxx'),
(26, 'la-LA', 'cc'),
(28, 'la-LA', 'eee'),
(29, 'la-LA', 'dd'),
(30, 'la-LA', 'gg'),
(32, 'la-LA', 'lpp'),
(33, 'la-LA', ''),
(34, 'la-LA', ''),
(35, 'la-LA', ''),
(36, 'la-LA', ''),
(37, 'la-LA', ''),
(38, 'la-LA', ''),
(39, 'la-LA', 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)'),
(40, 'la-LA', ''),
(41, 'la-LA', ''),
(42, 'la-LA', ''),
(43, 'la-LA', 'ວັນທີເລີ່ມ'),
(44, 'la-LA', 'ວັນທີສຳເລັດ'),
(45, 'la-LA', ''),
(46, 'la-LA', ''),
(47, 'la-LA', ''),
(48, 'la-LA', ''),
(49, 'la-LA', ''),
(50, 'la-LA', ''),
(51, 'la-LA', ''),
(52, 'la-LA', 'ປີ'),
(53, 'la-LA', ''),
(54, 'la-LA', ''),
(55, 'la-LA', 'ກະຊວງ'),
(56, 'la-LA', ''),
(57, 'la-LA', ''),
(58, 'la-LA', ''),
(59, 'la-LA', ''),
(60, 'la-LA', 'ເພີ່ມໃໝ່'),
(61, 'la-LA', 'ບັນທຶກ'),
(62, 'la-LA', ''),
(63, 'la-LA', ''),
(64, 'la-LA', ''),
(65, 'la-LA', 'ລວມ'),
(66, 'la-LA', ''),
(67, 'la-LA', ''),
(68, 'la-LA', ''),
(69, 'la-LA', ''),
(70, 'la-LA', ''),
(71, 'la-LA', ''),
(72, 'la-LA', ''),
(73, 'la-LA', ''),
(74, 'la-LA', ''),
(75, 'la-LA', ''),
(76, 'la-LA', ''),
(77, 'la-LA', ''),
(78, 'la-LA', ''),
(79, 'la-LA', ''),
(80, 'la-LA', ''),
(81, 'la-LA', 'ລ/ດ'),
(82, 'la-LA', 'ໝາຍເຫດ'),
(83, 'la-LA', ''),
(84, 'la-LA', ''),
(85, 'la-LA', ''),
(86, 'la-LA', ''),
(87, 'la-LA', ''),
(88, 'la-LA', ''),
(89, 'la-LA', ''),
(90, 'la-LA', ''),
(91, 'la-LA', ''),
(92, 'la-LA', ''),
(93, 'la-LA', ''),
(101, 'la-LA', ''),
(102, 'la-LA', 'ກົມ'),
(103, 'la-LA', 'ສະຖາບັນ'),
(104, 'la-LA', 'ສູນ'),
(105, 'la-LA', 'ສະຖາບັນ'),
(106, 'la-LA', ''),
(107, 'la-LA', ''),
(108, 'la-LA', ''),
(110, 'la-LA', 'ຫ້ອງການ'),
(111, 'la-LA', ''),
(112, 'la-LA', ''),
(113, 'la-LA', 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ'),
(114, 'la-LA', 'ຊື່ໜ່ວຍງານ'),
(115, 'la-LA', ''),
(116, 'la-LA', ''),
(117, 'la-LA', ''),
(118, 'la-LA', ''),
(119, 'la-LA', ''),
(120, 'la-LA', ''),
(121, 'la-LA', ''),
(122, 'la-LA', ''),
(123, 'la-LA', ''),
(124, 'la-LA', ''),
(125, 'la-LA', ''),
(126, 'la-LA', ''),
(127, 'la-LA', ''),
(128, 'la-LA', ''),
(131, 'la-LA', ''),
(132, 'la-LA', ''),
(133, 'la-LA', ''),
(134, 'la-LA', ''),
(135, 'la-LA', ''),
(136, 'la-LA', 'ຂັ້ນຜູ້ອະນຸມັດ'),
(137, 'la-LA', 'ຜູ້ອະນຸມັດ'),
(138, 'la-LA', 'ຜູ້ອະນຸມັດ'),
(139, 'la-LA', ''),
(140, 'la-LA', 'ຂັ້ນຜູ້ອະນຸມັດ'),
(141, 'la-LA', ''),
(142, 'la-LA', 'ແຂວງ'),
(143, 'la-LA', 'ສະຖິຕິສະມາຄົມ/ມູນນິທິ ໃນທົ່ວປະເທດ'),
(144, 'la-LA', ''),
(145, 'la-LA', 'ສະຖິຕິສະມາຄົມ/ມູນນິທິ ໃນທົ່ວປະເທດ'),
(146, 'la-LA', 'ສະຖິຕິສະມາຄົມ/ມູນນິທິ ໃນທົ່ວປະເທດ'),
(147, 'la-LA', 'ສະມາຄົມ'),
(148, 'la-LA', 'ມູນນິທິ'),
(149, 'la-LA', ''),
(150, 'la-LA', 'ມູນນິທິ'),
(151, 'la-LA', ''),
(152, 'la-LA', ''),
(153, 'la-LA', ''),
(154, 'la-LA', ''),
(155, 'la-LA', ''),
(156, 'la-LA', ''),
(157, 'la-LA', 'ລ'),
(158, 'la-LA', 'ຍ'),
(159, 'la-LA', ''),
(160, 'la-LA', ''),
(161, 'la-LA', 'ຈຳນວນປພົນລະເມືອງ'),
(162, 'la-LA', 'ບ້ານ'),
(163, 'la-LA', ''),
(164, 'la-LA', ''),
(165, 'la-LA', ''),
(166, 'la-LA', 'ສະມາຄົມ/ມູນນິທິ'),
(167, 'la-LA', ''),
(168, 'la-LA', ''),
(169, 'la-LA', ''),
(170, 'la-LA', ''),
(171, 'la-LA', 'ເມືອງ'),
(172, 'la-LA', 'ຈຳນວນເກີດ'),
(173, 'la-LA', 'ຈຳນວນເສຍຊີວິດ'),
(174, 'la-LA', 'ແຕ່ງດອງ'),
(175, 'la-LA', 'ຢ່າຮ້າງ'),
(176, 'la-LA', 'ຍ້າຍມາ'),
(177, 'la-LA', 'ຍ້າຍອອກໄປ'),
(178, 'la-LA', 'ຈຳນວນພົນລະເມືອງ ທີ່ມີໜ້າຕົວຈິງ'),
(179, 'la-LA', ''),
(180, 'la-LA', ''),
(181, 'la-LA', ''),
(182, 'la-LA', ''),
(183, 'la-LA', ''),
(184, 'la-LA', ''),
(185, 'la-LA', ''),
(186, 'la-LA', ''),
(187, 'la-LA', ''),
(188, 'la-LA', ''),
(189, 'la-LA', ''),
(190, 'la-LA', ''),
(191, 'la-LA', ''),
(192, 'la-LA', ''),
(193, 'la-LA', ''),
(194, 'la-LA', ''),
(195, 'la-LA', ''),
(196, 'la-LA', 'ຍິງ'),
(197, 'la-LA', ''),
(198, 'la-LA', ''),
(199, 'la-LA', ''),
(200, 'la-LA', ''),
(201, 'la-LA', ''),
(202, 'la-LA', ''),
(203, 'la-LA', ''),
(204, 'la-LA', 'ຊົນເຜົ່າ'),
(205, 'la-LA', ''),
(206, 'la-LA', 'ຊົນເຜົ່າ'),
(207, 'la-LA', ''),
(208, 'la-LA', ''),
(209, 'la-LA', ''),
(210, 'la-LA', ''),
(211, 'la-LA', ''),
(212, 'la-LA', ''),
(213, 'la-LA', ''),
(214, 'la-LA', ''),
(215, 'la-LA', ''),
(216, 'la-LA', ''),
(217, 'la-LA', ''),
(218, 'la-LA', ''),
(219, 'la-LA', ''),
(220, 'la-LA', ''),
(221, 'la-LA', ''),
(222, 'la-LA', ''),
(223, 'la-LA', ''),
(224, 'la-LA', ''),
(225, 'la-LA', ''),
(226, 'la-LA', ''),
(227, 'la-LA', ''),
(228, 'la-LA', ''),
(229, 'la-LA', ''),
(230, 'la-LA', ''),
(231, 'la-LA', ''),
(232, 'la-LA', 'ລາຍການ'),
(233, 'la-LA', ''),
(234, 'la-LA', 'ຊາຍ'),
(235, 'la-LA', ''),
(236, 'la-LA', ''),
(237, 'la-LA', ''),
(238, 'la-LA', ''),
(239, 'la-LA', ''),
(240, 'la-LA', ''),
(241, 'la-LA', ''),
(242, 'la-LA', ''),
(243, 'la-LA', ''),
(244, 'la-LA', ''),
(245, 'la-LA', ''),
(246, 'la-LA', ''),
(247, 'la-LA', ''),
(248, 'la-LA', ''),
(249, 'la-LA', ''),
(250, 'la-LA', ''),
(251, 'la-LA', ''),
(252, 'la-LA', ''),
(253, 'la-LA', ''),
(254, 'la-LA', ''),
(255, 'la-LA', ''),
(256, 'la-LA', ''),
(257, 'la-LA', ''),
(258, 'la-LA', ''),
(259, 'la-LA', ''),
(260, 'la-LA', ''),
(261, 'la-LA', ''),
(262, 'la-LA', ''),
(263, 'la-LA', ''),
(264, 'la-LA', ''),
(265, 'la-LA', ''),
(266, 'la-LA', ''),
(267, 'la-LA', ''),
(268, 'la-LA', ''),
(269, 'la-LA', ''),
(270, 'la-LA', ''),
(271, 'la-LA', ''),
(272, 'la-LA', ''),
(273, 'la-LA', ''),
(274, 'la-LA', ''),
(275, 'la-LA', ''),
(276, 'la-LA', ''),
(277, 'la-LA', ''),
(278, 'la-LA', ''),
(279, 'la-LA', ''),
(280, 'la-LA', ''),
(281, 'la-LA', ''),
(282, 'la-LA', ''),
(283, 'la-LA', ''),
(284, 'la-LA', ''),
(285, 'la-LA', ''),
(286, 'la-LA', ''),
(287, 'la-LA', ''),
(288, 'la-LA', ''),
(289, 'la-LA', ''),
(290, 'la-LA', ''),
(293, 'la-LA', ''),
(294, 'la-LA', ''),
(295, 'la-LA', ''),
(296, 'la-LA', ''),
(297, 'la-LA', ''),
(298, 'la-LA', ''),
(299, 'la-LA', ''),
(300, 'la-LA', ''),
(301, 'la-LA', ''),
(302, 'la-LA', ''),
(303, 'la-LA', ''),
(308, 'la-LA', ''),
(309, 'la-LA', ''),
(310, 'la-LA', ''),
(311, 'la-LA', ''),
(312, 'la-LA', ''),
(313, 'la-LA', 'ຝຶກອົບຮົມວິຊາສະເພາະ'),
(314, 'la-LA', 'ຝຶກອົບຮົມວິຊາທິດສະດີ'),
(315, 'la-LA', 'ພາຍໃນ'),
(316, 'la-LA', 'ຕ່າງປະເທດ'),
(317, 'la-LA', ''),
(318, 'la-LA', ''),
(319, 'la-LA', ''),
(320, 'la-LA', ''),
(321, 'la-LA', ''),
(322, 'la-LA', ''),
(330, 'la-LA', ''),
(331, 'la-LA', ''),
(332, 'la-LA', ''),
(333, 'la-LA', ''),
(334, 'la-LA', ''),
(335, 'la-LA', ''),
(336, 'la-LA', ''),
(337, 'la-LA', ''),
(338, 'la-LA', ''),
(339, 'la-LA', ''),
(340, 'la-LA', ''),
(341, 'la-LA', ''),
(342, 'la-LA', ''),
(343, 'la-LA', ''),
(344, 'la-LA', ''),
(345, 'la-LA', ''),
(346, 'la-LA', ''),
(347, 'la-LA', ''),
(348, 'la-LA', ''),
(349, 'la-LA', ''),
(350, 'la-LA', ''),
(351, 'la-LA', ''),
(352, 'la-LA', ''),
(353, 'la-LA', ''),
(354, 'la-LA', ''),
(355, 'la-LA', ''),
(356, 'la-LA', ''),
(357, 'la-LA', ''),
(358, 'la-LA', ''),
(359, 'la-LA', ''),
(360, 'la-LA', ''),
(361, 'la-LA', ''),
(362, 'la-LA', ''),
(363, 'la-LA', ''),
(364, 'la-LA', ''),
(365, 'la-LA', ''),
(366, 'la-LA', ''),
(367, 'la-LA', ''),
(368, 'la-LA', ''),
(369, 'la-LA', ''),
(370, 'la-LA', ''),
(371, 'la-LA', ''),
(372, 'la-LA', ''),
(374, 'la-LA', ''),
(375, 'la-LA', ''),
(376, 'la-LA', ''),
(377, 'la-LA', ''),
(378, 'la-LA', ''),
(379, 'la-LA', ''),
(380, 'la-LA', ''),
(381, 'la-LA', ''),
(382, 'la-LA', ''),
(383, 'la-LA', ''),
(384, 'la-LA', ''),
(385, 'la-LA', ''),
(386, 'la-LA', ''),
(387, 'la-LA', ''),
(388, 'la-LA', ''),
(389, 'la-LA', ''),
(390, 'la-LA', ''),
(391, 'la-LA', ''),
(392, 'la-LA', ''),
(394, 'la-LA', ''),
(395, 'la-LA', ''),
(396, 'la-LA', ''),
(398, 'la-LA', ''),
(399, 'la-LA', ''),
(400, 'la-LA', 'ຍ້ອງຍໍຜົນງານ'),
(437, 'la-LA', ''),
(438, 'la-LA', ''),
(439, 'la-LA', ''),
(440, 'la-LA', ''),
(441, 'la-LA', ''),
(442, 'la-LA', ''),
(443, 'la-LA', ''),
(444, 'la-LA', ''),
(445, 'la-LA', ''),
(446, 'la-LA', ''),
(447, 'la-LA', ''),
(448, 'la-LA', ''),
(477, 'la-LA', ''),
(478, 'la-LA', ''),
(479, 'la-LA', ''),
(480, 'la-LA', ''),
(481, 'la-LA', ''),
(482, 'la-LA', ''),
(483, 'la-LA', ''),
(484, 'la-LA', ''),
(485, 'la-LA', ''),
(486, 'la-LA', ''),
(487, 'la-LA', ''),
(488, 'la-LA', ''),
(489, 'la-LA', ''),
(490, 'la-LA', ''),
(491, 'la-LA', ''),
(492, 'la-LA', ''),
(493, 'la-LA', ''),
(500, 'la-LA', ''),
(501, 'la-LA', ''),
(502, 'la-LA', ''),
(503, 'la-LA', ''),
(504, 'la-LA', ''),
(505, 'la-LA', ''),
(506, 'la-LA', ''),
(507, 'la-LA', ''),
(508, 'la-LA', ''),
(514, 'la-LA', ''),
(515, 'la-LA', ''),
(516, 'la-LA', ''),
(517, 'la-LA', ''),
(518, 'la-LA', ''),
(519, 'la-LA', ''),
(520, 'la-LA', ''),
(521, 'la-LA', ''),
(522, 'la-LA', ''),
(523, 'la-LA', ''),
(524, 'la-LA', ''),
(525, 'la-LA', ''),
(526, 'la-LA', ''),
(527, 'la-LA', ''),
(528, 'la-LA', ''),
(529, 'la-LA', ''),
(530, 'la-LA', ''),
(531, 'la-LA', ''),
(532, 'la-LA', ''),
(533, 'la-LA', ''),
(534, 'la-LA', ''),
(535, 'la-LA', ''),
(536, 'la-LA', ''),
(537, 'la-LA', ''),
(538, 'la-LA', ''),
(539, 'la-LA', ''),
(540, 'la-LA', ''),
(541, 'la-LA', ''),
(542, 'la-LA', ''),
(543, 'la-LA', ''),
(544, 'la-LA', ''),
(545, 'la-LA', ''),
(546, 'la-LA', ''),
(547, 'la-LA', ''),
(548, 'la-LA', ''),
(549, 'la-LA', ''),
(550, 'la-LA', ''),
(551, 'la-LA', ''),
(552, 'la-LA', ''),
(553, 'la-LA', ''),
(554, 'la-LA', ''),
(555, 'la-LA', ''),
(556, 'la-LA', ''),
(557, 'la-LA', ''),
(558, 'la-LA', ''),
(559, 'la-LA', ''),
(560, 'la-LA', ''),
(561, 'la-LA', ''),
(562, 'la-LA', ''),
(563, 'la-LA', ''),
(564, 'la-LA', ''),
(565, 'la-LA', ''),
(566, 'la-LA', ''),
(567, 'la-LA', ''),
(568, 'la-LA', ''),
(569, 'la-LA', ''),
(570, 'la-LA', ''),
(571, 'la-LA', ''),
(572, 'la-LA', ''),
(573, 'la-LA', ''),
(574, 'la-LA', ''),
(575, 'la-LA', ''),
(576, 'la-LA', ''),
(577, 'la-LA', ''),
(578, 'la-LA', ''),
(579, 'la-LA', ''),
(580, 'la-LA', ''),
(581, 'la-LA', ''),
(582, 'la-LA', ''),
(583, 'la-LA', ''),
(584, 'la-LA', ''),
(585, 'la-LA', ''),
(586, 'la-LA', ''),
(587, 'la-LA', ''),
(588, 'la-LA', ''),
(589, 'la-LA', ''),
(590, 'la-LA', ''),
(591, 'la-LA', ''),
(592, 'la-LA', ''),
(593, 'la-LA', ''),
(594, 'la-LA', ''),
(595, 'la-LA', ''),
(596, 'la-LA', ''),
(597, 'la-LA', ''),
(598, 'la-LA', ''),
(599, 'la-LA', ''),
(600, 'la-LA', ''),
(601, 'la-LA', ''),
(602, 'la-LA', ''),
(603, 'la-LA', ''),
(604, 'la-LA', ''),
(605, 'la-LA', ''),
(606, 'la-LA', ''),
(607, 'la-LA', ''),
(608, 'la-LA', ''),
(609, 'la-LA', ''),
(610, 'la-LA', ''),
(611, 'la-LA', ''),
(612, 'la-LA', ''),
(613, 'la-LA', ''),
(614, 'la-LA', ''),
(615, 'la-LA', ''),
(616, 'la-LA', ''),
(617, 'la-LA', ''),
(618, 'la-LA', ''),
(619, 'la-LA', ''),
(620, 'la-LA', ''),
(621, 'la-LA', ''),
(622, 'la-LA', ''),
(623, 'la-LA', ''),
(624, 'la-LA', ''),
(625, 'la-LA', ''),
(626, 'la-LA', ''),
(627, 'la-LA', ''),
(628, 'la-LA', ''),
(629, 'la-LA', ''),
(630, 'la-LA', ''),
(631, 'la-LA', ''),
(632, 'la-LA', ''),
(633, 'la-LA', ''),
(634, 'la-LA', ''),
(635, 'la-LA', ''),
(636, 'la-LA', ''),
(637, 'la-LA', ''),
(638, 'la-LA', ''),
(639, 'la-LA', ''),
(640, 'la-LA', ''),
(641, 'la-LA', ''),
(642, 'la-LA', ''),
(643, 'la-LA', ''),
(644, 'la-LA', ''),
(645, 'la-LA', ''),
(646, 'la-LA', ''),
(647, 'la-LA', ''),
(648, 'la-LA', ''),
(649, 'la-LA', ''),
(650, 'la-LA', ''),
(651, 'la-LA', ''),
(652, 'la-LA', ''),
(653, 'la-LA', ''),
(654, 'la-LA', ''),
(655, 'la-LA', ''),
(656, 'la-LA', ''),
(657, 'la-LA', ''),
(658, 'la-LA', ''),
(659, 'la-LA', ''),
(660, 'la-LA', ''),
(661, 'la-LA', ''),
(662, 'la-LA', ''),
(663, 'la-LA', ''),
(664, 'la-LA', ''),
(665, 'la-LA', ''),
(666, 'la-LA', ''),
(667, 'la-LA', ''),
(668, 'la-LA', ''),
(669, 'la-LA', ''),
(670, 'la-LA', ''),
(671, 'la-LA', ''),
(672, 'la-LA', ''),
(673, 'la-LA', ''),
(674, 'la-LA', ''),
(675, 'la-LA', ''),
(676, 'la-LA', ''),
(677, 'la-LA', ''),
(678, 'la-LA', ''),
(679, 'la-LA', ''),
(680, 'la-LA', ''),
(681, 'la-LA', ''),
(682, 'la-LA', ''),
(683, 'la-LA', ''),
(684, 'la-LA', ''),
(685, 'la-LA', ''),
(686, 'la-LA', ''),
(687, 'la-LA', ''),
(688, 'la-LA', ''),
(689, 'la-LA', ''),
(690, 'la-LA', ''),
(691, 'la-LA', ''),
(692, 'la-LA', ''),
(693, 'la-LA', ''),
(694, 'la-LA', ''),
(695, 'la-LA', ''),
(696, 'la-LA', ''),
(697, 'la-LA', ''),
(698, 'la-LA', ''),
(699, 'la-LA', ''),
(700, 'la-LA', ''),
(701, 'la-LA', ''),
(702, 'la-LA', ''),
(703, 'la-LA', ''),
(704, 'la-LA', ''),
(705, 'la-LA', ''),
(706, 'la-LA', ''),
(707, 'la-LA', ''),
(708, 'la-LA', ''),
(709, 'la-LA', ''),
(710, 'la-LA', ''),
(711, 'la-LA', ''),
(712, 'la-LA', ''),
(713, 'la-LA', ''),
(714, 'la-LA', ''),
(715, 'la-LA', ''),
(716, 'la-LA', ''),
(717, 'la-LA', ''),
(718, 'la-LA', ''),
(719, 'la-LA', ''),
(720, 'la-LA', ''),
(721, 'la-LA', ''),
(722, 'la-LA', ''),
(723, 'la-LA', ''),
(724, 'la-LA', ''),
(725, 'la-LA', ''),
(726, 'la-LA', ''),
(727, 'la-LA', ''),
(728, 'la-LA', ''),
(729, 'la-LA', ''),
(730, 'la-LA', ''),
(731, 'la-LA', ''),
(732, 'la-LA', ''),
(733, 'la-LA', ''),
(734, 'la-LA', ''),
(735, 'la-LA', ''),
(736, 'la-LA', ''),
(737, 'la-LA', ''),
(738, 'la-LA', ''),
(739, 'la-LA', ''),
(740, 'la-LA', ''),
(741, 'la-LA', ''),
(742, 'la-LA', ''),
(743, 'la-LA', ''),
(744, 'la-LA', ''),
(747, 'la-LA', ''),
(748, 'la-LA', ''),
(749, 'la-LA', ''),
(750, 'la-LA', ''),
(751, 'la-LA', ''),
(752, 'la-LA', ''),
(753, 'la-LA', ''),
(754, 'la-LA', ''),
(755, 'la-LA', ''),
(756, 'la-LA', ''),
(757, 'la-LA', ''),
(758, 'la-LA', ''),
(759, 'la-LA', ''),
(760, 'la-LA', ''),
(761, 'la-LA', ''),
(762, 'la-LA', ''),
(763, 'la-LA', ''),
(764, 'la-LA', ''),
(765, 'la-LA', ''),
(766, 'la-LA', ''),
(767, 'la-LA', ''),
(768, 'la-LA', ''),
(769, 'la-LA', ''),
(770, 'la-LA', ''),
(771, 'la-LA', ''),
(772, 'la-LA', ''),
(773, 'la-LA', ''),
(774, 'la-LA', ''),
(775, 'la-LA', ''),
(776, 'la-LA', ''),
(777, 'la-LA', ''),
(778, 'la-LA', ''),
(779, 'la-LA', ''),
(780, 'la-LA', ''),
(781, 'la-LA', ''),
(782, 'la-LA', ''),
(783, 'la-LA', ''),
(784, 'la-LA', ''),
(785, 'la-LA', ''),
(786, 'la-LA', ''),
(787, 'la-LA', ''),
(788, 'la-LA', ''),
(789, 'la-LA', ''),
(790, 'la-LA', ''),
(804, 'la-LA', ''),
(805, 'la-LA', ''),
(806, 'la-LA', ''),
(807, 'la-LA', ''),
(808, 'la-LA', ''),
(809, 'la-LA', ''),
(810, 'la-LA', ''),
(811, 'la-LA', ''),
(812, 'la-LA', ''),
(813, 'la-LA', ''),
(814, 'la-LA', ''),
(815, 'la-LA', ''),
(816, 'la-LA', ''),
(817, 'la-LA', ''),
(818, 'la-LA', ''),
(819, 'la-LA', ''),
(820, 'la-LA', ''),
(821, 'la-LA', ''),
(822, 'la-LA', ''),
(823, 'la-LA', ''),
(824, 'la-LA', ''),
(825, 'la-LA', '');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1503900150),
('m150207_210500_i18n_init', 1503900154),
('m170901_012901_init_db', 1504544278),
('m170901_015159_fix_menu_tabl', 1504544278),
('m170901_021803_tbprovin_district', 1504544278),
('m170903_121828_menu_vs_group', 1504544278),
('m170906_113344_tb_usr_role', 1506254686),
('m170906_114910_fix_ministry_tb', 1506254686),
('m170918_182247_addmenu_data', 1506254686),
('m170924_115836_arran_menu', 1506267236),
('m170924_131215_fn_procedure', 1506267236),
('m170930_040230_tbl_action', 1507973535),
('m170930_063144_fnNPro', 1507973535),
('m171004_163823_drop_func', 1507973535),
('m171004_182033_user_subordinate', 1507973535),
('m171011_065021_tb_usr_usr_hs_province', 1507973535);

-- --------------------------------------------------------

--
-- Table structure for table `ministry`
--

CREATE TABLE IF NOT EXISTS `ministry` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `ministry`
--

INSERT INTO `ministry` (`id`, `name`, `deleted`, `code`, `last_update`, `ministry_group_id`, `position`, `user_id`, `remark`, `input_dt_stamp`, `equal`) VALUES
(1, 'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້', 0, '1', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(2, 'ກະຊວງ ການເງິນ', 0, '2', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(3, 'ກະຊວງ ການຕ່າງປະເທດ', 0, '3', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(4, 'ສະພາແຫ່ງຊາດ', 0, '4', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(5, 'ສານປະຊາຊົນສູງສຸດ', 0, '5', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(6, 'ກະຊວງ ຍຸຕິທໍາ', 0, '6', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(25, 'ກະຊວງ ສຶກສາທິການ ແລະ ກິລາ', 0, '26', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(26, 'ສູນກາງຊາວໜຸ່ມ', 0, '27', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(27, 'ກະຊວງ ພາຍໃນ', 0, '28', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(28, 'ກະຊວງ ສາທາລະນະສຸກ', 0, '29', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(29, 'ກະຊວງ ໂຍທາທິການ ແລະ ຂົນສົ່ງ', 0, '30', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(30, 'ກະຊວງ ຖະແຫຼງຂ່າວ, ວັດທະນະທໍາ ແລະ ທ່ອງທ່ຽວ', 0, '31', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(31, 'ກະຊວງ ແຜນການ ແລະ ການລົງທຶນ', 0, '32', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(32, 'ກະຊວງ ແຮງງານ ແລະ ສະຫວັດດີການສັງຄົມ', 0, '33', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(33, 'ກະຊວງ ໄປສະນີ, ໂທລະຄົມມະນາຄົມ ແລະ ການສື່ສານ', 0, '34', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(34, 'ກະຊວງ ຊັບພະຍາກອນທໍາມະຊາດ ແລະ ສິ່ງແວດລ້ອມ', 0, '35', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(35, 'ກະຊວງ ວິທະຍາສາດ ແລະ ເທັກໂນໂລຊີ', 0, '36', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(36, 'ສະພາແຫ່ງຊາດ', 0, '37', '2017-09-06 19:58:52', 4, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(37, 'ສານປະຊາຊົນສູງສຸດ', 0, '38', '2017-09-06 19:58:52', 4, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(38, 'ກະຊວງ ພະລັງງານ ແລະ ບໍ່ແຮ່', 0, '39', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(39, 'ກະຊວງ ອຸດສາຫະກຳ ແລະ ການຄ້າ', 0, '40', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(40, 'ອົງການກວດກາລັດຖະບານ', 0, '41', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(41, 'ຫ້ອງວ່າການລັດຖະບານ', 0, '42', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(42, 'ທະນາຄານແຫ່ງ ສປປລາວ', 0, '43', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(52, 'ກະຊວງ ຍຸຕິທໍາ', 0, '53', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(53, 'ກະຊວງ ປ້ອງກັນປະເທດ', 0, '54', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(54, 'ກະຊວງ ປ້ອງກັນຄວາມສະຫງົບ', 0, '55', '2017-09-06 19:58:52', 1, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(55, 'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ', 0, '56', '2017-09-06 19:58:52', 5, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(56, 'ສະຖາບັນການເມືອງການປົກຄອງແຫ່ງຊາດ', 0, '57', '2017-09-06 19:58:52', 5, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(57, 'ອົງການກວດສອບແຫ່ງລັດ', 0, '58', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0),
(58, 'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້', 1, '1', '2017-10-15 04:00:36', 1, 0, 1, NULL, '2017-09-06 19:58:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ministry_group`
--

CREATE TABLE IF NOT EXISTS `ministry_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ministry_group`
--

INSERT INTO `ministry_group` (`id`, `name`, `deleted`, `position`, `input_dt_stamp`, `user_id`) VALUES
(1, 'ກະຊວງ', 0, 1, '2017-09-06 19:58:39', NULL),
(2, 'ອົງການທຽບເທົ່າ', 0, 1, '2017-09-06 19:58:39', NULL),
(3, 'ແຂວງ, ນະຄອນຫລວງ', 0, 1, '2017-09-06 19:58:39', NULL),
(4, 'ອົງການຈັດຕັ້ງສຸນກາງ', 0, 1, '2017-09-06 19:58:39', NULL),
(5, 'ສະຖາບັນ ແລະ ອົງການ', 0, 1, '2017-09-06 19:58:39', NULL),
(6, 'ອື່ນໆ', 0, 1, '2017-09-06 19:58:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `officer_level`
--

CREATE TABLE IF NOT EXISTS `officer_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_officer_level_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `officer_level`
--

INSERT INTO `officer_level` (`id`, `name`, `deleted`, `last_update`, `position`, `user_id`) VALUES
(1, 'ກ. ຂັ້ນກະຊວງ', 0, '2017-09-17 04:39:27', 1, 2),
(2, 'ຂ. ຂັ້ນແຂວງ', 0, '2017-09-17 04:39:42', 2, 2),
(3, 'ຄ. ຂັ້ນເມືອງ', 0, '2017-09-17 04:39:57', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE IF NOT EXISTS `organisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `organisation`
--

INSERT INTO `organisation` (`id`, `name`, `deleted`, `position`) VALUES
(1, 'ສະພາແຫ່ງຊາດ', 0, 1),
(2, 'ສານປະຊາຊົນສູງສຸດ', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `phiscal_year`
--

CREATE TABLE IF NOT EXISTS `phiscal_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `status` varchar(1) DEFAULT NULL COMMENT 'o:openning\nc:closed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `phiscal_year`
--

INSERT INTO `phiscal_year` (`id`, `year`, `start_date`, `end_date`, `deleted`, `status`) VALUES
(1, '2017', '2017-01-08 00:00:00', '2018-01-17 00:00:00', 0, 'O'),
(2, '2018', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 0, 'O');

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE IF NOT EXISTS `province` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `province_code`, `province_name`, `record_status`, `input_id`, `input_dt_stamp`, `deleted`, `position`) VALUES
(1, '01', 'ນະຄອນຫລວງວຽງຈັນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(2, '02', 'ຜົ້ງສາລີ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(3, '03', 'ຫຼວງນໍ້າທາ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(4, '05', 'ອຸດົມໄຊ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(5, '04', 'ບໍ່ແກ້ວ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(6, '06', 'ຫຼວງພະບາງ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(7, '07', 'ຫົວພັນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(8, '08', 'ໄຊຍະບູລີ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(9, '09', 'ຊຽງຂວາງ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(10, '10', 'ວຽງຈັນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(11, '11', 'ບໍລິຄໍາໄຊ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(12, '12', 'ຄໍາມ່ວນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(13, '13', 'ສະຫວັນນະເຂດ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(14, '14', 'ສາລະວັນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(15, '15', 'ເຊກອງ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(16, '16', 'ຈໍາປາສັກ', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(17, '17', 'ອັດຕະປື', NULL, NULL, '2017-09-01 09:48:56', 0, 0),
(18, '18', 'ໄຊສົມບູນ', NULL, NULL, '2017-09-01 09:48:56', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_province` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_role_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `deleted`, `user_id`, `input_dt_stamp`, `is_province`) VALUES
(1, 'Super Admin', 0, 1, '2017-09-24 19:04:46', NULL),
(2, 'test', 0, 2, '2017-10-10 18:16:13', NULL),
(3, 'CMS', 0, 2, '2017-10-26 23:33:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_action`
--

CREATE TABLE IF NOT EXISTS `role_has_action` (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `allowed` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `fk_role_has_action_action1_idx` (`action_id`),
  KEY `fk_role_has_action_role1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_has_action`
--

INSERT INTO `role_has_action` (`role_id`, `action_id`, `allowed`) VALUES
(2, 1, '1'),
(2, 2, '1'),
(2, 3, '1'),
(2, 4, '1'),
(2, 5, '1'),
(2, 6, '1'),
(2, 7, '1'),
(2, 9, '1'),
(2, 10, '1'),
(2, 11, '1'),
(2, 12, '1'),
(2, 13, '1'),
(2, 14, '1'),
(2, 17, '1'),
(2, 18, '1'),
(2, 19, '1'),
(2, 20, '1'),
(2, 21, '1'),
(2, 22, '1'),
(2, 23, '1'),
(2, 24, '1'),
(2, 25, '1'),
(2, 26, '1'),
(2, 27, '1'),
(2, 28, '1'),
(2, 29, '1'),
(2, 30, '1'),
(2, 31, '1'),
(2, 32, '1'),
(2, 33, '1'),
(2, 34, '1'),
(2, 35, '1'),
(2, 36, '1'),
(2, 37, '1'),
(2, 38, '1'),
(2, 39, '1'),
(2, 40, '1'),
(2, 41, '1'),
(2, 42, '1'),
(2, 43, '1'),
(2, 44, '1'),
(2, 45, '1'),
(2, 46, '1'),
(2, 47, '1'),
(2, 48, '1'),
(2, 49, '1'),
(2, 50, '1'),
(2, 51, '1'),
(2, 52, '1'),
(2, 53, '1'),
(2, 54, '1'),
(2, 55, '1'),
(2, 56, '1'),
(2, 57, '1'),
(2, 58, '1'),
(2, 59, '1'),
(2, 60, '1'),
(2, 61, '1'),
(2, 62, '1'),
(2, 63, '1'),
(2, 64, '1'),
(2, 65, '1'),
(2, 66, '1'),
(2, 67, '1'),
(2, 68, '1'),
(2, 69, '1'),
(2, 70, '1'),
(2, 71, '1'),
(2, 72, '1'),
(2, 73, '1'),
(2, 74, '1'),
(2, 75, '1'),
(2, 76, '1'),
(2, 77, '1'),
(2, 78, '1'),
(2, 79, '1'),
(2, 80, '1'),
(2, 81, '1'),
(2, 82, '1'),
(2, 83, '1'),
(2, 84, '1'),
(2, 85, '1'),
(2, 86, '1'),
(2, 87, '1'),
(2, 88, '1'),
(2, 89, '1'),
(2, 90, '1'),
(2, 91, '1'),
(2, 92, '1'),
(2, 93, '1'),
(2, 94, '1'),
(2, 95, '1'),
(2, 96, '1'),
(2, 97, '1'),
(2, 98, '1'),
(2, 99, '1'),
(2, 100, '1'),
(2, 101, '1'),
(2, 102, '1'),
(2, 103, '1'),
(2, 104, '1'),
(2, 105, '1'),
(2, 106, '1'),
(2, 107, '1'),
(2, 108, '1'),
(2, 109, '1'),
(2, 111, '1'),
(2, 112, '1'),
(2, 113, '1'),
(2, 114, '1'),
(2, 115, '1'),
(2, 116, '1'),
(2, 117, '1'),
(2, 118, '1'),
(2, 119, '1'),
(2, 120, '1'),
(2, 121, '1'),
(2, 122, '1'),
(2, 123, '1'),
(2, 124, '1'),
(2, 125, '1'),
(2, 126, '1'),
(2, 127, '1'),
(2, 128, '1'),
(2, 129, '1'),
(2, 130, '1'),
(2, 131, '1'),
(2, 132, '1'),
(2, 133, '1'),
(2, 134, '1'),
(2, 135, '1'),
(2, 136, '1'),
(2, 137, '1'),
(2, 138, '1'),
(2, 139, '1'),
(2, 140, '1'),
(2, 141, '1'),
(2, 142, '1'),
(2, 143, '1'),
(2, 144, '1'),
(2, 145, '1'),
(2, 146, '1'),
(2, 147, '1'),
(2, 148, '1'),
(2, 149, '1'),
(2, 150, '1'),
(2, 151, '1'),
(2, 152, '1'),
(2, 153, '1'),
(2, 154, '1'),
(2, 155, '1'),
(2, 156, '1'),
(2, 157, '1'),
(2, 158, '1'),
(2, 159, '1'),
(2, 160, '1'),
(2, 161, '1'),
(2, 162, '1'),
(2, 163, '1'),
(2, 164, '1'),
(2, 165, '1'),
(2, 166, '1'),
(2, 167, '1'),
(2, 168, '1'),
(2, 169, '1'),
(2, 170, '1'),
(2, 171, '1'),
(2, 172, '1'),
(2, 173, '1'),
(2, 174, '1'),
(2, 175, '1'),
(2, 176, '1'),
(2, 177, '1'),
(2, 178, '1'),
(2, 179, '1'),
(2, 180, '1'),
(2, 181, '1'),
(2, 182, '1'),
(2, 183, '1'),
(2, 184, '1'),
(2, 185, '1'),
(2, 186, '1'),
(2, 187, '1'),
(2, 188, '1'),
(2, 189, '1'),
(2, 190, '1'),
(2, 191, '1'),
(2, 192, '1'),
(2, 193, '1'),
(2, 194, '1'),
(2, 195, '1'),
(2, 196, '1'),
(2, 197, '1'),
(2, 198, '1'),
(2, 199, '1'),
(2, 200, '1'),
(2, 201, '1'),
(2, 202, '1'),
(2, 203, '1'),
(2, 204, '1'),
(2, 205, '1'),
(2, 206, '1'),
(2, 207, '1'),
(2, 208, '1'),
(2, 209, '1'),
(2, 210, '1'),
(2, 211, '1'),
(2, 212, '1'),
(2, 213, '1'),
(2, 214, '1'),
(2, 215, '1'),
(2, 216, '1'),
(2, 217, '1'),
(2, 218, '1'),
(2, 219, '1'),
(2, 220, '1'),
(2, 221, '1'),
(2, 222, '1'),
(2, 223, '1'),
(2, 224, '1'),
(2, 225, '1'),
(2, 226, '1'),
(2, 227, '1'),
(2, 228, '1'),
(2, 229, '1'),
(2, 230, '1'),
(2, 231, '1'),
(2, 232, '1'),
(2, 233, '1'),
(2, 234, '1'),
(2, 297, '1'),
(2, 298, '1'),
(2, 299, '1'),
(2, 300, '1'),
(2, 301, '1'),
(2, 302, '1'),
(2, 303, '1'),
(2, 304, '1'),
(2, 305, '1'),
(2, 306, '1'),
(2, 307, '1'),
(2, 308, '1'),
(2, 309, '1'),
(2, 310, '1'),
(2, 311, '1'),
(2, 312, '1'),
(2, 313, '1'),
(2, 314, '1'),
(2, 315, '1'),
(2, 316, '1'),
(2, 317, '1'),
(2, 318, '1'),
(2, 319, '1'),
(2, 320, '1'),
(2, 321, '1'),
(2, 322, '1'),
(2, 323, '1'),
(2, 324, '1'),
(2, 325, '1'),
(2, 326, '1'),
(2, 327, '1'),
(2, 328, '1'),
(2, 329, '1'),
(2, 330, '1'),
(2, 331, '1'),
(2, 332, '1'),
(2, 333, '1'),
(2, 334, '1'),
(2, 335, '1'),
(2, 336, '1'),
(2, 337, '1'),
(2, 338, '1'),
(2, 339, '1'),
(2, 340, '1'),
(2, 341, '1'),
(2, 342, '1'),
(2, 343, '1'),
(2, 344, '1'),
(2, 345, '1'),
(2, 346, '1'),
(2, 347, '1'),
(2, 348, '1'),
(2, 349, '1'),
(2, 350, '1'),
(2, 351, '1'),
(2, 352, '1'),
(2, 353, '1'),
(2, 354, '1'),
(2, 355, '1'),
(2, 356, '1'),
(2, 357, '1'),
(2, 358, '1'),
(2, 359, '1'),
(2, 360, '1'),
(2, 361, '1'),
(2, 362, '1'),
(2, 363, '1'),
(2, 364, '1'),
(2, 365, '1'),
(2, 366, '1'),
(2, 367, '1'),
(2, 368, '1'),
(2, 369, '1'),
(2, 370, '1'),
(2, 371, '1'),
(2, 372, '1'),
(2, 373, '1'),
(2, 374, '1'),
(2, 375, '1'),
(2, 376, '1'),
(2, 377, '1'),
(2, 378, '1'),
(2, 379, '1'),
(2, 380, '1'),
(2, 381, '1'),
(2, 382, '1'),
(2, 383, '1'),
(2, 384, '1'),
(2, 385, '1'),
(2, 386, '1'),
(2, 387, '1'),
(2, 388, '1'),
(2, 389, '1'),
(2, 390, '1'),
(2, 391, '1'),
(2, 392, '1'),
(2, 393, '1'),
(2, 394, '1'),
(2, 395, '1'),
(2, 396, '1'),
(2, 397, '1'),
(2, 398, '1'),
(2, 399, '1'),
(2, 400, '1'),
(2, 401, '1'),
(2, 402, '1'),
(2, 403, '1'),
(2, 404, '1'),
(2, 405, '1'),
(2, 406, '1'),
(2, 407, '1'),
(2, 408, '1'),
(2, 409, '1'),
(2, 410, '1'),
(2, 411, '1'),
(2, 412, '1'),
(2, 413, '1'),
(2, 414, '1'),
(2, 415, '1'),
(2, 416, '1'),
(2, 417, '1'),
(2, 418, '1'),
(2, 419, '1'),
(2, 420, '1'),
(2, 421, '1'),
(2, 422, '1'),
(2, 423, '1'),
(2, 424, '1'),
(2, 425, '1'),
(2, 426, '1'),
(2, 427, '1'),
(2, 428, '1'),
(2, 429, '1'),
(2, 430, '1'),
(2, 431, '1'),
(2, 432, '1'),
(2, 433, '1'),
(2, 434, '1'),
(2, 435, '1'),
(2, 436, '1'),
(2, 437, '1'),
(2, 438, '1'),
(2, 439, '1'),
(2, 440, '1'),
(2, 441, '1'),
(2, 442, '1'),
(2, 443, '1'),
(2, 444, '1'),
(2, 445, '1'),
(2, 446, '1'),
(2, 447, '1'),
(2, 448, '1'),
(2, 449, '1'),
(2, 450, '1'),
(2, 451, '1'),
(2, 452, '1'),
(2, 453, '1'),
(2, 454, '1'),
(2, 455, '1'),
(2, 456, '1'),
(2, 457, '1'),
(2, 458, '1'),
(2, 459, '1'),
(2, 460, '1'),
(2, 461, '1'),
(2, 462, '1'),
(2, 463, '1'),
(2, 464, '1'),
(2, 465, '1'),
(2, 466, '1'),
(2, 467, '1'),
(2, 468, '1'),
(2, 469, '1'),
(2, 470, '1'),
(2, 471, '1'),
(2, 472, '1'),
(2, 473, '1'),
(2, 474, '1'),
(2, 475, '1'),
(2, 476, '1'),
(2, 477, '1'),
(2, 478, '1'),
(2, 479, '1'),
(2, 480, '1'),
(2, 481, '1'),
(2, 482, '1'),
(2, 483, '1'),
(2, 484, '1'),
(2, 485, '1'),
(2, 486, '1'),
(2, 487, '1'),
(2, 488, '1'),
(2, 489, '1'),
(2, 490, '1'),
(2, 491, '1'),
(2, 492, '1'),
(2, 493, '1'),
(2, 494, '1'),
(2, 495, '1'),
(2, 496, '1'),
(2, 497, '1'),
(2, 498, '1'),
(2, 499, '1'),
(2, 500, '1'),
(2, 501, '1'),
(2, 502, '1'),
(2, 503, '1'),
(2, 504, '1'),
(2, 505, '1'),
(2, 506, '1'),
(3, 1, '1'),
(3, 2, '1'),
(3, 3, '1'),
(3, 4, '1'),
(3, 5, '1'),
(3, 6, '1'),
(3, 7, '1'),
(3, 9, '1'),
(3, 10, '1'),
(3, 11, '1'),
(3, 12, '1'),
(3, 13, '1'),
(3, 14, '1'),
(3, 15, '1'),
(3, 17, '1'),
(3, 18, '1'),
(3, 19, '1'),
(3, 20, '1'),
(3, 21, '1'),
(3, 22, '1'),
(3, 23, '1'),
(3, 24, '1'),
(3, 25, '1'),
(3, 26, '1'),
(3, 27, '1'),
(3, 28, '1'),
(3, 29, '1'),
(3, 30, '1'),
(3, 31, '1'),
(3, 32, '1'),
(3, 33, '1'),
(3, 34, '1'),
(3, 35, '1'),
(3, 36, '1'),
(3, 37, '1'),
(3, 38, '1'),
(3, 39, '1'),
(3, 40, '1'),
(3, 41, '1'),
(3, 42, '1'),
(3, 43, '1'),
(3, 44, '1'),
(3, 45, '1'),
(3, 46, '1'),
(3, 47, '1'),
(3, 48, '1'),
(3, 49, '1'),
(3, 50, '1'),
(3, 51, '1'),
(3, 52, '1'),
(3, 53, '1'),
(3, 54, '1'),
(3, 55, '1'),
(3, 56, '1'),
(3, 57, '1'),
(3, 58, '1'),
(3, 59, '1'),
(3, 60, '1'),
(3, 61, '1'),
(3, 62, '1'),
(3, 63, '1'),
(3, 64, '1'),
(3, 65, '1'),
(3, 66, '1'),
(3, 67, '1'),
(3, 68, '1'),
(3, 69, '1'),
(3, 70, '1'),
(3, 71, '1'),
(3, 72, '1'),
(3, 73, '1'),
(3, 74, '1'),
(3, 75, '1'),
(3, 76, '1'),
(3, 77, '1'),
(3, 78, '1'),
(3, 79, '1'),
(3, 80, '1'),
(3, 81, '1'),
(3, 82, '1'),
(3, 83, '1'),
(3, 84, '1'),
(3, 85, '1'),
(3, 86, '1'),
(3, 87, '1'),
(3, 88, '1'),
(3, 89, '1'),
(3, 90, '1'),
(3, 91, '1'),
(3, 92, '1'),
(3, 93, '1'),
(3, 94, '1'),
(3, 95, '1'),
(3, 96, '1'),
(3, 97, '1'),
(3, 98, '1'),
(3, 99, '1'),
(3, 100, '1'),
(3, 101, '1'),
(3, 102, '1'),
(3, 103, '1'),
(3, 104, '1'),
(3, 105, '1'),
(3, 106, '1'),
(3, 107, '1'),
(3, 108, '1'),
(3, 109, '1'),
(3, 111, '1'),
(3, 112, '1'),
(3, 113, '1'),
(3, 114, '1'),
(3, 115, '1'),
(3, 116, '1'),
(3, 117, '1'),
(3, 118, '1'),
(3, 119, '1'),
(3, 120, '1'),
(3, 121, '1'),
(3, 122, '1'),
(3, 123, '1'),
(3, 124, '1'),
(3, 125, '1'),
(3, 126, '1'),
(3, 127, '1'),
(3, 128, '1'),
(3, 129, '1'),
(3, 130, '1'),
(3, 131, '1'),
(3, 132, '1'),
(3, 133, '1'),
(3, 134, '1'),
(3, 135, '1'),
(3, 136, '1'),
(3, 137, '1'),
(3, 138, '1'),
(3, 139, '1'),
(3, 140, '1'),
(3, 141, '1'),
(3, 142, '1'),
(3, 143, '1'),
(3, 144, '1'),
(3, 145, '1'),
(3, 146, '1'),
(3, 147, '1'),
(3, 148, '1'),
(3, 149, '1'),
(3, 150, '1'),
(3, 151, '1'),
(3, 152, '1'),
(3, 153, '1'),
(3, 154, '1'),
(3, 155, '1'),
(3, 156, '1'),
(3, 157, '1'),
(3, 158, '1'),
(3, 159, '1'),
(3, 160, '1'),
(3, 161, '1'),
(3, 162, '1'),
(3, 163, '1'),
(3, 164, '1'),
(3, 165, '1'),
(3, 166, '1'),
(3, 167, '1'),
(3, 168, '1'),
(3, 169, '1'),
(3, 170, '1'),
(3, 171, '1'),
(3, 172, '1'),
(3, 173, '1'),
(3, 174, '1'),
(3, 175, '1'),
(3, 176, '1'),
(3, 177, '1'),
(3, 178, '1'),
(3, 179, '1'),
(3, 180, '1'),
(3, 181, '1'),
(3, 182, '1'),
(3, 183, '1'),
(3, 184, '1'),
(3, 185, '1'),
(3, 186, '1'),
(3, 187, '1'),
(3, 188, '1'),
(3, 189, '1'),
(3, 190, '1'),
(3, 191, '1'),
(3, 192, '1'),
(3, 193, '1'),
(3, 194, '1'),
(3, 195, '1'),
(3, 196, '1'),
(3, 197, '1'),
(3, 198, '1'),
(3, 199, '1'),
(3, 200, '1'),
(3, 201, '1'),
(3, 202, '1'),
(3, 203, '1'),
(3, 204, '1'),
(3, 205, '1'),
(3, 206, '1'),
(3, 207, '1'),
(3, 208, '1'),
(3, 209, '1'),
(3, 210, '1'),
(3, 211, '1'),
(3, 212, '1'),
(3, 213, '1'),
(3, 214, '1'),
(3, 215, '1'),
(3, 216, '1'),
(3, 217, '1'),
(3, 218, '1'),
(3, 219, '1'),
(3, 220, '1'),
(3, 221, '1'),
(3, 222, '1'),
(3, 223, '1'),
(3, 224, '1'),
(3, 225, '1'),
(3, 226, '1'),
(3, 227, '1'),
(3, 228, '1'),
(3, 229, '1'),
(3, 230, '1'),
(3, 231, '1'),
(3, 232, '1'),
(3, 233, '1'),
(3, 234, '1'),
(3, 297, '1'),
(3, 298, '1'),
(3, 299, '1'),
(3, 300, '1'),
(3, 301, '1'),
(3, 302, '1'),
(3, 303, '1'),
(3, 304, '1'),
(3, 305, '1'),
(3, 306, '1'),
(3, 307, '1'),
(3, 308, '1'),
(3, 309, '1'),
(3, 310, '1'),
(3, 311, '1'),
(3, 312, '1'),
(3, 313, '1'),
(3, 314, '1'),
(3, 315, '1'),
(3, 316, '1'),
(3, 317, '1'),
(3, 318, '1'),
(3, 319, '1'),
(3, 320, '1'),
(3, 321, '1'),
(3, 322, '1'),
(3, 323, '1'),
(3, 324, '1'),
(3, 325, '1'),
(3, 326, '1'),
(3, 327, '1'),
(3, 328, '1'),
(3, 329, '1'),
(3, 330, '1'),
(3, 331, '1'),
(3, 332, '1'),
(3, 333, '1'),
(3, 334, '1'),
(3, 335, '1'),
(3, 336, '1'),
(3, 337, '1'),
(3, 338, '1'),
(3, 339, '1'),
(3, 340, '1'),
(3, 341, '1'),
(3, 342, '1'),
(3, 343, '1'),
(3, 344, '1'),
(3, 345, '1'),
(3, 346, '1'),
(3, 347, '1'),
(3, 348, '1'),
(3, 349, '1'),
(3, 350, '1'),
(3, 351, '1'),
(3, 352, '1'),
(3, 353, '1'),
(3, 354, '1'),
(3, 355, '1'),
(3, 356, '1'),
(3, 357, '1'),
(3, 358, '1'),
(3, 359, '1'),
(3, 360, '1'),
(3, 361, '1'),
(3, 362, '1'),
(3, 363, '1'),
(3, 364, '1'),
(3, 365, '1'),
(3, 366, '1'),
(3, 367, '1'),
(3, 368, '1'),
(3, 369, '1'),
(3, 370, '1'),
(3, 371, '1'),
(3, 372, '1'),
(3, 373, '1'),
(3, 374, '1'),
(3, 375, '1'),
(3, 376, '1'),
(3, 377, '1'),
(3, 378, '1'),
(3, 379, '1'),
(3, 380, '1'),
(3, 381, '1'),
(3, 382, '1'),
(3, 383, '1'),
(3, 384, '1'),
(3, 385, '1'),
(3, 386, '1'),
(3, 387, '1'),
(3, 388, '1'),
(3, 389, '1'),
(3, 390, '1'),
(3, 391, '1'),
(3, 392, '1'),
(3, 393, '1'),
(3, 394, '1'),
(3, 395, '1'),
(3, 396, '1'),
(3, 397, '1'),
(3, 398, '1'),
(3, 399, '1'),
(3, 400, '1'),
(3, 401, '1'),
(3, 402, '1'),
(3, 403, '1'),
(3, 404, '1'),
(3, 405, '1'),
(3, 406, '1'),
(3, 407, '1'),
(3, 408, '1'),
(3, 409, '1'),
(3, 410, '1'),
(3, 411, '1'),
(3, 412, '1'),
(3, 413, '1'),
(3, 414, '1'),
(3, 415, '1'),
(3, 416, '1'),
(3, 417, '1'),
(3, 418, '1'),
(3, 419, '1'),
(3, 420, '1'),
(3, 421, '1'),
(3, 422, '1'),
(3, 423, '1'),
(3, 424, '1'),
(3, 425, '1'),
(3, 426, '1'),
(3, 427, '1'),
(3, 428, '1'),
(3, 429, '1'),
(3, 430, '1'),
(3, 431, '1'),
(3, 432, '1'),
(3, 433, '1'),
(3, 434, '1'),
(3, 435, '1'),
(3, 436, '1'),
(3, 437, '1'),
(3, 438, '1'),
(3, 439, '1'),
(3, 440, '1'),
(3, 441, '1'),
(3, 442, '1'),
(3, 443, '1'),
(3, 444, '1'),
(3, 445, '1'),
(3, 446, '1'),
(3, 447, '1'),
(3, 448, '1'),
(3, 449, '1'),
(3, 450, '1'),
(3, 451, '1'),
(3, 452, '1'),
(3, 453, '1'),
(3, 454, '1'),
(3, 455, '1'),
(3, 456, '1'),
(3, 457, '1'),
(3, 458, '1'),
(3, 459, '1'),
(3, 460, '1'),
(3, 461, '1'),
(3, 462, '1'),
(3, 463, '1'),
(3, 464, '1'),
(3, 465, '1'),
(3, 466, '1'),
(3, 467, '1'),
(3, 468, '1'),
(3, 469, '1'),
(3, 470, '1'),
(3, 471, '1'),
(3, 472, '1'),
(3, 473, '1'),
(3, 474, '1'),
(3, 475, '1'),
(3, 476, '1'),
(3, 477, '1'),
(3, 478, '1'),
(3, 479, '1'),
(3, 480, '1'),
(3, 481, '1'),
(3, 482, '1'),
(3, 483, '1'),
(3, 484, '1'),
(3, 486, '1'),
(3, 487, '1'),
(3, 488, '1'),
(3, 490, '1'),
(3, 495, '1'),
(3, 496, '1'),
(3, 498, '1'),
(3, 499, '1'),
(3, 500, '1'),
(3, 502, '1'),
(3, 503, '1'),
(3, 504, '1'),
(3, 506, '1'),
(3, 507, '1'),
(3, 508, '1'),
(3, 509, '1'),
(3, 510, '1'),
(3, 511, '1'),
(3, 512, '1'),
(3, 513, '1'),
(3, 514, '1'),
(3, 515, '1'),
(3, 516, '1'),
(3, 517, '1'),
(3, 518, '1'),
(3, 519, '1'),
(3, 520, '1'),
(3, 521, '1'),
(3, 522, '1'),
(3, 523, '1'),
(3, 524, '1'),
(3, 525, '1'),
(3, 526, '1'),
(3, 527, '1'),
(3, 528, '1'),
(3, 529, '1'),
(3, 530, '1'),
(3, 531, '1'),
(3, 532, '1'),
(3, 533, '1'),
(3, 534, '1'),
(3, 535, '1'),
(3, 536, '1'),
(3, 537, '1'),
(3, 538, '1'),
(3, 539, '1'),
(3, 540, '1'),
(3, 541, '1'),
(3, 542, '1'),
(3, 543, '1'),
(3, 544, '1'),
(3, 545, '1'),
(3, 546, '1'),
(3, 547, '1'),
(3, 548, '1'),
(3, 549, '1'),
(3, 550, '1'),
(3, 551, '1'),
(3, 552, '1'),
(3, 553, '1'),
(3, 554, '1'),
(3, 555, '1'),
(3, 556, '1'),
(3, 557, '1'),
(3, 558, '1'),
(3, 559, '1'),
(3, 560, '1'),
(3, 561, '1'),
(3, 562, '1'),
(3, 563, '1'),
(3, 564, '1'),
(3, 565, '1'),
(3, 566, '1'),
(3, 567, '1'),
(3, 568, '1'),
(3, 569, '1'),
(3, 570, '1'),
(3, 571, '1'),
(3, 572, '1'),
(3, 573, '1'),
(3, 574, '1'),
(3, 575, '1'),
(3, 576, '1'),
(3, 577, '1'),
(3, 578, '1'),
(3, 579, '1'),
(3, 580, '1'),
(3, 581, '1'),
(3, 582, '1'),
(3, 583, '1'),
(3, 584, '1'),
(3, 585, '1'),
(3, 586, '1'),
(3, 587, '1'),
(3, 588, '1'),
(3, 589, '1'),
(3, 590, '1'),
(3, 591, '1'),
(3, 592, '1'),
(3, 593, '1'),
(3, 594, '1'),
(3, 595, '1'),
(3, 596, '1'),
(3, 597, '1'),
(3, 598, '1'),
(3, 599, '1'),
(3, 600, '1'),
(3, 601, '1'),
(3, 602, '1'),
(3, 603, '1'),
(3, 604, '1'),
(3, 605, '1'),
(3, 606, '1'),
(3, 607, '1'),
(3, 608, '1'),
(3, 609, '1'),
(3, 610, '1'),
(3, 611, '1'),
(3, 612, '1'),
(3, 613, '1'),
(3, 614, '1'),
(3, 615, '1'),
(3, 616, '1'),
(3, 617, '1'),
(3, 618, '1'),
(3, 619, '1'),
(3, 620, '1'),
(3, 621, '1'),
(3, 622, '1'),
(3, 623, '1'),
(3, 624, '1'),
(3, 625, '1'),
(3, 626, '1'),
(3, 627, '1'),
(3, 628, '1'),
(3, 629, '1'),
(3, 630, '1'),
(3, 631, '1'),
(3, 632, '1'),
(3, 633, '1'),
(3, 634, '1'),
(3, 635, '1'),
(3, 636, '1'),
(3, 637, '1'),
(3, 638, '1'),
(3, 639, '1'),
(3, 640, '1'),
(3, 641, '1'),
(3, 642, '1'),
(3, 643, '1'),
(3, 644, '1'),
(3, 645, '1'),
(3, 646, '1'),
(3, 647, '1'),
(3, 648, '1'),
(3, 649, '1'),
(3, 650, '1'),
(3, 651, '1'),
(3, 652, '1'),
(3, 653, '1'),
(3, 654, '1'),
(3, 655, '1'),
(3, 656, '1'),
(3, 657, '1'),
(3, 658, '1'),
(3, 659, '1'),
(3, 660, '1'),
(3, 661, '1'),
(3, 662, '1'),
(3, 663, '1'),
(3, 664, '1'),
(3, 665, '1'),
(3, 666, '1'),
(3, 667, '1'),
(3, 668, '1'),
(3, 669, '1'),
(3, 670, '1'),
(3, 671, '1'),
(3, 672, '1'),
(3, 673, '1'),
(3, 674, '1'),
(3, 675, '1'),
(3, 676, '1'),
(3, 677, '1'),
(3, 678, '1'),
(3, 679, '1'),
(3, 680, '1'),
(3, 681, '1'),
(3, 682, '1'),
(3, 683, '1'),
(3, 684, '1'),
(3, 685, '1'),
(3, 686, '1'),
(3, 687, '1'),
(3, 688, '1'),
(3, 689, '1'),
(3, 690, '1'),
(3, 691, '1'),
(3, 692, '1'),
(3, 693, '1'),
(3, 694, '1'),
(3, 695, '1'),
(3, 696, '1'),
(3, 697, '1'),
(3, 698, '1'),
(3, 699, '1'),
(3, 700, '1'),
(3, 701, '1'),
(3, 702, '1'),
(3, 703, '1'),
(3, 704, '1'),
(3, 705, '1'),
(3, 706, '1'),
(3, 707, '1'),
(3, 708, '1'),
(3, 709, '1'),
(3, 710, '1'),
(3, 711, '1'),
(3, 712, '1'),
(3, 713, '1'),
(3, 714, '1'),
(3, 715, '1'),
(3, 716, '1'),
(3, 717, '1'),
(3, 718, '1'),
(3, 719, '1'),
(3, 720, '1'),
(3, 721, '1'),
(3, 722, '1'),
(3, 723, '1'),
(3, 724, '1'),
(3, 725, '1'),
(3, 726, '1'),
(3, 727, '1'),
(3, 728, '1'),
(3, 729, '1'),
(3, 730, '1'),
(3, 731, '1'),
(3, 732, '1'),
(3, 733, '1'),
(3, 734, '1'),
(3, 735, '1'),
(3, 736, '1'),
(3, 737, '1'),
(3, 738, '1'),
(3, 739, '1'),
(3, 740, '1'),
(3, 741, '1'),
(3, 742, '1'),
(3, 743, '1'),
(3, 744, '1'),
(3, 745, '1'),
(3, 746, '1'),
(3, 747, '1'),
(3, 748, '1'),
(3, 749, '1'),
(3, 750, '1'),
(3, 751, '1'),
(3, 752, '1'),
(3, 753, '1'),
(3, 754, '1'),
(3, 755, '1'),
(3, 756, '1'),
(3, 757, '1'),
(3, 758, '1'),
(3, 759, '1'),
(3, 760, '1'),
(3, 761, '1'),
(3, 762, '1'),
(3, 763, '1'),
(3, 764, '1'),
(3, 765, '1'),
(3, 766, '1'),
(3, 767, '1'),
(3, 768, '1'),
(3, 769, '1'),
(3, 770, '1');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_menu`
--

CREATE TABLE IF NOT EXISTS `role_has_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `accessible` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `fk_role_has_menu_menu1_idx` (`menu_id`),
  KEY `fk_role_has_menu_role1_idx` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_has_menu`
--

INSERT INTO `role_has_menu` (`role_id`, `menu_id`, `accessible`) VALUES
(1, 1, '1'),
(1, 2, '1'),
(1, 3, '1'),
(1, 13, '1'),
(1, 14, '1'),
(1, 21, '1'),
(1, 22, '1'),
(1, 23, '1'),
(1, 24, '1'),
(1, 25, '1'),
(1, 27, '1'),
(1, 54, '1'),
(1, 56, '1'),
(1, 57, '1'),
(1, 67, '1'),
(1, 71, '1'),
(1, 79, '1'),
(1, 80, '1'),
(1, 81, '1'),
(1, 82, '1'),
(1, 83, '1'),
(1, 84, '1'),
(1, 86, '1'),
(1, 87, '1'),
(1, 88, '1'),
(1, 89, '1'),
(1, 90, '1'),
(1, 91, '1'),
(1, 92, '1'),
(1, 93, '1'),
(1, 94, '1'),
(1, 95, '1'),
(1, 96, '1'),
(1, 97, '1'),
(1, 98, '1'),
(1, 99, '1'),
(1, 100, '1'),
(1, 101, '1'),
(1, 102, '1'),
(1, 103, '1'),
(1, 104, '1'),
(1, 105, '1'),
(1, 106, '1'),
(1, 109, '1'),
(1, 110, '1'),
(1, 111, '1'),
(1, 112, '1'),
(1, 113, '1'),
(1, 114, '1'),
(1, 115, '1'),
(1, 116, '1'),
(1, 117, '1'),
(1, 118, '1'),
(1, 119, '1'),
(1, 120, '1'),
(1, 122, '1'),
(1, 441, '1'),
(1, 442, '1'),
(1, 443, '1'),
(1, 444, '1'),
(1, 445, '1'),
(1, 446, '1'),
(1, 447, '1'),
(1, 448, '1'),
(1, 449, '1'),
(1, 450, '1'),
(1, 451, '1'),
(1, 452, '1'),
(1, 453, '1'),
(1, 454, '1'),
(1, 457, '1'),
(1, 458, '1'),
(1, 460, '1'),
(1, 461, '1'),
(1, 462, '1'),
(1, 463, '1'),
(1, 464, '1'),
(1, 465, '1'),
(1, 466, '1'),
(1, 467, '1'),
(1, 469, '1'),
(1, 471, '1'),
(1, 472, '1'),
(1, 473, '1'),
(2, 1, '1'),
(2, 2, '1'),
(2, 3, '1'),
(2, 13, '1'),
(2, 14, '1'),
(2, 21, '1'),
(2, 22, '1'),
(2, 23, '1'),
(2, 24, '1'),
(2, 25, '1'),
(2, 27, '1'),
(2, 54, '1'),
(2, 56, '1'),
(2, 57, '1'),
(2, 67, '1'),
(2, 71, '1'),
(2, 79, '1'),
(2, 80, '1'),
(2, 81, '1'),
(2, 82, '1'),
(2, 83, '1'),
(2, 84, '1'),
(2, 86, '1'),
(2, 87, '1'),
(2, 88, '1'),
(2, 89, '1'),
(2, 90, '1'),
(2, 91, '1'),
(2, 92, '1'),
(2, 93, '1'),
(2, 94, '1'),
(2, 95, '1'),
(2, 96, '1'),
(2, 97, '1'),
(2, 98, '1'),
(2, 99, '1'),
(2, 100, '1'),
(2, 101, '1'),
(2, 102, '1'),
(2, 103, '1'),
(2, 104, '1'),
(2, 105, '1'),
(2, 106, '1'),
(2, 109, '1'),
(2, 110, '1'),
(2, 111, '1'),
(2, 112, '1'),
(2, 113, '1'),
(2, 114, '1'),
(2, 115, '1'),
(2, 116, '1'),
(2, 117, '1'),
(2, 118, '1'),
(2, 119, '1'),
(2, 120, '1'),
(2, 122, '1'),
(2, 441, '1'),
(2, 442, '1'),
(2, 443, '1'),
(2, 444, '1'),
(2, 445, '1'),
(2, 446, '1'),
(2, 447, '1'),
(2, 448, '1'),
(2, 449, '1'),
(2, 450, '1'),
(2, 451, '1'),
(2, 452, '1'),
(2, 453, '1'),
(2, 454, '1'),
(2, 457, '1'),
(2, 458, '1'),
(2, 460, '1'),
(2, 461, '1'),
(2, 462, '1'),
(2, 463, '1'),
(2, 464, '1'),
(2, 465, '1'),
(2, 466, '1'),
(2, 467, '1'),
(2, 469, '1'),
(2, 471, '1'),
(2, 472, '1'),
(2, 473, '1'),
(2, 475, '1'),
(3, 3, '1'),
(3, 109, '1'),
(3, 110, '1'),
(3, 111, '1'),
(3, 112, '1'),
(3, 113, '1'),
(3, 114, '1'),
(3, 115, '1'),
(3, 116, '1'),
(3, 117, '1'),
(3, 118, '1'),
(3, 119, '1'),
(3, 446, '1'),
(3, 447, '1'),
(3, 448, '1'),
(3, 449, '1');

-- --------------------------------------------------------

--
-- Table structure for table `source_message`
--

CREATE TABLE IF NOT EXISTS `source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_source_message_category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=826 ;

--
-- Dumping data for table `source_message`
--

INSERT INTO `source_message` (`id`, `category`, `message`) VALUES
(1, 'app', 'Branch Groups'),
(2, 'app', 'Create Branch Group'),
(3, 'app', 'ID'),
(4, 'app', 'Name'),
(5, 'app', 'Deleted'),
(6, 'app', 'Language'),
(7, 'app', 'Translation'),
(8, 'app', 'Messages'),
(9, 'app', 'Create Message'),
(10, 'app', 'Create'),
(11, 'app', 'Update {modelClass}: '),
(12, 'app', 'Update'),
(13, 'app', 'Message'),
(14, 'app', 'Action'),
(15, 'app', 'Incorrect Requested Params'),
(16, 'app', 'Cancel'),
(17, 'app', 'Add'),
(18, 'app', 'Success'),
(19, 'app', 'Error'),
(20, 'app', 'Operation Successful'),
(21, 'app', 'test'),
(22, 'app', 'tetas'),
(23, 'app', 'sdaf'),
(24, 'app', 'sfadfsdf'),
(25, 'app', 'xxx'),
(26, 'app', 'cc'),
(27, 'app', 'adasd'),
(28, 'app', 'ee'),
(29, 'app', 'eedd'),
(30, 'app', 'gg'),
(32, 'app', 'pp'),
(33, 'app', 'Branches'),
(34, 'app', 'Create Branch'),
(35, 'app', 'Code'),
(36, 'app', 'Address'),
(37, 'app', 'Tel'),
(38, 'app', 'Branch Group ID'),
(39, 'app', 'Goverment Unit'),
(40, 'app', 'Phiscal Years'),
(41, 'app', 'Create Phiscal Year'),
(42, 'app', 'Year'),
(43, 'app', 'Start Date'),
(44, 'app', 'End Date'),
(45, 'app', 'Status'),
(46, 'app', 'Closed'),
(47, 'app', 'Opening'),
(48, 'app', 'Delete'),
(49, 'app', 'Are you sure you want to delete this item?'),
(50, 'app', 'Operation Success'),
(51, 'app', 'Date'),
(52, 'app', 'Phiscal Year'),
(53, 'app', 'Administration'),
(54, 'app', 'Dashboard'),
(55, 'app', 'Ministry'),
(56, 'app', 'Ministry Group'),
(57, 'app', 'Goverment Level'),
(58, 'app', 'Govermentlevels'),
(59, 'app', 'Create Govermentlevel'),
(60, 'app', 'New'),
(61, 'app', 'Save'),
(62, 'app', 'List'),
(63, 'app', 'New/Update'),
(64, 'app', 'Select'),
(65, 'app', 'Total'),
(66, 'app', 'Rows'),
(67, 'app', 'Row(s)'),
(68, 'app', 'New/Save'),
(69, 'app', 'Successful'),
(70, 'app', 'NO'),
(71, 'app', 'YES'),
(72, 'app', 'USERNAME'),
(73, 'app', 'PASSWORD'),
(74, 'app', 'Branch ID'),
(75, 'app', 'Effective Date'),
(76, 'app', 'User ID'),
(77, 'app', 'Last Update'),
(78, 'app', 'Phiscal Year ID'),
(79, 'app', 'Statistics'),
(80, 'app', 'Goverment Units'),
(81, 'app', 'No.'),
(82, 'app', 'Remark'),
(83, 'app', 'Statistics of Goverment Unit '),
(84, 'app', 'Select Phiscal Year'),
(85, 'app', 'Incorrect Phiscal Year'),
(86, 'app', 'Go Back'),
(87, 'app', 'Owner'),
(88, 'app', 'Operation Successfule'),
(89, 'app', 'Saved'),
(90, 'app', 'Goverment Level ID'),
(91, 'app', 'Value'),
(92, 'app', 'Stat Goverment Unit ID'),
(93, 'app', 'No Data'),
(101, 'app', 'Group'),
(102, 'app', 'Department'),
(103, 'app', 'Insitute'),
(104, 'app', 'Center'),
(105, 'app', 'Institute'),
(106, 'app', 'Create Stat Goverment Unit'),
(107, 'app', 'Stat Goverment Units'),
(108, 'app', 'Stat Goverment Unit'),
(109, 'app', '-'),
(110, 'app', 'Office'),
(111, 'app', 'Position'),
(112, 'app', 'Stat Single Gateway Implementations'),
(113, 'app', 'Statistics of Single Gateway Implementations'),
(114, 'app', 'Service Unit Name'),
(115, 'app', 'Statistics of Goverment Structure'),
(116, 'app', 'Ministries'),
(117, 'app', 'Single Gateway Implementations'),
(118, 'app', 'Legals'),
(119, 'app', 'Legal Type'),
(120, 'app', 'Legal'),
(121, 'app', 'The Year is not allowed to input'),
(122, 'app', 'Improve'),
(123, 'app', 'Publish'),
(124, 'app', 'Statistics of Internal Legal'),
(125, 'app', 'Legal Types'),
(126, 'app', 'Create Legal Type'),
(127, 'app', 'Create Legal'),
(128, 'app', 'Legal Type ID'),
(131, 'app', 'Dashboad'),
(132, 'app', 'Level'),
(133, 'app', 'Ministry ID'),
(134, 'app', 'Province ID'),
(135, 'app', 'Approver Level ID'),
(136, 'app', 'Approver Level'),
(137, 'app', 'approver'),
(138, 'app', 'Approvers'),
(139, 'app', 'Create Approver'),
(140, 'app', 'Approver Levels'),
(141, 'app', 'Create Approver Level'),
(142, 'app', 'Province'),
(143, 'app', 'Stat Association Foundation'),
(144, 'app', 'Settings'),
(145, 'app', 'Stat Association Foundations'),
(146, 'app', 'Statistics of Associations/Foundations'),
(147, 'app', 'Association'),
(148, 'app', 'Foundation'),
(149, 'app', 'Accociations'),
(150, 'app', 'Foundations'),
(151, 'app', 'Stat Local Administration'),
(152, 'app', 'Stat Local Admins'),
(153, 'app', 'Province Head'),
(154, 'app', 'Province Vice'),
(155, 'app', 'District Head'),
(156, 'app', 'District Vice'),
(157, 'app', 'T'),
(158, 'app', 'W'),
(159, 'app', 'Village Head'),
(160, 'app', 'Village Vice'),
(161, 'app', 'Population'),
(162, 'app', 'Village'),
(163, 'app', 'Family'),
(164, 'app', 'P'),
(165, 'app', 'Statistics of Local Administration'),
(166, 'app', 'Association Foundation'),
(167, 'app', 'Local Administration'),
(168, 'app', 'Religion Teacher'),
(169, 'app', 'Population Movement'),
(170, 'app', 'Stat Population Movements'),
(171, 'app', 'District'),
(172, 'app', 'Born'),
(173, 'app', 'Die'),
(174, 'app', 'Married'),
(175, 'app', 'Divorced'),
(176, 'app', 'Move-In'),
(177, 'app', 'Move-out'),
(178, 'app', 'Real'),
(179, 'app', 'Statistics of Population Movement'),
(180, 'app', 'Stat Religion Teachers'),
(181, 'app', 'Buddhism'),
(182, 'app', 'Monk'),
(183, 'app', 'Novice'),
(184, 'app', 'Buddhis Dad'),
(185, 'app', 'Buddhis Mom'),
(186, 'app', 'Buddhis Boy'),
(187, 'app', 'Christian'),
(188, 'app', 'Bahaiy'),
(189, 'app', 'Idslam'),
(190, 'app', 'News'),
(191, 'app', 'Saturday'),
(192, 'app', 'Catolic'),
(193, 'app', 'Statistics of Religion Teacher'),
(194, 'app', 'Comparations of Population Movement'),
(195, 'app', 'Inquiry'),
(196, 'app', 'Women'),
(197, 'app', 'The Chart of Population Movement Yearly'),
(198, 'app', 'Ethnic Statistic'),
(199, 'app', 'Ethic'),
(200, 'app', 'Stat Ethnics'),
(201, 'app', 'Enthnic'),
(202, 'app', 'Search'),
(203, 'app', 'Statistics of Ehtnics'),
(204, 'app', 'Ethnics'),
(205, 'app', 'Create Ethnic'),
(206, 'app', 'Ethnic'),
(207, 'app', 'Incorrect Request Method'),
(208, 'app', 'Religion & Other Believes'),
(209, 'app', 'Statistics of Religions & Other Believes'),
(210, 'app', 'Others'),
(211, 'app', 'Other'),
(212, 'app', 'The Chart of Religions & Other Believes'),
(213, 'app', 'Christ'),
(214, 'app', 'The Chart of Religions Teacher'),
(215, 'app', 'Religion Place'),
(216, 'app', 'Stat Religion Places'),
(217, 'app', 'Temple'),
(218, 'app', 'No Monk'),
(219, 'app', 'Sim'),
(220, 'app', 'No Sim'),
(221, 'app', 'Not'),
(222, 'app', 'N'),
(223, 'app', 'The Chart of Religions Places'),
(224, 'app', 'Statistics of Religion Place'),
(225, 'app', 'Bahai'),
(226, 'app', 'Officer'),
(227, 'app', 'Overall Officer'),
(228, 'app', 'Stat Officers'),
(229, 'app', 'Create Stat Officer'),
(230, 'app', 'Statistics of Officers'),
(231, 'app', 'Overall Officers'),
(232, 'app', 'Description'),
(233, 'app', 'No. of officers'),
(234, 'app', 'Men'),
(235, 'app', 'Ministry Level'),
(236, 'app', 'Local Level'),
(237, 'app', 'Province Department'),
(238, 'app', 'District Office'),
(239, 'app', 'Officers By Ages'),
(240, 'app', 'Stat Officer Ages'),
(241, 'app', 'Statistics of Officers By Ages'),
(242, 'app', 'Officers By Degrees'),
(243, 'app', 'Stat Officer Degrees'),
(244, 'app', 'Doctor'),
(245, 'app', 'Post Master'),
(246, 'app', 'Master'),
(247, 'app', 'Post Bachelor'),
(248, 'app', 'Bachelor'),
(249, 'app', 'High'),
(250, 'app', 'Middle'),
(251, 'app', 'Begin'),
(252, 'app', 'No Degree'),
(253, 'app', 'Retire'),
(254, 'app', 'Bumnet'),
(255, 'app', 'Leave'),
(256, 'app', 'Fire'),
(257, 'app', 'Resign'),
(258, 'app', 'Lose'),
(259, 'app', 'Move to SOE'),
(260, 'app', 'Moveto Ministry'),
(261, 'app', 'Move-In Ministry'),
(262, 'app', 'Officers Resignation'),
(263, 'app', 'Stat Officer Resigns'),
(264, 'app', 'Officers Add'),
(265, 'app', 'Stat Officer Adds'),
(266, 'app', 'Create Stat Officer Add'),
(267, 'app', 'Statistics of Officers Addition'),
(268, 'app', 'By Quota'),
(269, 'app', 'From Army'),
(270, 'app', 'From SOE'),
(271, 'app', 'Officers Addition'),
(272, 'app', 'Officers Contract'),
(273, 'app', 'Stat Officer Contracts'),
(274, 'app', 'Admin Approve'),
(275, 'app', 'Admin Non Approve'),
(276, 'app', 'Officer Approve'),
(277, 'app', 'Officer Non Approve'),
(278, 'app', 'Administration By Contract'),
(279, 'app', 'Officers By Contract'),
(280, 'app', 'Officers Approve'),
(281, 'app', 'Officers Non Approve'),
(282, 'app', 'Officers Positions'),
(283, 'app', 'Stat Officer Positions'),
(284, 'app', 'Statistics of Officers By Positions'),
(285, 'app', 'Statistics Officer Positions'),
(286, 'app', 'Officers Needed'),
(287, 'app', 'Stat Officer Needs'),
(288, 'app', 'Needed Plan'),
(289, 'app', 'Officers Ministry'),
(290, 'app', 'Stat Officer Ministries'),
(293, 'app', 'Organisation'),
(294, 'app', 'Organisations'),
(295, 'app', 'Create Organisation'),
(296, 'app', 'Officers Organisation'),
(297, 'app', 'Stat Officer Organisations'),
(298, 'app', 'Officers Province'),
(299, 'app', 'Stat Officer Provinces'),
(300, 'app', 'Officers Ministry Add'),
(301, 'app', 'Stat Officer Ministries Add/Resign'),
(302, 'app', 'Officers Organisation Add'),
(303, 'app', 'Stat Officer Organisations Add/Resign'),
(308, 'app', 'Officers Province Add'),
(309, 'app', 'Stat Officer Province Adds'),
(310, 'app', 'Create Stat Officer Province Add'),
(311, 'app', 'Stat Officer Provinces Add/Resign'),
(312, 'app', 'Officers Ministry Train'),
(313, 'app', 'Technical Trainning'),
(314, 'app', 'Theory Trainning'),
(315, 'app', 'Local'),
(316, 'app', 'Oversea'),
(317, 'app', 'Stat Officer Province Trains'),
(318, 'app', 'Create Stat Officer Province Train'),
(319, 'app', 'Add/Resign'),
(320, 'app', 'Training'),
(321, 'app', 'Officers Province Train'),
(322, 'app', 'Statistics of Tranining of Ministry Officers '),
(330, 'app', 'Officers Organisation Train'),
(331, 'app', 'Stat Officer Org Trains'),
(332, 'app', 'Create Stat Officer Org Train'),
(333, 'app', 'Statistics of Tranining of Province Officers '),
(334, 'app', 'Upgrade'),
(335, 'app', 'Officers Ministry Upgrade'),
(336, 'app', 'Officers Organisation Upgrade'),
(337, 'app', 'Officers Province Upgrade'),
(338, 'app', 'Statistics of Tranining of Organisation Officers '),
(339, 'app', 'Stat Officer Province Upgrades'),
(340, 'app', 'Create Stat Officer Province Upgrade'),
(341, 'app', 'Stat Officer Provinces Traning'),
(342, 'app', 'Stat Officer Provinces Upgrade'),
(343, 'app', 'Statistics of Upgrading of Province Officers '),
(344, 'app', 'The Chart of Officers Province Training'),
(345, 'app', 'Organisation Officer Upgrading'),
(346, 'app', 'Doctor Local'),
(347, 'app', 'Doctor Oversea'),
(348, 'app', 'Master Local'),
(349, 'app', 'Master Oversea'),
(350, 'app', 'Bachelor Local'),
(351, 'app', 'Bachelor Oversea'),
(352, 'app', 'High Local'),
(353, 'app', 'High Oversea'),
(354, 'app', 'Middle Local'),
(355, 'app', 'Middle Oversea'),
(356, 'app', 'Begin Local'),
(357, 'app', 'Begin Oversea'),
(358, 'app', 'Stat Course ID'),
(359, 'app', 'Course'),
(360, 'app', 'Stat Courses'),
(361, 'app', 'Create Stat Course'),
(362, 'app', 'Statistics of Officer Training Course Development'),
(363, 'app', 'Parent'),
(364, 'app', 'Table of statistic of officer training course'),
(365, 'app', 'Insitutution Training'),
(366, 'app', 'Stat Institute Trains'),
(367, 'app', 'Title'),
(368, 'app', 'Cooperator'),
(369, 'app', 'Times'),
(370, 'app', 'Place'),
(371, 'app', 'Statistics of Institution Training'),
(372, 'app', 'Attendance'),
(374, 'app', 'Insitutution Meeting'),
(375, 'app', 'Stat Institute Meetings'),
(376, 'app', 'Create Stat Institute Meeting'),
(377, 'app', 'Statistics of Institution Meeting'),
(378, 'app', 'The Chart of Officers Organisation Training'),
(379, 'app', 'Technical Local'),
(380, 'app', 'Technical Oversea'),
(381, 'app', 'Theory Local'),
(382, 'app', 'Theory Oversea'),
(383, 'app', 'Ministry Officer Upgrading'),
(384, 'app', 'Research'),
(385, 'app', 'Stat Researches'),
(386, 'app', 'Create Stat Research'),
(387, 'app', 'Stat Researchs'),
(388, 'app', 'Goverment'),
(389, 'app', 'Dornor'),
(390, 'app', 'Scholarship'),
(391, 'app', 'Attendee'),
(392, 'app', 'Statistics of Research'),
(393, 'app', ''),
(394, 'app', 'Performance'),
(395, 'app', 'Stat Highcoin Ministries'),
(396, 'app', 'Create Stat Highcoin Ministry'),
(398, 'app', 'Awards'),
(399, 'app', 'Create Award'),
(400, 'app', 'Award'),
(437, 'app', 'Statistics of Highcoin Ministry'),
(438, 'app', 'Stat Hornorcoin Provinces'),
(439, 'app', 'Create Stat Hornorcoin Province'),
(440, 'app', 'Stat Hornorcoin Ministries'),
(441, 'app', 'Statistics of Hornor Coin Province'),
(442, 'app', 'Stat Victorycoin Ministries'),
(443, 'app', 'Stat Victorycoin Provinces'),
(444, 'app', 'Statistics of Highcoin Province'),
(445, 'app', 'Stat Govcoin Ministries'),
(446, 'app', 'Create Stat Govcoin Ministry'),
(447, 'app', 'Stat Goverment Coin Ministries'),
(448, 'app', 'Stat Victoryoversea Ministries'),
(477, 'app', 'Stat Victoryoversea Provinces'),
(478, 'app', 'Create Stat Victoryoversea Province'),
(479, 'app', 'Stat Goverment Oversea Ministries'),
(480, 'app', 'Statistics of Govoversea Ministry'),
(481, 'app', 'Stat Govcoin Provinces'),
(482, 'app', 'Create Stat Govcoin Province'),
(483, 'app', 'Stat Goverment Coin Provinces'),
(484, 'app', 'Statistics of GovCoin Province'),
(485, 'app', 'Stat Goverment Oversea Provinces'),
(486, 'app', 'Statistics of GovOversea Province'),
(487, 'app', 'Document'),
(488, 'app', 'Stat Documents'),
(489, 'app', 'Create Stat Document'),
(490, 'app', 'Section'),
(491, 'app', 'Book Type'),
(492, 'app', 'Books'),
(493, 'app', 'Create Book'),
(500, 'app', 'Bad Request'),
(501, 'app', 'Stat Copies'),
(502, 'app', 'Activity'),
(503, 'app', 'ໄລຍະເວລາຈັດຕັ້ງປະຕິບັດ'),
(504, 'app', 'Summary'),
(505, 'app', 'Stat Map Services'),
(506, 'app', 'Statistics of Map Service'),
(507, 'app', 'Stat Map Produces'),
(508, 'app', 'Stat Explores'),
(514, 'app', 'Officer Levels'),
(515, 'app', 'Create Officer Level'),
(516, 'app', 'Stat Officer Salaries'),
(517, 'app', 'Statistics of Officers by Salary Level'),
(518, 'app', 'Stat Officer Age Levels'),
(519, 'app', 'Create Stat Officer Age Level'),
(520, 'app', 'Statistics of Officers by Degree'),
(521, 'app', 'Stat Officer Ministries Upgrade'),
(522, 'app', 'The Chart of Officers Ministry Training'),
(523, 'app', 'ກົມພັດທະນາການບໍລິຫານລັດ'),
(524, 'app', 'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງກາ'),
(525, 'app', 'ລາຍງານ'),
(526, 'app', 'ປ້ອນຂໍ້ມູນ'),
(527, 'app', 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສ'),
(528, 'app', 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ'),
(529, 'app', 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່າ'),
(530, 'app', 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ'),
(531, 'app', 'ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອ'),
(532, 'app', 'ກົມການປົກຄອງທ້ອງຖິ່ນ'),
(533, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ,'),
(534, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ'),
(535, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລ'),
(536, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວ'),
(537, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມ'),
(538, 'app', 'ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າ'),
(539, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ'),
(540, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຕົວເມືອງ'),
(541, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ ໃນເຂດຊົນນະບົດ'),
(542, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າ'),
(543, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນຂັ້ນບ້ານ'),
(544, 'app', 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ'),
(545, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄ'),
(546, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ'),
(547, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ'),
(548, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວແຂວງ'),
(549, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິຊົນເຜົ່າໃນທົ່ວເມືອງ'),
(550, 'app', 'ກົມຄຸ້ມຄອງພົນລະເມືອງ'),
(551, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ'),
(552, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະ'),
(553, 'app', 'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປ'),
(554, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງ'),
(555, 'app', 'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເ'),
(556, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ..'),
(557, 'app', 'ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳ'),
(558, 'app', 'ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປ'),
(559, 'app', 'ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປ'),
(560, 'app', 'ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ'),
(561, 'app', 'ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອ'),
(562, 'app', 'ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ'),
(563, 'app', 'ກົມຄຸ້ມຄອງລັດຖະກອນ'),
(564, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິ'),
(565, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນ'),
(566, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມວິຊາສະເພາະ'),
(567, 'app', 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ'),
(568, 'app', 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),
(569, 'app', 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານ'),
(570, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບກ'),
(571, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ'),
(572, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານຕາມສັນຍາ'),
(573, 'app', 'ຕາຕະລາງຈຳນວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ'),
(574, 'app', 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ'),
(575, 'app', 'ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ'),
(576, 'app', 'ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງກາ'),
(577, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະ'),
(578, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາ'),
(579, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່'),
(580, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮ'),
(581, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະ'),
(582, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລ'),
(583, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເ'),
(584, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສ'),
(585, 'app', 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮ'),
(586, 'app', 'ຕາຕະລາງສະຖິຕິສັງລວມການສ້າງ ແລະ ພັດທະນາຫຼັກສູດ'),
(587, 'app', 'ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູ'),
(588, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາ'),
(589, 'app', 'ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ'),
(590, 'app', 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ'),
(591, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝ'),
(592, 'app', 'ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະ'),
(593, 'app', 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ'),
(594, 'app', 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ'),
(595, 'app', 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ'),
(596, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົ'),
(597, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວ'),
(598, 'app', 'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອ'),
(599, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັ'),
(600, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂ'),
(601, 'app', 'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອ'),
(602, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັ'),
(603, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບ'),
(604, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະ'),
(605, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂ'),
(606, 'app', 'ກົມແຜນທີ່ແຫ່ງຊາດ'),
(607, 'app', 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......'),
(608, 'app', 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ'),
(609, 'app', 'ສະຖິຕິການຜະລິດແຜນທີ່'),
(610, 'app', 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່'),
(611, 'app', 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ'),
(612, 'app', 'ຫ້ອງການກະຊວງ'),
(613, 'app', 'ກົມແຜນການ ແລະ ການຮ່ວມມື'),
(614, 'app', 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທ'),
(615, 'app', 'ຕາຕະລາງສະຖິຕິການຮ່ວມມື'),
(616, 'app', 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ'),
(617, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ'),
(618, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາ'),
(619, 'app', 'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ'),
(620, 'app', 'ຕາຕະລາງ ຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),
(621, 'app', 'ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫ'),
(622, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບກ'),
(623, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ'),
(624, 'app', 'ຈໍານວນລັດຖະກອນທີ່ມີເງື່ອນໄຂຮັບບຳນານ'),
(625, 'app', 'ຕາຕະລາງສັງລວມຊີວະປະຫວັດຫຍໍ້ຂອງພະນັກງານ'),
(626, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍ'),
(627, 'app', 'ກົມກວດກາ'),
(628, 'app', 'ຜູ້ໃຊ້ລະບົບ'),
(629, 'app', 'ສິດແລະບົດບາດ'),
(630, 'app', 'ຕັ້ງຄ່າ'),
(631, 'app', 'Roles'),
(632, 'app', 'Create Role'),
(633, 'app', 'Input Dt Stamp'),
(634, 'app', 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)'),
(635, 'app', 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ'),
(636, 'app', 'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ'),
(637, 'app', 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່'),
(638, 'app', 'ຮ່າງໂຄງປະກອບກົງຈັກການຈັດຕັ້ງ ແລະ ບຸກຄະລະກອນຂອງກະຊວງ/ອົງການລັດທຽບເທົ່າກະຊວງ'),
(639, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕໍາແໜ່ງເຈົ້າແຂວງ, ຮອງເຈົ້າແຂວງ, ເຈົ້າຄອງນະຄອນ ແລະ ຮອງເຈົ້າຄອງນະຄອນ'),
(640, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົກຄອງແຂວງ'),
(641, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າ, ຮອງຫົວໜ້າພະແນກ ແລະ ອົງການທຽບເທົ່າ'),
(642, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ'),
(643, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງເຈົ້າເມືອງ ແລະ ຮອງເຈົ້າເມືອງ'),
(644, 'app', 'ລາຍຊື່ຜູ້ລົງຕຳແໜ່ງຫົວໜ້າ ແລະ ຮອງຫົວໜ້າຫ້ອງວ່າການປົຄອງເມືອງ'),
(645, 'app', 'ລາຍຊື່ຜູ້ດຳລົງຕຳແໜ່ງຫົວໜ້າຫ້ອງການ, ຮອງຫົວໜ້າຫ້ອງການ ແລະ ອົງການທຽບເທົ່າ'),
(646, 'app', 'ຕາຕະລາງສັງລວມຂໍ້ມູນບ້ານເປົ້າໝາຍເຮັດບ້ານສາມສ້າງ'),
(647, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອໃນທົ່ວປະເທດ'),
(648, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິະສົງ, ສາມະເນນ, ຄູຄຳສອນ ແລະ ຄະນະຮັບຜິດຊອບສາສະໜາ'),
(649, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງແຂວງ...... ປະຈໍາປີ.......'),
(650, 'app', 'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງແຂວງ....... ປະຈຳປີ.......'),
(651, 'app', 'ຕາຕະລາງບັນທຶກສະຖິຕິພົນລະເມືອງຂອງເມືອງປະຈຳ 6 ເດືອນ....... ປະຈຳປີ ............'),
(652, 'app', 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງຂອງບ້ານປະຈຳງວດ.......... ປະຈຳປີ .............'),
(653, 'app', 'ຕາຕະລາງບັນທຶກການເກີດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .............'),
(654, 'app', 'ຕາຕະລາງບັນທຶກການແຕ່ງດອງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ..........'),
(655, 'app', 'ຕາຕະລາງບັນທຶກການຢ່າຮ້າງຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈໍາປີ ...........'),
(656, 'app', 'ຕາຕະລາງບັນທຶກການຍົກຍ້າຍມາຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .......'),
(657, 'app', 'ຕາຕະລາງບັນທຶກສາເຫດການຍົກຍ້າຍໄປຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳວັນ ປະຈຳປີ .....'),
(658, 'app', 'ຕາຕະລາງບັນທຶກສາເຫດານເສຍຊີວິດຂອງພົນລະເມືອງຂອງບ້ານ ປະຈຳປີ ...........'),
(659, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ສະເພາະຊັ້ນ VI)'),
(660, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ແຕ່ຊັ້ນ I-V)'),
(661, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ'),
(662, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ອອກພີ່ມໃນຮູບການຕ່າງໆ'),
(663, 'app', 'ຕາຕະລາງລາຍງານສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຝຶກອົບຮົມຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(664, 'app', 'ຕາຕະລາງສະຖິຕິພະນັກງານ-ລັດຖະກອນຂັ້ນກະຊວງ-ອົງການທຽບເທົ່າ ແລະ ທ້ອງຖິ່ນໄປຍົກລະດັບ (ໄປຮຽນຕໍ່) ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(665, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),
(666, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),
(667, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ພາຍໃນປະເທດ'),
(668, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມຢູ່ຕ່າງປະເທດ'),
(669, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ'),
(670, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ'),
(671, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ພາຍໃນປະເທດ'),
(672, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມທິດສະດີຢູ່ຕ່າງປະເທດ'),
(673, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)'),
(674, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນທີ່ໄປຍົກລະດັບວິຊາສະເພາະຢູ່ຕ່າງປະເທດ (ໄປຮຽນຕໍ່ຊັ້ນໃໝ່)'),
(675, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),
(676, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),
(677, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),
(678, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),
(679, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ພາຍໃນປະເທດ'),
(680, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິພະນັກງານ-ລັດຖະກອນໄປຝຶກອົບຮົມວິຊາສະເພາະຢູ່ຕ່າງປະເທດ'),
(681, 'app', 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ'),
(682, 'app', 'ຕາຕະລາງສະຖິຕິການສະໜອງຫຼັກສູດໃຫ້ບັນດາພາກສ່ວນສູນກາງ ແລະ ທ້ອງຖິ່ນ (ຕາມການສະເໜີ)'),
(683, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້າຮ່ວມຊ່ວຍເປັນວິທະຍາກອນຕາມການເຊື້ອເຊີນ'),
(684, 'app', 'ຕາຕະລາງສະຖິຕິສັງລວມການຈັດກອງປະຊຸມ-ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ-ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ'),
(685, 'app', 'ຕາຕະລາງເກັບກຳສະຖິຕິການເຂົ້ານຳໃຊ້ປຶ້ມຕຳລາຫໍສະໝຸດ'),
(686, 'app', 'ຕາຕະລາງສະຖິຕິສັງລວມການເຂົ້າຮ່ວມຝຶກອົບຮົມຂອງພະນັກງານ-ລັດຖະກອນ ພາຍໃນສະຖາບັນ'),
(687, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ'),
(688, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສໍາລັບຍ້ອງຍໍພາຍໃນກະຊວງ, ອົງການ'),
(689, 'app', 'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),
(690, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),
(691, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),
(692, 'app', 'ຕາຕະລາງປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),
(693, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),
(694, 'app', 'ຕາຕະລາງປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍສາກົນ ຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),
(695, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາກະຊວງ, ອົງການ'),
(696, 'app', 'ຕາຕະລາງປະເພດຫຼຽນກາ ສຳລັບຍ້ອງຍໍສາກົນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),
(697, 'app', 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ (ODA)'),
(698, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນສຳລັບຊັ້ນ .... ເຖິງ ..... ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ'),
(699, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ'),
(700, 'app', 'ຕາຕະລາງສັງລວມລັດຖະກອນຜູ້ທີ່ໄດ້ຮັບຕໍາແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),
(701, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ'),
(702, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນພະນັກງານ (ສະເພາະຊັ້ນ VI) ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ'),
(703, 'app', 'User Control'),
(704, 'app', 'Role Name'),
(705, 'app', 'Created Date Time'),
(706, 'app', 'New Record'),
(707, 'app', 'Menu Item(s)'),
(708, 'app', 'Aaction Item(s)'),
(709, 'app', 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ'),
(710, 'app', 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ'),
(711, 'app', 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ '),
(712, 'app', 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ'),
(713, 'app', 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ'),
(714, 'app', 'ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ'),
(715, 'app', 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ'),
(716, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ'),
(717, 'app', 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ'),
(718, 'app', 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ'),
(719, 'app', 'ຈຳນວນພະນັກງານຕາມສັນຍາ'),
(720, 'app', 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),
(721, 'app', 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່'),
(722, 'app', 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ'),
(723, 'app', 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ'),
(724, 'app', 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ'),
(725, 'app', 'ສະຖິຕິການສັງລວມ ການສຳເນົາ'),
(726, 'app', 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),
(727, 'app', 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ'),
(728, 'app', 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ'),
(729, 'app', 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),
(730, 'app', 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ'),
(731, 'app', 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),
(732, 'app', 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),
(733, 'app', 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),
(734, 'app', 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ'),
(735, 'app', 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ'),
(736, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V'),
(737, 'app', 'Incorrect Phiscal Year'),
(738, 'app', 'Womwn'),
(739, 'app', 'ພະ'),
(740, 'app', 'ຈົວ'),
(741, 'app', 'ພໍ່ຂາວ'),
(742, 'app', 'ແມ່ຂາວ'),
(743, 'app', 'ສັງກະລີ'),
(744, 'app', 'ປະເພດ'),
(747, 'app', 'Stat Officer Organisations Upgrade'),
(748, 'app', 'Statistics of Document Copy'),
(749, 'app', 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ'),
(750, 'app', 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ'),
(751, 'app', 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ'),
(752, 'app', 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ'),
(753, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(754, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(755, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(756, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(757, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(758, 'app', 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ'),
(759, 'app', 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ'),
(760, 'app', 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ'),
(761, 'app', 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ'),
(762, 'app', 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ'),
(763, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ'),
(764, 'app', 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ'),
(765, 'app', 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ'),
(766, 'app', 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ'),
(767, 'app', 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ'),
(768, 'app', 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ'),
(769, 'app', 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ'),
(770, 'app', 'Stat Officer Ethnics'),
(771, 'app', 'Create Stat Officer Ethnic'),
(772, 'app', 'Stat Positions'),
(773, 'app', 'Create Stat Position'),
(774, 'app', 'Stat Officer News'),
(775, 'app', 'Create Stat Officer New'),
(776, 'app', 'ກົມ'),
(777, 'app', 'User Name'),
(778, 'app', 'First Name'),
(779, 'app', 'Last Name'),
(780, 'app', 'Telephone');
INSERT INTO `source_message` (`id`, `category`, `message`) VALUES
(781, 'app', 'Email'),
(782, 'app', 'Role'),
(783, 'app', 'Input Date Time Stamp'),
(784, 'app', 'Plase select'),
(785, 'app', 'Add Role'),
(786, 'app', 'Add Record'),
(787, 'app', 'Action Item(s)'),
(788, 'app', 'Subordinate'),
(789, 'app', 'Selecct All'),
(790, 'app', 'Stat Odas'),
(804, 'app', 'Clear'),
(805, 'app', 'Incorrect Request'),
(806, 'app', 'Data Not Found'),
(807, 'app', 'Is Province'),
(808, 'app', 'Is Province Role'),
(809, 'app', 'Save Role'),
(810, 'app', 'Update Role'),
(811, 'app', 'Delete Role'),
(812, 'app', 'Subordinate(s)'),
(813, 'app', 'Department(s)'),
(814, 'app', 'Province(s)'),
(815, 'app', 'User List'),
(816, 'app', 'Select All'),
(817, 'app', 'Department List'),
(818, 'app', 'Data has been save success fully!'),
(819, 'app', 'Unauthorized'),
(820, 'app', 'HTTP Error 401 Unauthorized operation'),
(821, 'app', 'You are not authorized to access this page due to invalid authentication'),
(822, 'app', 'Please contact administrator'),
(823, 'app', 'ທັງໝົດ'),
(824, 'app', 'ບໍ່ອະນຸຍາດ'),
(825, 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication');

-- --------------------------------------------------------

--
-- Table structure for table `stat_association_foundation`
--

CREATE TABLE IF NOT EXISTS `stat_association_foundation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_association_foundation_user1_idx` (`user_id`),
  KEY `fk_stat_association_foundation_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_association_foundation`
--

INSERT INTO `stat_association_foundation` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES
(1, '2017-10-15 15:59:22', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_association_foundation_detail`
--

CREATE TABLE IF NOT EXISTS `stat_association_foundation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `association` int(11) DEFAULT NULL,
  `foundation` int(11) DEFAULT NULL,
  `remark` text,
  `stat_association_foundation_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_association_foundation_detail_stat_association_foun_idx` (`stat_association_foundation_id`),
  KEY `fk_stat_association_foundation_detail_approver1_idx` (`approver_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stat_association_foundation_detail`
--

INSERT INTO `stat_association_foundation_detail` (`id`, `association`, `foundation`, `remark`, `stat_association_foundation_id`, `approver_id`) VALUES
(1, 2, 4, 'sdgasg', 1, 1),
(2, 23, 1, 'sdgkal', 1, 2),
(3, 6, 4, '4', 1, 4),
(4, 2, 3, NULL, 1, 3),
(5, 4, 1, NULL, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_contract`
--

CREATE TABLE IF NOT EXISTS `stat_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_contract_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_contract_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_contract`
--

INSERT INTO `stat_contract` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-10 17:11:11', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_contract_detail`
--

CREATE TABLE IF NOT EXISTS `stat_contract_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_contract_detail`
--

INSERT INTO `stat_contract_detail` (`id`, `stat_contract_id`, `officer_level_id`, `quota_manage_total`, `quota_manage_women`, `quota_technic_total`, `quota_technic_women`, `nonquota_manage_total`, `nonquota_manage_women`, `nonquota_technic_total`, `nonquota_technic_women`) VALUES
(1, 1, 1, 9, 8, 7, 6, 5, 4, 3, 2),
(2, 1, 2, 99, 88, 77, 66, 55, 44, 33, 22);

-- --------------------------------------------------------

--
-- Table structure for table `stat_copy`
--

CREATE TABLE IF NOT EXISTS `stat_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_copy_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_copy_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_copy`
--

INSERT INTO `stat_copy` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 20:14:35', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_copy_detail`
--

CREATE TABLE IF NOT EXISTS `stat_copy_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_copy_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_copy_detail_stat_copy1_idx` (`stat_copy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_copy_detail`
--

INSERT INTO `stat_copy_detail` (`id`, `stat_copy_id`, `activity`, `start_year`, `end_year`, `summary`, `remark`) VALUES
(2, 1, 'ວຽກງານວິສຫວເັ', 2015, 2016, 'fsklajfkjljk', 'sss'),
(4, 1, 'ວຽກງານວິສຫວເັ', 2015, 2016, 'fsklajfkjljk', 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `stat_course`
--

CREATE TABLE IF NOT EXISTS `stat_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saved` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_course_user1_idx` (`user_id`),
  KEY `fk_stat_course_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `stat_course`
--

INSERT INTO `stat_course` (`id`, `saved`, `last_update`, `user_id`, `phiscal_year_id`) VALUES
(32, 1, '2017-10-14 11:50:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_course_detail`
--

CREATE TABLE IF NOT EXISTS `stat_course_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_course_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_course_detail_stat_course1_idx` (`stat_course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `stat_course_detail`
--

INSERT INTO `stat_course_detail` (`id`, `stat_course_id`, `name`, `deleted`, `parent_id`, `position`) VALUES
(13, 32, 'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)', 0, 0, 1),
(14, 32, 'ຫຼັກສູດການບໍລິຫານລັດ', 0, 13, 1),
(15, 32, 'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນໃໝ່', 0, 13, 2),
(16, 32, 'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນທີ່ (ທີ່ສຳເລັດ)', 0, 0, 2),
(17, 32, 'ຫຼັກສູດສຳລັບຜູ້ບໍລິຫານລະດັບສູງ', 0, 0, 3),
(18, 32, 'ັຫຼັກສູດພ', 0, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_document`
--

CREATE TABLE IF NOT EXISTS `stat_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_document_user1_idx` (`user_id`),
  KEY `fk_stat_document_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_document`
--

INSERT INTO `stat_document` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2017-09-16 19:15:29', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_document_detail`
--

CREATE TABLE IF NOT EXISTS `stat_document_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `stat_document_detail`
--

INSERT INTO `stat_document_detail` (`id`, `stat_document_id`, `province_id`, `ministry_id`, `organisation_id`, `book_id`, `before`, `after`, `after_new`, `remark`) VALUES
(1, 2, NULL, 1, NULL, NULL, 9, 8, 7, 'af'),
(2, 2, NULL, NULL, 1, NULL, 1, 2, 3, 'ok'),
(3, 2, NULL, NULL, 2, NULL, 3, 4, 5, 'aa'),
(4, 2, 1, NULL, NULL, NULL, 11, 22, 33, 'xasgd'),
(5, 2, 2, NULL, NULL, NULL, 66, 77, 88, 'kko'),
(6, 2, NULL, NULL, NULL, 1, 7350, NULL, NULL, NULL),
(7, 2, NULL, NULL, NULL, 2, NULL, 2000, 743, 'afasf');

-- --------------------------------------------------------

--
-- Table structure for table `stat_ethnic`
--

CREATE TABLE IF NOT EXISTS `stat_ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_ethnic_user1_idx` (`user_id`),
  KEY `fk_stat_ethnic_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_ethnic`
--

INSERT INTO `stat_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-09', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_ethnic_detail`
--

CREATE TABLE IF NOT EXISTS `stat_ethnic_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_ethnic_detail`
--

INSERT INTO `stat_ethnic_detail` (`id`, `total`, `ethnic_id`, `stat_ethnic_id`, `women`, `province_id`) VALUES
(1, 5, 1, 1, 3, 1),
(2, 7, 2, 1, 4, 1),
(3, 2, 3, 1, 1, 1),
(4, 8, 1, 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_explore`
--

CREATE TABLE IF NOT EXISTS `stat_explore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_explore_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_explore_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_explore`
--

INSERT INTO `stat_explore` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2017-09-16 21:44:06', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_explore_detail`
--

CREATE TABLE IF NOT EXISTS `stat_explore_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `stat_explore_detail`
--

INSERT INTO `stat_explore_detail` (`id`, `province_id`, `stat_explore_id`, `mark`, `point`, `hm`, `km`, `remark`) VALUES
(1, 1, 2, 92, 83, 73, 63, 'ccc'),
(2, 2, 2, 1, 2, 3, 4, 'dada'),
(3, 3, 2, 1122, 3344, 5566, 7788, 'hhh'),
(4, 4, 2, 99, 88, 77, 66, 'sss'),
(5, 5, 2, 999, 888, 777, 666, 'sss'),
(6, 7, 2, 11, 22, 33, 44, 'asdad'),
(7, 8, 2, 91, 81, 71, 61, 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_govcoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_govcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_govcoin_ministry`
--

INSERT INTO `stat_govcoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 11:26:57', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_govcoin_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_govcoin_ministry_detail`
--

INSERT INTO `stat_govcoin_ministry_detail` (`id`, `stat_govcoin_ministry_id`, `ministry_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES
(1, 1, 1, 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, 'kk'),
(2, 1, 2, 6, 743, 29, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 389, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_province`
--

CREATE TABLE IF NOT EXISTS `stat_govcoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govcoin_province_user1_idx` (`user_id`),
  KEY `fk_stat_govcoin_province_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_govcoin_province`
--

INSERT INTO `stat_govcoin_province` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 15:47:14', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_govcoin_province_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_govcoin_province_detail`
--

INSERT INTO `stat_govcoin_province_detail` (`id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`, `award_id`, `province_id`, `stat_govcoin_province_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 11, 1, 2, 3, 'asf', 2, 1, 1),
(2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 11, 22, 'oiuo', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_goverment_unit`
--

CREATE TABLE IF NOT EXISTS `stat_goverment_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_statistic1_user1_idx` (`user_id`),
  KEY `fk_stat_goverment_unit_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_goverment_unit`
--

INSERT INTO `stat_goverment_unit` (`id`, `user_id`, `last_update`, `saved`, `phiscal_year_id`) VALUES
(2, 1, '2017-10-15 12:02:14', 1, 1),
(3, 1, '2017-09-02 08:55:24', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_goverment_unit_detail`
--

CREATE TABLE IF NOT EXISTS `stat_goverment_unit_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `stat_goverment_unit_detail`
--

INSERT INTO `stat_goverment_unit_detail` (`id`, `department`, `insitute`, `center`, `stat_goverment_unit_id`, `remark`, `office`, `ministry_id`) VALUES
(1, 11, 22, 33, 2, 'sss', NULL, 0),
(2, NULL, NULL, NULL, 3, NULL, NULL, 0),
(3, 32, 2, 3, 2, 'sags', NULL, 0),
(4, 2, 22, 4, 2, NULL, 1, 0),
(5, 1, 2, 3, 2, NULL, 3, 0),
(6, 12, 32, 12, 2, 'aa', 22, 1),
(7, 2, 1, 3, 2, 'xx', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_govoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_govoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_govoversea_ministry`
--

INSERT INTO `stat_govoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 15:13:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_govoversea_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_govoversea_ministry_detail`
--

INSERT INTO `stat_govoversea_ministry_detail` (`id`, `stat_govoversea_ministry_id`, `ministry_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES
(1, 1, 1, 2, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, '່່ຫສັເາ່'),
(2, 1, 2, 3, 11, 22, 33, 44, 55, 66, 77, 88, 99, 1, 2, 3, 'hj');

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_province`
--

CREATE TABLE IF NOT EXISTS `stat_govoversea_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_govoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_govoversea_province_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_govoversea_province`
--

INSERT INTO `stat_govoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 15:56:38', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_govoversea_province_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_govoversea_province_detail`
--

INSERT INTO `stat_govoversea_province_detail` (`id`, `stat_govoversea_province_id`, `province_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES
(1, 1, 1, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 99, 88, 'າາ'),
(2, 1, 2, 6, 6, 5, 5, 4, 3, 21, 8, 9, 0, 11, 22, 33, '7');

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_highcoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_highcoin_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stat_highcoin_ministry`
--

INSERT INTO `stat_highcoin_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(5, '2017-09-15 20:18:39', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_highcoin_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stat_highcoin_ministry_detail`
--

INSERT INTO `stat_highcoin_ministry_detail` (`id`, `gold_personal`, `gold_team`, `hero_personal`, `hero_team`, `knight_personal`, `knight_team`, `labor_personal`, `labor_team`, `dev_personal`, `dev_team`, `remark`, `stat_highcoin_ministry_id`, `award_id`, `ministry_id`) VALUES
(1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 'kk', 5, 2, 1),
(2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'oo', 5, 2, 2),
(5, 5, 4, 3, 2, 1, 0, 9, 8, 7, 6, '5', 5, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highoversea_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_highoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_highoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_highoversea_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_highoversea_ministry`
--

INSERT INTO `stat_highoversea_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 11:54:37', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highoversea_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_highoversea_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_highoversea_ministry_detail`
--

INSERT INTO `stat_highoversea_ministry_detail` (`id`, `stat_highoversea_ministry_id`, `ministry_id`, `award_id`, `gold_personal`, `gold_team`, `lanx_personal`, `lanx_team`, `hono_personal`, `hono_team`, `remark`) VALUES
(1, 1, 1, 2, 9, 8, 7, 6, 5, 4, 'zxvz'),
(2, 1, 1, 3, 6, 5, 4, 3, 2, 1, 'nmbmn');

-- --------------------------------------------------------

--
-- Table structure for table `stat_hornorcoin_province`
--

CREATE TABLE IF NOT EXISTS `stat_hornorcoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_hornorcoin_province_user1_idx` (`user_id`),
  KEY `fk_stat_hornorcoin_province_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_hornorcoin_province`
--

INSERT INTO `stat_hornorcoin_province` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES
(1, 1, 1, '2017-09-16 07:23:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_hornorcoin_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_hornorcoin_province_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_hornorcoin_province_detail`
--

INSERT INTO `stat_hornorcoin_province_detail` (`id`, `hero_personal`, `hero_team`, `knight_personal`, `knight_team`, `labor_personal`, `labor_team`, `dev_personal`, `dev_team`, `remark`, `province_id`, `award_id`, `stat_hornorcoin_province_id`) VALUES
(1, 8, 7, 6, 5, 4, 3, 2, 1, 'zzf', 1, 2, 1),
(2, 3, 4, 5, 6, 7, 8, 9, 0, 'kjhfks', 1, 3, 1),
(3, 99, 88, 77, 66, 55, 44, 33, 22, 's', 1, 4, 1),
(4, 9, 8, 7, 6, 5, 4, 3, 2, '1kk', 3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_meeting`
--

CREATE TABLE IF NOT EXISTS `stat_institute_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_meeting_user1_idx` (`user_id`),
  KEY `fk_stat_institute_meeting_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_institute_meeting`
--

INSERT INTO `stat_institute_meeting` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-14 17:51:28', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_meeting_detail`
--

CREATE TABLE IF NOT EXISTS `stat_institute_meeting_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_institute_meeting_detail`
--

INSERT INTO `stat_institute_meeting_detail` (`id`, `title`, `total`, `women`, `start_date`, `end_date`, `times`, `place`, `stat_institute_meeting_id`) VALUES
(1, ';ksd', 72, 6, '2017-09-14 00:00:00', '2017-09-14 00:00:00', 2, 'sag', 1),
(2, 'asdg', 66, 55, '2017-08-29 00:00:00', '2017-09-27 00:00:00', 4, 'asgsg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_train`
--

CREATE TABLE IF NOT EXISTS `stat_institute_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_institute_train_user1_idx` (`user_id`),
  KEY `fk_stat_institute_train_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_institute_train`
--

INSERT INTO `stat_institute_train` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2017-09-14 17:24:35', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_train_detail`
--

CREATE TABLE IF NOT EXISTS `stat_institute_train_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_institute_train_detail`
--

INSERT INTO `stat_institute_train_detail` (`id`, `stat_institute_train_id`, `title`, `total`, `women`, `start_date`, `end_date`, `cooperator`, `times`, `place`) VALUES
(1, 2, 'k.shgalkj', 7, 6, '2017-09-05 00:00:00', '2017-08-31 00:00:00', 'dasfs', 23, 'asdgs'),
(2, 2, 'aaa', 7, 6, '2017-09-05 00:00:00', '2017-08-31 00:00:00', 'dasfs', 23, 'asdgs'),
(3, 2, 'sfa', 2, 1, '2017-09-14 00:00:00', '2017-09-14 00:00:00', 'dasg', 2, '124rf');

-- --------------------------------------------------------

--
-- Table structure for table `stat_legal`
--

CREATE TABLE IF NOT EXISTS `stat_legal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_legal_user1_idx` (`user_id`),
  KEY `fk_stat_legal_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `stat_legal`
--

INSERT INTO `stat_legal` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES
(20, '2017-09-04 18:12:12', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_legal_detail`
--

CREATE TABLE IF NOT EXISTS `stat_legal_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_legal_detail`
--

INSERT INTO `stat_legal_detail` (`id`, `new`, `remark`, `improve`, `publish`, `stat_legal_id`, `legal_id`) VALUES
(1, 1, ';lk;', 0, 'k.jnkl', 20, 1),
(2, 1, 'll', 0, 'sdfasf', 20, 2),
(3, 1, 'iuiyiu', 1, 'pop', 20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_local_admin`
--

CREATE TABLE IF NOT EXISTS `stat_local_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_local_admin_user1_idx` (`user_id`),
  KEY `fk_stat_local_admin_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stat_local_admin`
--

INSERT INTO `stat_local_admin` (`id`, `last_update`, `user_id`, `saved`, `phiscal_year_id`) VALUES
(8, '2017-10-19 01:54:38', 1, 1, 1),
(9, '2017-09-05 19:42:37', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_local_admin_detail`
--

CREATE TABLE IF NOT EXISTS `stat_local_admin_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `stat_local_admin_detail`
--

INSERT INTO `stat_local_admin_detail` (`id`, `stat_local_admin_id`, `province_id`, `province_head_total`, `province_head_women`, `province_vice_total`, `province_vice_women`, `district_head_total`, `district_head_women`, `district_vice_total`, `district_vice_women`, `village_head_total`, `village_head_women`, `village_vice_total`, `village_vice_women`, `population_total`, `population_women`, `village`, `family_total`, `family_poor`) VALUES
(1, 8, 1, 3, 2, 123, 1, 1, NULL, NULL, NULL, 146, NULL, 346, NULL, 346, NULL, 346, NULL, NULL),
(2, 9, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 13, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 8, 4, NULL, NULL, NULL, NULL, 34, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 34, 4),
(6, 8, 3, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 8, 6, 23, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_produce`
--

CREATE TABLE IF NOT EXISTS `stat_map_produce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_produce_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_map_produce_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_map_produce`
--

INSERT INTO `stat_map_produce` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 20:58:17', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_produce_detail`
--

CREATE TABLE IF NOT EXISTS `stat_map_produce_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_map_produce_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_produce_detail_stat_map_produce1_idx` (`stat_map_produce_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_map_produce_detail`
--

INSERT INTO `stat_map_produce_detail` (`id`, `stat_map_produce_id`, `activity`, `amount`, `remark`) VALUES
(1, 1, 'ຫຫຫຫ', 9817, ';kjal;s'),
(2, 1, 'vvv', 1111, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_service`
--

CREATE TABLE IF NOT EXISTS `stat_map_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_service_user1_idx` (`user_id`),
  KEY `fk_stat_map_service_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_map_service`
--

INSERT INTO `stat_map_service` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 20:48:51', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_service_detail`
--

CREATE TABLE IF NOT EXISTS `stat_map_service_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_map_service_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_map_service_detail_stat_map_service1_idx` (`stat_map_service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_map_service_detail`
--

INSERT INTO `stat_map_service_detail` (`id`, `stat_map_service_id`, `activity`, `amount`, `km`, `point`, `remark`) VALUES
(1, 1, 'bbb', 4444, 3333, 2222, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `stat_oda`
--

CREATE TABLE IF NOT EXISTS `stat_oda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_oda_user1_idx` (`user_id`),
  KEY `fk_stat_oda_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_oda`
--

INSERT INTO `stat_oda` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(3, '2017-10-11 16:48:57', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_oda_detail`
--

CREATE TABLE IF NOT EXISTS `stat_oda_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_oda_detail`
--

INSERT INTO `stat_oda_detail` (`id`, `stat_oda_id`, `code`, `name`, `start_year`, `end_year`, `amount`, `free`, `loan`, `organisation`, `receive`, `deleted`) VALUES
(1, 3, 'eee', 'wet', 2011, 2012, 1231414, 1, NULL, 'koida', 24124, 0),
(2, 3, 't3', '51251', 213, 1241, 3528, NULL, 1, 'aaa', 3623, 1),
(3, 3, 'dhs', 'dhsd', 234, 234, 456, NULL, 1, '4324', 435, 1),
(4, 3, 'jhb', 'dfhd', 1245, 2352, 875837, NULL, 1, 'dhsdh', 23532, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer`
--

CREATE TABLE IF NOT EXISTS `stat_officer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer`
--

INSERT INTO `stat_officer` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-24 19:05:07', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_add`
--

CREATE TABLE IF NOT EXISTS `stat_officer_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_add_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_add_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_add`
--

INSERT INTO `stat_officer_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 10:42:23', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_add_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_add_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_add_detail`
--

INSERT INTO `stat_officer_add_detail` (`id`, `quota_total`, `quota_women`, `army_total`, `army_women`, `soe_total`, `soe_women`, `stat_officer_add_id`) VALUES
(1, 9, 8, 7, 6, 5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_age`
--

CREATE TABLE IF NOT EXISTS `stat_officer_age` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_age_user1_idx` (`user_id`),
  KEY `fk_stat_officer_age_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_age`
--

INSERT INTO `stat_officer_age` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-09 22:44:00', 1, 1, 2),
(2, '2017-09-09 22:44:11', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_age_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_age_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_age_detail`
--

INSERT INTO `stat_officer_age_detail` (`id`, `stat_officer_age_id`, `total_u25`, `women_u25`, `total_25_30`, `women_25_30`, `total_31_35`, `women_31_35`, `total_36_40`, `women_36_40`, `total_41_45`, `women_41_45`, `total_46_50`, `women_46_50`, `total_51_55`, `women_51_55`, `total_56_60`, `women_56_60`, `total_61u`, `women_61u`) VALUES
(1, 1, 999, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 5, 4, 3, 2, 1),
(2, 2, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 84, 7, 6, 5, 4, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_agelevel`
--

CREATE TABLE IF NOT EXISTS `stat_officer_agelevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_agelevel_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_agelevel_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_agelevel`
--

INSERT INTO `stat_officer_agelevel` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-26 17:07:39', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_agelevel_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_agelevel_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_agelevel_detail`
--

INSERT INTO `stat_officer_agelevel_detail` (`id`, `stat_officer_agelevel_id`, `officer_level_id`, `total_18`, `women_18`, `total_20`, `women_20`, `total_25`, `women_25`, `total_30`, `women_30`, `total_35`, `women_35`, `total_40`, `women_40`, `total_45`, `women_45`, `total_50`, `women_50`, `total_55`, `women_55`, `total_60`, `women_60`, `total_60p`, `women_60p`) VALUES
(1, 3, 1, 2, 1, 9, 6, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 2, 8, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, 3, 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_contract`
--

CREATE TABLE IF NOT EXISTS `stat_officer_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_contract_user1_idx` (`user_id`),
  KEY `fk_stat_officer_contract_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_contract`
--

INSERT INTO `stat_officer_contract` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-10 11:19:55', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_contract_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_contract_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_contract_detail`
--

INSERT INTO `stat_officer_contract_detail` (`id`, `stat_officer_contract_id`, `admin_approve_total`, `admin_approve_women`, `admin_non_total`, `admin_non_women`, `officer_approve_total`, `officer_approve_women`, `officer_non_total`, `officer_non_women`) VALUES
(1, 1, 9, 8, 7, 6, 5, 4, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_degree`
--

CREATE TABLE IF NOT EXISTS `stat_officer_degree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_offcer_degree_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_offcer_degree_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_degree`
--

INSERT INTO `stat_officer_degree` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 06:07:37', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_degree_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_degree_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_degree_detail`
--

INSERT INTO `stat_officer_degree_detail` (`id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `no_total`, `no_women`, `stat_officer_degree_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_detail`
--

INSERT INTO `stat_officer_detail` (`id`, `stat_officer_id`, `center_total`, `province_total`, `district_total`, `center_women`, `province_women`, `district_women`) VALUES
(1, 1, 888, 77, 55, 88, 66, 40);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ethnic`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ethnic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ethnic_user1_idx` (`user_id`),
  KEY `fk_stat_officer_ethnic_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `stat_officer_ethnic`
--

INSERT INTO `stat_officer_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(9, '2017-10-01 14:34:48', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ethnic_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ethnic_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_ethnic_detail`
--

INSERT INTO `stat_officer_ethnic_detail` (`id`, `stat_officer_ethnic_id`, `total`, `officer_level_id`, `ethnic_id`, `women`) VALUES
(1, 9, 9, 1, 1, 7),
(2, 9, 4, 1, 7, 1),
(3, 9, 8, 3, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_ministry`
--

INSERT INTO `stat_officer_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-10 18:08:54', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_add`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_add_user1_idx` (`user_id`),
  KEY `fk_stat_officer_ministry_add_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_ministry_add`
--

INSERT INTO `stat_officer_ministry_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-25 18:39:51', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_add_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_officer_ministry_add_id` int(11) NOT NULL,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_add_detail_stat_officer_ministry_a_idx` (`stat_officer_ministry_add_id`),
  KEY `fk_stat_officer_ministry_add_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `stat_officer_ministry_add_detail`
--

INSERT INTO `stat_officer_ministry_add_detail` (`id`, `stat_officer_ministry_add_id`, `add`, `resign`, `ministry_id`) VALUES
(1, 1, 887, 98, 1),
(2, 1, 987, 876, 2),
(3, 1, 765, 456, 4),
(4, 1, 70, 60, 5),
(5, 1, 9, 3, 30),
(6, 1, 555, 444, 42);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_detail_stat_officer_ministry1_idx` (`stat_officer_ministry_id`),
  KEY `fk_stat_officer_ministry_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_officer_ministry_detail`
--

INSERT INTO `stat_officer_ministry_detail` (`id`, `total`, `women`, `stat_officer_ministry_id`, `ministry_id`) VALUES
(1, 9, 8, 3, 1),
(2, 7, 6, 3, 2),
(3, 20, 10, 3, 4),
(4, 17, 14, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_train`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_train_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_ministry_train`
--

INSERT INTO `stat_officer_ministry_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2017-09-13 11:36:01', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_train_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_train_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_ministry_train_detail`
--

INSERT INTO `stat_officer_ministry_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_ministry_train_id`, `ministry_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 2, 5),
(2, 77, 66, 55, 44, 33, 22, 11, 5, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_upgrade`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_ministry_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_ministry_upgrade_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_ministry_upgrade`
--

INSERT INTO `stat_officer_ministry_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-13 19:40:15', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_upgrade_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_ministry_upgrade_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_ministry_upgrade_detail`
--

INSERT INTO `stat_officer_ministry_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_ministry_upgrade_id`, `ministry_id`) VALUES
(1, 100, NULL, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 5, 4, 3, 2, 1, 999, 888, 777, 666, 555, 444, 1, 1),
(2, 11, 1, 22, 2, 33, 3, 44, 4, 55, 5, 66, 6, 77, 7, 88, 8, 99, 9, 111, 12, 222, 23, 333, 34, 1, 2),
(3, 99, 9, 88, 8, 77, 7, 66, 6, 55, 5, 44, 4, 33, 3, 22, 2, 11, 1, 12, 2, 13, 3, 14, 4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_need`
--

CREATE TABLE IF NOT EXISTS `stat_officer_need` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_need_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_need_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_need`
--

INSERT INTO `stat_officer_need` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 12:35:21', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_need_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_need_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `stat_officer_need_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_need_detail_stat_officer_need1_idx` (`stat_officer_need_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_need_detail`
--

INSERT INTO `stat_officer_need_detail` (`id`, `center`, `province`, `district`, `stat_officer_need_id`) VALUES
(1, 9, 8, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_new`
--

CREATE TABLE IF NOT EXISTS `stat_officer_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_new_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_new_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_new`
--

INSERT INTO `stat_officer_new` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-03 16:18:43', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_new_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_new_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_new_detail`
--

INSERT INTO `stat_officer_new_detail` (`id`, `stat_officer_new_id`, `officer_level_id`, `new_total`, `ministry_total`, `army_total`, `soe_total`, `quota`, `need`, `new_women`, `ministry_women`, `army_women`, `soe_women`) VALUES
(1, 1, 1, 9, 7, 5, 3, 1, 0, 8, 6, 4, 2),
(2, 1, 2, 99, 77, 55, 33, 11, 1, 88, 66, 44, 22),
(3, 1, 3, 11, 22, 33, 44, 55, 5, 1, 2, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_org`
--

CREATE TABLE IF NOT EXISTS `stat_officer_org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_org_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_org_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_org`
--

INSERT INTO `stat_officer_org` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 18:31:41', 1, 1, 1),
(2, '2017-09-10 20:26:23', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_org_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_org_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_org_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_org_detail_stat_officer_org1_idx` (`stat_officer_org_id`),
  KEY `fk_stat_officer_org_detail_organisation1_idx` (`organisation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_officer_org_detail`
--

INSERT INTO `stat_officer_org_detail` (`id`, `total`, `women`, `stat_officer_org_id`, `organisation_id`) VALUES
(1, 11, 1, 1, 1),
(2, 5, 0, 1, 2),
(3, 8, 7, 2, 1),
(4, 3, 0, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_add`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_add_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_organisation_add_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_organisation_add`
--

INSERT INTO `stat_officer_organisation_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-11 18:18:39', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_add_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_organisation_add_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_add_detail_stat_officer_organi_idx` (`stat_officer_organisation_add_id`),
  KEY `fk_stat_officer_organisation_add_detail_organisation1_idx` (`organisation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_organisation_add_detail`
--

INSERT INTO `stat_officer_organisation_add_detail` (`id`, `add`, `resign`, `stat_officer_organisation_add_id`, `organisation_id`) VALUES
(1, 888, 77, 3, 1),
(2, 777, 660, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_train`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_organisation_train_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_organisation_train`
--

INSERT INTO `stat_officer_organisation_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-13 18:30:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_train_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_train_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_organisation_train_detail`
--

INSERT INTO `stat_officer_organisation_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_organisation_train_id`, `organisation_id`) VALUES
(1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 1),
(2, 7, 6, 5, 4, 3, 2, 11, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_upgrade`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_organisation_upgrade_user1_idx` (`user_id`),
  KEY `fk_stat_officer_organisation_upgrade_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_organisation_upgrade`
--

INSERT INTO `stat_officer_organisation_upgrade` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-13 20:08:43', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_upgrade_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_organisation_upgrade_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_organisation_upgrade_detail`
--

INSERT INTO `stat_officer_organisation_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `organisation_id`, `stat_officer_organisation_upgrade_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 65, 4, 3, 2, 1, 0, 11, 1, 22, 2, 33, 3, 1, 1),
(2, 1, 0, 2, 1, 3, 2, 4, 3, 5, 4, 6, 5, 7, 6, 8, 7, 9, 8, 10, 9, 11, 10, 12, 11, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_position`
--

CREATE TABLE IF NOT EXISTS `stat_officer_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_position_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_position_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_position`
--

INSERT INTO `stat_officer_position` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 12:06:51', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_position_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_position_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_position_detail`
--

INSERT INTO `stat_officer_position_detail` (`id`, `p1_total`, `p1_women`, `p2_total`, `p2_women`, `p3_total`, `p3_women`, `p4_total`, `p4_women`, `p5_total`, `p5_women`, `p6_total`, `p6_women`, `p7_total`, `p7_women`, `p8_total`, `p8_women`, `stat_officer_position_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 5, 4, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_province`
--

INSERT INTO `stat_officer_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-25 18:37:17', 1, 1, 1),
(2, '2017-09-10 20:24:10', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_add`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_add` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_add_user1_idx` (`user_id`),
  KEY `fk_stat_officer_province_add_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_province_add`
--

INSERT INTO `stat_officer_province_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-11 18:48:06', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_add_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_add_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_province_add_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_add_detail_stat_officer_province_a_idx` (`stat_officer_province_add_id`),
  KEY `fk_stat_officer_province_add_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stat_officer_province_add_detail`
--

INSERT INTO `stat_officer_province_add_detail` (`id`, `add`, `resign`, `stat_officer_province_add_id`, `province_id`) VALUES
(1, 88, 19, 1, 1),
(2, 88, 77, 1, 17),
(3, 77, 66, 1, 16),
(4, 50, 38, 1, 14),
(5, 81, 48, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_detail_stat_officer_province1_idx` (`stat_officer_province_id`),
  KEY `fk_stat_officer_province_detail_province1_idx` (`province_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `stat_officer_province_detail`
--

INSERT INTO `stat_officer_province_detail` (`id`, `total`, `women`, `stat_officer_province_id`, `province_id`) VALUES
(1, 9, 0, 1, 17),
(2, 8, 1, 1, 1),
(3, 7, 6, 1, 16),
(4, 10, 2, 1, 15),
(5, 10, 10, 1, 18),
(6, 9, 9, 1, 5),
(7, 7, 7, 1, 13),
(8, 9, 9, 2, 1),
(9, 8, 4, 2, 2),
(10, 8, 4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_train`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_train_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_train_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_province_train`
--

INSERT INTO `stat_officer_province_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2017-09-13 17:50:26', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_train_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_train_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_province_train_detail`
--

INSERT INTO `stat_officer_province_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `stat_officer_province_train_id`, `province_id`, `theo_out_total`, `theo_out_women`) VALUES
(1, 9, 8, 7, 6, 5, 4, 2, 1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_upgrade`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_province_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_province_upgrade_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_province_upgrade`
--

INSERT INTO `stat_officer_province_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-13 20:30:12', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_upgrade_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_province_upgrade_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_province_upgrade_detail`
--

INSERT INTO `stat_officer_province_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_province_upgrade_id`, `province_id`) VALUES
(1, 66, 55, 44, 33, 22, 11, 99, 88, 77, 7, 6, 5, 4, 3, 2, 1, 112, 12, 223, 23, 334, 34, 445, 45, 1, 1),
(2, 11, 1, 22, 2, 33, 3, 44, 4, 55, 5, 66, 6, 77, 7, 88, 8, 99, 9, 100, 10, 110, 11, 120, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_resign`
--

CREATE TABLE IF NOT EXISTS `stat_officer_resign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_resign_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_resign_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_resign`
--

INSERT INTO `stat_officer_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 07:34:57', 1, 1, 1),
(2, '2017-09-10 07:58:15', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_resign_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_resign_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_officer_resign_detail`
--

INSERT INTO `stat_officer_resign_detail` (`id`, `stat_officer_resign_id`, `retire_total`, `bumnet_total`, `die_total`, `leave_total`, `fire_total`, `resign_total`, `lose_total`, `move_soe_total`, `moveto_ministry_total`, `movein_ministry_total`, `retire_women`, `bumnet_women`, `die_women`, `leave_women`, `fire_women`, `resign_women`, `lose_women`, `move_soe_women`, `moveto_ministry_women`, `movein_ministry_women`) VALUES
(1, 1, 99, 77, 55, 33, 11, 8, 6, 4, 2, 20, 88, 66, 44, 22, 9, 7, 5, 3, 1, 10),
(2, 2, 9, 7, 5, 3, 111, 88, 66, 44, 22, 100, 8, 6, 4, 2, 99, 77, 55, 33, 11, 89);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_salary`
--

CREATE TABLE IF NOT EXISTS `stat_officer_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_salary_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_officer_salary_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `stat_officer_salary`
--

INSERT INTO `stat_officer_salary` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(4, '2017-09-17 06:04:21', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_salary_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_salary_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_salary_detail`
--

INSERT INTO `stat_officer_salary_detail` (`id`, `stat_officer_salary_id`, `level1_total`, `level1_women`, `level2_total`, `level2_women`, `level3_total`, `level3_women`, `level4_total`, `level4_women`, `level5_total`, `level5_women`, `level6_total`, `level6_women`, `level7_total`, `level7_women`, `level8_total`, `level8_women`, `level9_total`, `level9_women`, `level10_total`, `level10_women`, `level11_total`, `level11_women`, `level12_total`, `level12_women`, `level13_total`, `level13_women`, `level14_total`, `level14_women`, `level15_total`, `level15_women`, `officer_level_id`) VALUES
(1, 4, 8, 2, 88, 44, 111, 59, 51, 20, 31, 10, 39, 15, 21, 7, 26, 3, 25, 11, 24, 7, 11, 3, 16, 4, 6, 1, 10, 2, 9, 4, 1),
(2, 4, 26, 13, 139, 77, 128, 51, 65, 33, 59, 28, 37, 12, 30, 5, 35, 7, 30, 7, 14, 3, 13, 1, 9, 2, 12, 2, 7, 0, 10, 1, 2),
(3, 4, 224, 120, 601, 224, 430, 146, 120, 33, 81, 24, 50, 11, 32, 8, 28, 4, 31, 3, 27, 6, 19, 2, 9, 0, 15, 3, 16, 2, 14, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_technical`
--

CREATE TABLE IF NOT EXISTS `stat_officer_technical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_officer_technical_user1_idx` (`user_id`),
  KEY `fk_stat_officer_technical_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_officer_technical`
--

INSERT INTO `stat_officer_technical` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-18 15:44:08', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_technical_detail`
--

CREATE TABLE IF NOT EXISTS `stat_officer_technical_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_officer_technical_detail`
--

INSERT INTO `stat_officer_technical_detail` (`id`, `stat_officer_technical_id`, `officer_level_id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `hischool_total`, `hischool_women`, `second_total`, `second_women`, `primary_total`, `primary_women`) VALUES
(1, 1, 1, 4, 2, NULL, NULL, 94, 27, NULL, NULL, 272, 126, 65, 28, 30, 6, 11, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, 1, NULL, 4, NULL, 32, 6, NULL, NULL, 354, 137, 180, 84, 39, 13, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 3, NULL, NULL, NULL, NULL, 9, 1, 18, 6, 788, 237, 603, 260, 236, 68, 43, 15, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_population_movement`
--

CREATE TABLE IF NOT EXISTS `stat_population_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_population_movement_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_population_movement_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `stat_population_movement`
--

INSERT INTO `stat_population_movement` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(5, '2017-09-07 16:47:52', 1, 1, 1),
(6, '2017-09-07 19:08:17', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_population_movement_detail`
--

CREATE TABLE IF NOT EXISTS `stat_population_movement_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_population_movement_detail`
--

INSERT INTO `stat_population_movement_detail` (`id`, `district`, `village`, `population_total`, `population_women`, `born_total`, `born_women`, `die_total`, `die_women`, `married`, `divorce`, `movein_total`, `movein_women`, `moveout_total`, `moveout_women`, `real_total`, `real_women`, `province_id`, `stat_population_movement_id`) VALUES
(1, 35, 435, 345, 343, 234324, 33, 344, 234, 342, 3, 34342, 234, 4324, 234, 34, 33, 1, 5),
(2, 12, 23, 11, 1, 22, 2, 33, 3, 44, 4, 55, 5, 66, 6, 77, 7, 13, 5),
(3, 35, 3, 35, 2, 55, 5, 22, 3, 33, 1, 33, 4, 43, 4, 44, 6, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_position`
--

CREATE TABLE IF NOT EXISTS `stat_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_position_user1_idx` (`user_id`),
  KEY `fk_stat_position_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_position`
--

INSERT INTO `stat_position` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2017-10-01 16:09:21', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_position_detail`
--

CREATE TABLE IF NOT EXISTS `stat_position_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_position_detail`
--

INSERT INTO `stat_position_detail` (`id`, `position1_total`, `position1_women`, `position2_total`, `position2_women`, `position3_total`, `position3_women`, `position4_total`, `position4_women`, `position5_total`, `position5_women`, `position6_total`, `position6_women`, `position7_total`, `position7_women`, `position8_total`, `position8_women`, `officer_level_id`, `stat_position_id`) VALUES
(1, 9, 5, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(2, 8, 6, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion`
--

CREATE TABLE IF NOT EXISTS `stat_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_religion_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_religion`
--

INSERT INTO `stat_religion` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-24 19:05:44', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_detail`
--

CREATE TABLE IF NOT EXISTS `stat_religion_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `stat_religion_detail`
--

INSERT INTO `stat_religion_detail` (`id`, `buddhis_total`, `buddhis_women`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `other_total`, `other_women`, `remark`, `stat_religion_id`, `province_id`) VALUES
(1, 8, 7, 6, 5, 4, 3, 2, 1, 99, 88, 77, 66, 55, 44, 'kkk', 3, 1),
(2, 99, 9, 88, 8, 77, 7, 66, 6, 55, 5, 44, 4, 33, 3, 'aaaa', 3, 17),
(3, 55, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_place`
--

CREATE TABLE IF NOT EXISTS `stat_religion_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_place_user1_idx` (`user_id`),
  KEY `fk_stat_religion_place_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_religion_place`
--

INSERT INTO `stat_religion_place` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-09 19:21:20', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_place_detail`
--

CREATE TABLE IF NOT EXISTS `stat_religion_place_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_religion_place_detail`
--

INSERT INTO `stat_religion_place_detail` (`id`, `buddhis_total`, `buddhis_nomonk`, `buddhis_nosim`, `buddhis_sim`, `christ_news_total`, `christ_news_not`, `christ_sat_total`, `christ_sat_not`, `christ_cato_total`, `christ_cato_not`, `bahai_total`, `bahai_not`, `idslam_total`, `idslam_not`, `remark`, `stat_religion_place_id`, `province_id`) VALUES
(1, 99, 88, 66, 77, 55, 44, 33, 22, 11, 9, 8, 7, 6, 5, 'kjk', 1, 16),
(2, 77, 70, 4, 3, 33, 22, 11, 9, 8, 7, 6, 5, 4, 3, 'jhafjskdgh', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_teacher`
--

CREATE TABLE IF NOT EXISTS `stat_religion_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_religion_teacher_user1_idx` (`user_id`),
  KEY `fk_stat_religion_teacher_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_religion_teacher`
--

INSERT INTO `stat_religion_teacher` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-09', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_teacher_detail`
--

CREATE TABLE IF NOT EXISTS `stat_religion_teacher_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_religion_teacher_detail`
--

INSERT INTO `stat_religion_teacher_detail` (`id`, `stat_religion_teacher_id`, `buddhis_monk`, `buddhis_novice`, `buddhis_dad`, `buddhis_mom`, `buddhis_boy`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `province_id`, `remark`) VALUES
(1, 1, 11, 22, 33, 44, 55, 9, 8, 8, 7, 7, 6, 6, 5, 5, 4, 1, 'kkkk'),
(2, 1, 9, 8, 7, 6, 5, 11, 1, 22, 2, 33, 3, 44, 4, 55, 5, 17, 'jjj');

-- --------------------------------------------------------

--
-- Table structure for table `stat_research`
--

CREATE TABLE IF NOT EXISTS `stat_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_research_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_research_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_research`
--

INSERT INTO `stat_research` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-14 16:35:16', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_research_detail`
--

CREATE TABLE IF NOT EXISTS `stat_research_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_research_detail`
--

INSERT INTO `stat_research_detail` (`id`, `stat_research_id`, `title`, `total`, `women`, `start_date`, `end_date`, `attendance`, `times`, `place`, `remark`, `goverment`, `dornor`) VALUES
(1, 1, 'aksjgh', 66, 7, '2017-09-15 00:00:00', '2017-09-18 00:00:00', 'aads', 3, '21sag', 'sdg', 1, 2),
(2, 1, 'aksjgh', 31, 9, '2017-10-01 00:00:00', '2017-09-18 00:00:00', 'aads', 3, '21sag', 'sdg', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_resign`
--

CREATE TABLE IF NOT EXISTS `stat_resign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_resign_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_resign_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_resign`
--

INSERT INTO `stat_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-10 15:36:58', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_resign_detail`
--

CREATE TABLE IF NOT EXISTS `stat_resign_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_resign_detail`
--

INSERT INTO `stat_resign_detail` (`id`, `retire_total`, `retire_women`, `bumnet_total`, `bumnet_women`, `stat_resign_id`, `die_total`, `die_women`, `officer_level_id`, `leave_total`, `leave_women`, `fire_total`, `fire_women`, `resign_total`, `resign_women`, `lose_total`, `lose_women`, `army_total`, `army_women`, `ministry_total`, `ministry_women`) VALUES
(1, 99, 88, 77, 66, 1, 55, 44, 1, 33, 22, 11, 1, 22, 2, 33, 3, 44, 4, 55, 5),
(2, 99, 9, 88, 8, 1, 77, 7, 2, 66, 6, 55, 5, 44, 4, 33, 3, 22, 2, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_single_gateway_implementation`
--

CREATE TABLE IF NOT EXISTS `stat_single_gateway_implementation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stat_single_gateway_implementation_user1_idx` (`user_id`),
  KEY `fk_stat_single_gateway_implementation_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_single_gateway_implementation`
--

INSERT INTO `stat_single_gateway_implementation` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES
(1, 1, 1, '2017-09-18 14:01:19', 1),
(2, 1, 2, '2017-09-04 15:37:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_single_gateway_implementation_detail`
--

CREATE TABLE IF NOT EXISTS `stat_single_gateway_implementation_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stat_single_gateway_implementation_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` text,
  `ministry_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_single_gateway_implementation_detail_stat_single_ga_idx` (`stat_single_gateway_implementation_id`),
  KEY `fk_stat_single_gateway_implementation_detail_ministry1_idx` (`ministry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `stat_single_gateway_implementation_detail`
--

INSERT INTO `stat_single_gateway_implementation_detail` (`id`, `stat_single_gateway_implementation_id`, `start_date`, `name`, `remark`, `ministry_id`) VALUES
(1, 1, '2017-09-05 00:00:00', 'dgsagas', 'sss', 1),
(2, 1, '2017-08-28 00:00:00', 'ssdf', 'dfdsf', 2),
(3, 2, '2017-09-21 00:00:00', 'sada', 'adasd', 1),
(4, 1, '2017-09-04 00:00:00', '234', '342', 4),
(5, 1, '2017-09-13 00:00:00', 'jjkjh', 'kjhk', 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_victorycoin_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_victorycoin_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_victorycoin_ministry`
--

INSERT INTO `stat_victorycoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 09:16:41', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_victorycoin_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_victorycoin_ministry_detail`
--

INSERT INTO `stat_victorycoin_ministry_detail` (`id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `stat_victorycoin_ministry_id`, `award_id`, `ministry_id`) VALUES
(1, 1, NULL, 3, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, 46, 7, 418, 51, 604, 396, 1, 1, 1, NULL, 1, NULL, '', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_province`
--

CREATE TABLE IF NOT EXISTS `stat_victorycoin_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victorycoin_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_victorycoin_province_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_victorycoin_province`
--

INSERT INTO `stat_victorycoin_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 10:15:49', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_victorycoin_province_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_victorycoin_province_detail`
--

INSERT INTO `stat_victorycoin_province_detail` (`id`, `stat_victorycoin_province_id`, `province_id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `award_id`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 187, 209, 664, 454, 1576, 679, NULL, NULL, NULL, 1, NULL, 3, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_ministry`
--

CREATE TABLE IF NOT EXISTS `stat_victoryoversea_ministry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_ministry_user1_idx` (`user_id`),
  KEY `fk_stat_victoryoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_victoryoversea_ministry`
--

INSERT INTO `stat_victoryoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2017-09-16 12:41:18', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_ministry_detail`
--

CREATE TABLE IF NOT EXISTS `stat_victoryoversea_ministry_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_victoryoversea_ministry_detail`
--

INSERT INTO `stat_victoryoversea_ministry_detail` (`id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`, `stat_victoryoversea_ministry_id`, `ministry_id`, `award_id`) VALUES
(1, NULL, NULL, 13, 15, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 126, 1, 101, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'dd', 47, 22, 2, 1, 2),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aa', 2, 1, 2, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_province`
--

CREATE TABLE IF NOT EXISTS `stat_victoryoversea_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stat_victoryoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  KEY `fk_stat_victoryoversea_province_user1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stat_victoryoversea_province`
--

INSERT INTO `stat_victoryoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 14:56:23', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_province_detail`
--

CREATE TABLE IF NOT EXISTS `stat_victoryoversea_province_detail` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stat_victoryoversea_province_detail`
--

INSERT INTO `stat_victoryoversea_province_detail` (`id`, `stat_victoryoversea_province_id`, `province_id`, `award_id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`) VALUES
(1, 1, 1, 2, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 553, 2, 1, NULL, 5, 9, 9, NULL, 7, 6, 5, 'lk', 7, 8),
(2, 1, 9, 5, 8, 6, 6, NULL, 0, 7, 5, 3, 2, 5, 8, 9, 5, NULL, 2, 45, 7, 9, 8, 4, 3, 6, 9, 9, '3', 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `use_subcordinate`
--

CREATE TABLE IF NOT EXISTS `use_subcordinate` (
  `user_id` int(11) NOT NULL,
  `subcordinate_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subcordinate_user_id`),
  KEY `fk_user_has_user_user2_idx` (`subcordinate_user_id`),
  KEY `fk_user_has_user_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`, `role_id`, `user_id`, `input_dt_stamp`) VALUES
(1, 'admin', 'admin', 'Administrator', '', 'A', '', NULL, 0, 1, NULL, '2017-10-14 16:32:15'),
(2, 'dpc', '123', 'DPC', 'MoHA', 'A', '1', '', 0, 2, 1, '2017-10-25 23:56:01'),
(3, 'csm', '123', 'Civil Servant Management', 'CSM', 'A', '123', '', 0, 3, 2, '2017-10-26 23:35:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_branch`
--

CREATE TABLE IF NOT EXISTS `user_has_branch` (
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`branch_id`),
  KEY `fk_user_has_branch_branch1_idx` (`branch_id`),
  KEY `fk_user_has_branch_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_branch`
--

INSERT INTO `user_has_branch` (`user_id`, `branch_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(3, 13);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_province`
--

CREATE TABLE IF NOT EXISTS `user_has_province` (
  `user_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`province_id`),
  KEY `fk_user_has_province_idx` (`province_id`),
  KEY `fk_user_has_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_province`
--

INSERT INTO `user_has_province` (`user_id`, `province_id`) VALUES
(2, 1),
(3, 1),
(2, 2),
(3, 2),
(2, 3),
(3, 3),
(2, 4),
(3, 4),
(2, 5),
(3, 5),
(2, 6),
(3, 6),
(2, 7),
(3, 7),
(2, 8),
(3, 8),
(2, 9),
(3, 9),
(2, 10),
(3, 10),
(2, 11),
(3, 11),
(2, 12),
(3, 12),
(2, 13),
(3, 13),
(2, 14),
(3, 14),
(2, 15),
(3, 15),
(2, 16),
(3, 16),
(2, 17),
(3, 17),
(2, 18),
(3, 18);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_role`
--

CREATE TABLE IF NOT EXISTS `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `set_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_subordinate`
--

CREATE TABLE IF NOT EXISTS `user_subordinate` (
  `user_id` int(11) NOT NULL,
  `subordinate_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`subordinate_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_subordinate`
--

INSERT INTO `user_subordinate` (`user_id`, `subordinate_user_id`) VALUES
(2, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accociation`
--
ALTER TABLE `accociation`
  ADD CONSTRAINT `fk_accociation_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `approver`
--
ALTER TABLE `approver`
  ADD CONSTRAINT `fk_approver_approver_level1` FOREIGN KEY (`approver_level_id`) REFERENCES `approver_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_approver_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_approver_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `fk_attachment_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attachment_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_attachment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `award`
--
ALTER TABLE `award`
  ADD CONSTRAINT `fk_award_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_book_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `fk_branch_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_branch_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_district_user` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `foundation`
--
ALTER TABLE `foundation`
  ADD CONSTRAINT `fk_foundation_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `goverment_unit`
--
ALTER TABLE `goverment_unit`
  ADD CONSTRAINT `fk_goverment_unit_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `legal`
--
ALTER TABLE `legal`
  ADD CONSTRAINT `fk_legal_legal_type1` FOREIGN KEY (`legal_type_id`) REFERENCES `legal_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_menugroup1` FOREIGN KEY (`menugroup_id`) REFERENCES `menugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `menugroup`
--
ALTER TABLE `menugroup`
  ADD CONSTRAINT `fk_menugroup_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_source_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ministry`
--
ALTER TABLE `ministry`
  ADD CONSTRAINT `fk_ministry_ministry_group1` FOREIGN KEY (`ministry_group_id`) REFERENCES `ministry_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `officer_level`
--
ALTER TABLE `officer_level`
  ADD CONSTRAINT `fk_officer_level_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `fk_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_has_action`
--
ALTER TABLE `role_has_action`
  ADD CONSTRAINT `fk_role_has_action_action1` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_role_has_action_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_has_menu`
--
ALTER TABLE `role_has_menu`
  ADD CONSTRAINT `fk_role_has_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_role_has_menu_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_association_foundation`
--
ALTER TABLE `stat_association_foundation`
  ADD CONSTRAINT `fk_stat_association_foundation_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_association_foundation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_association_foundation_detail`
--
ALTER TABLE `stat_association_foundation_detail`
  ADD CONSTRAINT `fk_stat_association_foundation_detail_approver1` FOREIGN KEY (`approver_id`) REFERENCES `approver` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_association_foundation_detail_stat_association_founda1` FOREIGN KEY (`stat_association_foundation_id`) REFERENCES `stat_association_foundation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_contract`
--
ALTER TABLE `stat_contract`
  ADD CONSTRAINT `fk_stat_contract_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_contract_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_contract_detail`
--
ALTER TABLE `stat_contract_detail`
  ADD CONSTRAINT `fk_stat_contract_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_contract_detail_stat_contract1` FOREIGN KEY (`stat_contract_id`) REFERENCES `stat_contract` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_copy`
--
ALTER TABLE `stat_copy`
  ADD CONSTRAINT `fk_stat_copy_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_copy_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_copy_detail`
--
ALTER TABLE `stat_copy_detail`
  ADD CONSTRAINT `fk_stat_copy_detail_stat_copy1` FOREIGN KEY (`stat_copy_id`) REFERENCES `stat_copy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_course`
--
ALTER TABLE `stat_course`
  ADD CONSTRAINT `fk_stat_course_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_course_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_course_detail`
--
ALTER TABLE `stat_course_detail`
  ADD CONSTRAINT `fk_stat_course_detail_stat_course1` FOREIGN KEY (`stat_course_id`) REFERENCES `stat_course` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_document`
--
ALTER TABLE `stat_document`
  ADD CONSTRAINT `fk_stat_document_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_document_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_document_detail`
--
ALTER TABLE `stat_document_detail`
  ADD CONSTRAINT `fk_stat_document_detail_book1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_document_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_document_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_document_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_document_detail_stat_document1` FOREIGN KEY (`stat_document_id`) REFERENCES `stat_document` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_ethnic`
--
ALTER TABLE `stat_ethnic`
  ADD CONSTRAINT `fk_stat_ethnic_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_ethnic_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_ethnic_detail`
--
ALTER TABLE `stat_ethnic_detail`
  ADD CONSTRAINT `fk_stat_ethnic_detail_ethnic1` FOREIGN KEY (`ethnic_id`) REFERENCES `ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_ethnic_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_ethnic_detail_stat_ethnic1` FOREIGN KEY (`stat_ethnic_id`) REFERENCES `stat_ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_explore`
--
ALTER TABLE `stat_explore`
  ADD CONSTRAINT `fk_stat_explore_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_explore_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_explore_detail`
--
ALTER TABLE `stat_explore_detail`
  ADD CONSTRAINT `fk_stat_explore_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_explore_detail_stat_explore1` FOREIGN KEY (`stat_explore_id`) REFERENCES `stat_explore` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govcoin_ministry`
--
ALTER TABLE `stat_govcoin_ministry`
  ADD CONSTRAINT `fk_stat_govcoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govcoin_ministry_detail`
--
ALTER TABLE `stat_govcoin_ministry_detail`
  ADD CONSTRAINT `fk_stat_govcoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_ministry_detail_stat_govcoin_ministry1` FOREIGN KEY (`stat_govcoin_ministry_id`) REFERENCES `stat_govcoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govcoin_province`
--
ALTER TABLE `stat_govcoin_province`
  ADD CONSTRAINT `fk_stat_govcoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govcoin_province_detail`
--
ALTER TABLE `stat_govcoin_province_detail`
  ADD CONSTRAINT `fk_stat_govcoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govcoin_province_detail_stat_govcoin_province1` FOREIGN KEY (`stat_govcoin_province_id`) REFERENCES `stat_govcoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_goverment_unit`
--
ALTER TABLE `stat_goverment_unit`
  ADD CONSTRAINT `fk_stat_goverment_unit_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_statistic1_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_goverment_unit_detail`
--
ALTER TABLE `stat_goverment_unit_detail`
  ADD CONSTRAINT `fk_stat_goverment_unit_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_goverment_unit_detail_stat_goverment_unit1` FOREIGN KEY (`stat_goverment_unit_id`) REFERENCES `stat_goverment_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govoversea_ministry`
--
ALTER TABLE `stat_govoversea_ministry`
  ADD CONSTRAINT `fk_stat_govoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govoversea_ministry_detail`
--
ALTER TABLE `stat_govoversea_ministry_detail`
  ADD CONSTRAINT `fk_stat_govoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_ministry_detail_stat_govoversea_ministry1` FOREIGN KEY (`stat_govoversea_ministry_id`) REFERENCES `stat_govoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govoversea_province`
--
ALTER TABLE `stat_govoversea_province`
  ADD CONSTRAINT `fk_stat_govoversea_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_govoversea_province_detail`
--
ALTER TABLE `stat_govoversea_province_detail`
  ADD CONSTRAINT `fk_stat_govoversea_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_govoversea_province_detail_stat_govoversea_province1` FOREIGN KEY (`stat_govoversea_province_id`) REFERENCES `stat_govoversea_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_highcoin_ministry`
--
ALTER TABLE `stat_highcoin_ministry`
  ADD CONSTRAINT `fk_stat_highcoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_highcoin_ministry_detail`
--
ALTER TABLE `stat_highcoin_ministry_detail`
  ADD CONSTRAINT `fk_stat_highcoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_ministry_detail_stat_highcoin_ministry1` FOREIGN KEY (`stat_highcoin_ministry_id`) REFERENCES `stat_highcoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_highoversea_ministry`
--
ALTER TABLE `stat_highoversea_ministry`
  ADD CONSTRAINT `fk_stat_highoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_highoversea_ministry_detail`
--
ALTER TABLE `stat_highoversea_ministry_detail`
  ADD CONSTRAINT `fk_stat_highoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highoversea_ministry_detail_stat_highoversea_ministry1` FOREIGN KEY (`stat_highoversea_ministry_id`) REFERENCES `stat_highoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_hornorcoin_province`
--
ALTER TABLE `stat_hornorcoin_province`
  ADD CONSTRAINT `fk_stat_hornorcoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_hornorcoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_hornorcoin_province_detail`
--
ALTER TABLE `stat_hornorcoin_province_detail`
  ADD CONSTRAINT `fk_stat_hornorcoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_hornorcoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_hornorcoin_province_detail_stat_hornorcoin_province1` FOREIGN KEY (`stat_hornorcoin_province_id`) REFERENCES `stat_hornorcoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_institute_meeting`
--
ALTER TABLE `stat_institute_meeting`
  ADD CONSTRAINT `fk_stat_institute_meeting_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_institute_meeting_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_institute_meeting_detail`
--
ALTER TABLE `stat_institute_meeting_detail`
  ADD CONSTRAINT `fk_stat_institute_meeting_detail_stat_institute_meeting1` FOREIGN KEY (`stat_institute_meeting_id`) REFERENCES `stat_institute_meeting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_institute_train`
--
ALTER TABLE `stat_institute_train`
  ADD CONSTRAINT `fk_stat_institute_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_institute_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_institute_train_detail`
--
ALTER TABLE `stat_institute_train_detail`
  ADD CONSTRAINT `fk_stat_institute_train_detail_stat_institute_train1` FOREIGN KEY (`stat_institute_train_id`) REFERENCES `stat_institute_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_legal`
--
ALTER TABLE `stat_legal`
  ADD CONSTRAINT `fk_stat_legal_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_legal_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_legal_detail`
--
ALTER TABLE `stat_legal_detail`
  ADD CONSTRAINT `fk_stat_legal_detail_legal1` FOREIGN KEY (`legal_id`) REFERENCES `legal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_legal_detail_stat_legal1` FOREIGN KEY (`stat_legal_id`) REFERENCES `stat_legal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_local_admin`
--
ALTER TABLE `stat_local_admin`
  ADD CONSTRAINT `fk_stat_local_admin_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_local_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_local_admin_detail`
--
ALTER TABLE `stat_local_admin_detail`
  ADD CONSTRAINT `fk_stat_local_admin_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_local_admin_detail_stat_local_admin1` FOREIGN KEY (`stat_local_admin_id`) REFERENCES `stat_local_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_map_produce`
--
ALTER TABLE `stat_map_produce`
  ADD CONSTRAINT `fk_stat_map_produce_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_map_produce_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_map_produce_detail`
--
ALTER TABLE `stat_map_produce_detail`
  ADD CONSTRAINT `fk_stat_map_produce_detail_stat_map_produce1` FOREIGN KEY (`stat_map_produce_id`) REFERENCES `stat_map_produce` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_map_service`
--
ALTER TABLE `stat_map_service`
  ADD CONSTRAINT `fk_stat_map_service_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_map_service_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_map_service_detail`
--
ALTER TABLE `stat_map_service_detail`
  ADD CONSTRAINT `fk_stat_map_service_detail_stat_map_service1` FOREIGN KEY (`stat_map_service_id`) REFERENCES `stat_map_service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_oda`
--
ALTER TABLE `stat_oda`
  ADD CONSTRAINT `fk_stat_oda_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_oda_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_oda_detail`
--
ALTER TABLE `stat_oda_detail`
  ADD CONSTRAINT `fk_stat_oda_detail_stat_oda1` FOREIGN KEY (`stat_oda_id`) REFERENCES `stat_oda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer`
--
ALTER TABLE `stat_officer`
  ADD CONSTRAINT `fk_stat_officer_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_add`
--
ALTER TABLE `stat_officer_add`
  ADD CONSTRAINT `fk_stat_officer_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_add_detail`
--
ALTER TABLE `stat_officer_add_detail`
  ADD CONSTRAINT `fk_stat_officer_add_detail_stat_officer_add1` FOREIGN KEY (`stat_officer_add_id`) REFERENCES `stat_officer_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_age`
--
ALTER TABLE `stat_officer_age`
  ADD CONSTRAINT `fk_stat_officer_age_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_age_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_age_detail`
--
ALTER TABLE `stat_officer_age_detail`
  ADD CONSTRAINT `fk_table1_stat_officer_age1` FOREIGN KEY (`stat_officer_age_id`) REFERENCES `stat_officer_age` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_agelevel`
--
ALTER TABLE `stat_officer_agelevel`
  ADD CONSTRAINT `fk_stat_officer_agelevel_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_agelevel_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_agelevel_detail`
--
ALTER TABLE `stat_officer_agelevel_detail`
  ADD CONSTRAINT `fk_stat_officer_agelevel_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_agelevel_detail_stat_officer_agelevel1` FOREIGN KEY (`stat_officer_agelevel_id`) REFERENCES `stat_officer_agelevel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_contract`
--
ALTER TABLE `stat_officer_contract`
  ADD CONSTRAINT `fk_stat_officer_contract_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_contract_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_contract_detail`
--
ALTER TABLE `stat_officer_contract_detail`
  ADD CONSTRAINT `fk_stat_officer_contract_detail_stat_officer_contract1` FOREIGN KEY (`stat_officer_contract_id`) REFERENCES `stat_officer_contract` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_degree`
--
ALTER TABLE `stat_officer_degree`
  ADD CONSTRAINT `fk_stat_offcer_degree_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_offcer_degree_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_degree_detail`
--
ALTER TABLE `stat_officer_degree_detail`
  ADD CONSTRAINT `fk_stat_officer_degree_detail_stat_officer_degree1` FOREIGN KEY (`stat_officer_degree_id`) REFERENCES `stat_officer_degree` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_detail`
--
ALTER TABLE `stat_officer_detail`
  ADD CONSTRAINT `fk_stat_officer_detail_stat_officer1` FOREIGN KEY (`stat_officer_id`) REFERENCES `stat_officer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ethnic`
--
ALTER TABLE `stat_officer_ethnic`
  ADD CONSTRAINT `fk_stat_officer_ethnic_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ethnic_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ethnic_detail`
--
ALTER TABLE `stat_officer_ethnic_detail`
  ADD CONSTRAINT `fk_stat_officer_ethnic_detail_ethnic1` FOREIGN KEY (`ethnic_id`) REFERENCES `ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ethnic_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ethnic_detail_stat_officer_ethnic1` FOREIGN KEY (`stat_officer_ethnic_id`) REFERENCES `stat_officer_ethnic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry`
--
ALTER TABLE `stat_officer_ministry`
  ADD CONSTRAINT `fk_stat_officer_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_add`
--
ALTER TABLE `stat_officer_ministry_add`
  ADD CONSTRAINT `fk_stat_officer_ministry_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_add_detail`
--
ALTER TABLE `stat_officer_ministry_add_detail`
  ADD CONSTRAINT `fk_stat_officer_ministry_add_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_add_detail_stat_officer_ministry_add1` FOREIGN KEY (`stat_officer_ministry_add_id`) REFERENCES `stat_officer_ministry_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_detail`
--
ALTER TABLE `stat_officer_ministry_detail`
  ADD CONSTRAINT `fk_stat_officer_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_detail_stat_officer_ministry1` FOREIGN KEY (`stat_officer_ministry_id`) REFERENCES `stat_officer_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_train`
--
ALTER TABLE `stat_officer_ministry_train`
  ADD CONSTRAINT `fk_stat_officer_ministry_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_train_detail`
--
ALTER TABLE `stat_officer_ministry_train_detail`
  ADD CONSTRAINT `fk_stat_officer_ministry_train_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_train_detail_stat_officer_ministry_t1` FOREIGN KEY (`stat_officer_ministry_train_id`) REFERENCES `stat_officer_ministry_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_upgrade`
--
ALTER TABLE `stat_officer_ministry_upgrade`
  ADD CONSTRAINT `fk_stat_officer_ministry_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_ministry_upgrade_detail`
--
ALTER TABLE `stat_officer_ministry_upgrade_detail`
  ADD CONSTRAINT `fk_stat_officer_ministry_upgrade_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_ministry_upgrade_detail_stat_officer_ministry1` FOREIGN KEY (`stat_officer_ministry_upgrade_id`) REFERENCES `stat_officer_ministry_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_need`
--
ALTER TABLE `stat_officer_need`
  ADD CONSTRAINT `fk_stat_officer_need_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_need_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_need_detail`
--
ALTER TABLE `stat_officer_need_detail`
  ADD CONSTRAINT `fk_stat_officer_need_detail_stat_officer_need1` FOREIGN KEY (`stat_officer_need_id`) REFERENCES `stat_officer_need` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_new`
--
ALTER TABLE `stat_officer_new`
  ADD CONSTRAINT `fk_stat_officer_new_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_new_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_new_detail`
--
ALTER TABLE `stat_officer_new_detail`
  ADD CONSTRAINT `fk_stat_officer_new_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_new_detail_stat_officer_new1` FOREIGN KEY (`stat_officer_new_id`) REFERENCES `stat_officer_new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_org`
--
ALTER TABLE `stat_officer_org`
  ADD CONSTRAINT `fk_stat_officer_org_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_org_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_org_detail`
--
ALTER TABLE `stat_officer_org_detail`
  ADD CONSTRAINT `fk_stat_officer_org_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_org_detail_stat_officer_org1` FOREIGN KEY (`stat_officer_org_id`) REFERENCES `stat_officer_org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_add`
--
ALTER TABLE `stat_officer_organisation_add`
  ADD CONSTRAINT `fk_stat_officer_organisation_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_add_detail`
--
ALTER TABLE `stat_officer_organisation_add_detail`
  ADD CONSTRAINT `fk_stat_officer_organisation_add_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_add_detail_stat_officer_organisa1` FOREIGN KEY (`stat_officer_organisation_add_id`) REFERENCES `stat_officer_organisation_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_train`
--
ALTER TABLE `stat_officer_organisation_train`
  ADD CONSTRAINT `fk_stat_officer_organisation_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_train_detail`
--
ALTER TABLE `stat_officer_organisation_train_detail`
  ADD CONSTRAINT `fk_stat_officer_organisation_train_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_train_detail_stat_officer_organi1` FOREIGN KEY (`stat_officer_organisation_train_id`) REFERENCES `stat_officer_organisation_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_upgrade`
--
ALTER TABLE `stat_officer_organisation_upgrade`
  ADD CONSTRAINT `fk_stat_officer_organisation_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_organisation_upgrade_detail`
--
ALTER TABLE `stat_officer_organisation_upgrade_detail`
  ADD CONSTRAINT `fk_stat_officer_organisation_upgrade_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_organisation_upgrade_detail_stat_officer_orga1` FOREIGN KEY (`stat_officer_organisation_upgrade_id`) REFERENCES `stat_officer_organisation_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_position`
--
ALTER TABLE `stat_officer_position`
  ADD CONSTRAINT `fk_stat_officer_position_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_position_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_position_detail`
--
ALTER TABLE `stat_officer_position_detail`
  ADD CONSTRAINT `fk_stat_officer_position_detail_stat_officer_position1` FOREIGN KEY (`stat_officer_position_id`) REFERENCES `stat_officer_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province`
--
ALTER TABLE `stat_officer_province`
  ADD CONSTRAINT `fk_stat_officer_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_add`
--
ALTER TABLE `stat_officer_province_add`
  ADD CONSTRAINT `fk_stat_officer_province_add_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_add_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_add_detail`
--
ALTER TABLE `stat_officer_province_add_detail`
  ADD CONSTRAINT `fk_stat_officer_province_add_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_add_detail_stat_officer_province_add1` FOREIGN KEY (`stat_officer_province_add_id`) REFERENCES `stat_officer_province_add` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_detail`
--
ALTER TABLE `stat_officer_province_detail`
  ADD CONSTRAINT `fk_stat_officer_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_detail_stat_officer_province1` FOREIGN KEY (`stat_officer_province_id`) REFERENCES `stat_officer_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_train`
--
ALTER TABLE `stat_officer_province_train`
  ADD CONSTRAINT `fk_stat_officer_province_train_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_train_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_train_detail`
--
ALTER TABLE `stat_officer_province_train_detail`
  ADD CONSTRAINT `fk_stat_officer_province_train_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_train_detail_stat_officer_province_t1` FOREIGN KEY (`stat_officer_province_train_id`) REFERENCES `stat_officer_province_train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_upgrade`
--
ALTER TABLE `stat_officer_province_upgrade`
  ADD CONSTRAINT `fk_stat_officer_province_upgrade_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_upgrade_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_province_upgrade_detail`
--
ALTER TABLE `stat_officer_province_upgrade_detail`
  ADD CONSTRAINT `fk_stat_officer_province_upgrade_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_province_upgrade_detail_stat_officer_province1` FOREIGN KEY (`stat_officer_province_upgrade_id`) REFERENCES `stat_officer_province_upgrade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_resign`
--
ALTER TABLE `stat_officer_resign`
  ADD CONSTRAINT `fk_stat_officer_resign_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_resign_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_resign_detail`
--
ALTER TABLE `stat_officer_resign_detail`
  ADD CONSTRAINT `fk_stat_officer_resign_detail_stat_officer_resign1` FOREIGN KEY (`stat_officer_resign_id`) REFERENCES `stat_officer_resign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_salary`
--
ALTER TABLE `stat_officer_salary`
  ADD CONSTRAINT `fk_stat_officer_salary_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_salary_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_salary_detail`
--
ALTER TABLE `stat_officer_salary_detail`
  ADD CONSTRAINT `fk_stat_officer_salary_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_salary_detail_stat_officer_salary1` FOREIGN KEY (`stat_officer_salary_id`) REFERENCES `stat_officer_salary` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_technical`
--
ALTER TABLE `stat_officer_technical`
  ADD CONSTRAINT `fk_stat_officer_technical_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_technical_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_technical_detail`
--
ALTER TABLE `stat_officer_technical_detail`
  ADD CONSTRAINT `fk_stat_officer_technical_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_technical_detail_stat_officer_technical1` FOREIGN KEY (`stat_officer_technical_id`) REFERENCES `stat_officer_technical` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_population_movement`
--
ALTER TABLE `stat_population_movement`
  ADD CONSTRAINT `fk_stat_population_movement_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_population_movement_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_population_movement_detail`
--
ALTER TABLE `stat_population_movement_detail`
  ADD CONSTRAINT `fk_stat_population_movement_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_population_movement_detail_stat_population_movement1` FOREIGN KEY (`stat_population_movement_id`) REFERENCES `stat_population_movement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_position`
--
ALTER TABLE `stat_position`
  ADD CONSTRAINT `fk_stat_position_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_position_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_position_detail`
--
ALTER TABLE `stat_position_detail`
  ADD CONSTRAINT `fk_stat_position_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_position_detail_stat_position1` FOREIGN KEY (`stat_position_id`) REFERENCES `stat_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion`
--
ALTER TABLE `stat_religion`
  ADD CONSTRAINT `fk_stat_religion_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion_detail`
--
ALTER TABLE `stat_religion_detail`
  ADD CONSTRAINT `fk_stat_religion_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_detail_stat_religion1` FOREIGN KEY (`stat_religion_id`) REFERENCES `stat_religion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion_place`
--
ALTER TABLE `stat_religion_place`
  ADD CONSTRAINT `fk_stat_religion_place_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_place_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion_place_detail`
--
ALTER TABLE `stat_religion_place_detail`
  ADD CONSTRAINT `fk_stat_religion_place_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_place_stat_religion_place1` FOREIGN KEY (`stat_religion_place_id`) REFERENCES `stat_religion_place` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion_teacher`
--
ALTER TABLE `stat_religion_teacher`
  ADD CONSTRAINT `fk_stat_religion_teacher_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_teacher_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_religion_teacher_detail`
--
ALTER TABLE `stat_religion_teacher_detail`
  ADD CONSTRAINT `fk_stat_religion_teacher_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_religion_teacher_detail_stat_religion_teacher1` FOREIGN KEY (`stat_religion_teacher_id`) REFERENCES `stat_religion_teacher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_research`
--
ALTER TABLE `stat_research`
  ADD CONSTRAINT `fk_stat_research_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_research_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_research_detail`
--
ALTER TABLE `stat_research_detail`
  ADD CONSTRAINT `fk_stat_research_detail_stat_research1` FOREIGN KEY (`stat_research_id`) REFERENCES `stat_research` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_resign`
--
ALTER TABLE `stat_resign`
  ADD CONSTRAINT `fk_stat_resign_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_resign_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_resign_detail`
--
ALTER TABLE `stat_resign_detail`
  ADD CONSTRAINT `fk_stat_resign_detail_officer_level1` FOREIGN KEY (`officer_level_id`) REFERENCES `officer_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_resign_detail_stat_resign1` FOREIGN KEY (`stat_resign_id`) REFERENCES `stat_resign` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_single_gateway_implementation`
--
ALTER TABLE `stat_single_gateway_implementation`
  ADD CONSTRAINT `fk_stat_single_gateway_implementation_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_single_gateway_implementation_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_single_gateway_implementation_detail`
--
ALTER TABLE `stat_single_gateway_implementation_detail`
  ADD CONSTRAINT `fk_stat_single_gateway_implementation_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_single_gateway_implementation_detail_stat_single_gate1` FOREIGN KEY (`stat_single_gateway_implementation_id`) REFERENCES `stat_single_gateway_implementation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victorycoin_ministry`
--
ALTER TABLE `stat_victorycoin_ministry`
  ADD CONSTRAINT `fk_stat_victorycoin_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victorycoin_ministry_detail`
--
ALTER TABLE `stat_victorycoin_ministry_detail`
  ADD CONSTRAINT `fk_stat_victorycoin_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_ministry_detail_stat_victorycoin_ministry1` FOREIGN KEY (`stat_victorycoin_ministry_id`) REFERENCES `stat_victorycoin_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victorycoin_province`
--
ALTER TABLE `stat_victorycoin_province`
  ADD CONSTRAINT `fk_stat_victorycoin_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victorycoin_province_detail`
--
ALTER TABLE `stat_victorycoin_province_detail`
  ADD CONSTRAINT `fk_stat_victorycoin_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victorycoin_province_detail_stat_victorycoin_province1` FOREIGN KEY (`stat_victorycoin_province_id`) REFERENCES `stat_victorycoin_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victoryoversea_ministry`
--
ALTER TABLE `stat_victoryoversea_ministry`
  ADD CONSTRAINT `fk_stat_victoryoversea_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victoryoversea_ministry_detail`
--
ALTER TABLE `stat_victoryoversea_ministry_detail`
  ADD CONSTRAINT `fk_stat_victoryoversea_ministry_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_ministry_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_ministry_detail_stat_victoryoversea_mi1` FOREIGN KEY (`stat_victoryoversea_ministry_id`) REFERENCES `stat_victoryoversea_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victoryoversea_province`
--
ALTER TABLE `stat_victoryoversea_province`
  ADD CONSTRAINT `fk_stat_victoryoversea_province_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_province_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_victoryoversea_province_detail`
--
ALTER TABLE `stat_victoryoversea_province_detail`
  ADD CONSTRAINT `fk_stat_victoryoversea_province_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_province_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_victoryoversea_province_detail_stat_victoryoversea_pr1` FOREIGN KEY (`stat_victoryoversea_province_id`) REFERENCES `stat_victoryoversea_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `use_subcordinate`
--
ALTER TABLE `use_subcordinate`
  ADD CONSTRAINT `fk_user_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_user_user2` FOREIGN KEY (`subcordinate_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_branch`
--
ALTER TABLE `user_has_branch`
  ADD CONSTRAINT `fk_user_has_branch_branch1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_province`
--
ALTER TABLE `user_has_province`
  ADD CONSTRAINT `fk_user_has_province_idx` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_has_role`
--
ALTER TABLE `user_has_role`
  ADD CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

set foreign_key_checks=1;