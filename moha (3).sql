-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2020 at 03:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moha`
--

-- --------------------------------------------------------

--
-- Table structure for table `accociation`
--

CREATE TABLE `accociation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `controller_id` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`id`, `class_name`, `method`, `deleted`, `controller_id`, `description`, `parent_id`, `position`) VALUES
(1, 'user', 'managerole', 0, 0, 'ການໃຫ້ສິດ', 0, 3),
(2, 'user', 'manageuser', 0, 0, 'ຜູ້ໃຊ້ລະບົບ', 0, 2),
(3, '#', '#', 0, 0, 'ປ້ອນຂໍ້ມູນ', 0, 4),
(4, '#', '#', 0, 0, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', 3, 1),
(5, 'ministry', 'index', 0, 0, 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ\n', 4, 1),
(12, 'stat-goverment-unit', 'index', 0, 0, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)', 4, 2),
(19, '#', '#', 0, 0, 'ຕັ້ງຄ່າ', 0, 1),
(20, 'message', 'index', 0, 0, 'ແປພາສາ', 19, 2),
(21, 'phiscal-year', 'index', 0, 0, 'ປີ', 19, 1),
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
(71, 'stat-copy', 'index', 0, 0, ' ສະຖິຕິການສັງລວມ ການສຳເນົາ', 28, 2),
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
(86, '#', 'index', 0, 0, ' ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 30, 4),
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
(98, 'stat-oda', 'index', 0, 0, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 33, 1),
(99, 'user', 'addrole', 0, 0, 'ເພີ່ມ/Add ບົດບາດ', 1, 1),
(100, 'user', 'updaterole', 0, 0, 'ແກ້ໄຂ/Edit ບົດບາດ', 1, 2),
(101, 'user', 'deleterole', 0, 0, 'ລຶບ/Delete ບົດບາດ', 1, 3),
(102, 'user', 'savemenuandaction', 0, 0, 'ບັນທຶກລາຍການເມນູ(ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຫັນ ຫລື ບໍ່ເຫັນລາຍການເມນູ)', 1, 4),
(103, 'user', 'savemenuandaction', 0, 0, 'ບັນທຶກລາຍການຟັງຊັ່ນ(Action ເພື່ອ ກໍານົດໃຫ້ຜູ້ໃຊ້ສາມາດເຮັດຫຍັງໄດ້ແດ່)', 1, 5),
(104, 'user', 'listmenu', 0, 0, 'ສະແດງລາຍການເມນູ(Menu)', 1, 6),
(105, 'user', 'listaction', 0, 0, 'ສະແດງລາຍການຟັງຊັ່ນ(Action)', 1, 7),
(106, 'ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 5, 1),
(107, 'ministry', 'delete', 0, 0, 'ລຶບ/Delete', 5, 2),
(108, 'ministry', 'print', 0, 0, 'ພິມ/Print', 5, 3),
(109, 'ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 5, 4),
(110, 'ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 5, 5),
(111, 'ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 5, 6),
(112, 'ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 5, 7),
(113, 'ministry', 'inquiry', 0, 0, 'Inquiry', 5, 8),
(114, 'ministry', 'enquiry', 0, 0, 'Enquiry', 5, 9),
(115, 'ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 5, 10),
(116, 'stat-goverment-unit', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 12, 1),
(117, 'stat-goverment-unit', 'delete', 0, 0, 'ລຶບ/Delete', 12, 2),
(118, 'stat-goverment-unit', 'print', 0, 0, 'ພິມ/Print', 12, 3),
(119, 'stat-goverment-unit', 'download', 0, 0, 'ສົ່ງອອກ/Export', 12, 4),
(120, 'stat-goverment-unit', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 12, 5),
(121, 'stat-goverment-unit', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 12, 6),
(122, 'stat-goverment-unit', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 12, 7),
(123, 'stat-goverment-unit', 'inquiry', 0, 0, 'Inquiry', 12, 8),
(124, 'stat-goverment-unit', 'enquiry', 0, 0, 'Enquiry', 12, 9),
(125, 'stat-goverment-unit', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 12, 10),
(126, 'stat-single-gateway-implementation', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 36, 1),
(127, 'stat-single-gateway-implementation', 'delete', 0, 0, 'ລຶບ/Delete', 36, 2),
(128, 'stat-single-gateway-implementation', 'print', 0, 0, 'ພິມ/Print', 36, 3),
(129, 'stat-single-gateway-implementation', 'download', 0, 0, 'ສົ່ງອອກ/Export', 36, 4),
(130, 'stat-single-gateway-implementation', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 36, 5),
(131, 'stat-single-gateway-implementation', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 36, 6),
(132, 'stat-single-gateway-implementation', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 36, 7),
(133, 'stat-single-gateway-implementation', 'inquiry', 0, 0, 'Inquiry', 36, 8),
(134, 'stat-single-gateway-implementation', 'enquiry', 0, 0, 'Enquiry', 36, 9),
(135, 'stat-single-gateway-implementation', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 36, 10),
(136, 'stat-legal', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 37, 1),
(137, 'stat-legal', 'delete', 0, 0, 'ລຶບ/Delete', 37, 2),
(138, 'stat-legal', 'print', 0, 0, 'ພິມ/Print', 37, 3),
(139, 'stat-legal', 'download', 0, 0, 'ສົ່ງອອກ/Export', 37, 4),
(140, 'stat-legal', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 37, 5),
(141, 'stat-legal', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 37, 6),
(142, 'stat-legal', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 37, 7),
(143, 'stat-legal', 'inquiry', 0, 0, 'Inquiry', 37, 8),
(144, 'stat-legal', 'enquiry', 0, 0, 'Enquiry', 37, 9),
(145, 'stat-legal', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 37, 10),
(146, 'stat-association-foundation', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 38, 1),
(147, 'stat-association-foundation', 'delete', 0, 0, 'ລຶບ/Delete', 38, 2),
(148, 'stat-association-foundation', 'print', 0, 0, 'ພິມ/Print', 38, 3),
(149, 'stat-association-foundation', 'download', 0, 0, 'ສົ່ງອອກ/Export', 38, 4),
(150, 'stat-association-foundation', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 38, 5),
(151, 'stat-association-foundation', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 38, 6),
(152, 'stat-association-foundation', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 38, 7),
(153, 'stat-association-foundation', 'inquiry', 0, 0, 'Inquiry', 38, 8),
(154, 'stat-association-foundation', 'enquiry', 0, 0, 'Enquiry', 38, 9),
(155, 'stat-association-foundation', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 38, 10),
(156, 'stat-local-admin', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 39, 1),
(157, 'stat-local-admin', 'delete', 0, 0, 'ລຶບ/Delete', 39, 2),
(158, 'stat-local-admin', 'print', 0, 0, 'ພິມ/Print', 39, 3),
(159, 'stat-local-admin', 'download', 0, 0, 'ສົ່ງອອກ/Export', 39, 4),
(160, 'stat-local-admin', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 39, 5),
(161, 'stat-local-admin', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 39, 6),
(162, 'stat-local-admin', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 39, 7),
(163, 'stat-local-admin', 'inquiry', 0, 0, 'Inquiry', 39, 8),
(164, 'stat-local-admin', 'enquiry', 0, 0, 'Enquiry', 39, 9),
(165, 'stat-local-admin', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 39, 10),
(166, 'stat-ethnic', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 40, 1),
(167, 'stat-ethnic', 'delete', 0, 0, 'ລຶບ/Delete', 40, 2),
(168, 'stat-ethnic', 'print', 0, 0, 'ພິມ/Print', 40, 3),
(169, 'stat-ethnic', 'download', 0, 0, 'ສົ່ງອອກ/Export', 40, 4),
(170, 'stat-ethnic', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 40, 5),
(171, 'stat-ethnic', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 40, 6),
(172, 'stat-ethnic', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 40, 7),
(173, 'stat-ethnic', 'inquiry', 0, 0, 'Inquiry', 40, 8),
(174, 'stat-ethnic', 'enquiry', 0, 0, 'Enquiry', 40, 9),
(175, 'stat-ethnic', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 40, 10),
(176, 'stat-religion', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 41, 1),
(177, 'stat-religion', 'delete', 0, 0, 'ລຶບ/Delete', 41, 2),
(178, 'stat-religion', 'print', 0, 0, 'ພິມ/Print', 41, 3),
(179, 'stat-religion', 'download', 0, 0, 'ສົ່ງອອກ/Export', 41, 4),
(180, 'stat-religion', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 41, 5),
(181, 'stat-religion', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 41, 6),
(182, 'stat-religion', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 41, 7),
(183, 'stat-religion', 'inquiry', 0, 0, 'Inquiry', 41, 8),
(184, 'stat-religion', 'enquiry', 0, 0, 'Enquiry', 41, 9),
(185, 'stat-religion', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 41, 10),
(186, 'stat-religion-teacher', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 42, 1),
(187, 'stat-religion-teacher', 'delete', 0, 0, 'ລຶບ/Delete', 42, 2),
(188, 'stat-religion-teacher', 'print', 0, 0, 'ພິມ/Print', 42, 3),
(189, 'stat-religion-teacher', 'download', 0, 0, 'ສົ່ງອອກ/Export', 42, 4),
(190, 'stat-religion-teacher', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 42, 5),
(191, 'stat-religion-teacher', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 42, 6),
(192, 'stat-religion-teacher', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 42, 7),
(193, 'stat-religion-teacher', 'inquiry', 0, 0, 'Inquiry', 42, 8),
(194, 'stat-religion-teacher', 'enquiry', 0, 0, 'Enquiry', 42, 9),
(195, 'stat-religion-teacher', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 42, 10),
(196, 'stat-religion-place', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 43, 1),
(197, 'stat-religion-place', 'delete', 0, 0, 'ລຶບ/Delete', 43, 2),
(198, 'stat-religion-place', 'print', 0, 0, 'ພິມ/Print', 43, 3),
(199, 'stat-religion-place', 'download', 0, 0, 'ສົ່ງອອກ/Export', 43, 4),
(200, 'stat-religion-place', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 43, 5),
(201, 'stat-religion-place', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 43, 6),
(202, 'stat-religion-place', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 43, 7),
(203, 'stat-religion-place', 'inquiry', 0, 0, 'Inquiry', 43, 8),
(204, 'stat-religion-place', 'enquiry', 0, 0, 'Enquiry', 43, 9),
(205, 'stat-religion-place', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 43, 10),
(206, 'stat-population-movement', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 44, 1),
(207, 'stat-population-movement', 'delete', 0, 0, 'ລຶບ/Delete', 44, 2),
(208, 'stat-population-movement', 'print', 0, 0, 'ພິມ/Print', 44, 3),
(209, 'stat-population-movement', 'download', 0, 0, 'ສົ່ງອອກ/Export', 44, 4),
(210, 'stat-population-movement', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 44, 5),
(211, 'stat-population-movement', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 44, 6),
(212, 'stat-population-movement', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 44, 7),
(213, 'stat-population-movement', 'inquiry', 0, 0, 'Inquiry', 44, 8),
(214, 'stat-population-movement', 'enquiry', 0, 0, 'Enquiry', 44, 9),
(215, 'stat-population-movement', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 44, 10),
(216, 'stat-population-movement-chart', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 45, 1),
(217, 'stat-population-movement-chart', 'delete', 0, 0, 'ລຶບ/Delete', 45, 2),
(218, 'stat-population-movement-chart', 'print', 0, 0, 'ພິມ/Print', 45, 3),
(219, 'stat-population-movement-chart', 'download', 0, 0, 'ສົ່ງອອກ/Export', 45, 4),
(220, 'stat-population-movement-chart', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 45, 5),
(221, 'stat-population-movement-chart', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 45, 6),
(222, 'stat-population-movement-chart', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 45, 7),
(223, 'stat-population-movement-chart', 'inquiry', 0, 0, 'Inquiry', 45, 8),
(224, 'stat-population-movement-chart', 'enquiry', 0, 0, 'Enquiry', 45, 9),
(225, 'stat-population-movement-chart', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 45, 10),
(226, 'stat-officer', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 46, 1),
(227, 'stat-officer', 'delete', 0, 0, 'ລຶບ/Delete', 46, 2),
(228, 'stat-officer', 'print', 0, 0, 'ພິມ/Print', 46, 3),
(229, 'stat-officer', 'download', 0, 0, 'ສົ່ງອອກ/Export', 46, 4),
(230, 'stat-officer', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 46, 5),
(231, 'stat-officer', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 46, 6),
(232, 'stat-officer', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 46, 7),
(233, 'stat-officer', 'inquiry', 0, 0, 'Inquiry', 46, 8),
(234, 'stat-officer', 'enquiry', 0, 0, 'Enquiry', 46, 9),
(235, 'stat-officer', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 46, 10),
(236, 'stat-officer-age', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 47, 1),
(237, 'stat-officer-age', 'delete', 0, 0, 'ລຶບ/Delete', 47, 2),
(238, 'stat-officer-age', 'print', 0, 0, 'ພິມ/Print', 47, 3),
(239, 'stat-officer-age', 'download', 0, 0, 'ສົ່ງອອກ/Export', 47, 4),
(240, 'stat-officer-age', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 47, 5),
(241, 'stat-officer-age', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 47, 6),
(242, 'stat-officer-age', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 47, 7),
(243, 'stat-officer-age', 'inquiry', 0, 0, 'Inquiry', 47, 8),
(244, 'stat-officer-age', 'enquiry', 0, 0, 'Enquiry', 47, 9),
(245, 'stat-officer-age', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 47, 10),
(246, 'stat-officer-degree', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 48, 1),
(247, 'stat-officer-degree', 'delete', 0, 0, 'ລຶບ/Delete', 48, 2),
(248, 'stat-officer-degree', 'print', 0, 0, 'ພິມ/Print', 48, 3),
(249, 'stat-officer-degree', 'download', 0, 0, 'ສົ່ງອອກ/Export', 48, 4),
(250, 'stat-officer-degree', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 48, 5),
(251, 'stat-officer-degree', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 48, 6),
(252, 'stat-officer-degree', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 48, 7),
(253, 'stat-officer-degree', 'inquiry', 0, 0, 'Inquiry', 48, 8),
(254, 'stat-officer-degree', 'enquiry', 0, 0, 'Enquiry', 48, 9),
(255, 'stat-officer-degree', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 48, 10),
(256, 'stat-officer-resign', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 49, 1),
(257, 'stat-officer-resign', 'delete', 0, 0, 'ລຶບ/Delete', 49, 2),
(258, 'stat-officer-resign', 'print', 0, 0, 'ພິມ/Print', 49, 3),
(259, 'stat-officer-resign', 'download', 0, 0, 'ສົ່ງອອກ/Export', 49, 4),
(260, 'stat-officer-resign', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 49, 5),
(261, 'stat-officer-resign', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 49, 6),
(262, 'stat-officer-resign', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 49, 7),
(263, 'stat-officer-resign', 'inquiry', 0, 0, 'Inquiry', 49, 8),
(264, 'stat-officer-resign', 'enquiry', 0, 0, 'Enquiry', 49, 9),
(265, 'stat-officer-resign', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 49, 10),
(266, 'stat-officer-add', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 50, 1),
(267, 'stat-officer-add', 'delete', 0, 0, 'ລຶບ/Delete', 50, 2),
(268, 'stat-officer-add', 'print', 0, 0, 'ພິມ/Print', 50, 3),
(269, 'stat-officer-add', 'download', 0, 0, 'ສົ່ງອອກ/Export', 50, 4),
(270, 'stat-officer-add', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 50, 5),
(271, 'stat-officer-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 50, 6),
(272, 'stat-officer-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 50, 7),
(273, 'stat-officer-add', 'inquiry', 0, 0, 'Inquiry', 50, 8),
(274, 'stat-officer-add', 'enquiry', 0, 0, 'Enquiry', 50, 9),
(275, 'stat-officer-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 50, 10),
(276, 'stat-officer-contract', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 51, 1),
(277, 'stat-officer-contract', 'delete', 0, 0, 'ລຶບ/Delete', 51, 2),
(278, 'stat-officer-contract', 'print', 0, 0, 'ພິມ/Print', 51, 3),
(279, 'stat-officer-contract', 'download', 0, 0, 'ສົ່ງອອກ/Export', 51, 4),
(280, 'stat-officer-contract', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 51, 5),
(281, 'stat-officer-contract', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 51, 6),
(282, 'stat-officer-contract', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 51, 7),
(283, 'stat-officer-contract', 'inquiry', 0, 0, 'Inquiry', 51, 8),
(284, 'stat-officer-contract', 'enquiry', 0, 0, 'Enquiry', 51, 9),
(285, 'stat-officer-contract', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 51, 10),
(286, 'stat-officer-position', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 52, 1),
(287, 'stat-officer-position', 'delete', 0, 0, 'ລຶບ/Delete', 52, 2),
(288, 'stat-officer-position', 'print', 0, 0, 'ພິມ/Print', 52, 3),
(289, 'stat-officer-position', 'download', 0, 0, 'ສົ່ງອອກ/Export', 52, 4),
(290, 'stat-officer-position', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 52, 5),
(291, 'stat-officer-position', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 52, 6),
(292, 'stat-officer-position', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 52, 7),
(293, 'stat-officer-position', 'inquiry', 0, 0, 'Inquiry', 52, 8),
(294, 'stat-officer-position', 'enquiry', 0, 0, 'Enquiry', 52, 9),
(295, 'stat-officer-position', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 52, 10),
(296, 'stat-officer-need', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 53, 1),
(297, 'stat-officer-need', 'delete', 0, 0, 'ລຶບ/Delete', 53, 2),
(298, 'stat-officer-need', 'print', 0, 0, 'ພິມ/Print', 53, 3),
(299, 'stat-officer-need', 'download', 0, 0, 'ສົ່ງອອກ/Export', 53, 4),
(300, 'stat-officer-need', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 53, 5),
(301, 'stat-officer-need', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 53, 6),
(302, 'stat-officer-need', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 53, 7),
(303, 'stat-officer-need', 'inquiry', 0, 0, 'Inquiry', 53, 8),
(304, 'stat-officer-need', 'enquiry', 0, 0, 'Enquiry', 53, 9),
(305, 'stat-officer-need', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 53, 10),
(306, 'stat-officer-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 54, 1),
(307, 'stat-officer-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 54, 2),
(308, 'stat-officer-ministry', 'print', 0, 0, 'ພິມ/Print', 54, 3),
(309, 'stat-officer-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 54, 4),
(310, 'stat-officer-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 54, 5),
(311, 'stat-officer-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 54, 6),
(312, 'stat-officer-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 54, 7),
(313, 'stat-officer-ministry', 'inquiry', 0, 0, 'Inquiry', 54, 8),
(314, 'stat-officer-ministry', 'enquiry', 0, 0, 'Enquiry', 54, 9),
(315, 'stat-officer-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 54, 10),
(316, 'stat-officer-org', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 55, 1),
(317, 'stat-officer-org', 'delete', 0, 0, 'ລຶບ/Delete', 55, 2),
(318, 'stat-officer-org', 'print', 0, 0, 'ພິມ/Print', 55, 3),
(319, 'stat-officer-org', 'download', 0, 0, 'ສົ່ງອອກ/Export', 55, 4),
(320, 'stat-officer-org', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 55, 5),
(321, 'stat-officer-org', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 55, 6),
(322, 'stat-officer-org', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 55, 7),
(323, 'stat-officer-org', 'inquiry', 0, 0, 'Inquiry', 55, 8),
(324, 'stat-officer-org', 'enquiry', 0, 0, 'Enquiry', 55, 9),
(325, 'stat-officer-org', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 55, 10),
(326, 'stat-officer-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 56, 1),
(327, 'stat-officer-province', 'delete', 0, 0, 'ລຶບ/Delete', 56, 2),
(328, 'stat-officer-province', 'print', 0, 0, 'ພິມ/Print', 56, 3),
(329, 'stat-officer-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 56, 4),
(330, 'stat-officer-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 56, 5),
(331, 'stat-officer-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 56, 6),
(332, 'stat-officer-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 56, 7),
(333, 'stat-officer-province', 'inquiry', 0, 0, 'Inquiry', 56, 8),
(334, 'stat-officer-province', 'enquiry', 0, 0, 'Enquiry', 56, 9),
(335, 'stat-officer-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 56, 10),
(336, 'stat-officer-ministry-add', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 57, 1),
(337, 'stat-officer-ministry-add', 'delete', 0, 0, 'ລຶບ/Delete', 57, 2),
(338, 'stat-officer-ministry-add', 'print', 0, 0, 'ພິມ/Print', 57, 3),
(339, 'stat-officer-ministry-add', 'download', 0, 0, 'ສົ່ງອອກ/Export', 57, 4),
(340, 'stat-officer-ministry-add', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 57, 5),
(341, 'stat-officer-ministry-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 57, 6),
(342, 'stat-officer-ministry-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 57, 7),
(343, 'stat-officer-ministry-add', 'inquiry', 0, 0, 'Inquiry', 57, 8),
(344, 'stat-officer-ministry-add', 'enquiry', 0, 0, 'Enquiry', 57, 9),
(345, 'stat-officer-ministry-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 57, 10),
(346, 'stat-officer-organisation-add', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 58, 1),
(347, 'stat-officer-organisation-add', 'delete', 0, 0, 'ລຶບ/Delete', 58, 2),
(348, 'stat-officer-organisation-add', 'print', 0, 0, 'ພິມ/Print', 58, 3),
(349, 'stat-officer-organisation-add', 'download', 0, 0, 'ສົ່ງອອກ/Export', 58, 4),
(350, 'stat-officer-organisation-add', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 58, 5),
(351, 'stat-officer-organisation-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 58, 6),
(352, 'stat-officer-organisation-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 58, 7),
(353, 'stat-officer-organisation-add', 'inquiry', 0, 0, 'Inquiry', 58, 8),
(354, 'stat-officer-organisation-add', 'enquiry', 0, 0, 'Enquiry', 58, 9),
(355, 'stat-officer-organisation-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 58, 10),
(356, 'stat-officer-province-add', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 59, 1),
(357, 'stat-officer-province-add', 'delete', 0, 0, 'ລຶບ/Delete', 59, 2),
(358, 'stat-officer-province-add', 'print', 0, 0, 'ພິມ/Print', 59, 3),
(359, 'stat-officer-province-add', 'download', 0, 0, 'ສົ່ງອອກ/Export', 59, 4),
(360, 'stat-officer-province-add', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 59, 5),
(361, 'stat-officer-province-add', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 59, 6),
(362, 'stat-officer-province-add', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 59, 7),
(363, 'stat-officer-province-add', 'inquiry', 0, 0, 'Inquiry', 59, 8),
(364, 'stat-officer-province-add', 'enquiry', 0, 0, 'Enquiry', 59, 9),
(365, 'stat-officer-province-add', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 59, 10),
(366, 'stat-officer-ministry-train', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 60, 1),
(367, 'stat-officer-ministry-train', 'delete', 0, 0, 'ລຶບ/Delete', 60, 2),
(368, 'stat-officer-ministry-train', 'print', 0, 0, 'ພິມ/Print', 60, 3),
(369, 'stat-officer-ministry-train', 'download', 0, 0, 'ສົ່ງອອກ/Export', 60, 4),
(370, 'stat-officer-ministry-train', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 60, 5),
(371, 'stat-officer-ministry-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 60, 6),
(372, 'stat-officer-ministry-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 60, 7),
(373, 'stat-officer-ministry-train', 'inquiry', 0, 0, 'Inquiry', 60, 8),
(374, 'stat-officer-ministry-train', 'enquiry', 0, 0, 'Enquiry', 60, 9),
(375, 'stat-officer-ministry-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 60, 10),
(376, 'stat-officer-organisation-train', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 61, 1),
(377, 'stat-officer-organisation-train', 'delete', 0, 0, 'ລຶບ/Delete', 61, 2),
(378, 'stat-officer-organisation-train', 'print', 0, 0, 'ພິມ/Print', 61, 3),
(379, 'stat-officer-organisation-train', 'download', 0, 0, 'ສົ່ງອອກ/Export', 61, 4),
(380, 'stat-officer-organisation-train', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 61, 5),
(381, 'stat-officer-organisation-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 61, 6),
(382, 'stat-officer-organisation-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 61, 7),
(383, 'stat-officer-organisation-train', 'inquiry', 0, 0, 'Inquiry', 61, 8),
(384, 'stat-officer-organisation-train', 'enquiry', 0, 0, 'Enquiry', 61, 9),
(385, 'stat-officer-organisation-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 61, 10),
(386, 'stat-officer-province-train', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 62, 1),
(387, 'stat-officer-province-train', 'delete', 0, 0, 'ລຶບ/Delete', 62, 2),
(388, 'stat-officer-province-train', 'print', 0, 0, 'ພິມ/Print', 62, 3),
(389, 'stat-officer-province-train', 'download', 0, 0, 'ສົ່ງອອກ/Export', 62, 4),
(390, 'stat-officer-province-train', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 62, 5),
(391, 'stat-officer-province-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 62, 6),
(392, 'stat-officer-province-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 62, 7),
(393, 'stat-officer-province-train', 'inquiry', 0, 0, 'Inquiry', 62, 8),
(394, 'stat-officer-province-train', 'enquiry', 0, 0, 'Enquiry', 62, 9),
(395, 'stat-officer-province-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 62, 10),
(396, 'stat-officer-ministry-upgrade', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 63, 1),
(397, 'stat-officer-ministry-upgrade', 'delete', 0, 0, 'ລຶບ/Delete', 63, 2),
(398, 'stat-officer-ministry-upgrade', 'print', 0, 0, 'ພິມ/Print', 63, 3),
(399, 'stat-officer-ministry-upgrade', 'download', 0, 0, 'ສົ່ງອອກ/Export', 63, 4),
(400, 'stat-officer-ministry-upgrade', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 63, 5),
(401, 'stat-officer-ministry-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 63, 6),
(402, 'stat-officer-ministry-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 63, 7),
(403, 'stat-officer-ministry-upgrade', 'inquiry', 0, 0, 'Inquiry', 63, 8),
(404, 'stat-officer-ministry-upgrade', 'enquiry', 0, 0, 'Enquiry', 63, 9),
(405, 'stat-officer-ministry-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 63, 10),
(406, 'stat-officer-organisation-upgrade', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 64, 1),
(407, 'stat-officer-organisation-upgrade', 'delete', 0, 0, 'ລຶບ/Delete', 64, 2),
(408, 'stat-officer-organisation-upgrade', 'print', 0, 0, 'ພິມ/Print', 64, 3),
(409, 'stat-officer-organisation-upgrade', 'download', 0, 0, 'ສົ່ງອອກ/Export', 64, 4),
(410, 'stat-officer-organisation-upgrade', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 64, 5),
(411, 'stat-officer-organisation-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 64, 6),
(412, 'stat-officer-organisation-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 64, 7),
(413, 'stat-officer-organisation-upgrade', 'inquiry', 0, 0, 'Inquiry', 64, 8),
(414, 'stat-officer-organisation-upgrade', 'enquiry', 0, 0, 'Enquiry', 64, 9),
(415, 'stat-officer-organisation-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 64, 10),
(416, 'stat-officer-province-upgrade', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 65, 1),
(417, 'stat-officer-province-upgrade', 'delete', 0, 0, 'ລຶບ/Delete', 65, 2),
(418, 'stat-officer-province-upgrade', 'print', 0, 0, 'ພິມ/Print', 65, 3),
(419, 'stat-officer-province-upgrade', 'download', 0, 0, 'ສົ່ງອອກ/Export', 65, 4),
(420, 'stat-officer-province-upgrade', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 65, 5),
(421, 'stat-officer-province-upgrade', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 65, 6),
(422, 'stat-officer-province-upgrade', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 65, 7),
(423, 'stat-officer-province-upgrade', 'inquiry', 0, 0, 'Inquiry', 65, 8),
(424, 'stat-officer-province-upgrade', 'enquiry', 0, 0, 'Enquiry', 65, 9),
(425, 'stat-officer-province-upgrade', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 65, 10),
(426, 'stat-course', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 66, 1),
(427, 'stat-course', 'delete', 0, 0, 'ລຶບ/Delete', 66, 2),
(428, 'stat-course', 'print', 0, 0, 'ພິມ/Print', 66, 3),
(429, 'stat-course', 'download', 0, 0, 'ສົ່ງອອກ/Export', 66, 4),
(430, 'stat-course', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 66, 5),
(431, 'stat-course', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 66, 6),
(432, 'stat-course', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 66, 7),
(433, 'stat-course', 'inquiry', 0, 0, 'Inquiry', 66, 8),
(434, 'stat-course', 'enquiry', 0, 0, 'Enquiry', 66, 9),
(435, 'stat-course', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 66, 10),
(436, 'stat-institute-train', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 67, 1),
(437, 'stat-institute-train', 'delete', 0, 0, 'ລຶບ/Delete', 67, 2),
(438, 'stat-institute-train', 'print', 0, 0, 'ພິມ/Print', 67, 3),
(439, 'stat-institute-train', 'download', 0, 0, 'ສົ່ງອອກ/Export', 67, 4),
(440, 'stat-institute-train', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 67, 5),
(441, 'stat-institute-train', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 67, 6),
(442, 'stat-institute-train', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 67, 7),
(443, 'stat-institute-train', 'inquiry', 0, 0, 'Inquiry', 67, 8),
(444, 'stat-institute-train', 'enquiry', 0, 0, 'Enquiry', 67, 9),
(445, 'stat-institute-train', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 67, 10),
(446, 'stat-institute-meeting', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 68, 1),
(447, 'stat-institute-meeting', 'delete', 0, 0, 'ລຶບ/Delete', 68, 2),
(448, 'stat-institute-meeting', 'print', 0, 0, 'ພິມ/Print', 68, 3),
(449, 'stat-institute-meeting', 'download', 0, 0, 'ສົ່ງອອກ/Export', 68, 4),
(450, 'stat-institute-meeting', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 68, 5),
(451, 'stat-institute-meeting', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 68, 6),
(452, 'stat-institute-meeting', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 68, 7),
(453, 'stat-institute-meeting', 'inquiry', 0, 0, 'Inquiry', 68, 8),
(454, 'stat-institute-meeting', 'enquiry', 0, 0, 'Enquiry', 68, 9),
(455, 'stat-institute-meeting', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 68, 10),
(456, 'stat-research', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 69, 1),
(457, 'stat-research', 'delete', 0, 0, 'ລຶບ/Delete', 69, 2),
(458, 'stat-research', 'print', 0, 0, 'ພິມ/Print', 69, 3),
(459, 'stat-research', 'download', 0, 0, 'ສົ່ງອອກ/Export', 69, 4),
(460, 'stat-research', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 69, 5),
(461, 'stat-research', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 69, 6),
(462, 'stat-research', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 69, 7),
(463, 'stat-research', 'inquiry', 0, 0, 'Inquiry', 69, 8),
(464, 'stat-research', 'enquiry', 0, 0, 'Enquiry', 69, 9),
(465, 'stat-research', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 69, 10),
(466, 'stat-document', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 70, 1),
(467, 'stat-document', 'delete', 0, 0, 'ລຶບ/Delete', 70, 2),
(468, 'stat-document', 'print', 0, 0, 'ພິມ/Print', 70, 3),
(469, 'stat-document', 'download', 0, 0, 'ສົ່ງອອກ/Export', 70, 4),
(470, 'stat-document', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 70, 5),
(471, 'stat-document', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 70, 6),
(472, 'stat-document', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 70, 7),
(473, 'stat-document', 'inquiry', 0, 0, 'Inquiry', 70, 8),
(474, 'stat-document', 'enquiry', 0, 0, 'Enquiry', 70, 9),
(475, 'stat-document', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 70, 10),
(476, 'stat-copy', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 71, 1),
(477, 'stat-copy', 'delete', 0, 0, 'ລຶບ/Delete', 71, 2),
(478, 'stat-copy', 'print', 0, 0, 'ພິມ/Print', 71, 3),
(479, 'stat-copy', 'download', 0, 0, 'ສົ່ງອອກ/Export', 71, 4),
(480, 'stat-copy', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 71, 5),
(481, 'stat-copy', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 71, 6),
(482, 'stat-copy', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 71, 7),
(483, 'stat-copy', 'inquiry', 0, 0, 'Inquiry', 71, 8),
(484, 'stat-copy', 'enquiry', 0, 0, 'Enquiry', 71, 9),
(485, 'stat-copy', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 71, 10),
(486, 'stat-highcoin-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 72, 1),
(487, 'stat-highcoin-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 72, 2),
(488, 'stat-highcoin-ministry', 'print', 0, 0, 'ພິມ/Print', 72, 3),
(489, 'stat-highcoin-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 72, 4),
(490, 'stat-highcoin-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 72, 5),
(491, 'stat-highcoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 72, 6),
(492, 'stat-highcoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 72, 7),
(493, 'stat-highcoin-ministry', 'inquiry', 0, 0, 'Inquiry', 72, 8),
(494, 'stat-highcoin-ministry', 'enquiry', 0, 0, 'Enquiry', 72, 9),
(495, 'stat-highcoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 72, 10),
(496, 'stat-hornorcoin-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 73, 1),
(497, 'stat-hornorcoin-province', 'delete', 0, 0, 'ລຶບ/Delete', 73, 2),
(498, 'stat-hornorcoin-province', 'print', 0, 0, 'ພິມ/Print', 73, 3),
(499, 'stat-hornorcoin-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 73, 4),
(500, 'stat-hornorcoin-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 73, 5),
(501, 'stat-hornorcoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 73, 6),
(502, 'stat-hornorcoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 73, 7),
(503, 'stat-hornorcoin-province', 'inquiry', 0, 0, 'Inquiry', 73, 8),
(504, 'stat-hornorcoin-province', 'enquiry', 0, 0, 'Enquiry', 73, 9),
(505, 'stat-hornorcoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 73, 10),
(506, 'stat-victorycoin-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 74, 1),
(507, 'stat-victorycoin-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 74, 2),
(508, 'stat-victorycoin-ministry', 'print', 0, 0, 'ພິມ/Print', 74, 3),
(509, 'stat-victorycoin-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 74, 4),
(510, 'stat-victorycoin-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 74, 5),
(511, 'stat-victorycoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 74, 6),
(512, 'stat-victorycoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 74, 7),
(513, 'stat-victorycoin-ministry', 'inquiry', 0, 0, 'Inquiry', 74, 8),
(514, 'stat-victorycoin-ministry', 'enquiry', 0, 0, 'Enquiry', 74, 9),
(515, 'stat-victorycoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 74, 10),
(516, 'stat-victorycoin-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 75, 1),
(517, 'stat-victorycoin-province', 'delete', 0, 0, 'ລຶບ/Delete', 75, 2),
(518, 'stat-victorycoin-province', 'print', 0, 0, 'ພິມ/Print', 75, 3),
(519, 'stat-victorycoin-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 75, 4),
(520, 'stat-victorycoin-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 75, 5),
(521, 'stat-victorycoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 75, 6),
(522, 'stat-victorycoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 75, 7),
(523, 'stat-victorycoin-province', 'inquiry', 0, 0, 'Inquiry', 75, 8),
(524, 'stat-victorycoin-province', 'enquiry', 0, 0, 'Enquiry', 75, 9),
(525, 'stat-victorycoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 75, 10),
(526, 'stat-govcoin-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 76, 1),
(527, 'stat-govcoin-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 76, 2),
(528, 'stat-govcoin-ministry', 'print', 0, 0, 'ພິມ/Print', 76, 3),
(529, 'stat-govcoin-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 76, 4),
(530, 'stat-govcoin-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 76, 5),
(531, 'stat-govcoin-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 76, 6),
(532, 'stat-govcoin-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 76, 7),
(533, 'stat-govcoin-ministry', 'inquiry', 0, 0, 'Inquiry', 76, 8),
(534, 'stat-govcoin-ministry', 'enquiry', 0, 0, 'Enquiry', 76, 9),
(535, 'stat-govcoin-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 76, 10),
(536, 'stat-highoversea-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 77, 1),
(537, 'stat-highoversea-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 77, 2),
(538, 'stat-highoversea-ministry', 'print', 0, 0, 'ພິມ/Print', 77, 3),
(539, 'stat-highoversea-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 77, 4),
(540, 'stat-highoversea-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 77, 5),
(541, 'stat-highoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 77, 6),
(542, 'stat-highoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 77, 7),
(543, 'stat-highoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 77, 8),
(544, 'stat-highoversea-ministry', 'enquiry', 0, 0, 'Enquiry', 77, 9),
(545, 'stat-highoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 77, 10),
(546, 'stat-victoryoversea-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 78, 1),
(547, 'stat-victoryoversea-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 78, 2),
(548, 'stat-victoryoversea-ministry', 'print', 0, 0, 'ພິມ/Print', 78, 3),
(549, 'stat-victoryoversea-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 78, 4),
(550, 'stat-victoryoversea-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 78, 5),
(551, 'stat-victoryoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 78, 6),
(552, 'stat-victoryoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 78, 7),
(553, 'stat-victoryoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 78, 8),
(554, 'stat-victoryoversea-ministry', 'enquiry', 0, 0, 'Enquiry', 78, 9),
(555, 'stat-victoryoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 78, 10),
(556, 'stat-victoryoversea-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 79, 1),
(557, 'stat-victoryoversea-province', 'delete', 0, 0, 'ລຶບ/Delete', 79, 2),
(558, 'stat-victoryoversea-province', 'print', 0, 0, 'ພິມ/Print', 79, 3),
(559, 'stat-victoryoversea-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 79, 4),
(560, 'stat-victoryoversea-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 79, 5),
(561, 'stat-victoryoversea-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 79, 6),
(562, 'stat-victoryoversea-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 79, 7),
(563, 'stat-victoryoversea-province', 'inquiry', 0, 0, 'Inquiry', 79, 8),
(564, 'stat-victoryoversea-province', 'enquiry', 0, 0, 'Enquiry', 79, 9),
(565, 'stat-victoryoversea-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 79, 10),
(566, 'stat-govoversea-ministry', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 80, 1),
(567, 'stat-govoversea-ministry', 'delete', 0, 0, 'ລຶບ/Delete', 80, 2),
(568, 'stat-govoversea-ministry', 'print', 0, 0, 'ພິມ/Print', 80, 3),
(569, 'stat-govoversea-ministry', 'download', 0, 0, 'ສົ່ງອອກ/Export', 80, 4),
(570, 'stat-govoversea-ministry', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 80, 5),
(571, 'stat-govoversea-ministry', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 80, 6),
(572, 'stat-govoversea-ministry', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 80, 7),
(573, 'stat-govoversea-ministry', 'inquiry', 0, 0, 'Inquiry', 80, 8),
(574, 'stat-govoversea-ministry', 'enquiry', 0, 0, 'Enquiry', 80, 9),
(575, 'stat-govoversea-ministry', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 80, 10),
(576, 'stat-govcoin-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 81, 1),
(577, 'stat-govcoin-province', 'delete', 0, 0, 'ລຶບ/Delete', 81, 2),
(578, 'stat-govcoin-province', 'print', 0, 0, 'ພິມ/Print', 81, 3),
(579, 'stat-govcoin-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 81, 4),
(580, 'stat-govcoin-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 81, 5),
(581, 'stat-govcoin-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 81, 6),
(582, 'stat-govcoin-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 81, 7),
(583, 'stat-govcoin-province', 'inquiry', 0, 0, 'Inquiry', 81, 8),
(584, 'stat-govcoin-province', 'enquiry', 0, 0, 'Enquiry', 81, 9),
(585, 'stat-govcoin-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 81, 10),
(586, 'stat-govoversea-province', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 82, 1),
(587, 'stat-govoversea-province', 'delete', 0, 0, 'ລຶບ/Delete', 82, 2),
(588, 'stat-govoversea-province', 'print', 0, 0, 'ພິມ/Print', 82, 3),
(589, 'stat-govoversea-province', 'download', 0, 0, 'ສົ່ງອອກ/Export', 82, 4),
(590, 'stat-govoversea-province', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 82, 5),
(591, 'stat-govoversea-province', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 82, 6),
(592, 'stat-govoversea-province', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 82, 7),
(593, 'stat-govoversea-province', 'inquiry', 0, 0, 'Inquiry', 82, 8),
(594, 'stat-govoversea-province', 'enquiry', 0, 0, 'Enquiry', 82, 9),
(595, 'stat-govoversea-province', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 82, 10),
(596, 'stat-map-service', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 83, 1),
(597, 'stat-map-service', 'delete', 0, 0, 'ລຶບ/Delete', 83, 2),
(598, 'stat-map-service', 'print', 0, 0, 'ພິມ/Print', 83, 3),
(599, 'stat-map-service', 'download', 0, 0, 'ສົ່ງອອກ/Export', 83, 4),
(600, 'stat-map-service', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 83, 5),
(601, 'stat-map-service', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 83, 6),
(602, 'stat-map-service', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 83, 7),
(603, 'stat-map-service', 'inquiry', 0, 0, 'Inquiry', 83, 8),
(604, 'stat-map-service', 'enquiry', 0, 0, 'Enquiry', 83, 9),
(605, 'stat-map-service', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 83, 10),
(606, 'stat-map-produce', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 84, 1),
(607, 'stat-map-produce', 'delete', 0, 0, 'ລຶບ/Delete', 84, 2),
(608, 'stat-map-produce', 'print', 0, 0, 'ພິມ/Print', 84, 3),
(609, 'stat-map-produce', 'download', 0, 0, 'ສົ່ງອອກ/Export', 84, 4),
(610, 'stat-map-produce', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 84, 5),
(611, 'stat-map-produce', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 84, 6),
(612, 'stat-map-produce', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 84, 7),
(613, 'stat-map-produce', 'inquiry', 0, 0, 'Inquiry', 84, 8),
(614, 'stat-map-produce', 'enquiry', 0, 0, 'Enquiry', 84, 9),
(615, 'stat-map-produce', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 84, 10),
(616, 'stat-explore', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 85, 1),
(617, 'stat-explore', 'delete', 0, 0, 'ລຶບ/Delete', 85, 2),
(618, 'stat-explore', 'print', 0, 0, 'ພິມ/Print', 85, 3),
(619, 'stat-explore', 'download', 0, 0, 'ສົ່ງອອກ/Export', 85, 4),
(620, 'stat-explore', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 85, 5),
(621, 'stat-explore', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 85, 6),
(622, 'stat-explore', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 85, 7),
(623, 'stat-explore', 'inquiry', 0, 0, 'Inquiry', 85, 8),
(624, 'stat-explore', 'enquiry', 0, 0, 'Enquiry', 85, 9),
(625, 'stat-explore', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 85, 10),
(626, '#', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 86, 1),
(627, '#', 'delete', 0, 0, 'ລຶບ/Delete', 86, 2),
(628, '#', 'print', 0, 0, 'ພິມ/Print', 86, 3),
(629, '#', 'download', 0, 0, 'ສົ່ງອອກ/Export', 86, 4),
(630, '#', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 86, 5),
(631, '#', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 86, 6),
(632, '#', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 86, 7),
(633, '#', 'inquiry', 0, 0, 'Inquiry', 86, 8),
(634, '#', 'enquiry', 0, 0, 'Enquiry', 86, 9),
(635, '#', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 86, 10),
(636, 'stat-explore', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 87, 1),
(637, 'stat-explore', 'delete', 0, 0, 'ລຶບ/Delete', 87, 2),
(638, 'stat-explore', 'print', 0, 0, 'ພິມ/Print', 87, 3),
(639, 'stat-explore', 'download', 0, 0, 'ສົ່ງອອກ/Export', 87, 4),
(640, 'stat-explore', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 87, 5),
(641, 'stat-explore', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 87, 6),
(642, 'stat-explore', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 87, 7),
(643, 'stat-explore', 'inquiry', 0, 0, 'Inquiry', 87, 8),
(644, 'stat-explore', 'enquiry', 0, 0, 'Enquiry', 87, 9),
(645, 'stat-explore', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 87, 10),
(646, 'stat-officer-salary', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 88, 1),
(647, 'stat-officer-salary', 'delete', 0, 0, 'ລຶບ/Delete', 88, 2),
(648, 'stat-officer-salary', 'print', 0, 0, 'ພິມ/Print', 88, 3),
(649, 'stat-officer-salary', 'download', 0, 0, 'ສົ່ງອອກ/Export', 88, 4),
(650, 'stat-officer-salary', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 88, 5),
(651, 'stat-officer-salary', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 88, 6),
(652, 'stat-officer-salary', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 88, 7),
(653, 'stat-officer-salary', 'inquiry', 0, 0, 'Inquiry', 88, 8),
(654, 'stat-officer-salary', 'enquiry', 0, 0, 'Enquiry', 88, 9),
(655, 'stat-officer-salary', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 88, 10),
(656, 'stat-officer-technical', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 89, 1),
(657, 'stat-officer-technical', 'delete', 0, 0, 'ລຶບ/Delete', 89, 2),
(658, 'stat-officer-technical', 'print', 0, 0, 'ພິມ/Print', 89, 3),
(659, 'stat-officer-technical', 'download', 0, 0, 'ສົ່ງອອກ/Export', 89, 4),
(660, 'stat-officer-technical', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 89, 5),
(661, 'stat-officer-technical', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 89, 6),
(662, 'stat-officer-technical', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 89, 7),
(663, 'stat-officer-technical', 'inquiry', 0, 0, 'Inquiry', 89, 8),
(664, 'stat-officer-technical', 'enquiry', 0, 0, 'Enquiry', 89, 9),
(665, 'stat-officer-technical', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 89, 10),
(666, 'stat-officer-age-level', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 90, 1),
(667, 'stat-officer-age-level', 'delete', 0, 0, 'ລຶບ/Delete', 90, 2),
(668, 'stat-officer-age-level', 'print', 0, 0, 'ພິມ/Print', 90, 3),
(669, 'stat-officer-age-level', 'download', 0, 0, 'ສົ່ງອອກ/Export', 90, 4),
(670, 'stat-officer-age-level', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 90, 5),
(671, 'stat-officer-age-level', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 90, 6),
(672, 'stat-officer-age-level', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 90, 7),
(673, 'stat-officer-age-level', 'inquiry', 0, 0, 'Inquiry', 90, 8),
(674, 'stat-officer-age-level', 'enquiry', 0, 0, 'Enquiry', 90, 9),
(675, 'stat-officer-age-level', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 90, 10),
(676, 'stat-officer-ethnic', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 91, 1);
INSERT INTO `action` (`id`, `class_name`, `method`, `deleted`, `controller_id`, `description`, `parent_id`, `position`) VALUES
(677, 'stat-officer-ethnic', 'delete', 0, 0, 'ລຶບ/Delete', 91, 2),
(678, 'stat-officer-ethnic', 'print', 0, 0, 'ພິມ/Print', 91, 3),
(679, 'stat-officer-ethnic', 'download', 0, 0, 'ສົ່ງອອກ/Export', 91, 4),
(680, 'stat-officer-ethnic', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 91, 5),
(681, 'stat-officer-ethnic', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 91, 6),
(682, 'stat-officer-ethnic', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 91, 7),
(683, 'stat-officer-ethnic', 'inquiry', 0, 0, 'Inquiry', 91, 8),
(684, 'stat-officer-ethnic', 'enquiry', 0, 0, 'Enquiry', 91, 9),
(685, 'stat-officer-ethnic', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 91, 10),
(686, 'stat-position', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 92, 1),
(687, 'stat-position', 'delete', 0, 0, 'ລຶບ/Delete', 92, 2),
(688, 'stat-position', 'print', 0, 0, 'ພິມ/Print', 92, 3),
(689, 'stat-position', 'download', 0, 0, 'ສົ່ງອອກ/Export', 92, 4),
(690, 'stat-position', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 92, 5),
(691, 'stat-position', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 92, 6),
(692, 'stat-position', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 92, 7),
(693, 'stat-position', 'inquiry', 0, 0, 'Inquiry', 92, 8),
(694, 'stat-position', 'enquiry', 0, 0, 'Enquiry', 92, 9),
(695, 'stat-position', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 92, 10),
(696, 'stat-officer-new', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 93, 1),
(697, 'stat-officer-new', 'delete', 0, 0, 'ລຶບ/Delete', 93, 2),
(698, 'stat-officer-new', 'print', 0, 0, 'ພິມ/Print', 93, 3),
(699, 'stat-officer-new', 'download', 0, 0, 'ສົ່ງອອກ/Export', 93, 4),
(700, 'stat-officer-new', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 93, 5),
(701, 'stat-officer-new', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 93, 6),
(702, 'stat-officer-new', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 93, 7),
(703, 'stat-officer-new', 'inquiry', 0, 0, 'Inquiry', 93, 8),
(704, 'stat-officer-new', 'enquiry', 0, 0, 'Enquiry', 93, 9),
(705, 'stat-officer-new', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 93, 10),
(706, '#', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 94, 1),
(707, '#', 'delete', 0, 0, 'ລຶບ/Delete', 94, 2),
(708, '#', 'print', 0, 0, 'ພິມ/Print', 94, 3),
(709, '#', 'download', 0, 0, 'ສົ່ງອອກ/Export', 94, 4),
(710, '#', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 94, 5),
(711, '#', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 94, 6),
(712, '#', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 94, 7),
(713, '#', 'inquiry', 0, 0, 'Inquiry', 94, 8),
(714, '#', 'enquiry', 0, 0, 'Enquiry', 94, 9),
(715, '#', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 94, 10),
(716, '#', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 95, 1),
(717, '#', 'delete', 0, 0, 'ລຶບ/Delete', 95, 2),
(718, '#', 'print', 0, 0, 'ພິມ/Print', 95, 3),
(719, '#', 'download', 0, 0, 'ສົ່ງອອກ/Export', 95, 4),
(720, '#', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 95, 5),
(721, '#', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 95, 6),
(722, '#', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 95, 7),
(723, '#', 'inquiry', 0, 0, 'Inquiry', 95, 8),
(724, '#', 'enquiry', 0, 0, 'Enquiry', 95, 9),
(725, '#', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 95, 10),
(726, '#', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 96, 1),
(727, '#', 'delete', 0, 0, 'ລຶບ/Delete', 96, 2),
(728, '#', 'print', 0, 0, 'ພິມ/Print', 96, 3),
(729, '#', 'download', 0, 0, 'ສົ່ງອອກ/Export', 96, 4),
(730, '#', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 96, 5),
(731, '#', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 96, 6),
(732, '#', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 96, 7),
(733, '#', 'inquiry', 0, 0, 'Inquiry', 96, 8),
(734, '#', 'enquiry', 0, 0, 'Enquiry', 96, 9),
(735, '#', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 96, 10),
(736, 'stat-officer-ethnic', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 97, 1),
(737, 'stat-officer-ethnic', 'delete', 0, 0, 'ລຶບ/Delete', 97, 2),
(738, 'stat-officer-ethnic', 'print', 0, 0, 'ພິມ/Print', 97, 3),
(739, 'stat-officer-ethnic', 'download', 0, 0, 'ສົ່ງອອກ/Export', 97, 4),
(740, 'stat-officer-ethnic', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 97, 5),
(741, 'stat-officer-ethnic', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 97, 6),
(742, 'stat-officer-ethnic', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 97, 7),
(743, 'stat-officer-ethnic', 'inquiry', 0, 0, 'Inquiry', 97, 8),
(744, 'stat-officer-ethnic', 'enquiry', 0, 0, 'Enquiry', 97, 9),
(745, 'stat-officer-ethnic', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 97, 10),
(746, 'stat-oda', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 98, 1),
(747, 'stat-oda', 'delete', 0, 0, 'ລຶບ/Delete', 98, 2),
(748, 'stat-oda', 'print', 0, 0, 'ພິມ/Print', 98, 3),
(749, 'stat-oda', 'download', 0, 0, 'ສົ່ງອອກ/Export', 98, 4),
(750, 'stat-oda', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 98, 5),
(751, 'stat-oda', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 98, 6),
(752, 'stat-oda', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 98, 7),
(753, 'stat-oda', 'inquiry', 0, 0, 'Inquiry', 98, 8),
(754, 'stat-oda', 'enquiry', 0, 0, 'Enquiry', 98, 9),
(755, 'stat-oda', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 98, 10),
(756, '#', 'save', 0, 0, 'ປ້ອນຂໍ້ມູນ/ແກ້ໄຂຂໍ້ມູນ', 35, 1),
(757, '#', 'delete', 0, 0, 'ລຶບ/Delete', 35, 2),
(758, '#', 'print', 0, 0, 'ພິມ/Print', 35, 3),
(759, '#', 'download', 0, 0, 'ສົ່ງອອກ/Export', 35, 4),
(760, '#', 'upload', 0, 0, 'ອັບໂຫຼດເອກະສານອ້າງອີງ', 35, 5),
(761, '#', 'deletefile', 0, 0, 'ລຶບເອກະສານອ້າງອີງ', 35, 6),
(762, '#', 'get', 0, 0, 'ໂຫຼດສົກປີ/Load Phiscal Year', 35, 7),
(763, '#', 'inquiry', 0, 0, 'Inquiry', 35, 8),
(764, '#', 'enquiry', 0, 0, 'Enquiry', 35, 9),
(765, '#', 'getreferences', 0, 0, 'ສະແດງເອກະສານອ້າງອີງ', 35, 10),
(766, 'user', 'manageuser', 0, 0, 'ເພີ່ມ/Add ຜູ້ໃຊ້', 2, 1),
(767, 'user', 'manageuser', 0, 0, 'ແກ້ໄຂ/Edit ຜູ້ໃຊ້', 2, 2),
(768, 'user', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານ (Subordinate(s))', 2, 3),
(769, 'user', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານບັນດາກົມ (Department(s))', 2, 4),
(770, 'user', 'subordinateandbranch', 0, 0, 'ບັນທຶກ ແລະ ບໍລິຫານບັນດາແຂວງ (Province(s))', 2, 5),
(771, 'report', '#', 0, 0, 'ລາຍງານ', 0, 3),
(772, 'report', 'index', 0, 0, 'ລາຍງານສະຖິຕິທັງໝົດ', 771, 3),
(773, 'report', 'complete', 0, 0, 'ລາຍງານຂໍ້ມູນທີ່ປ້ອນສຳເລັດແລ້ວ', 771, 3),
(774, 'report', 'incomplete', 0, 0, 'ລາຍງານຂໍ້ມູນທີ່ບປ້ອນໍ່ທັນສໍາເລັດ', 771, 3);

-- --------------------------------------------------------

--
-- Table structure for table `approver`
--

CREATE TABLE `approver` (
  `id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `ministry_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approver_level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `approver`
--

INSERT INTO `approver` (`id`, `deleted`, `ministry_id`, `province_id`, `approver_level_id`) VALUES
(1, 0, 27, NULL, 1),
(2, 0, NULL, 1, 2),
(3, 0, NULL, 17, 2),
(4, 0, NULL, 16, 2),
(5, 0, NULL, 6, 2),
(6, 0, NULL, 15, 2),
(7, 0, NULL, 14, 2),
(8, 0, NULL, 13, 2),
(9, 0, NULL, 12, 2),
(10, 0, NULL, 11, 2),
(11, 0, NULL, 10, 2),
(12, 0, NULL, 9, 2),
(13, 0, NULL, 8, 2),
(14, 0, NULL, 7, 2),
(15, 0, NULL, 5, 2),
(16, 0, NULL, 4, 2),
(17, 0, NULL, 3, 2),
(18, 0, NULL, 2, 2),
(19, 0, NULL, 18, 2);

-- --------------------------------------------------------

--
-- Table structure for table `approver_level`
--

CREATE TABLE `approver_level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `code` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M:Ministry\nP:Province'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `attachment` (
  `menu_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  `issued_date` datetime DEFAULT NULL,
  `issued_no` varchar(255) DEFAULT NULL,
  `issued_by` varchar(255) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`menu_id`, `name`, `deleted`, `user_id`, `id`, `phiscal_year_id`, `upload_date`, `issued_date`, `issued_no`, `issued_by`, `data`, `dir`, `original_name`) VALUES
(100, 'stat_highcoin_ministry_2017_10_19_002128.jpg', 1, 1, 1, 1, '2017-10-19 00:21:28', '2017-10-04 00:00:00', '0', 'gg', NULL, '2017', '10520821_764675226942214_7408213358830219784_o.jpg'),
(71, 'stat_local_admin_2017_10_19_020704.xlsx', 1, 1, 2, 1, '2017-10-19 02:07:04', '2017-10-18 00:00:00', 'ຢຟໂ', 'ເດດດດດ', NULL, '2017', 'ImportList.xlsx'),
(71, 'stat_local_admin_2017_10_19_020730.eddx', 1, 1, 3, 1, '2017-10-19 02:07:30', '2017-10-18 00:00:00', '1212121', 'ກດກດກດ', NULL, '2017', 'Finger print network.eddx'),
(56, 'stat_population_movement_2018_05_14_094638.docx', 1, 14, 4, 12, '2018-05-14 09:46:38', '2018-02-13 00:00:00', '12', 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', NULL, '2018', 'ໜັງສືເຊີນ27.4.2018.docx'),
(22, 'stat_religion_2018_09_18_103825.JPG', 1, 34, 5, 2, '2018-09-18 10:38:25', '2018-09-19 00:00:00', '23', 'ພພນ', NULL, '2018', 'san.JPG'),
(56, 'stat_population_movement_2018_09_19_034216.jpeg', 1, 34, 6, 2, '2018-09-19 03:42:16', '2018-09-19 00:00:00', '223', 'ພພນ', NULL, '2018', '575B391C-7466-4EAC-A1A4-14D84C5B2B6D.jpeg'),
(56, 'stat_population_movement_2018_10_01_051523.pdf', 1, 30, 7, 2, '2018-10-01 05:15:23', '2018-04-09 00:00:00', '01/ພ​ພນ/ຄມ', 'ພ​ພນ', NULL, '2018', 'ສະຖິຕິວຽກງານພົນລະເມືອງ ແລະ ສາສະໜາ 2017.pdf'),
(25, 'stat_ethnic_2018_10_12_083223.pdf', 1, 30, 8, 2, '2018-10-12 08:32:23', '2018-04-09 00:00:00', '01/ພ​ພນ/ຄມ', '​ທ່ານ ແກ້ວ​ວິ​ໄລ ໄຊ​ຍະ​ບຸດ', NULL, '2018', 'IMG.pdf'),
(22, 'stat_religion_2018_10_12_083610.pdf', 1, 30, 9, 2, '2018-10-12 08:36:10', '2018-04-09 00:00:00', '01/ພ​ພນ/ຄມ', '​ທ່ານ ແກ້ວ​ວິ​ໄລ ໄຊ​ຍະ​ບຸດ', NULL, '2018', 'IMG2.pdf'),
(23, 'stat_religion_teacher_2018_10_12_083919.pdf', 1, 30, 10, 2, '2018-10-12 08:39:19', '2018-04-09 00:00:00', '01/ພ​ພນ/ຄມ', '​ທ່ານ ແກ້ວ​ວິ​ໄລ ໄຊ​ຍະ​ບຸດ', NULL, '2018', 'IMG3.pdf'),
(24, 'stat_religion_place_2018_10_12_084545.pdf', 1, 30, 11, 2, '2018-10-12 08:45:45', '2018-04-09 00:00:00', '01/ພ​ພນ/ຄມ', '​ທ່ານ ແກ້ວ​ວິ​ໄລ ໄຊ​ຍະ​ບຸດ', NULL, '2018', 'IMG4.pdf'),
(71, 'stat_local_admin_2018_10_16_043931.jpeg', 0, 30, 12, 2, '2018-10-16 04:39:31', '2018-05-16 00:00:00', '01/ພ​ພນ', 'undefined', NULL, '2018', 'WhatsApp Image 2018-10-16 at 09.34.20.jpeg'),
(71, 'stat_local_admin_2018_10_19_052434.jpeg', 1, 29, 13, 2, '2018-10-19 05:24:34', '2018-10-08 00:00:00', '758', 'ຂະແໜງປົກຄອງ-ແຜນທີ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.12(1).jpeg'),
(25, 'stat_ethnic_2018_10_19_053107.jpeg', 1, 29, 14, 2, '2018-10-19 05:31:07', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ, ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.14.jpeg'),
(22, 'stat_religion_2018_10_19_053501.jpeg', 1, 29, 15, 2, '2018-10-19 05:35:01', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.14(2).jpeg'),
(22, 'stat_religion_2018_10_19_053807.jpeg', 1, 29, 16, 2, '2018-10-19 05:38:07', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.14.jpeg'),
(23, 'stat_religion_teacher_2018_10_19_054008.jpeg', 1, 29, 17, 2, '2018-10-19 05:40:08', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາດສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.13.jpeg'),
(24, 'stat_religion_place_2018_10_19_054345.jpeg', 1, 29, 18, 2, '2018-10-19 05:43:45', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງຜົນລະເມືອງ,ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.13.jpeg'),
(22, 'stat_religion_2018_10_19_054510.jpeg', 1, 29, 19, 2, '2018-10-19 05:45:10', '2018-10-16 00:00:00', '778', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.13(1).jpeg'),
(24, 'stat_religion_place_2018_10_19_054710.jpeg', 1, 29, 20, 2, '2018-10-19 05:47:10', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງຜົນລະເມືອງ,ຊົນເຜົ່າ-ສາດສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.13.jpeg'),
(23, 'stat_religion_teacher_2018_10_19_054858.jpeg', 1, 29, 21, 2, '2018-10-19 05:48:58', '2018-10-16 00:00:00', '788', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາດສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.12(2).jpeg'),
(56, 'stat_population_movement_2018_10_19_055127.jpeg', 1, 29, 22, 2, '2018-10-19 05:51:27', '2018-03-20 00:00:00', '1', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ,ຊົນເຜົ່າ-ສາສະໜາ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 08.25.12.jpeg'),
(446, 'stat_officer_province_2018_10_19_055605.jpeg', 1, 29, 23, 2, '2018-10-19 05:56:05', '2018-10-19 00:00:00', '1', 'ຂະແໜງຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 10.50.22.jpeg'),
(446, 'stat_officer_province_2018_10_19_055932.jpeg', 1, 29, 24, 2, '2018-10-19 05:59:32', '2018-10-19 00:00:00', '1', 'ຂະແໜງຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ', NULL, '2018', 'WhatsApp Image 2018-10-19 at 10.54.25.jpeg'),
(25, 'stat_ethnic_2018_10_26_105547.jpg', 0, 30, 25, 2, '2018-10-26 10:55:47', '2018-04-09 00:00:00', '1', 'ຂະ​ແໜງ​ຄຸ້ມ​ຄອງ​ພົນ​ລະ​ເມືອງ ແລະ ຊົນ​ເຜົ່າ-ສາ​ສະ​ໜາ', NULL, '2018', 'IMG.jpg'),
(24, 'stat_religion_place_2018_10_26_105818.jpg', 0, 30, 26, 2, '2018-10-26 10:58:18', '2018-04-09 00:00:00', '1', 'ຂະ​ແໜງ​ຄຸ້ມ​ຄອງ​ພົນ​ລະ​ເມືອງ ແລະ ຊົນ​ເຜົ່າ-ສາ​ສະ​ໜາ', NULL, '2018', 'IMG_0001.jpg'),
(23, 'stat_religion_teacher_2018_10_26_110050.jpg', 0, 30, 27, 2, '2018-10-26 11:00:50', '2018-04-09 00:00:00', '1', 'ຂະ​ແໜງ​ຄຸ້ມ​ຄອງ​ພົນ​ລະ​ເມືອງ ແລະ ຊົນ​ເຜົ່າ-ສາ​ສະ​ໜາ', NULL, '2018', 'IMG_0002.jpg'),
(22, 'stat_religion_2018_10_26_110857.jpg', 0, 30, 28, 2, '2018-10-26 11:08:57', '2018-04-09 00:00:00', '1', 'ຂະ​ແໜງ​ຄຸ້ມ​ຄອງ​ພົນ​ລະ​ເມືອງ ແລະ ຊົນ​ເຜົ່າ-ສາ​ສະ​ໜາ', NULL, '2018', 'IMG_0003.jpg'),
(56, 'stat_population_movement_2018_10_26_111053.jpg', 0, 30, 29, 2, '2018-10-26 11:10:53', '2018-04-09 00:00:00', '1', 'ຂະ​ແໜງ​ຄຸ້ມ​ຄອງ​ພົນ​ລະ​ເມືອງ ແລະ ຊົນ​ເຜົ່າ-ສາ​ສະ​ໜາ', NULL, '2018', 'IMG_0004.jpg'),
(71, 'stat_local_admin_2019_04_26_101344.jpeg', 1, 29, 30, 3, '2019-04-26 10:13:44', '2019-01-10 00:00:00', '40', 'ຂະແໜງປົກຄອງ', NULL, '2019', 'WhatsApp Image 2019-04-26 at 14.59.13(1).jpeg'),
(446, 'stat_officer_province_2019_04_26_101721.jpeg', 1, 29, 31, 3, '2019-04-26 10:17:21', '2019-01-14 00:00:00', '053', 'ຂະແໜງຄຸ່ມຄອງພະນັກງານ', NULL, '2019', 'WhatsApp Image 2019-04-26 at 14.59.12.jpeg'),
(446, 'stat_officer_province_2019_04_26_101913.jpeg', 1, 29, 32, 3, '2019-04-26 10:19:13', '2019-01-14 00:00:00', '053', 'ຂະແໜງຄຸ້ມຄອງພະນັກງານ', NULL, '2019', 'WhatsApp Image 2019-04-26 at 14.59.13.jpeg'),
(56, 'stat_population_movement_2019_05_17_085348.jpg', 1, 30, 33, 3, '2019-05-17 08:53:48', '2019-01-21 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນ', NULL, '2019', 'phonlamueang.jpg'),
(24, 'stat_religion_place_2019_05_17_085758.pdf', 1, 30, 34, 3, '2019-05-17 08:57:58', '2019-01-21 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນ', NULL, '2019', 'sasanasatharn.pdf'),
(23, 'stat_religion_teacher_2019_05_17_090106.pdf', 1, 30, 35, 3, '2019-05-17 09:01:06', '2019-01-21 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນ', NULL, '2019', 'phasong.pdf'),
(22, 'stat_religion_2019_05_17_090537.pdf', 1, 30, 36, 3, '2019-05-17 09:05:37', '2019-01-21 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນແຂວງ', NULL, '2019', 'zueathuesasana.pdf'),
(25, 'stat_ethnic_2019_05_17_091327.pdf', 0, 30, 37, 3, '2019-05-17 09:13:27', '2019-01-21 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນ', NULL, '2019', 'zonphao.pdf'),
(446, 'stat_officer_province_2019_05_19_084614.pdf', 0, 30, 38, 2, '2019-05-19 08:46:14', '2019-04-23 00:00:00', '01/ພນ/ຄມ', 'ພະແນກພາຍໃນ', NULL, '2019', 'Binder1.pdf'),
(56, 'stat_population_movement_2019_05_20_060218.jpeg', 1, 29, 39, 3, '2019-05-20 06:02:18', '2019-05-13 00:00:00', '378/ພພນ.ຂບຊ', 'ຂະແໜງຄຸ້ມຄອງພົນລິເມືອງ', NULL, '2019', 'WhatsApp Image 2019-05-14 at 8.10.31 AM.jpeg'),
(22, 'stat_religion_2019_05_20_061400.jpeg', 1, 29, 40, 3, '2019-05-20 06:14:00', '2019-05-17 00:00:00', '396/ພພນ.ຂບຊ', 'ຂະແໜງຜົນເຜົ່າສາສະໜາ-ຊົນເຜົ່າ', NULL, '2019', 'WhatsApp Image 2019-05-20 at 10.58.31 AM(1).jpeg'),
(22, 'stat_religion_2019_05_20_061703.jpeg', 1, 29, 41, 3, '2019-05-20 06:17:03', '2019-05-17 00:00:00', '369', 'ຂະແໜງຊົນເຜົ່າ-ສາສະໜາ', NULL, '2019', 'WhatsApp Image 2019-05-20 at 10.58.31 AM.jpeg'),
(24, 'stat_religion_place_2019_05_20_062139.jpeg', 1, 29, 42, 3, '2019-05-20 06:21:39', '2019-05-17 00:00:00', '396', 'ຂະແໜງຊົນເຜົ່າ-ສາສະໜາ', NULL, '2019', 'WhatsApp Image 2019-05-20 at 10.58.31 AM(1).jpeg'),
(23, 'stat_religion_teacher_2019_05_20_062407.jpeg', 1, 29, 43, 3, '2019-05-20 06:24:08', '2019-05-17 00:00:00', '396', 'ຂະແໜງຊົນເຜົ່າ-ສາສະໜາ', NULL, '2019', 'WhatsApp Image 2019-05-20 at 10.58.32 AM.jpeg'),
(56, 'stat_population_movement_2019_05_27_042723.jpeg', 1, 29, 44, 3, '2019-05-27 04:27:23', '2019-05-17 00:00:00', '396', 'ພະແນກພາຍໃນ', NULL, '2019', 'WhatsApp Image 2019-05-27 at 9.11.36 AM(1).jpeg'),
(22, 'stat_religion_2019_05_27_042910.jpeg', 1, 29, 45, 3, '2019-05-27 04:29:10', '2019-05-17 00:00:00', '369', 'ພະແນກພາຍໃນ', NULL, '2019', 'WhatsApp Image 2019-05-27 at 9.11.36 AM.jpeg'),
(22, 'stat_religion_2019_05_27_043301.jpeg', 0, 29, 46, 3, '2019-05-27 04:33:01', '2019-05-17 00:00:00', '396', 'ພະແນກພາຍໃນ', NULL, '2019', 'WhatsApp Image 2019-05-27 at 9.11.36 AM(1).jpeg'),
(24, 'stat_religion_place_2019_05_27_043659.jpeg', 0, 29, 47, 3, '2019-05-27 04:36:59', '2019-05-17 00:00:00', '396', 'ພະແນກພາຍໃນ', NULL, '2019', 'WhatsApp Image 2019-05-27 at 9.11.37 AM(1).jpeg'),
(23, 'stat_religion_teacher_2019_05_27_043934.jpeg', 0, 29, 48, 3, '2019-05-27 04:39:34', '2019-05-17 00:00:00', '396', 'ພະແນກພາຍໃນ', NULL, '2019', 'WhatsApp Image 2019-05-27 at 9.11.37 AM.jpeg'),
(71, 'stat_local_admin_2019_07_29_041018.jpg', 1, 30, 49, 3, '2019-07-29 04:10:18', '2019-07-29 00:00:00', '01/ພນ.ຄມ', 'ຂະແໜງປົກຄອງ-ແຜນທີ່', NULL, '2019', 'IMG.jpg'),
(71, 'stat_local_admin_2019_07_29_041046.jpg', 1, 30, 50, 3, '2019-07-29 04:10:46', '2019-07-29 00:00:00', '01/ພນ.ຄມ', 'ຂະແໜງປົກຄອງ-ແຜນທີ່', NULL, '2019', 'IMG_0001.jpg'),
(71, 'stat_local_admin_2019_07_29_041330.jpg', 0, 30, 51, 3, '2019-07-29 04:13:30', '2019-06-27 00:00:00', '01/ພນ.ຄມ', 'ຂະແໜງປົກຄອງ-ແຜນທີ່', NULL, '2019', 'IMG.jpg'),
(71, 'stat_local_admin_2019_07_29_041358.jpg', 0, 30, 52, 3, '2019-07-29 04:13:58', '2019-06-27 00:00:00', '01/ພນ.ຄມ', 'ຂະແໜງປົກຄອງ-ແຜນທີ່', NULL, '2019', 'IMG_0001.jpg'),
(56, 'stat_population_movement_2019_11_11_042502.jpg', 0, 30, 53, 3, '2019-11-11 04:25:02', '2019-01-21 00:00:00', '01/ພນ.ຄມ', 'ຂະແໜງຄຸ້ມຄອງພົນລະເມືອງ', NULL, '2019', 'ສະຖິຕິພົນລະເມືອງ ຊົນເຜົ່າ-ສາສະໜາ 2018.jpg'),
(71, 'stat_local_admin_2019_11_20_161640.jpg', 1, 1, 54, 2, '2019-11-20 16:16:40', '2019-11-20 00:00:00', '123', '22222', NULL, '2019', 'photo_2019-11-11_09-38-04.jpg'),
(446, 'stat_officer_province_2020_03_16_043642.jpeg', 1, 29, 55, 4, '2020-03-16 04:36:42', '2020-03-13 00:00:00', '03/ພພນ.ຂບຊ', 'ພະແນກພາຍໃນແຂວງ', NULL, '2020', 'WhatsApp Image 2020-03-13 at 11.32.18.jpeg'),
(446, 'stat_officer_province_2020_03_16_043914.jpeg', 0, 29, 56, 4, '2020-03-16 04:39:14', '2020-03-13 00:00:00', '03/ພພນ.ຂບຊ', 'ພະແນກພາຍໃນແຂວງ', NULL, '2020', 'WhatsApp Image 2020-03-16 at 10.17.38 (1).jpeg'),
(446, 'stat_officer_province_2020_03_16_044035.jpeg', 1, 29, 57, 4, '2020-03-16 04:40:35', '2020-03-13 00:00:00', '03/ພພນ.ຂບຊ', 'ພະແນກພາຍໃນ', NULL, '2020', 'WhatsApp Image 2020-03-16 at 10.17.38.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `award`
--

INSERT INTO `award` (`id`, `name`, `deleted`, `user_id`, `position`) VALUES
(1, 'ຜົນງານ 70 ປີ ວັນສ້າງຕັ້ງ', 0, 2, 1),
(2, 'ພັດທະນາການສຶກສາ ແລະ ກິລາ', 0, 2, NULL),
(3, 'ຜົນງານ 35 ປີ', 0, 2, NULL),
(4, 'ຜົນງານ 60 ປີ ວັນສ້າງຕັ້ງ', 0, 2, NULL),
(5, 'ບັ້ນ 3 ສ້າງ', 0, 2, NULL),
(6, 'ບັ້ນຕ່າງໆ', 0, 2, NULL),
(7, 'ປະເພດຫຼຽນໄຊ', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`code`, `value`) VALUES
('EMAIL', 'info@moha.gov.la'),
('LAT', '17.972369'),
('LON', '102.617242'),
('MAPZOOM', '15'),
('TELEPHONE', '021 212454'),
('WEBSITE', 'www.moha.gov.la\r\n'),
('ADDRESS', 'ເຂດສຳນັກງານນາຍົກລັດຖະມົນຕີ, ບ້ານ ສີສະຫວາດ, ເມືອງ ຈັນທະບູລີ ນະຄອນຫຼວງວຽງຈັນ, ຕູ້ ປ.ນ 6376');

-- --------------------------------------------------------

--
-- Table structure for table `controller`
--

CREATE TABLE `controller` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id` int(11) NOT NULL,
  `district_code` varchar(20) NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `record_status` varchar(1) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `ethnic` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(49, 'ຫໍ້', 49, 0),
(50, 'ບຣູ', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `foundation`
--

CREATE TABLE `foundation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `approved_date` datetime NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `approved_by_moha` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `goverment_level`
--

CREATE TABLE `goverment_level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `goverment_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legal`
--

CREATE TABLE `legal` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `legal_type_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(38, 'ແຈ້ງການກ່ຽວກັບລາຍງານ ສະພາບກັນປັບປຸງສັບຂ້ອນວຽກງານຂອງຂະແໜງການພາຍໃນ', 0, 7, NULL),
(39, 'ດຳລັດວ່າດ້ວຍຕໍາແໜ່ງວິຊາການຂອງລັດຖະກອນ', 0, 1, 4),
(40, 'ດຳລັດວ່າດ້ວຍຕຳແໜ່ງບໍລິຫານຂອງພະນັກງານ-ລັດຖະກອນ (ສະບັບປັບປຸງ)', 0, 1, 4),
(41, 'ດຳລັດວ່າດ້ວຍວັນພັກ', 0, 1, 4),
(42, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງນະຄອນ', 0, 1, 4),
(43, 'ດຳລັດວ່າດ້ວຍການປະສານງານລະຫວ່າງບັນດາກະຊວງ, ອົງການລັດທຽບເທົ່າກະຊວງ, ແຂວງ, ນະຄອນຫຼວງກັບສຳນັກງານນາຍົກລັດຖະມົນຕີ', 0, 1, 4),
(44, 'ຄຳສັ່ງວ່າດ້ວຍການປັບປຸງຄຸນນະພາບການເຄື່ອນໄຫວ ຂອງກົມຈັດຕັ້ງ ແລະ ການບັນຈຸລັດຖະກອນໃໝ່', 0, 3, 4),
(45, 'ຂໍ້ຕົກລົງ ວ່າດ້ວຍການປະຕິບັດພັນທະ ແລະ ການປະກອບສ່ວນຂອງປະຊາຊົນໃນການພັດທະນາບ້ານ', 0, 4, 4),
(46, 'ຄຳແນະນຳຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ກ່ຽວກັບການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຫ້ອງວ່າການຂັ້ນແຂວງ ແລະ ຂັ້ນເມືອງ', 0, 6, 4),
(47, 'ຄຳແນະນຳ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ສະບັບເລກທີ 34/ນຍ, ລົງວັນທີ 23 ສິງຫາ 2016 ກ່ຽວກັບການຈັດຕັ້ງປະຕິບັດຄຳສັ່ງຂອງນາຍົກລັດຖະມົນຕີວ່າດ້ວຍທິດທາງ,​ເປົ້າໝາຍ ແລະ ມາດຕະການສ້າງແຂວງເປັນຫົວໜ່ວຍຍຸດທະສາດ, ສ້າງເມືອງເປັນໜ່ວຍເຂັ້ມແຂງຮອບດ້ານ, ສ້າງບ້ານເປັນຫົວໜ່ວຍພັດທະນາ', 0, 6, 4),
(48, 'ຄຳແນະນຳ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ກ່ຽວກັບການເກັບກຳສະຖິຕິພົນລະເມືອງ', 0, 6, 4),
(49, 'ຄຳແນະນຳການຈັດຕັ້ງປະຕິບັດດຳລັດວ່າດ້ວຍສະມາຄົມ', 0, 6, 4),
(50, 'ແຈ້ງການ ກ່ຽວກັບການກຳນົດກົງຈັກການຈັດຕັ້ງເຂົ້າໃນກົດໝາຍ ຫຼື ດຳລັດ', 0, 8, 4),
(51, 'ແຈ້ງການກ່ຽວກັບ ການອອກຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງພະແນກ, ອົງການລັດທຽບເທົ່າພະແນກຂັ້ນແຂວງ ແລະ ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຫ້ອງການ, ອົງການລັດທຽບເທົ່າຫ້ອງການຂັ້ນເມືອງ', 0, 8, 4),
(52, 'ແຈ້ງການກ່ຽວກັບ ສືບຕໍ່ຜັນຂະຫຍາຍຄຳສັ່ງຂອງນາຍົກລັດຖະມົນຕີ ວ່າດ້ວຍການປັບປຸງຄຸນນະພາບການເຄື່ອນໄຫວຂອງຫ້ອງການ, ອົງການລັດທຽບເທົ່າຫ້ອງການຂັ້ນເມືອງ', 0, 8, 4),
(53, 'ແຈ້ງການ ກ່ຽວກັບການສືບຕໍ່ຜັນຂະຫຍາຍຄຳສັ່ງຂອງນາຍົກລັດຖະມົນຕີ ວ່າດ້ວຍການປັບປຸງຄຸນນະພາບການເຄື່ອນໄຫວຂອງກົງຈັກການຈັດຕັ້ງ ແລະ ການບັນຈຸລັດຖະກອນໃໝ່', 0, 8, 4),
(54, 'ແຈ້ງການກ່ຽວກັບ ການລາຍງານສະພາບການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຂະແໜງການຕົນ', 0, 8, 4),
(55, 'ແຈ້ງການກ່ຽວກັບ ການລາຍງານສະພາບການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຂະແໜງການຕົນ', 0, 8, 4);

-- --------------------------------------------------------

--
-- Table structure for table `legal_status`
--

CREATE TABLE `legal_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `legal_type`
--

CREATE TABLE `legal_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(7, 'ລະບຽບການຕ່າງໆ', 0, 7),
(8, 'ແຈ້ງການ', 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`id`, `name`, `url`) VALUES
(8, 'ສະພາແຫ່ງຊາດ', 'http://www.na.gov.la'),
(4, 'ລັດຖະບານແຫ່ງ ສປປ ລາວ', 'http://www.laogov.gov.la'),
(5, 'ກະຊວງພາຍໃນ', 'http://www.moha.gov.la/'),
(6, 'ກະຊວງຍຸຕິທຳ', 'http://www.moj.gov.la/'),
(7, 'ສູນສະຖິຕິແຫ່ງຊາດ', 'https://www.lsb.gov.la'),
(9, 'ທະນາຄານແຫ່ງ ສປປ ລາວ', 'http://www.bol.gov.la');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `menugroup_id` int(11) DEFAULT NULL,
  `menu_parent_id` int(11) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `position` int(11) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `has_province` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `url`, `icon`, `description`, `deleted`, `menugroup_id`, `menu_parent_id`, `input_id`, `input_dt_stamp`, `position`, `table_name`, `has_province`) VALUES
(1, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', NULL, NULL, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 0, NULL, 3, NULL, '2017-09-03 18:41:53', 14, NULL, NULL),
(2, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 'stat-officer-salary', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 0, NULL, 1, NULL, '2017-09-03 18:45:05', 1, 'stat_officer_salary', NULL),
(3, 'ປ້ອນຂໍ້ມູນ', '#', NULL, 'ປ້ອນຂໍ້ມູນ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 2, '#', NULL),
(13, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', NULL, NULL, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', 0, NULL, 3, NULL, '2017-09-03 18:45:38', 6, NULL, NULL),
(14, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 'stat-course', NULL, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 0, NULL, 13, NULL, '2017-09-03 18:47:12', 1, 'stat_course', NULL),
(21, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', NULL, NULL, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', 0, NULL, 3, NULL, '2017-09-03 18:47:24', 3, NULL, NULL),
(22, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 'stat-religion', NULL, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 2, 'stat_religion', 1),
(23, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 'stat-religion-teacher', NULL, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 3, 'stat_religion_teacher', 1),
(24, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 'stat-religion-place', NULL, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 4, 'stat_religion_place', 1),
(25, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 'stat-ethnic', NULL, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 1, 'stat_ethnic', 1),
(27, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', NULL, NULL, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 18:49:19', 6, NULL, NULL),
(54, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', NULL, NULL, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', 0, NULL, 3, NULL, '2017-09-03 18:50:38', 4, NULL, NULL),
(56, 'ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ', 'stat-population-movement', NULL, 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ', 0, NULL, 54, NULL, '2017-09-03 18:51:25', 1, 'stat_population_movement', 1),
(57, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 'stat-population-movement-chart', NULL, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 1, NULL, 54, NULL, '2017-09-03 18:51:25', 2, 'stat_population_movement_chart', NULL),
(67, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', NULL, NULL, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', 0, NULL, 3, NULL, '2017-09-03 18:51:37', 2, NULL, NULL),
(71, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 'stat-local-admin', NULL, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 0, NULL, 67, NULL, '2017-09-03 18:52:20', NULL, 'stat_local_admin', 1),
(79, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', NULL, NULL, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', 0, NULL, 3, NULL, '2017-09-03 18:52:28', 1, NULL, NULL),
(80, 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ', 'ministry', NULL, 'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 1, 'ministry', NULL),
(81, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 'stat-goverment-unit', NULL, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 2, 'stat_goverment_unit', NULL),
(82, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 'stat-legal', NULL, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 4, 'stat_legal', NULL),
(83, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 'stat-single-gateway-implementation', NULL, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 0, NULL, 67, NULL, '2017-09-03 18:53:04', 3, 'stat_single_gateway_implementation', NULL),
(84, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 'stat-association-foundation', NULL, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 5, 'stat_association_foundation', NULL),
(86, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', '', NULL, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:53:18', 7, '', NULL),
(87, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 'stat-copy', NULL, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 2, 'stat_copy', NULL),
(88, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 'stat-document', NULL, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 1, 'stat_document', NULL),
(89, 'ກົມແຜນທີ່ແຫ່ງຊາດ', NULL, NULL, 'ກົມແຜນທີ່ແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:54:01', 10, NULL, NULL),
(90, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 'stat-explore', NULL, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 3, 'stat_explore', 1),
(91, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 'stat-map-service', NULL, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 1, 'stat_map_service', NULL),
(92, 'ສະຖິຕິການຜະລິດແຜນທີ່', 'stat-map-produce', NULL, 'ສະຖິຕິການຜະລິດແຜນທີ່', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 2, 'stat_map_produce', NULL),
(93, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', NULL, NULL, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', 0, NULL, 3, NULL, '2017-09-03 18:55:01', 11, NULL, NULL),
(94, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 'stat-explore', NULL, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 0, NULL, 93, NULL, '2017-09-03 18:55:28', NULL, 'stat_explore', 1),
(95, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', NULL, NULL, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 0, NULL, 3, NULL, '2017-09-03 18:55:29', 8, NULL, NULL),
(96, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victorycoin-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 1, 'stat_victorycoin_province', 1),
(97, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 'stat-govcoin-province', NULL, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 2, 'stat_govcoin_province', 1),
(98, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govcoin-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 3, 'stat_govcoin_ministry', NULL),
(99, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-victoryoversea-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 4, 'stat_victoryoversea_ministry', NULL),
(100, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highcoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 5, 'stat_highcoin_ministry', NULL),
(101, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highoversea-ministry', NULL, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 6, 'stat_highoversea_ministry', NULL),
(102, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govoversea-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 10, 'stat_govoversea_ministry', NULL),
(103, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victoryoversea-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 8, 'stat_victoryoversea_province', 1),
(104, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 'stat-hornorcoin-province', NULL, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 9, 'stat_hornorcoin_province', 1),
(105, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 'stat-victorycoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 7, 'stat_victorycoin_ministry', NULL),
(106, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', NULL, NULL, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 0, NULL, 3, NULL, '2017-09-03 19:00:17', 13, NULL, NULL),
(109, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', NULL, NULL, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 19:01:13', 5, NULL, NULL),
(110, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 'stat-officer', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 0, NULL, 109, NULL, '2017-09-03 19:05:41', 1, 'stat_officer', 1),
(111, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 'stat-officer-need', NULL, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 0, NULL, 109, NULL, '2017-09-03 19:06:06', 7, 'stat_officer_need', 1),
(112, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 'stat-officer-degree', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 3, 'stat_officer_degree', 1),
(113, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age', NULL, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 2, 'stat_officer_age', 1),
(114, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-org', NULL, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 10, 'stat_officer_org', 1),
(115, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-officer-position', NULL, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 6, 'stat_officer_position', 1),
(116, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 'stat-officer-add', NULL, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 5, 'stat_officer_add', 1),
(117, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-officer-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 4, 'stat_officer_resign', 1),
(118, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 'stat-officer-contract', NULL, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 6, 'stat_officer_contract', 1),
(119, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 'stat-officer-ministry', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 0, NULL, 109, NULL, '2017-09-03 19:10:18', 8, 'stat_officer_ministry', 1),
(120, 'ຫ້ອງການກະຊວງ', NULL, NULL, 'ຫ້ອງການກະຊວງ', 1, NULL, 3, NULL, '2017-09-19 08:37:26', 12, NULL, NULL),
(122, 'ກົມກວດກາ', NULL, NULL, 'ກົມກວດກາ', 1, NULL, 3, NULL, '2017-09-19 08:43:44', 15, NULL, NULL),
(441, 'ຜູ້ໃຊ້ລະບົບ', 'user/manageuser', NULL, 'ຜູ້ໃຊ້ລະບົບ', 0, NULL, 0, NULL, '2017-09-19 09:25:56', 5, 'user/manageuser', NULL),
(442, 'ການກໍານົດສິດ', 'user/managerole', NULL, 'ການກໍານົດສິດ', 0, NULL, 0, NULL, '2017-09-19 09:27:25', 5, 'user/managerole', NULL),
(443, 'ຕັ້ງຄ່າ', NULL, NULL, 'ຕັ້ງຄ່າ', 0, NULL, 0, NULL, '2017-09-19 09:27:34', 6, NULL, NULL),
(444, 'ປີ', 'phiscal-year', 'fa fa-circle-o', 'ປີ', 0, 1, 443, 1, '2017-09-19 09:27:34', 1, 'phiscal_year', NULL),
(445, 'ແປຄຳສັບ', 'message', '', 'ແປຄຳສັບ', 0, 1, 443, 1, '2017-09-19 09:27:34', 99, 'message', NULL),
(446, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 'stat-officer-province', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 0, NULL, 109, NULL, '2017-09-25 19:11:04', 11, 'stat_officer_province', 1),
(447, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 'stat-officer-ministry-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 0, NULL, 109, NULL, '2017-09-25 19:16:43', 12, 'stat_officer_ministry_add', 1),
(448, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-organisation-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-25 19:18:36', 13, 'stat_officer_organisation_add', 1),
(449, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 'stat-officer-province-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 0, NULL, 109, NULL, '2017-09-25 19:19:33', 14, 'stat_officer_province_add', 1),
(450, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:22:58', 1, 'stat_officer_ministry_train', NULL),
(451, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-organisation-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:24:15', 2, 'stat_officer_organisation_train', NULL),
(452, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:25:30', 3, 'stat_officer_province_train', 1),
(453, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:27:21', 4, 'stat_officer_ministry_upgrade', NULL),
(454, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-organisation-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:28:50', 5, 'stat_officer_organisation_upgrade', NULL),
(457, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:29:59', 6, 'stat_officer_province_upgrade', 1),
(458, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 'stat-institute-train', NULL, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 0, NULL, 13, NULL, '2017-09-25 19:33:51', 2, 'stat_institute_train', NULL),
(460, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 'stat-institute-meeting', NULL, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 0, NULL, 13, NULL, '2017-09-25 19:37:21', 3, 'stat_institute_meeting', NULL),
(461, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 'stat-research', NULL, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 0, NULL, 13, NULL, '2017-09-25 19:39:45', 4, 'stat_research', NULL),
(462, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-govoversea-province', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-25 19:59:15', 11, 'stat_govoversea_province', 1),
(463, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 'stat-investment', NULL, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 0, NULL, 89, NULL, '2017-09-25 20:05:03', 4, 'stat_investment', NULL),
(464, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 'stat-officer-technical', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 0, NULL, 1, NULL, '2017-09-25 20:09:25', 2, 'stat_officer_technical', NULL),
(465, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age-level', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 1, NULL, '2017-09-25 20:11:26', 3, 'stat_officer_age_level', NULL),
(466, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 'stat-officer-ethnic', NULL, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 0, NULL, 1, NULL, '2017-09-25 20:12:20', 3, 'stat_officer_ethnic', NULL),
(467, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-position', NULL, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:14:05', 4, 'stat_position', NULL),
(469, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 'stat-officer-new', NULL, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:04', 5, 'stat_officer_new', NULL),
(471, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:59', 6, 'stat_resign', NULL),
(472, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 'stat-contract', NULL, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 0, NULL, 1, NULL, '2017-09-25 20:16:26', 6, 'stat_contract', NULL),
(473, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 'stat-oda', NULL, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 0, NULL, 106, NULL, '2017-09-25 20:17:01', 7, 'stat_oda', NULL),
(476, 'ຊົນເຜົ່າ', 'ethnic', 'fa fa-circle-o', 'ຊົນເຜົ່າ', 0, 1, 443, 1, '2017-09-19 09:27:34', 3, 'ethnic', NULL),
(477, 'ແຂວງ', 'province', 'fa fa-circle-o', 'ແຂວງ', 0, 1, 443, 1, '2017-09-19 09:27:34', 2, 'province', NULL),
(478, 'ຜູ້ອະນຸມັດ ມູນນິທິ', 'approver', 'fa fa-circle-o', 'ຜູ້ອະນຸມັດ ມູນນິທິ', 0, 1, 443, 1, '2017-09-19 09:27:34', 4, 'approver', NULL),
(479, 'ຍ້ອງຍໍຜົນງານ', 'award', 'fa fa-circle-o', 'ຍ້ອງຍໍຜົນງານ', 0, 1, 443, 1, '2017-09-19 09:27:34', 5, 'award', NULL),
(480, ' ເອກະສານປະເພດປຶ້ມ', 'book', 'fa fa-circle-o', ' ເອກະສານປະເພດປຶ້ມ', 0, 1, 443, 1, '2017-09-19 09:27:34', 6, 'book', NULL),
(481, 'ປະເພດນິຕິກຳ', 'legal-type', 'fa fa-circle-o', 'ປະເພດນິຕິກຳ', 0, 1, 443, 1, '2017-09-19 09:27:34', 7, 'legal_type', NULL),
(482, 'ນິຕິກຳ', 'legal', 'fa fa-circle-o', 'ນິຕິກຳ', 0, 1, 443, 1, '2017-09-19 09:27:34', 8, 'legal', NULL),
(483, 'ໜ້າທໍາອິດ', 'site/index', 'fas fa-home', 'ໜ້າທໍາອິດ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 1, '#', 1),
(484, 'ລາຍງານ', '#', 'fas fa-home', 'ລາຍງານ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 3, '#', NULL),
(485, 'ບັນດາຂໍ້ມູນ', 'notice/index', NULL, 'ບັນດາຂໍ້ມູນ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 6, '#', NULL),
(486, 'ຕິດຕໍ່ພວກເຮົາ', 'site/contact', NULL, 'ຕິດຕໍ່ພວກເຮົາ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 4, '#', 1),
(487, 'ແກ້ໄຂຂໍ້ມູນຕິດຕໍ່', 'content/index', NULL, 'ແກ້ໄຂຂໍ້ມູນຕິດຕໍ່', 0, NULL, 443, 1, '2017-09-25 20:17:01', 7, '#', NULL),
(489, 'ຂໍ້ມູນເຊື່ອມຕໍ່ພາຍນອກ', 'link/index', NULL, 'ເຊື່ອມຕໍ່ພາຍນອກ', 0, NULL, 443, 1, '2017-09-25 20:17:01', 2, 'link', NULL),
(490, 'ເຊື່ອມຕໍ່ພາຍນອກ', 'site/links', NULL, 'ເຊື່ອມຕໍ່ພາຍນອກ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 4, 'link', 1),
(491, 'ລາຍງານສະຖິຕິທັງໝົດ', 'report/index', NULL, 'ລາຍງານສະຖິຕິທັງໝົດ', 0, NULL, 484, 1, '2017-09-25 20:17:01', 1, '#', 1),
(493, 'ລາຍງານຂໍ້ມູນທີ່ປ້ອນສຳເລັດແລ້ວ', 'report/complete', NULL, 'ລາຍງານຂໍ້ມູນທີ່ປ້ອນສຳເລັດແລ້ວ', 0, NULL, 484, 1, '2017-09-25 20:17:01', 1, '#', 1),
(494, 'ລາຍງານຂໍ້ມູນທີ່ບໍ່ທັນສໍາເລັດ', 'report/incomplete', NULL, 'ລາຍງານຂໍ້ມູນທີ່ບໍ່ທັນສໍາເລັດ', 0, NULL, 484, 1, '2017-09-25 20:17:01', 2, '#', 1),
(495, 'ກົມກວດກາ', NULL, NULL, 'ກົມກວດກາ', 0, NULL, 3, NULL, '2017-09-03 18:52:28', 14, NULL, NULL),
(496, 'ຫ້ອງການກະຊວງ', NULL, NULL, 'ຫ້ອງການກະຊວງ', 0, NULL, 3, NULL, '2017-09-03 18:52:28', 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menugroup`
--

CREATE TABLE `menugroup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `language` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `language`, `translation`) VALUES
(2, 'la-LA', 'ເພີ່ມ'),
(8, 'la-LA', 'ຂໍ້ຄວາມ'),
(10, 'la-LA', 'ເພີ່ມ'),
(11, 'la-LA', NULL),
(12, 'la-LA', NULL),
(13, 'la-LA', NULL),
(14, 'la-LA', 'ແອັກຊັ່ນ'),
(16, 'la-LA', ''),
(17, 'la-LA', 'ປ້ອນຂໍ້ມູນໃໝ່'),
(18, 'la-LA', ''),
(19, 'la-LA', ''),
(20, 'la-LA', ''),
(22, 'la-LA', 'asfsdfs'),
(23, 'la-LA', 'safds'),
(24, 'la-LA', 'sfasdf'),
(25, 'la-LA', 'xxxx'),
(28, 'la-LA', 'eee'),
(29, 'la-LA', 'dd'),
(30, 'la-LA', 'gg'),
(32, 'la-LA', 'lpp'),
(33, 'la-LA', ''),
(34, 'la-LA', ''),
(35, 'la-LA', ''),
(36, 'la-LA', 'ທີ່ຢູ່'),
(37, 'la-LA', ''),
(38, 'la-LA', ''),
(39, 'la-LA', 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)'),
(40, 'la-LA', ''),
(41, 'la-LA', ''),
(42, 'la-LA', 'ປີ'),
(43, 'la-LA', 'ວັນທີເລີ່ມ'),
(44, 'la-LA', 'ວັນທີສຳເລັດ'),
(45, 'la-LA', 'ສະຖານະ'),
(46, 'la-LA', 'ປິດ'),
(47, 'la-LA', ''),
(48, 'la-LA', 'ລຶບ'),
(49, 'la-LA', 'ທ່ານຕ້ອງການລຶບຂໍ້ມູນນີ້ບໍ່?'),
(50, 'la-LA', ''),
(51, 'la-LA', 'ວັນທີ'),
(52, 'la-LA', 'ປີ'),
(53, 'la-LA', ''),
(54, 'la-LA', ''),
(55, 'la-LA', 'ກະຊວງ'),
(56, 'la-LA', ''),
(57, 'la-LA', ''),
(58, 'la-LA', ''),
(59, 'la-LA', ''),
(60, 'la-LA', 'ປ້ອນຂໍ້ມູນໃໝ່'),
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
(73, 'la-LA', 'ລະຫັດຜ່ານ'),
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
(105, 'la-LA', 'ສະຖານບັນ'),
(106, 'la-LA', ''),
(107, 'la-LA', ''),
(108, 'la-LA', ''),
(110, 'la-LA', 'ຫ້ອງການ'),
(111, 'la-LA', 'ຈັດລໍາດັບ'),
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
(135, 'la-LA', 'ໄອດີຜູ້ອານຸມັດ'),
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
(149, 'la-LA', 'ສະມາຄົມ'),
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
(257, 'la-LA', 'ລາອອກ'),
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
(319, 'la-LA', 'ເພີ່ມເຂົ້າ/ເອົາອອກ'),
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
(491, 'la-LA', 'ປະເພດປຶ້ມ'),
(492, 'la-LA', ''),
(493, 'la-LA', ''),
(500, 'la-LA', ''),
(501, 'la-LA', ''),
(502, 'la-LA', 'ການເຄື່ອນໄຫວ'),
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
(704, 'la-LA', 'ຊື່ສິດ'),
(705, 'la-LA', 'ສ້າງວັນທີ / ເວລາ'),
(706, 'la-LA', ''),
(707, 'la-LA', 'ລາຍການເມນູ'),
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
(777, 'la-LA', 'ຊື່ໃຊ້ລະບົບ'),
(778, 'la-LA', 'ຊື່'),
(779, 'la-LA', 'ນາມສະກຸນ'),
(780, 'la-LA', 'ໂທລະສັບ'),
(781, 'la-LA', 'ອີເມວລ'),
(782, 'la-LA', 'ສິດ'),
(783, 'la-LA', ''),
(784, 'la-LA', ''),
(785, 'la-LA', 'ເພີ່ມສິດ'),
(786, 'la-LA', 'ເພີ່ມ'),
(787, 'la-LA', 'ລາຍການຟັງຊັ່ນຕ່າງໆ'),
(788, 'la-LA', 'ຜູ້ໃຊ້ທີ່ຂື້ນກັບ'),
(789, 'la-LA', ''),
(790, 'la-LA', ''),
(804, 'la-LA', ''),
(805, 'la-LA', ''),
(806, 'la-LA', ''),
(807, 'la-LA', 'ສິດຂັ້ນແຂວງບໍ່?'),
(808, 'la-LA', 'ສິດຂັ້ນແຂວງບໍ່?'),
(809, 'la-LA', 'ບັນທຶກສິດ'),
(810, 'la-LA', 'ແກ້ໄຂສິດ'),
(811, 'la-LA', 'ລຶບສິດ'),
(812, 'la-LA', 'ລາຍຊື່ຜູ້ໃຊ້ທີ່ຂື້ນກັບ'),
(813, 'la-LA', 'ບັນດາກົມ'),
(814, 'la-LA', 'ບັນດາແຂວງ'),
(815, 'la-LA', ''),
(816, 'la-LA', 'ເລືອກທັງໝົດ'),
(817, 'la-LA', 'ລາຍຊື່ກົມ'),
(818, 'la-LA', ''),
(819, 'la-LA', 'ບໍ່ໄດ້ຮັບອານຸຍາດ'),
(820, 'la-LA', 'ທ່ານບໍ່ມີສິດເຮັດທຸລະກໍານີ້ໄດ້'),
(821, 'la-LA', 'ທ່ານບໍ່ໄດ້ຮັບອານຸຍາດໃນການເຂົ້າເຖິງຂໍ້ມູນນີ້'),
(822, 'la-LA', 'ກະລູນາຕິດຕໍ່ແອັດມິນ'),
(823, 'la-LA', ''),
(824, 'la-LA', ''),
(825, 'la-LA', ''),
(826, 'la-LA', 'ລາຍຊື່ຜູ້ໃຊ້ທີ່ຂື້ນກັບ'),
(827, 'la-LA', 'ລະຫັດແຂວງ'),
(828, 'la-LA', 'ຊື່ແຂວງ'),
(829, 'la-LA', ''),
(830, 'la-LA', ''),
(831, 'la-LA', ''),
(832, 'la-LA', ''),
(833, 'la-LA', ''),
(834, 'la-LA', ''),
(835, 'la-LA', ''),
(836, 'la-LA', ''),
(837, 'la-LA', ''),
(838, 'la-LA', ''),
(839, 'la-LA', ''),
(840, 'la-LA', 'ສິດແລະໜ້າທີ່'),
(841, 'la-LA', ''),
(844, 'la-LA', 'ຄົ້ນຫາ'),
(845, 'la-LA', 'ຄໍາສັບໃນການຄົ້ນຫາ'),
(846, 'la-LA', 'ສະແດງ'),
(847, 'la-LA', 'ແຖວ'),
(848, 'la-LA', 'ຕໍ່'),
(849, 'la-LA', 'ໜຶ່ງໜ້າ'),
(850, 'la-LA', 'ຂໍອາໄພ , ບໍ່ພົບຂໍ້ມູນໃນການຄົົ້ນຫາ'),
(851, 'la-LA', 'ບໍ່ມີຂໍ້ມູນ'),
(852, 'la-LA', 'ສະແດງ'),
(853, 'la-LA', 'ເຖິງ'),
(854, 'la-LA', 'ຂອງ'),
(855, 'la-LA', 'ທັງໝົດ'),
(856, 'la-LA', 'ຄົ້ນຫາຈາກ'),
(857, 'la-LA', 'ຂໍ້ມູນທັງໝົດ'),
(858, 'la-LA', 'ທໍາອິດ'),
(859, 'la-LA', 'ສຸດທ້າຍ'),
(860, 'la-LA', 'ກ່ອນໜ້າ'),
(861, 'la-LA', 'ຕໍ່ໄປ'),
(862, 'la-LA', 'ກະລູນາປ້ອນຂໍ້ມູນສໍາລັບ'),
(866, 'la-LA', ''),
(867, 'la-LA', ''),
(868, 'la-LA', ''),
(869, 'la-LA', ''),
(870, 'la-LA', 'ຊື່ຕາຕະລາງສະຖິຕິ'),
(871, 'la-LA', ''),
(872, 'la-LA', ''),
(873, 'la-LA', ''),
(874, 'la-LA', 'ລະຫັດຜ່ານ'),
(875, 'la-LA', ''),
(876, 'la-LA', ''),
(877, 'la-LA', ''),
(878, 'la-LA', 'ໜ້າທໍາອິດ'),
(879, 'la-LA', ''),
(880, 'la-LA', ''),
(881, 'la-LA', ''),
(882, 'la-LA', ''),
(883, 'la-LA', ''),
(884, 'la-LA', ''),
(885, 'la-LA', ''),
(886, 'la-LA', ''),
(887, 'la-LA', ''),
(888, 'la-LA', ''),
(889, 'la-LA', 'ຄົ້ນຫາລາຍງານຕາມຊື່ຕາຕະລາງ ຫຼື ຊື່ຂອງກົມ'),
(1873, 'la-LA', ''),
(1874, 'la-LA', ''),
(1875, 'la-LA', 'ລະບົບ'),
(1878, 'la-LA', 'ຊື່'),
(1879, 'la-LA', ''),
(1880, 'la-LA', ''),
(1881, 'la-LA', 'ຊື່ນໍາໃຊ້ລະບົບ ຫຼື ລະຫັດຜ່ານບໍ່ຖືກຕ້ອງ'),
(1882, 'la-LA', '---ກະລູນາເລືອກ---'),
(1883, 'la-LA', ''),
(1884, 'la-LA', ''),
(1885, 'la-LA', ''),
(1886, 'la-LA', 'ມີໃນລະບົບແລ້ວ'),
(1893, 'la-LA', 'ສູນ'),
(1894, 'la-LA', ''),
(1895, 'la-LA', ''),
(1896, 'la-LA', ''),
(1905, 'la-LA', ''),
(1906, 'la-LA', ''),
(1907, 'la-LA', ''),
(1908, 'la-LA', ''),
(1909, 'la-LA', ''),
(1910, 'la-LA', ''),
(1911, 'la-LA', ''),
(1912, 'la-LA', ''),
(1913, 'la-LA', ''),
(1914, 'la-LA', ''),
(1915, 'la-LA', '');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
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

CREATE TABLE `ministry` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `code` varchar(5) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `ministry_group_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `equal` int(11) DEFAULT 0 COMMENT 'equal ministry',
  `phiscal_year_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ministry`
--

INSERT INTO `ministry` (`id`, `name`, `deleted`, `code`, `last_update`, `ministry_group_id`, `position`, `user_id`, `remark`, `input_dt_stamp`, `equal`, `phiscal_year_id`) VALUES
(1, 'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້', 0, '1', '2019-10-25 11:27:22', 1, 5, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(2, 'ກະຊວງ ການເງິນ', 0, '2', '2020-03-26 07:43:04', 1, 1, 1, '', '2017-09-06 19:58:52', 0, 2),
(3, 'ກະຊວງ ການຕ່າງປະເທດ', 0, '3', '2018-02-22 15:30:49', 1, 15, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(4, 'ສະພາແຫ່ງຊາດ', 1, '4', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(5, 'ສານປະຊາຊົນສູງສຸດ', 1, '5', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(6, 'ກະຊວງ ພາຍໃນ', 0, '6', '2019-10-25 11:27:45', 1, 16, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(25, 'ກະຊວງ ສຶກສາທິການ ແລະ ກິລາ', 0, '26', '2018-02-22 15:32:21', 1, 9, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(26, 'ສູນກາງຊາວໜຸ່ມ', 1, '27', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(27, 'ກະຊວງ ພາຍໃນ', 1, '28', '2018-03-13 09:44:48', 1, 16, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(28, 'ກະຊວງ ສາທາລະນະສຸກ', 0, '29', '2018-02-22 15:32:44', 1, 10, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(29, 'ກະຊວງ ໂຍທາທິການ ແລະ ຂົນສົ່ງ', 0, '30', '2018-02-22 15:32:50', 1, 4, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(30, 'ກະຊວງ ຖະແຫຼງຂ່າວ, ວັດທະນະທໍາ ແລະ ທ່ອງທ່ຽວ', 0, '31', '2018-02-22 15:33:00', 1, 11, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(31, 'ກະຊວງ ແຜນການ ແລະ ການລົງທຶນ', 0, '32', '2018-02-22 15:33:12', 1, 6, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(32, 'ກະຊວງ ແຮງງານ ແລະ ສະຫວັດດີການສັງຄົມ', 0, '33', '2018-02-22 15:33:23', 1, 13, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(33, 'ກະຊວງ ໄປສະນີ, ໂທລະຄົມມະນາຄົມ ແລະ ການສື່ສານ', 0, '34', '2018-02-22 15:33:29', 1, 12, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(34, 'ກະຊວງ ຊັບພະຍາກອນທໍາມະຊາດ ແລະ ສິ່ງແວດລ້ອມ', 0, '35', '2018-02-22 15:33:41', 1, 7, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(35, 'ກະຊວງ ວິທະຍາສາດ ແລະ ເຕັກໂນໂລຊີ', 0, '36', '2018-05-10 17:45:54', 1, 14, 37, NULL, '2017-09-06 19:58:52', 0, 2),
(36, 'ສະພາແຫ່ງຊາດ', 0, '37', '2017-09-06 19:58:52', 4, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(37, 'ສານປະຊາຊົນສູງສຸດ', 0, '38', '2017-09-06 19:58:52', 4, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(38, 'ກະຊວງ ພະລັງງານ ແລະ ບໍ່ແຮ່', 0, '39', '2018-02-22 15:34:02', 1, 3, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(39, 'ກະຊວງ ອຸດສາຫະກຳ ແລະ ການຄ້າ', 0, '40', '2020-01-27 17:20:35', 1, 2, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(40, 'ອົງການກວດກາລັດຖະບານ', 1, '41', '2018-03-22 14:49:18', 2, 21, 1, 'ອົງການທຽບເທົ່າກະຊວງ', '2017-09-06 19:58:52', 0, 2),
(41, 'ຫ້ອງວ່າການສຳນັກງານນາຍົກລັດຖະມົນຕີ', 0, '42', '2019-10-29 17:43:38', 2, 20, 1, 'ອົງການທຽບເທົ່າກະຊວງ', '2017-09-06 19:58:52', 0, 2),
(42, 'ທະນາຄານແຫ່ງ ສປປ ລາວ', 0, '43', '2020-02-03 03:29:01', 2, 20, 37, 'ອົງການທຽບເທົ່າກະຊວງ', '2017-09-06 19:58:52', 0, 2),
(52, 'ກະຊວງ ຍຸຕິທໍາ', 1, '53', '2018-02-22 15:35:49', 1, 0, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(53, 'ກະຊວງ ປ້ອງກັນປະເທດ', 0, '54', '2018-02-22 15:36:17', 1, 19, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(54, 'ກະຊວງ ປ້ອງກັນຄວາມສະຫງົບ', 0, '55', '2018-02-22 15:36:31', 1, 18, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(55, 'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ', 0, '56', '2017-09-06 19:58:52', 5, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(56, 'ສະຖາບັນການເມືອງການປົກຄອງແຫ່ງຊາດ', 0, '57', '2017-09-06 19:58:52', 5, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(57, 'ອົງການກວດສອບແຫ່ງລັດ', 1, '58', '2017-09-06 19:58:52', 2, 0, NULL, NULL, '2017-09-06 19:58:52', 0, 2),
(58, 'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້', 1, '1', '2017-10-15 04:00:36', 1, 0, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(60, 'ກະຊວງ ພັດທະນາສັງຄົມ', 0, NULL, '2018-03-05 14:51:00', NULL, 22, 4, NULL, '2018-03-05 20:51:00', 0, 2),
(61, 'ກະຊວງ ພັດທະນາສັງຄົມ', 0, NULL, '2018-03-05 14:53:12', NULL, 0, 4, NULL, '2018-03-05 20:53:12', 0, 2),
(62, 'ກະຊວງ ຍຸຕິທໍາ', 0, '6', '2018-03-13 09:47:14', 1, 17, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(63, 'ລອງ', 0, NULL, '2018-03-14 06:15:59', NULL, 0, 1, NULL, '2018-03-14 12:15:59', 0, 2),
(64, 'ລອງ', 0, NULL, '2018-03-14 06:24:44', NULL, 1, 1, ',,,,', '2018-03-14 12:24:44', 0, 2),
(65, 'Test', 1, NULL, '2018-03-18 16:55:24', 1, 0, 1, NULL, '2018-03-18 22:55:17', 0, 2),
(66, 'Test', 1, NULL, '2018-03-19 02:18:51', 1, 0, 1, NULL, '2018-03-19 08:17:19', 0, 2),
(67, 'Test', 1, NULL, '2018-03-19 02:18:53', 1, 0, 1, NULL, '2018-03-19 08:17:19', 0, 2),
(68, 'sdfasdf', 1, NULL, '2018-03-19 02:19:12', 1, 0, 1, NULL, '2018-03-19 08:19:08', 0, 2),
(69, 'Test', 1, NULL, '2018-03-19 03:16:36', 1, 0, 1, NULL, '2018-03-19 08:20:51', 0, 2),
(70, 'ທົດລອງ', 1, NULL, '2018-03-19 03:16:42', 1, 1, 1, 'ທົດລອງ', '2018-03-19 08:38:34', 0, 2),
(71, 'Test1', 1, NULL, '2018-03-19 02:42:27', 1, 1, 1, NULL, '2018-03-19 08:41:18', 0, 2),
(72, 'TEST11', 1, NULL, '2018-03-19 02:42:30', 1, 1, 1, '1', '2018-03-19 08:41:42', 0, 2),
(73, 'TEST11', 1, NULL, '2018-03-19 02:42:33', 1, 1, 1, '1', '2018-03-19 08:41:49', 0, 2),
(74, 'gg', 1, NULL, '2018-03-20 16:09:20', 1, 0, 1, NULL, '2018-03-20 22:09:16', 0, 2),
(75, 'ັຫກ', 1, NULL, '2018-03-20 16:16:24', 1, 0, 1, NULL, '2018-03-20 22:16:19', 0, 2),
(76, 'ກະຊວງ ໂຍທາທິການ ແລະ ຂົນສົ່ງ', 1, '30', '2018-03-22 03:55:58', 1, 4, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(77, 'ກະຊວງ ຍຸຕິທໍາ', 1, '6', '2018-03-22 03:56:06', 1, 17, 1, NULL, '2017-09-06 19:58:52', 0, 2),
(78, 'TEST', 1, NULL, '2018-03-22 13:01:26', 1, 1, 1, NULL, '2018-03-22 19:01:15', 0, 2),
(79, 'sadgnksdg', 1, NULL, '2018-03-22 15:04:39', 1, 33, 1, 'kkk', '2018-03-22 20:51:28', 0, 2),
(80, 'kk', 1, NULL, '2018-03-22 15:04:50', 1, 44, 1, 'hh', '2018-03-22 20:51:55', 0, 2),
(81, 'Ministry of Social Development', 1, NULL, '2018-03-22 15:12:23', 1, 0, 1, NULL, '2018-03-22 21:12:01', 0, 2),
(82, 'ກະຊວງພັດທະນາສັງຄົມ', 1, NULL, '2018-05-10 17:21:36', 1, 22, 37, NULL, '2018-03-22 21:12:46', 0, 2),
(83, 'ກະຊວງກໍ່ສ້າງຮາກຖານ', 1, NULL, '2018-03-29 04:21:00', 1, 23, 1, NULL, '2018-03-22 21:15:32', 0, 2),
(84, 'ຄະນະກຳມະການຄຸ້ມຄອງລັດຖະກອນ', 1, NULL, '2018-05-10 17:12:01', 1, 0, 37, NULL, '2018-03-22 21:16:23', 0, 2),
(85, 'ທົດລອງ', 1, NULL, '2018-03-25 06:26:43', 1, 0, 1, NULL, '2018-03-25 11:26:33', 0, 2),
(86, 'ອົງການກວດກາລັດຖະບານ', 1, NULL, '2018-05-10 17:43:07', 1, 0, 37, 'ອົງການລັດທຽບເທົ່າກະຊວງ', '2018-05-10 22:42:47', 0, 2),
(87, 'ອົງການກວດກາລັດຖະບານ', 0, NULL, '2018-05-10 17:43:46', 1, 21, 37, 'ອົງການທຽບເທົ່າກະຊວງ', '2018-05-10 22:43:46', 0, 2),
(88, 'ສະຖາບັນຄົ້ນຄວ້າເສດຖະກິດແຫ່ງຊາດ', 1, NULL, '2018-10-16 06:49:34', 1, 22, 1, 'ອົງການວິຊາການ ທີ່ມີຖານະທຽບເທົ່າກະຊວງ', '2018-10-12 10:42:29', 0, 2),
(89, 'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ', 1, NULL, '2018-10-16 06:49:44', 1, 23, 1, 'ອົງການວິຊາການ ທີ່ມີຖານະທຽບເທົ່າກະຊວງ', '2018-10-12 11:36:43', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ministry_group`
--

CREATE TABLE `ministry_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `show` int(11) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `position` int(11) DEFAULT 0,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `created_date`, `title`, `content`, `start_date`, `end_date`, `show`, `user_id`, `position`, `deleted`) VALUES
(1, '2018-03-19 05:21:20', 'ທົດລອງ', '', '2018-02-01 00:00:00', '2018-02-09 00:00:00', 0, 1, 1, 1),
(2, '2018-11-13 05:04:40', 'ແຈ້ງການກ່ຽວກັບການປ້ອນຂໍ້ມູນສະຖິຕິຂະແໜງການພາຍໃນປະຈຳປີ 2017', '<p><img alt=\"\" src=\"/upload/2018/notice-20180222152134-9132845312.png\" style=\"height:54px; width:60px\" /></p>\r\n\r\n<p>ເຖິງບັນດາ ຜູ້ໃຊ້ກົມ ແລະ ພະແນການແຂວງ ໃຫ້ບັນທຶກຂໍ້ມູນ ສະຖິຕິພາຍໃນໃສ່ຖານຂໍ້ມູນ&nbsp;</p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181113050432-1241277853.pdf\">ດາວໂຫລດຟາຍ</a></p>\r\n\r\n<p>&nbsp;</p>\r\n', '2018-02-08 00:00:00', '2020-12-31 00:00:00', 1, 17, 0, 0),
(3, '2018-02-16 04:00:31', 'ດຳລັດ ', 'ວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວ ຂອງ ກະຊວງພາຍໃນ', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 0, 1, NULL, 1),
(4, '2018-10-09 05:05:42', 'ປຶ້ມສັງລວມສະຖິຕິຂະແໜງການພາຍໃນປະຈຳສົກປີ 2015-2016', '', '2018-03-06 00:00:00', '2018-06-06 00:00:00', 1, 1, 1, 0),
(5, '2018-03-19 05:19:46', 'this is testing', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2018-03-13 00:00:00', '2018-03-28 00:00:00', 0, 1, 2, 1),
(6, '2018-03-21 17:18:59', 'ປຶ້ມສັງລວມສະຖິຕິຂະແໜງການພາຍໃນປະຈຳສົກປີ 2014-2015', '', '2018-03-01 00:00:00', '2018-03-01 00:00:00', 1, 1, NULL, 0),
(7, '2018-04-03 16:43:35', 'This is test notice', '<p><em><strong>this is the detail of note</strong></em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>....</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"/stat/upload/files/files/lemon.png\">Download File</a></p>\r\n', '2018-04-03 00:00:00', '2018-04-06 00:00:00', 0, 1, 0, 1),
(8, '2018-09-19 05:18:56', 'ກົດໝາຍວ່າດ້ວຍ ການລົງທຶນຂອງລັດ ( ສະບັບປັບປຸງ )FN 18.1. Law on PIP ', '', '2018-09-19 00:00:00', '2018-12-31 00:00:00', 1, 17, NULL, 1),
(9, '2018-09-21 11:14:54', 'ທົດລອງ', '<p><a href=\"/stat/upload/files/2018/notice-20180921111012-1284783826.exe\">ດຶງເອົາເອກະສານ</a></p>\r\n', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 1, 1, NULL, 1),
(10, '2018-10-03 09:03:29', 'ບົດສະເໜີ ກ່ຽວກັບລະບົບຖານຂໍ້ມູນສະຖິຕິຂະແໜງການພາຍໃນ', '', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 0, 1, NULL, 1),
(11, '2018-10-04 03:38:11', 'ຂໍ້ຕົກລົງ ສະບັບເລກທີ 497/ພນ, ລົງວັນທີ 21 ກັນຍາ 2018 ວ່າດ້ວຍການແຕ່ງຕັ້ງຜູ້ປະສານງານວຽກງານສະຖິຕິຂະແໜງການພາຍໃນຂັ້ນທ້ອງຖິ່ນ.', '<p><a href=\"/stat/upload/files/2018/notice-20181001094632-1241254031.pdf\">ດືງເອົາ</a></p>\r\n', '2018-10-01 00:00:00', '2022-05-01 00:00:00', 1, 1, NULL, 0),
(12, '2018-10-04 03:37:50', 'ຂໍ້ຕົກລົງ ສະບັບເລກທີ 496/ພ, ລົງວັນທີ 21 ກັນຍາ 2018 ວ່າດ້ວຍການແຕ່ງຕັ້ງຜູ້ປະສານງານວຽກງານສະຖິຕິຂະແໜງການພາຍໃນຂັ້ນກະຊວງ.', '<p><a href=\"/stat/upload/files/2018/notice-20181001095028-1278786945.pdf\">ດືງເອົາ</a></p>\r\n', '2018-10-01 00:00:00', '2022-01-01 00:00:00', 1, 1, NULL, 0),
(13, '2019-07-26 05:41:53', 'ເອກະສານກອງປະຊຸມວຽກງານສະຖິຕິຂະແໜງການພາຍໃນ ຄັ້ງວັນທີ່ 18-19/09/2018', '<p><a href=\"/stat/upload/files/2018/notice-20181002052436-1251997913.pptx\"><strong>ລະບົບຖານຂໍ້ມູນສະຖິຕິຂະແໜງການພາຍໃນ ດຶງເອົາ</strong></a></p>\r\n\r\n<p><strong><a href=\"/stat/upload/files/2018/notice-20181002052830-1267889012.pptx\">ບົດສະເໜີ ກ່ຽວກັບການປັບປຸງກົດໝາຍການລົງທຶນຂອງລັດ 16-5-2016</a></strong><a href=\"/stat/upload/files/2018/notice-20181002052830-1267889012.pptx\"><strong>&nbsp;ດຶງເອົາ&nbsp;</strong></a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064732-1279843070.JPG\"><strong>ແຈ້ງ​ການ​ໃຫ້​ນຳ​ໃຊ້​ແບບ​ຟອມ​ບົດ​ສະ​ເໜີ​ໂຄງ​ການ</strong></a></p>\r\n\r\n<p>ຟາຍເອກະສານກ່ຽວກັບ ບົດສະເໜີໂຄງການ</p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002063732-1258774579.doc\">I-1. ສຳລັບ ໂຄງການສົ່ງເສີມວິຊາການ ທີ່ບໍ່ຕິດພັນກັບການກໍ່ສ້າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002063827-1243504449.doc\">I-2. ສຳລັບ ການສຶກສາຄວາມເປັນໄປໄດ້ ແລະຫຼືການອອກແບບເບື້ອງຕົ້ນການອອກແບບລະອຽດ&nbsp;</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064042-1237045414.doc\">I-3. ສຳລັບ ໂຄງການກໍ່ສ້າງ ແລະ ສ້ອມແປງພື້ນຖານໂຄງລ່າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064103-1244504988.doc\">I-4. ສຳລັບ ໂຄງການທີ່ຖືກໂຈະ ແລະ ຟື້ນຟູຄືນໃໝ່</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064122-1237143880.doc\">I-A1. ສຳລັບ ໂຄງການສົ່ງເສີມວິຊາການ ທີ່ຕິດພັນກັບການກໍ່ສ້າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064149-1243853844.doc\">I-A2. ສຳລັບ ໂຄງການສະໜອງວັດຖຸອຸປະກອນ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064207-1278381965.doc\">II-1. ສຳລັບ ໂຄງການສົ່ງເສີມວິຊາການ ທີ່ບໍ່ຕິດພັນກັບການກໍ່ສ້າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064235-1264928687.doc\">II-2. ສຳລັບ ການສຶກສາຄວາມເປັນໄປໄດ້ ແລະຫຼື ການອອກແບບເບື້ອງຕົ້ນການອອກແບບລະອຽດ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064259-1254848655.doc\">II-3. ສຳລັບ ໂຄງການກໍ່ສ້າງ ແລະ ສ້ອມແປງພື້ນຖານໂຄງລ່າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064339-1264430006.doc\">II-A1. ສຳລັບ ໂຄງການສົ່ງເສີມວິຊາການ ທີ່ຕິດພັນກັບການກໍ່ສ້າງ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064426-1234644121.doc\">II-A2. ສຳລັບ ໂຄງການສະໜອງວັດຖຸປະກອນ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064457-1275493108.doc\">III-1_ &nbsp;III-A1_ III-A2. ສໍາລັບ ໂຄງການສົ່ງເສີມວິຊາການ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064516-1238706627.doc\">III-2. ສຳລັບ ການສຶກສາຄວາມເປັນໄປໄດ້ ແລະຫຼືການອອກແບບເບື້ອງຕົ້ນການອອກແບບລະອຽດ</a></p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181002064533-1238555752.doc\">III-3. ສຳລັບ ໂຄງການກໍ່ສ້າງ ແລະ ສ້ອມແປງພື້ນຖານໂຄງລ່າງ</a></p>\r\n', '2018-10-02 00:00:00', '2020-12-31 00:00:00', 1, 1, NULL, 0),
(14, '2018-10-02 09:22:30', 'm;\'xzfkl;', '<p><a href=\"/stat/upload/files/2018/notice-20181002092135-1259451134.JPG\">dsfedffsfff</a></p>\r\n', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 0, 17, NULL, 1),
(15, '2019-07-26 05:49:18', 'ຂໍ້ຕົກລົງ ແລະ ບົດແນະນຳ ວ່າດ້ວຍການຈັດຕັ້ງປະຕິບັດ, ການຄຸ້ມຄອງ ແລະ ການເຜີຍແຜ່ສະຖິຕິຂະແໜງການພາຍໃນ.', '<p><a href=\"/statistics/upload/files/2019/notice-20190726054841-1265532187.pdf\">ຂໍ້ຕົກລົງວ່າ​ດ້ວຍການຈັດຕັ້ງປະຕິບັດ, ການຄຸ້ມຄອງ ແລະ ການເຜີຍແຜ່ສະຖິຕິຂະແໜງການພາຍໃນ.ສະບັບເລກທີ 232/ພນ. ລົງວັນທີ 20 ເມສາ 2015</a></p>\r\n\r\n<p><a href=\"/statistics/upload/files/2019/notice-20190726054911-1245821570.pdf\">ບົດ​ແນະນຳວ່າ​ດ້ວຍການຈັດຕັ້ງປະຕິບັດ, ການຄຸ້ມຄອງ ແລະ ການເຜີຍແຜ່ສະຖິຕິຂະແໜງການພາຍໃນ ສະບັບເລກທີ 02/ພນ. ລົງວັນທີ 20 ເມສາ 2015</a></p>\r\n', '2018-10-02 00:00:00', '2020-12-31 00:00:00', 1, 1, NULL, 0),
(16, '2018-10-03 09:21:52', 'ບົດສະເໜີ ກ່ຽວກັບລະບົບຖານຂໍ້ມູນສະຖິຕິຂະແໜງການພາຍໃນ', '<p><a href=\"/stat/upload/files/2018/notice-20181003092145-1254262625.pptx\"><strong>ໂຫລດເອົາ</strong></a></p>\r\n', '1970-01-01 00:00:00', '1970-01-01 00:00:00', 0, 1, NULL, 1),
(17, '2018-10-09 08:58:14', 'ທົດລອງ', '<p>ທົດລອງ</p>\r\n\r\n<p><a href=\"/stat/upload/files/2018/notice-20181009085747-1236086168.exe\">ດາວໂຫຼດ</a></p>\r\n', '2018-10-09 00:00:00', '2020-05-13 00:00:00', 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `officer_level`
--

CREATE TABLE `officer_level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `last_update` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_province` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `officer_level`
--

INSERT INTO `officer_level` (`id`, `name`, `deleted`, `last_update`, `position`, `user_id`, `is_province`) VALUES
(1, 'ກ. ຂັ້ນກະຊວງ', 0, '2017-09-17 04:39:27', 1, 2, 0),
(2, 'ຂ. ຂັ້ນແຂວງ', 0, '2017-09-17 04:39:42', 2, 2, 0),
(3, 'ຄ. ຂັ້ນເມືອງ', 0, '2017-09-17 04:39:57', 3, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `organisation`
--

CREATE TABLE `organisation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `organisation`
--

INSERT INTO `organisation` (`id`, `name`, `deleted`, `position`) VALUES
(1, 'ສະພາແຫ່ງຊາດ', 0, 1),
(2, 'ສານປະຊາຊົນສູງສຸດ', 0, 2),
(3, 'ສູນກາງຊາວໜຸ່ມປະຊາຊົນປະຕິວັດລາວ', 0, 10),
(4, 'ອົງການກວດກາລັດຖະບານ', 1, 0),
(5, 'ຫ້ອງວ່າການລັດຖະບານ', 1, 5),
(6, 'ຄະນະກໍາມະການກວດກາສູນກາງພັກ', 0, 6),
(7, 'ອົງການກວດສອບແຫ່ງລັດ', 0, 19),
(8, 'ອົງການໄອຍະການປະຊາຊົນສູງສຸດ', 0, 3),
(9, 'ຄະນະຈັດຕັ້ງສູນກາງພັກ', 0, 5),
(10, 'ຫ້ອງວ່າການສູນກາງພັກ', 0, 4),
(11, 'ຄະນະໂຄສະນາອົບຮົມສູນກາງພັກ', 0, 7),
(12, 'ຄະນະພົວພັນຕ່າງປະເທດສູນກາງພັກ', 0, 8),
(13, 'ສູນກາງແນວລາວສ້າງຊາດ', 0, 9),
(14, 'ສູນກາງສະຫະພັນແມ່ຍິງລາວ', 0, 11),
(15, 'ສູນກາງສະຫະພັນກຳມະບານ', 0, 12),
(16, 'ສະຖາບັນການເມືອງ-ການປົກຄອງແຫ່ງຊາດ', 0, 13),
(17, 'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ', 0, 14),
(18, 'ຫ້ອງວ່າການປະທານປະເທດ', 0, 15),
(19, 'ຫໍພິພິຕະພັນໄກສອນພົມວິຫານ', 0, 16),
(20, 'ສະຫະພັນນັກຮົບເກົ່າແຫ່ງຊາດລາວ', 0, 17),
(21, 'ອົງການກາແດງລາວ', 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `organisation_group`
--

CREATE TABLE `organisation_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phiscal_year`
--

CREATE TABLE `phiscal_year` (
  `id` int(11) NOT NULL,
  `year` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `status` varchar(1) DEFAULT NULL COMMENT 'o:openning\nc:closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phiscal_year`
--

INSERT INTO `phiscal_year` (`id`, `year`, `start_date`, `end_date`, `deleted`, `status`) VALUES
(1, '2016', '2017-01-08 00:00:00', '2018-01-17 00:00:00', 0, 'O'),
(2, '2017', '2018-01-01 00:00:00', '2018-12-31 00:00:00', 0, 'O'),
(3, '2018', '2018-01-01 00:00:00', '2018-12-31 00:00:00', 0, 'O'),
(4, '2019', '2019-01-02 00:00:00', '2019-12-31 00:00:00', 0, 'O'),
(9, '2015', '2018-04-24 00:00:00', '2018-04-26 00:00:00', 0, 'O'),
(11, '2020', '2020-05-01 00:00:00', '2020-08-31 00:00:00', 0, 'O'),
(12, '2014-2015', '2018-01-01 00:00:00', '2018-12-31 00:00:00', 0, 'O');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `name`, `deleted`, `position`) VALUES
(1, 'ໂຄງການລົງທຶນຂອງລັດ', 0, 1),
(2, 'ບັນດາໂຄງການບໍລິຫານວິຊາການ', 0, 2),
(3, 'ວຽກງານການພິມ', 0, 3),
(4, 'ວຽກງານການກວດກາ, ສ້ອມແປງ ແລະ ຢັ້ງຢືນອຸປະກອນເຄື່ອງມືສຳຫຼວດ', 0, 4),
(5, 'ວຽກງານພົວພັນ, ຮ່ວມມື ກັບຕ່າງປະເທດ', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `province_code` varchar(20) NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `record_status` varchar(1) DEFAULT NULL,
  `input_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `province_code`, `province_name`, `record_status`, `input_id`, `input_dt_stamp`, `deleted`, `position`) VALUES
(1, '01', 'ນະຄອນຫລວງວຽງຈັນ', '', NULL, '2017-09-01 09:48:56', 0, 1),
(2, '02', 'ຜົ້ງສາລີ', '', NULL, '2017-09-01 09:48:56', 0, 2),
(3, '03', 'ຫຼວງນໍ້າທາ', '', NULL, '2017-09-01 09:48:56', 0, 3),
(4, '04', 'ອຸດົມໄຊ', '', NULL, '2017-09-01 09:48:56', 0, 5),
(5, '05', 'ບໍ່ແກ້ວ', '', NULL, '2017-09-01 09:48:56', 0, 4),
(6, '06', 'ຫຼວງພະບາງ', '', NULL, '2017-09-01 09:48:56', 0, 6),
(7, '07', 'ຫົວພັນ', '', NULL, '2017-09-01 09:48:56', 0, 7),
(8, '09', 'ໄຊຍະບູລີ', '', NULL, '2017-09-01 09:48:56', 0, 8),
(9, '08', 'ຊຽງຂວາງ', '', NULL, '2017-09-01 09:48:56', 0, 9),
(10, '10', 'ວຽງຈັນ', '', NULL, '2017-09-01 09:48:56', 0, 10),
(11, '11', 'ບໍລິຄໍາໄຊ', '', NULL, '2017-09-01 09:48:56', 0, 11),
(12, '12', 'ຄໍາມ່ວນ', '', NULL, '2017-09-01 09:48:56', 0, 12),
(13, '13', 'ສະຫວັນນະເຂດ', '', NULL, '2017-09-01 09:48:56', 0, 13),
(14, '14', 'ສາລະວັນ', '', NULL, '2017-09-01 09:48:56', 0, 14),
(15, '15', 'ເຊກອງ', '', NULL, '2017-09-01 09:48:56', 0, 15),
(16, '16', 'ຈໍາປາສັກ', '', NULL, '2017-09-01 09:48:56', 0, 16),
(17, '17', 'ອັດຕະປື', '', NULL, '2017-09-01 09:48:56', 0, 17),
(18, '18', 'ໄຊສົມບູນ', '', NULL, '2017-09-01 09:48:56', 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp(),
  `is_province` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `deleted`, `user_id`, `input_dt_stamp`, `is_province`, `province_id`) VALUES
(1, 'Super Admin', 0, 1, '2017-09-24 19:04:46', NULL, NULL),
(2, 'ພະແນກພາຍໃນແຂວງວຽງຈັນ', 1, 1, '2017-10-10 18:16:13', 1, NULL),
(3, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', 0, 1, '2017-10-26 23:33:33', 0, NULL),
(4, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 0, 1, '2017-11-01 01:51:50', NULL, NULL),
(5, 'ກົມຊົນເຜົ່າ ແລະ ສາສະໜາ', 0, 37, '2018-03-15 14:51:29', NULL, NULL),
(6, 'ແຂ່ງຂັນຍ້ອງຍໍ', 1, 1, '2018-03-15 14:56:17', NULL, NULL),
(7, 'ພະແນກພາຍໃນແຂງວຽງຈັນ', 1, 1, '2018-03-15 15:00:21', 1, NULL),
(8, 'ພະແນກພາຍໃນນະຄອນຫລວງ', 1, 1, '2018-03-15 15:04:55', 1, NULL),
(9, 'ຫົວໜ້າກົມ', 1, 1, '2018-03-15 16:02:12', 0, NULL),
(10, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 0, 1, '2018-03-19 15:35:48', NULL, NULL),
(11, 'ກົມພັດທະນາການບໍລິຫານລັດ', 0, 1, '2018-03-20 13:43:43', NULL, NULL),
(12, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', 0, 1, '2018-03-20 13:49:45', 0, NULL),
(13, 'ກົມແຜນທີ່ແຫ່ງຊາດ', 0, 1, '2018-03-20 13:55:28', 0, NULL),
(14, 'ກົມເອກະສານແຫ່ງຊາດ', 0, 37, '2018-03-20 14:00:42', 0, NULL),
(15, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 0, 1, '2018-03-20 14:07:56', 0, NULL),
(16, 'ກົມວຽກງານຊົນເຜົ່າ ແລະສາສະໜາ', 1, 1, '2018-03-20 22:25:51', NULL, NULL),
(17, 'ກົມວຽກງານຊົນເຜົ່າແລະສາສະໜາ', 1, 1, '2018-03-20 22:32:26', NULL, NULL),
(18, 'ຊົນເຜົ່າ ແລະ ສາສະໜາ', 1, 1, '2018-03-21 13:33:21', NULL, NULL),
(19, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', 0, 1, '2018-03-21 13:34:16', 0, NULL),
(20, 'ASRIT', 1, 1, '2018-03-21 13:47:32', 0, NULL),
(21, 'ສະຖາບັນ', 1, 1, '2018-03-21 13:48:20', 0, NULL),
(22, 'ສູນສໍາຫຼວດວັດແທກ ແລະ ແຜນທີ່', 0, 1, '2018-03-21 13:55:09', 0, NULL),
(23, 'ນະຄອນຫຼວງວຽງຈັນ', 1, 1, '2018-03-21 14:46:37', 1, NULL),
(24, 'ນະຄອນຫຼວງ', 1, 1, '2018-03-21 14:49:54', 0, NULL),
(25, 'ພະແນກພາຍໃນແຂວງບໍ່ແກ້ວ', 0, 1, '2018-03-21 14:56:07', 1, 5),
(26, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງແລະຝຶກອົບຮົມ', 0, 1, '2018-03-22 22:21:30', 0, NULL),
(28, 'ພະແນກພາຍໃນແຂວງຜົ້ງສາລີ', 0, 1, '2018-03-28 22:04:37', 1, 2),
(29, 'ພະແນກພາຍໃນແຂວງຫຼວງນ້ຳທາ', 0, 1, '2018-03-28 22:05:15', 1, 3),
(30, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 0, 1, '2018-04-02 08:29:10', NULL, NULL),
(31, 'ຫ້ອງການ', 0, 1, '2018-04-02 08:30:21', 0, NULL),
(32, 'ກົມກວດກາ', 0, 1, '2018-04-02 08:30:37', 0, NULL),
(33, 'ພະແນກພາຍໃນແຂວງອຸດົມໄຊ', 0, 1, '2018-04-02 14:38:07', 1, 4),
(34, 'ພະແນກພາຍໃນແຂວງຫົວພັນ', 0, 1, '2018-04-02 14:40:05', 1, 7),
(35, 'ພະແນກພາຍໃນແຂວງຫຼວງພະບາງ', 0, 1, '2018-04-02 20:45:45', 1, 6),
(36, 'ພະແນກພາຍໃນແຂວງໄຊຍະບູລີ', 0, 1, '2018-04-02 20:46:16', 1, 8),
(37, 'ພະແນກພາຍໃນແຂວງຊຽງຂວາງ', 0, 1, '2018-04-02 20:46:32', 1, 9),
(38, 'ພະແນກພາຍໃນແຂວງບໍລິຄຳໄຊ', 0, 1, '2018-04-02 20:47:03', 1, 11),
(39, 'ພະແນກພາຍໃນແຂວງຄຳມ່ວນ', 0, 1, '2018-04-02 20:47:15', 1, 12),
(40, 'ພະແນກພາຍໃນແຂວງສະຫວັນນະເຂດ', 0, 1, '2018-04-02 20:47:28', 1, 13),
(41, 'ພະແນກພາຍໃນແຂວງສາລະວັນ', 0, 1, '2018-04-02 20:47:45', 1, 14),
(42, 'ພະແນກພາຍໃນແຂວງເຊກອງ', 0, 1, '2018-04-02 20:48:11', 1, 15),
(43, 'ພະແນກພາຍໃນແຂວງຈຳປາສັກ', 0, 1, '2018-04-02 20:48:24', 1, 16),
(44, 'ພະແນກພາຍໃນແຂວງອັດຕະປື', 0, 1, '2018-04-02 20:48:38', 1, 17),
(45, 'ພະແນກພາຍໃນແຂວງໄຊສົມບູນ', 0, 1, '2018-04-02 20:48:52', 1, 18),
(46, 'ພະແນກພາຍໃນນະຄອນຫລວງວຽງຈັນ', 0, 1, '2018-04-04 13:25:47', 1, 1),
(47, 'ພະແນກພາຍໃນ ແຂວງວຽງຈັນ', 0, 1, '2018-05-31 10:24:06', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_action`
--

CREATE TABLE `role_has_action` (
  `role_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `allowed` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_has_action`
--

INSERT INTO `role_has_action` (`role_id`, `action_id`, `allowed`) VALUES
(1, 1, '1'),
(1, 2, '1'),
(1, 3, '1'),
(1, 4, '1'),
(1, 5, '1'),
(1, 12, '1'),
(1, 19, '1'),
(1, 20, '1'),
(1, 21, '1'),
(1, 22, '1'),
(1, 23, '1'),
(1, 24, '1'),
(1, 25, '1'),
(1, 26, '1'),
(1, 27, '1'),
(1, 28, '1'),
(1, 29, '1'),
(1, 30, '1'),
(1, 31, '1'),
(1, 32, '1'),
(1, 33, '1'),
(1, 34, '1'),
(1, 35, '1'),
(1, 36, '1'),
(1, 37, '1'),
(1, 38, '1'),
(1, 39, '1'),
(1, 40, '1'),
(1, 41, '1'),
(1, 42, '1'),
(1, 43, '1'),
(1, 44, '1'),
(1, 45, '1'),
(1, 46, '1'),
(1, 47, '1'),
(1, 48, '1'),
(1, 49, '1'),
(1, 50, '1'),
(1, 51, '1'),
(1, 52, '1'),
(1, 53, '1'),
(1, 54, '1'),
(1, 55, '1'),
(1, 56, '1'),
(1, 57, '1'),
(1, 58, '1'),
(1, 59, '1'),
(1, 60, '1'),
(1, 61, '1'),
(1, 62, '1'),
(1, 63, '1'),
(1, 64, '1'),
(1, 65, '1'),
(1, 66, '1'),
(1, 67, '1'),
(1, 68, '1'),
(1, 69, '1'),
(1, 70, '1'),
(1, 71, '1'),
(1, 72, '1'),
(1, 73, '1'),
(1, 74, '1'),
(1, 75, '1'),
(1, 76, '1'),
(1, 77, '1'),
(1, 78, '1'),
(1, 79, '1'),
(1, 80, '1'),
(1, 81, '1'),
(1, 82, '1'),
(1, 83, '1'),
(1, 84, '1'),
(1, 85, '1'),
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
(1, 107, '1'),
(1, 108, '1'),
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
(1, 121, '1'),
(1, 122, '1'),
(1, 123, '1'),
(1, 124, '1'),
(1, 125, '1'),
(1, 126, '1'),
(1, 127, '1'),
(1, 128, '1'),
(1, 129, '1'),
(1, 130, '1'),
(1, 131, '1'),
(1, 132, '1'),
(1, 133, '1'),
(1, 134, '1'),
(1, 135, '1'),
(1, 136, '1'),
(1, 137, '1'),
(1, 138, '1'),
(1, 139, '1'),
(1, 140, '1'),
(1, 141, '1'),
(1, 142, '1'),
(1, 143, '1'),
(1, 144, '1'),
(1, 145, '1'),
(1, 146, '1'),
(1, 147, '1'),
(1, 148, '1'),
(1, 149, '1'),
(1, 150, '1'),
(1, 151, '1'),
(1, 152, '1'),
(1, 153, '1'),
(1, 154, '1'),
(1, 155, '1'),
(1, 156, '1'),
(1, 157, '1'),
(1, 158, '1'),
(1, 159, '1'),
(1, 160, '1'),
(1, 161, '1'),
(1, 162, '1'),
(1, 163, '1'),
(1, 164, '1'),
(1, 165, '1'),
(1, 166, '1'),
(1, 167, '1'),
(1, 168, '1'),
(1, 169, '1'),
(1, 170, '1'),
(1, 171, '1'),
(1, 172, '1'),
(1, 173, '1'),
(1, 174, '1'),
(1, 175, '1'),
(1, 176, '1'),
(1, 177, '1'),
(1, 178, '1'),
(1, 179, '1'),
(1, 180, '1'),
(1, 181, '1'),
(1, 182, '1'),
(1, 183, '1'),
(1, 184, '1'),
(1, 185, '1'),
(1, 186, '1'),
(1, 187, '1'),
(1, 188, '1'),
(1, 189, '1'),
(1, 190, '1'),
(1, 191, '1'),
(1, 192, '1'),
(1, 193, '1'),
(1, 194, '1'),
(1, 195, '1'),
(1, 196, '1'),
(1, 197, '1'),
(1, 198, '1'),
(1, 199, '1'),
(1, 200, '1'),
(1, 201, '1'),
(1, 202, '1'),
(1, 203, '1'),
(1, 204, '1'),
(1, 205, '1'),
(1, 206, '1'),
(1, 207, '1'),
(1, 208, '1'),
(1, 209, '1'),
(1, 210, '1'),
(1, 211, '1'),
(1, 212, '1'),
(1, 213, '1'),
(1, 214, '1'),
(1, 215, '1'),
(1, 216, '1'),
(1, 217, '1'),
(1, 218, '1'),
(1, 219, '1'),
(1, 220, '1'),
(1, 221, '1'),
(1, 222, '1'),
(1, 223, '1'),
(1, 224, '1'),
(1, 225, '1'),
(1, 226, '1'),
(1, 227, '1'),
(1, 228, '1'),
(1, 229, '1'),
(1, 230, '1'),
(1, 231, '1'),
(1, 232, '1'),
(1, 233, '1'),
(1, 234, '1'),
(1, 235, '1'),
(1, 236, '1'),
(1, 237, '1'),
(1, 238, '1'),
(1, 239, '1'),
(1, 240, '1'),
(1, 241, '1'),
(1, 242, '1'),
(1, 243, '1'),
(1, 244, '1'),
(1, 245, '1'),
(1, 246, '1'),
(1, 247, '1'),
(1, 248, '1'),
(1, 249, '1'),
(1, 250, '1'),
(1, 251, '1'),
(1, 252, '1'),
(1, 253, '1'),
(1, 254, '1'),
(1, 255, '1'),
(1, 256, '1'),
(1, 257, '1'),
(1, 258, '1'),
(1, 259, '1'),
(1, 260, '1'),
(1, 261, '1'),
(1, 262, '1'),
(1, 263, '1'),
(1, 264, '1'),
(1, 265, '1'),
(1, 266, '1'),
(1, 267, '1'),
(1, 268, '1'),
(1, 269, '1'),
(1, 270, '1'),
(1, 271, '1'),
(1, 272, '1'),
(1, 273, '1'),
(1, 274, '1'),
(1, 275, '1'),
(1, 276, '1'),
(1, 277, '1'),
(1, 278, '1'),
(1, 279, '1'),
(1, 280, '1'),
(1, 281, '1'),
(1, 282, '1'),
(1, 283, '1'),
(1, 284, '1'),
(1, 285, '1'),
(1, 286, '1'),
(1, 287, '1'),
(1, 288, '1'),
(1, 289, '1'),
(1, 290, '1'),
(1, 291, '1'),
(1, 292, '1'),
(1, 293, '1'),
(1, 294, '1'),
(1, 295, '1'),
(1, 296, '1'),
(1, 297, '1'),
(1, 298, '1'),
(1, 299, '1'),
(1, 300, '1'),
(1, 301, '1'),
(1, 302, '1'),
(1, 303, '1'),
(1, 304, '1'),
(1, 305, '1'),
(1, 306, '1'),
(1, 307, '1'),
(1, 308, '1'),
(1, 309, '1'),
(1, 310, '1'),
(1, 311, '1'),
(1, 312, '1'),
(1, 313, '1'),
(1, 314, '1'),
(1, 315, '1'),
(1, 316, '1'),
(1, 317, '1'),
(1, 318, '1'),
(1, 319, '1'),
(1, 320, '1'),
(1, 321, '1'),
(1, 322, '1'),
(1, 323, '1'),
(1, 324, '1'),
(1, 325, '1'),
(1, 326, '1'),
(1, 327, '1'),
(1, 328, '1'),
(1, 329, '1'),
(1, 330, '1'),
(1, 331, '1'),
(1, 332, '1'),
(1, 333, '1'),
(1, 334, '1'),
(1, 335, '1'),
(1, 336, '1'),
(1, 337, '1'),
(1, 338, '1'),
(1, 339, '1'),
(1, 340, '1'),
(1, 341, '1'),
(1, 342, '1'),
(1, 343, '1'),
(1, 344, '1'),
(1, 345, '1'),
(1, 346, '1'),
(1, 347, '1'),
(1, 348, '1'),
(1, 349, '1'),
(1, 350, '1'),
(1, 351, '1'),
(1, 352, '1'),
(1, 353, '1'),
(1, 354, '1'),
(1, 355, '1'),
(1, 356, '1'),
(1, 357, '1'),
(1, 358, '1'),
(1, 359, '1'),
(1, 360, '1'),
(1, 361, '1'),
(1, 362, '1'),
(1, 363, '1'),
(1, 364, '1'),
(1, 365, '1'),
(1, 366, '1'),
(1, 367, '1'),
(1, 368, '1'),
(1, 369, '1'),
(1, 370, '1'),
(1, 371, '1'),
(1, 372, '1'),
(1, 373, '1'),
(1, 374, '1'),
(1, 375, '1'),
(1, 376, '1'),
(1, 377, '1'),
(1, 378, '1'),
(1, 379, '1'),
(1, 380, '1'),
(1, 381, '1'),
(1, 382, '1'),
(1, 383, '1'),
(1, 384, '1'),
(1, 385, '1'),
(1, 386, '1'),
(1, 387, '1'),
(1, 388, '1'),
(1, 389, '1'),
(1, 390, '1'),
(1, 391, '1'),
(1, 392, '1'),
(1, 393, '1'),
(1, 394, '1'),
(1, 395, '1'),
(1, 396, '1'),
(1, 397, '1'),
(1, 398, '1'),
(1, 399, '1'),
(1, 400, '1'),
(1, 401, '1'),
(1, 402, '1'),
(1, 403, '1'),
(1, 404, '1'),
(1, 405, '1'),
(1, 406, '1'),
(1, 407, '1'),
(1, 408, '1'),
(1, 409, '1'),
(1, 410, '1'),
(1, 411, '1'),
(1, 412, '1'),
(1, 413, '1'),
(1, 414, '1'),
(1, 415, '1'),
(1, 416, '1'),
(1, 417, '1'),
(1, 418, '1'),
(1, 419, '1'),
(1, 420, '1'),
(1, 421, '1'),
(1, 422, '1'),
(1, 423, '1'),
(1, 424, '1'),
(1, 425, '1'),
(1, 426, '1'),
(1, 427, '1'),
(1, 428, '1'),
(1, 429, '1'),
(1, 430, '1'),
(1, 431, '1'),
(1, 432, '1'),
(1, 433, '1'),
(1, 434, '1'),
(1, 435, '1'),
(1, 436, '1'),
(1, 437, '1'),
(1, 438, '1'),
(1, 439, '1'),
(1, 440, '1'),
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
(1, 455, '1'),
(1, 456, '1'),
(1, 457, '1'),
(1, 458, '1'),
(1, 459, '1'),
(1, 460, '1'),
(1, 461, '1'),
(1, 462, '1'),
(1, 463, '1'),
(1, 464, '1'),
(1, 465, '1'),
(1, 466, '1'),
(1, 467, '1'),
(1, 468, '1'),
(1, 469, '1'),
(1, 470, '1'),
(1, 471, '1'),
(1, 472, '1'),
(1, 473, '1'),
(1, 474, '1'),
(1, 475, '1'),
(1, 476, '1'),
(1, 477, '1'),
(1, 478, '1'),
(1, 479, '1'),
(1, 480, '1'),
(1, 481, '1'),
(1, 482, '1'),
(1, 483, '1'),
(1, 484, '1'),
(1, 485, '1'),
(1, 486, '1'),
(1, 487, '1'),
(1, 488, '1'),
(1, 489, '1'),
(1, 490, '1'),
(1, 491, '1'),
(1, 492, '1'),
(1, 493, '1'),
(1, 494, '1'),
(1, 495, '1'),
(1, 496, '1'),
(1, 497, '1'),
(1, 498, '1'),
(1, 499, '1'),
(1, 500, '1'),
(1, 501, '1'),
(1, 502, '1'),
(1, 503, '1'),
(1, 504, '1'),
(1, 505, '1'),
(1, 506, '1'),
(1, 507, '1'),
(1, 508, '1'),
(1, 509, '1'),
(1, 510, '1'),
(1, 511, '1'),
(1, 512, '1'),
(1, 513, '1'),
(1, 514, '1'),
(1, 515, '1'),
(1, 516, '1'),
(1, 517, '1'),
(1, 518, '1'),
(1, 519, '1'),
(1, 520, '1'),
(1, 521, '1'),
(1, 522, '1'),
(1, 523, '1'),
(1, 524, '1'),
(1, 525, '1'),
(1, 526, '1'),
(1, 527, '1'),
(1, 528, '1'),
(1, 529, '1'),
(1, 530, '1'),
(1, 531, '1'),
(1, 532, '1'),
(1, 533, '1'),
(1, 534, '1'),
(1, 535, '1'),
(1, 536, '1'),
(1, 537, '1'),
(1, 538, '1'),
(1, 539, '1'),
(1, 540, '1'),
(1, 541, '1'),
(1, 542, '1'),
(1, 543, '1'),
(1, 544, '1'),
(1, 545, '1'),
(1, 546, '1'),
(1, 547, '1'),
(1, 548, '1'),
(1, 549, '1'),
(1, 550, '1'),
(1, 551, '1'),
(1, 552, '1'),
(1, 553, '1'),
(1, 554, '1'),
(1, 555, '1'),
(1, 556, '1'),
(1, 557, '1'),
(1, 558, '1'),
(1, 559, '1'),
(1, 560, '1'),
(1, 561, '1'),
(1, 562, '1'),
(1, 563, '1'),
(1, 564, '1'),
(1, 565, '1'),
(1, 566, '1'),
(1, 567, '1'),
(1, 568, '1'),
(1, 569, '1'),
(1, 570, '1'),
(1, 571, '1'),
(1, 572, '1'),
(1, 573, '1'),
(1, 574, '1'),
(1, 575, '1'),
(1, 576, '1'),
(1, 577, '1'),
(1, 578, '1'),
(1, 579, '1'),
(1, 580, '1'),
(1, 581, '1'),
(1, 582, '1'),
(1, 583, '1'),
(1, 584, '1'),
(1, 585, '1'),
(1, 586, '1'),
(1, 587, '1'),
(1, 588, '1'),
(1, 589, '1'),
(1, 590, '1'),
(1, 591, '1'),
(1, 592, '1'),
(1, 593, '1'),
(1, 594, '1'),
(1, 595, '1'),
(1, 596, '1'),
(1, 597, '1'),
(1, 598, '1'),
(1, 599, '1'),
(1, 600, '1'),
(1, 601, '1'),
(1, 602, '1'),
(1, 603, '1'),
(1, 604, '1'),
(1, 605, '1'),
(1, 606, '1'),
(1, 607, '1'),
(1, 608, '1'),
(1, 609, '1'),
(1, 610, '1'),
(1, 611, '1'),
(1, 612, '1'),
(1, 613, '1'),
(1, 614, '1'),
(1, 615, '1'),
(1, 616, '1'),
(1, 617, '1'),
(1, 618, '1'),
(1, 619, '1'),
(1, 620, '1'),
(1, 621, '1'),
(1, 622, '1'),
(1, 623, '1'),
(1, 624, '1'),
(1, 625, '1'),
(1, 626, '1'),
(1, 627, '1'),
(1, 628, '1'),
(1, 629, '1'),
(1, 630, '1'),
(1, 631, '1'),
(1, 632, '1'),
(1, 633, '1'),
(1, 634, '1'),
(1, 635, '1'),
(1, 636, '1'),
(1, 637, '1'),
(1, 638, '1'),
(1, 639, '1'),
(1, 640, '1'),
(1, 641, '1'),
(1, 642, '1'),
(1, 643, '1'),
(1, 644, '1'),
(1, 645, '1'),
(1, 646, '1'),
(1, 647, '1'),
(1, 648, '1'),
(1, 649, '1'),
(1, 650, '1'),
(1, 651, '1'),
(1, 652, '1'),
(1, 653, '1'),
(1, 654, '1'),
(1, 655, '1'),
(1, 656, '1'),
(1, 657, '1'),
(1, 658, '1'),
(1, 659, '1'),
(1, 660, '1'),
(1, 661, '1'),
(1, 662, '1'),
(1, 663, '1'),
(1, 664, '1'),
(1, 665, '1'),
(1, 666, '1'),
(1, 667, '1'),
(1, 668, '1'),
(1, 669, '1'),
(1, 670, '1'),
(1, 671, '1'),
(1, 672, '1'),
(1, 673, '1'),
(1, 674, '1'),
(1, 675, '1'),
(1, 676, '1'),
(1, 677, '1'),
(1, 678, '1'),
(1, 679, '1'),
(1, 680, '1'),
(1, 681, '1'),
(1, 682, '1'),
(1, 683, '1'),
(1, 684, '1'),
(1, 685, '1'),
(1, 686, '1'),
(1, 687, '1'),
(1, 688, '1'),
(1, 689, '1'),
(1, 690, '1'),
(1, 691, '1'),
(1, 692, '1'),
(1, 693, '1'),
(1, 694, '1'),
(1, 695, '1'),
(1, 696, '1'),
(1, 697, '1'),
(1, 698, '1'),
(1, 699, '1'),
(1, 700, '1'),
(1, 701, '1'),
(1, 702, '1'),
(1, 703, '1'),
(1, 704, '1'),
(1, 705, '1'),
(1, 706, '1'),
(1, 707, '1'),
(1, 708, '1'),
(1, 709, '1'),
(1, 710, '1'),
(1, 711, '1'),
(1, 712, '1'),
(1, 713, '1'),
(1, 714, '1'),
(1, 715, '1'),
(1, 716, '1'),
(1, 717, '1'),
(1, 718, '1'),
(1, 719, '1'),
(1, 720, '1'),
(1, 721, '1'),
(1, 722, '1'),
(1, 723, '1'),
(1, 724, '1'),
(1, 725, '1'),
(1, 726, '1'),
(1, 727, '1'),
(1, 728, '1'),
(1, 729, '1'),
(1, 730, '1'),
(1, 731, '1'),
(1, 732, '1'),
(1, 733, '1'),
(1, 734, '1'),
(1, 735, '1'),
(1, 736, '1'),
(1, 737, '1'),
(1, 738, '1'),
(1, 739, '1'),
(1, 740, '1'),
(1, 741, '1'),
(1, 742, '1'),
(1, 743, '1'),
(1, 744, '1'),
(1, 745, '1'),
(1, 746, '1'),
(1, 747, '1'),
(1, 748, '1'),
(1, 749, '1'),
(1, 750, '1'),
(1, 751, '1'),
(1, 752, '1'),
(1, 753, '1'),
(1, 754, '1'),
(1, 755, '1'),
(1, 756, '1'),
(1, 757, '1'),
(1, 758, '1'),
(1, 759, '1'),
(1, 760, '1'),
(1, 761, '1'),
(1, 762, '1'),
(1, 763, '1'),
(1, 764, '1'),
(1, 765, '1'),
(1, 766, '1'),
(1, 767, '1'),
(1, 768, '1'),
(1, 769, '1'),
(1, 770, '1'),
(1, 771, '1'),
(1, 772, '1'),
(1, 773, '1'),
(1, 774, '1'),
(2, 1, '1'),
(2, 2, '1'),
(2, 3, '1'),
(2, 4, '1'),
(2, 5, '1'),
(2, 12, '1'),
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
(2, 235, '1'),
(2, 236, '1'),
(2, 237, '1'),
(2, 238, '1'),
(2, 239, '1'),
(2, 240, '1'),
(2, 241, '1'),
(2, 242, '1'),
(2, 243, '1'),
(2, 244, '1'),
(2, 245, '1'),
(2, 246, '1'),
(2, 247, '1'),
(2, 248, '1'),
(2, 249, '1'),
(2, 250, '1'),
(2, 251, '1'),
(2, 252, '1'),
(2, 253, '1'),
(2, 254, '1'),
(2, 255, '1'),
(2, 256, '1'),
(2, 257, '1'),
(2, 258, '1'),
(2, 259, '1'),
(2, 260, '1'),
(2, 261, '1'),
(2, 262, '1'),
(2, 263, '1'),
(2, 264, '1'),
(2, 265, '1'),
(2, 266, '1'),
(2, 267, '1'),
(2, 268, '1'),
(2, 269, '1'),
(2, 270, '1'),
(2, 271, '1'),
(2, 272, '1'),
(2, 273, '1'),
(2, 274, '1'),
(2, 275, '1'),
(2, 276, '1'),
(2, 277, '1'),
(2, 278, '1'),
(2, 279, '1'),
(2, 280, '1'),
(2, 281, '1'),
(2, 282, '1'),
(2, 283, '1'),
(2, 284, '1'),
(2, 285, '1'),
(2, 286, '1'),
(2, 287, '1'),
(2, 288, '1'),
(2, 289, '1'),
(2, 290, '1'),
(2, 291, '1'),
(2, 292, '1'),
(2, 293, '1'),
(2, 294, '1'),
(2, 295, '1'),
(2, 296, '1'),
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
(2, 507, '1'),
(2, 508, '1'),
(2, 509, '1'),
(2, 510, '1'),
(2, 511, '1'),
(2, 512, '1'),
(2, 513, '1'),
(2, 514, '1'),
(2, 515, '1'),
(2, 516, '1'),
(2, 517, '1'),
(2, 518, '1'),
(2, 519, '1'),
(2, 520, '1'),
(2, 521, '1'),
(2, 522, '1'),
(2, 523, '1'),
(2, 524, '1'),
(2, 525, '1'),
(2, 526, '1'),
(2, 527, '1'),
(2, 528, '1'),
(2, 529, '1'),
(2, 530, '1'),
(2, 531, '1'),
(2, 532, '1'),
(2, 533, '1'),
(2, 534, '1'),
(2, 535, '1'),
(2, 536, '1'),
(2, 537, '1'),
(2, 538, '1'),
(2, 539, '1'),
(2, 540, '1'),
(2, 541, '1'),
(2, 542, '1'),
(2, 543, '1'),
(2, 544, '1'),
(2, 545, '1'),
(2, 546, '1'),
(2, 547, '1'),
(2, 548, '1'),
(2, 549, '1'),
(2, 550, '1'),
(2, 551, '1'),
(2, 552, '1'),
(2, 553, '1'),
(2, 554, '1'),
(2, 555, '1'),
(2, 556, '1'),
(2, 557, '1'),
(2, 558, '1'),
(2, 559, '1'),
(2, 560, '1'),
(2, 561, '1'),
(2, 562, '1'),
(2, 563, '1'),
(2, 564, '1'),
(2, 565, '1'),
(2, 566, '1'),
(2, 567, '1'),
(2, 568, '1'),
(2, 569, '1'),
(2, 570, '1'),
(2, 571, '1'),
(2, 572, '1'),
(2, 573, '1'),
(2, 574, '1'),
(2, 575, '1'),
(2, 576, '1'),
(2, 577, '1'),
(2, 578, '1'),
(2, 579, '1'),
(2, 580, '1'),
(2, 581, '1'),
(2, 582, '1'),
(2, 583, '1'),
(2, 584, '1'),
(2, 585, '1'),
(2, 586, '1'),
(2, 587, '1'),
(2, 588, '1'),
(2, 589, '1'),
(2, 590, '1'),
(2, 591, '1'),
(2, 592, '1'),
(2, 593, '1'),
(2, 594, '1'),
(2, 595, '1'),
(2, 596, '1'),
(2, 597, '1'),
(2, 598, '1'),
(2, 599, '1'),
(2, 600, '1'),
(2, 601, '1'),
(2, 602, '1'),
(2, 603, '1'),
(2, 604, '1'),
(2, 605, '1'),
(2, 606, '1'),
(2, 607, '1'),
(2, 608, '1'),
(2, 609, '1'),
(2, 610, '1'),
(2, 611, '1'),
(2, 612, '1'),
(2, 613, '1'),
(2, 614, '1'),
(2, 615, '1'),
(2, 616, '1'),
(2, 617, '1'),
(2, 618, '1'),
(2, 619, '1'),
(2, 620, '1'),
(2, 621, '1'),
(2, 622, '1'),
(2, 623, '1'),
(2, 624, '1'),
(2, 625, '1'),
(2, 626, '1'),
(2, 627, '1'),
(2, 628, '1'),
(2, 629, '1'),
(2, 630, '1'),
(2, 631, '1'),
(2, 632, '1'),
(2, 633, '1'),
(2, 634, '1'),
(2, 635, '1'),
(2, 636, '1'),
(2, 637, '1'),
(2, 638, '1'),
(2, 639, '1'),
(2, 640, '1'),
(2, 641, '1'),
(2, 642, '1'),
(2, 643, '1'),
(2, 644, '1'),
(2, 645, '1'),
(2, 646, '1'),
(2, 647, '1'),
(2, 648, '1'),
(2, 649, '1'),
(2, 650, '1'),
(2, 651, '1'),
(2, 652, '1'),
(2, 653, '1'),
(2, 654, '1'),
(2, 655, '1'),
(2, 656, '1'),
(2, 657, '1'),
(2, 658, '1'),
(2, 659, '1'),
(2, 660, '1'),
(2, 661, '1'),
(2, 662, '1'),
(2, 663, '1'),
(2, 664, '1'),
(2, 665, '1'),
(2, 666, '1'),
(2, 667, '1'),
(2, 668, '1'),
(2, 669, '1'),
(2, 670, '1'),
(2, 671, '1'),
(2, 672, '1'),
(2, 673, '1'),
(2, 674, '1'),
(2, 675, '1'),
(2, 676, '1'),
(2, 677, '1'),
(2, 678, '1'),
(2, 679, '1'),
(2, 680, '1'),
(2, 681, '1'),
(2, 682, '1'),
(2, 683, '1'),
(2, 684, '1'),
(2, 685, '1'),
(2, 686, '1'),
(2, 687, '1'),
(2, 688, '1'),
(2, 689, '1'),
(2, 690, '1'),
(2, 691, '1'),
(2, 692, '1'),
(2, 693, '1'),
(2, 694, '1'),
(2, 695, '1'),
(2, 696, '1'),
(2, 697, '1'),
(2, 698, '1'),
(2, 699, '1'),
(2, 700, '1'),
(2, 701, '1'),
(2, 702, '1'),
(2, 703, '1'),
(2, 704, '1'),
(2, 705, '1'),
(2, 706, '1'),
(2, 707, '1'),
(2, 708, '1'),
(2, 709, '1'),
(2, 710, '1'),
(2, 711, '1'),
(2, 712, '1'),
(2, 713, '1'),
(2, 714, '1'),
(2, 715, '1'),
(2, 716, '1'),
(2, 717, '1'),
(2, 718, '1'),
(2, 719, '1'),
(2, 720, '1'),
(2, 721, '1'),
(2, 722, '1'),
(2, 723, '1'),
(2, 724, '1'),
(2, 725, '1'),
(2, 726, '1'),
(2, 727, '1'),
(2, 728, '1'),
(2, 729, '1'),
(2, 730, '1'),
(2, 731, '1'),
(2, 732, '1'),
(2, 733, '1'),
(2, 734, '1'),
(2, 735, '1'),
(2, 736, '1'),
(2, 737, '1'),
(2, 738, '1'),
(2, 739, '1'),
(2, 740, '1'),
(2, 741, '1'),
(2, 742, '1'),
(2, 743, '1'),
(2, 744, '1'),
(2, 745, '1'),
(2, 746, '1'),
(2, 747, '1'),
(2, 748, '1'),
(2, 749, '1'),
(2, 750, '1'),
(2, 751, '1'),
(2, 752, '1'),
(2, 753, '1'),
(2, 754, '1'),
(2, 755, '1'),
(2, 756, '1'),
(2, 757, '1'),
(2, 758, '1'),
(2, 759, '1'),
(2, 760, '1'),
(2, 761, '1'),
(2, 762, '1'),
(2, 763, '1'),
(2, 764, '1'),
(2, 765, '1'),
(2, 766, '1'),
(2, 767, '1'),
(2, 768, '1'),
(2, 769, '1'),
(2, 770, '1'),
(3, 1, '1'),
(3, 3, '1'),
(3, 25, '1'),
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
(3, 99, '1'),
(3, 100, '1'),
(3, 101, '1'),
(3, 102, '1'),
(3, 103, '1'),
(3, 104, '1'),
(3, 105, '1'),
(3, 226, '1'),
(3, 227, '1'),
(3, 228, '1'),
(3, 229, '1'),
(3, 230, '1'),
(3, 231, '1'),
(3, 232, '1'),
(3, 233, '1'),
(3, 234, '1'),
(3, 235, '1'),
(3, 236, '1'),
(3, 237, '1'),
(3, 238, '1'),
(3, 239, '1'),
(3, 240, '1'),
(3, 241, '1'),
(3, 242, '1'),
(3, 243, '1'),
(3, 244, '1'),
(3, 245, '1'),
(3, 246, '1'),
(3, 247, '1'),
(3, 248, '1'),
(3, 249, '1'),
(3, 250, '1'),
(3, 251, '1'),
(3, 252, '1'),
(3, 253, '1'),
(3, 254, '1'),
(3, 255, '1'),
(3, 256, '1'),
(3, 257, '1'),
(3, 258, '1'),
(3, 259, '1'),
(3, 260, '1'),
(3, 261, '1'),
(3, 262, '1'),
(3, 263, '1'),
(3, 264, '1'),
(3, 265, '1'),
(3, 266, '1'),
(3, 267, '1'),
(3, 268, '1'),
(3, 269, '1'),
(3, 270, '1'),
(3, 271, '1'),
(3, 272, '1'),
(3, 273, '1'),
(3, 274, '1'),
(3, 275, '1'),
(3, 276, '1'),
(3, 277, '1'),
(3, 278, '1'),
(3, 279, '1'),
(3, 280, '1'),
(3, 281, '1'),
(3, 282, '1'),
(3, 283, '1'),
(3, 284, '1'),
(3, 285, '1'),
(3, 286, '1'),
(3, 287, '1'),
(3, 288, '1'),
(3, 289, '1'),
(3, 290, '1'),
(3, 291, '1'),
(3, 292, '1'),
(3, 293, '1'),
(3, 294, '1'),
(3, 295, '1'),
(3, 296, '1'),
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
(3, 771, '1'),
(3, 773, '1'),
(3, 774, '1'),
(4, 1, '1'),
(4, 2, '1'),
(4, 3, '1'),
(4, 4, '1'),
(4, 5, '1'),
(4, 12, '1'),
(4, 19, '1'),
(4, 20, '1'),
(4, 21, '1'),
(4, 22, '1'),
(4, 23, '1'),
(4, 24, '1'),
(4, 25, '1'),
(4, 26, '1'),
(4, 27, '1'),
(4, 28, '1'),
(4, 29, '1'),
(4, 30, '1'),
(4, 31, '1'),
(4, 32, '1'),
(4, 33, '1'),
(4, 34, '1'),
(4, 35, '1'),
(4, 36, '1'),
(4, 37, '1'),
(4, 38, '1'),
(4, 39, '1'),
(4, 40, '1'),
(4, 41, '1'),
(4, 42, '1'),
(4, 43, '1'),
(4, 44, '1'),
(4, 45, '1'),
(4, 46, '1'),
(4, 47, '1'),
(4, 48, '1'),
(4, 49, '1'),
(4, 50, '1'),
(4, 51, '1'),
(4, 52, '1'),
(4, 53, '1'),
(4, 54, '1'),
(4, 55, '1'),
(4, 56, '1'),
(4, 57, '1'),
(4, 58, '1'),
(4, 59, '1'),
(4, 60, '1'),
(4, 61, '1'),
(4, 62, '1'),
(4, 63, '1'),
(4, 64, '1'),
(4, 65, '1'),
(4, 66, '1'),
(4, 67, '1'),
(4, 68, '1'),
(4, 69, '1'),
(4, 70, '1'),
(4, 71, '1'),
(4, 72, '1'),
(4, 73, '1'),
(4, 74, '1'),
(4, 75, '1'),
(4, 76, '1'),
(4, 77, '1'),
(4, 78, '1'),
(4, 79, '1'),
(4, 80, '1'),
(4, 81, '1'),
(4, 82, '1'),
(4, 83, '1'),
(4, 84, '1'),
(4, 85, '1'),
(4, 86, '1'),
(4, 87, '1'),
(4, 88, '1'),
(4, 89, '1'),
(4, 90, '1'),
(4, 91, '1'),
(4, 92, '1'),
(4, 93, '1'),
(4, 94, '1'),
(4, 95, '1'),
(4, 96, '1'),
(4, 97, '1'),
(4, 98, '1'),
(4, 99, '1'),
(4, 100, '1'),
(4, 101, '1'),
(4, 102, '1'),
(4, 103, '1'),
(4, 104, '1'),
(4, 105, '1'),
(4, 106, '1'),
(4, 107, '1'),
(4, 108, '1'),
(4, 109, '1'),
(4, 110, '1'),
(4, 111, '1'),
(4, 112, '1'),
(4, 113, '1'),
(4, 114, '1'),
(4, 115, '1'),
(4, 116, '1'),
(4, 117, '1'),
(4, 118, '1'),
(4, 119, '1'),
(4, 120, '1'),
(4, 121, '1'),
(4, 122, '1'),
(4, 123, '1'),
(4, 124, '1'),
(4, 125, '1'),
(4, 126, '1'),
(4, 127, '1'),
(4, 128, '1'),
(4, 129, '1'),
(4, 130, '1'),
(4, 131, '1'),
(4, 132, '1'),
(4, 133, '1'),
(4, 134, '1'),
(4, 135, '1'),
(4, 136, '1'),
(4, 137, '1'),
(4, 138, '1'),
(4, 139, '1'),
(4, 140, '1'),
(4, 141, '1'),
(4, 142, '1'),
(4, 143, '1'),
(4, 144, '1'),
(4, 145, '1'),
(4, 146, '1'),
(4, 147, '1'),
(4, 148, '1'),
(4, 149, '1'),
(4, 150, '1'),
(4, 151, '1'),
(4, 152, '1'),
(4, 153, '1'),
(4, 154, '1'),
(4, 155, '1'),
(4, 156, '1'),
(4, 157, '1'),
(4, 158, '1'),
(4, 159, '1'),
(4, 160, '1'),
(4, 161, '1'),
(4, 162, '1'),
(4, 163, '1'),
(4, 164, '1'),
(4, 165, '1'),
(4, 166, '1'),
(4, 167, '1'),
(4, 168, '1'),
(4, 169, '1'),
(4, 170, '1'),
(4, 171, '1'),
(4, 172, '1'),
(4, 173, '1'),
(4, 174, '1'),
(4, 175, '1'),
(4, 176, '1'),
(4, 177, '1'),
(4, 178, '1'),
(4, 179, '1'),
(4, 180, '1'),
(4, 181, '1'),
(4, 182, '1'),
(4, 183, '1'),
(4, 184, '1'),
(4, 185, '1'),
(4, 186, '1'),
(4, 187, '1'),
(4, 188, '1'),
(4, 189, '1'),
(4, 190, '1'),
(4, 191, '1'),
(4, 192, '1'),
(4, 193, '1'),
(4, 194, '1'),
(4, 195, '1'),
(4, 196, '1'),
(4, 197, '1'),
(4, 198, '1'),
(4, 199, '1'),
(4, 200, '1'),
(4, 201, '1'),
(4, 202, '1'),
(4, 203, '1'),
(4, 204, '1'),
(4, 205, '1'),
(4, 206, '1'),
(4, 207, '1'),
(4, 208, '1'),
(4, 209, '1'),
(4, 210, '1'),
(4, 211, '1'),
(4, 212, '1'),
(4, 213, '1'),
(4, 214, '1'),
(4, 215, '1'),
(4, 216, '1'),
(4, 217, '1'),
(4, 218, '1'),
(4, 219, '1'),
(4, 220, '1'),
(4, 221, '1'),
(4, 222, '1'),
(4, 223, '1'),
(4, 224, '1'),
(4, 225, '1'),
(4, 226, '1'),
(4, 227, '1'),
(4, 228, '1'),
(4, 229, '1'),
(4, 230, '1'),
(4, 231, '1'),
(4, 232, '1'),
(4, 233, '1'),
(4, 234, '1'),
(4, 235, '1'),
(4, 236, '1'),
(4, 237, '1'),
(4, 238, '1'),
(4, 239, '1'),
(4, 240, '1'),
(4, 241, '1'),
(4, 242, '1'),
(4, 243, '1'),
(4, 244, '1'),
(4, 245, '1'),
(4, 246, '1'),
(4, 247, '1'),
(4, 248, '1'),
(4, 249, '1'),
(4, 250, '1'),
(4, 251, '1'),
(4, 252, '1'),
(4, 253, '1'),
(4, 254, '1'),
(4, 255, '1'),
(4, 256, '1'),
(4, 257, '1'),
(4, 258, '1'),
(4, 259, '1'),
(4, 260, '1'),
(4, 261, '1'),
(4, 262, '1'),
(4, 263, '1'),
(4, 264, '1'),
(4, 265, '1'),
(4, 266, '1'),
(4, 267, '1'),
(4, 268, '1'),
(4, 269, '1'),
(4, 270, '1'),
(4, 271, '1'),
(4, 272, '1'),
(4, 273, '1'),
(4, 274, '1'),
(4, 275, '1'),
(4, 276, '1'),
(4, 277, '1'),
(4, 278, '1'),
(4, 279, '1'),
(4, 280, '1'),
(4, 281, '1'),
(4, 282, '1'),
(4, 283, '1'),
(4, 284, '1'),
(4, 285, '1'),
(4, 286, '1'),
(4, 287, '1'),
(4, 288, '1'),
(4, 289, '1'),
(4, 290, '1'),
(4, 291, '1'),
(4, 292, '1'),
(4, 293, '1'),
(4, 294, '1'),
(4, 295, '1'),
(4, 296, '1'),
(4, 297, '1'),
(4, 298, '1'),
(4, 299, '1'),
(4, 300, '1'),
(4, 301, '1'),
(4, 302, '1'),
(4, 303, '1'),
(4, 304, '1'),
(4, 305, '1'),
(4, 306, '1'),
(4, 307, '1'),
(4, 308, '1'),
(4, 309, '1'),
(4, 310, '1'),
(4, 311, '1'),
(4, 312, '1'),
(4, 313, '1'),
(4, 314, '1'),
(4, 315, '1'),
(4, 316, '1'),
(4, 317, '1'),
(4, 318, '1'),
(4, 319, '1'),
(4, 320, '1'),
(4, 321, '1'),
(4, 322, '1'),
(4, 323, '1'),
(4, 324, '1'),
(4, 325, '1'),
(4, 326, '1'),
(4, 327, '1'),
(4, 328, '1'),
(4, 329, '1'),
(4, 330, '1'),
(4, 331, '1'),
(4, 332, '1'),
(4, 333, '1'),
(4, 334, '1'),
(4, 335, '1'),
(4, 336, '1'),
(4, 337, '1'),
(4, 338, '1'),
(4, 339, '1'),
(4, 340, '1'),
(4, 341, '1'),
(4, 342, '1'),
(4, 343, '1'),
(4, 344, '1'),
(4, 345, '1'),
(4, 346, '1'),
(4, 347, '1'),
(4, 348, '1'),
(4, 349, '1'),
(4, 350, '1'),
(4, 351, '1'),
(4, 352, '1'),
(4, 353, '1'),
(4, 354, '1'),
(4, 355, '1'),
(4, 356, '1'),
(4, 357, '1'),
(4, 358, '1'),
(4, 359, '1'),
(4, 360, '1'),
(4, 361, '1'),
(4, 362, '1'),
(4, 363, '1'),
(4, 364, '1'),
(4, 365, '1'),
(4, 366, '1'),
(4, 367, '1'),
(4, 368, '1'),
(4, 369, '1'),
(4, 370, '1'),
(4, 371, '1'),
(4, 372, '1'),
(4, 373, '1'),
(4, 374, '1'),
(4, 375, '1'),
(4, 376, '1'),
(4, 377, '1'),
(4, 378, '1'),
(4, 379, '1'),
(4, 380, '1'),
(4, 381, '1'),
(4, 382, '1'),
(4, 383, '1'),
(4, 384, '1'),
(4, 385, '1'),
(4, 386, '1'),
(4, 387, '1'),
(4, 388, '1'),
(4, 389, '1'),
(4, 390, '1'),
(4, 391, '1'),
(4, 392, '1'),
(4, 393, '1'),
(4, 394, '1'),
(4, 395, '1'),
(4, 396, '1'),
(4, 397, '1'),
(4, 398, '1'),
(4, 399, '1'),
(4, 400, '1'),
(4, 401, '1'),
(4, 402, '1'),
(4, 403, '1'),
(4, 404, '1'),
(4, 405, '1'),
(4, 406, '1'),
(4, 407, '1'),
(4, 408, '1'),
(4, 409, '1'),
(4, 410, '1'),
(4, 411, '1'),
(4, 412, '1'),
(4, 413, '1'),
(4, 414, '1'),
(4, 415, '1'),
(4, 416, '1'),
(4, 417, '1'),
(4, 418, '1'),
(4, 419, '1'),
(4, 420, '1'),
(4, 421, '1'),
(4, 422, '1'),
(4, 423, '1'),
(4, 424, '1'),
(4, 425, '1'),
(4, 426, '1'),
(4, 427, '1'),
(4, 428, '1'),
(4, 429, '1'),
(4, 430, '1'),
(4, 431, '1'),
(4, 432, '1'),
(4, 433, '1'),
(4, 434, '1'),
(4, 435, '1'),
(4, 436, '1'),
(4, 437, '1'),
(4, 438, '1'),
(4, 439, '1'),
(4, 440, '1'),
(4, 441, '1'),
(4, 442, '1'),
(4, 443, '1'),
(4, 444, '1'),
(4, 445, '1'),
(4, 446, '1'),
(4, 447, '1'),
(4, 448, '1'),
(4, 449, '1'),
(4, 450, '1'),
(4, 451, '1'),
(4, 452, '1'),
(4, 453, '1'),
(4, 454, '1'),
(4, 455, '1'),
(4, 456, '1'),
(4, 457, '1'),
(4, 458, '1'),
(4, 459, '1'),
(4, 460, '1'),
(4, 461, '1'),
(4, 462, '1'),
(4, 463, '1'),
(4, 464, '1'),
(4, 465, '1'),
(4, 466, '1'),
(4, 467, '1'),
(4, 468, '1'),
(4, 469, '1'),
(4, 470, '1'),
(4, 471, '1'),
(4, 472, '1'),
(4, 473, '1'),
(4, 474, '1'),
(4, 475, '1'),
(4, 476, '1'),
(4, 477, '1'),
(4, 478, '1'),
(4, 479, '1'),
(4, 480, '1'),
(4, 481, '1'),
(4, 482, '1'),
(4, 483, '1'),
(4, 484, '1'),
(4, 485, '1'),
(4, 486, '1'),
(4, 487, '1'),
(4, 488, '1'),
(4, 489, '1'),
(4, 490, '1'),
(4, 491, '1'),
(4, 492, '1'),
(4, 493, '1'),
(4, 494, '1'),
(4, 495, '1'),
(4, 496, '1'),
(4, 497, '1'),
(4, 498, '1'),
(4, 499, '1'),
(4, 500, '1'),
(4, 501, '1'),
(4, 502, '1'),
(4, 503, '1'),
(4, 504, '1'),
(4, 505, '1'),
(4, 506, '1'),
(4, 507, '1'),
(4, 508, '1'),
(4, 509, '1'),
(4, 510, '1'),
(4, 511, '1'),
(4, 512, '1'),
(4, 513, '1'),
(4, 514, '1'),
(4, 515, '1'),
(4, 516, '1'),
(4, 517, '1'),
(4, 518, '1'),
(4, 519, '1'),
(4, 520, '1'),
(4, 521, '1'),
(4, 522, '1'),
(4, 523, '1'),
(4, 524, '1'),
(4, 525, '1'),
(4, 526, '1'),
(4, 527, '1'),
(4, 528, '1'),
(4, 529, '1'),
(4, 530, '1'),
(4, 531, '1'),
(4, 532, '1'),
(4, 533, '1'),
(4, 534, '1'),
(4, 535, '1'),
(4, 536, '1'),
(4, 537, '1'),
(4, 538, '1'),
(4, 539, '1'),
(4, 540, '1'),
(4, 541, '1'),
(4, 542, '1'),
(4, 543, '1'),
(4, 544, '1'),
(4, 545, '1'),
(4, 546, '1'),
(4, 547, '1'),
(4, 548, '1'),
(4, 549, '1'),
(4, 550, '1'),
(4, 551, '1'),
(4, 552, '1'),
(4, 553, '1'),
(4, 554, '1'),
(4, 555, '1'),
(4, 556, '1'),
(4, 557, '1'),
(4, 558, '1'),
(4, 559, '1'),
(4, 560, '1'),
(4, 561, '1'),
(4, 562, '1'),
(4, 563, '1'),
(4, 564, '1'),
(4, 565, '1'),
(4, 566, '1'),
(4, 567, '1'),
(4, 568, '1'),
(4, 569, '1'),
(4, 570, '1'),
(4, 571, '1'),
(4, 572, '1'),
(4, 573, '1'),
(4, 574, '1'),
(4, 575, '1'),
(4, 576, '1'),
(4, 577, '1'),
(4, 578, '1'),
(4, 579, '1'),
(4, 580, '1'),
(4, 581, '1'),
(4, 582, '1'),
(4, 583, '1'),
(4, 584, '1'),
(4, 585, '1'),
(4, 586, '1'),
(4, 587, '1'),
(4, 588, '1'),
(4, 589, '1'),
(4, 590, '1'),
(4, 591, '1'),
(4, 592, '1'),
(4, 593, '1'),
(4, 594, '1'),
(4, 595, '1'),
(4, 596, '1'),
(4, 597, '1'),
(4, 598, '1'),
(4, 599, '1'),
(4, 600, '1'),
(4, 601, '1'),
(4, 602, '1'),
(4, 603, '1'),
(4, 604, '1'),
(4, 605, '1'),
(4, 606, '1'),
(4, 607, '1'),
(4, 608, '1'),
(4, 609, '1'),
(4, 610, '1'),
(4, 611, '1'),
(4, 612, '1'),
(4, 613, '1'),
(4, 614, '1'),
(4, 615, '1'),
(4, 616, '1'),
(4, 617, '1'),
(4, 618, '1'),
(4, 619, '1'),
(4, 620, '1'),
(4, 621, '1'),
(4, 622, '1'),
(4, 623, '1'),
(4, 624, '1'),
(4, 625, '1'),
(4, 626, '1'),
(4, 627, '1'),
(4, 628, '1'),
(4, 629, '1'),
(4, 630, '1'),
(4, 631, '1'),
(4, 632, '1'),
(4, 633, '1'),
(4, 634, '1'),
(4, 635, '1'),
(4, 636, '1'),
(4, 637, '1'),
(4, 638, '1'),
(4, 639, '1'),
(4, 640, '1'),
(4, 641, '1'),
(4, 642, '1'),
(4, 643, '1'),
(4, 644, '1'),
(4, 645, '1'),
(4, 646, '1'),
(4, 647, '1'),
(4, 648, '1'),
(4, 649, '1'),
(4, 650, '1'),
(4, 651, '1'),
(4, 652, '1'),
(4, 653, '1'),
(4, 654, '1'),
(4, 655, '1'),
(4, 656, '1'),
(4, 657, '1'),
(4, 658, '1'),
(4, 659, '1'),
(4, 660, '1'),
(4, 661, '1'),
(4, 662, '1'),
(4, 663, '1'),
(4, 664, '1'),
(4, 665, '1'),
(4, 666, '1'),
(4, 667, '1'),
(4, 668, '1'),
(4, 669, '1'),
(4, 670, '1'),
(4, 671, '1'),
(4, 672, '1'),
(4, 673, '1'),
(4, 674, '1'),
(4, 675, '1'),
(4, 676, '1'),
(4, 677, '1'),
(4, 678, '1'),
(4, 679, '1'),
(4, 680, '1'),
(4, 681, '1'),
(4, 682, '1'),
(4, 683, '1'),
(4, 684, '1'),
(4, 685, '1'),
(4, 686, '1'),
(4, 687, '1'),
(4, 688, '1'),
(4, 689, '1'),
(4, 690, '1'),
(4, 691, '1'),
(4, 692, '1'),
(4, 693, '1'),
(4, 694, '1'),
(4, 695, '1'),
(4, 696, '1'),
(4, 697, '1'),
(4, 698, '1'),
(4, 699, '1'),
(4, 700, '1'),
(4, 701, '1'),
(4, 702, '1'),
(4, 703, '1'),
(4, 704, '1'),
(4, 705, '1'),
(4, 706, '1'),
(4, 707, '1'),
(4, 708, '1'),
(4, 709, '1'),
(4, 710, '1'),
(4, 711, '1'),
(4, 712, '1'),
(4, 713, '1'),
(4, 714, '1'),
(4, 715, '1'),
(4, 716, '1'),
(4, 717, '1'),
(4, 718, '1'),
(4, 719, '1'),
(4, 720, '1'),
(4, 721, '1'),
(4, 722, '1'),
(4, 723, '1'),
(4, 724, '1'),
(4, 725, '1'),
(4, 726, '1'),
(4, 727, '1'),
(4, 728, '1'),
(4, 729, '1'),
(4, 730, '1'),
(4, 731, '1'),
(4, 732, '1'),
(4, 733, '1'),
(4, 734, '1'),
(4, 735, '1'),
(4, 736, '1'),
(4, 737, '1'),
(4, 738, '1'),
(4, 739, '1'),
(4, 740, '1'),
(4, 741, '1'),
(4, 742, '1'),
(4, 743, '1'),
(4, 744, '1'),
(4, 745, '1'),
(4, 746, '1'),
(4, 747, '1'),
(4, 748, '1'),
(4, 749, '1'),
(4, 750, '1'),
(4, 751, '1'),
(4, 752, '1'),
(4, 753, '1'),
(4, 754, '1'),
(4, 755, '1'),
(4, 756, '1'),
(4, 757, '1'),
(4, 758, '1'),
(4, 759, '1'),
(4, 760, '1'),
(4, 761, '1'),
(4, 762, '1'),
(4, 763, '1'),
(4, 764, '1'),
(4, 765, '1'),
(4, 766, '1'),
(4, 767, '1'),
(4, 768, '1'),
(4, 769, '1'),
(4, 770, '1'),
(4, 771, '1'),
(4, 772, '1'),
(4, 773, '1'),
(4, 774, '1'),
(5, 1, '1'),
(5, 3, '1'),
(5, 23, '1'),
(5, 40, '1'),
(5, 41, '1'),
(5, 42, '1'),
(5, 43, '1'),
(5, 99, '1'),
(5, 100, '1'),
(5, 101, '1'),
(5, 102, '1'),
(5, 103, '1'),
(5, 104, '1'),
(5, 105, '1'),
(5, 166, '1'),
(5, 167, '1'),
(5, 168, '1'),
(5, 169, '1'),
(5, 170, '1'),
(5, 171, '1'),
(5, 172, '1'),
(5, 173, '1'),
(5, 174, '1'),
(5, 175, '1'),
(5, 176, '1'),
(5, 177, '1'),
(5, 178, '1'),
(5, 179, '1'),
(5, 180, '1'),
(5, 181, '1'),
(5, 182, '1'),
(5, 183, '1'),
(5, 184, '1'),
(5, 185, '1'),
(5, 186, '1'),
(5, 187, '1'),
(5, 188, '1'),
(5, 189, '1'),
(5, 190, '1'),
(5, 191, '1'),
(5, 192, '1'),
(5, 193, '1'),
(5, 194, '1'),
(5, 195, '1'),
(5, 196, '1'),
(5, 197, '1'),
(5, 198, '1'),
(5, 199, '1'),
(5, 200, '1'),
(5, 201, '1'),
(5, 202, '1'),
(5, 203, '1'),
(5, 204, '1'),
(5, 205, '1'),
(5, 771, '1'),
(5, 773, '1'),
(5, 774, '1'),
(6, 1, '1'),
(6, 2, '1'),
(6, 3, '1'),
(6, 29, '1'),
(6, 72, '1'),
(6, 73, '1'),
(6, 74, '1'),
(6, 75, '1'),
(6, 76, '1'),
(6, 77, '1'),
(6, 78, '1'),
(6, 79, '1'),
(6, 80, '1'),
(6, 81, '1'),
(6, 82, '1'),
(6, 99, '1'),
(6, 100, '1'),
(6, 101, '1'),
(6, 102, '1'),
(6, 103, '1'),
(6, 104, '1'),
(6, 105, '1'),
(6, 486, '1'),
(6, 487, '1'),
(6, 488, '1'),
(6, 489, '1'),
(6, 490, '1'),
(6, 491, '1'),
(6, 492, '1'),
(6, 493, '1'),
(6, 494, '1'),
(6, 495, '1'),
(6, 496, '1'),
(6, 497, '1'),
(6, 498, '1'),
(6, 499, '1'),
(6, 500, '1'),
(6, 501, '1'),
(6, 502, '1'),
(6, 503, '1'),
(6, 504, '1'),
(6, 505, '1'),
(6, 506, '1'),
(6, 507, '1'),
(6, 508, '1'),
(6, 509, '1'),
(6, 510, '1'),
(6, 511, '1'),
(6, 512, '1'),
(6, 513, '1'),
(6, 514, '1'),
(6, 515, '1'),
(6, 516, '1'),
(6, 517, '1'),
(6, 518, '1'),
(6, 519, '1'),
(6, 520, '1'),
(6, 521, '1'),
(6, 522, '1'),
(6, 523, '1'),
(6, 524, '1'),
(6, 525, '1'),
(6, 526, '1'),
(6, 527, '1'),
(6, 528, '1'),
(6, 529, '1'),
(6, 530, '1'),
(6, 531, '1'),
(6, 532, '1'),
(6, 533, '1'),
(6, 534, '1'),
(6, 535, '1'),
(6, 536, '1'),
(6, 537, '1'),
(6, 538, '1'),
(6, 539, '1'),
(6, 540, '1'),
(6, 541, '1'),
(6, 542, '1'),
(6, 543, '1'),
(6, 544, '1'),
(6, 545, '1'),
(6, 546, '1'),
(6, 547, '1'),
(6, 548, '1'),
(6, 549, '1'),
(6, 550, '1'),
(6, 551, '1'),
(6, 552, '1'),
(6, 553, '1'),
(6, 554, '1'),
(6, 555, '1'),
(6, 556, '1'),
(6, 557, '1'),
(6, 558, '1'),
(6, 559, '1'),
(6, 560, '1'),
(6, 561, '1'),
(6, 562, '1'),
(6, 563, '1'),
(6, 564, '1'),
(6, 565, '1'),
(6, 566, '1'),
(6, 567, '1'),
(6, 568, '1'),
(6, 569, '1'),
(6, 570, '1'),
(6, 571, '1'),
(6, 572, '1'),
(6, 573, '1'),
(6, 574, '1'),
(6, 575, '1'),
(6, 576, '1'),
(6, 577, '1'),
(6, 578, '1'),
(6, 579, '1'),
(6, 580, '1'),
(6, 581, '1'),
(6, 582, '1'),
(6, 583, '1'),
(6, 584, '1'),
(6, 585, '1'),
(6, 586, '1'),
(6, 587, '1'),
(6, 588, '1'),
(6, 589, '1'),
(6, 590, '1'),
(6, 591, '1'),
(6, 592, '1'),
(6, 593, '1'),
(6, 594, '1'),
(6, 595, '1'),
(6, 766, '1'),
(6, 767, '1'),
(6, 768, '1'),
(6, 769, '1'),
(6, 770, '1'),
(10, 1, '1'),
(10, 3, '1'),
(10, 34, '1'),
(10, 88, '1'),
(10, 89, '1'),
(10, 90, '1'),
(10, 91, '1'),
(10, 92, '1'),
(10, 93, '1'),
(10, 94, '1'),
(10, 95, '1'),
(10, 96, '1'),
(10, 97, '1'),
(10, 99, '1'),
(10, 100, '1'),
(10, 101, '1'),
(10, 102, '1'),
(10, 103, '1'),
(10, 104, '1'),
(10, 105, '1'),
(10, 646, '1'),
(10, 647, '1'),
(10, 648, '1'),
(10, 649, '1'),
(10, 650, '1'),
(10, 651, '1'),
(10, 652, '1'),
(10, 653, '1'),
(10, 654, '1'),
(10, 655, '1'),
(10, 656, '1'),
(10, 657, '1'),
(10, 658, '1'),
(10, 659, '1'),
(10, 660, '1'),
(10, 661, '1'),
(10, 662, '1'),
(10, 663, '1'),
(10, 664, '1'),
(10, 665, '1'),
(10, 666, '1'),
(10, 667, '1'),
(10, 668, '1'),
(10, 669, '1'),
(10, 670, '1'),
(10, 671, '1'),
(10, 672, '1'),
(10, 673, '1'),
(10, 674, '1'),
(10, 675, '1'),
(10, 676, '1'),
(10, 677, '1'),
(10, 678, '1'),
(10, 679, '1'),
(10, 680, '1'),
(10, 681, '1'),
(10, 682, '1'),
(10, 683, '1'),
(10, 684, '1'),
(10, 685, '1'),
(10, 686, '1'),
(10, 687, '1'),
(10, 688, '1'),
(10, 689, '1'),
(10, 690, '1'),
(10, 691, '1'),
(10, 692, '1'),
(10, 693, '1'),
(10, 694, '1'),
(10, 695, '1'),
(10, 696, '1'),
(10, 697, '1'),
(10, 698, '1'),
(10, 699, '1'),
(10, 700, '1'),
(10, 701, '1'),
(10, 702, '1'),
(10, 703, '1'),
(10, 704, '1'),
(10, 705, '1'),
(10, 706, '1'),
(10, 707, '1'),
(10, 708, '1'),
(10, 709, '1'),
(10, 710, '1'),
(10, 711, '1'),
(10, 712, '1'),
(10, 713, '1'),
(10, 714, '1'),
(10, 715, '1'),
(10, 716, '1'),
(10, 717, '1'),
(10, 718, '1'),
(10, 719, '1'),
(10, 720, '1'),
(10, 721, '1'),
(10, 722, '1'),
(10, 723, '1'),
(10, 724, '1'),
(10, 725, '1'),
(10, 726, '1'),
(10, 727, '1'),
(10, 728, '1'),
(10, 729, '1'),
(10, 730, '1'),
(10, 731, '1'),
(10, 732, '1'),
(10, 733, '1'),
(10, 734, '1'),
(10, 735, '1'),
(10, 736, '1'),
(10, 737, '1'),
(10, 738, '1'),
(10, 739, '1'),
(10, 740, '1'),
(10, 741, '1'),
(10, 742, '1'),
(10, 743, '1'),
(10, 744, '1'),
(10, 745, '1'),
(10, 771, '1'),
(10, 773, '1'),
(10, 774, '1'),
(11, 1, '1'),
(11, 3, '1'),
(11, 4, '1'),
(11, 5, '1'),
(11, 12, '1'),
(11, 36, '1'),
(11, 37, '1'),
(11, 38, '1'),
(11, 99, '1'),
(11, 100, '1'),
(11, 101, '1'),
(11, 102, '1'),
(11, 103, '1'),
(11, 104, '1'),
(11, 105, '1'),
(11, 106, '1'),
(11, 107, '1'),
(11, 108, '1'),
(11, 109, '1'),
(11, 110, '1'),
(11, 111, '1'),
(11, 112, '1'),
(11, 113, '1'),
(11, 114, '1'),
(11, 115, '1'),
(11, 116, '1'),
(11, 117, '1'),
(11, 118, '1'),
(11, 119, '1'),
(11, 120, '1'),
(11, 121, '1'),
(11, 122, '1'),
(11, 123, '1'),
(11, 124, '1'),
(11, 125, '1'),
(11, 126, '1'),
(11, 127, '1'),
(11, 128, '1'),
(11, 129, '1'),
(11, 130, '1'),
(11, 131, '1'),
(11, 132, '1'),
(11, 133, '1'),
(11, 134, '1'),
(11, 135, '1'),
(11, 136, '1'),
(11, 137, '1'),
(11, 138, '1'),
(11, 139, '1'),
(11, 140, '1'),
(11, 141, '1'),
(11, 142, '1'),
(11, 143, '1'),
(11, 144, '1'),
(11, 145, '1'),
(11, 146, '1'),
(11, 147, '1'),
(11, 148, '1'),
(11, 149, '1'),
(11, 150, '1'),
(11, 151, '1'),
(11, 152, '1'),
(11, 153, '1'),
(11, 154, '1'),
(11, 155, '1'),
(11, 771, '1'),
(11, 773, '1'),
(11, 774, '1'),
(12, 1, '1'),
(12, 3, '1'),
(12, 22, '1'),
(12, 39, '1'),
(12, 99, '1'),
(12, 100, '1'),
(12, 101, '1'),
(12, 102, '1'),
(12, 103, '1'),
(12, 104, '1'),
(12, 105, '1'),
(12, 156, '1'),
(12, 157, '1'),
(12, 158, '1'),
(12, 159, '1'),
(12, 160, '1'),
(12, 161, '1'),
(12, 162, '1'),
(12, 163, '1'),
(12, 164, '1'),
(12, 165, '1'),
(12, 771, '1'),
(12, 773, '1'),
(12, 774, '1'),
(13, 1, '1'),
(13, 3, '1'),
(13, 30, '1'),
(13, 83, '1'),
(13, 84, '1'),
(13, 85, '1'),
(13, 86, '1'),
(13, 99, '1'),
(13, 100, '1'),
(13, 101, '1'),
(13, 102, '1'),
(13, 103, '1'),
(13, 104, '1'),
(13, 105, '1'),
(13, 596, '1'),
(13, 597, '1'),
(13, 598, '1'),
(13, 599, '1'),
(13, 600, '1'),
(13, 601, '1'),
(13, 602, '1'),
(13, 603, '1'),
(13, 604, '1'),
(13, 605, '1'),
(13, 606, '1'),
(13, 607, '1'),
(13, 608, '1'),
(13, 609, '1'),
(13, 610, '1'),
(13, 611, '1'),
(13, 612, '1'),
(13, 613, '1'),
(13, 614, '1'),
(13, 615, '1'),
(13, 616, '1'),
(13, 617, '1'),
(13, 618, '1'),
(13, 619, '1'),
(13, 620, '1'),
(13, 621, '1'),
(13, 622, '1'),
(13, 623, '1'),
(13, 624, '1'),
(13, 625, '1'),
(13, 626, '1'),
(13, 627, '1'),
(13, 628, '1'),
(13, 629, '1'),
(13, 630, '1'),
(13, 631, '1'),
(13, 632, '1'),
(13, 633, '1'),
(13, 634, '1'),
(13, 635, '1'),
(13, 771, '1'),
(13, 773, '1'),
(13, 774, '1'),
(14, 1, '1'),
(14, 3, '1'),
(14, 28, '1'),
(14, 70, '1'),
(14, 71, '1'),
(14, 99, '1'),
(14, 100, '1'),
(14, 101, '1'),
(14, 102, '1'),
(14, 103, '1'),
(14, 104, '1'),
(14, 105, '1'),
(14, 466, '1'),
(14, 467, '1'),
(14, 468, '1'),
(14, 469, '1'),
(14, 470, '1'),
(14, 471, '1'),
(14, 472, '1'),
(14, 473, '1'),
(14, 474, '1'),
(14, 475, '1'),
(14, 476, '1'),
(14, 477, '1'),
(14, 478, '1'),
(14, 479, '1'),
(14, 480, '1'),
(14, 481, '1'),
(14, 482, '1'),
(14, 483, '1'),
(14, 484, '1'),
(14, 485, '1'),
(14, 771, '1'),
(14, 773, '1'),
(14, 774, '1'),
(15, 1, '1'),
(15, 3, '1'),
(15, 26, '1'),
(15, 60, '1'),
(15, 61, '1'),
(15, 62, '1'),
(15, 63, '1'),
(15, 64, '1'),
(15, 65, '1'),
(15, 99, '1'),
(15, 100, '1'),
(15, 101, '1'),
(15, 102, '1'),
(15, 103, '1'),
(15, 104, '1'),
(15, 105, '1'),
(15, 366, '1'),
(15, 367, '1'),
(15, 368, '1'),
(15, 369, '1'),
(15, 370, '1'),
(15, 371, '1'),
(15, 372, '1'),
(15, 373, '1'),
(15, 374, '1'),
(15, 375, '1'),
(15, 376, '1'),
(15, 377, '1'),
(15, 378, '1'),
(15, 379, '1'),
(15, 380, '1'),
(15, 381, '1'),
(15, 382, '1'),
(15, 383, '1'),
(15, 384, '1'),
(15, 385, '1'),
(15, 386, '1'),
(15, 387, '1'),
(15, 388, '1'),
(15, 389, '1'),
(15, 390, '1'),
(15, 391, '1'),
(15, 392, '1'),
(15, 393, '1'),
(15, 394, '1'),
(15, 395, '1'),
(15, 396, '1'),
(15, 397, '1'),
(15, 398, '1'),
(15, 399, '1'),
(15, 400, '1'),
(15, 401, '1'),
(15, 402, '1'),
(15, 403, '1'),
(15, 404, '1'),
(15, 405, '1'),
(15, 406, '1'),
(15, 407, '1'),
(15, 408, '1'),
(15, 409, '1'),
(15, 410, '1'),
(15, 411, '1'),
(15, 412, '1'),
(15, 413, '1'),
(15, 414, '1'),
(15, 415, '1'),
(15, 416, '1'),
(15, 417, '1'),
(15, 418, '1'),
(15, 419, '1'),
(15, 420, '1'),
(15, 421, '1'),
(15, 422, '1'),
(15, 423, '1'),
(15, 424, '1'),
(15, 425, '1'),
(15, 771, '1'),
(15, 773, '1'),
(15, 774, '1'),
(19, 1, '1'),
(19, 3, '1'),
(19, 24, '1'),
(19, 44, '1'),
(19, 45, '1'),
(19, 99, '1'),
(19, 100, '1'),
(19, 101, '1'),
(19, 102, '1'),
(19, 103, '1'),
(19, 104, '1'),
(19, 105, '1'),
(19, 206, '1'),
(19, 207, '1'),
(19, 208, '1'),
(19, 209, '1'),
(19, 210, '1'),
(19, 211, '1'),
(19, 212, '1'),
(19, 213, '1'),
(19, 214, '1'),
(19, 215, '1'),
(19, 216, '1'),
(19, 217, '1'),
(19, 218, '1'),
(19, 219, '1'),
(19, 220, '1'),
(19, 221, '1'),
(19, 222, '1'),
(19, 223, '1'),
(19, 224, '1'),
(19, 225, '1'),
(19, 771, '1'),
(19, 773, '1'),
(19, 774, '1'),
(21, 1, '1'),
(21, 3, '1'),
(21, 27, '1'),
(21, 66, '1'),
(21, 67, '1'),
(21, 68, '1'),
(21, 69, '1'),
(21, 99, '1'),
(21, 100, '1'),
(21, 101, '1'),
(21, 102, '1'),
(21, 103, '1'),
(21, 104, '1'),
(21, 105, '1'),
(21, 426, '1'),
(21, 427, '1'),
(21, 428, '1'),
(21, 429, '1'),
(21, 430, '1'),
(21, 431, '1'),
(21, 432, '1'),
(21, 433, '1'),
(21, 434, '1'),
(21, 435, '1'),
(21, 436, '1'),
(21, 437, '1'),
(21, 438, '1'),
(21, 439, '1'),
(21, 440, '1'),
(21, 441, '1'),
(21, 442, '1'),
(21, 443, '1'),
(21, 444, '1'),
(21, 445, '1'),
(21, 446, '1'),
(21, 447, '1'),
(21, 448, '1'),
(21, 449, '1'),
(21, 450, '1'),
(21, 451, '1'),
(21, 452, '1'),
(21, 453, '1'),
(21, 454, '1'),
(21, 455, '1'),
(21, 456, '1'),
(21, 457, '1'),
(21, 458, '1'),
(21, 459, '1'),
(21, 460, '1'),
(21, 461, '1'),
(21, 462, '1'),
(21, 463, '1'),
(21, 464, '1'),
(21, 465, '1'),
(22, 1, '1'),
(22, 3, '1'),
(22, 31, '1'),
(22, 87, '1'),
(22, 99, '1'),
(22, 100, '1'),
(22, 101, '1'),
(22, 102, '1'),
(22, 103, '1'),
(22, 104, '1'),
(22, 105, '1'),
(22, 636, '1'),
(22, 637, '1'),
(22, 638, '1'),
(22, 639, '1'),
(22, 640, '1'),
(22, 641, '1'),
(22, 642, '1'),
(22, 643, '1'),
(22, 644, '1'),
(22, 645, '1'),
(22, 771, '1'),
(22, 773, '1'),
(22, 774, '1'),
(25, 1, '1'),
(25, 3, '1'),
(25, 22, '1'),
(25, 23, '1'),
(25, 24, '1'),
(25, 25, '1'),
(25, 26, '1'),
(25, 39, '1'),
(25, 40, '1'),
(25, 41, '1'),
(25, 42, '1'),
(25, 43, '1'),
(25, 44, '1'),
(25, 45, '1'),
(25, 46, '1'),
(25, 47, '1'),
(25, 48, '1'),
(25, 49, '1'),
(25, 50, '1'),
(25, 51, '1'),
(25, 52, '1'),
(25, 53, '1'),
(25, 54, '1'),
(25, 55, '1'),
(25, 56, '1'),
(25, 57, '1'),
(25, 58, '1'),
(25, 59, '1'),
(25, 60, '1'),
(25, 61, '1'),
(25, 62, '1'),
(25, 63, '1'),
(25, 64, '1'),
(25, 65, '1'),
(25, 99, '1'),
(25, 100, '1'),
(25, 101, '1'),
(25, 102, '1'),
(25, 103, '1'),
(25, 104, '1'),
(25, 105, '1'),
(25, 156, '1'),
(25, 157, '1'),
(25, 158, '1'),
(25, 159, '1'),
(25, 160, '1'),
(25, 161, '1'),
(25, 162, '1'),
(25, 163, '1'),
(25, 164, '1'),
(25, 165, '1'),
(25, 166, '1'),
(25, 167, '1'),
(25, 168, '1'),
(25, 169, '1'),
(25, 170, '1'),
(25, 171, '1'),
(25, 172, '1'),
(25, 173, '1'),
(25, 174, '1'),
(25, 175, '1'),
(25, 176, '1'),
(25, 177, '1'),
(25, 178, '1'),
(25, 179, '1'),
(25, 180, '1'),
(25, 181, '1'),
(25, 182, '1'),
(25, 183, '1'),
(25, 184, '1'),
(25, 185, '1'),
(25, 186, '1'),
(25, 187, '1'),
(25, 188, '1'),
(25, 189, '1'),
(25, 190, '1'),
(25, 191, '1'),
(25, 192, '1'),
(25, 193, '1'),
(25, 194, '1'),
(25, 195, '1'),
(25, 196, '1'),
(25, 197, '1'),
(25, 198, '1'),
(25, 199, '1'),
(25, 200, '1'),
(25, 201, '1'),
(25, 202, '1'),
(25, 203, '1'),
(25, 204, '1'),
(25, 205, '1'),
(25, 206, '1'),
(25, 207, '1'),
(25, 208, '1'),
(25, 209, '1'),
(25, 210, '1'),
(25, 211, '1'),
(25, 212, '1'),
(25, 213, '1'),
(25, 214, '1'),
(25, 215, '1'),
(25, 216, '1'),
(25, 217, '1'),
(25, 218, '1'),
(25, 219, '1'),
(25, 220, '1'),
(25, 221, '1'),
(25, 222, '1'),
(25, 223, '1'),
(25, 224, '1'),
(25, 225, '1'),
(25, 226, '1'),
(25, 227, '1'),
(25, 228, '1'),
(25, 229, '1'),
(25, 230, '1'),
(25, 231, '1'),
(25, 232, '1'),
(25, 233, '1'),
(25, 234, '1'),
(25, 235, '1'),
(25, 236, '1'),
(25, 237, '1'),
(25, 238, '1'),
(25, 239, '1'),
(25, 240, '1'),
(25, 241, '1'),
(25, 242, '1'),
(25, 243, '1'),
(25, 244, '1'),
(25, 245, '1'),
(25, 246, '1'),
(25, 247, '1'),
(25, 248, '1'),
(25, 249, '1'),
(25, 250, '1'),
(25, 251, '1'),
(25, 252, '1'),
(25, 253, '1'),
(25, 254, '1'),
(25, 255, '1'),
(25, 256, '1'),
(25, 257, '1'),
(25, 258, '1'),
(25, 259, '1'),
(25, 260, '1'),
(25, 261, '1'),
(25, 262, '1'),
(25, 263, '1'),
(25, 264, '1'),
(25, 265, '1'),
(25, 266, '1'),
(25, 267, '1'),
(25, 268, '1'),
(25, 269, '1'),
(25, 270, '1'),
(25, 271, '1'),
(25, 272, '1'),
(25, 273, '1'),
(25, 274, '1'),
(25, 275, '1'),
(25, 276, '1'),
(25, 277, '1'),
(25, 278, '1'),
(25, 279, '1'),
(25, 280, '1'),
(25, 281, '1'),
(25, 282, '1'),
(25, 283, '1'),
(25, 284, '1'),
(25, 285, '1'),
(25, 286, '1'),
(25, 287, '1'),
(25, 288, '1'),
(25, 289, '1'),
(25, 290, '1'),
(25, 291, '1'),
(25, 292, '1'),
(25, 293, '1'),
(25, 294, '1'),
(25, 295, '1'),
(25, 296, '1'),
(25, 297, '1'),
(25, 298, '1'),
(25, 299, '1'),
(25, 300, '1'),
(25, 301, '1'),
(25, 302, '1'),
(25, 303, '1'),
(25, 304, '1'),
(25, 305, '1'),
(25, 306, '1'),
(25, 307, '1'),
(25, 308, '1'),
(25, 309, '1'),
(25, 310, '1'),
(25, 311, '1'),
(25, 312, '1'),
(25, 313, '1'),
(25, 314, '1'),
(25, 315, '1'),
(25, 316, '1'),
(25, 317, '1'),
(25, 318, '1'),
(25, 319, '1'),
(25, 320, '1'),
(25, 321, '1'),
(25, 322, '1'),
(25, 323, '1'),
(25, 324, '1'),
(25, 325, '1'),
(25, 326, '1'),
(25, 327, '1'),
(25, 328, '1'),
(25, 329, '1'),
(25, 330, '1'),
(25, 331, '1'),
(25, 332, '1'),
(25, 333, '1'),
(25, 334, '1'),
(25, 335, '1'),
(25, 336, '1'),
(25, 337, '1'),
(25, 338, '1'),
(25, 339, '1'),
(25, 340, '1'),
(25, 341, '1'),
(25, 342, '1'),
(25, 343, '1'),
(25, 344, '1'),
(25, 345, '1'),
(25, 346, '1'),
(25, 347, '1'),
(25, 348, '1'),
(25, 349, '1'),
(25, 350, '1'),
(25, 351, '1'),
(25, 352, '1'),
(25, 353, '1'),
(25, 354, '1'),
(25, 355, '1'),
(25, 356, '1'),
(25, 357, '1'),
(25, 358, '1'),
(25, 359, '1'),
(25, 360, '1'),
(25, 361, '1'),
(25, 362, '1'),
(25, 363, '1'),
(25, 364, '1'),
(25, 365, '1'),
(25, 366, '1'),
(25, 367, '1'),
(25, 368, '1'),
(25, 369, '1'),
(25, 370, '1'),
(25, 371, '1'),
(25, 372, '1'),
(25, 373, '1'),
(25, 374, '1'),
(25, 375, '1'),
(25, 376, '1'),
(25, 377, '1'),
(25, 378, '1'),
(25, 379, '1'),
(25, 380, '1'),
(25, 381, '1'),
(25, 382, '1'),
(25, 383, '1'),
(25, 384, '1'),
(25, 385, '1'),
(25, 386, '1'),
(25, 387, '1'),
(25, 388, '1'),
(25, 389, '1'),
(25, 390, '1'),
(25, 391, '1'),
(25, 392, '1'),
(25, 393, '1'),
(25, 394, '1'),
(25, 395, '1'),
(25, 396, '1'),
(25, 397, '1'),
(25, 398, '1'),
(25, 399, '1'),
(25, 400, '1'),
(25, 401, '1'),
(25, 402, '1'),
(25, 403, '1'),
(25, 404, '1'),
(25, 405, '1'),
(25, 406, '1'),
(25, 407, '1'),
(25, 408, '1'),
(25, 409, '1'),
(25, 410, '1'),
(25, 411, '1'),
(25, 412, '1'),
(25, 413, '1'),
(25, 414, '1'),
(25, 415, '1'),
(25, 416, '1'),
(25, 417, '1'),
(25, 418, '1'),
(25, 419, '1'),
(25, 420, '1'),
(25, 421, '1'),
(25, 422, '1'),
(25, 423, '1'),
(25, 424, '1'),
(25, 425, '1'),
(25, 771, '1'),
(25, 773, '1'),
(25, 774, '1'),
(26, 1, '1'),
(26, 3, '1'),
(26, 27, '1'),
(26, 66, '1'),
(26, 67, '1'),
(26, 68, '1'),
(26, 69, '1'),
(26, 99, '1'),
(26, 100, '1'),
(26, 101, '1'),
(26, 102, '1'),
(26, 103, '1'),
(26, 104, '1'),
(26, 105, '1'),
(26, 426, '1'),
(26, 427, '1'),
(26, 428, '1'),
(26, 429, '1'),
(26, 430, '1'),
(26, 431, '1'),
(26, 432, '1'),
(26, 433, '1'),
(26, 434, '1'),
(26, 435, '1'),
(26, 436, '1'),
(26, 437, '1'),
(26, 438, '1'),
(26, 439, '1'),
(26, 440, '1'),
(26, 441, '1'),
(26, 442, '1'),
(26, 443, '1'),
(26, 444, '1'),
(26, 445, '1'),
(26, 446, '1'),
(26, 447, '1'),
(26, 448, '1'),
(26, 449, '1'),
(26, 450, '1'),
(26, 451, '1'),
(26, 452, '1'),
(26, 453, '1'),
(26, 454, '1'),
(26, 455, '1'),
(26, 456, '1'),
(26, 457, '1'),
(26, 458, '1'),
(26, 459, '1'),
(26, 460, '1'),
(26, 461, '1'),
(26, 462, '1'),
(26, 463, '1'),
(26, 464, '1'),
(26, 465, '1'),
(26, 771, '1'),
(26, 773, '1'),
(26, 774, '1'),
(28, 1, '1'),
(28, 2, '1'),
(28, 3, '1'),
(28, 22, '1'),
(28, 23, '1'),
(28, 24, '1'),
(28, 25, '1'),
(28, 26, '1'),
(28, 39, '1'),
(28, 40, '1'),
(28, 41, '1'),
(28, 42, '1'),
(28, 43, '1'),
(28, 44, '1'),
(28, 45, '1'),
(28, 46, '1'),
(28, 47, '1'),
(28, 48, '1'),
(28, 49, '1'),
(28, 50, '1'),
(28, 51, '1'),
(28, 52, '1'),
(28, 53, '1'),
(28, 54, '1'),
(28, 55, '1'),
(28, 56, '1'),
(28, 57, '1'),
(28, 58, '1'),
(28, 59, '1'),
(28, 60, '1'),
(28, 61, '1'),
(28, 62, '1'),
(28, 63, '1'),
(28, 64, '1'),
(28, 65, '1'),
(28, 99, '1'),
(28, 100, '1'),
(28, 101, '1'),
(28, 102, '1'),
(28, 103, '1'),
(28, 104, '1'),
(28, 105, '1'),
(28, 156, '1'),
(28, 157, '1'),
(28, 158, '1'),
(28, 159, '1'),
(28, 160, '1'),
(28, 161, '1'),
(28, 162, '1'),
(28, 163, '1'),
(28, 164, '1'),
(28, 165, '1'),
(28, 166, '1'),
(28, 167, '1'),
(28, 168, '1'),
(28, 169, '1'),
(28, 170, '1'),
(28, 171, '1'),
(28, 172, '1'),
(28, 173, '1'),
(28, 174, '1'),
(28, 175, '1'),
(28, 176, '1'),
(28, 177, '1'),
(28, 178, '1'),
(28, 179, '1'),
(28, 180, '1'),
(28, 181, '1'),
(28, 182, '1'),
(28, 183, '1'),
(28, 184, '1'),
(28, 185, '1'),
(28, 186, '1'),
(28, 187, '1'),
(28, 188, '1'),
(28, 189, '1'),
(28, 190, '1'),
(28, 191, '1'),
(28, 192, '1'),
(28, 193, '1'),
(28, 194, '1'),
(28, 195, '1'),
(28, 196, '1'),
(28, 197, '1'),
(28, 198, '1'),
(28, 199, '1'),
(28, 200, '1'),
(28, 201, '1'),
(28, 202, '1'),
(28, 203, '1'),
(28, 204, '1'),
(28, 205, '1'),
(28, 206, '1'),
(28, 207, '1'),
(28, 208, '1'),
(28, 209, '1'),
(28, 210, '1'),
(28, 211, '1'),
(28, 212, '1'),
(28, 213, '1'),
(28, 214, '1'),
(28, 215, '1'),
(28, 216, '1'),
(28, 217, '1'),
(28, 218, '1'),
(28, 219, '1'),
(28, 220, '1'),
(28, 221, '1'),
(28, 222, '1'),
(28, 223, '1'),
(28, 224, '1'),
(28, 225, '1'),
(28, 226, '1'),
(28, 227, '1'),
(28, 228, '1'),
(28, 229, '1'),
(28, 230, '1'),
(28, 231, '1'),
(28, 232, '1'),
(28, 233, '1'),
(28, 234, '1'),
(28, 235, '1'),
(28, 236, '1'),
(28, 237, '1'),
(28, 238, '1'),
(28, 239, '1'),
(28, 240, '1'),
(28, 241, '1'),
(28, 242, '1'),
(28, 243, '1'),
(28, 244, '1'),
(28, 245, '1'),
(28, 246, '1'),
(28, 247, '1'),
(28, 248, '1'),
(28, 249, '1'),
(28, 250, '1'),
(28, 251, '1'),
(28, 252, '1'),
(28, 253, '1'),
(28, 254, '1'),
(28, 255, '1'),
(28, 256, '1'),
(28, 257, '1'),
(28, 258, '1'),
(28, 259, '1'),
(28, 260, '1'),
(28, 261, '1'),
(28, 262, '1'),
(28, 263, '1'),
(28, 264, '1'),
(28, 265, '1'),
(28, 266, '1'),
(28, 267, '1'),
(28, 268, '1'),
(28, 269, '1'),
(28, 270, '1'),
(28, 271, '1'),
(28, 272, '1'),
(28, 273, '1'),
(28, 274, '1'),
(28, 275, '1'),
(28, 276, '1'),
(28, 277, '1'),
(28, 278, '1'),
(28, 279, '1'),
(28, 280, '1'),
(28, 281, '1'),
(28, 282, '1'),
(28, 283, '1'),
(28, 284, '1'),
(28, 285, '1'),
(28, 286, '1'),
(28, 287, '1'),
(28, 288, '1'),
(28, 289, '1'),
(28, 290, '1'),
(28, 291, '1'),
(28, 292, '1'),
(28, 293, '1'),
(28, 294, '1'),
(28, 295, '1'),
(28, 296, '1'),
(28, 297, '1'),
(28, 298, '1'),
(28, 299, '1'),
(28, 300, '1'),
(28, 301, '1'),
(28, 302, '1'),
(28, 303, '1'),
(28, 304, '1'),
(28, 305, '1'),
(28, 306, '1'),
(28, 307, '1'),
(28, 308, '1'),
(28, 309, '1'),
(28, 310, '1'),
(28, 311, '1'),
(28, 312, '1'),
(28, 313, '1'),
(28, 314, '1'),
(28, 315, '1'),
(28, 316, '1'),
(28, 317, '1'),
(28, 318, '1'),
(28, 319, '1'),
(28, 320, '1'),
(28, 321, '1'),
(28, 322, '1'),
(28, 323, '1'),
(28, 324, '1'),
(28, 325, '1'),
(28, 326, '1'),
(28, 327, '1'),
(28, 328, '1'),
(28, 329, '1'),
(28, 330, '1'),
(28, 331, '1'),
(28, 332, '1'),
(28, 333, '1'),
(28, 334, '1'),
(28, 335, '1'),
(28, 336, '1'),
(28, 337, '1'),
(28, 338, '1'),
(28, 339, '1'),
(28, 340, '1'),
(28, 341, '1'),
(28, 342, '1'),
(28, 343, '1'),
(28, 344, '1'),
(28, 345, '1'),
(28, 346, '1'),
(28, 347, '1'),
(28, 348, '1'),
(28, 349, '1'),
(28, 350, '1'),
(28, 351, '1'),
(28, 352, '1'),
(28, 353, '1'),
(28, 354, '1'),
(28, 355, '1'),
(28, 356, '1'),
(28, 357, '1'),
(28, 358, '1'),
(28, 359, '1'),
(28, 360, '1'),
(28, 361, '1'),
(28, 362, '1'),
(28, 363, '1'),
(28, 364, '1'),
(28, 365, '1'),
(28, 366, '1'),
(28, 367, '1'),
(28, 368, '1'),
(28, 369, '1'),
(28, 370, '1'),
(28, 371, '1'),
(28, 372, '1'),
(28, 373, '1'),
(28, 374, '1'),
(28, 375, '1'),
(28, 376, '1'),
(28, 377, '1'),
(28, 378, '1'),
(28, 379, '1'),
(28, 380, '1'),
(28, 381, '1'),
(28, 382, '1'),
(28, 383, '1'),
(28, 384, '1'),
(28, 385, '1'),
(28, 386, '1'),
(28, 387, '1'),
(28, 388, '1'),
(28, 389, '1'),
(28, 390, '1');
INSERT INTO `role_has_action` (`role_id`, `action_id`, `allowed`) VALUES
(28, 391, '1'),
(28, 392, '1'),
(28, 393, '1'),
(28, 394, '1'),
(28, 395, '1'),
(28, 396, '1'),
(28, 397, '1'),
(28, 398, '1'),
(28, 399, '1'),
(28, 400, '1'),
(28, 401, '1'),
(28, 402, '1'),
(28, 403, '1'),
(28, 404, '1'),
(28, 405, '1'),
(28, 406, '1'),
(28, 407, '1'),
(28, 408, '1'),
(28, 409, '1'),
(28, 410, '1'),
(28, 411, '1'),
(28, 412, '1'),
(28, 413, '1'),
(28, 414, '1'),
(28, 415, '1'),
(28, 416, '1'),
(28, 417, '1'),
(28, 418, '1'),
(28, 419, '1'),
(28, 420, '1'),
(28, 421, '1'),
(28, 422, '1'),
(28, 423, '1'),
(28, 424, '1'),
(28, 425, '1'),
(28, 766, '1'),
(28, 767, '1'),
(28, 768, '1'),
(28, 769, '1'),
(28, 770, '1'),
(28, 771, '1'),
(28, 773, '1'),
(28, 774, '1'),
(29, 1, '1'),
(29, 3, '1'),
(29, 22, '1'),
(29, 23, '1'),
(29, 24, '1'),
(29, 25, '1'),
(29, 26, '1'),
(29, 39, '1'),
(29, 40, '1'),
(29, 41, '1'),
(29, 42, '1'),
(29, 43, '1'),
(29, 44, '1'),
(29, 45, '1'),
(29, 46, '1'),
(29, 47, '1'),
(29, 48, '1'),
(29, 49, '1'),
(29, 50, '1'),
(29, 51, '1'),
(29, 52, '1'),
(29, 53, '1'),
(29, 54, '1'),
(29, 55, '1'),
(29, 56, '1'),
(29, 57, '1'),
(29, 58, '1'),
(29, 59, '1'),
(29, 60, '1'),
(29, 61, '1'),
(29, 62, '1'),
(29, 63, '1'),
(29, 64, '1'),
(29, 65, '1'),
(29, 99, '1'),
(29, 100, '1'),
(29, 101, '1'),
(29, 102, '1'),
(29, 103, '1'),
(29, 104, '1'),
(29, 105, '1'),
(29, 156, '1'),
(29, 157, '1'),
(29, 158, '1'),
(29, 159, '1'),
(29, 160, '1'),
(29, 161, '1'),
(29, 162, '1'),
(29, 163, '1'),
(29, 164, '1'),
(29, 165, '1'),
(29, 166, '1'),
(29, 167, '1'),
(29, 168, '1'),
(29, 169, '1'),
(29, 170, '1'),
(29, 171, '1'),
(29, 172, '1'),
(29, 173, '1'),
(29, 174, '1'),
(29, 175, '1'),
(29, 176, '1'),
(29, 177, '1'),
(29, 178, '1'),
(29, 179, '1'),
(29, 180, '1'),
(29, 181, '1'),
(29, 182, '1'),
(29, 183, '1'),
(29, 184, '1'),
(29, 185, '1'),
(29, 186, '1'),
(29, 187, '1'),
(29, 188, '1'),
(29, 189, '1'),
(29, 190, '1'),
(29, 191, '1'),
(29, 192, '1'),
(29, 193, '1'),
(29, 194, '1'),
(29, 195, '1'),
(29, 196, '1'),
(29, 197, '1'),
(29, 198, '1'),
(29, 199, '1'),
(29, 200, '1'),
(29, 201, '1'),
(29, 202, '1'),
(29, 203, '1'),
(29, 204, '1'),
(29, 205, '1'),
(29, 206, '1'),
(29, 207, '1'),
(29, 208, '1'),
(29, 209, '1'),
(29, 210, '1'),
(29, 211, '1'),
(29, 212, '1'),
(29, 213, '1'),
(29, 214, '1'),
(29, 215, '1'),
(29, 216, '1'),
(29, 217, '1'),
(29, 218, '1'),
(29, 219, '1'),
(29, 220, '1'),
(29, 221, '1'),
(29, 222, '1'),
(29, 223, '1'),
(29, 224, '1'),
(29, 225, '1'),
(29, 226, '1'),
(29, 227, '1'),
(29, 228, '1'),
(29, 229, '1'),
(29, 230, '1'),
(29, 231, '1'),
(29, 232, '1'),
(29, 233, '1'),
(29, 234, '1'),
(29, 235, '1'),
(29, 236, '1'),
(29, 237, '1'),
(29, 238, '1'),
(29, 239, '1'),
(29, 240, '1'),
(29, 241, '1'),
(29, 242, '1'),
(29, 243, '1'),
(29, 244, '1'),
(29, 245, '1'),
(29, 246, '1'),
(29, 247, '1'),
(29, 248, '1'),
(29, 249, '1'),
(29, 250, '1'),
(29, 251, '1'),
(29, 252, '1'),
(29, 253, '1'),
(29, 254, '1'),
(29, 255, '1'),
(29, 256, '1'),
(29, 257, '1'),
(29, 258, '1'),
(29, 259, '1'),
(29, 260, '1'),
(29, 261, '1'),
(29, 262, '1'),
(29, 263, '1'),
(29, 264, '1'),
(29, 265, '1'),
(29, 266, '1'),
(29, 267, '1'),
(29, 268, '1'),
(29, 269, '1'),
(29, 270, '1'),
(29, 271, '1'),
(29, 272, '1'),
(29, 273, '1'),
(29, 274, '1'),
(29, 275, '1'),
(29, 276, '1'),
(29, 277, '1'),
(29, 278, '1'),
(29, 279, '1'),
(29, 280, '1'),
(29, 281, '1'),
(29, 282, '1'),
(29, 283, '1'),
(29, 284, '1'),
(29, 285, '1'),
(29, 286, '1'),
(29, 287, '1'),
(29, 288, '1'),
(29, 289, '1'),
(29, 290, '1'),
(29, 291, '1'),
(29, 292, '1'),
(29, 293, '1'),
(29, 294, '1'),
(29, 295, '1'),
(29, 296, '1'),
(29, 297, '1'),
(29, 298, '1'),
(29, 299, '1'),
(29, 300, '1'),
(29, 301, '1'),
(29, 302, '1'),
(29, 303, '1'),
(29, 304, '1'),
(29, 305, '1'),
(29, 306, '1'),
(29, 307, '1'),
(29, 308, '1'),
(29, 309, '1'),
(29, 310, '1'),
(29, 311, '1'),
(29, 312, '1'),
(29, 313, '1'),
(29, 314, '1'),
(29, 315, '1'),
(29, 316, '1'),
(29, 317, '1'),
(29, 318, '1'),
(29, 319, '1'),
(29, 320, '1'),
(29, 321, '1'),
(29, 322, '1'),
(29, 323, '1'),
(29, 324, '1'),
(29, 325, '1'),
(29, 326, '1'),
(29, 327, '1'),
(29, 328, '1'),
(29, 329, '1'),
(29, 330, '1'),
(29, 331, '1'),
(29, 332, '1'),
(29, 333, '1'),
(29, 334, '1'),
(29, 335, '1'),
(29, 336, '1'),
(29, 337, '1'),
(29, 338, '1'),
(29, 339, '1'),
(29, 340, '1'),
(29, 341, '1'),
(29, 342, '1'),
(29, 343, '1'),
(29, 344, '1'),
(29, 345, '1'),
(29, 346, '1'),
(29, 347, '1'),
(29, 348, '1'),
(29, 349, '1'),
(29, 350, '1'),
(29, 351, '1'),
(29, 352, '1'),
(29, 353, '1'),
(29, 354, '1'),
(29, 355, '1'),
(29, 356, '1'),
(29, 357, '1'),
(29, 358, '1'),
(29, 359, '1'),
(29, 360, '1'),
(29, 361, '1'),
(29, 362, '1'),
(29, 363, '1'),
(29, 364, '1'),
(29, 365, '1'),
(29, 366, '1'),
(29, 367, '1'),
(29, 368, '1'),
(29, 369, '1'),
(29, 370, '1'),
(29, 371, '1'),
(29, 372, '1'),
(29, 373, '1'),
(29, 374, '1'),
(29, 375, '1'),
(29, 376, '1'),
(29, 377, '1'),
(29, 378, '1'),
(29, 379, '1'),
(29, 380, '1'),
(29, 381, '1'),
(29, 382, '1'),
(29, 383, '1'),
(29, 384, '1'),
(29, 385, '1'),
(29, 386, '1'),
(29, 387, '1'),
(29, 388, '1'),
(29, 389, '1'),
(29, 390, '1'),
(29, 391, '1'),
(29, 392, '1'),
(29, 393, '1'),
(29, 394, '1'),
(29, 395, '1'),
(29, 396, '1'),
(29, 397, '1'),
(29, 398, '1'),
(29, 399, '1'),
(29, 400, '1'),
(29, 401, '1'),
(29, 402, '1'),
(29, 403, '1'),
(29, 404, '1'),
(29, 405, '1'),
(29, 406, '1'),
(29, 407, '1'),
(29, 408, '1'),
(29, 409, '1'),
(29, 410, '1'),
(29, 411, '1'),
(29, 412, '1'),
(29, 413, '1'),
(29, 414, '1'),
(29, 415, '1'),
(29, 416, '1'),
(29, 417, '1'),
(29, 418, '1'),
(29, 419, '1'),
(29, 420, '1'),
(29, 421, '1'),
(29, 422, '1'),
(29, 423, '1'),
(29, 424, '1'),
(29, 425, '1'),
(29, 771, '1'),
(29, 773, '1'),
(29, 774, '1'),
(30, 3, '1'),
(30, 29, '1'),
(30, 72, '1'),
(30, 73, '1'),
(30, 74, '1'),
(30, 75, '1'),
(30, 76, '1'),
(30, 77, '1'),
(30, 78, '1'),
(30, 79, '1'),
(30, 80, '1'),
(30, 81, '1'),
(30, 82, '1'),
(30, 486, '1'),
(30, 487, '1'),
(30, 488, '1'),
(30, 489, '1'),
(30, 490, '1'),
(30, 491, '1'),
(30, 492, '1'),
(30, 493, '1'),
(30, 494, '1'),
(30, 495, '1'),
(30, 496, '1'),
(30, 497, '1'),
(30, 498, '1'),
(30, 499, '1'),
(30, 500, '1'),
(30, 501, '1'),
(30, 502, '1'),
(30, 503, '1'),
(30, 504, '1'),
(30, 505, '1'),
(30, 506, '1'),
(30, 507, '1'),
(30, 508, '1'),
(30, 509, '1'),
(30, 510, '1'),
(30, 511, '1'),
(30, 512, '1'),
(30, 513, '1'),
(30, 514, '1'),
(30, 515, '1'),
(30, 516, '1'),
(30, 517, '1'),
(30, 518, '1'),
(30, 519, '1'),
(30, 520, '1'),
(30, 521, '1'),
(30, 522, '1'),
(30, 523, '1'),
(30, 524, '1'),
(30, 525, '1'),
(30, 526, '1'),
(30, 527, '1'),
(30, 528, '1'),
(30, 529, '1'),
(30, 530, '1'),
(30, 531, '1'),
(30, 532, '1'),
(30, 533, '1'),
(30, 534, '1'),
(30, 535, '1'),
(30, 536, '1'),
(30, 537, '1'),
(30, 538, '1'),
(30, 539, '1'),
(30, 540, '1'),
(30, 541, '1'),
(30, 542, '1'),
(30, 543, '1'),
(30, 544, '1'),
(30, 545, '1'),
(30, 546, '1'),
(30, 547, '1'),
(30, 548, '1'),
(30, 549, '1'),
(30, 550, '1'),
(30, 551, '1'),
(30, 552, '1'),
(30, 553, '1'),
(30, 554, '1'),
(30, 555, '1'),
(30, 556, '1'),
(30, 557, '1'),
(30, 558, '1'),
(30, 559, '1'),
(30, 560, '1'),
(30, 561, '1'),
(30, 562, '1'),
(30, 563, '1'),
(30, 564, '1'),
(30, 565, '1'),
(30, 566, '1'),
(30, 567, '1'),
(30, 568, '1'),
(30, 569, '1'),
(30, 570, '1'),
(30, 571, '1'),
(30, 572, '1'),
(30, 573, '1'),
(30, 574, '1'),
(30, 575, '1'),
(30, 576, '1'),
(30, 577, '1'),
(30, 578, '1'),
(30, 579, '1'),
(30, 580, '1'),
(30, 581, '1'),
(30, 582, '1'),
(30, 583, '1'),
(30, 584, '1'),
(30, 585, '1'),
(30, 586, '1'),
(30, 587, '1'),
(30, 588, '1'),
(30, 589, '1'),
(30, 590, '1'),
(30, 591, '1'),
(30, 592, '1'),
(30, 593, '1'),
(30, 594, '1'),
(30, 595, '1'),
(30, 771, '1'),
(30, 773, '1'),
(30, 774, '1'),
(31, 3, '1'),
(31, 32, '1'),
(31, 771, '1'),
(31, 773, '1'),
(31, 774, '1'),
(32, 3, '1'),
(32, 35, '1'),
(32, 756, '1'),
(32, 757, '1'),
(32, 758, '1'),
(32, 759, '1'),
(32, 760, '1'),
(32, 761, '1'),
(32, 762, '1'),
(32, 763, '1'),
(32, 764, '1'),
(32, 765, '1'),
(32, 771, '1'),
(32, 773, '1'),
(32, 774, '1'),
(33, 1, '1'),
(33, 2, '1'),
(33, 3, '1'),
(33, 22, '1'),
(33, 23, '1'),
(33, 24, '1'),
(33, 25, '1'),
(33, 26, '1'),
(33, 39, '1'),
(33, 40, '1'),
(33, 41, '1'),
(33, 42, '1'),
(33, 43, '1'),
(33, 44, '1'),
(33, 45, '1'),
(33, 46, '1'),
(33, 47, '1'),
(33, 48, '1'),
(33, 49, '1'),
(33, 50, '1'),
(33, 51, '1'),
(33, 52, '1'),
(33, 53, '1'),
(33, 54, '1'),
(33, 55, '1'),
(33, 56, '1'),
(33, 57, '1'),
(33, 58, '1'),
(33, 59, '1'),
(33, 60, '1'),
(33, 61, '1'),
(33, 62, '1'),
(33, 63, '1'),
(33, 64, '1'),
(33, 65, '1'),
(33, 99, '1'),
(33, 100, '1'),
(33, 101, '1'),
(33, 102, '1'),
(33, 103, '1'),
(33, 104, '1'),
(33, 105, '1'),
(33, 156, '1'),
(33, 157, '1'),
(33, 158, '1'),
(33, 159, '1'),
(33, 160, '1'),
(33, 161, '1'),
(33, 162, '1'),
(33, 163, '1'),
(33, 164, '1'),
(33, 165, '1'),
(33, 166, '1'),
(33, 167, '1'),
(33, 168, '1'),
(33, 169, '1'),
(33, 170, '1'),
(33, 171, '1'),
(33, 172, '1'),
(33, 173, '1'),
(33, 174, '1'),
(33, 175, '1'),
(33, 176, '1'),
(33, 177, '1'),
(33, 178, '1'),
(33, 179, '1'),
(33, 180, '1'),
(33, 181, '1'),
(33, 182, '1'),
(33, 183, '1'),
(33, 184, '1'),
(33, 185, '1'),
(33, 186, '1'),
(33, 187, '1'),
(33, 188, '1'),
(33, 189, '1'),
(33, 190, '1'),
(33, 191, '1'),
(33, 192, '1'),
(33, 193, '1'),
(33, 194, '1'),
(33, 195, '1'),
(33, 196, '1'),
(33, 197, '1'),
(33, 198, '1'),
(33, 199, '1'),
(33, 200, '1'),
(33, 201, '1'),
(33, 202, '1'),
(33, 203, '1'),
(33, 204, '1'),
(33, 205, '1'),
(33, 206, '1'),
(33, 207, '1'),
(33, 208, '1'),
(33, 209, '1'),
(33, 210, '1'),
(33, 211, '1'),
(33, 212, '1'),
(33, 213, '1'),
(33, 214, '1'),
(33, 215, '1'),
(33, 216, '1'),
(33, 217, '1'),
(33, 218, '1'),
(33, 219, '1'),
(33, 220, '1'),
(33, 221, '1'),
(33, 222, '1'),
(33, 223, '1'),
(33, 224, '1'),
(33, 225, '1'),
(33, 226, '1'),
(33, 227, '1'),
(33, 228, '1'),
(33, 229, '1'),
(33, 230, '1'),
(33, 231, '1'),
(33, 232, '1'),
(33, 233, '1'),
(33, 234, '1'),
(33, 235, '1'),
(33, 236, '1'),
(33, 237, '1'),
(33, 238, '1'),
(33, 239, '1'),
(33, 240, '1'),
(33, 241, '1'),
(33, 242, '1'),
(33, 243, '1'),
(33, 244, '1'),
(33, 245, '1'),
(33, 246, '1'),
(33, 247, '1'),
(33, 248, '1'),
(33, 249, '1'),
(33, 250, '1'),
(33, 251, '1'),
(33, 252, '1'),
(33, 253, '1'),
(33, 254, '1'),
(33, 255, '1'),
(33, 256, '1'),
(33, 257, '1'),
(33, 258, '1'),
(33, 259, '1'),
(33, 260, '1'),
(33, 261, '1'),
(33, 262, '1'),
(33, 263, '1'),
(33, 264, '1'),
(33, 265, '1'),
(33, 266, '1'),
(33, 267, '1'),
(33, 268, '1'),
(33, 269, '1'),
(33, 270, '1'),
(33, 271, '1'),
(33, 272, '1'),
(33, 273, '1'),
(33, 274, '1'),
(33, 275, '1'),
(33, 276, '1'),
(33, 277, '1'),
(33, 278, '1'),
(33, 279, '1'),
(33, 280, '1'),
(33, 281, '1'),
(33, 282, '1'),
(33, 283, '1'),
(33, 284, '1'),
(33, 285, '1'),
(33, 286, '1'),
(33, 287, '1'),
(33, 288, '1'),
(33, 289, '1'),
(33, 290, '1'),
(33, 291, '1'),
(33, 292, '1'),
(33, 293, '1'),
(33, 294, '1'),
(33, 295, '1'),
(33, 296, '1'),
(33, 297, '1'),
(33, 298, '1'),
(33, 299, '1'),
(33, 300, '1'),
(33, 301, '1'),
(33, 302, '1'),
(33, 303, '1'),
(33, 304, '1'),
(33, 305, '1'),
(33, 306, '1'),
(33, 307, '1'),
(33, 308, '1'),
(33, 309, '1'),
(33, 310, '1'),
(33, 311, '1'),
(33, 312, '1'),
(33, 313, '1'),
(33, 314, '1'),
(33, 315, '1'),
(33, 316, '1'),
(33, 317, '1'),
(33, 318, '1'),
(33, 319, '1'),
(33, 320, '1'),
(33, 321, '1'),
(33, 322, '1'),
(33, 323, '1'),
(33, 324, '1'),
(33, 325, '1'),
(33, 326, '1'),
(33, 327, '1'),
(33, 328, '1'),
(33, 329, '1'),
(33, 330, '1'),
(33, 331, '1'),
(33, 332, '1'),
(33, 333, '1'),
(33, 334, '1'),
(33, 335, '1'),
(33, 336, '1'),
(33, 337, '1'),
(33, 338, '1'),
(33, 339, '1'),
(33, 340, '1'),
(33, 341, '1'),
(33, 342, '1'),
(33, 343, '1'),
(33, 344, '1'),
(33, 345, '1'),
(33, 346, '1'),
(33, 347, '1'),
(33, 348, '1'),
(33, 349, '1'),
(33, 350, '1'),
(33, 351, '1'),
(33, 352, '1'),
(33, 353, '1'),
(33, 354, '1'),
(33, 355, '1'),
(33, 356, '1'),
(33, 357, '1'),
(33, 358, '1'),
(33, 359, '1'),
(33, 360, '1'),
(33, 361, '1'),
(33, 362, '1'),
(33, 363, '1'),
(33, 364, '1'),
(33, 365, '1'),
(33, 366, '1'),
(33, 367, '1'),
(33, 368, '1'),
(33, 369, '1'),
(33, 370, '1'),
(33, 371, '1'),
(33, 372, '1'),
(33, 373, '1'),
(33, 374, '1'),
(33, 375, '1'),
(33, 376, '1'),
(33, 377, '1'),
(33, 378, '1'),
(33, 379, '1'),
(33, 380, '1'),
(33, 381, '1'),
(33, 382, '1'),
(33, 383, '1'),
(33, 384, '1'),
(33, 385, '1'),
(33, 386, '1'),
(33, 387, '1'),
(33, 388, '1'),
(33, 389, '1'),
(33, 390, '1'),
(33, 391, '1'),
(33, 392, '1'),
(33, 393, '1'),
(33, 394, '1'),
(33, 395, '1'),
(33, 396, '1'),
(33, 397, '1'),
(33, 398, '1'),
(33, 399, '1'),
(33, 400, '1'),
(33, 401, '1'),
(33, 402, '1'),
(33, 403, '1'),
(33, 404, '1'),
(33, 405, '1'),
(33, 406, '1'),
(33, 407, '1'),
(33, 408, '1'),
(33, 409, '1'),
(33, 410, '1'),
(33, 411, '1'),
(33, 412, '1'),
(33, 413, '1'),
(33, 414, '1'),
(33, 415, '1'),
(33, 416, '1'),
(33, 417, '1'),
(33, 418, '1'),
(33, 419, '1'),
(33, 420, '1'),
(33, 421, '1'),
(33, 422, '1'),
(33, 423, '1'),
(33, 424, '1'),
(33, 425, '1'),
(33, 766, '1'),
(33, 767, '1'),
(33, 768, '1'),
(33, 769, '1'),
(33, 770, '1'),
(33, 771, '1'),
(33, 773, '1'),
(33, 774, '1'),
(34, 3, '1'),
(34, 22, '1'),
(34, 23, '1'),
(34, 24, '1'),
(34, 25, '1'),
(34, 39, '1'),
(34, 40, '1'),
(34, 41, '1'),
(34, 42, '1'),
(34, 43, '1'),
(34, 44, '1'),
(34, 45, '1'),
(34, 46, '1'),
(34, 47, '1'),
(34, 48, '1'),
(34, 49, '1'),
(34, 50, '1'),
(34, 51, '1'),
(34, 52, '1'),
(34, 53, '1'),
(34, 54, '1'),
(34, 55, '1'),
(34, 56, '1'),
(34, 57, '1'),
(34, 58, '1'),
(34, 59, '1'),
(34, 156, '1'),
(34, 157, '1'),
(34, 158, '1'),
(34, 159, '1'),
(34, 160, '1'),
(34, 161, '1'),
(34, 162, '1'),
(34, 163, '1'),
(34, 164, '1'),
(34, 165, '1'),
(34, 166, '1'),
(34, 167, '1'),
(34, 168, '1'),
(34, 169, '1'),
(34, 170, '1'),
(34, 171, '1'),
(34, 172, '1'),
(34, 173, '1'),
(34, 174, '1'),
(34, 175, '1'),
(34, 176, '1'),
(34, 177, '1'),
(34, 178, '1'),
(34, 179, '1'),
(34, 180, '1'),
(34, 181, '1'),
(34, 182, '1'),
(34, 183, '1'),
(34, 184, '1'),
(34, 185, '1'),
(34, 186, '1'),
(34, 187, '1'),
(34, 188, '1'),
(34, 189, '1'),
(34, 190, '1'),
(34, 191, '1'),
(34, 192, '1'),
(34, 193, '1'),
(34, 194, '1'),
(34, 195, '1'),
(34, 196, '1'),
(34, 197, '1'),
(34, 198, '1'),
(34, 199, '1'),
(34, 200, '1'),
(34, 201, '1'),
(34, 202, '1'),
(34, 203, '1'),
(34, 204, '1'),
(34, 205, '1'),
(34, 206, '1'),
(34, 207, '1'),
(34, 208, '1'),
(34, 209, '1'),
(34, 210, '1'),
(34, 211, '1'),
(34, 212, '1'),
(34, 213, '1'),
(34, 214, '1'),
(34, 215, '1'),
(34, 216, '1'),
(34, 217, '1'),
(34, 218, '1'),
(34, 219, '1'),
(34, 220, '1'),
(34, 221, '1'),
(34, 222, '1'),
(34, 223, '1'),
(34, 224, '1'),
(34, 225, '1'),
(34, 226, '1'),
(34, 227, '1'),
(34, 228, '1'),
(34, 229, '1'),
(34, 230, '1'),
(34, 231, '1'),
(34, 232, '1'),
(34, 233, '1'),
(34, 234, '1'),
(34, 235, '1'),
(34, 236, '1'),
(34, 237, '1'),
(34, 238, '1'),
(34, 239, '1'),
(34, 240, '1'),
(34, 241, '1'),
(34, 242, '1'),
(34, 243, '1'),
(34, 244, '1'),
(34, 245, '1'),
(34, 246, '1'),
(34, 247, '1'),
(34, 248, '1'),
(34, 249, '1'),
(34, 250, '1'),
(34, 251, '1'),
(34, 252, '1'),
(34, 253, '1'),
(34, 254, '1'),
(34, 255, '1'),
(34, 256, '1'),
(34, 257, '1'),
(34, 258, '1'),
(34, 259, '1'),
(34, 260, '1'),
(34, 261, '1'),
(34, 262, '1'),
(34, 263, '1'),
(34, 264, '1'),
(34, 265, '1'),
(34, 266, '1'),
(34, 267, '1'),
(34, 268, '1'),
(34, 269, '1'),
(34, 270, '1'),
(34, 271, '1'),
(34, 272, '1'),
(34, 273, '1'),
(34, 274, '1'),
(34, 275, '1'),
(34, 276, '1'),
(34, 277, '1'),
(34, 278, '1'),
(34, 279, '1'),
(34, 280, '1'),
(34, 281, '1'),
(34, 282, '1'),
(34, 283, '1'),
(34, 284, '1'),
(34, 285, '1'),
(34, 286, '1'),
(34, 287, '1'),
(34, 288, '1'),
(34, 289, '1'),
(34, 290, '1'),
(34, 291, '1'),
(34, 292, '1'),
(34, 293, '1'),
(34, 294, '1'),
(34, 295, '1'),
(34, 296, '1'),
(34, 297, '1'),
(34, 298, '1'),
(34, 299, '1'),
(34, 300, '1'),
(34, 301, '1'),
(34, 302, '1'),
(34, 303, '1'),
(34, 304, '1'),
(34, 305, '1'),
(34, 306, '1'),
(34, 307, '1'),
(34, 308, '1'),
(34, 309, '1'),
(34, 310, '1'),
(34, 311, '1'),
(34, 312, '1'),
(34, 313, '1'),
(34, 314, '1'),
(34, 315, '1'),
(34, 316, '1'),
(34, 317, '1'),
(34, 318, '1'),
(34, 319, '1'),
(34, 320, '1'),
(34, 321, '1'),
(34, 322, '1'),
(34, 323, '1'),
(34, 324, '1'),
(34, 325, '1'),
(34, 326, '1'),
(34, 327, '1'),
(34, 328, '1'),
(34, 329, '1'),
(34, 330, '1'),
(34, 331, '1'),
(34, 332, '1'),
(34, 333, '1'),
(34, 334, '1'),
(34, 335, '1'),
(34, 336, '1'),
(34, 337, '1'),
(34, 338, '1'),
(34, 339, '1'),
(34, 340, '1'),
(34, 341, '1'),
(34, 342, '1'),
(34, 343, '1'),
(34, 344, '1'),
(34, 345, '1'),
(34, 346, '1'),
(34, 347, '1'),
(34, 348, '1'),
(34, 349, '1'),
(34, 350, '1'),
(34, 351, '1'),
(34, 352, '1'),
(34, 353, '1'),
(34, 354, '1'),
(34, 355, '1'),
(34, 356, '1'),
(34, 357, '1'),
(34, 358, '1'),
(34, 359, '1'),
(34, 360, '1'),
(34, 361, '1'),
(34, 362, '1'),
(34, 363, '1'),
(34, 364, '1'),
(34, 365, '1'),
(34, 771, '1'),
(34, 773, '1'),
(34, 774, '1'),
(35, 3, '1'),
(35, 22, '1'),
(35, 23, '1'),
(35, 24, '1'),
(35, 25, '1'),
(35, 39, '1'),
(35, 40, '1'),
(35, 41, '1'),
(35, 42, '1'),
(35, 43, '1'),
(35, 44, '1'),
(35, 45, '1'),
(35, 46, '1'),
(35, 47, '1'),
(35, 48, '1'),
(35, 49, '1'),
(35, 50, '1'),
(35, 51, '1'),
(35, 52, '1'),
(35, 53, '1'),
(35, 54, '1'),
(35, 55, '1'),
(35, 56, '1'),
(35, 57, '1'),
(35, 58, '1'),
(35, 59, '1'),
(35, 156, '1'),
(35, 157, '1'),
(35, 158, '1'),
(35, 159, '1'),
(35, 160, '1'),
(35, 161, '1'),
(35, 162, '1'),
(35, 163, '1'),
(35, 164, '1'),
(35, 165, '1'),
(35, 166, '1'),
(35, 167, '1'),
(35, 168, '1'),
(35, 169, '1'),
(35, 170, '1'),
(35, 171, '1'),
(35, 172, '1'),
(35, 173, '1'),
(35, 174, '1'),
(35, 175, '1'),
(35, 176, '1'),
(35, 177, '1'),
(35, 178, '1'),
(35, 179, '1'),
(35, 180, '1'),
(35, 181, '1'),
(35, 182, '1'),
(35, 183, '1'),
(35, 184, '1'),
(35, 185, '1'),
(35, 186, '1'),
(35, 187, '1'),
(35, 188, '1'),
(35, 189, '1'),
(35, 190, '1'),
(35, 191, '1'),
(35, 192, '1'),
(35, 193, '1'),
(35, 194, '1'),
(35, 195, '1'),
(35, 196, '1'),
(35, 197, '1'),
(35, 198, '1'),
(35, 199, '1'),
(35, 200, '1'),
(35, 201, '1'),
(35, 202, '1'),
(35, 203, '1'),
(35, 204, '1'),
(35, 205, '1'),
(35, 206, '1'),
(35, 207, '1'),
(35, 208, '1'),
(35, 209, '1'),
(35, 210, '1'),
(35, 211, '1'),
(35, 212, '1'),
(35, 213, '1'),
(35, 214, '1'),
(35, 215, '1'),
(35, 216, '1'),
(35, 217, '1'),
(35, 218, '1'),
(35, 219, '1'),
(35, 220, '1'),
(35, 221, '1'),
(35, 222, '1'),
(35, 223, '1'),
(35, 224, '1'),
(35, 225, '1'),
(35, 226, '1'),
(35, 227, '1'),
(35, 228, '1'),
(35, 229, '1'),
(35, 230, '1'),
(35, 231, '1'),
(35, 232, '1'),
(35, 233, '1'),
(35, 234, '1'),
(35, 235, '1'),
(35, 236, '1'),
(35, 237, '1'),
(35, 238, '1'),
(35, 239, '1'),
(35, 240, '1'),
(35, 241, '1'),
(35, 242, '1'),
(35, 243, '1'),
(35, 244, '1'),
(35, 245, '1'),
(35, 246, '1'),
(35, 247, '1'),
(35, 248, '1'),
(35, 249, '1'),
(35, 250, '1'),
(35, 251, '1'),
(35, 252, '1'),
(35, 253, '1'),
(35, 254, '1'),
(35, 255, '1'),
(35, 256, '1'),
(35, 257, '1'),
(35, 258, '1'),
(35, 259, '1'),
(35, 260, '1'),
(35, 261, '1'),
(35, 262, '1'),
(35, 263, '1'),
(35, 264, '1'),
(35, 265, '1'),
(35, 266, '1'),
(35, 267, '1'),
(35, 268, '1'),
(35, 269, '1'),
(35, 270, '1'),
(35, 271, '1'),
(35, 272, '1'),
(35, 273, '1'),
(35, 274, '1'),
(35, 275, '1'),
(35, 276, '1'),
(35, 277, '1'),
(35, 278, '1'),
(35, 279, '1'),
(35, 280, '1'),
(35, 281, '1'),
(35, 282, '1'),
(35, 283, '1'),
(35, 284, '1'),
(35, 285, '1'),
(35, 286, '1'),
(35, 287, '1'),
(35, 288, '1'),
(35, 289, '1'),
(35, 290, '1'),
(35, 291, '1'),
(35, 292, '1'),
(35, 293, '1'),
(35, 294, '1'),
(35, 295, '1'),
(35, 296, '1'),
(35, 297, '1'),
(35, 298, '1'),
(35, 299, '1'),
(35, 300, '1'),
(35, 301, '1'),
(35, 302, '1'),
(35, 303, '1'),
(35, 304, '1'),
(35, 305, '1'),
(35, 306, '1'),
(35, 307, '1'),
(35, 308, '1'),
(35, 309, '1'),
(35, 310, '1'),
(35, 311, '1'),
(35, 312, '1'),
(35, 313, '1'),
(35, 314, '1'),
(35, 315, '1'),
(35, 316, '1'),
(35, 317, '1'),
(35, 318, '1'),
(35, 319, '1'),
(35, 320, '1'),
(35, 321, '1'),
(35, 322, '1'),
(35, 323, '1'),
(35, 324, '1'),
(35, 325, '1'),
(35, 326, '1'),
(35, 327, '1'),
(35, 328, '1'),
(35, 329, '1'),
(35, 330, '1'),
(35, 331, '1'),
(35, 332, '1'),
(35, 333, '1'),
(35, 334, '1'),
(35, 335, '1'),
(35, 336, '1'),
(35, 337, '1'),
(35, 338, '1'),
(35, 339, '1'),
(35, 340, '1'),
(35, 341, '1'),
(35, 342, '1'),
(35, 343, '1'),
(35, 344, '1'),
(35, 345, '1'),
(35, 346, '1'),
(35, 347, '1'),
(35, 348, '1'),
(35, 349, '1'),
(35, 350, '1'),
(35, 351, '1'),
(35, 352, '1'),
(35, 353, '1'),
(35, 354, '1'),
(35, 355, '1'),
(35, 356, '1'),
(35, 357, '1'),
(35, 358, '1'),
(35, 359, '1'),
(35, 360, '1'),
(35, 361, '1'),
(35, 362, '1'),
(35, 363, '1'),
(35, 364, '1'),
(35, 365, '1'),
(35, 771, '1'),
(35, 773, '1'),
(35, 774, '1'),
(36, 3, '1'),
(36, 22, '1'),
(36, 23, '1'),
(36, 24, '1'),
(36, 25, '1'),
(36, 39, '1'),
(36, 40, '1'),
(36, 41, '1'),
(36, 42, '1'),
(36, 43, '1'),
(36, 44, '1'),
(36, 45, '1'),
(36, 46, '1'),
(36, 47, '1'),
(36, 48, '1'),
(36, 49, '1'),
(36, 50, '1'),
(36, 51, '1'),
(36, 52, '1'),
(36, 53, '1'),
(36, 54, '1'),
(36, 55, '1'),
(36, 56, '1'),
(36, 57, '1'),
(36, 58, '1'),
(36, 59, '1'),
(36, 156, '1'),
(36, 157, '1'),
(36, 158, '1'),
(36, 159, '1'),
(36, 160, '1'),
(36, 161, '1'),
(36, 162, '1'),
(36, 163, '1'),
(36, 164, '1'),
(36, 165, '1'),
(36, 166, '1'),
(36, 167, '1'),
(36, 168, '1'),
(36, 169, '1'),
(36, 170, '1'),
(36, 171, '1'),
(36, 172, '1'),
(36, 173, '1'),
(36, 174, '1'),
(36, 175, '1'),
(36, 176, '1'),
(36, 177, '1'),
(36, 178, '1'),
(36, 179, '1'),
(36, 180, '1'),
(36, 181, '1'),
(36, 182, '1'),
(36, 183, '1'),
(36, 184, '1'),
(36, 185, '1'),
(36, 186, '1'),
(36, 187, '1'),
(36, 188, '1'),
(36, 189, '1'),
(36, 190, '1'),
(36, 191, '1'),
(36, 192, '1'),
(36, 193, '1'),
(36, 194, '1'),
(36, 195, '1'),
(36, 196, '1'),
(36, 197, '1'),
(36, 198, '1'),
(36, 199, '1'),
(36, 200, '1'),
(36, 201, '1'),
(36, 202, '1'),
(36, 203, '1'),
(36, 204, '1'),
(36, 205, '1'),
(36, 206, '1'),
(36, 207, '1'),
(36, 208, '1'),
(36, 209, '1'),
(36, 210, '1'),
(36, 211, '1'),
(36, 212, '1'),
(36, 213, '1'),
(36, 214, '1'),
(36, 215, '1'),
(36, 216, '1'),
(36, 217, '1'),
(36, 218, '1'),
(36, 219, '1'),
(36, 220, '1'),
(36, 221, '1'),
(36, 222, '1'),
(36, 223, '1'),
(36, 224, '1'),
(36, 225, '1'),
(36, 226, '1'),
(36, 227, '1'),
(36, 228, '1'),
(36, 229, '1'),
(36, 230, '1'),
(36, 231, '1'),
(36, 232, '1'),
(36, 233, '1'),
(36, 234, '1'),
(36, 235, '1'),
(36, 236, '1'),
(36, 237, '1'),
(36, 238, '1'),
(36, 239, '1'),
(36, 240, '1'),
(36, 241, '1'),
(36, 242, '1'),
(36, 243, '1'),
(36, 244, '1'),
(36, 245, '1'),
(36, 246, '1'),
(36, 247, '1'),
(36, 248, '1'),
(36, 249, '1'),
(36, 250, '1'),
(36, 251, '1'),
(36, 252, '1'),
(36, 253, '1'),
(36, 254, '1'),
(36, 255, '1'),
(36, 256, '1'),
(36, 257, '1'),
(36, 258, '1'),
(36, 259, '1'),
(36, 260, '1'),
(36, 261, '1'),
(36, 262, '1'),
(36, 263, '1'),
(36, 264, '1'),
(36, 265, '1'),
(36, 266, '1'),
(36, 267, '1'),
(36, 268, '1'),
(36, 269, '1'),
(36, 270, '1'),
(36, 271, '1'),
(36, 272, '1'),
(36, 273, '1'),
(36, 274, '1'),
(36, 275, '1'),
(36, 276, '1'),
(36, 277, '1'),
(36, 278, '1'),
(36, 279, '1'),
(36, 280, '1'),
(36, 281, '1'),
(36, 282, '1'),
(36, 283, '1'),
(36, 284, '1'),
(36, 285, '1'),
(36, 286, '1'),
(36, 287, '1'),
(36, 288, '1'),
(36, 289, '1'),
(36, 290, '1'),
(36, 291, '1'),
(36, 292, '1'),
(36, 293, '1'),
(36, 294, '1'),
(36, 295, '1'),
(36, 296, '1'),
(36, 297, '1'),
(36, 298, '1'),
(36, 299, '1'),
(36, 300, '1'),
(36, 301, '1'),
(36, 302, '1'),
(36, 303, '1'),
(36, 304, '1'),
(36, 305, '1'),
(36, 306, '1'),
(36, 307, '1'),
(36, 308, '1'),
(36, 309, '1'),
(36, 310, '1'),
(36, 311, '1'),
(36, 312, '1'),
(36, 313, '1'),
(36, 314, '1'),
(36, 315, '1'),
(36, 316, '1'),
(36, 317, '1'),
(36, 318, '1'),
(36, 319, '1'),
(36, 320, '1'),
(36, 321, '1'),
(36, 322, '1'),
(36, 323, '1'),
(36, 324, '1'),
(36, 325, '1'),
(36, 326, '1'),
(36, 327, '1'),
(36, 328, '1'),
(36, 329, '1'),
(36, 330, '1'),
(36, 331, '1'),
(36, 332, '1'),
(36, 333, '1'),
(36, 334, '1'),
(36, 335, '1'),
(36, 336, '1'),
(36, 337, '1'),
(36, 338, '1'),
(36, 339, '1'),
(36, 340, '1'),
(36, 341, '1'),
(36, 342, '1'),
(36, 343, '1'),
(36, 344, '1'),
(36, 345, '1'),
(36, 346, '1'),
(36, 347, '1'),
(36, 348, '1'),
(36, 349, '1'),
(36, 350, '1'),
(36, 351, '1'),
(36, 352, '1'),
(36, 353, '1'),
(36, 354, '1'),
(36, 355, '1'),
(36, 356, '1'),
(36, 357, '1'),
(36, 358, '1'),
(36, 359, '1'),
(36, 360, '1'),
(36, 361, '1'),
(36, 362, '1'),
(36, 363, '1'),
(36, 364, '1'),
(36, 365, '1'),
(36, 771, '1'),
(36, 773, '1'),
(36, 774, '1'),
(37, 3, '1'),
(37, 22, '1'),
(37, 23, '1'),
(37, 24, '1'),
(37, 25, '1'),
(37, 39, '1'),
(37, 40, '1'),
(37, 41, '1'),
(37, 42, '1'),
(37, 43, '1'),
(37, 44, '1'),
(37, 45, '1'),
(37, 46, '1'),
(37, 47, '1'),
(37, 48, '1'),
(37, 49, '1'),
(37, 50, '1'),
(37, 51, '1'),
(37, 52, '1'),
(37, 53, '1'),
(37, 54, '1'),
(37, 55, '1'),
(37, 56, '1'),
(37, 57, '1'),
(37, 58, '1'),
(37, 59, '1'),
(37, 156, '1'),
(37, 157, '1'),
(37, 158, '1'),
(37, 159, '1'),
(37, 160, '1'),
(37, 161, '1'),
(37, 162, '1'),
(37, 163, '1'),
(37, 164, '1'),
(37, 165, '1'),
(37, 166, '1'),
(37, 167, '1'),
(37, 168, '1'),
(37, 169, '1'),
(37, 170, '1'),
(37, 171, '1'),
(37, 172, '1'),
(37, 173, '1'),
(37, 174, '1'),
(37, 175, '1'),
(37, 176, '1'),
(37, 177, '1'),
(37, 178, '1'),
(37, 179, '1'),
(37, 180, '1'),
(37, 181, '1'),
(37, 182, '1'),
(37, 183, '1'),
(37, 184, '1'),
(37, 185, '1'),
(37, 186, '1'),
(37, 187, '1'),
(37, 188, '1'),
(37, 189, '1'),
(37, 190, '1'),
(37, 191, '1'),
(37, 192, '1'),
(37, 193, '1'),
(37, 194, '1'),
(37, 195, '1'),
(37, 196, '1'),
(37, 197, '1'),
(37, 198, '1'),
(37, 199, '1'),
(37, 200, '1'),
(37, 201, '1'),
(37, 202, '1'),
(37, 203, '1'),
(37, 204, '1'),
(37, 205, '1'),
(37, 206, '1'),
(37, 207, '1'),
(37, 208, '1'),
(37, 209, '1'),
(37, 210, '1'),
(37, 211, '1'),
(37, 212, '1'),
(37, 213, '1'),
(37, 214, '1'),
(37, 215, '1'),
(37, 216, '1'),
(37, 217, '1'),
(37, 218, '1'),
(37, 219, '1'),
(37, 220, '1'),
(37, 221, '1'),
(37, 222, '1'),
(37, 223, '1'),
(37, 224, '1'),
(37, 225, '1'),
(37, 226, '1'),
(37, 227, '1'),
(37, 228, '1'),
(37, 229, '1'),
(37, 230, '1'),
(37, 231, '1'),
(37, 232, '1'),
(37, 233, '1'),
(37, 234, '1'),
(37, 235, '1'),
(37, 236, '1'),
(37, 237, '1'),
(37, 238, '1'),
(37, 239, '1'),
(37, 240, '1'),
(37, 241, '1'),
(37, 242, '1'),
(37, 243, '1'),
(37, 244, '1'),
(37, 245, '1'),
(37, 246, '1'),
(37, 247, '1'),
(37, 248, '1'),
(37, 249, '1'),
(37, 250, '1'),
(37, 251, '1'),
(37, 252, '1'),
(37, 253, '1'),
(37, 254, '1'),
(37, 255, '1'),
(37, 256, '1'),
(37, 257, '1'),
(37, 258, '1'),
(37, 259, '1'),
(37, 260, '1'),
(37, 261, '1'),
(37, 262, '1'),
(37, 263, '1'),
(37, 264, '1'),
(37, 265, '1'),
(37, 266, '1'),
(37, 267, '1'),
(37, 268, '1'),
(37, 269, '1'),
(37, 270, '1'),
(37, 271, '1'),
(37, 272, '1'),
(37, 273, '1'),
(37, 274, '1'),
(37, 275, '1'),
(37, 276, '1'),
(37, 277, '1'),
(37, 278, '1'),
(37, 279, '1'),
(37, 280, '1'),
(37, 281, '1'),
(37, 282, '1'),
(37, 283, '1'),
(37, 284, '1'),
(37, 285, '1'),
(37, 286, '1'),
(37, 287, '1'),
(37, 288, '1'),
(37, 289, '1'),
(37, 290, '1'),
(37, 291, '1'),
(37, 292, '1'),
(37, 293, '1'),
(37, 294, '1'),
(37, 295, '1'),
(37, 296, '1'),
(37, 297, '1'),
(37, 298, '1'),
(37, 299, '1'),
(37, 300, '1'),
(37, 301, '1'),
(37, 302, '1'),
(37, 303, '1'),
(37, 304, '1'),
(37, 305, '1'),
(37, 306, '1'),
(37, 307, '1'),
(37, 308, '1'),
(37, 309, '1'),
(37, 310, '1'),
(37, 311, '1'),
(37, 312, '1'),
(37, 313, '1'),
(37, 314, '1'),
(37, 315, '1'),
(37, 316, '1'),
(37, 317, '1'),
(37, 318, '1'),
(37, 319, '1'),
(37, 320, '1'),
(37, 321, '1'),
(37, 322, '1'),
(37, 323, '1'),
(37, 324, '1'),
(37, 325, '1'),
(37, 326, '1'),
(37, 327, '1'),
(37, 328, '1'),
(37, 329, '1'),
(37, 330, '1'),
(37, 331, '1'),
(37, 332, '1'),
(37, 333, '1'),
(37, 334, '1'),
(37, 335, '1'),
(37, 336, '1'),
(37, 337, '1'),
(37, 338, '1'),
(37, 339, '1'),
(37, 340, '1'),
(37, 341, '1'),
(37, 342, '1'),
(37, 343, '1'),
(37, 344, '1'),
(37, 345, '1'),
(37, 346, '1'),
(37, 347, '1'),
(37, 348, '1'),
(37, 349, '1'),
(37, 350, '1'),
(37, 351, '1'),
(37, 352, '1'),
(37, 353, '1'),
(37, 354, '1'),
(37, 355, '1'),
(37, 356, '1'),
(37, 357, '1'),
(37, 358, '1'),
(37, 359, '1'),
(37, 360, '1'),
(37, 361, '1'),
(37, 362, '1'),
(37, 363, '1'),
(37, 364, '1'),
(37, 365, '1'),
(37, 771, '1'),
(37, 773, '1'),
(37, 774, '1'),
(38, 3, '1'),
(38, 22, '1'),
(38, 23, '1'),
(38, 24, '1'),
(38, 25, '1'),
(38, 39, '1'),
(38, 40, '1'),
(38, 41, '1'),
(38, 42, '1'),
(38, 43, '1'),
(38, 44, '1'),
(38, 45, '1'),
(38, 46, '1'),
(38, 47, '1'),
(38, 48, '1'),
(38, 49, '1'),
(38, 50, '1'),
(38, 51, '1'),
(38, 52, '1'),
(38, 53, '1'),
(38, 54, '1'),
(38, 55, '1'),
(38, 56, '1'),
(38, 57, '1'),
(38, 58, '1'),
(38, 59, '1'),
(38, 156, '1'),
(38, 157, '1'),
(38, 158, '1'),
(38, 159, '1'),
(38, 160, '1'),
(38, 161, '1'),
(38, 162, '1'),
(38, 163, '1'),
(38, 164, '1'),
(38, 165, '1'),
(38, 166, '1'),
(38, 167, '1'),
(38, 168, '1'),
(38, 169, '1'),
(38, 170, '1'),
(38, 171, '1'),
(38, 172, '1'),
(38, 173, '1'),
(38, 174, '1'),
(38, 175, '1'),
(38, 176, '1'),
(38, 177, '1'),
(38, 178, '1'),
(38, 179, '1'),
(38, 180, '1'),
(38, 181, '1'),
(38, 182, '1'),
(38, 183, '1'),
(38, 184, '1'),
(38, 185, '1'),
(38, 186, '1'),
(38, 187, '1'),
(38, 188, '1'),
(38, 189, '1'),
(38, 190, '1'),
(38, 191, '1'),
(38, 192, '1'),
(38, 193, '1'),
(38, 194, '1'),
(38, 195, '1'),
(38, 196, '1'),
(38, 197, '1'),
(38, 198, '1'),
(38, 199, '1'),
(38, 200, '1'),
(38, 201, '1'),
(38, 202, '1'),
(38, 203, '1'),
(38, 204, '1'),
(38, 205, '1'),
(38, 206, '1'),
(38, 207, '1'),
(38, 208, '1'),
(38, 209, '1'),
(38, 210, '1'),
(38, 211, '1'),
(38, 212, '1'),
(38, 213, '1'),
(38, 214, '1'),
(38, 215, '1'),
(38, 216, '1'),
(38, 217, '1'),
(38, 218, '1'),
(38, 219, '1'),
(38, 220, '1'),
(38, 221, '1'),
(38, 222, '1'),
(38, 223, '1'),
(38, 224, '1'),
(38, 225, '1'),
(38, 226, '1'),
(38, 227, '1'),
(38, 228, '1'),
(38, 229, '1'),
(38, 230, '1'),
(38, 231, '1'),
(38, 232, '1'),
(38, 233, '1'),
(38, 234, '1'),
(38, 235, '1'),
(38, 236, '1'),
(38, 237, '1'),
(38, 238, '1'),
(38, 239, '1'),
(38, 240, '1'),
(38, 241, '1'),
(38, 242, '1'),
(38, 243, '1'),
(38, 244, '1'),
(38, 245, '1'),
(38, 246, '1'),
(38, 247, '1'),
(38, 248, '1'),
(38, 249, '1'),
(38, 250, '1'),
(38, 251, '1'),
(38, 252, '1'),
(38, 253, '1'),
(38, 254, '1'),
(38, 255, '1'),
(38, 256, '1'),
(38, 257, '1'),
(38, 258, '1'),
(38, 259, '1'),
(38, 260, '1'),
(38, 261, '1'),
(38, 262, '1'),
(38, 263, '1'),
(38, 264, '1'),
(38, 265, '1'),
(38, 266, '1'),
(38, 267, '1'),
(38, 268, '1'),
(38, 269, '1'),
(38, 270, '1'),
(38, 271, '1'),
(38, 272, '1'),
(38, 273, '1'),
(38, 274, '1'),
(38, 275, '1'),
(38, 276, '1'),
(38, 277, '1'),
(38, 278, '1'),
(38, 279, '1'),
(38, 280, '1'),
(38, 281, '1'),
(38, 282, '1'),
(38, 283, '1'),
(38, 284, '1'),
(38, 285, '1'),
(38, 286, '1'),
(38, 287, '1'),
(38, 288, '1'),
(38, 289, '1'),
(38, 290, '1'),
(38, 291, '1'),
(38, 292, '1'),
(38, 293, '1'),
(38, 294, '1'),
(38, 295, '1'),
(38, 296, '1'),
(38, 297, '1'),
(38, 298, '1'),
(38, 299, '1'),
(38, 300, '1'),
(38, 301, '1'),
(38, 302, '1'),
(38, 303, '1'),
(38, 304, '1'),
(38, 305, '1'),
(38, 306, '1'),
(38, 307, '1'),
(38, 308, '1'),
(38, 309, '1'),
(38, 310, '1'),
(38, 311, '1'),
(38, 312, '1'),
(38, 313, '1'),
(38, 314, '1'),
(38, 315, '1'),
(38, 316, '1'),
(38, 317, '1'),
(38, 318, '1'),
(38, 319, '1'),
(38, 320, '1'),
(38, 321, '1'),
(38, 322, '1'),
(38, 323, '1'),
(38, 324, '1'),
(38, 325, '1'),
(38, 326, '1'),
(38, 327, '1'),
(38, 328, '1'),
(38, 329, '1'),
(38, 330, '1'),
(38, 331, '1'),
(38, 332, '1'),
(38, 333, '1'),
(38, 334, '1'),
(38, 335, '1'),
(38, 336, '1'),
(38, 337, '1'),
(38, 338, '1'),
(38, 339, '1'),
(38, 340, '1'),
(38, 341, '1'),
(38, 342, '1'),
(38, 343, '1'),
(38, 344, '1'),
(38, 345, '1'),
(38, 346, '1'),
(38, 347, '1'),
(38, 348, '1'),
(38, 349, '1'),
(38, 350, '1'),
(38, 351, '1'),
(38, 352, '1'),
(38, 353, '1'),
(38, 354, '1'),
(38, 355, '1'),
(38, 356, '1'),
(38, 357, '1'),
(38, 358, '1'),
(38, 359, '1'),
(38, 360, '1'),
(38, 361, '1'),
(38, 362, '1'),
(38, 363, '1'),
(38, 364, '1'),
(38, 365, '1'),
(38, 771, '1'),
(38, 773, '1'),
(38, 774, '1'),
(39, 3, '1'),
(39, 22, '1'),
(39, 23, '1'),
(39, 24, '1'),
(39, 25, '1'),
(39, 39, '1'),
(39, 40, '1'),
(39, 41, '1'),
(39, 42, '1'),
(39, 43, '1'),
(39, 44, '1'),
(39, 45, '1'),
(39, 46, '1'),
(39, 47, '1'),
(39, 48, '1'),
(39, 49, '1'),
(39, 50, '1'),
(39, 51, '1'),
(39, 52, '1'),
(39, 53, '1'),
(39, 54, '1'),
(39, 55, '1'),
(39, 56, '1'),
(39, 57, '1'),
(39, 58, '1'),
(39, 59, '1'),
(39, 156, '1'),
(39, 157, '1'),
(39, 158, '1'),
(39, 159, '1'),
(39, 160, '1'),
(39, 161, '1'),
(39, 162, '1'),
(39, 163, '1'),
(39, 164, '1'),
(39, 165, '1'),
(39, 166, '1'),
(39, 167, '1'),
(39, 168, '1'),
(39, 169, '1'),
(39, 170, '1'),
(39, 171, '1'),
(39, 172, '1'),
(39, 173, '1'),
(39, 174, '1'),
(39, 175, '1'),
(39, 176, '1'),
(39, 177, '1'),
(39, 178, '1'),
(39, 179, '1'),
(39, 180, '1'),
(39, 181, '1'),
(39, 182, '1'),
(39, 183, '1'),
(39, 184, '1'),
(39, 185, '1'),
(39, 186, '1'),
(39, 187, '1'),
(39, 188, '1'),
(39, 189, '1'),
(39, 190, '1'),
(39, 191, '1'),
(39, 192, '1'),
(39, 193, '1'),
(39, 194, '1'),
(39, 195, '1'),
(39, 196, '1'),
(39, 197, '1'),
(39, 198, '1'),
(39, 199, '1'),
(39, 200, '1'),
(39, 201, '1'),
(39, 202, '1'),
(39, 203, '1'),
(39, 204, '1'),
(39, 205, '1'),
(39, 206, '1'),
(39, 207, '1'),
(39, 208, '1'),
(39, 209, '1'),
(39, 210, '1'),
(39, 211, '1'),
(39, 212, '1'),
(39, 213, '1'),
(39, 214, '1'),
(39, 215, '1'),
(39, 216, '1'),
(39, 217, '1'),
(39, 218, '1'),
(39, 219, '1'),
(39, 220, '1'),
(39, 221, '1'),
(39, 222, '1'),
(39, 223, '1'),
(39, 224, '1'),
(39, 225, '1'),
(39, 226, '1'),
(39, 227, '1'),
(39, 228, '1'),
(39, 229, '1'),
(39, 230, '1'),
(39, 231, '1'),
(39, 232, '1'),
(39, 233, '1'),
(39, 234, '1'),
(39, 235, '1'),
(39, 236, '1'),
(39, 237, '1'),
(39, 238, '1'),
(39, 239, '1'),
(39, 240, '1'),
(39, 241, '1'),
(39, 242, '1'),
(39, 243, '1'),
(39, 244, '1'),
(39, 245, '1'),
(39, 246, '1'),
(39, 247, '1'),
(39, 248, '1'),
(39, 249, '1'),
(39, 250, '1'),
(39, 251, '1'),
(39, 252, '1'),
(39, 253, '1'),
(39, 254, '1'),
(39, 255, '1'),
(39, 256, '1'),
(39, 257, '1'),
(39, 258, '1'),
(39, 259, '1'),
(39, 260, '1'),
(39, 261, '1'),
(39, 262, '1'),
(39, 263, '1'),
(39, 264, '1'),
(39, 265, '1'),
(39, 266, '1'),
(39, 267, '1'),
(39, 268, '1'),
(39, 269, '1'),
(39, 270, '1'),
(39, 271, '1'),
(39, 272, '1'),
(39, 273, '1'),
(39, 274, '1'),
(39, 275, '1'),
(39, 276, '1'),
(39, 277, '1'),
(39, 278, '1'),
(39, 279, '1'),
(39, 280, '1'),
(39, 281, '1'),
(39, 282, '1'),
(39, 283, '1'),
(39, 284, '1'),
(39, 285, '1'),
(39, 286, '1'),
(39, 287, '1'),
(39, 288, '1'),
(39, 289, '1'),
(39, 290, '1'),
(39, 291, '1'),
(39, 292, '1'),
(39, 293, '1'),
(39, 294, '1'),
(39, 295, '1'),
(39, 296, '1'),
(39, 297, '1'),
(39, 298, '1'),
(39, 299, '1'),
(39, 300, '1'),
(39, 301, '1'),
(39, 302, '1'),
(39, 303, '1'),
(39, 304, '1'),
(39, 305, '1'),
(39, 306, '1'),
(39, 307, '1'),
(39, 308, '1'),
(39, 309, '1'),
(39, 310, '1'),
(39, 311, '1'),
(39, 312, '1'),
(39, 313, '1'),
(39, 314, '1'),
(39, 315, '1'),
(39, 316, '1'),
(39, 317, '1'),
(39, 318, '1'),
(39, 319, '1'),
(39, 320, '1'),
(39, 321, '1'),
(39, 322, '1'),
(39, 323, '1'),
(39, 324, '1'),
(39, 325, '1'),
(39, 326, '1'),
(39, 327, '1'),
(39, 328, '1'),
(39, 329, '1'),
(39, 330, '1'),
(39, 331, '1'),
(39, 332, '1'),
(39, 333, '1'),
(39, 334, '1'),
(39, 335, '1'),
(39, 336, '1'),
(39, 337, '1'),
(39, 338, '1'),
(39, 339, '1'),
(39, 340, '1'),
(39, 341, '1'),
(39, 342, '1'),
(39, 343, '1'),
(39, 344, '1'),
(39, 345, '1'),
(39, 346, '1'),
(39, 347, '1'),
(39, 348, '1'),
(39, 349, '1'),
(39, 350, '1'),
(39, 351, '1'),
(39, 352, '1'),
(39, 353, '1'),
(39, 354, '1'),
(39, 355, '1'),
(39, 356, '1'),
(39, 357, '1'),
(39, 358, '1'),
(39, 359, '1'),
(39, 360, '1'),
(39, 361, '1'),
(39, 362, '1'),
(39, 363, '1'),
(39, 364, '1'),
(39, 365, '1'),
(39, 771, '1'),
(39, 773, '1'),
(39, 774, '1'),
(40, 3, '1'),
(40, 22, '1'),
(40, 23, '1'),
(40, 24, '1'),
(40, 25, '1'),
(40, 39, '1'),
(40, 40, '1'),
(40, 41, '1'),
(40, 42, '1'),
(40, 43, '1'),
(40, 44, '1'),
(40, 45, '1'),
(40, 46, '1'),
(40, 47, '1'),
(40, 48, '1'),
(40, 49, '1'),
(40, 50, '1'),
(40, 51, '1'),
(40, 52, '1'),
(40, 53, '1'),
(40, 54, '1'),
(40, 55, '1'),
(40, 56, '1'),
(40, 57, '1'),
(40, 58, '1'),
(40, 59, '1'),
(40, 156, '1'),
(40, 157, '1'),
(40, 158, '1'),
(40, 159, '1'),
(40, 160, '1'),
(40, 161, '1'),
(40, 162, '1'),
(40, 163, '1'),
(40, 164, '1'),
(40, 165, '1'),
(40, 166, '1'),
(40, 167, '1'),
(40, 168, '1'),
(40, 169, '1'),
(40, 170, '1'),
(40, 171, '1'),
(40, 172, '1'),
(40, 173, '1'),
(40, 174, '1'),
(40, 175, '1'),
(40, 176, '1'),
(40, 177, '1'),
(40, 178, '1'),
(40, 179, '1'),
(40, 180, '1'),
(40, 181, '1'),
(40, 182, '1'),
(40, 183, '1'),
(40, 184, '1'),
(40, 185, '1'),
(40, 186, '1'),
(40, 187, '1'),
(40, 188, '1'),
(40, 189, '1'),
(40, 190, '1'),
(40, 191, '1'),
(40, 192, '1'),
(40, 193, '1'),
(40, 194, '1'),
(40, 195, '1'),
(40, 196, '1'),
(40, 197, '1'),
(40, 198, '1'),
(40, 199, '1'),
(40, 200, '1'),
(40, 201, '1'),
(40, 202, '1'),
(40, 203, '1'),
(40, 204, '1'),
(40, 205, '1'),
(40, 206, '1'),
(40, 207, '1'),
(40, 208, '1'),
(40, 209, '1'),
(40, 210, '1'),
(40, 211, '1'),
(40, 212, '1'),
(40, 213, '1'),
(40, 214, '1'),
(40, 215, '1'),
(40, 216, '1'),
(40, 217, '1'),
(40, 218, '1'),
(40, 219, '1'),
(40, 220, '1'),
(40, 221, '1'),
(40, 222, '1'),
(40, 223, '1'),
(40, 224, '1'),
(40, 225, '1'),
(40, 226, '1'),
(40, 227, '1'),
(40, 228, '1'),
(40, 229, '1'),
(40, 230, '1'),
(40, 231, '1'),
(40, 232, '1'),
(40, 233, '1'),
(40, 234, '1'),
(40, 235, '1'),
(40, 236, '1'),
(40, 237, '1'),
(40, 238, '1'),
(40, 239, '1'),
(40, 240, '1'),
(40, 241, '1'),
(40, 242, '1'),
(40, 243, '1'),
(40, 244, '1'),
(40, 245, '1'),
(40, 246, '1'),
(40, 247, '1'),
(40, 248, '1'),
(40, 249, '1'),
(40, 250, '1'),
(40, 251, '1'),
(40, 252, '1'),
(40, 253, '1'),
(40, 254, '1'),
(40, 255, '1'),
(40, 256, '1'),
(40, 257, '1'),
(40, 258, '1'),
(40, 259, '1'),
(40, 260, '1'),
(40, 261, '1'),
(40, 262, '1'),
(40, 263, '1'),
(40, 264, '1'),
(40, 265, '1'),
(40, 266, '1'),
(40, 267, '1'),
(40, 268, '1'),
(40, 269, '1'),
(40, 270, '1'),
(40, 271, '1'),
(40, 272, '1'),
(40, 273, '1'),
(40, 274, '1'),
(40, 275, '1'),
(40, 276, '1'),
(40, 277, '1'),
(40, 278, '1'),
(40, 279, '1'),
(40, 280, '1'),
(40, 281, '1'),
(40, 282, '1'),
(40, 283, '1'),
(40, 284, '1'),
(40, 285, '1'),
(40, 286, '1'),
(40, 287, '1'),
(40, 288, '1'),
(40, 289, '1'),
(40, 290, '1'),
(40, 291, '1'),
(40, 292, '1'),
(40, 293, '1'),
(40, 294, '1'),
(40, 295, '1'),
(40, 296, '1'),
(40, 297, '1'),
(40, 298, '1'),
(40, 299, '1'),
(40, 300, '1'),
(40, 301, '1'),
(40, 302, '1'),
(40, 303, '1'),
(40, 304, '1'),
(40, 305, '1'),
(40, 306, '1'),
(40, 307, '1'),
(40, 308, '1'),
(40, 309, '1'),
(40, 310, '1'),
(40, 311, '1'),
(40, 312, '1'),
(40, 313, '1'),
(40, 314, '1'),
(40, 315, '1'),
(40, 316, '1'),
(40, 317, '1'),
(40, 318, '1'),
(40, 319, '1'),
(40, 320, '1'),
(40, 321, '1'),
(40, 322, '1'),
(40, 323, '1'),
(40, 324, '1'),
(40, 325, '1'),
(40, 326, '1'),
(40, 327, '1'),
(40, 328, '1'),
(40, 329, '1'),
(40, 330, '1'),
(40, 331, '1'),
(40, 332, '1'),
(40, 333, '1'),
(40, 334, '1'),
(40, 335, '1'),
(40, 336, '1'),
(40, 337, '1'),
(40, 338, '1'),
(40, 339, '1'),
(40, 340, '1'),
(40, 341, '1'),
(40, 342, '1'),
(40, 343, '1'),
(40, 344, '1'),
(40, 345, '1'),
(40, 346, '1'),
(40, 347, '1'),
(40, 348, '1'),
(40, 349, '1'),
(40, 350, '1'),
(40, 351, '1'),
(40, 352, '1'),
(40, 353, '1'),
(40, 354, '1'),
(40, 355, '1'),
(40, 356, '1'),
(40, 357, '1'),
(40, 358, '1'),
(40, 359, '1'),
(40, 360, '1'),
(40, 361, '1'),
(40, 362, '1'),
(40, 363, '1'),
(40, 364, '1'),
(40, 365, '1'),
(40, 771, '1'),
(40, 773, '1'),
(40, 774, '1'),
(41, 3, '1'),
(41, 22, '1'),
(41, 23, '1'),
(41, 24, '1'),
(41, 25, '1'),
(41, 39, '1'),
(41, 40, '1'),
(41, 41, '1'),
(41, 42, '1'),
(41, 43, '1'),
(41, 44, '1'),
(41, 45, '1'),
(41, 46, '1'),
(41, 47, '1'),
(41, 48, '1'),
(41, 49, '1'),
(41, 50, '1'),
(41, 51, '1'),
(41, 52, '1'),
(41, 53, '1'),
(41, 54, '1'),
(41, 55, '1'),
(41, 56, '1'),
(41, 57, '1'),
(41, 58, '1'),
(41, 59, '1'),
(41, 156, '1'),
(41, 157, '1'),
(41, 158, '1'),
(41, 159, '1'),
(41, 160, '1'),
(41, 161, '1'),
(41, 162, '1'),
(41, 163, '1'),
(41, 164, '1'),
(41, 165, '1'),
(41, 166, '1'),
(41, 167, '1'),
(41, 168, '1'),
(41, 169, '1'),
(41, 170, '1'),
(41, 171, '1'),
(41, 172, '1'),
(41, 173, '1'),
(41, 174, '1'),
(41, 175, '1'),
(41, 176, '1'),
(41, 177, '1'),
(41, 178, '1'),
(41, 179, '1'),
(41, 180, '1'),
(41, 181, '1'),
(41, 182, '1'),
(41, 183, '1'),
(41, 184, '1'),
(41, 185, '1'),
(41, 186, '1'),
(41, 187, '1'),
(41, 188, '1'),
(41, 189, '1'),
(41, 190, '1'),
(41, 191, '1'),
(41, 192, '1'),
(41, 193, '1'),
(41, 194, '1'),
(41, 195, '1'),
(41, 196, '1'),
(41, 197, '1'),
(41, 198, '1'),
(41, 199, '1'),
(41, 200, '1'),
(41, 201, '1'),
(41, 202, '1'),
(41, 203, '1'),
(41, 204, '1'),
(41, 205, '1'),
(41, 206, '1'),
(41, 207, '1'),
(41, 208, '1'),
(41, 209, '1'),
(41, 210, '1'),
(41, 211, '1'),
(41, 212, '1'),
(41, 213, '1'),
(41, 214, '1'),
(41, 215, '1'),
(41, 216, '1'),
(41, 217, '1'),
(41, 218, '1'),
(41, 219, '1'),
(41, 220, '1'),
(41, 221, '1'),
(41, 222, '1'),
(41, 223, '1'),
(41, 224, '1'),
(41, 225, '1'),
(41, 226, '1'),
(41, 227, '1'),
(41, 228, '1'),
(41, 229, '1'),
(41, 230, '1'),
(41, 231, '1'),
(41, 232, '1'),
(41, 233, '1'),
(41, 234, '1'),
(41, 235, '1'),
(41, 236, '1'),
(41, 237, '1'),
(41, 238, '1'),
(41, 239, '1'),
(41, 240, '1'),
(41, 241, '1'),
(41, 242, '1'),
(41, 243, '1'),
(41, 244, '1'),
(41, 245, '1'),
(41, 246, '1'),
(41, 247, '1'),
(41, 248, '1'),
(41, 249, '1'),
(41, 250, '1'),
(41, 251, '1'),
(41, 252, '1'),
(41, 253, '1'),
(41, 254, '1'),
(41, 255, '1'),
(41, 256, '1'),
(41, 257, '1'),
(41, 258, '1'),
(41, 259, '1'),
(41, 260, '1'),
(41, 261, '1'),
(41, 262, '1'),
(41, 263, '1'),
(41, 264, '1'),
(41, 265, '1'),
(41, 266, '1'),
(41, 267, '1'),
(41, 268, '1'),
(41, 269, '1'),
(41, 270, '1'),
(41, 271, '1'),
(41, 272, '1'),
(41, 273, '1'),
(41, 274, '1'),
(41, 275, '1'),
(41, 276, '1'),
(41, 277, '1'),
(41, 278, '1'),
(41, 279, '1'),
(41, 280, '1'),
(41, 281, '1'),
(41, 282, '1'),
(41, 283, '1'),
(41, 284, '1'),
(41, 285, '1'),
(41, 286, '1'),
(41, 287, '1'),
(41, 288, '1'),
(41, 289, '1'),
(41, 290, '1'),
(41, 291, '1'),
(41, 292, '1'),
(41, 293, '1'),
(41, 294, '1'),
(41, 295, '1'),
(41, 296, '1'),
(41, 297, '1'),
(41, 298, '1'),
(41, 299, '1'),
(41, 300, '1'),
(41, 301, '1'),
(41, 302, '1'),
(41, 303, '1'),
(41, 304, '1'),
(41, 305, '1'),
(41, 306, '1'),
(41, 307, '1'),
(41, 308, '1'),
(41, 309, '1'),
(41, 310, '1'),
(41, 311, '1'),
(41, 312, '1'),
(41, 313, '1'),
(41, 314, '1'),
(41, 315, '1'),
(41, 316, '1'),
(41, 317, '1'),
(41, 318, '1'),
(41, 319, '1'),
(41, 320, '1'),
(41, 321, '1'),
(41, 322, '1'),
(41, 323, '1'),
(41, 324, '1'),
(41, 325, '1'),
(41, 326, '1'),
(41, 327, '1'),
(41, 328, '1'),
(41, 329, '1'),
(41, 330, '1'),
(41, 331, '1'),
(41, 332, '1'),
(41, 333, '1'),
(41, 334, '1'),
(41, 335, '1'),
(41, 336, '1'),
(41, 337, '1'),
(41, 338, '1'),
(41, 339, '1'),
(41, 340, '1'),
(41, 341, '1'),
(41, 342, '1'),
(41, 343, '1'),
(41, 344, '1'),
(41, 345, '1'),
(41, 346, '1'),
(41, 347, '1'),
(41, 348, '1'),
(41, 349, '1'),
(41, 350, '1'),
(41, 351, '1'),
(41, 352, '1'),
(41, 353, '1'),
(41, 354, '1'),
(41, 355, '1'),
(41, 356, '1'),
(41, 357, '1'),
(41, 358, '1'),
(41, 359, '1'),
(41, 360, '1'),
(41, 361, '1'),
(41, 362, '1'),
(41, 363, '1'),
(41, 364, '1'),
(41, 365, '1'),
(41, 771, '1'),
(41, 773, '1'),
(41, 774, '1'),
(42, 3, '1'),
(42, 22, '1'),
(42, 23, '1'),
(42, 24, '1'),
(42, 25, '1'),
(42, 39, '1'),
(42, 40, '1'),
(42, 41, '1'),
(42, 42, '1'),
(42, 43, '1'),
(42, 44, '1'),
(42, 45, '1'),
(42, 46, '1'),
(42, 47, '1'),
(42, 48, '1'),
(42, 49, '1'),
(42, 50, '1'),
(42, 51, '1'),
(42, 52, '1'),
(42, 53, '1'),
(42, 54, '1'),
(42, 55, '1'),
(42, 56, '1'),
(42, 57, '1'),
(42, 58, '1'),
(42, 59, '1'),
(42, 156, '1'),
(42, 157, '1'),
(42, 158, '1'),
(42, 159, '1'),
(42, 160, '1'),
(42, 161, '1'),
(42, 162, '1'),
(42, 163, '1'),
(42, 164, '1'),
(42, 165, '1'),
(42, 166, '1'),
(42, 167, '1'),
(42, 168, '1'),
(42, 169, '1'),
(42, 170, '1'),
(42, 171, '1'),
(42, 172, '1'),
(42, 173, '1'),
(42, 174, '1'),
(42, 175, '1'),
(42, 176, '1'),
(42, 177, '1'),
(42, 178, '1'),
(42, 179, '1'),
(42, 180, '1'),
(42, 181, '1'),
(42, 182, '1'),
(42, 183, '1'),
(42, 184, '1'),
(42, 185, '1'),
(42, 186, '1'),
(42, 187, '1'),
(42, 188, '1'),
(42, 189, '1'),
(42, 190, '1'),
(42, 191, '1'),
(42, 192, '1'),
(42, 193, '1'),
(42, 194, '1'),
(42, 195, '1'),
(42, 196, '1'),
(42, 197, '1'),
(42, 198, '1'),
(42, 199, '1'),
(42, 200, '1'),
(42, 201, '1'),
(42, 202, '1'),
(42, 203, '1'),
(42, 204, '1'),
(42, 205, '1'),
(42, 206, '1'),
(42, 207, '1'),
(42, 208, '1'),
(42, 209, '1'),
(42, 210, '1'),
(42, 211, '1'),
(42, 212, '1'),
(42, 213, '1'),
(42, 214, '1'),
(42, 215, '1'),
(42, 216, '1'),
(42, 217, '1'),
(42, 218, '1'),
(42, 219, '1'),
(42, 220, '1'),
(42, 221, '1'),
(42, 222, '1'),
(42, 223, '1'),
(42, 224, '1'),
(42, 225, '1'),
(42, 226, '1'),
(42, 227, '1'),
(42, 228, '1'),
(42, 229, '1'),
(42, 230, '1'),
(42, 231, '1'),
(42, 232, '1'),
(42, 233, '1'),
(42, 234, '1'),
(42, 235, '1'),
(42, 236, '1'),
(42, 237, '1'),
(42, 238, '1'),
(42, 239, '1'),
(42, 240, '1'),
(42, 241, '1'),
(42, 242, '1'),
(42, 243, '1'),
(42, 244, '1'),
(42, 245, '1'),
(42, 246, '1'),
(42, 247, '1'),
(42, 248, '1'),
(42, 249, '1'),
(42, 250, '1'),
(42, 251, '1'),
(42, 252, '1'),
(42, 253, '1'),
(42, 254, '1'),
(42, 255, '1'),
(42, 256, '1'),
(42, 257, '1'),
(42, 258, '1'),
(42, 259, '1'),
(42, 260, '1'),
(42, 261, '1'),
(42, 262, '1'),
(42, 263, '1'),
(42, 264, '1'),
(42, 265, '1'),
(42, 266, '1'),
(42, 267, '1'),
(42, 268, '1'),
(42, 269, '1'),
(42, 270, '1'),
(42, 271, '1'),
(42, 272, '1'),
(42, 273, '1'),
(42, 274, '1'),
(42, 275, '1'),
(42, 276, '1'),
(42, 277, '1'),
(42, 278, '1'),
(42, 279, '1'),
(42, 280, '1'),
(42, 281, '1'),
(42, 282, '1'),
(42, 283, '1'),
(42, 284, '1'),
(42, 285, '1'),
(42, 286, '1'),
(42, 287, '1'),
(42, 288, '1'),
(42, 289, '1'),
(42, 290, '1'),
(42, 291, '1'),
(42, 292, '1'),
(42, 293, '1'),
(42, 294, '1'),
(42, 295, '1'),
(42, 296, '1'),
(42, 297, '1'),
(42, 298, '1'),
(42, 299, '1'),
(42, 300, '1'),
(42, 301, '1'),
(42, 302, '1'),
(42, 303, '1'),
(42, 304, '1'),
(42, 305, '1'),
(42, 306, '1'),
(42, 307, '1'),
(42, 308, '1'),
(42, 309, '1'),
(42, 310, '1'),
(42, 311, '1'),
(42, 312, '1'),
(42, 313, '1'),
(42, 314, '1'),
(42, 315, '1'),
(42, 316, '1'),
(42, 317, '1'),
(42, 318, '1'),
(42, 319, '1'),
(42, 320, '1'),
(42, 321, '1'),
(42, 322, '1'),
(42, 323, '1'),
(42, 324, '1'),
(42, 325, '1'),
(42, 326, '1'),
(42, 327, '1'),
(42, 328, '1'),
(42, 329, '1'),
(42, 330, '1'),
(42, 331, '1'),
(42, 332, '1'),
(42, 333, '1'),
(42, 334, '1'),
(42, 335, '1'),
(42, 336, '1'),
(42, 337, '1'),
(42, 338, '1'),
(42, 339, '1'),
(42, 340, '1'),
(42, 341, '1'),
(42, 342, '1'),
(42, 343, '1'),
(42, 344, '1'),
(42, 345, '1'),
(42, 346, '1'),
(42, 347, '1'),
(42, 348, '1'),
(42, 349, '1'),
(42, 350, '1'),
(42, 351, '1'),
(42, 352, '1'),
(42, 353, '1'),
(42, 354, '1'),
(42, 355, '1'),
(42, 356, '1'),
(42, 357, '1'),
(42, 358, '1'),
(42, 359, '1'),
(42, 360, '1'),
(42, 361, '1'),
(42, 362, '1'),
(42, 363, '1'),
(42, 364, '1'),
(42, 365, '1'),
(42, 771, '1'),
(42, 773, '1'),
(42, 774, '1'),
(43, 3, '1'),
(43, 22, '1'),
(43, 23, '1'),
(43, 24, '1'),
(43, 25, '1'),
(43, 39, '1'),
(43, 40, '1'),
(43, 41, '1'),
(43, 42, '1'),
(43, 43, '1'),
(43, 44, '1'),
(43, 45, '1'),
(43, 46, '1'),
(43, 47, '1'),
(43, 48, '1'),
(43, 49, '1'),
(43, 50, '1'),
(43, 51, '1'),
(43, 52, '1'),
(43, 53, '1'),
(43, 54, '1'),
(43, 55, '1'),
(43, 56, '1'),
(43, 57, '1'),
(43, 58, '1'),
(43, 59, '1'),
(43, 156, '1'),
(43, 157, '1'),
(43, 158, '1'),
(43, 159, '1'),
(43, 160, '1'),
(43, 161, '1'),
(43, 162, '1'),
(43, 163, '1'),
(43, 164, '1'),
(43, 165, '1'),
(43, 166, '1'),
(43, 167, '1'),
(43, 168, '1'),
(43, 169, '1'),
(43, 170, '1'),
(43, 171, '1'),
(43, 172, '1'),
(43, 173, '1'),
(43, 174, '1'),
(43, 175, '1'),
(43, 176, '1'),
(43, 177, '1'),
(43, 178, '1'),
(43, 179, '1'),
(43, 180, '1'),
(43, 181, '1'),
(43, 182, '1'),
(43, 183, '1'),
(43, 184, '1'),
(43, 185, '1'),
(43, 186, '1'),
(43, 187, '1'),
(43, 188, '1'),
(43, 189, '1'),
(43, 190, '1'),
(43, 191, '1'),
(43, 192, '1'),
(43, 193, '1'),
(43, 194, '1'),
(43, 195, '1'),
(43, 196, '1'),
(43, 197, '1'),
(43, 198, '1'),
(43, 199, '1'),
(43, 200, '1'),
(43, 201, '1'),
(43, 202, '1'),
(43, 203, '1'),
(43, 204, '1'),
(43, 205, '1'),
(43, 206, '1'),
(43, 207, '1'),
(43, 208, '1'),
(43, 209, '1'),
(43, 210, '1'),
(43, 211, '1'),
(43, 212, '1'),
(43, 213, '1'),
(43, 214, '1'),
(43, 215, '1'),
(43, 216, '1'),
(43, 217, '1'),
(43, 218, '1'),
(43, 219, '1'),
(43, 220, '1'),
(43, 221, '1'),
(43, 222, '1'),
(43, 223, '1'),
(43, 224, '1'),
(43, 225, '1'),
(43, 226, '1'),
(43, 227, '1'),
(43, 228, '1'),
(43, 229, '1'),
(43, 230, '1'),
(43, 231, '1'),
(43, 232, '1'),
(43, 233, '1'),
(43, 234, '1'),
(43, 235, '1'),
(43, 236, '1'),
(43, 237, '1'),
(43, 238, '1'),
(43, 239, '1'),
(43, 240, '1'),
(43, 241, '1'),
(43, 242, '1'),
(43, 243, '1'),
(43, 244, '1'),
(43, 245, '1'),
(43, 246, '1'),
(43, 247, '1'),
(43, 248, '1'),
(43, 249, '1'),
(43, 250, '1'),
(43, 251, '1'),
(43, 252, '1'),
(43, 253, '1'),
(43, 254, '1'),
(43, 255, '1'),
(43, 256, '1'),
(43, 257, '1'),
(43, 258, '1'),
(43, 259, '1'),
(43, 260, '1'),
(43, 261, '1'),
(43, 262, '1'),
(43, 263, '1'),
(43, 264, '1'),
(43, 265, '1'),
(43, 266, '1'),
(43, 267, '1'),
(43, 268, '1'),
(43, 269, '1'),
(43, 270, '1'),
(43, 271, '1'),
(43, 272, '1'),
(43, 273, '1'),
(43, 274, '1'),
(43, 275, '1'),
(43, 276, '1'),
(43, 277, '1'),
(43, 278, '1'),
(43, 279, '1'),
(43, 280, '1'),
(43, 281, '1'),
(43, 282, '1'),
(43, 283, '1'),
(43, 284, '1'),
(43, 285, '1'),
(43, 286, '1'),
(43, 287, '1'),
(43, 288, '1'),
(43, 289, '1'),
(43, 290, '1'),
(43, 291, '1'),
(43, 292, '1'),
(43, 293, '1'),
(43, 294, '1'),
(43, 295, '1'),
(43, 296, '1'),
(43, 297, '1'),
(43, 298, '1'),
(43, 299, '1'),
(43, 300, '1'),
(43, 301, '1'),
(43, 302, '1'),
(43, 303, '1'),
(43, 304, '1'),
(43, 305, '1'),
(43, 306, '1'),
(43, 307, '1'),
(43, 308, '1'),
(43, 309, '1'),
(43, 310, '1'),
(43, 311, '1'),
(43, 312, '1'),
(43, 313, '1'),
(43, 314, '1'),
(43, 315, '1'),
(43, 316, '1'),
(43, 317, '1'),
(43, 318, '1'),
(43, 319, '1'),
(43, 320, '1'),
(43, 321, '1'),
(43, 322, '1'),
(43, 323, '1'),
(43, 324, '1'),
(43, 325, '1'),
(43, 326, '1'),
(43, 327, '1'),
(43, 328, '1'),
(43, 329, '1'),
(43, 330, '1'),
(43, 331, '1'),
(43, 332, '1'),
(43, 333, '1'),
(43, 334, '1'),
(43, 335, '1'),
(43, 336, '1'),
(43, 337, '1'),
(43, 338, '1'),
(43, 339, '1'),
(43, 340, '1'),
(43, 341, '1'),
(43, 342, '1'),
(43, 343, '1'),
(43, 344, '1'),
(43, 345, '1'),
(43, 346, '1'),
(43, 347, '1'),
(43, 348, '1'),
(43, 349, '1'),
(43, 350, '1'),
(43, 351, '1'),
(43, 352, '1'),
(43, 353, '1'),
(43, 354, '1'),
(43, 355, '1'),
(43, 356, '1'),
(43, 357, '1'),
(43, 358, '1'),
(43, 359, '1'),
(43, 360, '1'),
(43, 361, '1'),
(43, 362, '1'),
(43, 363, '1'),
(43, 364, '1'),
(43, 365, '1'),
(43, 771, '1'),
(43, 773, '1'),
(43, 774, '1'),
(44, 3, '1'),
(44, 22, '1'),
(44, 23, '1'),
(44, 24, '1'),
(44, 25, '1'),
(44, 39, '1'),
(44, 40, '1'),
(44, 41, '1'),
(44, 42, '1'),
(44, 43, '1'),
(44, 44, '1'),
(44, 45, '1'),
(44, 46, '1'),
(44, 47, '1'),
(44, 48, '1'),
(44, 49, '1'),
(44, 50, '1'),
(44, 51, '1'),
(44, 52, '1'),
(44, 53, '1'),
(44, 54, '1'),
(44, 55, '1'),
(44, 56, '1'),
(44, 57, '1'),
(44, 58, '1'),
(44, 59, '1'),
(44, 156, '1'),
(44, 157, '1'),
(44, 158, '1'),
(44, 159, '1'),
(44, 160, '1'),
(44, 161, '1'),
(44, 162, '1'),
(44, 163, '1'),
(44, 164, '1'),
(44, 165, '1'),
(44, 166, '1'),
(44, 167, '1'),
(44, 168, '1'),
(44, 169, '1'),
(44, 170, '1'),
(44, 171, '1'),
(44, 172, '1'),
(44, 173, '1'),
(44, 174, '1'),
(44, 175, '1'),
(44, 176, '1'),
(44, 177, '1'),
(44, 178, '1'),
(44, 179, '1'),
(44, 180, '1'),
(44, 181, '1'),
(44, 182, '1'),
(44, 183, '1'),
(44, 184, '1'),
(44, 185, '1'),
(44, 186, '1'),
(44, 187, '1'),
(44, 188, '1'),
(44, 189, '1'),
(44, 190, '1'),
(44, 191, '1'),
(44, 192, '1'),
(44, 193, '1'),
(44, 194, '1'),
(44, 195, '1'),
(44, 196, '1'),
(44, 197, '1'),
(44, 198, '1'),
(44, 199, '1'),
(44, 200, '1'),
(44, 201, '1'),
(44, 202, '1'),
(44, 203, '1'),
(44, 204, '1'),
(44, 205, '1'),
(44, 206, '1'),
(44, 207, '1'),
(44, 208, '1'),
(44, 209, '1'),
(44, 210, '1'),
(44, 211, '1'),
(44, 212, '1'),
(44, 213, '1'),
(44, 214, '1'),
(44, 215, '1'),
(44, 216, '1'),
(44, 217, '1'),
(44, 218, '1'),
(44, 219, '1'),
(44, 220, '1'),
(44, 221, '1'),
(44, 222, '1'),
(44, 223, '1'),
(44, 224, '1'),
(44, 225, '1'),
(44, 226, '1'),
(44, 227, '1'),
(44, 228, '1'),
(44, 229, '1'),
(44, 230, '1'),
(44, 231, '1'),
(44, 232, '1'),
(44, 233, '1'),
(44, 234, '1'),
(44, 235, '1'),
(44, 236, '1'),
(44, 237, '1'),
(44, 238, '1'),
(44, 239, '1'),
(44, 240, '1'),
(44, 241, '1'),
(44, 242, '1'),
(44, 243, '1'),
(44, 244, '1'),
(44, 245, '1'),
(44, 246, '1'),
(44, 247, '1'),
(44, 248, '1'),
(44, 249, '1'),
(44, 250, '1'),
(44, 251, '1'),
(44, 252, '1'),
(44, 253, '1'),
(44, 254, '1'),
(44, 255, '1'),
(44, 256, '1'),
(44, 257, '1'),
(44, 258, '1'),
(44, 259, '1'),
(44, 260, '1'),
(44, 261, '1'),
(44, 262, '1'),
(44, 263, '1'),
(44, 264, '1'),
(44, 265, '1'),
(44, 266, '1'),
(44, 267, '1'),
(44, 268, '1'),
(44, 269, '1'),
(44, 270, '1'),
(44, 271, '1'),
(44, 272, '1'),
(44, 273, '1'),
(44, 274, '1'),
(44, 275, '1'),
(44, 276, '1'),
(44, 277, '1'),
(44, 278, '1'),
(44, 279, '1'),
(44, 280, '1'),
(44, 281, '1'),
(44, 282, '1'),
(44, 283, '1'),
(44, 284, '1'),
(44, 285, '1'),
(44, 286, '1'),
(44, 287, '1'),
(44, 288, '1'),
(44, 289, '1'),
(44, 290, '1'),
(44, 291, '1'),
(44, 292, '1'),
(44, 293, '1'),
(44, 294, '1'),
(44, 295, '1'),
(44, 296, '1'),
(44, 297, '1'),
(44, 298, '1'),
(44, 299, '1'),
(44, 300, '1'),
(44, 301, '1'),
(44, 302, '1'),
(44, 303, '1'),
(44, 304, '1'),
(44, 305, '1'),
(44, 306, '1'),
(44, 307, '1'),
(44, 308, '1'),
(44, 309, '1'),
(44, 310, '1'),
(44, 311, '1'),
(44, 312, '1'),
(44, 313, '1'),
(44, 314, '1'),
(44, 315, '1'),
(44, 316, '1'),
(44, 317, '1'),
(44, 318, '1'),
(44, 319, '1'),
(44, 320, '1'),
(44, 321, '1'),
(44, 322, '1'),
(44, 323, '1'),
(44, 324, '1'),
(44, 325, '1'),
(44, 326, '1'),
(44, 327, '1'),
(44, 328, '1'),
(44, 329, '1'),
(44, 330, '1'),
(44, 331, '1'),
(44, 332, '1'),
(44, 333, '1'),
(44, 334, '1'),
(44, 335, '1'),
(44, 336, '1'),
(44, 337, '1'),
(44, 338, '1'),
(44, 339, '1'),
(44, 340, '1'),
(44, 341, '1'),
(44, 342, '1'),
(44, 343, '1'),
(44, 344, '1'),
(44, 345, '1'),
(44, 346, '1'),
(44, 347, '1'),
(44, 348, '1'),
(44, 349, '1'),
(44, 350, '1'),
(44, 351, '1'),
(44, 352, '1'),
(44, 353, '1'),
(44, 354, '1'),
(44, 355, '1'),
(44, 356, '1'),
(44, 357, '1'),
(44, 358, '1'),
(44, 359, '1'),
(44, 360, '1'),
(44, 361, '1'),
(44, 362, '1'),
(44, 363, '1'),
(44, 364, '1'),
(44, 365, '1'),
(44, 771, '1'),
(44, 773, '1'),
(44, 774, '1'),
(45, 3, '1'),
(45, 22, '1'),
(45, 23, '1'),
(45, 24, '1'),
(45, 25, '1'),
(45, 39, '1'),
(45, 40, '1'),
(45, 41, '1'),
(45, 42, '1'),
(45, 43, '1'),
(45, 44, '1'),
(45, 45, '1'),
(45, 46, '1'),
(45, 47, '1'),
(45, 48, '1'),
(45, 49, '1'),
(45, 50, '1'),
(45, 51, '1'),
(45, 52, '1'),
(45, 53, '1'),
(45, 54, '1'),
(45, 55, '1'),
(45, 56, '1'),
(45, 57, '1'),
(45, 58, '1'),
(45, 59, '1'),
(45, 156, '1'),
(45, 157, '1'),
(45, 158, '1'),
(45, 159, '1'),
(45, 160, '1'),
(45, 161, '1'),
(45, 162, '1'),
(45, 163, '1'),
(45, 164, '1'),
(45, 165, '1'),
(45, 166, '1'),
(45, 167, '1'),
(45, 168, '1'),
(45, 169, '1'),
(45, 170, '1'),
(45, 171, '1'),
(45, 172, '1'),
(45, 173, '1'),
(45, 174, '1'),
(45, 175, '1'),
(45, 176, '1'),
(45, 177, '1'),
(45, 178, '1'),
(45, 179, '1'),
(45, 180, '1'),
(45, 181, '1'),
(45, 182, '1'),
(45, 183, '1'),
(45, 184, '1'),
(45, 185, '1'),
(45, 186, '1'),
(45, 187, '1'),
(45, 188, '1'),
(45, 189, '1'),
(45, 190, '1'),
(45, 191, '1'),
(45, 192, '1'),
(45, 193, '1'),
(45, 194, '1'),
(45, 195, '1'),
(45, 196, '1'),
(45, 197, '1'),
(45, 198, '1'),
(45, 199, '1'),
(45, 200, '1'),
(45, 201, '1'),
(45, 202, '1'),
(45, 203, '1'),
(45, 204, '1'),
(45, 205, '1'),
(45, 206, '1'),
(45, 207, '1'),
(45, 208, '1'),
(45, 209, '1'),
(45, 210, '1'),
(45, 211, '1'),
(45, 212, '1'),
(45, 213, '1'),
(45, 214, '1'),
(45, 215, '1'),
(45, 216, '1'),
(45, 217, '1'),
(45, 218, '1'),
(45, 219, '1'),
(45, 220, '1'),
(45, 221, '1'),
(45, 222, '1'),
(45, 223, '1'),
(45, 224, '1'),
(45, 225, '1'),
(45, 226, '1'),
(45, 227, '1'),
(45, 228, '1'),
(45, 229, '1'),
(45, 230, '1'),
(45, 231, '1'),
(45, 232, '1'),
(45, 233, '1'),
(45, 234, '1'),
(45, 235, '1'),
(45, 236, '1'),
(45, 237, '1'),
(45, 238, '1'),
(45, 239, '1'),
(45, 240, '1'),
(45, 241, '1'),
(45, 242, '1'),
(45, 243, '1'),
(45, 244, '1'),
(45, 245, '1'),
(45, 246, '1'),
(45, 247, '1'),
(45, 248, '1'),
(45, 249, '1'),
(45, 250, '1'),
(45, 251, '1'),
(45, 252, '1'),
(45, 253, '1'),
(45, 254, '1'),
(45, 255, '1'),
(45, 256, '1'),
(45, 257, '1'),
(45, 258, '1'),
(45, 259, '1'),
(45, 260, '1'),
(45, 261, '1'),
(45, 262, '1'),
(45, 263, '1'),
(45, 264, '1'),
(45, 265, '1'),
(45, 266, '1'),
(45, 267, '1'),
(45, 268, '1'),
(45, 269, '1'),
(45, 270, '1'),
(45, 271, '1'),
(45, 272, '1'),
(45, 273, '1');
INSERT INTO `role_has_action` (`role_id`, `action_id`, `allowed`) VALUES
(45, 274, '1'),
(45, 275, '1'),
(45, 276, '1'),
(45, 277, '1'),
(45, 278, '1'),
(45, 279, '1'),
(45, 280, '1'),
(45, 281, '1'),
(45, 282, '1'),
(45, 283, '1'),
(45, 284, '1'),
(45, 285, '1'),
(45, 286, '1'),
(45, 287, '1'),
(45, 288, '1'),
(45, 289, '1'),
(45, 290, '1'),
(45, 291, '1'),
(45, 292, '1'),
(45, 293, '1'),
(45, 294, '1'),
(45, 295, '1'),
(45, 296, '1'),
(45, 297, '1'),
(45, 298, '1'),
(45, 299, '1'),
(45, 300, '1'),
(45, 301, '1'),
(45, 302, '1'),
(45, 303, '1'),
(45, 304, '1'),
(45, 305, '1'),
(45, 306, '1'),
(45, 307, '1'),
(45, 308, '1'),
(45, 309, '1'),
(45, 310, '1'),
(45, 311, '1'),
(45, 312, '1'),
(45, 313, '1'),
(45, 314, '1'),
(45, 315, '1'),
(45, 316, '1'),
(45, 317, '1'),
(45, 318, '1'),
(45, 319, '1'),
(45, 320, '1'),
(45, 321, '1'),
(45, 322, '1'),
(45, 323, '1'),
(45, 324, '1'),
(45, 325, '1'),
(45, 326, '1'),
(45, 327, '1'),
(45, 328, '1'),
(45, 329, '1'),
(45, 330, '1'),
(45, 331, '1'),
(45, 332, '1'),
(45, 333, '1'),
(45, 334, '1'),
(45, 335, '1'),
(45, 336, '1'),
(45, 337, '1'),
(45, 338, '1'),
(45, 339, '1'),
(45, 340, '1'),
(45, 341, '1'),
(45, 342, '1'),
(45, 343, '1'),
(45, 344, '1'),
(45, 345, '1'),
(45, 346, '1'),
(45, 347, '1'),
(45, 348, '1'),
(45, 349, '1'),
(45, 350, '1'),
(45, 351, '1'),
(45, 352, '1'),
(45, 353, '1'),
(45, 354, '1'),
(45, 355, '1'),
(45, 356, '1'),
(45, 357, '1'),
(45, 358, '1'),
(45, 359, '1'),
(45, 360, '1'),
(45, 361, '1'),
(45, 362, '1'),
(45, 363, '1'),
(45, 364, '1'),
(45, 365, '1'),
(45, 771, '1'),
(45, 773, '1'),
(45, 774, '1'),
(46, 3, '1'),
(46, 22, '1'),
(46, 23, '1'),
(46, 24, '1'),
(46, 25, '1'),
(46, 39, '1'),
(46, 40, '1'),
(46, 41, '1'),
(46, 42, '1'),
(46, 43, '1'),
(46, 44, '1'),
(46, 45, '1'),
(46, 46, '1'),
(46, 47, '1'),
(46, 48, '1'),
(46, 49, '1'),
(46, 50, '1'),
(46, 51, '1'),
(46, 52, '1'),
(46, 53, '1'),
(46, 54, '1'),
(46, 55, '1'),
(46, 56, '1'),
(46, 57, '1'),
(46, 58, '1'),
(46, 59, '1'),
(46, 156, '1'),
(46, 157, '1'),
(46, 158, '1'),
(46, 159, '1'),
(46, 160, '1'),
(46, 161, '1'),
(46, 162, '1'),
(46, 163, '1'),
(46, 164, '1'),
(46, 165, '1'),
(46, 166, '1'),
(46, 167, '1'),
(46, 168, '1'),
(46, 169, '1'),
(46, 170, '1'),
(46, 171, '1'),
(46, 172, '1'),
(46, 173, '1'),
(46, 174, '1'),
(46, 175, '1'),
(46, 176, '1'),
(46, 177, '1'),
(46, 178, '1'),
(46, 179, '1'),
(46, 180, '1'),
(46, 181, '1'),
(46, 182, '1'),
(46, 183, '1'),
(46, 184, '1'),
(46, 185, '1'),
(46, 186, '1'),
(46, 187, '1'),
(46, 188, '1'),
(46, 189, '1'),
(46, 190, '1'),
(46, 191, '1'),
(46, 192, '1'),
(46, 193, '1'),
(46, 194, '1'),
(46, 195, '1'),
(46, 196, '1'),
(46, 197, '1'),
(46, 198, '1'),
(46, 199, '1'),
(46, 200, '1'),
(46, 201, '1'),
(46, 202, '1'),
(46, 203, '1'),
(46, 204, '1'),
(46, 205, '1'),
(46, 206, '1'),
(46, 207, '1'),
(46, 208, '1'),
(46, 209, '1'),
(46, 210, '1'),
(46, 211, '1'),
(46, 212, '1'),
(46, 213, '1'),
(46, 214, '1'),
(46, 215, '1'),
(46, 216, '1'),
(46, 217, '1'),
(46, 218, '1'),
(46, 219, '1'),
(46, 220, '1'),
(46, 221, '1'),
(46, 222, '1'),
(46, 223, '1'),
(46, 224, '1'),
(46, 225, '1'),
(46, 226, '1'),
(46, 227, '1'),
(46, 228, '1'),
(46, 229, '1'),
(46, 230, '1'),
(46, 231, '1'),
(46, 232, '1'),
(46, 233, '1'),
(46, 234, '1'),
(46, 235, '1'),
(46, 236, '1'),
(46, 237, '1'),
(46, 238, '1'),
(46, 239, '1'),
(46, 240, '1'),
(46, 241, '1'),
(46, 242, '1'),
(46, 243, '1'),
(46, 244, '1'),
(46, 245, '1'),
(46, 246, '1'),
(46, 247, '1'),
(46, 248, '1'),
(46, 249, '1'),
(46, 250, '1'),
(46, 251, '1'),
(46, 252, '1'),
(46, 253, '1'),
(46, 254, '1'),
(46, 255, '1'),
(46, 256, '1'),
(46, 257, '1'),
(46, 258, '1'),
(46, 259, '1'),
(46, 260, '1'),
(46, 261, '1'),
(46, 262, '1'),
(46, 263, '1'),
(46, 264, '1'),
(46, 265, '1'),
(46, 266, '1'),
(46, 267, '1'),
(46, 268, '1'),
(46, 269, '1'),
(46, 270, '1'),
(46, 271, '1'),
(46, 272, '1'),
(46, 273, '1'),
(46, 274, '1'),
(46, 275, '1'),
(46, 276, '1'),
(46, 277, '1'),
(46, 278, '1'),
(46, 279, '1'),
(46, 280, '1'),
(46, 281, '1'),
(46, 282, '1'),
(46, 283, '1'),
(46, 284, '1'),
(46, 285, '1'),
(46, 286, '1'),
(46, 287, '1'),
(46, 288, '1'),
(46, 289, '1'),
(46, 290, '1'),
(46, 291, '1'),
(46, 292, '1'),
(46, 293, '1'),
(46, 294, '1'),
(46, 295, '1'),
(46, 296, '1'),
(46, 297, '1'),
(46, 298, '1'),
(46, 299, '1'),
(46, 300, '1'),
(46, 301, '1'),
(46, 302, '1'),
(46, 303, '1'),
(46, 304, '1'),
(46, 305, '1'),
(46, 306, '1'),
(46, 307, '1'),
(46, 308, '1'),
(46, 309, '1'),
(46, 310, '1'),
(46, 311, '1'),
(46, 312, '1'),
(46, 313, '1'),
(46, 314, '1'),
(46, 315, '1'),
(46, 316, '1'),
(46, 317, '1'),
(46, 318, '1'),
(46, 319, '1'),
(46, 320, '1'),
(46, 321, '1'),
(46, 322, '1'),
(46, 323, '1'),
(46, 324, '1'),
(46, 325, '1'),
(46, 326, '1'),
(46, 327, '1'),
(46, 328, '1'),
(46, 329, '1'),
(46, 330, '1'),
(46, 331, '1'),
(46, 332, '1'),
(46, 333, '1'),
(46, 334, '1'),
(46, 335, '1'),
(46, 336, '1'),
(46, 337, '1'),
(46, 338, '1'),
(46, 339, '1'),
(46, 340, '1'),
(46, 341, '1'),
(46, 342, '1'),
(46, 343, '1'),
(46, 344, '1'),
(46, 345, '1'),
(46, 346, '1'),
(46, 347, '1'),
(46, 348, '1'),
(46, 349, '1'),
(46, 350, '1'),
(46, 351, '1'),
(46, 352, '1'),
(46, 353, '1'),
(46, 354, '1'),
(46, 355, '1'),
(46, 356, '1'),
(46, 357, '1'),
(46, 358, '1'),
(46, 359, '1'),
(46, 360, '1'),
(46, 361, '1'),
(46, 362, '1'),
(46, 363, '1'),
(46, 364, '1'),
(46, 365, '1'),
(46, 771, '1'),
(46, 773, '1'),
(46, 774, '1'),
(47, 3, '1'),
(47, 4, '1'),
(47, 5, '1'),
(47, 12, '1'),
(47, 22, '1'),
(47, 23, '1'),
(47, 24, '1'),
(47, 25, '1'),
(47, 26, '1'),
(47, 27, '1'),
(47, 28, '1'),
(47, 29, '1'),
(47, 30, '1'),
(47, 31, '1'),
(47, 32, '1'),
(47, 33, '1'),
(47, 34, '1'),
(47, 35, '1'),
(47, 36, '1'),
(47, 37, '1'),
(47, 38, '1'),
(47, 39, '1'),
(47, 40, '1'),
(47, 41, '1'),
(47, 42, '1'),
(47, 43, '1'),
(47, 44, '1'),
(47, 45, '1'),
(47, 46, '1'),
(47, 47, '1'),
(47, 48, '1'),
(47, 49, '1'),
(47, 50, '1'),
(47, 51, '1'),
(47, 52, '1'),
(47, 53, '1'),
(47, 54, '1'),
(47, 55, '1'),
(47, 56, '1'),
(47, 57, '1'),
(47, 58, '1'),
(47, 59, '1'),
(47, 60, '1'),
(47, 61, '1'),
(47, 62, '1'),
(47, 63, '1'),
(47, 64, '1'),
(47, 65, '1'),
(47, 66, '1'),
(47, 67, '1'),
(47, 68, '1'),
(47, 69, '1'),
(47, 70, '1'),
(47, 71, '1'),
(47, 72, '1'),
(47, 73, '1'),
(47, 74, '1'),
(47, 75, '1'),
(47, 76, '1'),
(47, 77, '1'),
(47, 78, '1'),
(47, 79, '1'),
(47, 80, '1'),
(47, 81, '1'),
(47, 82, '1'),
(47, 83, '1'),
(47, 84, '1'),
(47, 85, '1'),
(47, 86, '1'),
(47, 87, '1'),
(47, 88, '1'),
(47, 89, '1'),
(47, 90, '1'),
(47, 91, '1'),
(47, 92, '1'),
(47, 93, '1'),
(47, 94, '1'),
(47, 95, '1'),
(47, 96, '1'),
(47, 97, '1'),
(47, 98, '1'),
(47, 106, '1'),
(47, 107, '1'),
(47, 108, '1'),
(47, 109, '1'),
(47, 110, '1'),
(47, 111, '1'),
(47, 112, '1'),
(47, 113, '1'),
(47, 114, '1'),
(47, 115, '1'),
(47, 116, '1'),
(47, 117, '1'),
(47, 118, '1'),
(47, 119, '1'),
(47, 120, '1'),
(47, 121, '1'),
(47, 122, '1'),
(47, 123, '1'),
(47, 124, '1'),
(47, 125, '1'),
(47, 126, '1'),
(47, 127, '1'),
(47, 128, '1'),
(47, 129, '1'),
(47, 130, '1'),
(47, 131, '1'),
(47, 132, '1'),
(47, 133, '1'),
(47, 134, '1'),
(47, 135, '1'),
(47, 136, '1'),
(47, 137, '1'),
(47, 138, '1'),
(47, 139, '1'),
(47, 140, '1'),
(47, 141, '1'),
(47, 142, '1'),
(47, 143, '1'),
(47, 144, '1'),
(47, 145, '1'),
(47, 146, '1'),
(47, 147, '1'),
(47, 148, '1'),
(47, 149, '1'),
(47, 150, '1'),
(47, 151, '1'),
(47, 152, '1'),
(47, 153, '1'),
(47, 154, '1'),
(47, 155, '1'),
(47, 156, '1'),
(47, 157, '1'),
(47, 158, '1'),
(47, 159, '1'),
(47, 160, '1'),
(47, 161, '1'),
(47, 162, '1'),
(47, 163, '1'),
(47, 164, '1'),
(47, 165, '1'),
(47, 166, '1'),
(47, 167, '1'),
(47, 168, '1'),
(47, 169, '1'),
(47, 170, '1'),
(47, 171, '1'),
(47, 172, '1'),
(47, 173, '1'),
(47, 174, '1'),
(47, 175, '1'),
(47, 176, '1'),
(47, 177, '1'),
(47, 178, '1'),
(47, 179, '1'),
(47, 180, '1'),
(47, 181, '1'),
(47, 182, '1'),
(47, 183, '1'),
(47, 184, '1'),
(47, 185, '1'),
(47, 186, '1'),
(47, 187, '1'),
(47, 188, '1'),
(47, 189, '1'),
(47, 190, '1'),
(47, 191, '1'),
(47, 192, '1'),
(47, 193, '1'),
(47, 194, '1'),
(47, 195, '1'),
(47, 196, '1'),
(47, 197, '1'),
(47, 198, '1'),
(47, 199, '1'),
(47, 200, '1'),
(47, 201, '1'),
(47, 202, '1'),
(47, 203, '1'),
(47, 204, '1'),
(47, 205, '1'),
(47, 206, '1'),
(47, 207, '1'),
(47, 208, '1'),
(47, 209, '1'),
(47, 210, '1'),
(47, 211, '1'),
(47, 212, '1'),
(47, 213, '1'),
(47, 214, '1'),
(47, 215, '1'),
(47, 216, '1'),
(47, 217, '1'),
(47, 218, '1'),
(47, 219, '1'),
(47, 220, '1'),
(47, 221, '1'),
(47, 222, '1'),
(47, 223, '1'),
(47, 224, '1'),
(47, 225, '1'),
(47, 226, '1'),
(47, 227, '1'),
(47, 228, '1'),
(47, 229, '1'),
(47, 230, '1'),
(47, 231, '1'),
(47, 232, '1'),
(47, 233, '1'),
(47, 234, '1'),
(47, 235, '1'),
(47, 236, '1'),
(47, 237, '1'),
(47, 238, '1'),
(47, 239, '1'),
(47, 240, '1'),
(47, 241, '1'),
(47, 242, '1'),
(47, 243, '1'),
(47, 244, '1'),
(47, 245, '1'),
(47, 246, '1'),
(47, 247, '1'),
(47, 248, '1'),
(47, 249, '1'),
(47, 250, '1'),
(47, 251, '1'),
(47, 252, '1'),
(47, 253, '1'),
(47, 254, '1'),
(47, 255, '1'),
(47, 256, '1'),
(47, 257, '1'),
(47, 258, '1'),
(47, 259, '1'),
(47, 260, '1'),
(47, 261, '1'),
(47, 262, '1'),
(47, 263, '1'),
(47, 264, '1'),
(47, 265, '1'),
(47, 266, '1'),
(47, 267, '1'),
(47, 268, '1'),
(47, 269, '1'),
(47, 270, '1'),
(47, 271, '1'),
(47, 272, '1'),
(47, 273, '1'),
(47, 274, '1'),
(47, 275, '1'),
(47, 276, '1'),
(47, 277, '1'),
(47, 278, '1'),
(47, 279, '1'),
(47, 280, '1'),
(47, 281, '1'),
(47, 282, '1'),
(47, 283, '1'),
(47, 284, '1'),
(47, 285, '1'),
(47, 286, '1'),
(47, 287, '1'),
(47, 288, '1'),
(47, 289, '1'),
(47, 290, '1'),
(47, 291, '1'),
(47, 292, '1'),
(47, 293, '1'),
(47, 294, '1'),
(47, 295, '1'),
(47, 296, '1'),
(47, 297, '1'),
(47, 298, '1'),
(47, 299, '1'),
(47, 300, '1'),
(47, 301, '1'),
(47, 302, '1'),
(47, 303, '1'),
(47, 304, '1'),
(47, 305, '1'),
(47, 306, '1'),
(47, 307, '1'),
(47, 308, '1'),
(47, 309, '1'),
(47, 310, '1'),
(47, 311, '1'),
(47, 312, '1'),
(47, 313, '1'),
(47, 314, '1'),
(47, 315, '1'),
(47, 316, '1'),
(47, 317, '1'),
(47, 318, '1'),
(47, 319, '1'),
(47, 320, '1'),
(47, 321, '1'),
(47, 322, '1'),
(47, 323, '1'),
(47, 324, '1'),
(47, 325, '1'),
(47, 326, '1'),
(47, 327, '1'),
(47, 328, '1'),
(47, 329, '1'),
(47, 330, '1'),
(47, 331, '1'),
(47, 332, '1'),
(47, 333, '1'),
(47, 334, '1'),
(47, 335, '1'),
(47, 336, '1'),
(47, 337, '1'),
(47, 338, '1'),
(47, 339, '1'),
(47, 340, '1'),
(47, 341, '1'),
(47, 342, '1'),
(47, 343, '1'),
(47, 344, '1'),
(47, 345, '1'),
(47, 346, '1'),
(47, 347, '1'),
(47, 348, '1'),
(47, 349, '1'),
(47, 350, '1'),
(47, 351, '1'),
(47, 352, '1'),
(47, 353, '1'),
(47, 354, '1'),
(47, 355, '1'),
(47, 356, '1'),
(47, 357, '1'),
(47, 358, '1'),
(47, 359, '1'),
(47, 360, '1'),
(47, 361, '1'),
(47, 362, '1'),
(47, 363, '1'),
(47, 364, '1'),
(47, 365, '1'),
(47, 366, '1'),
(47, 367, '1'),
(47, 368, '1'),
(47, 369, '1'),
(47, 370, '1'),
(47, 371, '1'),
(47, 372, '1'),
(47, 373, '1'),
(47, 374, '1'),
(47, 375, '1'),
(47, 376, '1'),
(47, 377, '1'),
(47, 378, '1'),
(47, 379, '1'),
(47, 380, '1'),
(47, 381, '1'),
(47, 382, '1'),
(47, 383, '1'),
(47, 384, '1'),
(47, 385, '1'),
(47, 386, '1'),
(47, 387, '1'),
(47, 388, '1'),
(47, 389, '1'),
(47, 390, '1'),
(47, 391, '1'),
(47, 392, '1'),
(47, 393, '1'),
(47, 394, '1'),
(47, 395, '1'),
(47, 396, '1'),
(47, 397, '1'),
(47, 398, '1'),
(47, 399, '1'),
(47, 400, '1'),
(47, 401, '1'),
(47, 402, '1'),
(47, 403, '1'),
(47, 404, '1'),
(47, 405, '1'),
(47, 406, '1'),
(47, 407, '1'),
(47, 408, '1'),
(47, 409, '1'),
(47, 410, '1'),
(47, 411, '1'),
(47, 412, '1'),
(47, 413, '1'),
(47, 414, '1'),
(47, 415, '1'),
(47, 416, '1'),
(47, 417, '1'),
(47, 418, '1'),
(47, 419, '1'),
(47, 420, '1'),
(47, 421, '1'),
(47, 422, '1'),
(47, 423, '1'),
(47, 424, '1'),
(47, 425, '1'),
(47, 426, '1'),
(47, 427, '1'),
(47, 428, '1'),
(47, 429, '1'),
(47, 430, '1'),
(47, 431, '1'),
(47, 432, '1'),
(47, 433, '1'),
(47, 434, '1'),
(47, 435, '1'),
(47, 436, '1'),
(47, 437, '1'),
(47, 438, '1'),
(47, 439, '1'),
(47, 440, '1'),
(47, 441, '1'),
(47, 442, '1'),
(47, 443, '1'),
(47, 444, '1'),
(47, 445, '1'),
(47, 446, '1'),
(47, 447, '1'),
(47, 448, '1'),
(47, 449, '1'),
(47, 450, '1'),
(47, 451, '1'),
(47, 452, '1'),
(47, 453, '1'),
(47, 454, '1'),
(47, 455, '1'),
(47, 456, '1'),
(47, 457, '1'),
(47, 458, '1'),
(47, 459, '1'),
(47, 460, '1'),
(47, 461, '1'),
(47, 462, '1'),
(47, 463, '1'),
(47, 464, '1'),
(47, 465, '1'),
(47, 466, '1'),
(47, 467, '1'),
(47, 468, '1'),
(47, 469, '1'),
(47, 470, '1'),
(47, 471, '1'),
(47, 472, '1'),
(47, 473, '1'),
(47, 474, '1'),
(47, 475, '1'),
(47, 476, '1'),
(47, 477, '1'),
(47, 478, '1'),
(47, 479, '1'),
(47, 480, '1'),
(47, 481, '1'),
(47, 482, '1'),
(47, 483, '1'),
(47, 484, '1'),
(47, 485, '1'),
(47, 486, '1'),
(47, 487, '1'),
(47, 488, '1'),
(47, 489, '1'),
(47, 490, '1'),
(47, 491, '1'),
(47, 492, '1'),
(47, 493, '1'),
(47, 494, '1'),
(47, 495, '1'),
(47, 496, '1'),
(47, 497, '1'),
(47, 498, '1'),
(47, 499, '1'),
(47, 500, '1'),
(47, 501, '1'),
(47, 502, '1'),
(47, 503, '1'),
(47, 504, '1'),
(47, 505, '1'),
(47, 506, '1'),
(47, 507, '1'),
(47, 508, '1'),
(47, 509, '1'),
(47, 510, '1'),
(47, 511, '1'),
(47, 512, '1'),
(47, 513, '1'),
(47, 514, '1'),
(47, 515, '1'),
(47, 516, '1'),
(47, 517, '1'),
(47, 518, '1'),
(47, 519, '1'),
(47, 520, '1'),
(47, 521, '1'),
(47, 522, '1'),
(47, 523, '1'),
(47, 524, '1'),
(47, 525, '1'),
(47, 526, '1'),
(47, 527, '1'),
(47, 528, '1'),
(47, 529, '1'),
(47, 530, '1'),
(47, 531, '1'),
(47, 532, '1'),
(47, 533, '1'),
(47, 534, '1'),
(47, 535, '1'),
(47, 536, '1'),
(47, 537, '1'),
(47, 538, '1'),
(47, 539, '1'),
(47, 540, '1'),
(47, 541, '1'),
(47, 542, '1'),
(47, 543, '1'),
(47, 544, '1'),
(47, 545, '1'),
(47, 546, '1'),
(47, 547, '1'),
(47, 548, '1'),
(47, 549, '1'),
(47, 550, '1'),
(47, 551, '1'),
(47, 552, '1'),
(47, 553, '1'),
(47, 554, '1'),
(47, 555, '1'),
(47, 556, '1'),
(47, 557, '1'),
(47, 558, '1'),
(47, 559, '1'),
(47, 560, '1'),
(47, 561, '1'),
(47, 562, '1'),
(47, 563, '1'),
(47, 564, '1'),
(47, 565, '1'),
(47, 566, '1'),
(47, 567, '1'),
(47, 568, '1'),
(47, 569, '1'),
(47, 570, '1'),
(47, 571, '1'),
(47, 572, '1'),
(47, 573, '1'),
(47, 574, '1'),
(47, 575, '1'),
(47, 576, '1'),
(47, 577, '1'),
(47, 578, '1'),
(47, 579, '1'),
(47, 580, '1'),
(47, 581, '1'),
(47, 582, '1'),
(47, 583, '1'),
(47, 584, '1'),
(47, 585, '1'),
(47, 586, '1'),
(47, 587, '1'),
(47, 588, '1'),
(47, 589, '1'),
(47, 590, '1'),
(47, 591, '1'),
(47, 592, '1'),
(47, 593, '1'),
(47, 594, '1'),
(47, 595, '1'),
(47, 596, '1'),
(47, 597, '1'),
(47, 598, '1'),
(47, 599, '1'),
(47, 600, '1'),
(47, 601, '1'),
(47, 602, '1'),
(47, 603, '1'),
(47, 604, '1'),
(47, 605, '1'),
(47, 606, '1'),
(47, 607, '1'),
(47, 608, '1'),
(47, 609, '1'),
(47, 610, '1'),
(47, 611, '1'),
(47, 612, '1'),
(47, 613, '1'),
(47, 614, '1'),
(47, 615, '1'),
(47, 616, '1'),
(47, 617, '1'),
(47, 618, '1'),
(47, 619, '1'),
(47, 620, '1'),
(47, 621, '1'),
(47, 622, '1'),
(47, 623, '1'),
(47, 624, '1'),
(47, 625, '1'),
(47, 626, '1'),
(47, 627, '1'),
(47, 628, '1'),
(47, 629, '1'),
(47, 630, '1'),
(47, 631, '1'),
(47, 632, '1'),
(47, 633, '1'),
(47, 634, '1'),
(47, 635, '1'),
(47, 636, '1'),
(47, 637, '1'),
(47, 638, '1'),
(47, 639, '1'),
(47, 640, '1'),
(47, 641, '1'),
(47, 642, '1'),
(47, 643, '1'),
(47, 644, '1'),
(47, 645, '1'),
(47, 646, '1'),
(47, 647, '1'),
(47, 648, '1'),
(47, 649, '1'),
(47, 650, '1'),
(47, 651, '1'),
(47, 652, '1'),
(47, 653, '1'),
(47, 654, '1'),
(47, 655, '1'),
(47, 656, '1'),
(47, 657, '1'),
(47, 658, '1'),
(47, 659, '1'),
(47, 660, '1'),
(47, 661, '1'),
(47, 662, '1'),
(47, 663, '1'),
(47, 664, '1'),
(47, 665, '1'),
(47, 666, '1'),
(47, 667, '1'),
(47, 668, '1'),
(47, 669, '1'),
(47, 670, '1'),
(47, 671, '1'),
(47, 672, '1'),
(47, 673, '1'),
(47, 674, '1'),
(47, 675, '1'),
(47, 676, '1'),
(47, 677, '1'),
(47, 678, '1'),
(47, 679, '1'),
(47, 680, '1'),
(47, 681, '1'),
(47, 682, '1'),
(47, 683, '1'),
(47, 684, '1'),
(47, 685, '1'),
(47, 686, '1'),
(47, 687, '1'),
(47, 688, '1'),
(47, 689, '1'),
(47, 690, '1'),
(47, 691, '1'),
(47, 692, '1'),
(47, 693, '1'),
(47, 694, '1'),
(47, 695, '1'),
(47, 696, '1'),
(47, 697, '1'),
(47, 698, '1'),
(47, 699, '1'),
(47, 700, '1'),
(47, 701, '1'),
(47, 702, '1'),
(47, 703, '1'),
(47, 704, '1'),
(47, 705, '1'),
(47, 706, '1'),
(47, 707, '1'),
(47, 708, '1'),
(47, 709, '1'),
(47, 710, '1'),
(47, 711, '1'),
(47, 712, '1'),
(47, 713, '1'),
(47, 714, '1'),
(47, 715, '1'),
(47, 716, '1'),
(47, 717, '1'),
(47, 718, '1'),
(47, 719, '1'),
(47, 720, '1'),
(47, 721, '1'),
(47, 722, '1'),
(47, 723, '1'),
(47, 724, '1'),
(47, 725, '1'),
(47, 726, '1'),
(47, 727, '1'),
(47, 728, '1'),
(47, 729, '1'),
(47, 730, '1'),
(47, 731, '1'),
(47, 732, '1'),
(47, 733, '1'),
(47, 734, '1'),
(47, 735, '1'),
(47, 736, '1'),
(47, 737, '1'),
(47, 738, '1'),
(47, 739, '1'),
(47, 740, '1'),
(47, 741, '1'),
(47, 742, '1'),
(47, 743, '1'),
(47, 744, '1'),
(47, 745, '1'),
(47, 746, '1'),
(47, 747, '1'),
(47, 748, '1'),
(47, 749, '1'),
(47, 750, '1'),
(47, 751, '1'),
(47, 752, '1'),
(47, 753, '1'),
(47, 754, '1'),
(47, 755, '1'),
(47, 756, '1'),
(47, 757, '1'),
(47, 758, '1'),
(47, 759, '1'),
(47, 760, '1'),
(47, 761, '1'),
(47, 762, '1'),
(47, 763, '1'),
(47, 764, '1'),
(47, 765, '1'),
(47, 771, '1'),
(47, 773, '1'),
(47, 774, '1');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_menu`
--

CREATE TABLE `role_has_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `accessible` varchar(1) NOT NULL DEFAULT '0'
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
(1, 476, '1'),
(1, 477, '1'),
(1, 478, '1'),
(1, 479, '1'),
(1, 480, '1'),
(1, 481, '1'),
(1, 482, '1'),
(1, 483, '1'),
(1, 484, '1'),
(1, 485, '1'),
(1, 486, '1'),
(1, 487, '1'),
(1, 489, '1'),
(1, 490, '1'),
(1, 491, '1'),
(1, 493, '1'),
(1, 494, '1'),
(1, 495, '1'),
(1, 496, '1'),
(2, 3, '1'),
(2, 21, '1'),
(2, 22, '1'),
(2, 23, '1'),
(2, 24, '1'),
(2, 25, '1'),
(2, 27, '1'),
(2, 54, '1'),
(2, 56, '1'),
(2, 67, '1'),
(2, 71, '1'),
(2, 89, '1'),
(2, 90, '1'),
(2, 93, '1'),
(2, 94, '1'),
(2, 95, '1'),
(2, 96, '1'),
(2, 97, '1'),
(2, 103, '1'),
(2, 104, '1'),
(2, 109, '1'),
(2, 446, '1'),
(2, 449, '1'),
(2, 452, '1'),
(2, 457, '1'),
(2, 462, '1'),
(2, 484, '1'),
(2, 486, '1'),
(2, 487, '1'),
(2, 490, '1'),
(2, 494, '1'),
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
(3, 449, '1'),
(3, 483, '1'),
(3, 484, '1'),
(3, 486, '1'),
(3, 490, '1'),
(3, 493, '1'),
(3, 494, '1'),
(4, 1, '1'),
(4, 2, '1'),
(4, 3, '1'),
(4, 13, '1'),
(4, 14, '1'),
(4, 21, '1'),
(4, 22, '1'),
(4, 23, '1'),
(4, 24, '1'),
(4, 25, '1'),
(4, 27, '1'),
(4, 54, '1'),
(4, 56, '1'),
(4, 67, '1'),
(4, 71, '1'),
(4, 79, '1'),
(4, 80, '1'),
(4, 81, '1'),
(4, 82, '1'),
(4, 83, '1'),
(4, 84, '1'),
(4, 86, '1'),
(4, 87, '1'),
(4, 88, '1'),
(4, 89, '1'),
(4, 90, '1'),
(4, 91, '1'),
(4, 92, '1'),
(4, 93, '1'),
(4, 94, '1'),
(4, 95, '1'),
(4, 96, '1'),
(4, 97, '1'),
(4, 98, '1'),
(4, 99, '1'),
(4, 100, '1'),
(4, 101, '1'),
(4, 102, '1'),
(4, 103, '1'),
(4, 104, '1'),
(4, 105, '1'),
(4, 106, '1'),
(4, 109, '1'),
(4, 110, '1'),
(4, 111, '1'),
(4, 112, '1'),
(4, 113, '1'),
(4, 114, '1'),
(4, 115, '1'),
(4, 116, '1'),
(4, 117, '1'),
(4, 118, '1'),
(4, 119, '1'),
(4, 446, '1'),
(4, 447, '1'),
(4, 448, '1'),
(4, 449, '1'),
(4, 450, '1'),
(4, 451, '1'),
(4, 452, '1'),
(4, 453, '1'),
(4, 454, '1'),
(4, 457, '1'),
(4, 458, '1'),
(4, 460, '1'),
(4, 461, '1'),
(4, 462, '1'),
(4, 463, '1'),
(4, 464, '1'),
(4, 465, '1'),
(4, 466, '1'),
(4, 467, '1'),
(4, 469, '1'),
(4, 471, '1'),
(4, 472, '1'),
(4, 473, '1'),
(4, 483, '1'),
(4, 484, '1'),
(4, 485, '1'),
(4, 486, '1'),
(4, 487, '1'),
(4, 490, '1'),
(4, 491, '1'),
(4, 493, '1'),
(4, 494, '1'),
(4, 495, '1'),
(4, 496, '1'),
(5, 3, '1'),
(5, 21, '1'),
(5, 22, '1'),
(5, 23, '1'),
(5, 24, '1'),
(5, 25, '1'),
(5, 483, '1'),
(5, 484, '1'),
(5, 486, '1'),
(5, 490, '1'),
(5, 493, '1'),
(5, 494, '1'),
(6, 3, '1'),
(6, 95, '1'),
(6, 96, '1'),
(6, 97, '1'),
(6, 98, '1'),
(6, 99, '1'),
(6, 100, '1'),
(6, 101, '1'),
(6, 102, '1'),
(6, 103, '1'),
(6, 104, '1'),
(6, 105, '1'),
(6, 462, '1'),
(6, 483, '1'),
(6, 484, '1'),
(6, 485, '1'),
(6, 486, '1'),
(6, 490, '1'),
(6, 491, '1'),
(6, 494, '1'),
(10, 1, '1'),
(10, 2, '1'),
(10, 3, '1'),
(10, 464, '1'),
(10, 465, '1'),
(10, 466, '1'),
(10, 467, '1'),
(10, 469, '1'),
(10, 471, '1'),
(10, 472, '1'),
(10, 483, '1'),
(10, 484, '1'),
(10, 486, '1'),
(10, 490, '1'),
(10, 493, '1'),
(10, 494, '1'),
(11, 3, '1'),
(11, 79, '1'),
(11, 80, '1'),
(11, 81, '1'),
(11, 82, '1'),
(11, 83, '1'),
(11, 84, '1'),
(11, 483, '1'),
(11, 484, '1'),
(11, 486, '1'),
(11, 490, '1'),
(11, 493, '1'),
(11, 494, '1'),
(12, 3, '1'),
(12, 67, '1'),
(12, 71, '1'),
(12, 483, '1'),
(12, 484, '1'),
(12, 486, '1'),
(12, 490, '1'),
(12, 493, '1'),
(12, 494, '1'),
(13, 3, '1'),
(13, 89, '1'),
(13, 90, '1'),
(13, 91, '1'),
(13, 92, '1'),
(13, 463, '1'),
(13, 483, '1'),
(13, 484, '1'),
(13, 486, '1'),
(13, 490, '1'),
(13, 493, '1'),
(13, 494, '1'),
(14, 3, '1'),
(14, 86, '1'),
(14, 87, '1'),
(14, 88, '1'),
(14, 483, '1'),
(14, 484, '1'),
(14, 486, '1'),
(14, 490, '1'),
(14, 493, '1'),
(14, 494, '1'),
(15, 3, '1'),
(15, 27, '1'),
(15, 450, '1'),
(15, 451, '1'),
(15, 452, '1'),
(15, 453, '1'),
(15, 454, '1'),
(15, 457, '1'),
(15, 483, '1'),
(15, 484, '1'),
(15, 486, '1'),
(15, 490, '1'),
(15, 493, '1'),
(15, 494, '1'),
(18, 3, '1'),
(18, 21, '1'),
(18, 22, '1'),
(18, 23, '1'),
(18, 24, '1'),
(18, 25, '1'),
(18, 483, '1'),
(18, 484, '1'),
(18, 486, '1'),
(18, 490, '1'),
(18, 494, '1'),
(19, 3, '1'),
(19, 54, '1'),
(19, 56, '1'),
(19, 483, '1'),
(19, 484, '1'),
(19, 486, '1'),
(19, 490, '1'),
(19, 493, '1'),
(19, 494, '1'),
(21, 3, '1'),
(21, 13, '1'),
(21, 14, '1'),
(21, 458, '1'),
(21, 460, '1'),
(21, 461, '1'),
(21, 483, '1'),
(21, 484, '1'),
(21, 486, '1'),
(21, 490, '1'),
(21, 494, '1'),
(22, 3, '1'),
(22, 93, '1'),
(22, 94, '1'),
(22, 483, '1'),
(22, 484, '1'),
(22, 486, '1'),
(22, 490, '1'),
(22, 493, '1'),
(22, 494, '1'),
(25, 3, '1'),
(25, 21, '1'),
(25, 22, '1'),
(25, 23, '1'),
(25, 24, '1'),
(25, 25, '1'),
(25, 54, '1'),
(25, 56, '1'),
(25, 67, '1'),
(25, 71, '1'),
(25, 109, '1'),
(25, 446, '1'),
(25, 449, '1'),
(25, 483, '1'),
(25, 484, '1'),
(25, 486, '1'),
(25, 490, '1'),
(25, 493, '1'),
(25, 494, '1'),
(26, 3, '1'),
(26, 13, '1'),
(26, 14, '1'),
(26, 458, '1'),
(26, 460, '1'),
(26, 461, '1'),
(26, 483, '1'),
(26, 484, '1'),
(26, 493, '1'),
(26, 494, '1'),
(28, 3, '1'),
(28, 21, '1'),
(28, 22, '1'),
(28, 23, '1'),
(28, 24, '1'),
(28, 25, '1'),
(28, 54, '1'),
(28, 56, '1'),
(28, 67, '1'),
(28, 71, '1'),
(28, 109, '1'),
(28, 446, '1'),
(28, 449, '1'),
(28, 483, '1'),
(28, 484, '1'),
(28, 486, '1'),
(28, 490, '1'),
(28, 493, '1'),
(28, 494, '1'),
(29, 3, '1'),
(29, 21, '1'),
(29, 22, '1'),
(29, 23, '1'),
(29, 24, '1'),
(29, 25, '1'),
(29, 54, '1'),
(29, 56, '1'),
(29, 67, '1'),
(29, 71, '1'),
(29, 109, '1'),
(29, 446, '1'),
(29, 449, '1'),
(29, 483, '1'),
(29, 484, '1'),
(29, 486, '1'),
(29, 490, '1'),
(29, 493, '1'),
(29, 494, '1'),
(30, 3, '1'),
(30, 95, '1'),
(30, 96, '1'),
(30, 97, '1'),
(30, 98, '1'),
(30, 99, '1'),
(30, 100, '1'),
(30, 101, '1'),
(30, 102, '1'),
(30, 103, '1'),
(30, 104, '1'),
(30, 105, '1'),
(30, 462, '1'),
(30, 483, '1'),
(30, 484, '1'),
(30, 486, '1'),
(30, 490, '1'),
(30, 493, '1'),
(30, 494, '1'),
(31, 3, '1'),
(31, 483, '1'),
(31, 484, '1'),
(31, 486, '1'),
(31, 490, '1'),
(31, 493, '1'),
(31, 494, '1'),
(31, 496, '1'),
(32, 3, '1'),
(32, 483, '1'),
(32, 484, '1'),
(32, 486, '1'),
(32, 490, '1'),
(32, 493, '1'),
(32, 494, '1'),
(32, 495, '1'),
(33, 3, '1'),
(33, 21, '1'),
(33, 22, '1'),
(33, 23, '1'),
(33, 24, '1'),
(33, 25, '1'),
(33, 54, '1'),
(33, 56, '1'),
(33, 67, '1'),
(33, 71, '1'),
(33, 109, '1'),
(33, 446, '1'),
(33, 449, '1'),
(33, 483, '1'),
(33, 484, '1'),
(33, 486, '1'),
(33, 490, '1'),
(33, 493, '1'),
(33, 494, '1'),
(34, 3, '1'),
(34, 21, '1'),
(34, 22, '1'),
(34, 23, '1'),
(34, 24, '1'),
(34, 25, '1'),
(34, 54, '1'),
(34, 56, '1'),
(34, 67, '1'),
(34, 71, '1'),
(34, 109, '1'),
(34, 446, '1'),
(34, 449, '1'),
(34, 483, '1'),
(34, 484, '1'),
(34, 486, '1'),
(34, 490, '1'),
(34, 493, '1'),
(34, 494, '1'),
(35, 3, '1'),
(35, 21, '1'),
(35, 22, '1'),
(35, 23, '1'),
(35, 24, '1'),
(35, 25, '1'),
(35, 54, '1'),
(35, 56, '1'),
(35, 67, '1'),
(35, 71, '1'),
(35, 109, '1'),
(35, 446, '1'),
(35, 449, '1'),
(35, 483, '1'),
(35, 484, '1'),
(35, 486, '1'),
(35, 490, '1'),
(35, 493, '1'),
(35, 494, '1'),
(36, 3, '1'),
(36, 21, '1'),
(36, 22, '1'),
(36, 23, '1'),
(36, 24, '1'),
(36, 25, '1'),
(36, 27, '1'),
(36, 54, '1'),
(36, 56, '1'),
(36, 67, '1'),
(36, 71, '1'),
(36, 109, '1'),
(36, 446, '1'),
(36, 449, '1'),
(36, 452, '1'),
(36, 457, '1'),
(36, 483, '1'),
(36, 484, '1'),
(36, 486, '1'),
(36, 490, '1'),
(36, 493, '1'),
(36, 494, '1'),
(37, 3, '1'),
(37, 21, '1'),
(37, 22, '1'),
(37, 23, '1'),
(37, 24, '1'),
(37, 25, '1'),
(37, 54, '1'),
(37, 56, '1'),
(37, 67, '1'),
(37, 71, '1'),
(37, 109, '1'),
(37, 446, '1'),
(37, 449, '1'),
(37, 483, '1'),
(37, 484, '1'),
(37, 486, '1'),
(37, 490, '1'),
(37, 493, '1'),
(37, 494, '1'),
(38, 3, '1'),
(38, 21, '1'),
(38, 22, '1'),
(38, 23, '1'),
(38, 24, '1'),
(38, 25, '1'),
(38, 54, '1'),
(38, 56, '1'),
(38, 67, '1'),
(38, 71, '1'),
(38, 109, '1'),
(38, 446, '1'),
(38, 449, '1'),
(38, 483, '1'),
(38, 484, '1'),
(38, 486, '1'),
(38, 490, '1'),
(38, 493, '1'),
(38, 494, '1'),
(39, 3, '1'),
(39, 21, '1'),
(39, 22, '1'),
(39, 23, '1'),
(39, 24, '1'),
(39, 25, '1'),
(39, 54, '1'),
(39, 56, '1'),
(39, 67, '1'),
(39, 71, '1'),
(39, 109, '1'),
(39, 446, '1'),
(39, 449, '1'),
(39, 483, '1'),
(39, 484, '1'),
(39, 486, '1'),
(39, 490, '1'),
(39, 493, '1'),
(39, 494, '1'),
(40, 3, '1'),
(40, 21, '1'),
(40, 22, '1'),
(40, 23, '1'),
(40, 24, '1'),
(40, 25, '1'),
(40, 54, '1'),
(40, 56, '1'),
(40, 67, '1'),
(40, 71, '1'),
(40, 109, '1'),
(40, 446, '1'),
(40, 449, '1'),
(40, 483, '1'),
(40, 484, '1'),
(40, 486, '1'),
(40, 490, '1'),
(40, 493, '1'),
(40, 494, '1'),
(41, 3, '1'),
(41, 21, '1'),
(41, 22, '1'),
(41, 23, '1'),
(41, 24, '1'),
(41, 25, '1'),
(41, 54, '1'),
(41, 56, '1'),
(41, 67, '1'),
(41, 71, '1'),
(41, 109, '1'),
(41, 446, '1'),
(41, 449, '1'),
(41, 483, '1'),
(41, 484, '1'),
(41, 486, '1'),
(41, 490, '1'),
(41, 493, '1'),
(41, 494, '1'),
(42, 3, '1'),
(42, 21, '1'),
(42, 22, '1'),
(42, 23, '1'),
(42, 24, '1'),
(42, 25, '1'),
(42, 54, '1'),
(42, 56, '1'),
(42, 67, '1'),
(42, 71, '1'),
(42, 109, '1'),
(42, 446, '1'),
(42, 449, '1'),
(42, 483, '1'),
(42, 484, '1'),
(42, 486, '1'),
(42, 490, '1'),
(42, 493, '1'),
(42, 494, '1'),
(43, 3, '1'),
(43, 21, '1'),
(43, 22, '1'),
(43, 23, '1'),
(43, 24, '1'),
(43, 25, '1'),
(43, 54, '1'),
(43, 56, '1'),
(43, 67, '1'),
(43, 71, '1'),
(43, 109, '1'),
(43, 446, '1'),
(43, 449, '1'),
(43, 483, '1'),
(43, 484, '1'),
(43, 486, '1'),
(43, 490, '1'),
(43, 493, '1'),
(43, 494, '1'),
(44, 3, '1'),
(44, 21, '1'),
(44, 22, '1'),
(44, 23, '1'),
(44, 24, '1'),
(44, 25, '1'),
(44, 54, '1'),
(44, 56, '1'),
(44, 67, '1'),
(44, 71, '1'),
(44, 109, '1'),
(44, 446, '1'),
(44, 449, '1'),
(44, 483, '1'),
(44, 484, '1'),
(44, 486, '1'),
(44, 490, '1'),
(44, 493, '1'),
(44, 494, '1'),
(45, 3, '1'),
(45, 21, '1'),
(45, 22, '1'),
(45, 23, '1'),
(45, 24, '1'),
(45, 25, '1'),
(45, 54, '1'),
(45, 56, '1'),
(45, 67, '1'),
(45, 71, '1'),
(45, 109, '1'),
(45, 446, '1'),
(45, 449, '1'),
(45, 483, '1'),
(45, 484, '1'),
(45, 486, '1'),
(45, 490, '1'),
(45, 493, '1'),
(45, 494, '1'),
(46, 3, '1'),
(46, 21, '1'),
(46, 22, '1'),
(46, 23, '1'),
(46, 24, '1'),
(46, 25, '1'),
(46, 54, '1'),
(46, 56, '1'),
(46, 67, '1'),
(46, 71, '1'),
(46, 109, '1'),
(46, 446, '1'),
(46, 449, '1'),
(46, 483, '1'),
(46, 484, '1'),
(46, 486, '1'),
(46, 490, '1'),
(46, 493, '1'),
(46, 494, '1'),
(47, 3, '1'),
(47, 21, '1'),
(47, 22, '1'),
(47, 23, '1'),
(47, 24, '1'),
(47, 25, '1'),
(47, 27, '1'),
(47, 54, '1'),
(47, 56, '1'),
(47, 67, '1'),
(47, 71, '1'),
(47, 109, '1'),
(47, 446, '1'),
(47, 449, '1'),
(47, 452, '1'),
(47, 457, '1'),
(47, 483, '1'),
(47, 484, '1'),
(47, 486, '1'),
(47, 490, '1'),
(47, 493, '1'),
(47, 494, '1');

-- --------------------------------------------------------

--
-- Table structure for table `salary_level`
--

CREATE TABLE `salary_level` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `last_update` datetime NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salary_level`
--

INSERT INTO `salary_level` (`id`, `name`, `deleted`, `last_update`, `position`, `user_id`) VALUES
(1, 'I', 0, '2018-05-27 18:18:56', 1, 1),
(2, 'II', 0, '2018-05-27 18:19:07', 2, 1),
(3, 'III', 0, '2018-05-27 18:19:15', 3, 1),
(4, 'IV', 0, '2018-05-27 18:19:22', 4, 1),
(5, 'V', 0, '2018-05-27 18:19:29', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `source_message`
--

CREATE TABLE `source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(207, 'app', 'Inccorect Request Method'),
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
(737, 'app', 'Inccorect Phiscal Year'),
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
(780, 'app', 'Telephone'),
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
(805, 'app', 'Inccorect Request'),
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
(825, 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication'),
(826, 'app', 'Subordinate List'),
(827, 'app', 'Province Code'),
(828, 'app', 'Province Name'),
(829, 'app', 'Record Status'),
(830, 'app', 'Input ID'),
(831, 'app', 'ລະຫັດ'),
(832, 'app', 'ຊື່ຜູ້ໃຊ້'),
(833, 'app', 'ລະຫດັຜ່ານ'),
(834, 'app', 'ຊື່ແທ້'),
(835, 'app', 'ນາມສະກຸນ'),
(836, 'app', 'ສະຖານະ'),
(837, 'app', 'ເບີໂທ'),
(838, 'app', 'ອີເມວ'),
(839, 'app', 'ລຶບ'),
(840, 'app', 'ສິດ ແລະ ໜ້າທີ່'),
(841, 'app', 'ແຂວງ'),
(844, 'app', 'Search:'),
(845, 'app', 'Search Keyword'),
(846, 'app', 'Display'),
(847, 'app', 'records'),
(848, 'app', 'per'),
(849, 'app', 'page'),
(850, 'app', 'Sorry , Nothing found'),
(851, 'app', 'No records available'),
(852, 'app', 'Showing'),
(853, 'app', 'to'),
(854, 'app', 'of'),
(855, 'app', 'entries'),
(856, 'app', 'filtered from'),
(857, 'app', 'total records'),
(858, 'app', 'First'),
(859, 'app', 'Last'),
(860, 'app', 'Previous'),
(861, 'app', 'Next'),
(862, 'app', 'Please enter a value for'),
(866, 'app', 'Url'),
(867, 'app', 'Icon'),
(868, 'app', 'Menugroup ID'),
(869, 'app', 'Menu Parent ID'),
(870, 'app', 'Table Name'),
(871, 'app', '{attribute}'),
(872, 'app', 'can not be blank'),
(873, 'app', 'Remembe Me'),
(874, 'app', 'Password'),
(875, 'app', 'ການກໍານົດສິດ'),
(876, 'app', 'ສົກປີ'),
(877, 'app', 'ແຈ້ງການ'),
(878, 'app', 'ໜ້າຫຼັກ'),
(879, 'app', 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ'),
(880, 'app', 'ແປຄຳສັບ'),
(881, 'app', 'ນິຕິກຳ'),
(882, 'app', 'ຜູ້ອະນຸມັດ ມູນນິທິ'),
(883, 'app', 'ຊົນເຜົ່າ'),
(884, 'app', 'ຍ້ອງຍໍຜົນງານ'),
(885, 'app', ' ເອກະສານປະເພດປຶ້ມ'),
(886, 'app', 'ປະເພດນິຕິກຳ'),
(887, 'app', 'Notices'),
(888, 'app', 'Department Name'),
(889, 'app', 'Search keyword by static table name or department name'),
(1873, 'app', 'Links'),
(1874, 'app', 'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ'),
(1875, 'app', 'admin'),
(1878, 'app', 'Name'),
(1879, 'app', 'People'),
(1880, 'app', 'Create Person'),
(1881, 'app', 'Incorrect username or password.'),
(1882, 'app', 'Please select'),
(1883, 'app', 'Table for central user input data'),
(1884, 'app', 'The Year is not allow to input'),
(1885, 'app', 'Please select user to delelete'),
(1886, 'app', 'has already been taken.'),
(1893, 'app', 'Center'),
(1894, 'app', 'M'),
(1895, 'app', 'Salary Levels'),
(1896, 'app', 'Create Salary Level'),
(1905, 'app', 'ສະຖຕິສາສະນະສະຖານ ໃນທົ່ວປະເທດສົກປີ'),
(1906, 'app', 'ລວມ'),
(1907, 'app', 'ບໍ່ຮັບຮູ້'),
(1908, 'app', 'Designed & Developed by '),
(1909, 'app', 'AKAT Solution'),
(1910, 'app', 'Incorrect Request'),
(1911, 'app', 'ໝາຍເຫດ'),
(1912, 'app', 'ຈັດລຽງລໍາດັບ'),
(1913, 'app', 'Created Date'),
(1914, 'app', 'Content'),
(1915, 'app', 'Show');

-- --------------------------------------------------------

--
-- Table structure for table `stat_3create`
--

CREATE TABLE `stat_3create` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_3create_detail`
--

CREATE TABLE `stat_3create_detail` (
  `id` int(11) NOT NULL,
  `stat_3create_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `dev_total` int(11) DEFAULT NULL,
  `dev_continue` int(11) DEFAULT NULL,
  `dev_new` int(11) DEFAULT NULL,
  `strong_total` int(11) DEFAULT NULL,
  `strong_continue` int(11) DEFAULT NULL,
  `strong_new` int(11) DEFAULT NULL,
  `big` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_aids`
--

CREATE TABLE `stat_aids` (
  `id` int(11) NOT NULL,
  `deleted` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_association_foundation`
--

CREATE TABLE `stat_association_foundation` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_association_foundation`
--

INSERT INTO `stat_association_foundation` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES
(1, '2018-03-06 04:51:34', 1, 1, 1),
(2, '2018-05-14 05:51:11', 9, 12, 1),
(3, '2019-11-11 11:28:24', 7, 2, 1),
(4, '2019-09-10 10:41:05', 7, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_association_foundation_detail`
--

CREATE TABLE `stat_association_foundation_detail` (
  `id` int(11) NOT NULL,
  `association` int(11) DEFAULT NULL,
  `foundation` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `stat_association_foundation_id` int(11) NOT NULL,
  `approver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_association_foundation_detail`
--

INSERT INTO `stat_association_foundation_detail` (`id`, `association`, `foundation`, `remark`, `stat_association_foundation_id`, `approver_id`) VALUES
(1, 43, 9, 'ກຫດກຫດກ', 1, 1),
(2, 14, NULL, 'klokj', 1, 2),
(3, 16, 1, '', 1, 4),
(4, 1, NULL, '', 1, 3),
(5, 12, NULL, NULL, 1, 5),
(6, 1, NULL, NULL, 1, 18),
(7, 5, NULL, NULL, 1, 16),
(8, 1, NULL, NULL, 1, 17),
(9, 2, NULL, NULL, 1, 15),
(10, 0, NULL, NULL, 1, 14),
(11, 9, NULL, NULL, 1, 12),
(12, 3, NULL, NULL, 1, 13),
(13, 11, NULL, NULL, 1, 11),
(14, 0, NULL, NULL, 1, 19),
(15, 7, NULL, NULL, 1, 10),
(16, 9, NULL, NULL, 1, 9),
(17, 8, NULL, NULL, 1, 8),
(18, 2, NULL, NULL, 1, 7),
(19, 3, NULL, NULL, 1, 6),
(20, 43, 9, NULL, 2, 1),
(21, 14, NULL, NULL, 2, 2),
(22, 1, NULL, NULL, 2, 3),
(23, 16, 1, NULL, 2, 4),
(24, 12, NULL, NULL, 2, 5),
(25, 3, NULL, NULL, 2, 6),
(26, 2, NULL, NULL, 2, 7),
(27, 8, NULL, NULL, 2, 8),
(28, 9, NULL, NULL, 2, 9),
(29, 7, NULL, NULL, 2, 10),
(30, 11, NULL, NULL, 2, 11),
(31, 9, NULL, NULL, 2, 12),
(32, 3, NULL, NULL, 2, 13),
(33, 0, NULL, NULL, 2, 14),
(34, 2, NULL, NULL, 2, 15),
(35, 5, NULL, NULL, 2, 16),
(36, 1, NULL, NULL, 2, 17),
(37, 1, NULL, NULL, 2, 18),
(38, 0, NULL, NULL, 2, 19),
(39, 7, 3, NULL, 3, 1),
(40, 42, 15, NULL, 4, 1),
(41, 17, NULL, 'ນນນນ', 4, 2),
(42, 0, NULL, NULL, 4, 3),
(43, 16, 0, NULL, 3, 2),
(44, 0, NULL, NULL, 3, 3),
(45, 3, 5, 'ທົດລອງ', 3, 7),
(46, 3, 0, 'ທົດລອງ!', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `stat_contract`
--

CREATE TABLE `stat_contract` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_contract`
--

INSERT INTO `stat_contract` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-10 17:11:11', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_contract_detail`
--

CREATE TABLE `stat_contract_detail` (
  `id` int(11) NOT NULL,
  `stat_contract_id` int(11) NOT NULL,
  `officer_level_id` int(11) NOT NULL,
  `quota_manage_total` int(11) DEFAULT NULL,
  `quota_manage_women` int(11) DEFAULT NULL,
  `quota_technic_total` int(11) DEFAULT NULL,
  `quota_technic_women` int(11) DEFAULT NULL,
  `nonquota_manage_total` int(11) DEFAULT NULL,
  `nonquota_manage_women` int(11) DEFAULT NULL,
  `nonquota_technic_total` int(11) DEFAULT NULL,
  `nonquota_technic_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `stat_copy` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_copy`
--

INSERT INTO `stat_copy` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-22 16:03:20', 1, 1, 1),
(2, '2018-05-14 05:15:35', 1, 12, 1),
(3, '2019-08-01 04:36:50', 1, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_copy_detail`
--

CREATE TABLE `stat_copy_detail` (
  `id` int(11) NOT NULL,
  `stat_copy_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_copy_detail`
--

INSERT INTO `stat_copy_detail` (`id`, `stat_copy_id`, `activity`, `start_year`, `end_year`, `summary`, `remark`) VALUES
(2, 1, 'ວຽກງານໃຈ້ແຍກ, ສ້າງສຳນວນ, ກຳນົດຄຸນຄ່າ ແລະ ຂຶ້ນສະຖິຕິເອກະສານບັນດາກະຊວງຕ່າງໆ', 2015, 2016, '5,411 ສຳນວນ; 205 ມັດ', ''),
(4, 1, 'ສ້າງລະຫັດຊອກຄົ້ນ', 2015, 2016, '205 ກັບ', ''),
(6, 2, 'ວຽກງານໃຈ້ແຍກ, ສ້າງສໍານວນ, ກໍານົດຄຸນຄ່າ ແລະ ຂື້ນສະຖິຕິເອກະສານບັນດາກະຊວງຕ່າງໆ', 2015, 2016, '5,411 ສໍານວນ; 205 ມັດ', NULL),
(7, 2, 'ສ້າງລະຫັດຊອກຄົ້ນ', 2015, 2016, '205 ກັບ', NULL),
(8, 2, 'ຈັດລຽງໜັງສືພິມທີ່ມີຂໍ້ມູນຂ່າວສານ', 2015, 2016, '4,773 ສະບັບ', NULL),
(9, 2, 'ຈັດລະບົບ ແລະ ບູລະນະປຶ້ມ', 2015, 2016, '5,525 ຫົວ', NULL),
(10, 2, 'ທ້ອນໂຮມຢູ່ຫ້ອງວ່າການສໍານັກງານນາຍົກລັດຖະມົນຕີ', 2015, 2016, '02 ຄັ້ງ/100 ມັດ', NULL),
(11, 2, 'ວຽກງານບໍລິການຂໍ້ມູນເອກະສານ (ສະໜອງເອກະສານ)', 2015, 2016, '829 ສະບັບ; 2,560 ໃບ ແລະ ປຶ້ມມີຈໍານວນ 137 ຫົວ', NULL),
(12, 2, 'ວຽກງານການສະແດງເອກະສານ ແລະ ຮູບພາບ', 2015, 2016, 'ຮູບພາບ 65 ແຜ່ນ; ເອກະສານ 13 ສະບັບ; ປຶ້ມ 50 ຫົວ', NULL),
(13, 2, 'ກວດກາຄືນໃນການຂືຶ້ນບັນຊີຮູບພາບ ແລະ ຂອງທີ່ລະນຶກ', 2015, 2016, 'ຂອງທີ່ລະນຶກ 22 ອັນ; ຂອງຂວັນ 14 ອັນ; ຮູບພາບ 30 ໃບ', NULL),
(14, 3, 'ໄຈແຍກ-ສ້າງສຳນວນເອກະສານ', 2018, 2018, 'ສ້າງດຳລັດ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_course`
--

CREATE TABLE `stat_course` (
  `id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_course`
--

INSERT INTO `stat_course` (`id`, `saved`, `last_update`, `user_id`, `phiscal_year_id`) VALUES
(32, 1, '2019-10-18 18:28:17', 1, 1),
(33, 1, '2019-10-23 04:07:54', 1, 3),
(34, 1, '2019-10-21 05:20:37', 1, 2),
(35, 1, '2019-06-06 16:28:07', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_course_detail`
--

CREATE TABLE `stat_course_detail` (
  `id` int(11) NOT NULL,
  `stat_course_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_course_detail`
--

INSERT INTO `stat_course_detail` (`id`, `stat_course_id`, `name`, `deleted`, `parent_id`, `position`) VALUES
(13, 34, 'ທົດລອງ', 1, 13, 1),
(14, 32, 'ຫຼັກສູດການບໍລິຫານລັດ', 1, 13, 1),
(15, 32, 'ຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນໃໝ່', 1, 13, 2),
(16, 33, 'ຫຼັກສູດ ຝຶກອົບຮົມລັດຖະກອນ (ທີ່ຮັບຮອງ ແລະ ຈັດພິມ)', 0, 16, 4),
(17, 33, 'ຫູັກສູດ ການນຳພາ', 0, 17, 3),
(18, 32, 'ຫຼັກສູດການວາງແຜນ ງົບປະມານ ແລະ ການຄຸ້ມຄອງການເງິນ', 0, 16, 1),
(19, 32, 'ຫຼັກສູດການບໍລິຫານຫ້ອງການ', 1, 13, 3),
(20, 32, 'ຫຼັກສູດການເປັນຄູຝຶກທີ່ດີ', 1, 13, 4),
(21, 32, 'ຫຼັກສູດຝຶກອົບຮົມຜູ້ບໍລິຫານທົ່ວໄປ', 0, 16, 2),
(22, 32, 'ຫຼັກສູດການຮຽນຮູ້ການເປັນຜູ້ນໍາ ໂມດູນ 1 ແລະ 2', 0, 16, 3),
(23, 32, 'ຫຼັກສູດ 1A ຂ້ອຍຕ້ອງການນໍາພາ', 0, 17, 1),
(24, 32, 'ຫຼັກສູດ 1B ຂ້ອຍສາມາດປ່ຽນແປງ', 0, 17, 2),
(25, 32, 'ຫຼັກສູດ 2A ພວກເຮົາມີວິໄສທັດ', 0, 17, 3),
(26, 32, 'ຫຼັກສູດ 2B ພວກເຮົາສາມາດລິເລີ່ມ', 0, 17, 4),
(27, 32, 'ຫຼັກສູດ 3 ພວກເຮົາເຮັດວຽກຮ່ວມກັນ', 0, 17, 5),
(28, 33, 'ຫຼັກສູດ ຄຸ້ມຄອງບຸຄາລາກອນ', 0, 28, 4),
(29, 32, 'ທົດລອງ', 1, 29, 1),
(30, 33, 'ຫຼັກສູດ ການບໍລິການຜ່ານປະຕູດຽວ', 0, 30, 20),
(31, 32, 'Gggg', 1, 0, 555),
(32, 32, 'face to face', 1, 30, 2),
(33, 33, NULL, 1, 13, NULL),
(34, 33, NULL, 1, 24, NULL),
(35, 33, '08', 1, 29, NULL),
(36, 34, NULL, 1, 29, 1),
(37, 34, '້ຶພາກ1', 1, 13, 7),
(38, 34, NULL, 1, 13, 5),
(39, 34, 'ຮາກຂັ້ນສອງ', 0, 23, 8),
(40, 34, 'ລັດຖະກອນໃໝ່', 1, 29, 12),
(41, 34, NULL, 1, 13, NULL),
(42, 32, 'TEST', 1, 28, 1),
(43, 35, 'test', 1, 29, 1),
(44, 33, 'ຝຶກອົບໂຮມ', 0, 44, 4),
(45, 34, 'ໃໝ', 0, 45, 1),
(46, 33, 'ີໍັ້ໍຊັ້ນກາງ', 0, 46, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_document`
--

CREATE TABLE `stat_document` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_document`
--

INSERT INTO `stat_document` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2019-06-06 07:56:14', 1, 1, 1),
(3, '2018-05-16 05:11:35', 1, 12, 12),
(4, '2018-10-15 10:30:26', 1, 1, 3),
(7, '2019-08-01 05:19:53', 1, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_document_detail`
--

CREATE TABLE `stat_document_detail` (
  `id` int(11) NOT NULL,
  `stat_document_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `before` int(11) DEFAULT NULL,
  `after` int(11) DEFAULT NULL,
  `after_new` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `now_before` int(11) DEFAULT NULL,
  `now_new` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_document_detail`
--

INSERT INTO `stat_document_detail` (`id`, `stat_document_id`, `province_id`, `ministry_id`, `organisation_id`, `book_id`, `before`, `after`, `after_new`, `remark`, `now_before`, `now_new`) VALUES
(1, 2, NULL, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(2, 2, NULL, NULL, 1, NULL, 2, 2, 1, 'test', NULL, NULL),
(3, 2, NULL, NULL, 2, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(4, 2, 1, NULL, NULL, NULL, NULL, 16, 0, NULL, NULL, NULL),
(5, 2, 2, NULL, NULL, NULL, 16, 20, 2, NULL, NULL, NULL),
(6, 2, NULL, NULL, NULL, 1, 7350, NULL, NULL, '', NULL, NULL),
(7, 2, NULL, NULL, NULL, 2, NULL, 2000, 743, NULL, NULL, NULL),
(8, 2, NULL, 2, NULL, NULL, NULL, 8, 0, NULL, NULL, NULL),
(9, 2, NULL, 3, NULL, NULL, 23, 298, 5, NULL, NULL, NULL),
(10, 2, NULL, 28, NULL, NULL, 3, 74, 1, NULL, NULL, NULL),
(11, 2, NULL, 25, NULL, NULL, 12, 87, NULL, NULL, NULL, NULL),
(12, 2, NULL, 6, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(13, 2, NULL, 29, NULL, NULL, 8, 327, NULL, NULL, NULL, NULL),
(14, 2, NULL, 30, NULL, NULL, 4, 338, NULL, NULL, NULL, NULL),
(15, 2, NULL, 31, NULL, NULL, 38, 144, NULL, NULL, NULL, NULL),
(16, 2, NULL, 32, NULL, NULL, 8, 74, NULL, NULL, NULL, NULL),
(17, 2, NULL, 33, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(18, 2, NULL, 34, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(19, 2, NULL, 35, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(20, 2, NULL, 27, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(21, 2, NULL, 39, NULL, NULL, NULL, 178, NULL, NULL, NULL, NULL),
(22, 2, NULL, 38, NULL, NULL, 38, 136, NULL, NULL, NULL, NULL),
(23, 2, NULL, 54, NULL, NULL, 28, 61, NULL, NULL, NULL, NULL),
(24, 2, NULL, 53, NULL, NULL, 78, 87, NULL, NULL, NULL, NULL),
(25, 2, NULL, NULL, NULL, 4, NULL, 28, NULL, NULL, NULL, NULL),
(26, 2, NULL, NULL, NULL, 3, NULL, 1078, NULL, NULL, NULL, NULL),
(27, 3, NULL, 36, NULL, NULL, 1, 1, 1, NULL, NULL, NULL),
(28, 3, NULL, 37, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(29, 3, NULL, 62, NULL, NULL, 14, 51, NULL, NULL, NULL, NULL),
(30, 3, 18, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(31, 3, 3, NULL, NULL, NULL, 13, 28, 2, NULL, NULL, NULL),
(32, 3, 4, NULL, NULL, NULL, 18, 28, NULL, NULL, NULL, NULL),
(33, 3, 5, NULL, NULL, NULL, 7, 28, NULL, NULL, NULL, NULL),
(34, 3, 8, NULL, NULL, NULL, 14, 31, 1, NULL, NULL, NULL),
(35, 3, 9, NULL, NULL, NULL, 11, 25, 5, NULL, NULL, NULL),
(36, 3, 7, NULL, NULL, NULL, 19, 36, 8, NULL, NULL, NULL),
(37, 3, 6, NULL, NULL, NULL, 10, 63, NULL, NULL, NULL, NULL),
(38, 3, 10, NULL, NULL, NULL, 9, 84, NULL, NULL, NULL, NULL),
(39, 3, 11, NULL, NULL, NULL, 7, 28, 3, NULL, NULL, NULL),
(40, 3, 12, NULL, NULL, NULL, 13, 47, 2, NULL, NULL, NULL),
(41, 3, 13, NULL, NULL, NULL, 20, 125, 1, NULL, NULL, NULL),
(42, 3, 16, NULL, NULL, NULL, 11, 74, NULL, NULL, NULL, NULL),
(43, 3, 14, NULL, NULL, NULL, 12, 27, NULL, NULL, NULL, NULL),
(44, 3, 17, NULL, NULL, NULL, 6, 23, 5, NULL, NULL, NULL),
(45, 3, 15, NULL, NULL, NULL, 5, 18, NULL, NULL, NULL, NULL),
(46, 3, NULL, NULL, 5, NULL, 46, 5408, 2326, NULL, NULL, NULL),
(47, 3, NULL, NULL, 6, NULL, NULL, 136, 1, NULL, NULL, NULL),
(48, 3, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 3, NULL, NULL, 8, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(50, 3, NULL, NULL, 18, NULL, 12, 32, NULL, NULL, NULL, NULL),
(51, 3, NULL, NULL, 13, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(52, 3, NULL, NULL, 9, NULL, NULL, 31, 7, NULL, NULL, NULL),
(53, 3, NULL, NULL, 10, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(54, 3, NULL, NULL, 11, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(55, 3, NULL, NULL, 12, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(56, 3, NULL, NULL, 3, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(57, 3, NULL, NULL, 14, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(58, 3, NULL, NULL, 15, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(59, 3, NULL, NULL, 20, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(60, 3, NULL, NULL, 16, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(61, 3, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 3, NULL, NULL, 19, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(63, 3, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 7, NULL, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(65, 7, NULL, 2, NULL, NULL, NULL, 8, 0, NULL, NULL, NULL),
(66, 7, NULL, 3, NULL, NULL, NULL, 23, 0, NULL, NULL, NULL),
(67, 7, NULL, 28, NULL, NULL, NULL, 3, 0, NULL, NULL, NULL),
(68, 7, NULL, 25, NULL, NULL, NULL, 12, 0, NULL, NULL, NULL),
(69, 7, NULL, 62, NULL, NULL, NULL, 14, 0, NULL, NULL, NULL),
(70, 7, NULL, 29, NULL, NULL, 25, 8, 0, NULL, NULL, NULL),
(71, 7, NULL, 30, NULL, NULL, NULL, 4, 0, NULL, NULL, NULL),
(72, 7, NULL, 31, NULL, NULL, NULL, 38, 0, NULL, NULL, NULL),
(73, 7, NULL, 32, NULL, NULL, NULL, 8, 0, NULL, NULL, NULL),
(74, 7, NULL, 33, NULL, NULL, NULL, 4, 0, NULL, NULL, NULL),
(75, 7, NULL, 34, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(76, 7, NULL, 35, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(77, 7, NULL, 41, NULL, NULL, NULL, 48, 0, NULL, NULL, NULL),
(78, 7, NULL, NULL, 1, NULL, 56, 0, NULL, NULL, NULL, NULL),
(79, 7, NULL, NULL, 2, NULL, NULL, 0, 0, NULL, NULL, NULL),
(80, 7, NULL, NULL, 8, NULL, NULL, 0, 0, NULL, NULL, NULL),
(81, 7, NULL, NULL, 13, NULL, NULL, 0, 0, NULL, NULL, NULL),
(82, 7, 1, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(83, 7, NULL, NULL, NULL, 1, 2371, 0, NULL, NULL, NULL, NULL),
(84, 7, NULL, 6, NULL, NULL, NULL, 28, 0, NULL, NULL, NULL),
(85, 7, NULL, 39, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(86, 7, NULL, 38, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL),
(87, 7, NULL, 54, NULL, NULL, NULL, 28, 0, NULL, NULL, NULL),
(88, 7, NULL, 53, NULL, NULL, NULL, 78, 0, NULL, NULL, NULL),
(89, 7, 2, NULL, NULL, NULL, NULL, 16, 1, NULL, NULL, NULL),
(90, 7, 3, NULL, NULL, NULL, NULL, 12, 1, NULL, NULL, NULL),
(91, 7, 4, NULL, NULL, NULL, NULL, 18, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_ethnic`
--

CREATE TABLE `stat_ethnic` (
  `id` int(11) NOT NULL,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_ethnic`
--

INSERT INTO `stat_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-09-18', 1, 1, 1),
(3, '2018-06-18', 1, 25, 12),
(5, '2018-06-22', 1, 18, 9),
(6, '2019-08-02', 1, 24, 2),
(7, '2019-07-29', 1, 19, 3),
(8, '2020-02-27', 1, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_ethnic_detail`
--

CREATE TABLE `stat_ethnic_detail` (
  `id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `ethnic_id` int(11) NOT NULL,
  `stat_ethnic_id` int(11) NOT NULL,
  `women` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_ethnic_detail`
--

INSERT INTO `stat_ethnic_detail` (`id`, `total`, `ethnic_id`, `stat_ethnic_id`, `women`, `province_id`) VALUES
(1, 697302, 1, 1, 35221, 1),
(2, 9882, 2, 1, 5115, 1),
(3, 207, 3, 1, 125, 1),
(4, 6312, 1, 1, 1736, 2),
(5, 14, 28, 1, 5, 1),
(6, 84566, 43, 1, 42232, 3),
(7, 5269, 2, 1, 2762, 2),
(8, 407, 4, 1, 235, 1),
(9, 5230, 5, 1, 3543, 1),
(10, 0, 6, 1, 0, 1),
(11, 1, 7, 1, 0, 1),
(12, 3065, 8, 1, 1609, 1),
(13, 5092, 9, 1, 3563, 1),
(14, 0, 10, 1, 0, 1),
(15, 12, 11, 1, 9, 1),
(16, 480, 12, 1, 257, 1),
(17, 0, 13, 1, 0, 1),
(18, 0, 14, 1, 0, 1),
(19, 1574, 15, 1, 733, 1),
(20, 0, 16, 1, 0, 1),
(21, 0, 17, 1, 0, 1),
(22, 0, 18, 1, 0, 1),
(23, 0, 19, 1, 0, 1),
(24, 0, 20, 1, 0, 1),
(25, 0, 21, 1, 0, 1),
(26, 0, 22, 1, 0, 1),
(27, 4, 23, 1, 1, 1),
(28, 0, 24, 1, 0, 1),
(29, 0, 25, 1, 0, 1),
(30, 0, 26, 1, 0, 1),
(31, 898, 3, 1, 415, 2),
(32, 16449, 4, 1, 415, 2),
(33, 0, 5, 1, 0, 2),
(34, 2996, 6, 1, 1487, 2),
(35, 0, 7, 1, 0, 2),
(36, 0, 8, 1, 0, 2),
(37, 34695, 9, 1, 17138, 2),
(38, 0, 10, 1, 0, 2),
(39, 0, 11, 1, 0, 2),
(40, 0, 12, 1, 0, 2),
(41, 0, 13, 1, 0, 2),
(42, 0, 14, 1, 0, 2),
(43, 0, 15, 1, 0, 2),
(44, 0, 16, 1, 0, 2),
(45, 0, 17, 1, 0, 2),
(46, 0, 18, 1, 0, 2),
(47, 0, 19, 1, 0, 2),
(48, 0, 20, 1, 0, 2),
(49, 0, 21, 1, 0, 2),
(50, 0, 22, 1, 0, 2),
(51, 0, 23, 1, 0, 2),
(52, 0, 24, 1, 0, 2),
(53, 0, 25, 1, 0, 2),
(54, 7550, 1, 1, 4316, 3),
(55, 0, 3, 1, 0, 3),
(56, 38942, 2, 1, 3601, 3),
(57, 22041, 4, 1, 11124, 3),
(58, 3136, 5, 1, 212, 3),
(59, 624, 6, 1, 276, 3),
(60, 0, 7, 1, 0, 3),
(61, 2371, 8, 1, 1215, 3),
(62, 44313, 9, 1, 22623, 3),
(63, 0, 10, 1, 0, 3),
(64, 0, 11, 1, 0, 3),
(65, 0, 12, 1, 0, 3),
(66, 0, 13, 1, 0, 3),
(67, 0, 14, 1, 0, 3),
(68, 1184, 15, 1, 594, 3),
(69, 250, 16, 1, 98, 3),
(70, 2364, 17, 1, 1184, 3),
(71, 0, 18, 1, 0, 3),
(72, 0, 19, 1, 0, 3),
(73, 0, 20, 1, 0, 3),
(74, 0, 21, 1, 0, 3),
(75, 0, 22, 1, 0, 3),
(76, 0, 23, 1, 0, 3),
(77, 0, 24, 1, 0, 3),
(78, 0, 25, 1, 0, 3),
(79, 28449, 1, 1, 13168, 5),
(80, 3601, 2, 1, 1645, 5),
(81, 0, 3, 1, 0, 5),
(82, 28069, 4, 1, 5085, 5),
(83, 5085, 5, 1, 2840, 5),
(84, 0, 6, 1, 0, 5),
(85, 0, 7, 1, 0, 5),
(86, 427, 8, 1, 219, 5),
(87, 38511, 9, 1, 21604, 5),
(88, 0, 10, 1, 0, 5),
(89, 0, 11, 1, 0, 5),
(90, 0, 12, 1, 0, 5),
(91, 0, 13, 1, 0, 5),
(92, 0, 14, 1, 0, 5),
(93, 0, 15, 1, 0, 5),
(94, 17356, 16, 1, 9401, 5),
(95, 2953, 17, 1, 1433, 5),
(96, 0, 18, 1, 0, 5),
(97, 0, 19, 1, 0, 5),
(98, 0, 20, 1, 0, 5),
(99, 0, 21, 1, 0, 5),
(100, 0, 22, 1, 0, 5),
(101, 0, 23, 1, 0, 5),
(102, 0, 24, 1, 0, 5),
(103, 0, 25, 1, 0, 5),
(104, 34782, 1, 1, 17303, 4),
(105, 5552, 2, 1, 2734, 4),
(106, 0, 3, 1, 0, 4),
(107, 20043, 4, 1, 9838, 4),
(108, 0, 5, 1, 0, 4),
(109, 2470, 6, 1, 1204, 4),
(110, 0, 7, 1, 0, 4),
(111, 0, 8, 1, 0, 4),
(112, 181932, 9, 1, 9870, 4),
(113, 0, 10, 1, 0, 4),
(114, 0, 11, 1, 0, 4),
(115, 0, 12, 1, 0, 4),
(116, 0, 13, 1, 0, 4),
(117, 0, 14, 1, 0, 4),
(118, 385, 15, 1, 173, 4),
(119, 357, 16, 1, 173, 4),
(120, 0, 17, 1, 0, 4),
(121, 0, 18, 1, 0, 4),
(122, 0, 19, 1, 0, 4),
(123, 0, 20, 1, 0, 4),
(124, 0, 21, 1, 0, 4),
(125, 0, 22, 1, 0, 4),
(126, 0, 23, 1, 0, 4),
(127, 0, 24, 1, 0, 4),
(128, 0, 25, 1, 0, 4),
(129, 79059, 1, 1, 53263, 6),
(130, 0, 2, 1, 0, 6),
(131, 22143, 3, 1, 3054, 6),
(132, 9139, 4, 1, 3390, 6),
(133, 1995, 5, 1, 1021, 6),
(134, 0, 6, 1, 0, 6),
(135, 0, 7, 1, 0, 6),
(136, 0, 8, 1, 0, 6),
(137, 179739, 9, 1, 89596, 6),
(138, 0, 10, 1, 0, 6),
(139, 0, 11, 1, 0, 6),
(140, 0, 12, 1, 0, 6),
(141, 338, 13, 1, 201, 6),
(142, 0, 14, 1, 0, 6),
(143, 0, 15, 1, 0, 6),
(144, 0, 16, 1, 0, 6),
(145, 0, 17, 1, 0, 6),
(146, 0, 18, 1, 0, 6),
(147, 0, 19, 1, 0, 6),
(148, 0, 22, 1, 0, 6),
(149, 0, 21, 1, 0, 6),
(150, 0, 20, 1, 0, 6),
(151, 0, 23, 1, 0, 6),
(152, 0, 24, 1, 0, 6),
(153, 0, 25, 1, 0, 6),
(154, 73369, 1, 1, 36382, 7),
(155, 76762, 2, 1, 37257, 7),
(156, 0, 3, 1, 0, 7),
(157, 0, 4, 1, 0, 7),
(158, 0, 5, 1, 0, 7),
(159, 0, 6, 1, 0, 7),
(160, 0, 7, 1, 0, 7),
(161, 0, 8, 1, 0, 7),
(162, 32404, 9, 1, 16205, 7),
(163, 0, 10, 1, 0, 7),
(164, 8558, 11, 1, 4002, 7),
(165, 15090, 12, 1, 7672, 7),
(166, 0, 13, 1, 0, 7),
(167, 0, 14, 1, 0, 7),
(168, 0, 15, 1, 0, 7),
(169, 0, 16, 1, 0, 7),
(170, 0, 17, 1, 0, 7),
(171, 0, 18, 1, 0, 7),
(172, 0, 19, 1, 0, 7),
(173, 0, 20, 1, 0, 7),
(174, 0, 21, 1, 0, 7),
(175, 0, 22, 1, 0, 7),
(176, 0, 23, 1, 0, 7),
(177, 0, 24, 1, 0, 7),
(178, 0, 25, 1, 0, 7),
(179, 9467, 2, 1, 4494, 9),
(180, 0, 3, 1, 0, 9),
(181, 0, 4, 1, 0, 9),
(182, 0, 5, 1, 0, 9),
(183, 0, 6, 1, 0, 9),
(184, 0, 7, 1, 0, 9),
(185, 744, 8, 1, 385, 9),
(186, 21095, 9, 1, 9962, 9),
(187, 0, 10, 1, 0, 9),
(188, 0, 11, 1, 0, 9),
(189, 7541, 12, 1, 3766, 9),
(190, 0, 13, 1, 0, 9),
(191, 124, 14, 1, 54, 9),
(192, 0, 16, 1, 0, 9),
(193, 0, 17, 1, 0, 9),
(194, 0, 18, 1, 0, 9),
(195, 0, 19, 1, 0, 9),
(196, 0, 20, 1, 0, 9),
(197, 0, 21, 1, 0, 9),
(198, 0, 22, 1, 0, 9),
(199, 0, 23, 1, 0, 9),
(200, 0, 24, 1, 0, 9),
(201, 0, 25, 1, 0, 9),
(202, 15264, 15, 1, 6728, 9),
(203, 19513, 1, 1, 1145, 8),
(204, 600, 2, 1, 298, 8),
(205, 1213, 3, 1, 627, 8),
(206, 14133, 5, 1, 7093, 8),
(207, 276446, 6, 1, 137221, 8),
(208, 0, 7, 1, 0, 8),
(209, 0, 8, 1, 0, 8),
(210, 25619, 10, 1, 12752, 8),
(211, 0, 11, 1, 0, 8),
(212, 0, 12, 1, 0, 8),
(213, 0, 13, 1, 0, 8),
(214, 0, 14, 1, 0, 8),
(215, 0, 15, 1, 0, 8),
(216, 0, 16, 1, 0, 8),
(217, 0, 17, 1, 0, 8),
(218, 0, 18, 1, 0, 8),
(219, 0, 19, 1, 0, 8),
(220, 0, 20, 1, 0, 8),
(221, 0, 21, 1, 0, 8),
(222, 0, 22, 1, 0, 8),
(223, 0, 23, 1, 0, 8),
(224, 0, 24, 1, 0, 8),
(225, 0, 25, 1, 0, 8),
(226, 251962, 1, 1, 125572, 10),
(227, 9219, 2, 1, 4785, 10),
(228, 1360, 3, 1, 674, 10),
(229, 83, 4, 1, 41, 10),
(230, 819, 5, 1, 415, 10),
(231, 0, 6, 1, 0, 10),
(232, 0, 7, 1, 0, 10),
(233, 18381, 8, 1, 9294, 10),
(234, 74609, 9, 1, 36758, 10),
(235, 0, 10, 1, 0, 10),
(236, 0, 11, 1, 0, 10),
(237, 302, 12, 1, 150, 10),
(238, 326, 13, 1, 169, 10),
(239, 0, 14, 1, 0, 10),
(240, 0, 15, 1, 0, 10),
(241, 0, 16, 1, 0, 10),
(242, 0, 17, 1, 0, 10),
(243, 0, 18, 1, 0, 10),
(244, 0, 19, 1, 0, 10),
(245, 0, 20, 1, 0, 10),
(246, 0, 21, 1, 0, 10),
(247, NULL, 22, 1, NULL, 10),
(248, 0, 23, 1, 0, 10),
(249, 0, 24, 1, 0, 10),
(250, 0, 25, 1, 0, 10),
(251, 124188, 1, 1, 61630, 11),
(252, 38371, 2, 1, 7904, 11),
(253, 7904, 3, 1, 3965, 11),
(254, 334, 4, 1, 174, 11),
(255, 117, 5, 1, 67, 11),
(256, 789, 6, 1, 373, 11),
(257, 1133, 7, 1, 589, 11),
(258, 488, 8, 1, 239, 11),
(259, 9688, 9, 1, 4880, 11),
(260, 0, 10, 1, 0, 11),
(261, 109, 11, 1, 60, 11),
(262, 8447, 12, 1, 4066, 11),
(263, 0, 13, 1, 0, 11),
(264, 0, 14, 1, 0, 11),
(265, 0, 15, 1, 0, 11),
(266, 0, 16, 1, 0, 11),
(267, 10, 17, 1, 7, 11),
(268, 147, 18, 1, 75, 11),
(269, 2, 19, 1, 2, 11),
(270, 8, 20, 1, 2, 11),
(271, 105, 21, 1, 57, 11),
(272, 0, 22, 1, 0, 11),
(273, 14, 23, 1, 6, 11),
(274, 0, 24, 1, 0, 11),
(275, 0, 25, 1, 0, 11),
(276, 251736, 1, 1, 132646, 12),
(277, 1426, 2, 1, 688, 12),
(278, 60574, 3, 1, 30841, 12),
(279, 0, 4, 1, 0, 12),
(280, 0, 5, 1, 0, 12),
(281, 0, 6, 1, 0, 12),
(282, 2619, 7, 1, 1336, 12),
(283, 0, 8, 1, 0, 12),
(284, 0, 9, 1, 0, 12),
(285, 0, 10, 1, 0, 12),
(286, 0, 11, 1, 0, 12),
(287, 0, 12, 1, 0, 12),
(288, 0, 13, 1, 0, 12),
(289, 0, 14, 1, 0, 12),
(290, 0, 15, 1, 0, 12),
(291, 0, 16, 1, 0, 12),
(292, 0, 17, 1, 0, 12),
(293, 0, 18, 1, 0, 12),
(294, 46984, 19, 1, 23234, 12),
(295, 9367, 20, 1, 4401, 12),
(296, 0, 21, 1, 0, 12),
(297, 0, 22, 1, 0, 12),
(298, 0, 23, 1, 0, 12),
(299, 0, 24, 1, 0, 12),
(300, 0, 25, 1, 0, 12),
(301, 567892, 1, 1, 287971, 13),
(302, 71, 2, 1, 34, 13),
(303, 135223, 3, 1, 77376, 13),
(304, 0, 4, 1, 0, 13),
(305, 0, 5, 1, 0, 13),
(306, 0, 7, 1, 0, 13),
(307, 6, 8, 1, 4, 13),
(308, 3, 9, 1, 1, 13),
(309, 0, 10, 1, 0, 13),
(310, 0, 11, 1, 0, 13),
(311, 0, 12, 1, 0, 13),
(312, 0, 13, 1, 0, 13),
(313, 0, 14, 1, 0, 13),
(314, 0, 15, 1, 0, 13),
(315, 0, 16, 1, 0, 13),
(316, 0, 17, 1, 0, 13),
(317, 88993, 18, 1, 58368, 13),
(318, 115673, 19, 1, 58368, 13),
(319, 283134, 20, 1, 14836, 13),
(320, 0, 21, 1, 0, 13),
(321, 0, 22, 1, 0, 13),
(322, 4693, 23, 1, 2423, 13),
(323, 0, 24, 1, 0, 13),
(324, 0, 25, 1, 0, 13),
(325, 235393, 1, 1, 119689, 14),
(326, NULL, 2, 1, NULL, 14),
(327, 6332, 3, 1, 3260, 14),
(328, 0, 4, 1, 0, 14),
(329, 0, 5, 1, 0, 14),
(330, 0, 6, 1, 0, 14),
(331, 0, 7, 1, 0, 14),
(332, 0, 8, 1, NULL, 14),
(333, 0, 9, 1, 0, 14),
(334, 0, 10, 1, 0, 14),
(335, 0, 11, 1, 0, 14),
(336, 0, 12, 1, 0, 14),
(337, 0, 13, 1, 0, 14),
(338, 0, 14, 1, 0, 14),
(339, 0, 15, 1, 0, 14),
(340, 0, 16, 1, 0, 14),
(341, 0, 17, 1, 0, 14),
(342, 56048, 18, 1, 30564, 14),
(343, 0, 19, 1, 0, 14),
(344, 0, 20, 1, 0, 14),
(345, 9186, 21, 1, 4512, 14),
(346, 0, 22, 1, 0, 14),
(347, 130994, 1, 1, 6642, 15),
(348, 26262, 23, 1, 14604, 14),
(349, 0, 24, 1, 0, 14),
(350, 0, 25, 1, 0, 14),
(351, 0, 27, 1, 0, 1),
(352, 0, 29, 1, 0, 1),
(353, 0, 30, 1, 0, 1),
(354, 11, 31, 1, 5, 1),
(355, 5, 32, 1, 3, 1),
(356, 7, 33, 1, 3, 1),
(357, 0, 34, 1, 0, 1),
(358, 0, 35, 1, 0, 1),
(359, 0, 36, 1, 0, 1),
(360, 0, 37, 1, 0, 1),
(361, 0, 38, 1, 0, 1),
(362, 0, 39, 1, 0, 1),
(363, 0, 40, 1, 0, 1),
(364, 21842, 41, 1, 11244, 1),
(365, 560, 42, 1, 276, 1),
(366, 0, 43, 1, 0, 1),
(367, 740, 44, 1, 401, 1),
(368, 0, 45, 1, 0, 1),
(369, 0, 46, 1, 0, 1),
(370, 0, 47, 1, 0, 1),
(371, 0, 48, 1, 0, 1),
(372, 10, 49, 1, 6, 1),
(373, 0, 26, 1, 0, 2),
(374, 0, 27, 1, 0, 2),
(375, 0, 28, 1, 0, 2),
(376, 0, 29, 1, 0, 2),
(377, 0, 30, 1, 0, 2),
(378, 0, 31, 1, 0, 2),
(379, 0, 32, 1, 0, 2),
(380, 0, 33, 1, 0, 2),
(381, 0, 34, 1, 0, 2),
(382, 0, 35, 1, 0, 2),
(383, 0, 36, 1, 0, 2),
(384, 0, 37, 1, 0, 2),
(385, 0, 38, 1, 0, 2),
(386, 0, 39, 1, 0, 2),
(387, 0, 40, 1, 0, 2),
(388, 5935, 41, 1, 2865, 2),
(389, 0, 42, 1, 0, 2),
(390, 32966, 43, 1, 15336, 2),
(391, 13106, 44, 1, 6502, 2),
(392, 0, 45, 1, 0, 2),
(393, 55935, 1, 1, 26935, 17),
(394, 2077, 46, 1, 870, 2),
(395, 1558, 47, 1, 722, 2),
(396, 6613, 21, 1, 3253, 17),
(397, 1252, 48, 1, 632, 2),
(398, 5769, 49, 1, 2769, 2),
(399, 18402, 22, 1, 8958, 17),
(400, 0, 26, 1, 0, 3),
(401, 13, 23, 1, 8, 17),
(402, 0, 27, 1, 0, 3),
(403, 0, 28, 1, 0, 3),
(404, 3186, 24, 1, 1623, 17),
(405, 0, 29, 1, 0, 3),
(406, 0, 30, 1, 0, 3),
(407, 0, 31, 1, 0, 3),
(408, 0, 32, 1, 0, 3),
(409, 0, 33, 1, 0, 3),
(410, 0, 34, 1, 0, 3),
(411, 0, 35, 1, 0, 3),
(412, 0, 36, 1, 0, 3),
(413, 0, 37, 1, 0, 3),
(414, 0, 38, 1, 0, 3),
(415, 0, 39, 1, 0, 3),
(416, 0, 40, 1, 0, 3),
(417, 2812, 42, 1, 2456, 3),
(418, 3600, 44, 1, 1740, 3),
(419, 13348, 45, 1, 6772, 3),
(420, 0, 46, 1, 0, 3),
(421, 0, 47, 1, 0, 3),
(422, 0, 48, 1, 0, 3),
(423, 2212, 49, 1, 1082, 3),
(424, 4835, 21, 1, 2329, 15),
(425, 11072, 22, 1, 5794, 15),
(426, 25232, 41, 1, 11517, 5),
(427, 5188, 23, 1, 2416, 15),
(428, 4319, 42, 1, 1190, 5),
(429, 2431, 43, 1, 1720, 5),
(430, 6206, 24, 1, 2571, 15),
(431, 952, 44, 1, 448, 5),
(432, 11690, 45, 1, 5850, 5),
(433, 0, 46, 1, 0, 5),
(434, 0, 47, 1, 0, 5),
(435, 0, 48, 1, 0, 5),
(436, 0, 49, 1, 0, 5),
(437, 0, 40, 1, 0, 5),
(438, 0, 39, 1, 0, 5),
(439, 0, 38, 1, 0, 5),
(440, 0, 37, 1, 0, 5),
(441, 0, 36, 1, 0, 5),
(442, 0, 35, 1, 0, 5),
(443, 0, 34, 1, 0, 5),
(444, 0, 33, 1, 0, 5),
(445, 0, 32, 1, 0, 5),
(446, 0, 31, 1, 0, 5),
(447, 0, 27, 1, 0, 5),
(448, 0, 30, 1, 0, 5),
(449, 0, 29, 1, 0, 5),
(450, 0, 26, 1, 0, 5),
(451, 7464, 3, 1, 3829, 16),
(452, 0, 26, 1, 0, 4),
(453, 420, 8, 1, 189, 16),
(454, 0, 27, 1, 0, 4),
(455, 8664, 18, 1, 4055, 16),
(456, 38229, 21, 1, 19317, 16),
(457, 0, 28, 1, 0, 4),
(458, 8814, 23, 1, 4383, 16),
(459, 0, 29, 1, 0, 4),
(460, 0, 30, 1, 0, 4),
(461, 2817, 25, 1, 1250, 16),
(462, 0, 31, 1, 0, 4),
(463, 0, 32, 1, 0, 4),
(464, 0, 33, 1, 0, 4),
(465, 20399, 1, 1, 9488, 18),
(466, 0, 34, 1, 0, 4),
(467, 1226, 2, 1, 573, 18),
(468, 0, 35, 1, 0, 4),
(469, 0, 36, 1, 0, 4),
(470, 12112, 9, 1, 6194, 18),
(471, 0, 37, 1, 0, 4),
(472, 0, 38, 1, 0, 4),
(473, 0, 39, 1, 0, 4),
(474, 0, 40, 1, 0, 4),
(475, 44863, 41, 1, 36807, 4),
(476, 377, 42, 1, 150, 4),
(477, 7417, 43, 1, 3722, 4),
(478, 0, 45, 1, 0, 4),
(479, 0, 46, 1, 0, 4),
(480, 0, 47, 1, 0, 4),
(481, 0, 48, 1, 0, 4),
(482, 3158, 49, 1, 1570, 4),
(483, 0, 26, 1, 0, 6),
(484, 0, 27, 1, 0, 6),
(485, 0, 28, 1, 0, 6),
(486, 50188, 41, 1, 24779, 18),
(487, 0, 29, 1, 0, 6),
(488, 1869, 42, 1, 727, 18),
(489, 0, 30, 1, 0, 6),
(490, 0, 31, 1, 0, 6),
(491, 0, 32, 1, 0, 6),
(492, 0, 33, 1, 0, 6),
(493, 0, 34, 1, 0, 6),
(494, 5361, 27, 1, 2697, 17),
(495, 0, 35, 1, 0, 6),
(496, 0, 36, 1, 0, 6),
(497, 0, 37, 1, 0, 6),
(498, 7761, 30, 1, 3897, 17),
(499, 0, 38, 1, 0, 6),
(500, 0, 39, 1, 0, 6),
(501, 0, 40, 1, 0, 6),
(502, 0, 41, 1, 0, 6),
(503, 995, 42, 1, 497, 6),
(504, 877, 31, 1, 637, 17),
(505, 0, 43, 1, 0, 6),
(506, 1041, 44, 1, 361, 6),
(507, 0, 45, 1, 0, 6),
(508, 0, 46, 1, 0, 6),
(509, 309, 34, 1, 150, 17),
(510, 0, 47, 1, 0, 6),
(511, 0, 48, 1, 0, 6),
(512, 13, 49, 1, 6, 6),
(513, 2979, 27, 1, 1702, 16),
(514, 1781, 29, 1, 873, 16),
(515, 18947, 32, 1, 873, 16),
(516, 6537, 36, 1, 3044, 16),
(517, 0, 26, 1, 0, 7),
(518, 0, 27, 1, 0, 7),
(519, 24706, 26, 1, 12199, 15),
(520, 0, 28, 1, 0, 7),
(521, 22728, 29, 1, 10750, 15),
(522, 0, 29, 1, 0, 7),
(523, 0, 30, 1, 0, 7),
(524, 0, 31, 1, 0, 7),
(525, 5521, 32, 1, 2851, 15),
(526, 0, 32, 1, 0, 7),
(527, 0, 33, 1, 0, 7),
(528, 0, 34, 1, 0, 7),
(529, 0, 36, 1, 0, 7),
(530, 0, 35, 1, 0, 7),
(531, 0, 37, 1, 0, 7),
(532, 0, 38, 1, 0, 7),
(533, 557, 39, 1, 280, 7),
(534, 0, 40, 1, 0, 7),
(535, 86934, 41, 1, 43349, 7),
(536, 0, 43, 1, 0, 7),
(537, 0, 44, 1, 0, 7),
(538, 0, 45, 1, 0, 7),
(539, 0, 46, 1, 0, 7),
(540, 0, 47, 1, 0, 7),
(541, 1492, 26, 1, 767, 14),
(542, 0, 48, 1, 0, 7),
(543, 35, 49, 1, 17, 7),
(544, 670, 27, 1, 333, 14),
(545, 0, 41, 1, 0, 9),
(546, 0, 40, 1, 0, 9),
(547, 0, 39, 1, 0, 9),
(548, 30655, 32, 1, 15337, 14),
(549, 0, 38, 1, 0, 9),
(550, 0, 37, 1, 0, 9),
(551, 0, 36, 1, 0, 9),
(552, 0, 35, 1, 0, 9),
(553, 0, 34, 1, 0, 9),
(554, 0, 33, 1, 0, 9),
(555, 0, 32, 1, 0, 9),
(556, 0, 31, 1, 0, 9),
(557, 0, 30, 1, 0, 9),
(558, 0, 29, 1, 0, 9),
(559, 0, 28, 1, 0, 9),
(560, 0, 27, 1, 0, 9),
(561, 0, 26, 1, 0, 9),
(562, 19, 44, 1, 10, 9),
(563, 20628, 41, 1, 17022, 8),
(564, 3380, 42, 1, 1729, 8),
(565, 62114, 41, 1, 33622, 10),
(566, 2784, 42, 1, 1411, 10),
(567, 14, 28, 1, 7, 11),
(568, 72, 32, 1, 36, 11),
(569, 4806, 37, 1, 2432, 11),
(570, 1110, 40, 1, 520, 11),
(571, 48661, 41, 1, 24489, 11),
(572, 154, 43, 1, 85, 11),
(573, 61, 44, 1, 32, 11),
(574, 246732, 49, 1, 111688, 11),
(575, 1132, 40, 1, 563, 12),
(576, 251, 41, 1, 183, 12),
(577, 21, 28, 1, 13, 13),
(578, 3482, 32, 1, 1762, 13),
(579, 342, 35, 1, 180, 13),
(580, 22424, 35, 1, 11362, 14),
(581, 13146, 38, 1, 2859, 14),
(582, 19470, 27, 1, 10162, 15),
(583, 54411, 1, 1, 10961, 9),
(584, 799, 1, 3, 100, 1),
(587, 500, 44, 3, 200, 2),
(588, 300, 2, 5, 250, 2),
(590, 100, 1, 3, 40, 3),
(591, 100, 3, 5, 40, 3),
(593, 100, 2, 5, 40, 1),
(595, 100, 1, 3, 30, 4),
(596, 100, 2, 5, 30, 4),
(598, 100, 4, 3, 20, 5),
(599, 100, 5, 5, 20, 5),
(602, 79059, 1, 5, 53263, 6),
(604, 500, 3, 3, 100, 7),
(605, 100, 5, 5, 20, 7),
(606, 19513, 1, 5, 1145, 8),
(607, 109614, 1, 3, 54411, 9),
(608, 9467, 2, 3, 4494, 9),
(609, 104333, 41, 3, 51184, 9),
(610, 9467, 2, 5, 4494, 9),
(611, 100, 1, 3, 20, 10),
(612, 0, 3, 5, 0, 8),
(613, 0, 4, 5, 0, 8),
(1079, 147451, 1, 6, 84283, 6),
(1080, 5529, 2, 6, 2785, 6),
(1081, 10290, 4, 6, 3684, 6),
(1082, 6790, 5, 6, 6285, 6),
(1083, 199100, 9, 6, 96178, 6),
(1084, 10649, 13, 6, 5024, 6),
(1085, 96786, 41, 6, 45709, 6),
(1086, 10744, 42, 6, 5210, 6),
(1087, 276924, 1, 6, 138320, 10),
(1088, 1070, 44, 6, 378, 6),
(1089, 32, 49, 6, 11, 6),
(1090, 4606, 2, 6, 2355, 10),
(1091, 21839, 1, 6, 10427, 18),
(1092, 810, 2, 6, 392, 18),
(1093, 110042, 1, 6, 34870, 9),
(1094, 700, 3, 6, 438, 18),
(1095, 0, 4, 6, 0, 18),
(1096, 11702, 2, 6, 5679, 9),
(1097, 0, 5, 6, 0, 18),
(1098, 21261, 9, 6, 10454, 9),
(1099, 0, 6, 6, 0, 18),
(1100, 7261, 12, 6, 4104, 9),
(1101, 0, 7, 6, 0, 18),
(1102, 560396, 1, 6, 291032, 13),
(1103, 852, 8, 6, 426, 18),
(1104, 12389, 9, 6, 6403, 18),
(1105, 163972, 3, 6, 83183, 13),
(1106, 0, 10, 6, 0, 18),
(1107, 0, 11, 6, 0, 18),
(1108, 79179, 18, 6, 3085, 13),
(1109, 45235, 1, 6, 21079, 17),
(1110, 3085, 19, 6, 1490, 13),
(1111, 27226, 1, 6, 13935, 5),
(1112, 224, 14, 6, 102, 9),
(1113, 0, 2, 6, 0, 17),
(1114, 3511, 2, 6, 1664, 5),
(1115, 0, 3, 6, 0, 17),
(1116, 235260, 1, 6, 111734, 8),
(1117, 0, 4, 6, 0, 17),
(1118, 27, 20, 6, 15, 13),
(1119, NULL, 3, 6, NULL, 5),
(1120, 0, 5, 6, 0, 17),
(1121, 905, 3, 6, 447, 8),
(1122, 124188, 1, 6, 61630, 11),
(1123, 1, 21, 6, 0, 13),
(1124, 0, 6, 6, 0, 17),
(1125, 0, 7, 6, 0, 17),
(1126, 3987, 1, 6, 1964, 3),
(1127, 0, 8, 6, 0, 17),
(1128, 27910, 4, 6, 13760, 5),
(1129, 0, 9, 6, 0, 17),
(1130, 91367, 31, 6, 46223, 13),
(1131, 0, 10, 6, 0, 17),
(1132, 1005, 3, 6, 445, 10),
(1133, 17948, 2, 6, 9910, 3),
(1134, 28713, 4, 6, 14103, 8),
(1135, 0, 11, 6, 0, 17),
(1136, 0, 12, 6, 0, 17),
(1137, 91367, 32, 6, 46223, 13),
(1138, 5706, 5, 6, 2515, 5),
(1139, 18782, 5, 6, 9311, 8),
(1140, 0, 3, 6, 0, 3),
(1141, 0, 13, 6, 0, 17),
(1142, 27, 33, 6, 15, 13),
(1143, 0, 14, 6, 0, 17),
(1144, 0, 6, 6, 0, 5),
(1145, 0, 4, 6, 0, 10),
(1146, 21444, 4, 6, 10653, 3),
(1147, 0, 7, 6, 0, 5),
(1148, 0, 15, 6, 0, 17),
(1149, 1, 34, 6, 0, 13),
(1150, 41805, 9, 6, 20528, 8),
(1151, 0, 16, 6, 0, 17),
(1152, 1159, 8, 6, 407, 5),
(1153, 5424, 5, 6, 2647, 3),
(1154, 8294, 10, 6, 2954, 8),
(1155, 8774, 1, 6, 3284, 2),
(1156, 4729, 36, 6, 2579, 13),
(1157, 0, 17, 6, 0, 17),
(1158, 1022, 5, 6, 552, 10),
(1159, 44102, 9, 6, 22129, 5),
(1160, 0, 18, 6, 0, 17),
(1161, 2358, 6, 6, 1140, 3),
(1162, 108591, 41, 6, 53517, 9),
(1163, 4, 26, 6, 0, 8),
(1164, 32795, 1, 6, 16297, 4),
(1165, 0, 19, 6, 0, 17),
(1166, 6227, 2, 6, 2317, 2),
(1167, 0, 10, 6, 0, 5),
(1168, 0, 7, 6, 0, 3),
(1169, 259081, 42, 6, 108726, 9),
(1170, 0, 20, 6, 0, 17),
(1171, 0, 11, 6, 0, 5),
(1172, 67285, 41, 6, 16103, 8),
(1173, 5835, 2, 6, 2820, 4),
(1174, 0, 6, 6, 0, 10),
(1175, 0, 12, 6, 0, 5),
(1176, 902, 3, 6, 422, 2),
(1177, 0, 3, 6, 0, 4),
(1178, 0, 8, 6, 0, 3),
(1179, 3212, 42, 6, 1502, 8),
(1180, 0, 7, 6, 0, 10),
(1181, 0, 13, 6, 0, 5),
(1182, 11214, 29, 6, 5430, 15),
(1183, 36371, 2, 6, 7904, 11),
(1184, 72376, 1, 6, 35618, 7),
(1185, 0, 14, 6, 0, 5),
(1186, 22715, 4, 6, 11275, 4),
(1187, 19667, 4, 6, 9684, 2),
(1188, 43808, 9, 6, 22300, 3),
(1189, 7067, 21, 6, 3395, 17),
(1190, 8912, 8, 6, 4351, 10),
(1191, 0, 15, 6, 0, 5),
(1192, 0, 5, 6, 0, 4),
(1193, 0, 10, 6, 0, 3),
(1194, 0, 5, 6, 0, 2),
(1195, 14842, 22, 6, 7538, 17),
(1196, 7485, 3, 6, 3879, 11),
(1197, 0, 11, 6, 0, 3),
(1198, 18502, 16, 6, 9491, 5),
(1199, 13146, 29, 1, 2859, 14),
(1200, 81184, 2, 6, 40055, 7),
(1201, 3670, 6, 6, 2031, 2),
(1202, 440, 23, 6, 238, 17),
(1203, 3376, 17, 6, 1718, 5),
(1204, 0, 7, 6, 0, 2),
(1205, 268, 4, 6, 136, 11),
(1206, 0, 3, 6, 0, 7),
(1207, 0, 12, 6, 0, 3),
(1208, 2552, 6, 6, 1306, 4),
(1209, 79439, 9, 6, 45143, 10),
(1210, 0, 18, 6, 0, 5),
(1211, 119, 5, 6, 68, 11),
(1212, 992, 8, 6, 457, 2),
(1213, 0, 7, 6, 0, 4),
(1214, 0, 4, 6, 0, 7),
(1215, 0, 19, 6, 0, 5),
(1216, 3140, 24, 6, 1539, 17),
(1217, 0, 13, 6, 0, 3),
(1218, 0, 5, 6, 0, 7),
(1219, 0, 10, 6, 0, 10),
(1220, 0, 8, 6, 0, 4),
(1221, 789, 6, 6, 373, 11),
(1222, 0, 20, 6, 0, 5),
(1223, 4261, 32, 6, 2140, 15),
(1224, 20531, 9, 6, 13927, 2),
(1225, 0, 14, 6, 0, 3),
(1226, 0, 6, 6, 0, 7),
(1227, 0, 21, 6, 0, 5),
(1228, 64, 11, 6, 41, 10),
(1229, 183692, 9, 6, 91577, 4),
(1230, 1124, 7, 6, 562, 11),
(1231, 819, 15, 6, 397, 3),
(1232, 22274, 25, 6, 12807, 17),
(1233, 0, 7, 6, 0, 7),
(1234, 1221, 34, 6, 458, 15),
(1235, 0, 12, 6, 0, 18),
(1236, 0, 10, 6, 0, 4),
(1237, 0, 22, 6, 0, 5),
(1238, 0, 8, 6, 0, 7),
(1239, 0, 13, 6, 0, 18),
(1240, 4678, 16, 6, 2355, 3),
(1241, 0, 23, 6, 0, 5),
(1242, 332, 12, 6, 178, 10),
(1243, 0, 11, 6, 0, 4),
(1244, NULL, 3, 6, NULL, 16),
(1245, 1267, 8, 6, 636, 11),
(1246, 0, 14, 6, 0, 18),
(1247, 0, 12, 6, 0, 4),
(1248, 0, 24, 6, 0, 5),
(1249, 0, 13, 6, 0, 10),
(1250, 0, 15, 6, 0, 18),
(1251, 0, 26, 6, 0, 17),
(1252, 2278, 17, 6, 1145, 3),
(1253, 0, 13, 6, 0, 4),
(1254, 33635, 9, 6, 16509, 7),
(1255, 0, 16, 6, 0, 18),
(1256, 0, 14, 6, 0, 10),
(1257, 0, 25, 6, 0, 5),
(1258, 0, 10, 6, 0, 7),
(1259, 12351, 9, 6, 5872, 11),
(1260, 0, 17, 6, 0, 18),
(1261, 0, 15, 6, 0, 10),
(1262, 0, 18, 6, 0, 3),
(1263, 5700, 27, 6, 2883, 17),
(1264, 0, 18, 6, 0, 18),
(1265, 109, 11, 6, 60, 11),
(1266, 0, 14, 6, 0, 4),
(1267, 7369, 11, 6, 3582, 7),
(1268, 0, 19, 6, 0, 3),
(1269, 0, 19, 6, 0, 18),
(1270, 0, 20, 6, 0, 18),
(1271, 8098, 12, 6, 3523, 11),
(1272, 14911, 12, 6, 7521, 7),
(1273, 22869, 28, 6, 11354, 17),
(1274, 393, 15, 6, 188, 4),
(1275, 0, 21, 6, 0, 18),
(1276, 0, 20, 6, 0, 3),
(1277, 0, 16, 6, 0, 10),
(1278, 0, 13, 6, 0, 7),
(1279, 10, 17, 6, 7, 11),
(1280, 0, 14, 6, 0, 7),
(1281, 0, 29, 6, 0, 17),
(1282, 0, 21, 6, 0, 3),
(1283, 0, 22, 6, 0, 18),
(1284, 357, 16, 6, 173, 4),
(1285, 167, 18, 6, 71, 11),
(1286, 0, 15, 6, 0, 7),
(1287, 0, 17, 6, 0, 10),
(1288, 759, 9, 6, 406, 16),
(1289, 0, 23, 6, 0, 18),
(1290, 0, 17, 6, 0, 4),
(1291, 12344, 41, 6, 6170, 3),
(1292, 0, 22, 6, 0, 3),
(1293, 0, 16, 6, 0, 7),
(1294, 0, 18, 6, 0, 4),
(1295, 0, 18, 6, 0, 10),
(1296, 0, 24, 6, 0, 18),
(1297, 9047, 30, 6, 5140, 17),
(1298, NULL, 18, 6, NULL, 16),
(1299, 0, 23, 6, 0, 3),
(1300, 0, 19, 6, 0, 4),
(1301, 0, 17, 6, 0, 7),
(1302, 0, 25, 6, 0, 18),
(1303, 0, 19, 6, 0, 10),
(1304, 0, 20, 6, 0, 4),
(1305, 1145, 31, 6, 529, 17),
(1306, 0, 26, 6, 0, 18),
(1307, 2, 19, 6, 2, 11),
(1308, 0, 18, 6, 0, 7),
(1309, 273132, 1, 6, 137362, 12),
(1310, 6266, 42, 6, 2917, 3),
(1311, 0, 24, 6, 0, 3),
(1312, 0, 19, 6, 0, 7),
(1313, 0, 21, 6, 0, 4),
(1314, 0, 27, 6, 0, 18),
(1315, 966, 32, 6, 447, 17),
(1316, 8, 20, 6, 2, 11),
(1317, 0, 22, 6, 0, 4),
(1318, 0, 28, 6, 0, 18),
(1319, 0, 25, 6, 0, 3),
(1320, 4167, 2, 6, 2385, 12),
(1321, 0, 33, 6, 0, 17),
(1322, 0, 29, 6, 0, 18),
(1323, 47185, 43, 6, 23312, 3),
(1324, 29785, 41, 6, 14628, 5),
(1325, 0, 34, 6, 0, 17),
(1326, 0, 30, 6, 0, 18),
(1327, 0, 35, 6, 0, 17),
(1328, 0, 23, 6, 0, 4),
(1329, 0, 31, 6, 0, 18),
(1330, 31151, 42, 6, 1920, 5),
(1331, 105, 21, 6, 57, 11),
(1332, 69532, 3, 6, 35804, 12),
(1333, 0, 36, 6, 0, 17),
(1334, NULL, 32, 6, NULL, 18),
(1335, 0, 24, 6, 0, 4),
(1336, 0, 37, 6, 0, 17),
(1337, 0, 20, 6, 0, 10),
(1338, 31, 23, 6, 15, 11),
(1339, 2793, 43, 6, 1428, 5),
(1340, 3864, 44, 6, 1861, 3),
(1341, 0, 33, 6, 0, 18),
(1342, 0, 38, 6, 0, 17),
(1343, 0, 21, 6, 0, 10),
(1344, 3538, 7, 6, 1647, 12),
(1345, 80335, 41, 6, 39818, 7),
(1346, 274, 44, 6, 182, 5),
(1347, 0, 39, 6, 0, 17),
(1348, 746977, 1, 6, 381869, 1),
(1349, 0, 34, 6, 0, 18),
(1350, 7353, 45, 6, 3744, 3),
(1351, 0, 40, 6, 0, 17),
(1352, 0, 35, 6, 0, 18),
(1353, 0, 25, 6, 0, 4),
(1354, 3449, 42, 6, 1794, 7),
(1355, 0, 22, 6, 0, 10),
(1356, 13951, 45, 6, 6905, 5),
(1357, 0, 41, 6, 0, 17),
(1358, 0, 36, 6, 0, 18),
(1359, 455, 46, 6, 214, 3),
(1360, 0, 42, 6, 0, 17),
(1361, 0, 37, 6, 0, 18),
(1362, 0, 43, 6, 0, 17),
(1363, 0, 38, 6, 0, 18),
(1364, 53359, 19, 6, 26751, 12),
(1365, 8218, 2, 6, 4728, 1),
(1366, 0, 44, 6, 0, 17),
(1367, 0, 39, 6, 0, 18),
(1368, 4729, 23, 6, NULL, 10),
(1369, 40, 49, 6, 19, 7),
(1370, 0, 40, 6, 0, 18),
(1371, 645, 3, 6, 321, 1),
(1372, 0, 45, 6, 0, 17),
(1373, 10610, 20, 6, 5344, 12),
(1374, 52328, 41, 6, 25779, 18),
(1375, 14192, 23, 6, 6241, 16),
(1376, 0, 46, 6, 0, 17),
(1377, 1454, 49, 6, 757, 3),
(1378, 0, 24, 6, 0, 10),
(1379, 0, 47, 6, 0, 17),
(1380, NULL, 25, 6, NULL, 16),
(1381, 517, 4, 6, 241, 1),
(1382, 0, 48, 6, 0, 17),
(1383, 1892, 42, 6, 898, 18),
(1384, 0, 49, 6, 0, 17),
(1385, 0, 43, 6, 0, 18),
(1386, NULL, 21, 6, NULL, 16),
(1387, 0, 25, 6, 0, 10),
(1388, 0, 44, 6, 0, 18),
(1389, 4819, 5, 6, 3017, 1),
(1390, 2111, 38, 6, 1101, 12),
(1391, 0, 45, 6, 0, 18),
(1392, 3, 6, 6, 1, 1),
(1393, 0, 46, 6, 0, 18),
(1394, 14, 28, 6, 7, 11),
(1395, 3, 7, 6, 1, 1),
(1396, 679, 40, 6, 343, 12),
(1397, 0, 47, 6, 0, 18),
(1398, 0, 48, 6, 0, 18),
(1399, 3082, 8, 6, 1691, 1),
(1400, 0, 49, 6, 0, 18),
(1401, 403, 41, 6, 213, 12),
(1402, 129, 32, 6, 66, 11),
(1403, 6653, 9, 6, 3393, 1),
(1404, 2, 10, 6, 0, 1),
(1405, 4886, 37, 6, 2530, 11),
(1406, 2, 11, 6, 0, 1),
(1407, 16, 12, 6, 12, 1),
(1408, 3, 13, 6, 0, 1),
(1409, 1258, 40, 6, 747, 11),
(1410, 11, 14, 6, 4, 1),
(1411, 0, 15, 6, 0, 1),
(1412, 0, 16, 6, 0, 1),
(1413, 51341, 41, 6, 25430, 11),
(1414, 0, 17, 6, 0, 1),
(1415, 5, 18, 6, 1, 1),
(1416, 154, 43, 6, 85, 11),
(1417, 0, 19, 6, 0, 1),
(1418, 77, 44, 6, 39, 11),
(1419, 1, 20, 6, 1, 1),
(1420, 1, 21, 6, 0, 1),
(1421, 0, 26, 6, 0, 10),
(1422, 0, 27, 6, 0, 10),
(1423, 0, 28, 6, 0, 10),
(1424, 0, 29, 6, 0, 10),
(1425, 0, 30, 6, 0, 10),
(1426, 0, 31, 6, 0, 10),
(1427, 0, 32, 6, 0, 10),
(1428, 0, 33, 6, 0, 10),
(1429, 0, 34, 6, 0, 10),
(1430, 0, 35, 6, 0, 10),
(1431, 0, 36, 6, 0, 10),
(1432, 0, 37, 6, 0, 10),
(1433, 0, 38, 6, 0, 10),
(1434, 0, 39, 6, 0, 10),
(1435, 3, 22, 6, 0, 1),
(1436, 0, 40, 6, 0, 10),
(1437, 3, 23, 6, 0, 1),
(1438, 3, 24, 6, 0, 1),
(1439, 0, 41, 6, 0, 10),
(1440, 3, 25, 6, 1, 1),
(1441, 0, 42, 6, 0, 10),
(1442, 0, 26, 6, 0, 1),
(1443, 2, 27, 6, 0, 1),
(1444, 0, 43, 6, 0, 10),
(1445, 15, 28, 6, 5, 1),
(1446, 0, 44, 6, 0, 10),
(1447, 0, 45, 6, 0, 10),
(1448, 235292, 1, 6, 119689, 14),
(1449, 0, 46, 6, 0, 10),
(1450, 6332, 3, 6, 3260, 14),
(1451, 0, 47, 6, 0, 10),
(1452, 58048, 18, 6, 30564, 14),
(1453, 0, 48, 6, 0, 10),
(1454, 9186, 21, 6, 4512, 14),
(1455, 0, 49, 6, 0, 10),
(1456, 26262, 23, 6, 14804, 14),
(1457, 1492, 26, 6, 767, 14),
(1458, 870, 27, 6, 333, 14),
(1459, 13146, 29, 6, 2859, 14),
(1460, 30655, 32, 6, 15337, 14),
(1461, 22424, 35, 6, 11362, 14),
(1462, 0, 29, 6, 0, 1),
(1463, 0, 30, 6, 0, 1),
(1464, 12, 31, 6, 5, 1),
(1465, 1, 32, 6, 0, 1),
(1466, 3, 33, 6, 1, 1),
(1467, 0, 34, 6, 0, 1),
(1468, 2, 35, 6, 0, 1),
(1469, NULL, 36, 6, 0, 1),
(1470, 0, 37, 6, 0, 1),
(1471, 0, 38, 6, 0, 1),
(1472, 0, 39, 6, 0, 1),
(1473, 1, 40, 6, 0, 1),
(1474, 19435, 41, 6, 9503, 1),
(1475, 703, 42, 6, 362, 1),
(1476, 11, 43, 6, 5, 1),
(1477, 929, 44, 6, 449, 1),
(1478, 0, 45, 6, 0, 1),
(1479, NULL, 47, 6, 0, 1),
(1480, 0, 48, 6, 0, 1),
(1481, 29, 49, 6, 14, 1),
(1482, 0, 46, 6, 0, 1),
(1483, NULL, 1, 6, NULL, 16),
(1484, 8574, 34, 6, 4227, 16),
(1485, 9214, 32, 6, 1475, 16),
(1486, NULL, 22, 6, NULL, 16),
(1487, 1985, 27, 6, 1019, 16),
(1488, 7017, 36, 6, 3464, 16),
(1489, 583, 26, 6, 300, 16),
(1490, 210, 28, 6, 78, 16),
(1491, NULL, 4, 6, NULL, 16),
(1492, 8, 5, 6, 3, 16),
(1493, 10, 30, 6, 6, 16),
(1494, 7, 41, 6, 3, 16),
(1495, 5, 42, 6, 2, 16),
(1496, NULL, 15, 6, NULL, 2),
(1497, 3705, 41, 6, 1766, 2),
(1498, 6728, 42, 6, 3159, 2),
(1499, 28910, 44, 6, 14352, 2),
(1500, 59920, 43, 6, 32744, 2),
(1501, 2590, 46, 6, 1251, 2),
(1502, 1464, 47, 6, 718, 2),
(1503, 1522, 48, 6, 757, 2),
(1504, 6086, 49, 6, 2781, 2),
(1505, 4636, 1, 7, 2316, 3),
(1506, 18497, 2, 7, 9197, 3),
(1507, 21678, 4, 7, 10727, 3),
(1508, 5154, 5, 7, 2252, 3),
(1509, 992, 6, 7, 506, 3),
(1510, 2300, 8, 7, 1156, 3),
(1511, 44507, 9, 7, 22453, 3),
(1512, 709, 15, 7, 342, 3),
(1513, 5569, 16, 7, 2691, 3),
(1514, 1796, 17, 7, 825, 3),
(1515, 12954, 41, 7, 6283, 3),
(1516, 6068, 42, 7, 2988, 3),
(1517, 47583, 43, 7, 24723, 3),
(1518, 4120, 44, 7, 1983, 3),
(1519, 7525, 45, 7, 3702, 3),
(1520, 620, 46, 7, 294, 3),
(1521, 1854, 49, 7, 860, 3),
(1522, 3518, 3, 7, 2543, 16),
(1523, 697737, 1, 7, 352687, 16),
(1524, 37, 4, 7, 17, 16),
(1525, 8, 5, 7, 3, 16),
(1526, 759, 9, 7, 406, 16),
(1527, 1231, 18, 7, 1024, 16),
(1528, 583, 26, 7, 297, 16),
(1529, 1985, 27, 7, 1019, 16),
(1530, 210, 28, 7, 78, 16),
(1531, 2672, 29, 7, 1293, 16),
(1532, 10, 30, 7, 6, 16),
(1533, 10690, 32, 7, 9488, 16),
(1534, 8674, 34, 7, 4227, 16),
(1535, 7060, 36, 7, 3474, 16),
(1536, 7, 41, 7, 3, 16),
(1537, 41346, 21, 7, 21960, 16),
(1538, 664, 22, 7, 330, 16),
(1539, 14213, 23, 7, 6253, 16),
(1540, 3106, 25, 7, 1793, 16),
(1541, 276441, 1, 7, 139476, 12),
(1542, 3538, 7, 7, 1647, 12),
(1543, 53787, 19, 7, 26873, 12),
(1544, 69532, 3, 7, 35804, 12),
(1545, 403, 41, 7, 213, 12),
(1546, 2111, 38, 7, 1101, 12),
(1547, 4167, 2, 7, 2385, 12),
(1548, 679, 40, 7, 343, 12),
(1549, 10610, 20, 7, 5344, 12),
(1550, 746977, 1, 7, 381869, 1),
(1551, 8218, 2, 7, 4728, 1),
(1552, 645, 3, 7, 321, 1),
(1553, 517, 4, 7, 241, 1),
(1554, 4819, 5, 7, 3017, 1),
(1555, 3, 6, 7, 1, 1),
(1556, 3, 7, 7, 1, 1),
(1557, 3082, 8, 7, 1691, 1),
(1558, 6653, 9, 7, 3393, 1),
(1559, 2, 10, 7, 0, 1),
(1560, 2, 11, 7, 0, 1),
(1561, 16, 12, 7, 12, 1),
(1562, 3, 13, 7, 0, 1),
(1563, 11, 14, 7, 4, 1),
(1564, 0, 15, 7, 0, 1),
(1565, 0, 16, 7, 0, 1),
(1566, 0, 17, 7, 0, 1),
(1567, 5, 18, 7, 1, 1),
(1568, 0, 19, 7, 0, 1),
(1569, 4326, 1, 7, 2124, 2),
(1570, 8889, 2, 7, 4374, 2),
(1571, NULL, 3, 7, NULL, 2),
(1572, 15850, 4, 7, 3302, 2),
(1573, NULL, 5, 7, NULL, 2),
(1574, 3046, 6, 7, 1209, 2),
(1575, 1013, 8, 7, 579, 2),
(1576, NULL, 7, 7, NULL, 2),
(1577, 36231, 9, 7, 23177, 2),
(1578, 1307, 15, 7, 638, 2),
(1579, 6763, 41, 7, 3525, 2),
(1580, 16927, 42, 7, 4752, 2),
(1581, 28596, 44, 7, 19944, 2),
(1582, 59238, 43, 7, 25404, 2),
(1583, 14377, 49, 7, 8724, 2),
(1584, 2573, 46, 7, 115, 2),
(1585, 1414, 47, 7, 688, 2),
(1586, 1518, 48, 7, 23, 2),
(1587, 23538, 1, 7, 11104, 18),
(1588, 73, 2, 7, 27, 18),
(1589, 436, 8, 7, 217, 18),
(1590, 52329, 41, 7, 26248, 18),
(1591, 2065, 42, 7, 1079, 18),
(1592, 14561, 9, 7, 8108, 18),
(1593, 0, 10, 6, 0, 2),
(1594, 0, 11, 6, 0, 2),
(1595, 0, 12, 6, 0, 2),
(1596, 0, 13, 6, 0, 2),
(1597, 0, 14, 6, 0, 2),
(1598, 0, 16, 6, 0, 2),
(1599, 0, 17, 6, 0, 2),
(1600, 0, 18, 6, 0, 2),
(1601, 0, 19, 6, 0, 2),
(1602, 0, 20, 6, 0, 2),
(1603, 0, 21, 6, 0, 2),
(1604, 0, 22, 6, 0, 2),
(1605, 0, 23, 6, 0, 2),
(1606, 0, 24, 6, 0, 2),
(1607, 0, 25, 6, 0, 2),
(1608, 0, 3, 6, 0, 6),
(1609, 0, 6, 6, 0, 6),
(1610, 0, 7, 6, 0, 6),
(1611, 0, 8, 6, 0, 6),
(1612, 0, 10, 6, 0, 6),
(1613, 0, 11, 6, 0, 6),
(1614, 0, 12, 6, 0, 6),
(1615, 0, 14, 6, 0, 6),
(1616, 0, 16, 6, 0, 6),
(1617, 0, 15, 6, 0, 6),
(1618, 0, 17, 6, 0, 6),
(1619, 0, 18, 6, 0, 6),
(1620, 0, 20, 6, 0, 6),
(1621, 0, 19, 6, 0, 6),
(1622, 0, 21, 6, 0, 6),
(1623, 0, 22, 6, 0, 6),
(1624, 0, 23, 6, 0, 6),
(1625, 0, 24, 6, 0, 6),
(1626, 0, 25, 6, 0, 6),
(1627, 0, 20, 6, 0, 7),
(1628, 0, 21, 6, 0, 7),
(1629, 0, 22, 6, 0, 7),
(1630, 0, 24, 6, 0, 7),
(1631, 0, 25, 6, 0, 7),
(1632, 0, 3, 6, 0, 9),
(1633, 0, 4, 6, 0, 9),
(1634, 0, 5, 6, 0, 9),
(1635, 0, 6, 6, 0, 9),
(1636, 0, 7, 6, 0, 9),
(1637, 0, 10, 6, 0, 9),
(1638, 0, 11, 6, 0, 9),
(1639, 0, 8, 6, 0, 9),
(1640, 0, 13, 6, 0, 8),
(1641, 0, 15, 6, 0, 9),
(1642, 0, 16, 6, 0, 9),
(1643, 0, 17, 6, 0, 9),
(1644, 0, 18, 6, 0, 9),
(1645, 0, 19, 6, 0, 9),
(1646, 0, 20, 6, 0, 9),
(1647, 0, 13, 6, 0, 9),
(1648, 0, 21, 6, 0, 9),
(1649, 0, 22, 6, 0, 9),
(1650, 0, 23, 6, 0, 9),
(1651, 0, 24, 6, 0, 9),
(1652, 0, 25, 6, 0, 9),
(1653, 0, 2, 6, 0, 8),
(1654, 0, 6, 6, 0, 8),
(1655, 0, 7, 6, 0, 8),
(1656, 0, 8, 6, 0, 8),
(1657, 0, 11, 6, 0, 8),
(1658, 0, 12, 6, 0, 8),
(1659, 0, 14, 6, 0, 8),
(1660, 0, 15, 6, 0, 8),
(1661, 0, 16, 6, 0, 8),
(1662, 0, 17, 6, 0, 8),
(1663, 0, 18, 6, 0, 8),
(1664, 0, 19, 6, 0, 8),
(1665, 0, 20, 6, 0, 8),
(1666, 0, 21, 6, 0, 8),
(1667, 0, 23, 6, 0, 8),
(1668, 0, 24, 6, 0, 8),
(1669, 0, 25, 6, 0, 8),
(1670, 4883, 1, 8, 2398, 2),
(1671, 7871, 2, 8, 3891, 2),
(1672, 1186, 8, 8, 567, 2),
(1673, 17982, 4, 8, 9114, 2),
(1674, 3136, 6, 8, 1732, 2),
(1675, 37120, 9, 8, 18588, 2),
(1676, 1246, 15, 8, 621, 2),
(1677, 7054, 41, 8, 3410, 2),
(1678, 7866, 42, 8, 3740, 2),
(1679, 30025, 44, 8, 14994, 2),
(1680, 61082, 43, 8, 29882, 2),
(1681, 5767, 49, 8, 2712, 2),
(1682, 2633, 46, 8, 1240, 2),
(1683, 1370, 47, 8, 682, 2),
(1684, 1502, 48, 8, 730, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_explore`
--

CREATE TABLE `stat_explore` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_explore`
--

INSERT INTO `stat_explore` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2019-10-16 11:05:10', 1, 1, 1),
(3, '2018-05-14 06:27:19', 1, 12, 11),
(4, '2020-03-26 07:43:41', 1, 3, 17),
(5, '2019-10-21 05:53:11', 1, 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `stat_explore_detail`
--

CREATE TABLE `stat_explore_detail` (
  `id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `stat_explore_id` int(11) NOT NULL,
  `mark` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `hm` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_explore_detail`
--

INSERT INTO `stat_explore_detail` (`id`, `province_id`, `stat_explore_id`, `mark`, `point`, `hm`, `km`, `remark`) VALUES
(1, 1, 2, 0, 1, 0, 0, 'ວັດແທກ  GPS  ອາຊີ ປາຊິຟິກ'),
(2, 2, 2, 0, 1, 0, 3, 'ngd'),
(3, 3, 2, 0, 1, 0, NULL, 'ວັດແທກ  GPS ອາຊີ ປາຊິຟິກ'),
(4, 4, 2, 99, 88, 77, 66, 'ngd'),
(5, 5, 2, 1006, 860, 797, 630, 'jjoyij'),
(6, 7, 2, 11, 22, 33, 44, 'asdad'),
(7, 8, 2, 91, 81, 71, 61, 'xxx'),
(16, 1, 3, NULL, 1, 345, NULL, 'ສ້້າງແຜນທີ່ຂໍ້ມູນຈ່າວສານລະບົບ ດີຈີຕອນມາດຕາສ່ວນ 1: 2,000 ນະຄອນຫຼວງວຽງຈັນ'),
(17, 2, 3, NULL, NULL, 356, 356, 'ສ້າງ ແລະວັດແທກ ແຜນທີ່ ເມຶອງບຸນເໜືຶອ'),
(18, 3, 3, NULL, 1, NULL, NULL, 'ວັດແທກ GPS  ອາຊີປາຊີຟິກ'),
(19, 4, 3, 5, NULL, 388, NULL, 'ວັດແທກ ແລະ ສ້າງແຜນທີ່ມາດຕາສ່ວນ 1: 10,000​ເທດສະບານ ເມຶອງໄໍຊ'),
(20, 5, 3, NULL, 1, NULL, NULL, 'ວັດແທກ GPS  ອາຊີປາຊີຟິກ'),
(21, 6, 3, NULL, 28, NULL, NULL, NULL),
(23, 9, 3, NULL, 28, NULL, 209, 'ວັດແທກລະດັບສູງ GPS  ອາຊີປາຊີຟິກ'),
(24, 8, 3, NULL, NULL, 50, NULL, 'ເຂື່ອນໄຟຟ້ານ້ຳມັດ'),
(25, 10, 3, NULL, 7, 300, NULL, 'ສ້າງ ແລະ ວັດແທກ ແຜນທີ່ ຂໍ້ມູນຂ່າວສານ ພມູມາດ ມາດຕາສ່ວນ 1:​10,000 ເທດສະບານ ເມືອງວັງວຽງ'),
(26, 11, 3, 28, 28, NULL, NULL, 'ສ້າງ ແລະ ວັດແທກ  ຈູດຄວບຄຸມ ຂະໜາດກາງ'),
(27, 12, 3, 11, 11, 0, NULL, 'ສ້າງ ແລະວັດແທກ ຈຸດຄວບຄຸມ'),
(28, 13, 3, 10, 10, 600, NULL, 'ສ້າງ ແລະ ວັດແທກ GPS ຂະໜາດກາງ'),
(29, 14, 3, 17, 17, NULL, NULL, 'ສ້າງ ແລະ ວັດແທກລພະດົບສູງ ຂັ້ນII'),
(30, 15, 3, NULL, NULL, 435, NULL, 'lສ້າງ ແລະວັດແທກ ແຜນທີ ຂໍ້ມູນຂ່າວສານພູມສາດ ມາດຕາສ່ວນ 1:10,000 ເທດສະບານ ເມຶອງ ກະລຶມ'),
(31, 16, 3, NULL, NULL, 378, NULL, 'ສ້າງ ແລະ ວັດແທກ ແຜນທີ່ ມາດຕາສ່ວນ 1:​10,000​ນະຄອນ ປາກເຊ ແຂວງຈໍາປາສັກ'),
(32, 17, 3, NULL, NULL, 906, 906, 'ສ້າງ ແລະວັດແທກ ແຜນທີ່ ຂໍ້ມູນຂ່າວສານ ພູມສາດ ມາດຕາສ່ວນ 1:10,000 ເມຶອງສາມັກຄີໄຊເ ເມຶອງໄຊເສດຖາ ແລະ ເມຶອງສະໜາມໄຊ'),
(33, 18, 3, 0, 10, 288, 288, 'ວັດແທກລະດົບສູງ'),
(34, 7, 3, NULL, NULL, NULL, 300, 'ວັດແທກລະດັບສູງ'),
(35, 2, 4, 2, 1, 2, 2, NULL),
(36, 3, 5, NULL, NULL, NULL, NULL, NULL),
(37, 1, 5, 23, 56, 21, 23, 'ລອງ'),
(38, 2, 5, 11, 3, 12, 5, NULL),
(39, 13, 4, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_ministry`
--

CREATE TABLE `stat_govcoin_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govcoin_ministry`
--

INSERT INTO `stat_govcoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-02-12 01:49:09', 1, 1, 1),
(2, '2018-05-14 05:54:44', 1, 5, 12),
(4, '2019-10-23 04:03:49', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_ministry_detail`
--

CREATE TABLE `stat_govcoin_ministry_detail` (
  `id` int(11) NOT NULL,
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
  `remember_team` int(11) DEFAULT NULL,
  `remember_personal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govcoin_ministry_detail`
--

INSERT INTO `stat_govcoin_ministry_detail` (`id`, `stat_govcoin_ministry_id`, `ministry_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`, `remember_team`, `remember_personal`) VALUES
(1, 1, 1, 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, 'kk', NULL, NULL),
(2, 1, 2, 6, 743, 29, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 389, 12, NULL, NULL, NULL),
(3, 1, 3, 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL, NULL, NULL),
(4, 1, 25, 6, 743, 29, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 389, 12, NULL, NULL, NULL),
(5, 1, 39, 6, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(6, 1, 38, 6, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL),
(7, 1, 53, 6, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 8, NULL, NULL, NULL),
(8, 1, 29, 6, 43, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, 1, NULL, NULL, NULL),
(9, 1, 32, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, 30, 6, 168, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, 5, NULL, NULL, NULL),
(11, 1, 27, 6, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(12, 1, 28, 6, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(13, 1, 36, 6, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(14, 2, 3, 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL, NULL, NULL),
(15, 4, 25, 6, 143, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 246, 22, NULL, NULL, NULL),
(16, 4, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 4, 39, 6, 12, 4, 5, 1, 4, 2, 5, 1, 52, 2, 4, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_province`
--

CREATE TABLE `stat_govcoin_province` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govcoin_province`
--

INSERT INTO `stat_govcoin_province` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-02-14 07:15:10', 1, 1, 1),
(2, '2018-05-14 06:08:52', 1, 5, 12),
(3, '2019-05-21 09:35:36', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govcoin_province_detail`
--

CREATE TABLE `stat_govcoin_province_detail` (
  `id` int(11) NOT NULL,
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
  `stat_govcoin_province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govcoin_province_detail`
--

INSERT INTO `stat_govcoin_province_detail` (`id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`, `award_id`, `province_id`, `stat_govcoin_province_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 11, 1, 2, 3, 'asf', 2, 1, 1),
(2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 11, 22, 'oiuo', 3, 1, 1),
(3, 121, 142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 242, 109, '2015-2016', 6, 1, 1),
(4, 67, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 263, 9, NULL, 6, 2, 1),
(5, 107, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, 6, NULL, 6, 5, 1),
(6, 246, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 314, 28, NULL, 6, 3, 1),
(7, 11, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 41, NULL, 6, 4, 1),
(8, 436, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 811, 77, NULL, 6, 6, 1),
(9, 539, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 849, 59, NULL, 6, 7, 1),
(10, 33, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, 35, NULL, 6, 8, 1),
(11, 18, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 14, NULL, 6, 9, 1),
(12, 63, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 186, 56, NULL, 6, 10, 1),
(13, 38, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL, 6, 11, 1),
(14, 133, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 265, 5, NULL, 6, 18, 1),
(15, 133, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 329, 65, NULL, 6, 12, 1),
(16, 78, 20, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, 21, NULL, 6, 13, 1),
(17, 401, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 681, 77, NULL, 6, 14, 1),
(18, 249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 567, 6, NULL, 6, 16, 1),
(19, 21, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, 5, NULL, 6, 15, 1),
(20, 215, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 286, 32, NULL, 6, 17, 1),
(21, 121, 142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 242, 109, NULL, 6, 1, 2),
(22, 63, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 6, 17, 3),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 3),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 7, 3),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 3),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_goverment_unit`
--

CREATE TABLE `stat_goverment_unit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_goverment_unit`
--

INSERT INTO `stat_goverment_unit` (`id`, `user_id`, `last_update`, `saved`, `phiscal_year_id`) VALUES
(2, 1, '2018-03-15 05:58:38', 1, 1),
(4, 37, '2018-05-27 06:33:21', 1, 12),
(5, 7, '2018-10-12 09:54:51', 1, 3),
(6, 7, '2019-05-20 10:04:31', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_goverment_unit_detail`
--

CREATE TABLE `stat_goverment_unit_detail` (
  `id` int(11) NOT NULL,
  `department` int(11) DEFAULT NULL,
  `insitute` int(11) DEFAULT NULL,
  `center` int(11) DEFAULT NULL,
  `stat_goverment_unit_id` int(11) NOT NULL,
  `remark` text DEFAULT NULL,
  `office` int(11) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  `division` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_goverment_unit_detail`
--

INSERT INTO `stat_goverment_unit_detail` (`id`, `department`, `insitute`, `center`, `stat_goverment_unit_id`, `remark`, `office`, `ministry_id`, `division`) VALUES
(1, 11, 22, 33, 2, 'sss', NULL, 0, NULL),
(3, 32, 2, 3, 2, 'sags', NULL, 0, NULL),
(4, 2, 22, 4, 2, NULL, 1, 0, NULL),
(5, 1, 2, 3, 2, NULL, 3, 0, NULL),
(6, 12, 0, 1, 2, NULL, 1, 1, NULL),
(7, 16, 1, 1, 2, NULL, 1, 2, NULL),
(8, 11, 0, 1, 2, NULL, 1, 39, NULL),
(9, 7, 0, 1, 2, NULL, 1, 38, NULL),
(10, 16, 1, 1, 2, NULL, 1, 29, NULL),
(11, 9, 1, 1, 2, NULL, 1, 31, NULL),
(12, 13, 1, 1, 2, NULL, 1, 34, NULL),
(13, 17, 1, 1, 2, NULL, 1, 42, NULL),
(14, 18, 0, 2, 2, NULL, 1, 25, NULL),
(15, 10, 0, 2, 2, NULL, 1, 28, NULL),
(16, 20, 0, 2, 2, NULL, 1, 30, NULL),
(17, 8, 3, 1, 2, NULL, 1, 33, NULL),
(18, 10, 0, 3, 2, NULL, 1, 35, NULL),
(19, 16, 0, 1, 2, NULL, 1, 3, NULL),
(20, 13, 1, 1, 2, NULL, 1, 27, NULL),
(21, 10, 1, 1, 2, NULL, 1, 6, NULL),
(22, NULL, NULL, NULL, 2, 'ບໍ່ມີຂໍ້ມູນ', NULL, 54, NULL),
(23, NULL, NULL, NULL, 2, 'ບໍ່ມີຂໍ້ມູນ', NULL, 53, NULL),
(24, 10, NULL, NULL, 2, NULL, 1, 41, NULL),
(25, 10, 0, 0, 2, NULL, 1, 40, NULL),
(26, 10, 1, 1, 2, NULL, 1, 32, NULL),
(27, 16, 1, 1, 4, NULL, 1, 2, NULL),
(28, 11, 1, 0, 4, NULL, 1, 39, NULL),
(29, 7, 1, 0, 4, NULL, 1, 38, NULL),
(30, 16, 1, 1, 4, NULL, 1, 29, NULL),
(31, 12, 1, 0, 4, NULL, 1, 1, NULL),
(32, 12, 1, 1, 4, NULL, 1, 6, NULL),
(33, 9, 1, 1, 4, NULL, 1, 31, NULL),
(34, 13, 1, 1, 4, NULL, 1, 34, NULL),
(35, 18, 0, 2, 4, NULL, 1, 25, NULL),
(36, 10, 2, 0, 4, NULL, 1, 28, NULL),
(37, 20, 2, 0, 4, NULL, 1, 30, NULL),
(38, 8, 1, 3, 4, NULL, 1, 33, NULL),
(39, 10, 1, 1, 4, NULL, 1, 32, NULL),
(40, 10, 0, 3, 4, NULL, 1, 35, NULL),
(41, 16, 1, 0, 4, NULL, 1, 3, NULL),
(42, 10, 1, 1, 4, NULL, 1, 62, NULL),
(43, 10, 0, 0, 4, NULL, 1, 87, NULL),
(44, NULL, NULL, NULL, 4, 'ບໍ່ມີຂໍ້ມູນ', NULL, 54, NULL),
(45, NULL, NULL, NULL, 4, 'ບໍ່ມີຂໍ້ມູນ', NULL, 53, NULL),
(46, 7, 0, 0, 4, NULL, 1, 41, NULL),
(47, 5, 0, 0, 4, NULL, 1, 42, NULL),
(48, NULL, NULL, NULL, 5, 'ບໍ່ມີຂໍ້ມູນ', NULL, 53, NULL),
(49, NULL, NULL, NULL, 5, 'ບໍ່ມີຂໍ້ມູນ', NULL, 54, NULL),
(50, 16, 0, 0, 5, NULL, 1, 3, NULL),
(51, 11, 0, 0, 5, NULL, 1, 62, NULL),
(52, 12, 1, 1, 5, NULL, 1, 6, NULL),
(53, 11, 0, 0, 5, NULL, 1, 2, NULL),
(54, 10, 0, 1, 5, NULL, 1, 31, NULL),
(55, 20, 0, 0, 5, NULL, 1, 25, NULL),
(56, 22, 0, 0, 5, NULL, 1, 30, NULL),
(57, 11, 0, 0, 5, NULL, 1, 32, NULL),
(58, 10, 0, 0, 5, NULL, 1, 28, NULL),
(59, 13, 0, 0, 5, NULL, 1, 1, NULL),
(60, 16, 0, 0, 5, NULL, 1, 29, NULL),
(61, 11, 0, 0, 5, NULL, 1, 39, NULL),
(62, 13, 0, 0, 5, NULL, 1, 33, NULL),
(63, 11, 0, 0, 5, NULL, 1, 38, NULL),
(64, 13, 0, 0, 5, NULL, 1, 35, NULL),
(65, 15, 0, 0, 5, NULL, 1, 34, NULL),
(66, 8, NULL, NULL, 5, NULL, 0, 41, NULL),
(67, 9, 0, 0, 5, NULL, 1, 87, NULL),
(68, 17, 0, 0, 5, NULL, 1, 42, NULL),
(69, 4, NULL, NULL, 5, NULL, 1, 88, NULL),
(70, 9, NULL, NULL, 5, NULL, 1, 89, NULL),
(71, 15, 0, 0, 6, NULL, NULL, 2, NULL),
(72, 12, 0, 0, 6, NULL, 0, 39, NULL),
(73, 9, 0, 0, 6, NULL, 0, 38, NULL),
(74, 18, 0, 0, 6, NULL, 0, 29, NULL),
(75, 12, 1, 1, 6, NULL, 1, 6, NULL),
(76, 20, 0, 0, 6, NULL, 0, 1, NULL),
(77, 16, 0, 0, 6, NULL, 0, 31, NULL),
(78, 16, 0, 0, 6, NULL, 0, 34, NULL),
(79, 26, 0, 0, 6, NULL, 0, 25, NULL),
(80, 27, 0, 0, 6, NULL, 0, 28, NULL),
(81, 35, 0, 0, 6, NULL, 0, 30, NULL),
(82, 14, 0, 0, 6, NULL, 0, 33, NULL),
(83, 19, 0, 0, 6, NULL, 0, 32, NULL),
(84, 13, 0, 0, 6, NULL, 0, 35, NULL),
(85, 17, 0, 0, 6, NULL, 0, 3, NULL),
(86, 15, 0, 0, 6, NULL, 0, 62, NULL),
(87, NULL, NULL, NULL, 6, 'ບໍ່ມີຂໍ້ມູນ', NULL, 54, NULL),
(88, NULL, NULL, NULL, 6, 'ບໍ່ມີຂໍ້ມູນ', NULL, 53, NULL),
(89, 8, NULL, NULL, 6, NULL, 0, 41, NULL),
(90, 21, 0, 0, 6, NULL, 0, 42, NULL),
(91, 12, 0, 0, 6, NULL, 0, 87, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_ministry`
--

CREATE TABLE `stat_govoversea_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govoversea_ministry`
--

INSERT INTO `stat_govoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-16 15:13:00', 1, 1, 1),
(2, '2018-05-14 06:10:39', 1, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_ministry_detail`
--

CREATE TABLE `stat_govoversea_ministry_detail` (
  `id` int(11) NOT NULL,
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
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govoversea_ministry_detail`
--

INSERT INTO `stat_govoversea_ministry_detail` (`id`, `stat_govoversea_ministry_id`, `ministry_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES
(1, 1, 1, 2, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, '່່ຫສັເາ່'),
(2, 1, 2, 3, 11, 22, 33, 44, 55, 66, 77, 88, 99, 1, 2, 3, 'hj'),
(3, 2, 3, 6, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_province`
--

CREATE TABLE `stat_govoversea_province` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govoversea_province`
--

INSERT INTO `stat_govoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-14 07:22:27', 1, 1, 1),
(2, '2018-05-14 06:07:20', 1, 12, 5),
(3, '2019-05-31 05:18:07', 1, 2, 1),
(4, '2019-08-05 05:40:09', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_govoversea_province_detail`
--

CREATE TABLE `stat_govoversea_province_detail` (
  `id` int(11) NOT NULL,
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
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_govoversea_province_detail`
--

INSERT INTO `stat_govoversea_province_detail` (`id`, `stat_govoversea_province_id`, `province_id`, `award_id`, `labo_personal`, `labo_team`, `deve_personal`, `deve_team`, `memo_personal`, `memo_team`, `amer_personal`, `amer_team`, `fran_personal`, `fran_team`, `gove_personal`, `gove_team`, `remark`) VALUES
(1, 1, 1, 2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 99, 88, 'າາ'),
(2, 1, 2, 6, 6, 5, 5, 4, 3, 21, 8, 9, 0, 11, 22, 33, '7'),
(3, 1, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2015-5016'),
(4, 1, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '2015-2016'),
(5, 1, 16, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2015-2016'),
(6, 1, 11, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2015-2016'),
(7, 1, 10, 6, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2015-2016'),
(8, 1, 6, 6, NULL, NULL, NULL, NULL, 4, 6, NULL, NULL, NULL, NULL, 3, NULL, '2015-2016'),
(9, 2, 6, 6, NULL, NULL, NULL, NULL, 4, 6, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(10, 3, 4, 3, 4, 3, 1, 1, 3, 1, 3, 1, 2, 1, 1, NULL, NULL),
(11, 4, 1, 6, 4, NULL, NULL, 7, NULL, NULL, NULL, 7, NULL, 7, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_foreigner`
--

CREATE TABLE `stat_highcoin_foreigner` (
  `id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_foreigner_detail`
--

CREATE TABLE `stat_highcoin_foreigner_detail` (
  `id` int(11) NOT NULL,
  `national_personal` int(11) DEFAULT NULL,
  `national_group` int(11) DEFAULT NULL,
  `million_personal` int(11) DEFAULT NULL,
  `million_group` int(11) DEFAULT NULL,
  `hornor_personal` int(11) DEFAULT NULL,
  `hornor_group` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `stat_highcoin_foreigner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_ministry`
--

CREATE TABLE `stat_highcoin_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_highcoin_ministry`
--

INSERT INTO `stat_highcoin_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(5, '2018-05-14 05:20:00', 1, 1, 1),
(21, '2018-05-14 05:31:31', 1, 12, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highcoin_ministry_detail`
--

CREATE TABLE `stat_highcoin_ministry_detail` (
  `id` int(11) NOT NULL,
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
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_highcoin_ministry_detail`
--

INSERT INTO `stat_highcoin_ministry_detail` (`id`, `gold_personal`, `gold_team`, `hero_personal`, `hero_team`, `knight_personal`, `knight_team`, `labor_personal`, `labor_team`, `dev_personal`, `dev_team`, `remark`, `stat_highcoin_ministry_id`, `award_id`, `ministry_id`) VALUES
(1, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, '', 5, 2, 1),
(2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, '', 5, 2, 2),
(5, 5, 4, 3, 2, 1, 0, 9, 8, 7, 6, '5', 5, 3, 1),
(6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 1),
(7, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '', 5, 1, 3),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 5, 3, 39),
(10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 25),
(11, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 21, 1, 3),
(12, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 2, 25),
(13, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 21, 3, 39),
(14, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 21, 4, 53);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highoversea_ministry`
--

CREATE TABLE `stat_highoversea_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_highoversea_ministry`
--

INSERT INTO `stat_highoversea_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-03-05 17:17:49', 1, 1, 1),
(12, '2018-05-14 05:59:55', 1, 12, 5),
(13, '2019-11-19 09:50:07', 1, 2, 1),
(14, '2019-10-23 04:06:19', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_highoversea_ministry_detail`
--

CREATE TABLE `stat_highoversea_ministry_detail` (
  `id` int(11) NOT NULL,
  `stat_highoversea_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL,
  `gold_personal` int(11) DEFAULT NULL,
  `gold_team` int(11) DEFAULT NULL,
  `lanx_personal` int(11) DEFAULT NULL,
  `lanx_team` int(11) DEFAULT NULL,
  `hono_personal` int(11) DEFAULT NULL,
  `hono_team` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_highoversea_ministry_detail`
--

INSERT INTO `stat_highoversea_ministry_detail` (`id`, `stat_highoversea_ministry_id`, `ministry_id`, `award_id`, `gold_personal`, `gold_team`, `lanx_personal`, `lanx_team`, `hono_personal`, `hono_team`, `remark`) VALUES
(1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(2, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(3, 1, 3, 6, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(4, 12, 3, 6, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(5, 13, 62, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 14, 39, 1, 120, 1, 1, 2, 1, 2, NULL),
(7, 13, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_hornorcoin_province`
--

CREATE TABLE `stat_hornorcoin_province` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_hornorcoin_province`
--

INSERT INTO `stat_hornorcoin_province` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES
(1, 1, 1, '2020-01-27 12:18:19', 1),
(2, 5, 12, '2018-05-14 05:50:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_hornorcoin_province_detail`
--

CREATE TABLE `stat_hornorcoin_province_detail` (
  `id` int(11) NOT NULL,
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
  `stat_hornorcoin_province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_hornorcoin_province_detail`
--

INSERT INTO `stat_hornorcoin_province_detail` (`id`, `hero_personal`, `hero_team`, `knight_personal`, `knight_team`, `labor_personal`, `labor_team`, `dev_personal`, `dev_team`, `remark`, `province_id`, `award_id`, `stat_hornorcoin_province_id`) VALUES
(1, 9, 8, 7, 6, 5, 4, 3, 2, 'afsdf', 1, 2, 1),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 3, 1),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 4, 1),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 3, 6, 1),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 3, 5, 1),
(6, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, 4, 5, 1),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 6, 5, 1),
(8, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 8, 5, 1),
(9, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, 13, 5, 1),
(10, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 3, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_meeting`
--

CREATE TABLE `stat_institute_meeting` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_institute_meeting`
--

INSERT INTO `stat_institute_meeting` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-05-14 04:49:22', 1, 1, 1),
(2, '2019-05-31 05:10:49', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_meeting_detail`
--

CREATE TABLE `stat_institute_meeting_detail` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `stat_institute_meeting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_institute_meeting_detail`
--

INSERT INTO `stat_institute_meeting_detail` (`id`, `title`, `total`, `women`, `start_date`, `end_date`, `times`, `place`, `stat_institute_meeting_id`) VALUES
(1, 'ຫຼັກສູດການວາງແຜນງົບປະມານ ແລະ ການຄຸ້ມຄອງການເງິນ', 30, 3, '2016-02-22 00:00:00', '2016-02-26 00:00:00', 1, 'ວັງວຽງ', 1),
(4, 'ຫຼັກສູດການວາງແຜນງົບປະມານ ແລະ ການຄຸ້ມຄອງການເງິນ', 30, 5, '1970-01-01 00:00:00', '2016-02-05 00:00:00', 1, 'ຄຳມ່ວນ', 1),
(5, 'ຫຼັກສູດການບໍລິຫານທົ່ວໄປ', 30, 2, '2016-02-08 00:00:00', '2016-02-12 00:00:00', 1, 'ຈຳປາສັກ', 1),
(6, 'ຫຼັກສູດການເປັນຄູ່ຝຶກທີ່ດີ (TOT)', 23, 7, '2016-03-13 00:00:00', '2016-03-18 00:00:00', 1, 'ທ່າລາດ', 1),
(7, 'ຫຼັກສູດການບໍລິຫານທົ່ວໄປ', 26, 11, '2016-03-28 00:00:00', '2016-04-01 00:00:00', 1, 'ສວປຝ', 1),
(9, 'ຫຼັກສູດການບໍລິຫານທົ່ວໄປ', 69, 6, '2016-02-15 00:00:00', '2016-02-19 00:00:00', 1, 'ກະຊວງແຜນການ ແລະ ການລົງທຶນ', 1),
(10, 'ຫຼັກສູດການບໍລິຫານທົ່ວໄປ', 33, 7, '2016-04-04 00:00:00', '2016-04-08 00:00:00', 1, 'ໄຊຍະບູລີ', 1),
(11, 'ຫຼັກສູດການຮຽນຮູ້ຄວາມເປັນຜູ້ນຳ', 20, 8, '2016-05-30 00:00:00', '2016-06-02 00:00:00', 1, 'ເມືອງວັງວຽງ ແຂວງວຽງຈັນ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_train`
--

CREATE TABLE `stat_institute_train` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_institute_train`
--

INSERT INTO `stat_institute_train` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2018-02-09 08:01:53', 1, 1, 1),
(3, '2019-05-31 05:09:12', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_institute_train_detail`
--

CREATE TABLE `stat_institute_train_detail` (
  `id` int(11) NOT NULL,
  `stat_institute_train_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `cooperator` varchar(255) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_institute_train_detail`
--

INSERT INTO `stat_institute_train_detail` (`id`, `stat_institute_train_id`, `title`, `total`, `women`, `start_date`, `end_date`, `cooperator`, `times`, `place`) VALUES
(1, 2, 'ວຽກງານການສ້າງນິຕິກໍາໃຫ້ພະນັກງານ ກຊວງພາບໃນ', 24, 13, '2016-05-23 00:00:00', '2016-05-27 00:00:00', 'NGPAR', 1, 'ສວປຝ'),
(2, 2, 'ວຽກງານການສ້າງນິຕິກໍາໃຫ້ພະນັກງານ ກຊວງພາບໃນ ແລະ ກະຊວງອ້ອມຂ້າງ', 23, 11, '2016-08-26 00:00:00', '2016-08-30 00:00:00', 'NGPAR', 1, 'ສວປຝ'),
(3, 2, '', NULL, NULL, '1970-01-01 00:00:00', '1970-01-01 00:00:00', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `stat_interco`
--

CREATE TABLE `stat_interco` (
  `id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_interco_detail`
--

CREATE TABLE `stat_interco_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `stat_interco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_investment`
--

CREATE TABLE `stat_investment` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_investment`
--

INSERT INTO `stat_investment` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-01-06 16:40:48', 1, 1, 1),
(2, '2019-09-10 09:29:04', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_investment_detail`
--

CREATE TABLE `stat_investment_detail` (
  `id` int(11) NOT NULL,
  `stat_investment_id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `implement` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_investment_detail`
--

INSERT INTO `stat_investment_detail` (`id`, `stat_investment_id`, `place`, `description`, `implement`, `remark`, `project_id`, `deleted`) VALUES
(1, 1, 'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່', 'ຈັດຊື້ອຸປະກອນ ແລະ ສິ່ງພິມ', '2013-2015', 'ຈຳນວນ 1 ເຄື່ອງ', 1, 0),
(2, 1, 'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່', 'ຈັດຊື້ອຸປະກອນເຄື່ອງມືສຳຫຼວດ ເຄື່ອງຮັບສັນຍານດາວທຽມ 3 ຊຸດ, ກ້ອງເກັບລາຍລະອຽດພື້ນທີ່ 2 ຊຸດ ກະແຈບັນຊາ (key)', '2015-2017', 'ສຳລັບແຕ້ມແຜນທີ່ 1 ຊຸດ', 1, 0),
(3, 1, 'ເຂື່ອນໄຟຟ້ານໍ້າເປີນ ເມືອງ ຫົວເມືອງ ແຂວງ ຫົວພັນ', 'ສຳຫຼວດວັດແທກ ແລພ ຄຳນວນຄິດໄລ່', '8/9/2012', 'ຈຳນວນ 6 ຊຸດ', 2, 0),
(4, 1, 'ເຂື່ອນໄຟຟ້າພະລັງງານລົມ ເມືອງ ບົວລະພາ ແຂວງ ຄຳມ່ວນ', 'ສຳຫຼວດວັດແທກແຜນທີ່ພູມສັນຖານ ມາດຕາສ່ວນ 1:2.000', NULL, 'ແຜນທີ່ມາດຕາສ່ວນ 1:2000 = 24 ຮຕ', 2, 0),
(5, 1, 'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່', 'ແຜນທີ່ຂໍ້ມູນຂ່າວສານພູມສາດ ມາດຕາສ່ວນ 1:10.000 ເທດສະບານ ເມືອງ ປາກຊັນ ແລະ ເມືອງ ສາລະວັນ', '2014-2016', '12 ຊຸດ = 60 ແຜ່ນ', 3, 0),
(6, 1, 'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່', 'ກວດກາສ້ອມແປງ ແລະ ອອກໃບຢັ້ງຢືນອຸປະກອນເຄື່ອງມືສຳຫຼວດ', '2014-2016', '25 ເທື່ອຄັ້ງ', 4, 0),
(7, 1, 'ສູນສຳຫຼວດ ແລະ ວັດແທກແຜນທີ່', 'ສ້າງແຜນທີ່ຂໍ້ມູນຂ່າວສານພູມສາດ ລະບົບດິຈິຕອນ ມາດຕາສ່ວນ 1:20,000 ນະຄອນຫຼວງວຽງຈັນ', '2014-2017', '593 ແຜນນໍ້າເບີ = 460 ກິໂລຕາແມັດ', 5, 0),
(8, 2, 'ເທດ​ສະ​ບານ​ເມືຶອງ​ບຸນ​ເໜືອ ແຂວງ​ຜົ້ງ​ສາ​ລີ', '​ສ້າງ​ແຜນ​ທີ່​ຂໍ້​ມູນ​ຂາວ​ສານ​ພູມ​ສາດ​ມາດ​ຕາ​ສ່ວນ1:10000', '2018', 'ຍັງ​ລໍ​ຖ້າ​ງົບ​ປະ​ມານ', 1, 0),
(9, 2, 'ເທດສະບານ ເມືອງ ບູນເໜືອ ແຂວງຜົງສາລີ', 'ສ້າງແຜນທີ່ຂໍມູນຂ່າວສານພູມສາດ 10000', 'ປີ2018', 'ຍັງລໍຖ້າງົບປະມານ', 1, 0),
(10, 2, 'ເມືອງວັງວຽງ', 'ສ້າງແຜນພູມສາດ10000', 'ປີ 2018', NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_legal`
--

CREATE TABLE `stat_legal` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_legal`
--

INSERT INTO `stat_legal` (`id`, `last_update`, `user_id`, `phiscal_year_id`, `saved`) VALUES
(20, '2018-02-21 03:33:13', 1, 1, 1),
(21, '2018-05-14 04:52:35', 9, 12, 1),
(22, '2018-10-16 07:06:59', 7, 3, 1),
(24, '2019-05-20 10:24:41', 7, 2, 1),
(25, '2019-10-28 08:18:54', 17, 4, 1),
(26, '2019-10-28 08:23:22', 17, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_legal_detail`
--

CREATE TABLE `stat_legal_detail` (
  `id` int(11) NOT NULL,
  `new` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `improve` int(11) DEFAULT NULL,
  `publish` varchar(255) DEFAULT NULL,
  `stat_legal_id` int(11) NOT NULL,
  `legal_id` int(11) NOT NULL,
  `legal_name` text DEFAULT NULL,
  `legal_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_legal_detail`
--

INSERT INTO `stat_legal_detail` (`id`, `new`, `remark`, `improve`, `publish`, `stat_legal_id`, `legal_id`, `legal_name`, `legal_type_id`) VALUES
(1, 0, '', 1, 'ເລກທີ 68/ສພຊ,ລົງວັນທີ 14 ທັນວາ 2015', 20, 1, 'ກົດໝາຍວ່າດ້ວຍການປົກຄອງທ້ອງຖິ່ນ', 2),
(2, 1, '', 0, 'ເລກທີ 74/ສພຊ, ລົງວັນທີ 18 ທັນວາ 2015', 20, 2, 'ກົດໝາຍວ່າດ້ວຍພະນັກງານລັດຖະກອນ', 2),
(3, 0, '', 1, '', 20, 3, 'ດຳລັດວ່າດ້ວຍສະມາຄົມ', 1),
(4, 0, NULL, 1, '', 20, 4, 'ດຳລັດວ່າດ້ວຍມູນນິທິ', 1),
(5, 0, NULL, 1, NULL, 20, 5, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງກະຊວງພາຍໃນ', 1),
(6, 1, NULL, 0, NULL, 20, 6, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງອົງການປົກຄອງບ້ານ', 1),
(7, 1, 'ອີງຕາມການສະເໜີຂອງສະມາຊິກອາຊຽນ', 0, NULL, 20, 7, 'ດຳລັດວ່າດ້ວຍການອອກໃບອະນຸຍາດສຳລັບ ນັກສຳຫຼວດວັດແທກ', 1),
(8, 1, NULL, 0, NULL, 20, 8, 'ດຳລັດວ່າດ້ວຍການຝຶກອົບຮົມ ແລະ ພັດທະນາ ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(9, 1, NULL, 0, NULL, 20, 12, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງພະນັກງານລັດວິສາຫະກິດ', 1),
(10, 0, NULL, 1, NULL, 20, 15, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ນໍາໃຊ້ກາປະທັບ', 1),
(11, 1, NULL, 0, NULL, 20, 9, 'ດຳລັດວ່າດ້ວຍການປະເມີນຜົນພະນັກງານ-ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(12, 1, NULL, 0, NULL, 20, 10, 'ດຳລັດວ່າດ້ວຍລະບົບກົງຈັກການຈັດຕັ້ງ ຂອງອົງການບໍລິຫານແຫ່ງລັດ', 1),
(13, 1, NULL, 0, NULL, 20, 11, 'ດຳລັດວ່າດ້ວຍການວາງແຜນກຳນົດລັດຖະກອນ', 1),
(14, 0, '', 1, 'ເລກທີ 315/ລບ, ລົງວັນທີ 16 ສິງຫາ 2016', 20, 17, 'ດຳລັດວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ປົກປ້ອງການເຄື່ອນໄຫວສາສະໜາຢູ່ ສປປ ລາວ', 1),
(15, 0, NULL, 1, NULL, 20, 16, 'ດຳລັດວ່າດ້ວຍການເພີ່ມທະວີວຽກງານແຂ່ງຂັນ-ຍ້ອງຍໍ', 1),
(16, 1, NULL, 0, NULL, 20, 14, 'ດຳລັດວ່າດ້ວຍການກຳນົດຕຳແໜ່ງງານ', 1),
(17, 1, NULL, 0, NULL, 20, 13, 'ດຳລັດວ່າດ້ວຍຕຳແໜ່ງວິຊາການຂອງລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(18, 1, NULL, 1, 'ເລກທີ 23/ນຍ, ລົງວັນທີ 01 ຕຸລາ 2016', 20, 19, 'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ', 3),
(19, 1, NULL, 0, 'ເລກທີ 56/ນຍ, ລົງວັນທີ 17 ຕຸລາ 2015', 20, 18, 'ຄຳສັ່ງຂອງນາຍົກລັດຖະມົນນຕີ ວ່າດ້ວຍການຄຸ້ມຄອງ ແລະ ແກ້ໄຂວຽກງານເຂດແດນເຊື່ອມຕໍ່ລະຫວ່າງນະຄອນຫຼວງວຽງຈັນ, ແຂວງກັບແຂວງ ທົ່ວປະເທດ', 3),
(20, 1, NULL, 0, NULL, 20, 20, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການມອບ-ໂອນບາງວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ໃຫ້ບັນດາກະຊວງ, ອົງການທຽບເທົ່າຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 4),
(21, 1, NULL, 0, NULL, 20, 21, 'ຂໍ້ຕົກລັງວ່າດ້ວຍການແບ່ງຄວາມຮັບຜິດຊອບວຽກງານຄຸ້ມຄອງພະນັກງານ-ລັດຖະກອນ ລະຫວ່າງຄະນະຈັດຕັ້ງແຂວງ ກັບພະແນກພາຍໃນແຂວງ ຫ້ອງການຈັດຕັ້ງເມືອງ, ເທດສະບານ ແລະ ນະຄອນ ກັບຫ້ອງການພາຍໃນເມືອງ, ເທດສະບານ ແລະ ນະຄອນ', 4),
(22, 0, NULL, 1, NULL, 20, 22, 'ຂໍ້ຕົກລົງວ່າດ້ວຍປະຕິບັດພັນທະ ແລະ ການປະກອບສ່ວນຂອງຊຸມຊົນໃນການພັດທະນາບ້ານ', 4),
(23, 1, NULL, 0, 'ເລກທີ 21/ນຍ, ລົງວັນທີ 21 ກໍລະກົດ 2016', 20, 24, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 4),
(24, 1, NULL, 0, 'ເລກທີ 21/ນຍ, ລົງວັນທີ 11 ເມສາ 2016', 20, 23, ' ຂໍ້ຕົກລົງວ່າດວ້ຍການຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 4),
(25, 1, NULL, 0, 'ເລກທີ 83/ນຍ, ລົງວັນທີ 11 ເມສາ 2016', 20, 25, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການສືບຕໍ່ຊັບຊ້ອນບາງວຽກງານຂອງລັດຖະບານ', 4),
(26, 0, NULL, 1, NULL, 20, 26, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງບັນດາກົມ ທຽບເທົ່າ, ພະແນກພາຍໃນຂັ້ນແຂວງ ແລະ ຫ້ອງການພາຍໃນເມືອງ', 5),
(27, 0, NULL, 1, NULL, 20, 27, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການອອກເອກະສານທາງການຕອງອົງການປົກຄອງບ້ານ', 5),
(28, 0, NULL, 1, NULL, 20, 28, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການເກັບເງິນປະກອບສ່ວນພັດທະນາບ້ານຂອງປະຊາຊົນ', 5),
(29, 1, NULL, 0, NULL, 20, 29, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ຕົວໜັງສື ໃນການຮ່າງທຸລະກຳ (Font) ແລະເອກະສານຂອງກະຊວງພາຍໃນ', 5),
(30, 1, NULL, 0, 'ເລກທີ 368/ພນ, ລົງວັນທີ 22 ມີນາ 2016', 20, 30, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງແລະ ການເຄື່ອນໄຫວຂອງໜ່ວຍງານຈັດຕັ້ງໝາຍເຫດທາງລັດຖະການ ແລະ ການປະເພມີນຜົນກະທົບຂອງນນິຕິກຳ ຂອງກະຊວງພາຍໃນ', 5),
(31, 0, NULL, 1, NULL, 20, 31, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການຍົກຍ້າຍພົນລະເມືອງ', 5),
(32, 0, NULL, 1, NULL, 20, 32, 'ຂໍ້ຕົກລົງວ່າດ້ວຍການນໍາໃຊ້ເອກະສານກ່ຽວກັບວຽກງານທະບຽນຄອບຄົວ', 5),
(33, 1, NULL, 0, 'ເລກທີ 01/ພນ,ລົງວັນທີ 11 ກຸມພາ 2016', 20, 33, 'ຄຳແນະນຳ ກ່ຽວກັບການຈັດຕັ້ງປະຕິບັດ ຄຳສັ່ງຂອງລັດຖະມົນຕີ ສະບັບເລກທີ 56/ນຍ', 6),
(34, 1, NULL, 0, 'ເລກທີ 07/ພນ, ລົງວັນທີ 2 ສິງຫາ 2016', 20, 34, 'ຄຳແນະນຳກ່ຽວກັບການກວດຜ່ານບັນຊີຈຳນວນພົນຂອງພະນັກງານ-ລັດຖະກອນ', 6),
(35, 1, NULL, 0, NULL, 20, 35, 'ຄຳແນະນຳກ່ຽວກັບການຈັດຕັ້ງກົດໝາຍວ່າດ້ວຍພະນັກງານ-ລັດຖະກອນ', 6),
(36, 1, NULL, 0, NULL, 20, 36, 'ຄຳແນະນຳກ່ຽວກັບການສ້າງຕັ້ງເທດສະບານ ແລະ ນະຄອນ', 6),
(37, 1, NULL, 0, 'ເລກທີ 111/ພນ, ລົງວັນທີ 01 ສິງຫາ 2016', 20, 38, 'ແຈ້ງການກ່ຽວກັບລາຍງານ ສະພາບກັນປັບປຸງສັບຂ້ອນວຽກງານຂອງຂະແໜງການພາຍໃນ', 7),
(38, 1, NULL, 0, NULL, 20, 37, 'ແຈ້ງການກ່ຽວກັບການປ່ຽນແປງງວດໃນການຮັບບັນຈຸລັດຖະກອນ ແລະ ການຈັດຊັ້ນຂັ້ນເງິນເດືອນລັດຖະກອນ', 7),
(39, 0, NULL, 1, '2016', 21, 3, 'ດຳລັດວ່າດ້ວຍສະມາຄົມ', 1),
(40, 0, NULL, 0, 'ເລກທີ 202/ລບ, ລົງວັນທີ 30 ມິຖຸນາ 2017', 22, 39, 'ດຳລັດວ່າດ້ວຍຕໍາແໜ່ງວິຊາການຂອງລັດຖະກອນ', 1),
(41, 0, NULL, 1, 'ເລກທີ 203/ລບ, ລົງວັນທີ 04 ກໍລະກົດ 2017', 22, 40, 'ດຳລັດວ່າດ້ວຍຕຳແໜ່ງບໍລິຫານຂອງພະນັກງານ-ລັດຖະກອນ (ສະບັບປັບປຸງ)', 1),
(42, 0, NULL, 1, 'ເລກທີ 238/ລບ,ລົງວັນທີ 11 ສິງຫາ 2017', 22, 3, 'ດຳລັດວ່າດ້ວຍສະມາຄົມ', 1),
(43, 0, NULL, 0, 'ເລກທີ 294/ລບ, ລົງວັນທີ 04 ກັນຍາ 2017', 22, 8, 'ດຳລັດວ່າດ້ວຍການຝຶກອົບຮົມ ແລະ ພັດທະນາ ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(44, 0, NULL, 1, 'ເລກທີ 300/ລບ, ລົງວັນທີ 13 ກັນຍາ 2017', 22, 9, 'ດຳລັດວ່າດ້ວຍການປະເມີນຜົນພະນັກງານ-ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(45, 0, NULL, 0, 'ເລກທີ 386/ລບ, ລົງວັນທີ 15 ທັນວາ 2016', 22, 41, 'ດຳລັດວ່າດ້ວຍວັນພັກ', 1),
(46, 0, NULL, 0, 'ເລກທີ 125/ນຍ, ລົງວັນທີ 11 ເມສາ 2018', 22, 42, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງນະຄອນ', 1),
(47, 0, NULL, 0, 'ເລກທີ 177/ລບ, ລົງວັນທີ 07 ພຶດສະພາ 2018', 22, 43, 'ດຳລັດວ່າດ້ວຍການປະສານງານລະຫວ່າງບັນດາກະຊວງ, ອົງການລັດທຽບເທົ່າກະຊວງ, ແຂວງ, ນະຄອນຫຼວງກັບສຳນັກງານນາຍົກລັດຖະມົນຕີ', 1),
(48, 0, NULL, 0, 'ເລກທີ 03/ນຍ, ລົງວັນທີ 11 ກຸມພາ 2018', 22, 44, 'ຄຳສັ່ງວ່າດ້ວຍການປັບປຸງຄຸນນະພາບການເຄື່ອນໄຫວ ຂອງກົມຈັດຕັ້ງ ແລະ ການບັນຈຸລັດຖະກອນໃໝ່', 3),
(49, 0, NULL, 0, 'ເລກທີ 80/ນຍ, ລົງວັນທີ 24 ມັງກອນ 2017', 22, 45, 'ຂໍ້ຕົກລົງ ວ່າດ້ວຍການປະຕິບັດພັນທະ ແລະ ການປະກອບສ່ວນຂອງປະຊາຊົນໃນການພັດທະນາບ້ານ', 4),
(50, 0, NULL, 0, 'ສະບັບເລກທີ 02/ພນ, ລົງວັນທີ 08 ກຸມພາ 2018', 22, 46, 'ຄຳແນະນຳຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ກ່ຽວກັບການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຫ້ອງວ່າການຂັ້ນແຂວງ ແລະ ຂັ້ນເມືອງ', 6),
(51, 0, NULL, 0, 'ສະບັບເລກທີ 02/ພນ, ລົງວັນທີ 14 ກຸມພາ 2017', 22, 47, 'ຄຳແນະນຳ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ສະບັບເລກທີ 34/ນຍ, ລົງວັນທີ 23 ສິງຫາ 2016 ກ່ຽວກັບການຈັດຕັ້ງປະຕິບັດຄຳສັ່ງຂອງນາຍົກລັດຖະມົນຕີວ່າດ້ວຍທິດທາງ,​ເປົ້າໝາຍ ແລະ ມາດຕະການສ້າງແຂວງເປັນຫົວໜ່ວຍຍຸດທະສາດ, ສ້າງເມືອງເປັນໜ່ວຍເຂັ້ມແຂງຮອບດ້ານ, ສ້າງບ້ານເປັນຫົວໜ່ວຍພັດທະນາ', 6),
(52, 0, NULL, 0, 'ເລກທີ 01/ພນ, ລົງວັນທີ 18 ມັງກອນ 2017', 22, 48, 'ຄຳແນະນຳ ຂອງລັດຖະມົນຕີກະຊວງພາຍໃນ ກ່ຽວກັບການເກັບກຳສະຖິຕິພົນລະເມືອງ', 6),
(53, 0, NULL, 0, 'ເລກທີ 05/ພນ, ລົງວັນທີ 11 ຕຸລາ 2017', 22, 49, 'ຄຳແນະນຳການຈັດຕັ້ງປະຕິບັດດຳລັດວ່າດ້ວຍສະມາຄົມ', 6),
(54, 0, NULL, 0, 'ເລກທີ 26/ພນ, ລົງວັນທີ 28 ກຸມພາ 2017', 22, 50, 'ແຈ້ງການ ກ່ຽວກັບການກຳນົດກົງຈັກການຈັດຕັ້ງເຂົ້າໃນກົດໝາຍ ຫຼື ດຳລັດ', 8),
(55, 0, NULL, 0, 'ສະບັບເລກທີ 112/ພນ, ລົງວັນທີ 29 ສິງຫາ 2017', 22, 51, 'ແຈ້ງການກ່ຽວກັບ ການອອກຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງພະແນກ, ອົງການລັດທຽບເທົ່າພະແນກຂັ້ນແຂວງ ແລະ ຂໍ້ຕົກລົງວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຫ້ອງການ, ອົງການລັດທຽບເທົ່າຫ້ອງການຂັ້ນເມືອງ', 8),
(56, 0, NULL, 0, 'ສະບັບເລກທີ 56/ພນ, ລົງວັນທີ 04 ກໍລະກົດ 2018', 22, 53, 'ແຈ້ງການ ກ່ຽວກັບການສືບຕໍ່ຜັນຂະຫຍາຍຄຳສັ່ງຂອງນາຍົກລັດຖະມົນຕີ ວ່າດ້ວຍການປັບປຸງຄຸນນະພາບການເຄື່ອນໄຫວຂອງກົງຈັກການຈັດຕັ້ງ ແລະ ການບັນຈຸລັດຖະກອນໃໝ່', 8),
(57, 0, NULL, 0, 'ສະບັບເລກທີ 67/ພນ, ລົງວັນທີ 17 ກໍລະກົດ 2018', 22, 54, 'ແຈ້ງການກ່ຽວກັບ ການລາຍງານສະພາບການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງຂະແໜງການຕົນ', 8),
(58, 0, NULL, 0, 'ສະບັບເລກທີ 238/ລບ, ລົງວັນທີ 11 ສິງຫາ 2017', 24, 3, 'ດຳລັດວ່າດ້ວຍສະມາຄົມ', 1),
(59, 0, 'ສະບັບເລກທີ 97/ນຍ, ລົງວັນທີ 09 ມີນາ 2017', 0, NULL, 24, 5, 'ດຳລັດວ່າດ້ວຍການຈັດຕັ້ງ ແລະ ການເຄື່ອນໄຫວຂອງກະຊວງພາຍໃນ', 1),
(60, 0, NULL, 0, 'ສະບັບເລກທີ 294/ລບ, ລົງວັນທີ 04 ກັນຍາ 2017', 24, 8, 'ດຳລັດວ່າດ້ວຍການຝຶກອົບຮົມ ແລະ ພັດທະນາ ລັດຖະກອນແຫ່ງ ສປປ ລາວ', 1),
(61, 1, 'no 123/re', 0, 'not yet', 25, 50, 'ແຈ້ງການ ກ່ຽວກັບການກຳນົດກົງຈັກການຈັດຕັ້ງເຂົ້າໃນກົດໝາຍ ຫຼື ດຳລັດ', 8),
(62, 1, 'ເດ', 0, '25565', 25, 2, 'ກົດໝາຍວ່າດ້ວຍພະນັກງານລັດຖະກອນ', 2),
(63, 1, NULL, 0, '2019', 25, 41, 'ດຳລັດວ່າດ້ວຍວັນພັກ', 1),
(64, 1, NULL, 0, '250', 26, 1, 'ກົດໝາຍວ່າດ້ວຍການປົກຄອງທ້ອງຖິ່ນ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_local_admin`
--

CREATE TABLE `stat_local_admin` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_local_admin`
--

INSERT INTO `stat_local_admin` (`id`, `last_update`, `user_id`, `saved`, `phiscal_year_id`) VALUES
(8, '2018-06-11 08:23:25', 1, 1, 1),
(32, '2018-09-18 09:28:27', 10, 1, 12),
(33, '2018-06-21 11:32:49', 21, 1, 9),
(34, '2019-07-30 09:33:10', 28, 1, 2),
(35, '2019-10-30 02:48:26', 19, 1, 3),
(36, '2020-01-08 03:54:54', 36, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_local_admin_detail`
--

CREATE TABLE `stat_local_admin_detail` (
  `id` int(11) NOT NULL,
  `stat_local_admin_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `municipality_head_total` int(11) DEFAULT NULL,
  `municipality_head_women` int(11) DEFAULT NULL,
  `municipality_vice_total` int(11) DEFAULT NULL,
  `municipality_vice_women` int(11) DEFAULT NULL,
  `province_head_total` int(11) DEFAULT NULL,
  `province_head_women` int(11) DEFAULT NULL,
  `province_vice_total` int(11) DEFAULT NULL,
  `province_vice_women` int(11) DEFAULT NULL,
  `city_head_total` int(11) DEFAULT NULL,
  `city_head_women` int(11) DEFAULT NULL,
  `city_vice_total` int(11) DEFAULT NULL,
  `city_vice_women` int(11) DEFAULT NULL,
  `district_head_total` int(11) DEFAULT NULL,
  `district_head_women` int(11) DEFAULT NULL,
  `district_vice_total` int(11) DEFAULT NULL,
  `district_vice_women` int(11) DEFAULT NULL,
  `village_head_total` int(11) DEFAULT NULL,
  `village_head_women` int(11) DEFAULT NULL,
  `village_vice_total` int(11) DEFAULT NULL,
  `village_vice_women` int(11) DEFAULT NULL,
  `village_improved_five_unit` int(11) DEFAULT NULL,
  `village_not_improved_five_unit` int(11) DEFAULT NULL,
  `population_total` int(11) DEFAULT NULL,
  `population_women` int(11) DEFAULT NULL,
  `village` int(11) DEFAULT NULL,
  `family_total` int(11) DEFAULT NULL,
  `family_poor` int(11) DEFAULT NULL,
  `capital_head_total` int(11) DEFAULT NULL,
  `capital_head_women` int(11) DEFAULT NULL,
  `capital_vice_total` int(11) DEFAULT NULL,
  `capital_vice_women` int(11) DEFAULT NULL,
  `village_approved` int(11) DEFAULT NULL,
  `village_pending` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_local_admin_detail`
--

INSERT INTO `stat_local_admin_detail` (`id`, `stat_local_admin_id`, `province_id`, `municipality_head_total`, `municipality_head_women`, `municipality_vice_total`, `municipality_vice_women`, `province_head_total`, `province_head_women`, `province_vice_total`, `province_vice_women`, `city_head_total`, `city_head_women`, `city_vice_total`, `city_vice_women`, `district_head_total`, `district_head_women`, `district_vice_total`, `district_vice_women`, `village_head_total`, `village_head_women`, `village_vice_total`, `village_vice_women`, `village_improved_five_unit`, `village_not_improved_five_unit`, `population_total`, `population_women`, `village`, `family_total`, `family_poor`, `capital_head_total`, `capital_head_women`, `capital_vice_total`, `capital_vice_women`, `village_approved`, `village_pending`) VALUES
(1, 8, 1, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 9, 2, 25, 2, 481, 48, 1323, 251, NULL, NULL, 785148, 381326, 481, 142339, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 8, 13, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 15, 0, 31, 5, 1015, 12, 2413, 241, NULL, NULL, 960215, 486561, 1015, 269939, 11620, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, 14, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 8, 1, 15, 0, 582, 3, 1090, 53, NULL, NULL, 398461, 200573, 582, 85272, 5873, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 8, 4, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 13, 1, 471, 6, 1090, 29, NULL, NULL, 304472, 86767, 471, 63037, 17147, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 8, 3, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 5, 1, 14, 1, 366, 4, 97, 19, NULL, NULL, 175025, 86538, 366, 38756, 6351, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 8, 6, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 12, 0, 24, 0, 762, 11, 2391, 232, NULL, NULL, 431025, 212479, 762, 76009, 5333, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 8, 2, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 21, 3, 531, 6, 998, 56, NULL, NULL, 179766, 88090, 531, 39570, 10521, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 8, 5, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 5, 0, 10, 0, 262, 2, 634, 87, NULL, NULL, 173743, 151582, 262, 31210, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 8, 7, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 2, 21, 1, 718, 3, 1415, 51, NULL, NULL, 268557, 145600, 718, 41505, 10687, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 8, 8, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 11, 0, 24, 2, 428, 19, 1107, 146, NULL, NULL, 73592, 1852, 428, 357996, 187443, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 8, 9, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 14, 2, 474, 19, 1531, 276, NULL, NULL, 252995, 12374, 474, 46135, 905, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 8, 10, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 11, 1, 10, 0, 434, 25, 887, 126, NULL, NULL, 430754, 353374, 434, 84388, 1430, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 8, 11, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 7, 0, 16, 1, 296, 84, 659, 54, NULL, NULL, 277809, 135045, 296, 46964, 3081, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 8, 12, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 14, 0, 579, 10, 1197, 106, NULL, NULL, 391913, 199633, 579, 77368, 1954, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 8, 15, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 4, 0, 8, 0, 200, 9, 520, 252, NULL, NULL, 111375, 55666, 200, 20123, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 8, 18, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 5, NULL, 6, NULL, 96, 4, 194, 24, NULL, NULL, 83555, 40828, 96, 12821, 1864, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 8, 17, NULL, NULL, NULL, NULL, 1, NULL, 4, 1, NULL, NULL, NULL, NULL, 5, NULL, 9, 3, 147, 7, 444, 86, NULL, NULL, 142709, 69367147, 147, 26414, 5918, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 8, 16, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 10, NULL, 20, 2, 643, 14, 1879, 161, NULL, NULL, 672095, 339358, 643, 12624, 3773, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 32, 1, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 9, 2, 25, 2, 481, 48, 1323, 251, NULL, NULL, 785148, 381326, 481, 142339, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 32, 2, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 21, 3, 531, 6, 998, 56, NULL, NULL, 179766, 88090, 531, 39570, 10521, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 32, 3, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 5, 1, 14, 1, 366, 4, 97, 19, NULL, NULL, 175025, 86538, 366, 38765, 6351, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 32, 4, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 13, 1, 471, 6, 1090, 29, NULL, NULL, 304472, 86767, 471, 63037, 17147, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 32, 5, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 5, 0, 10, 0, 262, 2, 634, 87, NULL, NULL, 173743, 151582, 262, 31210, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 32, 6, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 12, 0, 24, 0, 762, 11, 2391, 232, NULL, NULL, 431025, 212479, 762, 76009, 5333, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 32, 7, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 2, 21, 1, 718, 3, 1415, 51, NULL, NULL, 268557, 145600, 718, 41505, 10687, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 32, 9, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 14, 2, 474, 19, 1531, 276, NULL, NULL, 252995, 123574, 474, 46135, 905, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 32, 8, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 11, 0, 14, 2, 474, 19, 1107, 146, NULL, NULL, 379191, 187727, 430, 357996, 187443, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 32, 10, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 11, 1, 10, 0, 434, 25, 887, 126, NULL, NULL, 430754, 353374, 434, 84388, 1430, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 32, 11, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 7, 0, 16, 1, 296, 84, 659, 54, NULL, NULL, 277809, 135045, 296, 46964, 3081, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 32, 12, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 14, 0, 579, 10, 1137, 106, NULL, NULL, 391913, 199633, 579, 77368, 1954, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 32, 13, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 15, 0, 31, 5, 1015, 12, 2413, 241, NULL, NULL, 960215, 486561, 1015, 269939, 11620, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 32, 14, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 8, 1, 15, 0, 582, 3, 1090, 53, NULL, NULL, 398461, 200573, 582, 85272, 5873, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 32, 15, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 4, 0, 8, 0, 200, 9, 520, 252, NULL, NULL, 111375, 55666, 200, 20123, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 32, 16, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 20, 2, 643, 14, 1879, 161, NULL, NULL, 672095, 339358, 643, 12624, 3739, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 32, 17, NULL, NULL, NULL, NULL, 1, 0, 4, 1, NULL, NULL, NULL, NULL, 5, 0, 9, 3, 147, 7, 444, 86, NULL, NULL, 142709, 69367, 147, 26414, 5918, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 32, 18, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 5, 0, 6, 0, 96, 4, 194, 24, NULL, NULL, 83555, 40828, 96, 12821, 1864, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 33, 1, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, 9, 2, 18, 5, 80, 10, 200, 50, NULL, NULL, 900000, 3000000, 300, 1000, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 33, 2, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 7, 2, 14, 5, 531, 6, 998, 56, NULL, NULL, 179766, 88090, 531, 39570, 10521, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 33, 3, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, 5, 1, 14, 1, 366, 4, 97, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 33, 4, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 7, NULL, 13, 1, 471, 6, 1090, 29, NULL, NULL, 304472, 86767, 471, 63037, 17147, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 33, 5, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, NULL, NULL, NULL, NULL, 5, NULL, 10, NULL, 262, 2, 634, 87, NULL, NULL, 173743, 151582, 262, 31210, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 33, 6, NULL, NULL, NULL, NULL, 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, 12, NULL, 24, NULL, 762, 11, 2391, 232, NULL, NULL, 431025, 212479, 762, 76009, 5333, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 33, 7, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 10, 2, 21, 1, 718, 3, 1415, 51, NULL, NULL, 268557, 145600, 718, 41505, 10687, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 33, 8, NULL, NULL, NULL, NULL, 1, NULL, 3, 1, NULL, NULL, NULL, NULL, 11, NULL, 24, 2, 428, 19, 1107, 146, NULL, NULL, 73592, 1852, 428, 357996, 187443, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 33, 9, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 33, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 444215, 210042, 504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 33, 11, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 7, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 270398, 133535, 313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 34, 10, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 11, 1, 10, 0, 434, 25, 887, 126, NULL, NULL, 430754, 353374, 434, 84388, 1430, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 34, 9, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 14, 2, 474, 19, 1531, 276, NULL, NULL, 252995, 123574, 474, 46135, 905, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 34, 15, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 4, 0, 8, 0, 200, 9, 520, 252, NULL, NULL, 111375, 55666, 200, 20123, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 34, 14, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 8, 1, 15, 0, 582, 3, 1090, 53, NULL, NULL, 398461, 200573, 582, 85272, 5873, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 34, 6, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 12, 0, 24, 0, 762, 11, 2391, 232, NULL, NULL, 431025, 212479, 762, 76009, 5333, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 34, 1, NULL, NULL, NULL, NULL, 1, 0, 4, 0, NULL, NULL, NULL, NULL, 9, 2, 25, 2, 481, 48, 1323, 251, NULL, NULL, 785148, 381326, 481, 142339, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 34, 17, NULL, NULL, NULL, NULL, 1, 0, 4, 1, NULL, NULL, NULL, NULL, 5, 0, 9, 3, 147, 7, 444, 86, NULL, NULL, 142709, 69367, 147, 26414, 5918, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 34, 5, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 5, 0, 10, 0, 262, 2, 634, 87, NULL, NULL, 173743, 151582, 262, 31210, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 34, 4, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 13, 1, 471, 6, 1090, 29, NULL, NULL, 304472, 86767, 471, 63037, 17147, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 34, 13, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 15, 0, 31, 5, 1015, 12, 2413, 241, NULL, NULL, 960215, 486561, 1015, 269939, 11620, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 34, 8, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 11, 0, 24, 2, 428, 19, 1107, 146, NULL, NULL, 73592, 1852, 428, 357996, 187443, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 34, 18, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 5, 0, 6, 0, 96, 4, 194, 24, NULL, NULL, 83555, 40828, 96, 12821, 1864, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 34, 3, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 5, 1, 14, 1, 366, 4, 97, 19, NULL, NULL, 175025, 86538, 366, 38765, 6351, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 34, 7, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 2, 21, 1, 718, 3, 1415, 51, NULL, NULL, 268557, 145600, 718, 41505, 10687, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 34, 11, NULL, NULL, NULL, NULL, 1, 0, 3, 1, NULL, NULL, NULL, NULL, 7, 0, 16, 1, 296, 84, 659, 54, NULL, NULL, 277809, 135045, 296, 46964, 3081, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 34, 2, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 21, 3, 531, 6, 998, 56, NULL, NULL, 179766, 88090, 531, 39570, 10521, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 34, 16, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 20, 2, 643, 14, 1879, 161, NULL, NULL, 672095, 339358, 643, 12624, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 34, 12, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 14, 0, 579, 10, 1197, 106, NULL, NULL, 391913, 199633, 579, 77368, 1954, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 35, 3, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 5, 1, 14, 1, 363, 4, 724, 52, NULL, NULL, 184092, 91159, NULL, 39894, 3136, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 35, 16, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 9, 0, 19, 2, 641, 9, 1831, 179, NULL, NULL, 708162, 356094, NULL, 167471, 600, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 35, 11, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 18, 1, 291, 13, 660, 70, NULL, NULL, 301080, 147450, 291, 54966, 1874, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 35, 1, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 9, 0, 26, 2, 481, 42, 1588, 366, NULL, NULL, 826807, 409961, NULL, 156994, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 35, 2, NULL, NULL, NULL, NULL, 1, 0, 3, 0, NULL, NULL, NULL, NULL, 7, 0, 21, 2, 518, 16, 1043, 81, NULL, NULL, 187838, 92660, 518, 41881, 8790, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 36, 18, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 5, 0, 11, 0, 88, 2, 191, 27, NULL, NULL, NULL, NULL, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 35, 12, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 10, 0, 19, 0, 572, 9, 1250, 144, NULL, NULL, 414510, 211343, 572, 91697, 1020, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 36, 2, NULL, NULL, NULL, NULL, 1, 0, 2, 0, NULL, NULL, NULL, NULL, 7, 0, 17, 3, 514, 19, 1110, 92, NULL, NULL, 190662, 94170, 514, 43427, 17645, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_create`
--

CREATE TABLE `stat_map_create` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_print`
--

CREATE TABLE `stat_map_print` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `paper` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_produce`
--

CREATE TABLE `stat_map_produce` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_map_produce`
--

INSERT INTO `stat_map_produce` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 20:58:17', 1, 1, 1),
(2, '2018-05-14 05:46:24', 1, 12, 11),
(3, '2019-11-19 08:49:45', 1, 2, 6),
(4, '2019-08-05 06:12:24', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_produce_detail`
--

CREATE TABLE `stat_map_produce_detail` (
  `id` int(11) NOT NULL,
  `stat_map_produce_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_map_produce_detail`
--

INSERT INTO `stat_map_produce_detail` (`id`, `stat_map_produce_id`, `activity`, `amount`, `remark`) VALUES
(2, 1, 'vvv', 1111, 'aaa'),
(3, 2, 'ແຜນທີ່ ທ່ອງທ່ຽວ', 5000, NULL),
(4, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/100,000', 16000, NULL),
(5, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/50,000', 172, 'ລະບົບຕົວເລກ (5 ແຂວງພາກໃຕ້)'),
(6, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/25,000', 42, 'ລະບົບຕົວເລກ (ແຂວງໄຊສົມບູນ)'),
(7, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/5,000', 85, 'ລະບົບຕົວເລກ (ສຳລັບຕົວເມືອງໃຫ່ຍ)'),
(8, 3, '1/50.000', 80000, '24 ກຸມພາ2017'),
(9, 4, 'ແຜນທີ່ 1\\50000', 80000, NULL),
(10, 3, 'ແຜນ​ທີ່​ປົກ​ຄອງ', 3000, '5/4/2017'),
(11, 3, 'ແຜນທີ່ປົກຄອງ', 3000, '5/4/2017');

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_service`
--

CREATE TABLE `stat_map_service` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_map_service`
--

INSERT INTO `stat_map_service` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2019-10-16 10:49:14', 1, 1, 1),
(2, '2018-05-22 07:40:35', 1, 11, 12),
(8, '2019-10-21 05:49:50', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_service_detail`
--

CREATE TABLE `stat_map_service_detail` (
  `id` int(11) NOT NULL,
  `stat_map_service_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_map_service_detail`
--

INSERT INTO `stat_map_service_detail` (`id`, `stat_map_service_id`, `activity`, `amount`, `km`, `point`, `remark`) VALUES
(2, 1, 'ແຜນທີ່ການປົກຄອງ', 14478, 0, 0, 'ໃຫ້ລ້າ 1496 ໃບ'),
(3, 1, 'ແຜນທີ່ ເສດຖະກິດ', 268, 0, 0, NULL),
(4, 1, 'ແຜນທີ່ ຕົວເມືອງ', 368, 0, 0, NULL),
(5, 1, 'ແຜນທີ່ ໂລກ', 1889, 0, 0, '410'),
(6, 1, 'ແຜນທີ່ ທ່ອງທ່ຽວ ທົ່ວປະເທດ', 52, 0, 0, '20'),
(7, 1, 'ແຜນທີ່ 3 ຊາດ', 529, 0, 0, NULL),
(8, 1, 'ແຜນທີ່ ນະຄອນຫຼວງວຽງຈັນ (ກຳແພງ)', 344, 0, 0, NULL),
(9, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/1.000.000', 27, 0, 0, NULL),
(10, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/500.000', 172, 0, 0, NULL),
(11, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/250.000', 18, 0, 0, NULL),
(12, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/200.000', 261, NULL, NULL, '46'),
(13, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/100.000', 5048, 0, 0, '272'),
(14, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/50.000', 1048, 0, 0, NULL),
(15, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/25.000', 271, 0, 0, NULL),
(16, 1, 'ແຜນທີ່ ພູມສັນຖານ 1/10.000', 163, 0, 0, NULL),
(17, 1, 'ຮູບຖ່າຍ ທາງອາກາດ', 0, 28812, 0, NULL),
(18, 1, 'GPS', 0, 0, 54, NULL),
(19, 1, 'ຈຸດລະດັບ Levelling', 0, 0, 34, ''),
(28, 2, 'ແຜນທີ່ການປົກຄອງ', 14478, NULL, NULL, 'ໃຫ້ລ້າ 1496 ໃບ'),
(29, 2, 'ແຜນທີ່ ເສດຖະກິດ', 268, NULL, NULL, NULL),
(30, 2, 'ແຜນທີ່ ຕົວເມືອງ', 368, NULL, NULL, NULL),
(31, 2, 'ແຜນທີ່ ໂລກ', 1889, NULL, NULL, '410'),
(32, 2, 'ແຜນທີ່ ທ່ອງທ່ຽວ', 52, NULL, NULL, '20'),
(33, 2, 'ແຜນທີ່ 3 ຊາດອິນດູຈີນ', 529, NULL, NULL, NULL),
(34, 2, 'ແຜນທີ່ ນະຄອນຫຼວງວຽງຈັນ', 344, NULL, NULL, NULL),
(35, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/1,000,000', 27, NULL, NULL, NULL),
(36, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/500,000', 172, NULL, NULL, NULL),
(37, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/250,000', 18, NULL, NULL, NULL),
(38, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/200,000', 261, NULL, NULL, '46'),
(39, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/100,000', 5048, NULL, NULL, '272'),
(40, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/50,000', 1048, NULL, NULL, NULL),
(41, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/25,000', 271, NULL, NULL, NULL),
(42, 2, 'ແຜນທີ່ ພູມສັນຖານ 1/10,000', 163, NULL, NULL, NULL),
(43, 2, 'ຮູບຖ່າຍທາງອາກາດ', NULL, 28812, NULL, NULL),
(44, 2, 'GPS', NULL, NULL, 54, NULL),
(45, 2, 'Levelling', NULL, NULL, 34, NULL),
(46, 8, 'TEST', 111, 111, 111, 'sadasdSADSDSADSA'),
(47, 8, 'TEST', 23, 32, 23, 'SDFDSFDSFDSFDSSADASDSAD'),
(48, 8, 'TEST', 444444, 4444444, 44444, 'SADSADSADSADSAD'),
(49, 8, 'TEST', 22, 0, 0, 'SADSADSADSA'),
(50, 8, 'Test 21.10.2019', 23, 123, 544, 'ລອງ');

-- --------------------------------------------------------

--
-- Table structure for table `stat_map_support`
--

CREATE TABLE `stat_map_support` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `ratio` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `hm` varchar(255) DEFAULT NULL,
  `km` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_ministry`
--

CREATE TABLE `stat_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_ministry_detail`
--

CREATE TABLE `stat_ministry_detail` (
  `id` int(11) NOT NULL,
  `stat_ministry_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_oda`
--

CREATE TABLE `stat_oda` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_oda`
--

INSERT INTO `stat_oda` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(3, '2018-03-05 17:51:08', 1, 1, 1),
(4, '2019-10-28 09:57:59', 1, 7, 3),
(5, '2019-10-22 05:50:10', 1, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_oda_detail`
--

CREATE TABLE `stat_oda_detail` (
  `id` int(11) NOT NULL,
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
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_oda_detail`
--

INSERT INTO `stat_oda_detail` (`id`, `stat_oda_id`, `code`, `name`, `start_year`, `end_year`, `amount`, `free`, `loan`, `organisation`, `receive`, `deleted`) VALUES
(1, 3, '', 'ໂຄງການສ້າງຄວາມເຂັ້ມແຂງ ໃຫ້ແກ່ອົງການບໍລິຫານລັດຂັ້ນທ້ອງຖິ່ນ ແລະ ການບໍລິການ (NGPAR SCSD)', 2012, 2016, 12568800, 1, 1, 'UNDP, UNCDF,SDC,ROK,GEF', 830515, 0),
(2, 3, 't3', '51251', 213, 1241, 3528, NULL, 1, 'aaa', 3623, 1),
(3, 3, 'dhs', 'dhsd', 234, 234, 456, NULL, 1, '4324', 435, 1),
(4, 3, '', 'ໂຄງການສ້າງຄວາມເຂັ້ມແຂງດ້ານຂອບວຽກນິຕິກຳ ເພື່ອການບໍລິຫານລັດທີ່ມີປະສິດທິພາບ  NGPAR SLIFEPA', 2014, 2019, 1428000, 1, 1, 'UNDP,EU', 692939, 0),
(5, 3, NULL, 'ໂຄງການສະໜັບສະໜູນກອງເລຂາແຜນງານປັບປຸງບູລະນະການປົກຄອງແຫ່ງຊາດ NGPAR NGPS', 2102, 2016, 1195000, 1, NULL, 'UNDP, SDC', 87068, 0),
(6, 3, NULL, 'ໂຄງການຄຸ້ມຄອງພື້ນຖານໂຄງລ່າງຂະໜາດນ້ອຍ ໃນຂົງເຂດຊົນນະບົດ ແລະ  ເພື່ອປັບຕົວກັບສະພາບການປ່ຽນແປງດີນຟ້າອາກາດໃນຂົງເຂດຊັບພະຍາກອນນ້ຳ', 2012, 2016, 2145000, 1, NULL, 'GEF', 982805, 0),
(7, 3, '0309-LAO', 'ໂຄງການສ້າງຄວາມອາດສາມາດໃນການບໍລິຫານ ແລະ ຄຸ້ມຄອງຂະແໜງການພາກລັດ ສປປ ລາວ', 2013, 2016, 6500000, 1, NULL, 'ADB', 284106, 0),
(8, 3, NULL, 'ໂຄງການສ້າງແຜນທີ່ ລະບົບດິຈິຕອນ ມາດຕາສ່ວນ 1/2000 ນະຄອນຫຼວງວຽງຈັນ (ໂຄງການຊ່ວຍເຫຼືອລ້າ)', 2015, 2017, 3500000, 1, NULL, 'KOICA ສ.ເກົາຫຼີ', 1200000, 0),
(9, 3, NULL, 'ສ້າງຖານຂໍ້ມູນຂ່າວສານ ພູມສັນຖານ ມາດຕາສ່ວນ 1:50000 ຮັບໃຊ້ການວາງແຜນພັດທະນາເສດຖະກິດ-ສັງຄົມ ແລະ ຕິດຕາມຊັບພະຍາກອນ ທຳມະຊາດ ແລະ ສິງແວດລ້ອມ ຢູ່ ສປປ ລາວ', 2014, 2016, 5664000, 1, NULL, 'ລັດຖະບານ ສສ ຫວຽດນາມ', 1332000, 0),
(10, 4, '4 135 18 0561', 'ໂຄງການສ້າງຂີດຄວາມສາມາດປັບປຸງບູລະນະການປົກຄອງ (GPAR GIDP)', 2017, 2021, 6050000, 1, NULL, 'UNDP, UN, CDF, SDC', NULL, 0),
(11, 4, '4 135 18 0531', 'ໂຄງການສ້າງຄວາມອາດສາມາດໃນການບໍລິຫານ ແລະ ຄຸ້ມຄອງຂະແໜງການຂອງລັດ (ADB)', 2012, 2018, 6050000, 1, NULL, 'ADB', NULL, 0),
(12, 4, '4 135 18 0541', 'ໂຄງການສ້າງສະຖານີຮັບສັນຍານການວັດແທກແບບຕໍ່ເນື່ອງ (CORS)', 2016, 2018, 2070000, 1, NULL, 'KOICA', NULL, 0),
(13, 4, NULL, 'ໂຄງການ ການມີສ່ວນຮ່ວມຂອງປະຊາຊົນຕໍ່ວຽກງານການປົກຄອງທີ່ດີ ແລະ ສ້າງລັດທີ່ປົກຄອງດ້ວຍກົດໝາຍ', 2017, 2020, 5500000, 1, NULL, 'EU, SWITZERLAND, GERMANY', NULL, 0),
(14, 4, '4 135 18 0571', 'ໂຄງການສ້າງມາດຕາສ່ວນໃຫຍ່ແຂວງສະຫວັນນະເຂດ', 2018, 2021, 5333333, 1, NULL, 'KOICA', NULL, 0),
(15, 5, NULL, 'ທຶນໂຄງການ ODA', NULL, NULL, 848462704, NULL, NULL, NULL, NULL, 0),
(16, 5, '1234', 'a', 2019, 2020, 10000000, 1, NULL, 'adb', 50000000, 1),
(17, 5, '999', 'ທົດລອງ', 2020, 2021, 52000000, 1, NULL, 'ທລ', 35000000, 0),
(18, 4, '0202', 'ໂຄງການ', 2019, 2020, 152565, 1, NULL, 'ີືີີun', 2155, 1),
(19, 4, '0202', 'ໂຄງການ', 2019, 2020, 152565, 1, NULL, 'ີືີີun', 2155, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer`
--

CREATE TABLE `stat_officer` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer`
--

INSERT INTO `stat_officer` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-09 07:17:02', 1, 1, 1),
(2, '2018-05-14 04:02:02', 1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_add`
--

CREATE TABLE `stat_officer_add` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_add`
--

INSERT INTO `stat_officer_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-09 07:31:32', 1, 1, 1),
(2, '2018-05-14 04:59:49', 1, 12, 2),
(3, '2019-05-27 05:17:37', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_add_detail`
--

CREATE TABLE `stat_officer_add_detail` (
  `id` int(11) NOT NULL,
  `quota_total` int(11) DEFAULT NULL,
  `quota_women` int(11) DEFAULT NULL,
  `army_total` int(11) DEFAULT NULL,
  `army_women` int(11) DEFAULT NULL,
  `soe_total` int(11) DEFAULT NULL,
  `soe_women` int(11) DEFAULT NULL,
  `stat_officer_add_id` int(11) NOT NULL,
  `move_total` int(11) DEFAULT NULL,
  `move_women` int(11) DEFAULT NULL,
  `need` int(11) DEFAULT NULL,
  `ministry_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_add_detail`
--

INSERT INTO `stat_officer_add_detail` (`id`, `quota_total`, `quota_women`, `army_total`, `army_women`, `soe_total`, `soe_women`, `stat_officer_add_id`, `move_total`, `move_women`, `need`, `ministry_group_id`) VALUES
(1, 3762, 1819, 32, 6, 61, 29, 1, NULL, NULL, NULL, 0),
(2, 8268, 4619, 72, 18, 24, 7, 2, NULL, NULL, NULL, 0),
(3, 6981, 3053, 18, 2, 20, 8, 3, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_age`
--

CREATE TABLE `stat_officer_age` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_age`
--

INSERT INTO `stat_officer_age` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2018-02-09 07:21:02', 1, 1, 1),
(3, '2018-06-21 10:58:28', 1, 2, 12),
(4, '2019-05-27 05:04:10', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_agelevel`
--

CREATE TABLE `stat_officer_agelevel` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_agelevel`
--

INSERT INTO `stat_officer_agelevel` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2018-03-14 09:33:14', 1, 1, 1),
(4, '2018-05-14 05:30:51', 1, 12, 8);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_agelevel_detail`
--

CREATE TABLE `stat_officer_agelevel_detail` (
  `id` int(11) NOT NULL,
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
  `women_60p` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_agelevel_detail`
--

INSERT INTO `stat_officer_agelevel_detail` (`id`, `stat_officer_agelevel_id`, `officer_level_id`, `total_18`, `women_18`, `total_20`, `women_20`, `total_25`, `women_25`, `total_30`, `women_30`, `total_35`, `women_35`, `total_40`, `women_40`, `total_45`, `women_45`, `total_50`, `women_50`, `total_55`, `women_55`, `total_60`, `women_60`, `total_60p`, `women_60p`) VALUES
(1, 3, 1, 0, 0, 0, 0, 36, 26, 181, 88, 78, 22, 59, 18, 20, 36, 17, 48, 14, 18, 0, 0, 0, NULL),
(2, 3, 2, 0, 0, 0, 0, 55, 33, 188, 96, 137, 57, 82, 22, 46, 18, 7, 36, 6, 26, 3, 4, 0, NULL),
(3, 3, 3, 0, 0, 0, 0, 198, 120, 837, 320, 308, 86, 114, 20, 6811, 1611, 16, 59, 9, 41, 0, 4, 0, NULL),
(4, 4, 1, 0, 0, 0, 0, 36, 26, 181, 88, 78, 22, 59, 18, 20, 7, 36, 17, 48, 14, 18, 0, 0, 0),
(5, 4, 2, 0, 0, 0, 0, 55, 33, 188, 96, 137, 57, 82, 22, 46, 18, 40, 7, 36, 6, 26, 3, 4, 0),
(6, 4, 3, 0, 0, 0, 0, 198, 120, 837, 320, 308, 86, 114, 20, 68, 16, 68, 16, 59, 9, 41, 0, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_age_detail`
--

CREATE TABLE `stat_officer_age_detail` (
  `id` int(11) NOT NULL,
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
  `organisation_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_age_detail`
--

INSERT INTO `stat_officer_age_detail` (`id`, `stat_officer_age_id`, `total_u25`, `women_u25`, `total_25_30`, `women_25_30`, `total_31_35`, `women_31_35`, `total_36_40`, `women_36_40`, `total_41_45`, `women_41_45`, `total_46_50`, `women_46_50`, `total_51_55`, `women_51_55`, `total_56_60`, `women_56_60`, `total_61u`, `women_61u`, `organisation_group_id`) VALUES
(2, 2, 14017, 9579, 54340, 29414, 36454, 15612, 20196, 7436, 16039, 6833, 19156, 8443, 14095, 4685, 6950, 766, 1226, 78, 0),
(3, 3, 18776, 12391, 51440, 26617, 32826, 13519, 17909, 6616, 17061, 7525, 18596, 7891, 13961, 4417, 6038, 619, 1219, 67, 0),
(4, 4, NULL, NULL, 50349, 28471, 41388, 18591, 22236, 8412, 15554, 6374, 17483, 8051, 15592, 5430, 6839, 697, 1165, 74, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_contract`
--

CREATE TABLE `stat_officer_contract` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_contract`
--

INSERT INTO `stat_officer_contract` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-02-09 07:36:11', 1, 1, 1),
(2, '2018-05-14 05:32:30', 1, 2, 12),
(3, '2019-05-27 05:15:33', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_contract_detail`
--

CREATE TABLE `stat_officer_contract_detail` (
  `id` int(11) NOT NULL,
  `stat_officer_contract_id` int(11) NOT NULL,
  `admin_approve_total` int(11) DEFAULT NULL,
  `admin_approve_women` int(11) DEFAULT NULL,
  `admin_non_total` int(11) DEFAULT NULL,
  `admin_non_women` int(11) DEFAULT NULL,
  `officer_approve_total` int(11) DEFAULT NULL,
  `officer_approve_women` int(11) DEFAULT NULL,
  `officer_non_total` int(11) DEFAULT NULL,
  `officer_non_women` int(11) DEFAULT NULL,
  `ministry_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_contract_detail`
--

INSERT INTO `stat_officer_contract_detail` (`id`, `stat_officer_contract_id`, `admin_approve_total`, `admin_approve_women`, `admin_non_total`, `admin_non_women`, `officer_approve_total`, `officer_approve_women`, `officer_non_total`, `officer_non_women`, `ministry_group_id`) VALUES
(1, 1, 128, 58, 564, 282, 264, 106, 3015, 1013, 0),
(2, 2, 163, 60, 311, 124, 576, 295, 2130, 710, 0),
(3, 3, 4850, 2413, 527, 242, 12491, 8798, 7983, 3039, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_degree`
--

CREATE TABLE `stat_officer_degree` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_degree`
--

INSERT INTO `stat_officer_degree` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-09 07:28:04', 1, 1, 1),
(2, '2018-05-14 04:32:04', 1, 12, 2),
(3, '2019-05-27 05:08:22', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_degree_detail`
--

CREATE TABLE `stat_officer_degree_detail` (
  `id` int(11) NOT NULL,
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
  `organisation_group_id` int(11) NOT NULL,
  `highschool_total` int(11) DEFAULT NULL,
  `highschool_women` int(11) DEFAULT NULL,
  `second_total` int(11) DEFAULT NULL,
  `second_women` int(11) DEFAULT NULL,
  `primary_total` int(11) DEFAULT NULL,
  `primary_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_degree_detail`
--

INSERT INTO `stat_officer_degree_detail` (`id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `no_total`, `no_women`, `stat_officer_degree_id`, `organisation_group_id`, `highschool_total`, `highschool_women`, `second_total`, `second_women`, `primary_total`, `primary_women`) VALUES
(1, 456, 75, 54, 13, 6256, 1557, 196, 60, 49768, 19910, 56167, 26631, 49167, 25476, 11181, 5343, 2762, 1108, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 461, 74, 73, 22, 6360, 1567, 114, 32, 47058, 18407, 52739, 24246, 53271, 27295, 14711, 7007, 3039, 1012, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 440, 62, 320, 127, 6941, 1658, 306, 122, 58562, 23721, 59319, 28778, 45255, 23949, 10194, 4874, NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_detail`
--

CREATE TABLE `stat_officer_detail` (
  `id` int(11) NOT NULL,
  `stat_officer_id` int(11) NOT NULL,
  `center_total` int(11) DEFAULT NULL,
  `province_total` int(11) DEFAULT NULL,
  `district_total` int(11) DEFAULT NULL,
  `center_women` int(11) DEFAULT NULL,
  `province_women` int(11) DEFAULT NULL,
  `district_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_detail`
--

INSERT INTO `stat_officer_detail` (`id`, `stat_officer_id`, `center_total`, `province_total`, `district_total`, `center_women`, `province_women`, `district_women`) VALUES
(1, 1, 30469, 34227, 117777, 12836, 14171, 55839),
(2, 2, 28975, 33635, 115216, 12040, 13822, 53800);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ethnic`
--

CREATE TABLE `stat_officer_ethnic` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ethnic`
--

INSERT INTO `stat_officer_ethnic` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(9, '2018-03-12 10:14:26', 1, 1, 1),
(10, '2018-05-14 09:16:14', 1, 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ethnic_detail`
--

CREATE TABLE `stat_officer_ethnic_detail` (
  `id` int(11) NOT NULL,
  `stat_officer_ethnic_id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `officer_level_id` int(11) NOT NULL,
  `ethnic_id` int(11) NOT NULL,
  `women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ethnic_detail`
--

INSERT INTO `stat_officer_ethnic_detail` (`id`, `stat_officer_ethnic_id`, `total`, `officer_level_id`, `ethnic_id`, `women`) VALUES
(1, 9, 454, 1, 1, 183),
(2, 9, 4, 1, 7, 1),
(3, 9, 1132, 3, 1, 425),
(4, 9, 85, 3, 2, 29),
(5, 9, 60, 3, 3, 17),
(6, 9, 82, 3, 4, 33),
(7, 9, 11, 3, 5, 3),
(8, 9, 4, 3, 6, 2),
(9, 9, 2, 3, 7, 0),
(10, 9, 9, 3, 8, 4),
(11, 9, 0, 1, 2, 0),
(12, 9, 1, 1, 3, 1),
(13, 9, 2, 1, 4, 2),
(14, 9, 4, 1, 9, 2),
(15, 9, 14, 1, 41, 4),
(16, 9, 1, 1, 43, 0),
(17, 9, 448, 2, 1, 186),
(18, 9, 8, 2, 2, 85),
(19, 9, 15, 2, 3, 5),
(20, 9, 3, 2, 5, 1),
(21, 9, 6, 2, 8, 3),
(22, 9, 32, 2, 9, 9),
(23, 9, 1, 2, 12, 1),
(24, 9, 0, 2, 13, 0),
(25, 9, 1, 2, 18, 0),
(26, 9, 7, 2, 22, 2),
(27, 9, 1, 2, 23, 0),
(28, 9, 3, 2, 28, 0),
(29, 9, 20, 2, 41, 4),
(30, 9, 6, 2, 43, 2),
(31, 9, 20, 2, 44, 8),
(32, 9, 2, 2, 49, 1),
(33, 9, 105, 3, 9, 35),
(34, 9, 1, 3, 12, 0),
(35, 9, 1, 3, 13, 0),
(36, 9, 4, 3, 16, 1),
(37, 9, 1, 3, 17, 0),
(38, 9, 10, 3, 18, 3),
(39, 9, 10, 3, 19, 1),
(40, 9, 1, 3, 20, 0),
(41, 9, 1, 3, 21, 0),
(42, 9, 10, 3, 22, 2),
(43, 9, 6, 3, 23, 1),
(44, 9, 3, 3, 24, 0),
(45, 9, 4, 3, 25, 2),
(46, 9, 2, 3, 26, 0),
(47, 9, 2, 3, 27, 0),
(48, 9, 5, 3, 28, 1),
(49, 9, 3, 3, 29, 0),
(50, 9, 1, 3, 30, 0),
(51, 9, 4, 3, 35, 1),
(52, 9, 1, 3, 37, 0),
(53, 9, 94, 3, 41, 11),
(54, 9, 1, 3, 42, 1),
(55, 9, 9, 3, 43, 0),
(56, 9, 32, 3, 44, 14),
(57, 9, 1, 3, 49, 1),
(58, 10, 454, 1, 1, 183),
(59, 10, 448, 2, 1, 186),
(60, 10, 1132, 3, 1, 425),
(61, 10, 0, 1, 2, 0),
(62, 10, 1, 1, 3, 1),
(63, 10, 2, 1, 4, 2),
(64, 10, 0, 1, 5, 0),
(65, 10, 0, 1, 6, 0),
(66, 10, 0, 1, 7, 0),
(67, 10, 0, 1, 8, 0),
(68, 10, 4, 1, 9, 2),
(69, 10, 14, 1, 41, 4),
(70, 10, 1, 1, 43, 0),
(71, 10, 0, 1, 10, 0),
(72, 10, 0, 1, 11, 0),
(73, 10, 0, 1, 12, 0),
(74, 10, 0, 1, 13, 0),
(75, 10, 0, 1, 14, 0),
(76, 10, 0, 1, 15, 0),
(77, 10, 0, 1, 16, 0),
(78, 10, 0, 1, 17, 0),
(79, 10, 0, 1, 18, 0),
(80, 10, 0, 1, 19, 0),
(81, 10, 0, 1, 20, 0),
(82, 10, 0, 1, 21, 0),
(83, 10, 0, 1, 22, 0),
(84, 10, 0, 1, 23, 0),
(85, 10, 0, 1, 24, 0),
(86, 10, 0, 1, 25, 0),
(87, 10, 0, 1, 26, 0),
(88, 10, 0, 1, 27, 0),
(89, 10, 0, 1, 28, 0),
(90, 10, 0, 1, 29, 0),
(91, 10, 0, 1, 30, 0),
(92, 10, 0, 1, 31, 0),
(93, 10, 0, 1, 32, 0),
(94, 10, 0, 1, 33, 0),
(95, 10, 0, 1, 34, 0),
(96, 10, 0, 1, 35, 0),
(97, 10, 0, 1, 36, 0),
(98, 10, 0, 1, 37, 0),
(99, 10, 0, 1, 38, 0),
(100, 10, 0, 1, 39, 0),
(101, 10, 0, 1, 40, 0),
(102, 10, 0, 1, 42, 0),
(103, 10, 0, 1, 44, 0),
(104, 10, 0, 1, 45, 0),
(105, 10, 0, 1, 46, 0),
(106, 10, 0, 1, 47, 0),
(107, 10, 0, 1, 48, 0),
(108, 10, 0, 1, 49, 0),
(109, 10, 18, 2, 2, 8),
(110, 10, 15, 2, 3, 5),
(111, 10, 27, 2, 4, 10),
(112, 10, 3, 2, 5, 1),
(113, 10, 0, 2, 6, 0),
(114, 10, 0, 2, 7, 0),
(115, 10, 6, 2, 8, 3),
(116, 10, 32, 2, 9, 9),
(117, 10, 0, 2, 10, 0),
(118, 10, 0, 2, 11, 0),
(119, 10, 1, 2, 12, 1),
(120, 10, 0, 2, 13, 0),
(121, 10, 0, 2, 14, 0),
(122, 10, 0, 2, 15, 0),
(123, 10, 0, 2, 16, 0),
(124, 10, 0, 2, 17, 0),
(125, 10, 1, 2, 18, 0),
(126, 10, 0, 2, 19, 0),
(127, 10, 0, 2, 20, 0),
(128, 10, 0, 2, 21, 0),
(129, 10, 7, 2, 22, 2),
(130, 10, 1, 2, 23, 0),
(131, 10, 0, 2, 24, 0),
(132, 10, 0, 2, 25, 0),
(133, 10, 0, 2, 26, 0),
(134, 10, 0, 2, 27, 0),
(135, 10, 4, 2, 28, 2),
(136, 10, 3, 2, 29, 0),
(137, 10, 0, 2, 30, 0),
(138, 10, 0, 2, 31, 0),
(139, 10, 0, 2, 32, 0),
(140, 10, 0, 2, 34, 0),
(141, 10, 0, 2, 33, 0),
(142, 10, 0, 2, 35, 0),
(143, 10, 0, 2, 36, 0),
(144, 10, 0, 2, 37, 0),
(145, 10, 0, 2, 38, 0),
(146, 10, 0, 2, 39, 0),
(147, 10, 0, 2, 40, 0),
(148, 10, 20, 2, 41, 4),
(149, 10, 0, 2, 42, 0),
(150, 10, 6, 2, 43, 2),
(151, 10, 20, 2, 44, 8),
(152, 10, 2, 2, 49, 1),
(153, 10, 0, 2, 45, 0),
(154, 10, 0, 2, 46, 0),
(155, 10, 0, 2, 47, 0),
(156, 10, 0, 2, 48, 0),
(157, 10, 85, 3, 2, 29),
(158, 10, 60, 3, 3, 17),
(159, 10, 82, 3, 4, 33),
(160, 10, 11, 3, 5, 3),
(161, 10, 4, 3, 6, 2),
(162, 10, 2, 3, 7, 0),
(163, 10, 9, 3, 8, 4),
(164, 10, 105, 3, 9, 35),
(165, 10, 1, 3, 12, 0),
(166, 10, 1, 3, 13, 0),
(167, 10, 4, 3, 16, 1),
(168, 10, 1, 3, 17, 0),
(169, 10, 10, 3, 18, 3),
(170, 10, 10, 3, 19, 1),
(171, 10, 1, 3, 20, 0),
(172, 10, 1, 3, 21, 0),
(173, 10, 10, 3, 22, 2),
(174, 10, 6, 3, 23, 1),
(175, 10, 3, 3, 24, 0),
(176, 10, 4, 3, 25, 2),
(177, 10, 2, 3, 26, 0),
(178, 10, 2, 3, 27, 0),
(179, 10, 5, 3, 28, 1),
(180, 10, 3, 3, 29, 0),
(181, 10, 1, 3, 30, 0),
(182, 10, 4, 3, 35, 1),
(183, 10, 1, 3, 37, 0),
(184, 10, 94, 3, 41, 11),
(185, 10, 1, 3, 42, 1),
(186, 10, 9, 3, 43, 0),
(187, 10, 32, 3, 44, 14),
(188, 10, 1, 3, 49, 1),
(189, 10, 0, 3, 10, 0),
(190, 10, 0, 3, 11, 0),
(191, 10, 0, 3, 14, 0),
(192, 10, 0, 3, 15, 0),
(193, 10, 0, 3, 31, 0),
(194, 10, 0, 3, 32, 0),
(195, 10, 0, 3, 33, 0),
(196, 10, 0, 3, 34, 0),
(197, 10, 0, 3, 36, 0),
(198, 10, 0, 3, 38, 0),
(199, 10, 0, 3, 39, 0),
(200, 10, 0, 3, 40, 0),
(201, 10, 0, 3, 45, 0),
(202, 10, 0, 3, 46, 0),
(203, 10, 0, 3, 47, 0),
(204, 10, 0, 3, 48, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry`
--

CREATE TABLE `stat_officer_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry`
--

INSERT INTO `stat_officer_ministry` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-10 18:08:54', 1, 1, 1),
(4, '2018-05-14 05:46:01', 1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_add`
--

CREATE TABLE `stat_officer_ministry_add` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_add`
--

INSERT INTO `stat_officer_ministry_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2017-09-25 18:39:51', 1, 1, 1),
(2, '2018-05-16 05:05:12', 1, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_add_detail`
--

CREATE TABLE `stat_officer_ministry_add_detail` (
  `id` int(11) NOT NULL,
  `stat_officer_ministry_add_id` int(11) NOT NULL,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_add_detail`
--

INSERT INTO `stat_officer_ministry_add_detail` (`id`, `stat_officer_ministry_add_id`, `add`, `resign`, `ministry_id`) VALUES
(1, 1, 887, 98, 1),
(2, 1, 987, 876, 2),
(3, 1, 765, 456, 4),
(4, 1, 70, 60, 5),
(5, 1, 9, 3, 30),
(6, 1, 555, 444, 42),
(7, 2, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_detail`
--

CREATE TABLE `stat_officer_ministry_detail` (
  `id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_ministry_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_detail`
--

INSERT INTO `stat_officer_ministry_detail` (`id`, `total`, `women`, `stat_officer_ministry_id`, `ministry_id`) VALUES
(1, 9, 8, 3, 1),
(2, 7, 6, 3, 2),
(3, 20, 10, 3, 4),
(4, 17, 14, 3, 5),
(5, 7553, 2326, 4, 2),
(6, 2503, 709, 4, 39),
(7, 1154, 244, 4, 38),
(8, 3536, 706, 4, 29),
(9, 9860, 2622, 4, 1),
(10, 2739, 989, 4, 6),
(11, 2432, 739, 4, 31),
(12, 4268, 1103, 4, 34),
(13, 85776, 43381, 4, 25),
(14, 18924, 11715, 4, 28),
(15, 4753, 1789, 4, 30),
(16, 943, 354, 4, 33),
(17, 1869, 630, 4, 32),
(18, 1242, 450, 4, 35),
(19, 998, 324, 4, 3),
(20, 2445, 849, 4, 62),
(21, 209, 63, 4, 87);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_train`
--

CREATE TABLE `stat_officer_ministry_train` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_train`
--

INSERT INTO `stat_officer_ministry_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2018-03-05 09:07:17', 1, 1, 1),
(3, '2018-05-14 04:52:46', 1, 12, 13),
(4, '2019-10-22 04:42:15', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_train_detail`
--

CREATE TABLE `stat_officer_ministry_train_detail` (
  `id` int(11) NOT NULL,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL,
  `stat_officer_ministry_train_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_train_detail`
--

INSERT INTO `stat_officer_ministry_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_ministry_train_id`, `ministry_id`) VALUES
(1, 99, 88, 77, 66, 55, 44, 33, 22, 2, 5),
(2, 203, 24, 179, 53, 50, 19, 1, 1, 2, 2),
(3, 619, 176, 504, 154, 275, 50, 3, 0, 2, 1),
(4, 91, 36, 121, 53, 3, 0, 1, 0, 2, 3),
(5, 33, 8, 10, 4, 2, 0, 1, 0, 2, 6),
(6, 0, 0, 263, 64, 0, 0, 0, 0, 2, 25),
(7, 871, 118, 161, 28, 61, 12, 2, 1, 2, 29),
(8, 0, 0, 236, 141, 0, 0, 0, 0, 2, 28),
(9, 7, 4, 11, 2, 63, 29, 8, 1, 2, 27),
(10, 37, 16, 39, 15, 19, 12, 0, 0, 2, 30),
(11, 38, 12, 79, 22, 0, 0, 0, 0, 2, 32),
(12, 96, 0, 20, 1, 7, 0, 0, 0, 2, 31),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 2, 33),
(14, 1, 0, 34, 9, 57, 12, 1, 0, 2, 34),
(15, 55, 22, 24, 7, 1, 0, 1, 0, 2, 35),
(16, 148, 27, 27, 4, 11, 4, 1, 0, 2, 38),
(17, 0, 0, 0, 0, 1, 1, 49, 14, 2, 39),
(18, 15, 6, 3, 0, 4, 0, 7, 0, 2, 41),
(19, 36, 5, 95, 8, 56, 8, 59, 9, 3, 1),
(20, 203, 24, 179, 53, 50, 19, 1, 1, 3, 2),
(21, 91, 36, 121, 53, 3, NULL, 1, NULL, 3, 3),
(22, NULL, NULL, 236, 141, NULL, NULL, NULL, NULL, 3, 28),
(23, NULL, NULL, 263, 64, NULL, NULL, NULL, NULL, 3, 25),
(24, 33, 8, 10, 4, 2, NULL, 1, NULL, 3, 62),
(25, 871, 118, 161, 28, 61, 12, 2, 1, 3, 29),
(26, 37, 16, 39, 15, 19, 12, NULL, NULL, 3, 30),
(27, 96, NULL, 20, 1, 7, NULL, NULL, NULL, 3, 31),
(28, 38, 12, 79, 22, NULL, NULL, NULL, NULL, 3, 32),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 33),
(30, 1, NULL, 34, 9, 57, 12, 1, NULL, 3, 34),
(31, 55, 22, 24, 7, 1, NULL, 1, NULL, 3, 35),
(32, 7, 4, 11, 2, 63, 29, 8, 1, 3, 6),
(33, NULL, NULL, NULL, NULL, 1, 1, 49, 14, 3, 39),
(34, 148, 27, 27, 4, 11, 4, 1, NULL, 3, 38),
(35, 123, 25, 123, 25, 123, 25, 123, 25, 4, 2),
(36, 555, 283, 14, 2, 3, 0, 3, 0, 4, 39),
(37, 148, 27, 27, 4, 11, 4, 1, 0, 4, 38),
(38, 871, 118, 161, 28, 61, 12, 2, 1, 4, 29),
(39, 25, 10, 22, 10, 1, 0, 1, 1, 4, 6),
(40, 619, 176, 504, 154, 275, 50, 3, 0, 4, 1),
(41, 96, 0, 20, 1, 7, 0, 0, 0, 4, 31),
(42, 1, 0, 34, 9, 57, 12, 1, 0, 4, 34),
(43, 0, 0, 263, 64, 0, 0, 0, 0, 4, 25),
(44, 0, 0, 236, 141, 0, 0, 0, 0, 4, 28),
(45, 0, 0, 0, 0, 0, 0, 0, 0, 4, 30),
(46, 180, 76, 144, 41, 55, 3, 9, 1, 4, 33),
(47, 38, 12, 79, 22, 0, 0, 0, 0, 4, 32),
(48, 55, 22, 24, 7, 1, 0, 1, 0, 4, 35),
(49, 0, 0, 85, 29, 41, 13, 9, 2, 4, 3),
(50, 34, 7, 15, 6, 0, 0, 0, 0, 4, 62),
(51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 54),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 53),
(53, 20, 11, 30, 2, 1, 0, 22, 4, 4, 41),
(54, 0, 0, 0, 0, 0, 0, 0, 0, 4, 42),
(55, 85, 32, 64, 10, 5, 3, 2, 0, 4, 87);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_upgrade`
--

CREATE TABLE `stat_officer_ministry_upgrade` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_upgrade`
--

INSERT INTO `stat_officer_ministry_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-03-05 09:24:33', 1, 1, 1),
(2, '2019-05-28 11:42:41', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_ministry_upgrade_detail`
--

CREATE TABLE `stat_officer_ministry_upgrade_detail` (
  `id` int(11) NOT NULL,
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
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_ministry_upgrade_detail`
--

INSERT INTO `stat_officer_ministry_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_ministry_upgrade_id`, `ministry_id`) VALUES
(1, 0, 0, 15, 1, 25, 10, 31, 10, 85, 14, 0, 0, 72, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 0, 0, 2, 1, 1, 1, 12, 3, 0, 0, 10, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2),
(3, 99, 9, 88, 8, 77, 7, 66, 6, 55, 5, 44, 4, 33, 3, 22, 2, 11, 1, 12, 2, 13, 3, 14, 4, 1, 4),
(4, 0, 0, 4, 3, 8, 4, 14, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3),
(5, 0, 0, 10, 6, 98, 47, 54, 21, 43, 27, 1, 0, 231, 133, 0, 0, 90, 71, 0, 0, 0, 0, 0, 0, 1, 28),
(6, 0, 0, 42, 9, 44, 11, 190, 47, 120, 48, 9, 3, 1, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 25),
(7, 0, 0, 2, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 6),
(8, 0, 0, 0, 0, 6, 2, 22, 2, 5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 29),
(9, 0, 0, 1, 0, 3, 1, 5, 0, 17, 14, 0, 0, 10, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 30),
(10, 0, 0, 1, 0, 5, 2, 9, 2, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 31),
(11, 0, 0, 0, 0, 14, 6, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 32),
(12, 0, 0, 1, 0, 4, 2, 7, 1, 20, 6, 1, 0, 13, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 33),
(13, 0, 0, 0, 0, 8, 5, 9, 1, 9, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 34),
(14, 0, 0, 0, 0, 1, 0, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 35),
(15, 0, 0, 0, 0, 6, 3, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 27),
(16, 5, 0, 3, 0, 4, 2, 5, 1, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 39),
(17, 3, 0, 1, 0, 25, 6, 13, 1, 31, 11, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 38),
(18, 0, 0, 0, 0, 2, 0, 12, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 41),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 36),
(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2),
(21, NULL, NULL, 3, 0, 4, 2, 8, 1, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 39),
(22, 7, 0, 0, NULL, 0, NULL, 4, NULL, 0, NULL, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 38),
(23, 0, 0, 0, 0, 7, 3, 22, 2, 5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 2, 29),
(24, 0, 0, 0, 0, 7, 4, 9, 3, 13, 3, 1, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6),
(25, 0, 0, 14, 2, 22, 10, 31, 10, 85, 14, 0, 0, 72, 33, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
(26, 0, 0, 2, 0, 5, 2, 12, 2, 10, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 31),
(27, 0, 0, 0, 0, 8, 5, 9, 1, 12, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 34),
(28, 0, 0, 40, 9, 44, 10, 190, 47, 120, 48, 9, 5, 1, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 2, 25),
(29, 0, 0, 10, 6, 89, 38, 53, 21, 43, 27, 1, 0, 231, 133, 3, 0, 97, 72, 0, 0, 0, 0, 0, 0, 2, 28),
(30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 30),
(31, 0, 0, 6, 3, 22, 9, 34, 11, 22, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 33),
(32, 0, 0, 0, 0, 14, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 32),
(33, 0, 0, 0, 0, 1, 0, 6, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 35),
(34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3),
(35, 0, 0, 5, 0, 10, 4, 10, 5, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 62),
(36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 41),
(37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 42),
(38, 0, 0, 0, 0, 6, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 87);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_need`
--

CREATE TABLE `stat_officer_need` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_need`
--

INSERT INTO `stat_officer_need` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-09 07:43:03', 1, 1, 1),
(2, '2018-05-14 04:27:01', 1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_need_detail`
--

CREATE TABLE `stat_officer_need_detail` (
  `id` int(11) NOT NULL,
  `center` int(11) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `stat_officer_need_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_need_detail`
--

INSERT INTO `stat_officer_need_detail` (`id`, `center`, `province`, `district`, `stat_officer_need_id`) VALUES
(1, 2772, 4426, 15989, 1),
(2, 3310, 3866, 14632, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_new`
--

CREATE TABLE `stat_officer_new` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_new`
--

INSERT INTO `stat_officer_new` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-03-05 17:47:22', 1, 1, 1),
(2, '2018-05-14 09:37:38', 1, 12, 8);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_new_detail`
--

CREATE TABLE `stat_officer_new_detail` (
  `id` int(11) NOT NULL,
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
  `soe_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_new_detail`
--

INSERT INTO `stat_officer_new_detail` (`id`, `stat_officer_new_id`, `officer_level_id`, `new_total`, `ministry_total`, `army_total`, `soe_total`, `quota`, `need`, `new_women`, `ministry_women`, `army_women`, `soe_women`) VALUES
(1, 1, 1, 9, 7, 8, 3, 1, 0, 11, 6, 4, 2),
(2, 1, 2, 99, 77, 55, 33, 11, 1, 88, 66, 44, 22),
(3, 1, 3, 11, 22, 33, 44, 55, 5, 1, 2, 3, 4),
(4, 2, 1, 0, 0, 0, 0, 52, 52, 0, 0, 0, 0),
(5, 2, 2, 30, 4, 0, 0, 23, 76, NULL, NULL, 0, 0),
(6, 2, 3, 60, 24, 1, 0, 22, 367, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_org`
--

CREATE TABLE `stat_officer_org` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_org`
--

INSERT INTO `stat_officer_org` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-10 18:31:41', 1, 1, 1),
(3, '2018-05-14 04:49:13', 1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_add`
--

CREATE TABLE `stat_officer_organisation_add` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_organisation_add`
--

INSERT INTO `stat_officer_organisation_add` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2017-09-11 18:18:39', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_add_detail`
--

CREATE TABLE `stat_officer_organisation_add_detail` (
  `id` int(11) NOT NULL,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_organisation_add_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `stat_officer_organisation_train` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_organisation_train`
--

INSERT INTO `stat_officer_organisation_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-03-05 09:21:45', 1, 1, 1),
(2, '2018-05-14 05:47:19', 1, 12, 13),
(3, '2019-05-31 05:14:20', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_train_detail`
--

CREATE TABLE `stat_officer_organisation_train_detail` (
  `id` int(11) NOT NULL,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL,
  `stat_officer_organisation_train_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_organisation_train_detail`
--

INSERT INTO `stat_officer_organisation_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `theo_out_total`, `theo_out_women`, `stat_officer_organisation_train_id`, `organisation_id`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 68, 1, 26, 3, 12, 1, 2, 1, 1, 2),
(3, 16, 3, 79, 29, 16, NULL, 1, 0, 1, 8),
(4, 22, 8, 4, 0, 1, 0, 2, 0, 1, 9),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10),
(6, 0, 0, 3, 2, 0, 0, 1, 0, 1, 11),
(7, 34, 18, 24, 9, 9, 0, 3, 0, 1, 12),
(8, 16, 3, 79, 29, 16, NULL, 1, 0, 2, 8),
(9, 47, 24, 1, 1, 6, 2, 2, 1, 3, 1),
(10, 115, 101, 17, 2, 13, 3, 2, 1, 3, 2),
(11, 1, 0, 0, 0, 105, 29, 2, 0, 3, 8),
(12, 41, 15, 19, 5, 0, 0, 0, 0, 3, 9),
(13, 0, 0, 57, 20, 0, 0, 0, 0, 3, 10),
(14, 0, 0, 3, 1, 0, 0, 1, 0, 3, 11),
(15, 54, 25, 0, 0, 0, 0, 0, 0, 3, 12),
(16, 0, 0, 60, 11, 2, 0, 0, 0, 3, 13),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3),
(18, 0, 0, 13, 13, 30, 16, 3, 2, 3, 14),
(19, 255, 162, 158, 31, 2, 1, 0, 0, 3, 15),
(20, 40, 14, 2, 1, 0, 0, 0, 0, 3, 16),
(21, 1, 0, 3, 1, 0, 0, 0, 0, 3, 17),
(22, 12, 10, 8, 2, 1, 0, 0, 0, 3, 18),
(23, 8, 3, 0, 0, 3, 1, 0, 0, 3, 19),
(24, 10, 2, 0, 0, 26, 13, 0, 0, 3, 20),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 21),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 4),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_upgrade`
--

CREATE TABLE `stat_officer_organisation_upgrade` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_organisation_upgrade`
--

INSERT INTO `stat_officer_organisation_upgrade` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-02-14 03:13:23', 1, 1, 1),
(2, '2018-05-14 05:38:04', 1, 13, 12),
(3, '2019-05-28 12:18:02', 1, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_organisation_upgrade_detail`
--

CREATE TABLE `stat_officer_organisation_upgrade_detail` (
  `id` int(11) NOT NULL,
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
  `stat_officer_organisation_upgrade_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_organisation_upgrade_detail`
--

INSERT INTO `stat_officer_organisation_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `organisation_id`, `stat_officer_organisation_upgrade_id`) VALUES
(1, 0, 0, 0, 0, 7, 2, 12, 4, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 0, 0, 2, 1, 7, 3, 3, 1, 6, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
(3, NULL, NULL, NULL, NULL, 7, 2, 12, 4, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(4, NULL, NULL, 2, 1, 7, 3, 3, 1, 6, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 2),
(6, NULL, NULL, NULL, NULL, 4, 1, 2, 2, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 2),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 2),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 2),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 2),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 2),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 2),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 2),
(13, NULL, NULL, NULL, NULL, 3, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 2),
(14, NULL, NULL, 5, 1, 4, 1, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 2),
(15, NULL, NULL, NULL, NULL, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 2),
(16, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 2),
(17, NULL, NULL, NULL, NULL, 2, 2, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 2),
(18, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 2),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 2),
(20, NULL, NULL, NULL, NULL, 5, 3, 6, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2),
(21, 0, 0, 0, 0, 6, 1, 9, 3, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3),
(22, 0, 0, 2, 0, 16, 10, 6, 3, 16, 0, 0, 0, 10, 4, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 2, 3),
(23, 0, 0, 0, 0, 4, 2, 20, 6, 4, 2, 2, 1, 3, 0, 0, 0, 2, 0, 0, 0, 3, 1, 0, 0, 8, 3),
(24, 0, 0, 0, 0, 4, 2, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 3),
(25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 3),
(26, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 3),
(27, 0, 0, 0, 0, 0, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 3),
(28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3),
(29, 0, 0, 0, 0, 3, 2, 1, 1, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 3),
(30, 0, 0, 0, 0, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 3),
(31, 0, 0, 0, 0, 5, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 3),
(32, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 3),
(33, 0, 0, 0, 0, 2, 2, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 3),
(34, 0, 0, 0, 0, 4, 0, 0, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 3),
(35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_org_detail`
--

CREATE TABLE `stat_officer_org_detail` (
  `id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_org_id` int(11) NOT NULL,
  `organisation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_org_detail`
--

INSERT INTO `stat_officer_org_detail` (`id`, `total`, `women`, `stat_officer_org_id`, `organisation_id`) VALUES
(1, 11, 1, 1, 1),
(2, 5, 0, 1, 2),
(5, 273, 111, 3, 1),
(6, 1833, 643, 3, 2),
(7, 1580, 531, 3, 8),
(8, 209, 63, 3, 4),
(9, 644, 220, 3, 5),
(10, 185, 70, 3, 9),
(11, 1148, 622, 3, 6),
(12, 151, 76, 3, 11),
(13, 121, 38, 3, 12),
(14, 105, 45, 3, 13),
(15, 170, 79, 3, 3),
(16, 128, 112, 3, 14),
(17, 117, 55, 3, 15),
(18, 141, 63, 3, 16),
(19, 156, 62, 3, 17),
(20, 69, 31, 3, 18),
(21, 98, 49, 3, 19),
(22, 83, 34, 3, 20),
(23, 84, 43, 3, 21),
(24, 293, 107, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_position`
--

CREATE TABLE `stat_officer_position` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_position`
--

INSERT INTO `stat_officer_position` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-03-06 04:53:06', 1, 1, 1),
(2, '2018-05-14 04:57:27', 1, 12, 2),
(3, '2019-05-27 05:23:16', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_position_detail`
--

CREATE TABLE `stat_officer_position_detail` (
  `id` int(11) NOT NULL,
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
  `organisation_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_position_detail`
--

INSERT INTO `stat_officer_position_detail` (`id`, `p1_total`, `p1_women`, `p2_total`, `p2_women`, `p3_total`, `p3_women`, `p4_total`, `p4_women`, `p5_total`, `p5_women`, `p6_total`, `p6_women`, `p7_total`, `p7_women`, `p8_total`, `p8_women`, `stat_officer_position_id`, `organisation_group_id`) VALUES
(1, 120, 24, 118, 66, 364, 44, 1320, 22, 2916, 9, 5330, 7, 5951, 5, 4571, 3, 1, 0),
(2, 92, 14, 742, 99, 2087, 324, 6963, 1154, 12089, 2658, 18704, 4970, 15150, 5694, 10365, 5007, 2, 0),
(3, 105, 13, 849, 126, 2255, 373, 6968, 1293, 12640, 3041, 20147, 5665, 15525, 5931, 8339, 4330, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province`
--

CREATE TABLE `stat_officer_province` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province`
--

INSERT INTO `stat_officer_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-09-18 09:54:38', 1, 1, 1),
(3, '2018-06-13 09:46:34', 1, 12, 2),
(4, '2018-06-18 04:08:21', 1, 9, 21),
(5, '2019-05-19 08:46:17', 1, 2, 35),
(6, '2019-07-03 10:56:49', 1, 3, 34),
(7, '2020-03-16 04:39:17', 1, 4, 18);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_add`
--

CREATE TABLE `stat_officer_province_add` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_add`
--

INSERT INTO `stat_officer_province_add` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-09-18 09:53:51', 1, 1, 1),
(2, '2018-06-14 05:41:57', 1, 21, 12),
(3, '2018-06-14 05:42:10', 1, 21, 9),
(5, '2018-10-19 05:22:37', 1, 35, 2),
(6, '2019-07-08 09:34:40', 1, 29, 3),
(7, '2020-03-16 04:40:50', 1, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_add_detail`
--

CREATE TABLE `stat_officer_province_add_detail` (
  `id` int(11) NOT NULL,
  `add` int(11) DEFAULT NULL,
  `resign` int(11) DEFAULT NULL,
  `stat_officer_province_add_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_add_detail`
--

INSERT INTO `stat_officer_province_add_detail` (`id`, `add`, `resign`, `stat_officer_province_add_id`, `province_id`) VALUES
(1, 88, 19, 1, 1),
(2, 88, 77, 1, 17),
(3, 77, 66, 1, 16),
(4, 50, 38, 1, 14),
(5, 81, 48, 1, 2),
(6, 100, 100, 2, 1),
(7, 150, 150, 3, 1),
(9, 50, 50, 2, 2),
(10, 100, 100, 3, 3),
(11, 200, 200, 2, 4),
(12, 200, 200, 3, 4),
(13, 300, 300, 1, 4),
(15, 100, 100, 2, 6),
(16, 120, 120, 3, 6),
(17, 150, 150, 1, 6),
(18, 15, 10, 1, 11),
(30, 88, 77, 5, 17),
(31, 0, 0, 5, 10),
(32, 40, 27, 5, 8),
(33, 81, 48, 5, 2),
(34, 90, 159, 5, 4),
(35, 253, 55, 5, 7),
(36, 0, 0, 5, 18),
(37, 6, 2, 5, 15),
(38, 181, 0, 5, 11),
(39, NULL, NULL, 5, 16),
(40, 163, 1, 5, 12),
(41, 28, 47, 5, 1),
(42, 50, 38, 5, 14),
(43, 0, 0, 5, 5),
(44, 180, 69, 6, 11),
(45, 87, 19, 6, 2),
(46, 49, 17, 7, 2),
(47, 171, 51, 7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_detail`
--

CREATE TABLE `stat_officer_province_detail` (
  `id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `women` int(11) DEFAULT NULL,
  `stat_officer_province_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_detail`
--

INSERT INTO `stat_officer_province_detail` (`id`, `total`, `women`, `stat_officer_province_id`, `province_id`) VALUES
(1, 9, 0, 1, 17),
(2, 8, 1, 1, 1),
(3, 7, 6, 1, 16),
(4, 13, 2, 1, 15),
(5, 10, 10, 1, 18),
(6, 9, 9, 1, 5),
(7, 7, 7, 1, 13),
(10, 8, 4, 1, 4),
(11, 1135, 476, 3, 1),
(12, 983, 467, 3, 2),
(13, 929, 336, 3, 3),
(14, 984, 339, 3, 4),
(15, 700, 284, 3, 5),
(16, 1302, 499, 3, 6),
(17, 1133, 456, 3, 7),
(18, 936, 365, 3, 9),
(19, 1353, 515, 3, 8),
(20, 1280, 572, 3, 10),
(21, 968, 426, 3, 11),
(22, 1101, 462, 3, 12),
(23, 1867, 759, 3, 13),
(24, 1075, 418, 3, 14),
(25, 735, 270, 3, 15),
(26, 1661, 640, 3, 16),
(27, 814, 306, 3, 17),
(28, 83, 11, 3, 18),
(29, 1000, 400, 4, 1),
(31, 1000, 300, 4, 6),
(32, 1500, 400, 1, 6),
(33, 800, 100, 4, 9),
(43, 9, 0, 5, 17),
(44, 0, 0, 5, 10),
(45, 10254, 4634, 5, 8),
(46, 7445, 3418, 5, 11),
(47, 1084, 490, 5, 1),
(48, 7, 7, 5, 13),
(49, 0, 0, 1, 14),
(50, 8307, 8207, 5, 4),
(51, 8754, 4389, 5, 7),
(52, 10, 10, 5, 18),
(53, 6175, 320, 5, 2),
(54, 10, 2, 5, 15),
(55, 14012, 7184, 5, 16),
(56, 9657, 4868, 5, 12),
(57, 5488, 2295, 5, 5),
(58, 0, 0, 5, 14),
(59, 13970, 70229, 6, 16),
(60, 7504, 3479, 6, 11),
(61, 6199, 3281, 6, 2),
(62, 6203, 3302, 7, 2),
(63, 7443, 3494, 7, 11);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_train`
--

CREATE TABLE `stat_officer_province_train` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_train`
--

INSERT INTO `stat_officer_province_train` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(2, '2018-03-05 09:23:29', 1, 1, 1),
(3, '2018-05-18 20:10:55', 1, 12, 13),
(4, '2019-05-28 11:12:51', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_train_detail`
--

CREATE TABLE `stat_officer_province_train_detail` (
  `id` int(11) NOT NULL,
  `tech_in_total` int(11) DEFAULT NULL,
  `tech_in_women` int(11) DEFAULT NULL,
  `tech_out_total` int(11) DEFAULT NULL,
  `tech_out_women` int(11) DEFAULT NULL,
  `theo_in_total` int(11) DEFAULT NULL,
  `theo_in_women` int(11) DEFAULT NULL,
  `stat_officer_province_train_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `theo_out_total` int(11) DEFAULT NULL,
  `theo_out_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_train_detail`
--

INSERT INTO `stat_officer_province_train_detail` (`id`, `tech_in_total`, `tech_in_women`, `tech_out_total`, `tech_out_women`, `theo_in_total`, `theo_in_women`, `stat_officer_province_train_id`, `province_id`, `theo_out_total`, `theo_out_women`) VALUES
(1, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0),
(2, 234, 95, 41, 11, 0, 0, 2, 2, 0, 0),
(3, 0, 0, 0, 0, 11, 1, 2, 4, 0, 0),
(4, 30, 15, 12, 6, 0, 0, 2, 3, 0, 0),
(5, 51, 19, 19, 5, 35, 9, 2, 5, 6, 1),
(6, 74, 49, 90, 30, 23, 7, 2, 7, 2, 0),
(7, 408, 236, 36, 7, 30, 9, 2, 9, 0, 0),
(8, 766, 269, 39, 7, 125, 27, 2, 6, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 2, 8, 0, 0),
(10, 0, 0, 0, 0, 2, 0, 2, 18, 9, 0),
(11, 0, 0, 0, 0, 0, 0, 2, 10, 0, 0),
(12, 47, 27, 8, 5, 31, 10, 2, 11, 4, 0),
(13, 96, 26, 17, 8, 69, 19, 2, 12, 6, 2),
(14, 0, 0, 0, 0, 0, 0, 2, 13, 0, 0),
(15, 84, 29, 5, 1, 72, 8, 2, 14, 5, 1),
(16, 95, 29, 44, 9, 23, 14, 2, 16, 3, 1),
(17, 0, 0, 0, 0, 0, 0, 2, 17, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 2, 15, 0, 0),
(19, 2, 1, 3, 2, 4, 3, 3, 1, 5, 4),
(20, 234, 95, 41, 11, NULL, NULL, 3, 2, NULL, NULL),
(21, NULL, NULL, NULL, NULL, 11, 1, 3, 4, NULL, NULL),
(22, 30, 15, 12, 6, NULL, NULL, 3, 3, NULL, NULL),
(23, 51, 19, 19, 5, 35, 9, 3, 5, 6, 1),
(24, 74, 49, 90, 30, 23, 7, 3, 7, 2, NULL),
(25, 408, 236, 36, 7, 30, 9, 3, 9, NULL, NULL),
(26, 766, 269, 39, 7, 125, 27, 3, 6, NULL, NULL),
(27, NULL, NULL, NULL, NULL, NULL, NULL, 3, 8, NULL, NULL),
(28, NULL, NULL, NULL, NULL, 2, NULL, 3, 18, 9, NULL),
(29, NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, NULL, NULL),
(30, 47, 27, 8, 5, 31, 10, 3, 11, 4, NULL),
(31, 96, 26, 17, 8, 69, 19, 3, 12, 6, 2),
(32, NULL, NULL, NULL, NULL, NULL, NULL, 3, 13, NULL, NULL),
(33, 84, 29, 5, 1, 72, 8, 3, 14, 5, 1),
(34, 95, 29, 44, 9, 23, 14, 3, 16, 3, 1),
(35, NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, NULL, NULL),
(36, NULL, NULL, NULL, NULL, NULL, NULL, 3, 15, NULL, NULL),
(37, 0, 0, 0, 0, 0, 0, 4, 1, 0, 0),
(38, 17, 8, 10, 4, 40, 13, 4, 2, 4, 2),
(39, 15, 2, 5, 1, 18, 5, 4, 3, 12, 3),
(40, 20, 5, 8, 1, 24, 6, 4, 5, 13, 5),
(41, 39, 15, 20, 4, 54, 13, 4, 4, 4, 2),
(42, 16, 6, 8, 1, 21, 10, 4, 6, 3, 0),
(43, 13, 5, 5, 1, 20, 6, 4, 7, 7, 1),
(44, 28, 15, 15, 3, 24, 10, 4, 9, 3, 0),
(45, 9, 4, 10, 3, 27, 10, 4, 8, 3, 0),
(46, 29, 6, 18, 1, 21, 10, 4, 10, 3, 0),
(47, 30, 14, 16, 3, 38, 12, 4, 11, 3, 0),
(48, 63, 20, 35, 4, 32, 9, 4, 12, 3, 0),
(49, 0, 0, 0, 0, 0, 0, 4, 13, 0, 0),
(50, 7, 1, 2, 2, 42, 11, 4, 14, 4, 3),
(51, 12, 6, 2, 0, 90, 39, 4, 15, 0, 0),
(52, 16, 7, 2, 0, 116, 39, 4, 16, 0, 0),
(53, 10, 7, 2, 0, 78, 39, 4, 17, 0, 0),
(54, 32, 14, 6, 3, 34, 12, 4, 18, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_upgrade`
--

CREATE TABLE `stat_officer_province_upgrade` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_upgrade`
--

INSERT INTO `stat_officer_province_upgrade` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-14 03:38:54', 1, 1, 1),
(2, '2019-06-11 11:01:41', 1, 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_province_upgrade_detail`
--

CREATE TABLE `stat_officer_province_upgrade_detail` (
  `id` int(11) NOT NULL,
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
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_province_upgrade_detail`
--

INSERT INTO `stat_officer_province_upgrade_detail` (`id`, `doctor_in_total`, `doctor_in_women`, `doctor_out_total`, `doctor_out_women`, `master_in_total`, `master_in_women`, `master_out_total`, `master_out_women`, `bachelor_in_total`, `bachelor_in_women`, `bachelor_out_total`, `bachelor_out_women`, `high_in_total`, `high_in_women`, `high_out_total`, `high_out_women`, `middle_in_total`, `middle_in_women`, `middle_out_total`, `middle_out_women`, `begin_in_total`, `begin_in_women`, `begin_out_total`, `begin_out_women`, `stat_officer_province_upgrade_id`, `province_id`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3),
(4, 0, 0, 3, 1, 3, 2, 3, 0, 12, 4, 6, 2, 40, 19, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 5),
(5, 0, 0, 0, NULL, 2, 0, 2, 0, 8, 0, 3, 0, 5, 2, 0, 0, 45, 16, 5, 0, 127, 38, 0, 0, 1, 4),
(6, 0, 0, 3, 0, 9, 1, 22, 2, 53, 20, 5, 1, 96, 46, 0, 0, 30, 27, 0, 0, 0, 0, 0, 0, 1, 6),
(7, 0, 0, 4, 2, 10, 4, 13, 2, 57, 13, 2, 1, 94, 41, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 7),
(8, 0, 0, 0, 0, 10, 3, 7, 0, 22, 6, 5, 0, 27, 12, 2, 0, 8, 3, 0, 0, 0, 0, 0, 0, 1, 9),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 8),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 10),
(11, 0, 0, 0, 0, 5, 2, 0, 0, 10, 6, 5, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 11),
(12, 0, 0, 0, 0, 4, 0, 1, 0, 106, 47, 8, 1, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 12),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 13),
(14, 0, 0, 0, 0, 9, 1, 9, 1, 113, 41, 12, 2, 58, 31, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 1, 14),
(15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15),
(16, 0, 0, 3, 0, 1, 1, 3, 2, 40, 19, 6, 2, 5, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 16),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 17),
(18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 18),
(19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2),
(21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 10),
(22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3),
(23, 0, 0, 1, 0, 0, 0, 2, 0, 2, 0, 3, 2, 18, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 5),
(24, 0, 0, 0, 0, 0, 0, 5, 2, 1, 1, 8, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4),
(25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6),
(26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 7),
(27, 0, 0, 0, 0, 2, 2, 2, 0, 8, 1, 0, 0, 9, 4, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 2, 9),
(28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 8),
(29, 0, 0, 0, 0, 0, 0, 6, 0, 1, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 11),
(30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 12),
(31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 13),
(32, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 9, 3, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 14),
(33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 15),
(34, 0, 0, 0, 0, 1, 0, 9, 2, 15, 6, 3, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 16),
(35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 17),
(36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 18);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_resign`
--

CREATE TABLE `stat_officer_resign` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_resign`
--

INSERT INTO `stat_officer_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-02-09 07:30:00', 1, 1, 1),
(3, '2018-05-17 19:15:26', 1, 12, 2),
(4, '2019-05-27 05:43:34', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_resign_detail`
--

CREATE TABLE `stat_officer_resign_detail` (
  `id` int(11) NOT NULL,
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
  `ministry_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_resign_detail`
--

INSERT INTO `stat_officer_resign_detail` (`id`, `stat_officer_resign_id`, `retire_total`, `bumnet_total`, `die_total`, `leave_total`, `fire_total`, `resign_total`, `lose_total`, `move_soe_total`, `moveto_ministry_total`, `movein_ministry_total`, `retire_women`, `bumnet_women`, `die_women`, `leave_women`, `fire_women`, `resign_women`, `lose_women`, `move_soe_women`, `moveto_ministry_women`, `movein_ministry_women`, `ministry_group_id`) VALUES
(1, 1, 2030, 243, 387, 175, 40, 46, 8, 48, 1299, 930, 896, 93, 150, 50, 10, 18, 2, 11, 493, 245, 0),
(3, 3, 215, 182, 248, 166, 154, 36, 8, 48, 1177, 756, 0, 78, 52, 54, 46, 13, 2, 11, 323, 230, 0),
(4, 4, 2242, 189, 395, 144, 69, 65, 17, 38, 1506, NULL, 906, 64, 89, 61, 19, 31, 14, 21, 563, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_salary`
--

CREATE TABLE `stat_officer_salary` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_salary`
--

INSERT INTO `stat_officer_salary` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(4, '2017-09-17 06:04:21', 1, 1, 1),
(6, '2018-06-27 18:33:40', 1, 12, 8),
(7, '2018-10-18 05:05:18', 1, 3, 1),
(8, '2020-01-27 17:21:31', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_salary_detail`
--

CREATE TABLE `stat_officer_salary_detail` (
  `id` int(11) NOT NULL,
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
  `salary_level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_salary_detail`
--

INSERT INTO `stat_officer_salary_detail` (`id`, `stat_officer_salary_id`, `level1_total`, `level1_women`, `level2_total`, `level2_women`, `level3_total`, `level3_women`, `level4_total`, `level4_women`, `level5_total`, `level5_women`, `level6_total`, `level6_women`, `level7_total`, `level7_women`, `level8_total`, `level8_women`, `level9_total`, `level9_women`, `level10_total`, `level10_women`, `level11_total`, `level11_women`, `level12_total`, `level12_women`, `level13_total`, `level13_women`, `level14_total`, `level14_women`, `level15_total`, `level15_women`, `officer_level_id`, `salary_level_id`) VALUES
(17, 6, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4),
(18, 6, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1),
(19, 7, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1),
(20, 7, 0, 0, 0, 0, 3, 1, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 0, 0, 0, 0, 4, 1, 1, 2),
(21, 7, 3, 0, 19, 10, 35, 16, 41, 17, 20, 10, 40, 19, 15, 2, 11, 6, 14, 1, 14, 5, 6, 0, 2, 0, 5, 1, 11, 3, 7, 3, 1, 3),
(22, 7, 70, 33, 428, 197, 686, 286, 621, 241, 211, 82, 136, 49, 109, 33, 78, 22, 66, 11, 60, 11, 36, 7, 22, 4, 17, 6, 30, 4, 20, 4, 1, 4),
(23, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 3, 16, 0, 10, 6, 13, 1, 5, 1, 4, 0, 0, 0, 0, 0, 1, 5),
(24, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1),
(25, 7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2),
(26, 7, 0, 0, 2, 0, 2, 1, 2, 1, 2, 2, 6, 4, 4, 1, 2, 2, 3, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 1, 0, 0, 2, 3),
(27, 7, 19, 9, 85, 42, 116, 63, 134, 56, 50, 28, 61, 28, 38, 11, 23, 7, 29, 5, 24, 4, 11, 2, 8, 1, 3, 2, 11, 1, 10, 1, 2, 4),
(28, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 4, 0, 3, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 5),
(29, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1),
(30, 7, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 0, 0, 0, 0, 2, 1, 3, 2),
(31, 7, 2, 0, 17, 10, 33, 15, 39, 16, 21, 8, 33, 15, 10, 1, 9, 4, 11, 1, 9, 2, 4, 0, 1, 0, 3, 0, 9, 2, 3, 0, 3, 3),
(32, 7, 44, 21, 304, 140, 500, 184, 394, 136, 111, 36, 50, 13, 36, 6, 29, 6, 20, 3, 19, 2, 17, 1, 9, 2, 5, 0, 13, 1, 4, 1, 3, 4),
(33, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 5),
(34, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_technical`
--

CREATE TABLE `stat_officer_technical` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_technical`
--

INSERT INTO `stat_officer_technical` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-02-13 08:10:08', 1, 1, 1),
(3, '2018-05-14 04:57:37', 1, 8, 12),
(4, '2018-10-18 05:17:55', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_officer_technical_detail`
--

CREATE TABLE `stat_officer_technical_detail` (
  `id` int(11) NOT NULL,
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
  `primary_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_officer_technical_detail`
--

INSERT INTO `stat_officer_technical_detail` (`id`, `stat_officer_technical_id`, `officer_level_id`, `doctor_total`, `doctor_women`, `post_master_total`, `post_master_women`, `master_total`, `master_women`, `post_bachelor_total`, `post_bachelor_women`, `bachelor_total`, `bachelor_women`, `high_total`, `high_women`, `middle_total`, `middle_women`, `begin_total`, `begin_women`, `hischool_total`, `hischool_women`, `second_total`, `second_women`, `primary_total`, `primary_women`) VALUES
(1, 1, 1, 4, 2, 0, 0, 94, 27, 0, 0, 272, 126, 65, 28, 30, 6, 11, 3, 0, 0, 0, 0, 0, 0),
(2, 1, 2, 1, 0, 4, 0, 32, 6, 0, 0, 354, 137, 180, 84, 39, 13, 4, 2, 0, 0, 0, 0, 0, 0),
(3, 1, 3, 0, 0, 0, 0, 9, 1, 18, 6, 788, 237, 603, 260, 236, 68, 43, 15, 0, 0, 0, 0, 0, 0),
(5, 3, 1, 4, 2, NULL, NULL, 94, 27, NULL, NULL, 272, 126, 65, 28, 30, 6, 11, 3, 0, 0, 0, 0, 0, 0),
(6, 3, 2, 1, 0, 4, 0, 32, 6, 0, 0, 354, 137, 180, 84, 39, 13, 4, 2, 0, 0, 0, 0, 0, 0),
(7, 3, 3, 0, 0, 0, 0, 9, 1, 18, 6, 788, 237, 603, 160, 236, 68, 43, 15, 0, 0, 0, 0, 0, 0),
(8, 4, 1, 6, 2, 0, 0, 120, 32, 1, 0, 265, 123, 56, 27, 23, 5, 12, 3, 0, 0, 0, 0, 0, 0),
(9, 4, 2, 0, 0, 0, 0, 45, 10, 0, 0, 412, 166, 175, 88, 25, 10, 5, 1, 0, 0, 0, 0, 0, 0),
(10, 4, 3, 0, 0, 0, 0, 12, 2, 0, 0, 875, 273, 662, 292, 195, 54, 27, 10, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_people_move`
--

CREATE TABLE `stat_people_move` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `deleted` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_people_move_detail`
--

CREATE TABLE `stat_people_move_detail` (
  `id` int(11) NOT NULL,
  `stat_people_move_id` int(11) NOT NULL,
  `movein_total` int(11) DEFAULT NULL,
  `movein_women` int(11) DEFAULT NULL,
  `born_total` int(11) DEFAULT NULL,
  `born_women` int(11) DEFAULT NULL,
  `wedding_laolao` int(11) DEFAULT NULL,
  `wedding_laofor` int(11) DEFAULT NULL,
  `divorce_laolao` int(11) DEFAULT NULL,
  `divorce_laofor` int(11) DEFAULT NULL,
  `sign_total` int(11) DEFAULT NULL,
  `sign_women` int(11) DEFAULT NULL,
  `resign_total` int(11) DEFAULT NULL,
  `resign_women` int(11) DEFAULT NULL,
  `movein_village_total` int(11) DEFAULT NULL,
  `movein_village_women` int(11) DEFAULT NULL,
  `movein_district_total` int(11) DEFAULT NULL,
  `movein_district_women` int(11) DEFAULT NULL,
  `movein_province_total` int(11) DEFAULT NULL,
  `movein_province_women` int(11) DEFAULT NULL,
  `moveout_village_total` int(11) DEFAULT NULL,
  `moveout_village_women` int(11) DEFAULT NULL,
  `moveout_district_total` int(11) DEFAULT NULL,
  `moveout_district_women` int(11) DEFAULT NULL,
  `moveout_province_total` int(11) DEFAULT NULL,
  `moveout_province_women` int(11) DEFAULT NULL,
  `die_total` int(11) DEFAULT NULL,
  `die_women` int(11) DEFAULT NULL,
  `real_total` int(11) DEFAULT NULL,
  `real_women` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT 0,
  `total_village` int(11) DEFAULT NULL,
  `total_family` int(11) DEFAULT NULL,
  `total_district` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_population_movement`
--

CREATE TABLE `stat_population_movement` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_population_movement`
--

INSERT INTO `stat_population_movement` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(5, '2018-09-18 09:21:07', 1, 1, 1),
(7, '2018-06-13 09:36:38', 1, 12, 14),
(8, '2018-06-21 11:35:49', 1, 9, 21),
(9, '2019-07-03 09:12:32', 1, 2, 29),
(10, '2019-11-11 04:24:59', 1, 3, 1),
(11, '2020-02-27 02:46:34', 1, 4, 18);

-- --------------------------------------------------------

--
-- Table structure for table `stat_population_movement_detail`
--

CREATE TABLE `stat_population_movement_detail` (
  `id` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `village` int(11) DEFAULT NULL,
  `population_total` int(11) DEFAULT NULL,
  `population_women` int(11) DEFAULT NULL,
  `born_total` int(11) DEFAULT NULL,
  `born_women` int(11) DEFAULT NULL,
  `die_total` int(11) DEFAULT NULL,
  `die_women` int(11) DEFAULT NULL,
  `married_local_foreigner` int(11) DEFAULT NULL,
  `divorce_local_foreigner` int(11) DEFAULT NULL,
  `married` int(11) DEFAULT NULL,
  `divorce` int(11) DEFAULT NULL,
  `movein_total` int(11) DEFAULT NULL,
  `movein_women` int(11) DEFAULT NULL,
  `moveout_total` int(11) DEFAULT NULL,
  `moveout_women` int(11) DEFAULT NULL,
  `real_total` int(11) DEFAULT NULL,
  `real_women` int(11) DEFAULT NULL,
  `province_id` int(11) NOT NULL,
  `stat_population_movement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_population_movement_detail`
--

INSERT INTO `stat_population_movement_detail` (`id`, `district`, `village`, `population_total`, `population_women`, `born_total`, `born_women`, `die_total`, `die_women`, `married_local_foreigner`, `divorce_local_foreigner`, `married`, `divorce`, `movein_total`, `movein_women`, `moveout_total`, `moveout_women`, `real_total`, `real_women`, `province_id`, `stat_population_movement_id`) VALUES
(1, 9, 481, 826807, 409961, 7403, 3708, 1816, 782, NULL, NULL, 1874, 502, 4351, 2147, 2220, 1096, 831663, 411726, 1, 5),
(2, 15, 1022, 969700, 486600, 9408, 4872, 4668, 2375, NULL, NULL, 3756, 747, 3488, 1650, 3879, 2118, 974049, 488629, 13, 5),
(4, 7, 521, 184593, 90355, 1475, 779, 431, 186, NULL, NULL, 263, 45, 697, 308, 1286, 317, 185048, 92238, 2, 5),
(5, 5, 367, 181904, 90146, 2437, 1187, 527, 225, NULL, NULL, 1003, 135, 1173, 609, 671, 375, 184316, 91342, 3, 5),
(6, 7, 470, 312108, 155754, 3019, 1495, 598, 237, NULL, NULL, 760, 120, 67, 41, 121, 62, 314475, 156991, 4, 5),
(7, 5, 255, 178735, 89270, 4725, 2425, 819, 300, NULL, NULL, 625, 242, 1017, 405, 1081, 720, 183126, 91080, 5, 5),
(8, 12, 754, 448653, 218905, 3066, 1448, 699, 272, NULL, NULL, 1125, 136, 1507, 724, 1282, 636, 451245, 220169, 6, 5),
(9, 10, 723, 302792, 148025, 1547, 785, 445, 196, NULL, NULL, 409, 39, 293, 157, 594, 290, 301876, 147595, 7, 5),
(10, 11, 430, 384399, 186615, 3390, 1674, 681, 324, NULL, NULL, 1131, 242, 956, 456, 678, 318, 387386, 188103, 8, 5),
(11, 7, 480, 259362, 127788, 2836, 1426, 542, 247, NULL, NULL, 654, 108, 1195, 619, 775, 432, 262076, 129154, 9, 5),
(12, 11, 433, 444973, 220887, 4242, 2121, 1125, 491, NULL, NULL, 1475, 286, 1730, 875, 1585, 878, 444863, 222855, 10, 5),
(13, 7, 291, 288824, 139850, 3256, 1595, 802, 242, NULL, NULL, 1022, 249, 76, 30, 48, 25, 291371, 141208, 11, 5),
(14, 10, 574, 408352, 205522, 3501, 1848, 710, 295, NULL, NULL, 1047, 245, 602, 307, 298, 157, 411447, 207225, 12, 5),
(15, 8, 579, 410522, 207206, 2610, 1361, 686, 298, NULL, NULL, 728, 155, 1344, 607, 1094, 519, 407288, 205393, 14, 5),
(16, 4, 197, 117367, 58434, 1771, 862, 217, 53, NULL, NULL, 196, 51, 804, 505, 400, 97, 119325, 59651, 15, 5),
(17, 10, 643, 703896, 359779, 3997, 1989, 1773, 567, NULL, NULL, 1732, 211, 925, 399, 1185, 412, 700093, 354157, 16, 5),
(18, 5, 146, 142958, 72708, 867, 470, 363, 146, NULL, NULL, 404, 93, 419, 196, 312, 165, 142856, 71845, 17, 5),
(19, 5, 93, 88494, 43512, 2196, 1172, 255, 103, NULL, NULL, 241, 32, 676, 367, 301, 185, 90810, 44763, 18, 5),
(20, 9, 481, 782059, 395462, 6184, 3188, 1663, 690, NULL, NULL, 2020, 376, 3852, 1920, 2812, 1288, 784524, 397118, 1, 7),
(21, 7, 538, 179523, 88690, 2493, 1199, 678, 339, NULL, NULL, 602, 94, 303, 170, 253, 216, 178058, 87375, 2, 7),
(22, 5, 367, 178953, 88806, 2515, 1273, 566, 236, NULL, NULL, 1324, 164, 1403, 742, 708, 406, 181597, 90179, 3, 7),
(23, 7, 472, 305773, 153038, 1230, 631, 380, 161, NULL, NULL, 432, 72, 571, 279, 828, 429, 306386, 153327, 4, 7),
(24, 5, 255, 179822, 89052, 1791, 840, 358, 158, NULL, NULL, 500, 81, 502, 239, 274, 149, 181483, 89824, 5, 7),
(25, 12, 754, 445353, 219194, 3457, 2020, 562, 217, NULL, NULL, 1254, 169, 2014, 1001, 1578, 745, 448653, 218905, 6, 7),
(26, 10, 718, 299386, 147426, 1487, 1142, 780, 309, NULL, NULL, 747, 93, 552, 315, 1029, 520, 297742, 147214, 7, 7),
(27, 11, 430, 381385, 188677, 2808, 1222, 576, 241, NULL, NULL, 1292, 176, 1125, 478, 776, 351, 383966, 270795, 8, 7),
(28, 7, 481, 253926, 125624, 1920, 914, 488, 203, NULL, NULL, 669, 75, 817, 439, 734, 393, 255421, 126381, 9, 7),
(29, 11, 433, 443841, 220392, 3545, 1794, 1202, 555, NULL, NULL, 1346, 316, 2259, 1205, 1152, 627, 445416, 221506, 10, 7),
(30, 7, 293, 279468, 139923, 4231, 2051, 825, 140, NULL, NULL, 556, 106, 379, 199, 264, 103, 284018, 142173, 11, 7),
(31, 10, 579, 401684, 205445, 3835, 1970, 947, 435, NULL, NULL, 1135, 320, 899, 404, 719, 363, 399231, 204701, 12, 7),
(32, 15, 1022, 935975, 470905, 32271, 11440, 2096, 696, NULL, NULL, 3969, 827, 6006, NULL, 2459, 1248, 969700, 486600, 13, 7),
(33, 8, 579, 403183, 202429, 5057, 2437, 1366, 570, NULL, NULL, 1892, 390, 1603, 595, 1185, 498, 400269, 201852, 14, 7),
(34, 4, 197, 114232, 57514, 1315, 503, 204, 93, NULL, NULL, 155, 33, 951, 304, 379, 192, 115915, 58036, 15, 7),
(35, 10, 643, 696973, 348224, 4512, 2151, 967, 415, NULL, NULL, 1339, 149, 1116, 404, 1169, 559, 688808, 364220, 16, 7),
(36, 5, 147, 142944, 71216, 1320, 695, 346, 130, NULL, NULL, 584, 90, 629, 309, 361, 159, 144186, 71931, 17, 7),
(37, 5, 96, 88370, 43244, 1433, 773, 189, 91, NULL, NULL, 250, 52, 519, 309, 227, 152, 88494, 43512, 18, 7),
(38, 9, 481, 826553, 410860, 5928, 2875, 1512, 648, NULL, NULL, 2015, 566, 4829, 2414, 2283, 1112, 835037, 412309, 1, 8),
(39, 7, 532, 176541, 86810, 2265, 1023, 641, 268, NULL, NULL, 887, 120, 747, 368, 634, 338, 176381, 86739, 2, 8),
(41, 5, 366, 174525, 87987, 2357, 1279, 500, 207, NULL, NULL, 978, 134, 2706, 1394, 609, 326, 178479, 90127, 3, 8),
(44, 5, 255, 179822, 89052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8),
(45, 12, 757, 464482, 231104, 2617, 1509, 475, 247, NULL, NULL, 1099, 165, 3167, 1620, 1598, 861, 468192, 233125, 6, 8),
(46, 10, 718, 299386, 147426, 2487, 1142, 780, 309, NULL, NULL, 747, 93, 552, 315, 1029, 520, 297742, 147214, 7, 8),
(47, 7, 313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 8),
(62, 7, 291, 300568, 144998, 3150, 1511, 714, 279, NULL, NULL, 988, 208, 710, 400, 347, 209, 300568, 144998, 11, 9),
(63, 7, 480, 259362, 127788, 2836, 1426, 542, 247, NULL, NULL, 654, 108, 1195, 619, 775, 432, NULL, NULL, 9, 9),
(64, 9, 481, 799841, 405519, 8148, 4270, 2554, 1082, NULL, NULL, 2051, 596, 4620, 2462, 2375, 1222, 805481, 408079, 1, 9),
(65, 12, 754, 448653, 218905, 3066, 1448, 699, 272, NULL, NULL, 1125, 136, 1507, 724, 1282, 636, 451545, 220169, 6, 9),
(66, 15, 1022, 969700, 486600, 9408, 4872, 4668, 2375, NULL, NULL, 3756, 747, 3488, 1650, 3879, 2118, NULL, NULL, 13, 9),
(67, 11, 433, 444973, 220887, 4242, 2121, 1125, 491, NULL, NULL, 1475, 286, 1730, 875, 1585, 878, NULL, NULL, 10, 9),
(68, 5, 146, 142958, 72708, 867, 470, 363, 146, NULL, NULL, 404, 93, 419, 196, 312, 165, 142958, 72708, 17, 9),
(69, 11, 430, 384399, 186615, 3390, 1674, 681, 324, NULL, NULL, 1131, 242, 956, 456, 678, 318, NULL, NULL, 8, 9),
(70, 5, 255, 178735, 89270, 4725, 2425, 819, 300, NULL, NULL, 625, 242, 1017, 405, 1081, 720, NULL, NULL, 5, 9),
(71, 5, 367, 181904, 90146, 2437, 1187, 527, 225, NULL, NULL, 1003, 135, 1173, 609, 671, 375, NULL, NULL, 3, 9),
(72, 4, 197, 117367, 58434, 1771, 862, 217, 53, NULL, NULL, 196, 51, 804, 505, 400, 97, NULL, NULL, 15, 9),
(73, 7, 470, 312108, 155754, 3019, 1495, 598, 237, NULL, NULL, 760, 120, 67, 41, 121, 62, 312018, 15655, 4, 9),
(74, 10, 643, 708162, 356094, 4634, 1934, 962, 425, NULL, NULL, 1550, 296, 221, 79, 82, 42, 712455, 357732, 16, 9),
(75, 10, 574, 413568, 208922, 4363, 2177, 665, 279, NULL, NULL, 619, 151, 639, 291, 338, 161, 417567, 210950, 12, 9),
(76, 10, 727, 301876, 146800, 525, 200, 77, 36, NULL, NULL, 78, 5, 253, 100, 375, 55, 301876, 146800, 7, 9),
(77, 5, 93, 88494, 43512, 2196, 1172, 255, 103, NULL, NULL, 241, 32, 676, 367, 301, 185, NULL, NULL, 18, 9),
(78, 8, 579, 410522, 207206, 2610, 1361, 686, 298, NULL, NULL, 728, 155, 1344, 607, 1094, 519, NULL, NULL, 14, 9),
(79, 7, 522, 185864, 91697, 883, 425, 286, 111, NULL, NULL, 143, 27, 98, 23, 209, 69, NULL, NULL, 2, 9),
(80, 9, 481, 826807, 409961, 7403, 3708, 1816, 782, NULL, NULL, 1874, 502, 4351, 2147, 2220, 1096, 831663, 411726, 1, 10),
(81, 7, 516, 187838, 92660, 394, 163, 1076, 457, NULL, NULL, 492, 38, 1, 0, 5, 5, 187338, 92100, 2, 10),
(82, 5, 367, 184092, 91159, 2087, 1157, 445, 200, NULL, NULL, 668, 137, 1651, 853, 1053, 511, 186332, 92458, 3, 10),
(83, 7, 472, 316848, 158311, 4025, 2132, 918, 407, NULL, NULL, 1427, 206, 2580, 1222, 1582, 792, 320953, 160466, 4, 10),
(84, 4, 248, 183126, 90994, 1379, 758, 289, 109, NULL, NULL, 373, 58, 566, 247, 111, 63, 184671, 91827, 5, 10),
(85, 12, 755, 451245, 220169, 3869, 1958, 1026, 422, NULL, NULL, 1154, 217, 1241, 648, 1180, 647, 454110, 221681, 6, 10),
(86, 10, 723, 305041, 149038, 1740, 921, 327, 151, NULL, NULL, 382, 55, 6, 4, 235, 102, 303823, 148436, 7, 10),
(87, 7, 477, 264139, 129758, 3061, 1345, 462, 196, NULL, NULL, 624, 105, 507, 263, 394, 273, 266839, 130948, 9, 10),
(88, 11, 431, 387386, 188103, 3103, 1610, 1147, 487, NULL, NULL, 1459, 270, 1106, 455, 771, 336, 389671, 189344, 8, 10),
(89, 11, 433, 448691, 226557, 3855, 1817, 1239, 515, NULL, NULL, 1494, 277, 1258, 698, 965, 524, 451600, 228033, 10, 10),
(90, 7, 291, 311125, 154164, 4766, 2551, 1079, 464, NULL, NULL, 1310, 242, 1242, 614, 402, 236, 316076, 156629, 11, 10),
(91, 10, 641, 722070, 320197, 4507, 2264, 1352, 557, NULL, NULL, 1445, 271, 165, 67, 49, 23, 725992, 322162, 16, 10),
(92, 10, 572, 417605, 211343, 4620, 2203, 1031, 356, NULL, NULL, 663, 165, 337, 121, 263, 125, 421268, 213186, 12, 10),
(93, 5, 89, 93002, 46783, 1310, 676, 127, 56, NULL, NULL, 299, 52, 1891, 994, 247, 140, NULL, NULL, 18, 10),
(94, 7, 514, 190662, 94170, 2380, 1137, 916, 410, 10, NULL, 562, 100, 69, 31, 526, 272, 190662, 94170, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `stat_position`
--

CREATE TABLE `stat_position` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_position`
--

INSERT INTO `stat_position` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2018-03-14 08:51:21', 1, 1, 1),
(3, '2018-05-14 09:23:34', 1, 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `stat_position_detail`
--

CREATE TABLE `stat_position_detail` (
  `id` int(11) NOT NULL,
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
  `stat_position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_position_detail`
--

INSERT INTO `stat_position_detail` (`id`, `position1_total`, `position1_women`, `position2_total`, `position2_women`, `position3_total`, `position3_women`, `position4_total`, `position4_women`, `position5_total`, `position5_women`, `position6_total`, `position6_women`, `position7_total`, `position7_women`, `position8_total`, `position8_women`, `officer_level_id`, `stat_position_id`) VALUES
(1, 0, 0, 25, 6, 41, 12, 226, 33, 369, 67, 450, 160, 87, 24, 94, 37, 1, 2),
(2, 0, 0, 10, 3, 11, 0, 47, 6, 124, 24, 103, 44, 10, 3, 15, 8, 2, 2),
(3, 0, 0, 0, 0, 1, 0, 137, 18, 185, 24, 326, 111, 77, 21, 79, 29, 3, 2),
(4, 0, 0, 15, 3, 29, 12, 42, 9, 60, 19, NULL, 21, 5, 0, 0, 0, 1, 3),
(5, 0, 0, 10, 3, 11, 0, 47, 6, 124, 24, 103, 44, 10, 3, 15, 8, 2, 3),
(6, 0, 0, 0, 0, 1, 0, 137, 18, 185, 24, 326, 111, 77, 21, 79, 29, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion`
--

CREATE TABLE `stat_religion` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion`
--

INSERT INTO `stat_religion` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(3, '2018-09-18 09:34:28', 1, 1, 1),
(6, '2019-05-28 16:51:18', 1, 12, 21),
(7, '2018-06-14 09:22:37', 1, 9, 21),
(8, '2019-05-31 04:51:22', 1, 2, 26),
(9, '2019-07-29 04:42:06', 1, 3, 34),
(10, '2020-02-27 04:03:05', 1, 4, 18);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_detail`
--

CREATE TABLE `stat_religion_detail` (
  `id` int(11) NOT NULL,
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
  `remark` text DEFAULT NULL,
  `stat_religion_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion_detail`
--

INSERT INTO `stat_religion_detail` (`id`, `buddhis_total`, `buddhis_women`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `other_total`, `other_women`, `remark`, `stat_religion_id`, `province_id`) VALUES
(1, 779505, 404206, 8568, 4345, 725, 264, 1251, 669, 192, 85, 68, 29, NULL, NULL, '', 3, 1),
(2, 127286, 66247, 2840, 1934, 37, NULL, 663, 228, NULL, NULL, NULL, NULL, 12132, 5608, '', 3, 17),
(3, 769581, 390466, 18510, 9708, NULL, NULL, 2224, 1121, 35, 20, NULL, NULL, 48871, 23833, NULL, 3, 13),
(4, 61982, 31040, 6480, 3251, 721, 359, 2492, 1321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5),
(5, 54283, 27188, 1765, 835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120392, 58611, NULL, 3, 2),
(6, 37936, 18302, 1130, 570, 141, 78, NULL, NULL, NULL, NULL, NULL, NULL, 143194, 72836, NULL, 3, 3),
(7, 78517, 40396, 3752, 1986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 226167, 110232, NULL, 3, 4),
(8, 181213, 89571, 5839, 2896, 855, 421, 3319, 1607, NULL, NULL, NULL, NULL, 251819, 123442, NULL, 3, 6),
(9, 84123, 42025, 600, 294, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 222846, 110053, NULL, 3, 7),
(10, 279346, 135213, 2511, 1309, 187, 105, 862, 441, NULL, NULL, NULL, NULL, 104480, 51035, NULL, 3, 8),
(11, 124330, 56762, 4110, 2178, 750, 435, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '66721', 3, 9),
(12, 270793, 135715, 15472, 7861, 94, 46, 5108, 2404, NULL, NULL, NULL, NULL, 166556, 77164, NULL, 3, 10),
(13, 201722, 100966, 8958, 4412, 450, 244, 6110, 2518, 15, 8, NULL, NULL, 71734, 38638, NULL, 3, 11),
(14, 377089, 190057, 283, 168, 73, 40, 9017, 4611, NULL, NULL, NULL, NULL, 24985, 12349, NULL, 3, 12),
(15, 308601, 158663, 2241, 1161, 208, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 14),
(16, 37246, 20696, 608, 335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81471, 38620, NULL, 3, 15),
(17, NULL, NULL, 3554, 1790, 17188, 8642, 141, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 16),
(18, 127286, 66247, 2840, 1934, 37, NULL, 663, 228, NULL, NULL, NULL, NULL, 12132, 5608, NULL, 3, 18),
(21, 23, NULL, NULL, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 6, 1),
(22, 10000, 3000, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, 10, 5, NULL, 7, 1),
(23, 54524, 16218, 901, 427, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120116, 58295, NULL, 6, 2),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2),
(25, 100, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 4),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 7, 4),
(28, 176026, 84003, 7494, 3784, 1540, 797, 1526, 762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6),
(29, 177000, 85000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 6),
(30, 100, 20, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, 6, 7),
(31, 84123, 42025, 600, 294, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 222846, 110053, NULL, 7, 7),
(32, 301509, 149319, 1061, 574, 1450, 741, 1216, 594, NULL, NULL, 214, 100, 76935, 36899, NULL, 7, 8),
(48, 124330, 56762, 4110, 2178, 750, 435, NULL, NULL, NULL, NULL, NULL, NULL, 82228, 66721, NULL, 8, 9),
(49, 279346, 135213, 2511, 1309, 187, 105, 862, 441, NULL, NULL, NULL, NULL, 104480, 51035, NULL, 8, 8),
(50, NULL, NULL, 608, 335, 0, 0, 0, 0, 0, 0, 0, 0, 81471, 38620, NULL, 8, 15),
(51, 181213, 89571, 5839, 2896, 855, 421, 3319, 1607, 0, 0, 0, 0, 251819, 123442, NULL, 8, 6),
(52, 769581, 390466, 18510, 9708, NULL, NULL, 2224, 1121, 35, 20, NULL, NULL, 48871, 23833, NULL, 8, 13),
(53, 56123, 27807, 1064, 522, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 125744, 61749, NULL, 8, 2),
(54, 37936, 18302, 1130, 570, 141, 78, NULL, 0, 0, 0, 0, 0, 143194, 72836, NULL, 8, 3),
(55, 201722, 100966, 8958, 4412, 450, 244, 6110, 2518, 15, 8, NULL, NULL, 71734, 38638, NULL, 8, 11),
(56, 78517, 41396, 3752, 1986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 226167, 110232, NULL, 8, 4),
(57, 84123, 42025, 600, 233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82228, 66721, NULL, 8, 7),
(58, 680750, 34843, 5895, 2919, 186, 98, 15577, 7908, NULL, NULL, NULL, NULL, 1384, 655, NULL, 8, 16),
(59, 127286, 66247, 2840, 1934, 37, 0, 663, 228, NULL, NULL, NULL, NULL, 12132, 5608, NULL, 8, 17),
(60, 383103, 193744, 464, 243, 73, 40, 9015, 4657, NULL, NULL, NULL, NULL, 24985, 12306, NULL, 8, 12),
(61, 2020023, 9893, 2960, 1472, 170, 74, 342, 160, 0, 0, 0, 0, 12132, 5608, NULL, 8, 18),
(62, 270793, 135715, 15472, 7861, 94, 46, 5108, 2404, NULL, NULL, NULL, NULL, 166556, 77164, NULL, 8, 10),
(63, 308601, 158663, 2241, 1161, 208, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 14),
(64, 779505, 404206, 8568, 4345, 725, 264, 1251, 0, 192, 85, 68, 29, NULL, NULL, NULL, 8, 1),
(65, 67519, NULL, 3554, 1790, 17188, 8642, 141, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 16),
(66, 377089, 190057, 283, 168, 73, 40, 9017, 4611, NULL, NULL, NULL, NULL, 24985, 12306, NULL, 9, 12),
(67, 201722, 100966, 8958, 4414, 450, 244, 6110, 2518, 15, 8, 0, 0, 71734, 38638, NULL, 9, 11),
(68, 779505, 404206, 8568, 4345, 725, 264, 1251, 669, 192, 85, 68, 29, NULL, NULL, NULL, 9, 1),
(69, 57967, 29005, 1203, 571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 143194, 72836, NULL, 9, 2),
(70, 37936, 18302, 1130, 570, 141, 78, NULL, NULL, NULL, NULL, NULL, NULL, 143194, 72836, NULL, 9, 3),
(71, 51746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 4),
(72, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 6),
(73, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 7),
(74, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 9),
(75, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 8),
(76, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 10),
(77, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 13),
(78, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 14),
(79, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15),
(80, 67519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 17),
(81, 23508, 12033, 4115, 2146, 97, 44, 668, 459, NULL, NULL, NULL, NULL, 64614, 32101, NULL, 9, 18),
(82, 67519, 33987, 9648, 3823, 752, 402, 795, NULL, NULL, NULL, NULL, NULL, 102974, 51746, NULL, 9, 5),
(83, 22, 0, 336, NULL, 12, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 5),
(84, 57321, 28881, 1811, 850, 1811, 850, NULL, NULL, NULL, NULL, NULL, NULL, 131532, 64429, NULL, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_place`
--

CREATE TABLE `stat_religion_place` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion_place`
--

INSERT INTO `stat_religion_place` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-09-18 09:52:20', 1, 1, 1),
(2, '2018-06-14 09:31:50', 1, 21, 12),
(3, '2018-06-14 08:25:20', 1, 21, 9),
(5, '2019-05-28 16:57:39', 1, 26, 2),
(6, '2019-07-29 04:39:58', 1, 34, 3),
(7, '2020-03-03 03:45:09', 1, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_place_detail`
--

CREATE TABLE `stat_religion_place_detail` (
  `id` int(11) NOT NULL,
  `buddhis_total` int(11) DEFAULT NULL,
  `buddhis_nomonk` int(11) DEFAULT NULL,
  `buddhis_monk` int(11) DEFAULT NULL,
  `buddhis_agreement_built_temple` int(11) DEFAULT NULL,
  `buddhis_no_agreement_built_temple` int(11) DEFAULT NULL,
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
  `remark` text DEFAULT NULL,
  `stat_religion_place_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion_place_detail`
--

INSERT INTO `stat_religion_place_detail` (`id`, `buddhis_total`, `buddhis_nomonk`, `buddhis_monk`, `buddhis_agreement_built_temple`, `buddhis_no_agreement_built_temple`, `buddhis_nosim`, `buddhis_sim`, `christ_news_total`, `christ_news_not`, `christ_sat_total`, `christ_sat_not`, `christ_cato_total`, `christ_cato_not`, `bahai_total`, `bahai_not`, `idslam_total`, `idslam_not`, `remark`, `stat_religion_place_id`, `province_id`) VALUES
(1, 680, 36, NULL, NULL, NULL, 198, 446, 14, 4, 1, NULL, 43, NULL, NULL, NULL, NULL, NULL, '', 1, 16),
(2, 596, 6, NULL, NULL, NULL, 91, 499, 10, 3, 1, 1, 2, 1, 1, NULL, 1, NULL, '', 1, 1),
(3, 150, 6, NULL, NULL, NULL, 51, 91, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2),
(4, 61, 2, NULL, NULL, NULL, 2, 57, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3),
(5, 117, 6, NULL, NULL, NULL, 30, 81, 14, 14, 4, 4, 7, 7, NULL, NULL, NULL, NULL, NULL, 1, 5),
(6, 90, 25, NULL, NULL, NULL, NULL, 56, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 4),
(7, 321, 95, NULL, NULL, NULL, 65, 161, 25, 20, 1, NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, 1, 6),
(8, 147, 14, NULL, NULL, NULL, 96, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 7),
(9, 298, 51, NULL, NULL, NULL, 81, 166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 8),
(10, 204, 75, NULL, NULL, NULL, 60, 69, 18, 18, 11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 9),
(11, 202, 29, NULL, NULL, NULL, 97, 76, 4, 4, 1, 1, 13, 13, 1, 1, NULL, NULL, NULL, 1, 11),
(12, 73, 32, NULL, NULL, NULL, 14, 27, 1, 1, NULL, NULL, 20, 20, NULL, NULL, NULL, NULL, NULL, 1, 12),
(13, 900, 62, NULL, NULL, NULL, 424, 414, 28, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 13),
(14, 358, 39, 319, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14),
(15, 53, NULL, NULL, NULL, NULL, 28, 25, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 17),
(16, 13, 6, NULL, NULL, NULL, 2, 5, 6, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 18),
(17, 16, 12, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15),
(18, 6, 4, NULL, NULL, NULL, 0, 2, 7, 2, 1, 0, 4, NULL, 2, NULL, 3, NULL, NULL, 1, 10),
(19, 4, 3, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 2, 1),
(20, 10, 3, NULL, NULL, NULL, NULL, 3, 1, NULL, 1, NULL, 1, NULL, 1, NULL, 1, NULL, NULL, 3, 1),
(22, 10, 5, NULL, NULL, NULL, NULL, 5, 5, 2, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, 2, 2),
(23, 50, 20, NULL, NULL, NULL, NULL, 25, 20, 10, 20, 10, 20, 10, 20, 10, 20, 10, NULL, 3, 3),
(25, 100, NULL, NULL, NULL, NULL, 30, 70, NULL, NULL, 10, 3, NULL, NULL, 10, NULL, NULL, NULL, NULL, 2, 4),
(26, 100, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 10, NULL, 10, NULL, 10, NULL, 10, NULL, NULL, 3, 4),
(29, 321, 95, NULL, NULL, NULL, 65, 161, 25, 20, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6),
(30, 100, NULL, NULL, NULL, NULL, 50, 50, NULL, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, 3, 6),
(32, 147, NULL, NULL, NULL, NULL, 96, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 7),
(33, 147, 14, NULL, NULL, NULL, 96, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 7),
(34, 100, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, 2, 8),
(48, 177, 24, 153, 60, 117, 69, 108, 5, 5, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 9),
(49, 18, NULL, 18, 18, NULL, 13, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 15),
(50, 304, 60, 244, NULL, NULL, 123, 181, 3, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 8),
(51, 316, 88, 228, 0, 0, 122, 194, 79, 79, 11, 11, 19, 19, NULL, NULL, NULL, NULL, NULL, 5, 6),
(52, 397, 70, 327, 0, 0, 0, 0, 31, 8, 0, 0, 8, 1, 0, 0, 0, 0, NULL, 5, 10),
(53, 148, 109, 39, NULL, NULL, 36, 112, 1064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 2),
(54, 68, 1, 67, 42, 26, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 5, 3),
(55, 95, 25, 70, 2, 93, 24, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 4),
(56, 748, 30, 718, NULL, NULL, 350, 398, 12, NULL, 1, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, 5, 16),
(57, 147, 14, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 7),
(58, 55, 2, 53, 31, 24, NULL, NULL, 10, 10, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 5, 17),
(59, 23, 5, 18, 0, 0, 0, 0, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 5, 18),
(60, 467, 105, 362, 79, 388, 352, 115, 1, 1, NULL, NULL, 21, 16, NULL, NULL, NULL, NULL, NULL, 5, 12),
(61, 358, 39, 319, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 14),
(62, 560, 37, 523, NULL, NULL, NULL, NULL, 10, 1, 1, 1, 2, 1, 1, 0, 1, 0, NULL, 5, 1),
(63, 121, 12, 109, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 5, 5),
(64, 832, 67, 765, NULL, NULL, NULL, NULL, 29, 20, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, 5, 13),
(65, 223, 20, 203, 3, 220, 147, 76, 6, NULL, 3, NULL, 13, 11, 1, NULL, NULL, NULL, NULL, 5, 11),
(66, 760, 26, 734, 10, NULL, 340, 420, 14, NULL, 1, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, 6, 16),
(67, 467, 105, 362, 79, 388, 352, 115, 1, 1, 0, 0, 21, 16, 0, 0, 0, 0, NULL, 6, 12),
(68, 225, 19, 445, 4, 221, 0, 76, 6, 6, 2, 2, 14, 0, 1, 0, 0, 0, NULL, 6, 11),
(69, 560, 37, 523, NULL, NULL, NULL, NULL, 10, 1, 1, 1, 2, 1, 1, 0, 1, 0, NULL, 6, 1),
(70, 148, 109, 39, NULL, NULL, 27, 113, 7, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 2),
(71, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 3),
(72, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 5),
(73, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 4),
(74, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 6),
(75, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 7),
(76, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 8),
(77, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 10),
(78, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13),
(79, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14),
(80, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15),
(81, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 17),
(82, 21, 3, 0, 2, 2, NULL, 1, 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 18),
(83, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 9),
(84, 148, NULL, 45, 8, NULL, NULL, 67, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_teacher`
--

CREATE TABLE `stat_religion_teacher` (
  `id` int(11) NOT NULL,
  `last_update` date NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion_teacher`
--

INSERT INTO `stat_religion_teacher` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-09-18', 1, 1, 1),
(2, '2018-06-27', 1, 21, 12),
(3, '2018-06-14', 1, 21, 9),
(5, '2019-05-28', 1, 27, 2),
(6, '2019-07-29', 1, 34, 3),
(7, '2020-02-27', 1, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stat_religion_teacher_detail`
--

CREATE TABLE `stat_religion_teacher_detail` (
  `id` int(11) NOT NULL,
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
  `remark` text DEFAULT NULL,
  `christ_novice_total` int(11) DEFAULT NULL,
  `christ_novice_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_religion_teacher_detail`
--

INSERT INTO `stat_religion_teacher_detail` (`id`, `stat_religion_teacher_id`, `buddhis_monk`, `buddhis_novice`, `buddhis_dad`, `buddhis_mom`, `buddhis_boy`, `christ_news_total`, `christ_news_women`, `christ_sat_total`, `christ_sat_women`, `christ_cato_total`, `christ_cato_women`, `bahai_total`, `bahai_women`, `idslam_total`, `idslam_women`, `province_id`, `remark`, `christ_novice_total`, `christ_novice_women`) VALUES
(1, 1, 2770, 3712, 5, 213, 215, 24, 3, 4, 1, 6, 2, 2, 0, 0, 0, 1, '', NULL, NULL),
(2, 1, 192, 492, 0, 2, 6, 39, 5, 0, 0, 0, 0, 0, 0, 0, 0, 17, '', NULL, NULL),
(3, 1, 93, 503, 0, 0, 10, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 3, NULL, NULL, NULL),
(4, 1, 52, 130, 0, 0, NULL, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, NULL, NULL),
(5, 1, 551, 456, 0, 0, 0, 34, 2, 0, 0, 0, 0, 0, 0, 0, 0, 4, NULL, NULL, NULL),
(6, 1, 211, 666, 18, 30, 10, 28, 2, 6, 1, 8, 0, 0, 0, 0, 0, 5, NULL, NULL, NULL),
(7, 1, 112, 55, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, NULL, NULL, NULL),
(8, 1, 648, 1106, 0, 23, 4, 16, 0, 0, 0, 4, 0, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(9, 1, 200, 134, 183, 0, 0, 37, 2, 14, 0, 0, 0, 0, 0, 0, 0, 9, NULL, NULL, NULL),
(10, 1, 587, 576, 1, 37, 16, 85, 14, 2, 0, 49, 5, 0, 0, 0, 0, 10, NULL, NULL, NULL),
(11, 1, 346, 470, 1, 0, 2, 13, 2, 3, 2, 23, 15, 2, 0, 0, 0, 11, NULL, NULL, NULL),
(12, 1, 322, 302, 0, 20, 4, 22, 3, 0, 0, 40, 26, 0, 0, 0, 0, 12, NULL, NULL, NULL),
(13, 1, 413, 517, 0, 33, 6, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, NULL, NULL, NULL),
(14, 1, 28, 90, 0, 5, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, NULL, NULL, NULL),
(15, 1, 26, 41, 0, 0, 4, 26, 5, 0, 0, 0, 0, 0, 0, 0, 0, 18, NULL, NULL, NULL),
(16, 1, 355, 1621, 15, 17, 25, 51, 3, 3, 1, 5, 1, 4, 4, 8, 7, 6, NULL, NULL, NULL),
(17, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(18, 2, 10, 5, NULL, NULL, NULL, 1, NULL, 1, NULL, 1, 0, 1, NULL, 1, NULL, 1, NULL, 2, 1),
(19, 3, 15, NULL, NULL, NULL, NULL, 2, NULL, 2, NULL, 2, NULL, 2, NULL, 2, NULL, 1, NULL, NULL, NULL),
(21, 2, 55, 157, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(22, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(23, 3, 53, 540, NULL, NULL, NULL, 1136, 571, 141, 78, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(27, 3, 211, 666, 18, 30, 10, 28, 2, 6, 1, 8, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(29, 2, 373, 1289, NULL, 23, 7, 78, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(30, 2, 112, 55, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(31, 3, 112, 55, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(32, 2, 100, 20, NULL, NULL, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(33, 3, 304, 1201, NULL, 24, 25, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(47, 5, 648, 1106, 0, 23, 4, 16, 0, 0, 0, 4, 0, NULL, NULL, NULL, NULL, 8, NULL, 0, 0),
(48, 5, 636, 591, 24, 64, 21, 7599, 3842, 88, 42, 138, 37, 0, 0, 0, 0, 10, NULL, 0, 0),
(49, 5, 355, 1621, 15, 17, 25, 51, 3, 3, 1, 5, 1, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(50, 5, 53, 132, NULL, NULL, NULL, 1064, 522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(51, 5, 53, 540, NULL, NULL, 0, 1136, 571, 141, 78, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(52, 5, 77, 356, NULL, NULL, NULL, 47, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(53, 5, 1438, 2080, 5, 90, 129, 47, 7, 8, 1, 50, 12, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(54, 5, 200, 534, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(55, 5, 214, 585, 0, 1, 1, 2840, 1934, 37, 0, 269, 138, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL),
(56, 5, 30, 46, 0, 0, 13, 28, 17, 3, 0, 3, 0, 0, 0, 0, 0, 18, NULL, 0, 0),
(57, 5, 519, 592, NULL, 16, 8, 32, 9, 12, 0, 40, 15, NULL, NULL, NULL, NULL, 12, NULL, 40, 34),
(58, 5, 410, 569, NULL, 1, 2, 13, 5, 2, NULL, 43, NULL, 1, NULL, NULL, NULL, 11, NULL, 35, NULL),
(59, 5, 212, 682, 7, 21, 13, 59, 7, 23, 0, 4, 0, 0, 0, 0, 0, 5, NULL, 0, 0),
(60, 5, 413, 517, NULL, 33, 6, 8, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(61, 5, 47, 123, NULL, 7, 3, 36, 16, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL),
(62, 5, 2770, 3712, 5, 213, 215, 24, 3, 4, 1, 6, 2, 2, 0, 0, 0, 1, NULL, NULL, NULL),
(63, 5, 204, 188, NULL, NULL, 252, 31, 4, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(64, 5, 1629, 1888, 10, 86, 87, 69, 8, NULL, NULL, 28, 8, NULL, NULL, NULL, NULL, 13, NULL, 25, 8),
(65, 6, 1783, 2611, 5, 70, 58, 91, 28, 7, 1, 75, 18, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(66, 6, 519, 592, 0, 16, 8, 32, 9, 12, 0, 40, 15, 0, 0, 0, 0, 12, NULL, 40, 34),
(67, 6, 445, 592, 0, 1, 2, 13, 1, 4, 1, 43, 0, 1, 0, 0, 0, 11, NULL, 14, 13),
(68, 6, 2770, 3712, 5, 213, 215, 24, 3, 4, 1, 6, 2, 2, 0, 0, 0, 1, NULL, NULL, NULL),
(69, 6, 45, 179, 0, 0, 0, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL),
(70, 6, 53, 540, 0, 0, 0, 1136, 571, 141, 78, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(71, 6, 212, 682, 7, 21, 13, 59, 7, 23, 0, 4, 0, NULL, NULL, NULL, NULL, 5, NULL, 0, 0),
(72, 6, 77, 356, NULL, NULL, NULL, 47, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(73, 6, 355, 1621, 15, 17, 25, 51, 3, 3, 1, 5, 1, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(74, 6, 112, 55, 0, 0, 13, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(75, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(76, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(77, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(78, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(79, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(80, 6, 648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL),
(81, 6, 49, 38, 0, 0, 6, 31, 0, 0, 0, 1, 1, NULL, NULL, NULL, NULL, 18, NULL, 0, 0),
(82, 7, 60, 175, 0, 0, 0, 1811, 80, 1811, 850, 3, 0, NULL, NULL, NULL, NULL, 2, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stat_research`
--

CREATE TABLE `stat_research` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_research`
--

INSERT INTO `stat_research` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2018-05-14 04:59:17', 1, 1, 1),
(2, '2019-05-31 05:12:51', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_research_detail`
--

CREATE TABLE `stat_research_detail` (
  `id` int(11) NOT NULL,
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
  `dornor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_research_detail`
--

INSERT INTO `stat_research_detail` (`id`, `stat_research_id`, `title`, `total`, `women`, `start_date`, `end_date`, `attendance`, `times`, `place`, `remark`, `goverment`, `dornor`) VALUES
(1, 1, 'ຄວາມຮູ້ພື້ນຖານການເປັນນັກຄົ້ນຄວ້າທີ່ດີ', 22, 7, '2016-07-04 00:00:00', '2016-07-06 00:00:00', 'ກົມພັດທະນາການບໍລິຫານລັດ, ກົມການປົກຄອງທ້ອງຖິ່ນ', 1, 'ສວປຝ', '', NULL, NULL),
(4, 1, 'ຄວາມຮູ້ພື້ນຖານການເປັນນັກຄົ້ນຄວ້າທີ່ດີ', NULL, NULL, '2016-07-13 00:00:00', '2016-07-15 00:00:00', 'ກົມພັດທະນາການບໍລິຫານລັດ, ກົມການປົກຄອງທ້ອງຖິ່ນ', 1, 'ສວປຝ', NULL, NULL, NULL),
(5, 1, 'ຄວາມຮູ້ພື້ນຖານການເປັນນັກຄົ້ນຄວ້າທີ່ດີ', NULL, NULL, '2016-10-05 00:00:00', '2016-10-07 00:00:00', 'ກົມພັດທະນາການບໍລິຫານລັດ, ກົມການປົກຄອງທ້ອງຖິ່ນ', 1, 'ສວປຝ', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stat_resign`
--

CREATE TABLE `stat_resign` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_resign`
--

INSERT INTO `stat_resign` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-10-10 15:36:58', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_resign_detail`
--

CREATE TABLE `stat_resign_detail` (
  `id` int(11) NOT NULL,
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
  `ministry_women` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `stat_single_gateway_implementation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_single_gateway_implementation`
--

INSERT INTO `stat_single_gateway_implementation` (`id`, `user_id`, `phiscal_year_id`, `last_update`, `saved`) VALUES
(1, 1, 1, '2018-03-19 16:13:59', 1),
(2, 17, 2, '2019-05-28 16:50:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_single_gateway_implementation_detail`
--

CREATE TABLE `stat_single_gateway_implementation_detail` (
  `id` int(11) NOT NULL,
  `stat_single_gateway_implementation_id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_single_gateway_implementation_detail`
--

INSERT INTO `stat_single_gateway_implementation_detail` (`id`, `stat_single_gateway_implementation_id`, `start_date`, `name`, `remark`, `ministry_id`) VALUES
(1, 1, NULL, '', 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 1),
(2, 1, NULL, '', 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 2),
(4, 1, '2017-01-01 00:00:00', '', 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 4),
(5, 1, '2017-01-01 00:00:00', '', 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 5),
(6, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 3),
(7, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 6),
(8, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 25),
(9, 1, '1970-01-01 00:00:00', NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 26),
(10, 1, '1970-01-01 00:00:00', NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 27),
(11, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 28),
(12, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 29),
(13, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 30),
(14, 1, '2011-10-10 00:00:00', 'ຫ້ອງການບໍລິການລົງທຶນປະຕູດຽວ ກົມສົ່ງເສີມການລົງທຶນ', 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 31),
(15, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 32),
(16, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 33),
(17, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 34),
(18, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 35),
(19, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 36),
(20, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 37),
(21, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 38),
(22, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 39),
(23, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 40),
(24, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 41),
(25, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 42),
(26, 1, '1970-01-01 00:00:00', NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 52),
(27, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 53),
(28, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 54),
(29, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 55),
(30, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 56),
(31, 1, '1970-01-01 00:00:00', NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 57),
(32, 1, NULL, NULL, 'ບໍ່ທັນຈັດຕັ້ງປະຕິບັດ', 62),
(33, 2, '2019-04-30 00:00:00', 'ສູນບໍລີການຜ່ານປະຕູດຽວ', NULL, 31);

-- --------------------------------------------------------

--
-- Table structure for table `stat_single_window`
--

CREATE TABLE `stat_single_window` (
  `id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_single_window_detail`
--

CREATE TABLE `stat_single_window_detail` (
  `id` int(11) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `ministry_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `deleted` int(11) DEFAULT 0,
  `stat_single_window_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_ministry`
--

CREATE TABLE `stat_victorycoin_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victorycoin_ministry`
--

INSERT INTO `stat_victorycoin_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(1, '2018-03-05 17:11:39', 1, 1, 1),
(2, '2018-05-14 05:52:11', 1, 5, 12),
(4, '2019-06-25 10:21:19', 1, 1, 2),
(6, '2019-08-05 03:35:24', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_ministry_detail`
--

CREATE TABLE `stat_victorycoin_ministry_detail` (
  `id` int(11) NOT NULL,
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
  `ministry_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victorycoin_ministry_detail`
--

INSERT INTO `stat_victorycoin_ministry_detail` (`id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `stat_victorycoin_ministry_id`, `award_id`, `ministry_id`) VALUES
(1, 1, NULL, 3, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, 46, 7, 418, 51, 604, 396, 1, 1, 1, NULL, 1, NULL, '', 1, 2, 1),
(2, 0, NULL, 3, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 6, 28, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 3),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 1, 325, 23, 412, 344, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 6, 25),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 2, 20, 1, 33, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 6, 39),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 14, 1, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 38),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 53),
(7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 9, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 29),
(8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 30),
(9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 28),
(10, NULL, NULL, 3, NULL, 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 6, 28, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 6, 3),
(11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 25),
(12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 30),
(13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 33),
(14, 35, 5, 47, 10, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 6),
(15, 1, 1, 7, NULL, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 39),
(16, NULL, NULL, 21, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 38),
(17, NULL, NULL, 26, NULL, 46, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 26, NULL, 46, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 29),
(18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 10, 97, 5, 200, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 1),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 32),
(20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 28),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 11, 1, 104, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 54),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 53),
(23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 4, 74, 13, 144, 6, 1, NULL, 1, NULL, NULL, NULL, NULL, 6, 6, 25);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_province`
--

CREATE TABLE `stat_victorycoin_province` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victorycoin_province`
--

INSERT INTO `stat_victorycoin_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 10:15:49', 1, 1, 1),
(2, '2018-05-14 05:12:42', 1, 12, 5),
(8, '2019-10-21 05:18:55', 1, 2, 1),
(9, '2019-08-05 04:06:57', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victorycoin_province_detail`
--

CREATE TABLE `stat_victorycoin_province_detail` (
  `id` int(11) NOT NULL,
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
  `award_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victorycoin_province_detail`
--

INSERT INTO `stat_victorycoin_province_detail` (`id`, `stat_victorycoin_province_id`, `province_id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `award_id`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 187, 209, 664, 454, 1576, 679, NULL, NULL, NULL, 1, NULL, 3, NULL, 6),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 30, 21, 43, 31, 62, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6),
(3, 8, 1, 6, 23, 36, 23, 1, 25, 25, 36, 96, 24, 36, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(4, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 8, 143, 17, NULL, NULL, NULL, NULL, NULL, 2, NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_ministry`
--

CREATE TABLE `stat_victoryoversea_ministry` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victoryoversea_ministry`
--

INSERT INTO `stat_victoryoversea_ministry` (`id`, `last_update`, `saved`, `user_id`, `phiscal_year_id`) VALUES
(2, '2017-09-16 12:41:18', 1, 1, 1),
(4, '2019-08-05 03:49:21', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_ministry_detail`
--

CREATE TABLE `stat_victoryoversea_ministry_detail` (
  `id` int(11) NOT NULL,
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
  `award_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victoryoversea_ministry_detail`
--

INSERT INTO `stat_victoryoversea_ministry_detail` (`id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`, `stat_victoryoversea_ministry_id`, `ministry_id`, `award_id`) VALUES
(1, NULL, NULL, 13, 15, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 126, 1, 101, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'dd', 47, 22, 2, 1, 2),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aa', 2, 1, 2, 2, 6),
(3, NULL, 1, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 8, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_province`
--

CREATE TABLE `stat_victoryoversea_province` (
  `id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `saved` int(11) NOT NULL,
  `phiscal_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victoryoversea_province`
--

INSERT INTO `stat_victoryoversea_province` (`id`, `last_update`, `saved`, `phiscal_year_id`, `user_id`) VALUES
(1, '2017-09-16 14:56:23', 1, 1, 1),
(2, '2018-05-14 06:05:34', 1, 12, 5),
(3, '2019-08-05 05:26:27', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stat_victoryoversea_province_detail`
--

CREATE TABLE `stat_victoryoversea_province_detail` (
  `id` int(11) NOT NULL,
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
  `frien_team` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stat_victoryoversea_province_detail`
--

INSERT INTO `stat_victoryoversea_province_detail` (`id`, `stat_victoryoversea_province_id`, `province_id`, `award_id`, `free1_personal`, `free1_team`, `free2_personal`, `free2_team`, `free3_personal`, `free3_team`, `revo1_personal`, `revo1_team`, `revo2_personal`, `revo2_team`, `revo3_personal`, `revo3_team`, `labo1_personal`, `labo1_team`, `labo2_personal`, `labo2_team`, `labo3_personal`, `labo3_team`, `deve1_personal`, `deve1_team`, `deve2_personal`, `deve2_team`, `deve3_personal`, `deve3_team`, `remark`, `frien_personal`, `frien_team`) VALUES
(1, 1, 1, 2, 99, 88, 77, 66, 55, 44, 33, 22, 11, 9, 8, 7, 6, 553, 2, 1, NULL, 5, 9, 9, NULL, 7, 6, 5, 'lk', 7, 8),
(2, 1, 9, 5, 8, 6, 6, NULL, 0, 7, 5, 3, 2, 5, 8, 9, 5, NULL, 2, 45, 7, 9, 8, 4, 3, 6, 9, 9, '3', 7, 4),
(3, 2, 3, 6, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(4, 3, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 367, NULL, 8988, NULL, 345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'A',
  `tel` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `input_dt_stamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`, `role_id`, `user_id`, `input_dt_stamp`) VALUES
(1, 'admin', 'admin', 'Administrator', '', 'A', '', NULL, 0, 1, NULL, '2017-10-14 16:32:15'),
(2, 'DCSM', '123', 'ກົມຄຸ້ມຄອງລັດຖະກອນ', '.....', 'A', '020', '...', 0, 3, 1, '2017-10-25 23:56:01'),
(3, 'DER', '021222368', 'ກົມຊົນເຜົ່າ ແລະ ສາສະໜາ', '.....', 'A', '020', '.....', 0, 5, 37, '2017-10-26 23:35:12'),
(4, 'DPC', '123', 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 'MoHA', 'A', '213646', '.....', 0, 4, 1, '2017-11-01 01:51:22'),
(5, 'DCA', '123', 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 'MOHA', 'A', '020', '....', 0, 6, 1, '2018-03-15 15:02:09'),
(6, 'laty', '1234', 'ລາຕີ', 'ແກ້ວລັງສີ', 'A', '02022248280', '', 0, 4, 1, '2018-03-15 15:15:58'),
(7, 'MALA', '1234', 'ສົມມາລາ', 'ພົນເສນາ', 'A', '020', '.....', 0, 1, 1, '2018-03-15 15:16:04'),
(8, 'DOP', '123', 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 'MOHA', 'A', '020', '....', 0, 10, 1, '2018-03-19 15:37:52'),
(9, 'DPAD', '123', 'ກົມພັດທະນາການບໍລິຫານລັດ', 'MOHA', 'A', '020', '....', 0, 11, 1, '2018-03-20 13:47:20'),
(10, 'DOLA', '123', 'ກົມການປົກຄອງທ້ອງຖິ່ນ', 'MOHA', 'A', '020', '...', 0, 12, 1, '2018-03-20 13:52:28'),
(11, 'DNG', '1234', 'ກົມແຜນທີ່ແຫ່ງຊາດ', 'MOHA', 'A', '020', '....', 0, 13, 1, '2018-03-20 13:57:53'),
(12, 'DNA', '95526959', 'ກົມເອກະສານແຫ່ງຊາດ', 'MOHA', 'A', '020', '....', 0, 14, 37, '2018-03-20 14:04:12'),
(13, 'DCSED', '6789', 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 'MOHA', 'A', '020', '....', 0, 15, 1, '2018-03-21 09:30:01'),
(14, 'DCM', '5599', 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', 'MOHA', 'A', '020', '....', 0, 19, 1, '2018-03-21 13:44:52'),
(15, 'ASRIT', '123', 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', 'MOHA', 'A', '020', '....', 0, 21, 1, '2018-03-21 13:54:10'),
(16, 'CSM', '1234', 'ສູນສໍາຫຼວດວັດແທກ ແລະ ແຜນທີ່', 'MOHA', 'A', '020', '....', 0, 22, 1, '2018-03-21 14:01:03'),
(17, 'PHAITHOUN', '23405443', 'ໄພທູນ', 'ບຸດສະວົງ', 'A', '02059961563', 'phaithoun1992@gmail.com', 0, 1, 1, '2018-03-29 10:12:55'),
(18, 'PSL', '123', 'ແຂວງຜົ້ງສາລີ', 'ພະແນກພາຍໃນ', 'A', '020', '...', 0, 28, 1, '2018-03-29 10:24:29'),
(19, 'LNT', '123', 'ແຂວງຫຼວງນໍ້າທາ', 'ພະແນກພາຍໃນ', 'A', '020', '...', 0, 29, 1, '2018-04-02 09:46:05'),
(20, 'BK', '123', 'ແຂວງບໍ່ແກ້ວ', 'ພະແນກພາຍໃນ', 'A', '020', '...', 0, 25, 1, '2018-04-02 09:49:06'),
(21, 'VTE CAP', '123', 'ນະຄອນຫລວງວຽງຈັນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 46, 1, '2018-04-02 21:20:02'),
(22, 'VC', '123', 'ແຂວງວຽງຈັນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 1, 7, 37, '2018-04-02 21:22:20'),
(23, 'UDX', '123', 'ແຂວງອຸດົມໄຊ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 33, 1, '2018-04-02 21:30:10'),
(24, 'LPB', '123', 'ແຂວງຫລວງພະບາງ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 35, 1, '2018-04-02 21:31:14'),
(25, 'HP', '123', 'ແຂວງຫົວພັນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 34, 1, '2018-04-02 21:32:53'),
(26, 'XKH', '760', 'ແຂວງຊຽງຂວາງ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 37, 1, '2018-04-02 21:33:50'),
(27, 'XBL', '123', 'ແຂວງໄຊຍະບູລີ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 36, 1, '2018-04-02 21:34:37'),
(28, 'VTE', '123', 'ແຂວງວຽງຈັນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 47, 1, '2018-04-02 21:35:36'),
(29, 'BKX', '198449', 'ແຂວງບໍລິຄຳໄຊ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 38, 1, '2018-04-02 21:37:00'),
(30, 'KM', '22326262-kblor', 'ແຂວງຄຳມ່ວນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 39, 1, '2018-04-02 21:37:52'),
(31, 'SVK', '123456', 'ແຂວງສະຫວັນນະເຂດ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 40, 17, '2018-04-02 21:38:41'),
(32, 'SLV', '123456', 'ແຂວງສາລະວັນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 41, 17, '2018-04-02 21:39:59'),
(33, 'XK', '123456', 'ແຂວງເຊກອງ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 42, 17, '2018-04-02 21:43:28'),
(34, 'CPS', '123456', 'ແຂວງຈຳປາສັກ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 43, 17, '2018-04-02 21:44:28'),
(35, 'ATP', '123456', 'ແຂວງອັດຕະປື', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 44, 17, '2018-04-02 21:45:25'),
(36, 'XSB', '123', 'ແຂວງໄຊສົມບູນ', 'ພະແນກພາຍໃນ', 'A', '021', '', 0, 45, 1, '2018-04-02 21:46:17'),
(37, 'ຄານຊິດ', '13579', 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 'ກະຊວງພາຍໃນ', 'A', '021212545', 'khansith@hotmail.com', 0, 1, 1, '2018-04-06 15:57:20'),
(38, 'AAAAA', '123', 'TEST', 'TEST', 'A', '021', '', 1, 4, 37, '2018-04-10 18:42:46'),
(39, 'INS', '123', 'ກົມກວດກາ', 'ກະຊວງພາຍໃນ', 'A', '021', '', 0, 32, 1, '2018-05-14 11:20:23'),
(40, 'CBN', '123', 'ຫ້ອງການ', 'ກະຊວງພາຍໃນ', 'A', '021', '', 0, 31, 1, '2018-05-14 11:30:52'),
(41, 'khansith', '13579', 'khansith', 'Luangxay', 'A', '020 55535362', 'khansith@hotmail.com', 0, 1, 37, '2020-02-03 09:33:01'),
(42, 'Chanthachone', '1234567', 'ຈັນທະຈອນ', 'ສິມມາລາວົງ', 'A', '02055957587', '', 0, 1, 1, '2020-03-16 10:53:52');

-- --------------------------------------------------------

--
-- Table structure for table `user_has_branch`
--

CREATE TABLE `user_has_branch` (
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_branch`
--

INSERT INTO `user_has_branch` (`user_id`, `branch_id`) VALUES
(1, 12),
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
(3, 13),
(4, 12),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 13);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_province`
--

CREATE TABLE `user_has_province` (
  `user_id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_has_province`
--

INSERT INTO `user_has_province` (`user_id`, `province_id`) VALUES
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
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(20, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_role`
--

CREATE TABLE `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `set_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_subordinate`
--

CREATE TABLE `user_subordinate` (
  `user_id` int(11) NOT NULL,
  `subordinate_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_subordinate`
--

INSERT INTO `user_subordinate` (`user_id`, `subordinate_user_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(4, 1),
(4, 2),
(4, 3),
(20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `use_subcordinate`
--

CREATE TABLE `use_subcordinate` (
  `user_id` int(11) NOT NULL,
  `subcordinate_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accociation`
--
ALTER TABLE `accociation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_accociation_province1_idx` (`province_id`);

--
-- Indexes for table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`,`class_name`,`method`);

--
-- Indexes for table `approver`
--
ALTER TABLE `approver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_approver_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_approver_province1_idx` (`province_id`),
  ADD KEY `fk_approver_approver_level1_idx` (`approver_level_id`);

--
-- Indexes for table `approver_level`
--
ALTER TABLE `approver_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attachment_menu1_idx` (`menu_id`),
  ADD KEY `fk_attachment_user1_idx` (`user_id`),
  ADD KEY `fk_attachment_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_award_user1_idx` (`user_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_book_user1_idx` (`user_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_branch_user1_idx` (`user_id`),
  ADD KEY `fk_branch_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `content_code_uindex` (`code`);

--
-- Indexes for table `controller`
--
ALTER TABLE `controller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_district_province1_idx` (`province_id`),
  ADD KEY `fk_district_user` (`input_id`);

--
-- Indexes for table `ethnic`
--
ALTER TABLE `ethnic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `foundation`
--
ALTER TABLE `foundation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_foundation_province1_idx` (`province_id`);

--
-- Indexes for table `goverment_level`
--
ALTER TABLE `goverment_level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `goverment_unit`
--
ALTER TABLE `goverment_unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_goverment_unit_branch1_idx` (`branch_id`);

--
-- Indexes for table `legal`
--
ALTER TABLE `legal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_legal_legal_type1_idx` (`legal_type_id`);

--
-- Indexes for table `legal_status`
--
ALTER TABLE `legal_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `legal_type`
--
ALTER TABLE `legal_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_id_uindex` (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_menugroup1_idx` (`menugroup_id`),
  ADD KEY `fk_menu_menu1_idx` (`menu_parent_id`),
  ADD KEY `fk_menu_user_id` (`input_id`);

--
-- Indexes for table `menugroup`
--
ALTER TABLE `menugroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_menugroup_user_id` (`input_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`,`language`),
  ADD KEY `idx_message_language` (`language`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `ministry`
--
ALTER TABLE `ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ministry_ministry_group1_idx` (`ministry_group_id`),
  ADD KEY `fk_ministry_user1_idx` (`user_id`);

--
-- Indexes for table `ministry_group`
--
ALTER TABLE `ministry_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notice_user1_idx` (`user_id`);

--
-- Indexes for table `officer_level`
--
ALTER TABLE `officer_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_officer_level_user1_idx` (`user_id`);

--
-- Indexes for table `organisation`
--
ALTER TABLE `organisation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisation_group`
--
ALTER TABLE `organisation_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phiscal_year`
--
ALTER TABLE `phiscal_year`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `year_UNIQUE` (`year`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`province_name`),
  ADD KEY `fk_province_user` (`input_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `fk_role_user` (`user_id`);

--
-- Indexes for table `role_has_action`
--
ALTER TABLE `role_has_action`
  ADD PRIMARY KEY (`role_id`,`action_id`),
  ADD KEY `fk_role_has_action_action1_idx` (`action_id`),
  ADD KEY `fk_role_has_action_role1_idx` (`role_id`);

--
-- Indexes for table `role_has_menu`
--
ALTER TABLE `role_has_menu`
  ADD PRIMARY KEY (`role_id`,`menu_id`),
  ADD KEY `fk_role_has_menu_menu1_idx` (`menu_id`),
  ADD KEY `fk_role_has_menu_role1_idx` (`role_id`);

--
-- Indexes for table `salary_level`
--
ALTER TABLE `salary_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_salary_level_user1_idx` (`user_id`);

--
-- Indexes for table `source_message`
--
ALTER TABLE `source_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_source_message_category` (`category`);

--
-- Indexes for table `stat_3create`
--
ALTER TABLE `stat_3create`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stat_3create_detail`
--
ALTER TABLE `stat_3create_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_3create_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_aids`
--
ALTER TABLE `stat_aids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_aids_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_aids_user1_idx` (`user_id`);

--
-- Indexes for table `stat_association_foundation`
--
ALTER TABLE `stat_association_foundation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_association_foundation_user1_idx` (`user_id`),
  ADD KEY `fk_stat_association_foundation_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_association_foundation_detail`
--
ALTER TABLE `stat_association_foundation_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_association_foundation_detail_stat_association_foun_idx` (`stat_association_foundation_id`),
  ADD KEY `fk_stat_association_foundation_detail_approver1_idx` (`approver_id`);

--
-- Indexes for table `stat_contract`
--
ALTER TABLE `stat_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_contract_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_contract_user1_idx` (`user_id`);

--
-- Indexes for table `stat_contract_detail`
--
ALTER TABLE `stat_contract_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_contract_detail_stat_contract1_idx` (`stat_contract_id`),
  ADD KEY `fk_stat_contract_detail_officer_level1_idx` (`officer_level_id`);

--
-- Indexes for table `stat_copy`
--
ALTER TABLE `stat_copy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_copy_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_copy_user1_idx` (`user_id`);

--
-- Indexes for table `stat_copy_detail`
--
ALTER TABLE `stat_copy_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_copy_detail_stat_copy1_idx` (`stat_copy_id`);

--
-- Indexes for table `stat_course`
--
ALTER TABLE `stat_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_course_user1_idx` (`user_id`),
  ADD KEY `fk_stat_course_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_course_detail`
--
ALTER TABLE `stat_course_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_course_detail_stat_course1_idx` (`stat_course_id`);

--
-- Indexes for table `stat_document`
--
ALTER TABLE `stat_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_document_user1_idx` (`user_id`),
  ADD KEY `fk_stat_document_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_document_detail`
--
ALTER TABLE `stat_document_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_document_detail_stat_document1_idx` (`stat_document_id`),
  ADD KEY `fk_stat_document_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_document_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_document_detail_organisation1_idx` (`organisation_id`),
  ADD KEY `fk_stat_document_detail_book1_idx` (`book_id`);

--
-- Indexes for table `stat_ethnic`
--
ALTER TABLE `stat_ethnic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_ethnic_user1_idx` (`user_id`),
  ADD KEY `fk_stat_ethnic_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_ethnic_detail`
--
ALTER TABLE `stat_ethnic_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_ethnic_detail_ethnic1_idx` (`ethnic_id`),
  ADD KEY `fk_stat_ethnic_detail_stat_ethnic1_idx` (`stat_ethnic_id`),
  ADD KEY `fk_stat_ethnic_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_explore`
--
ALTER TABLE `stat_explore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_explore_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_explore_user1_idx` (`user_id`);

--
-- Indexes for table `stat_explore_detail`
--
ALTER TABLE `stat_explore_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_explore_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_explore_detail_stat_explore1_idx` (`stat_explore_id`);

--
-- Indexes for table `stat_govcoin_ministry`
--
ALTER TABLE `stat_govcoin_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govcoin_ministry_user1_idx` (`user_id`),
  ADD KEY `fk_stat_govcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_govcoin_ministry_detail`
--
ALTER TABLE `stat_govcoin_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govcoin_ministry_detail_stat_govcoin_ministry1_idx` (`stat_govcoin_ministry_id`),
  ADD KEY `fk_stat_govcoin_ministry_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_govcoin_ministry_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_govcoin_province`
--
ALTER TABLE `stat_govcoin_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govcoin_province_user1_idx` (`user_id`),
  ADD KEY `fk_stat_govcoin_province_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_govcoin_province_detail`
--
ALTER TABLE `stat_govcoin_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govcoin_province_detail_award1_idx` (`award_id`),
  ADD KEY `fk_stat_govcoin_province_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_govcoin_province_detail_stat_govcoin_province1_idx` (`stat_govcoin_province_id`);

--
-- Indexes for table `stat_goverment_unit`
--
ALTER TABLE `stat_goverment_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_statistic1_user1_idx` (`user_id`),
  ADD KEY `fk_stat_goverment_unit_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_goverment_unit_detail`
--
ALTER TABLE `stat_goverment_unit_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_goverment_unit_detail_stat_goverment_unit1_idx` (`stat_goverment_unit_id`),
  ADD KEY `fk_stat_goverment_unit_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_govoversea_ministry`
--
ALTER TABLE `stat_govoversea_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govoversea_ministry_user1_idx` (`user_id`),
  ADD KEY `fk_stat_govoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_govoversea_ministry_detail`
--
ALTER TABLE `stat_govoversea_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govoversea_ministry_detail_stat_govoversea_ministry_idx` (`stat_govoversea_ministry_id`),
  ADD KEY `fk_stat_govoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_govoversea_ministry_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_govoversea_province`
--
ALTER TABLE `stat_govoversea_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_govoversea_province_user1_idx` (`user_id`);

--
-- Indexes for table `stat_govoversea_province_detail`
--
ALTER TABLE `stat_govoversea_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_govoversea_province_detail_stat_govoversea_province_idx` (`stat_govoversea_province_id`),
  ADD KEY `fk_stat_govoversea_province_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_govoversea_province_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_highcoin_foreigner`
--
ALTER TABLE `stat_highcoin_foreigner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highcoin_foreigner_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_highcoin_foreigner_user1_idx` (`user_id`);

--
-- Indexes for table `stat_highcoin_foreigner_detail`
--
ALTER TABLE `stat_highcoin_foreigner_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highcoin_foreigner_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_highcoin_foreigner_detail_award1_idx` (`award_id`),
  ADD KEY `fk_stat_highcoin_foreigner_detail_stat_highcoin_foreigner1_idx` (`stat_highcoin_foreigner_id`);

--
-- Indexes for table `stat_highcoin_ministry`
--
ALTER TABLE `stat_highcoin_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highcoin_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_highcoin_ministry_user1_idx` (`user_id`);

--
-- Indexes for table `stat_highcoin_ministry_detail`
--
ALTER TABLE `stat_highcoin_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highcoin_ministry_detail_stat_highcoin_ministry1_idx` (`stat_highcoin_ministry_id`),
  ADD KEY `fk_stat_highcoin_ministry_detail_award1_idx` (`award_id`),
  ADD KEY `fk_stat_highcoin_ministry_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_highoversea_ministry`
--
ALTER TABLE `stat_highoversea_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_highoversea_ministry_user1_idx` (`user_id`);

--
-- Indexes for table `stat_highoversea_ministry_detail`
--
ALTER TABLE `stat_highoversea_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_highoversea_ministry_detail_stat_highoversea_minist_idx` (`stat_highoversea_ministry_id`),
  ADD KEY `fk_stat_highoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_highoversea_ministry_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_hornorcoin_province`
--
ALTER TABLE `stat_hornorcoin_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_hornorcoin_province_user1_idx` (`user_id`),
  ADD KEY `fk_stat_hornorcoin_province_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_hornorcoin_province_detail`
--
ALTER TABLE `stat_hornorcoin_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_hornorcoin_province_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_hornorcoin_province_detail_award1_idx` (`award_id`),
  ADD KEY `fk_stat_hornorcoin_province_detail_stat_hornorcoin_province_idx` (`stat_hornorcoin_province_id`);

--
-- Indexes for table `stat_institute_meeting`
--
ALTER TABLE `stat_institute_meeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_institute_meeting_user1_idx` (`user_id`),
  ADD KEY `fk_stat_institute_meeting_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_institute_meeting_detail`
--
ALTER TABLE `stat_institute_meeting_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_institute_meeting_detail_stat_institute_meeting1_idx` (`stat_institute_meeting_id`);

--
-- Indexes for table `stat_institute_train`
--
ALTER TABLE `stat_institute_train`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_institute_train_user1_idx` (`user_id`),
  ADD KEY `fk_stat_institute_train_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_institute_train_detail`
--
ALTER TABLE `stat_institute_train_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_institute_train_detail_stat_institute_train1_idx` (`stat_institute_train_id`);

--
-- Indexes for table `stat_interco`
--
ALTER TABLE `stat_interco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_interco_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_interco_user1_idx` (`user_id`);

--
-- Indexes for table `stat_interco_detail`
--
ALTER TABLE `stat_interco_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_interco_detail_stat_interco1_idx` (`stat_interco_id`);

--
-- Indexes for table `stat_investment`
--
ALTER TABLE `stat_investment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_investment_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_investment_user1_idx` (`user_id`);

--
-- Indexes for table `stat_investment_detail`
--
ALTER TABLE `stat_investment_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_investment_detail_stat_investment1_idx` (`stat_investment_id`),
  ADD KEY `fk_stat_investment_detail_project1_idx` (`project_id`);

--
-- Indexes for table `stat_legal`
--
ALTER TABLE `stat_legal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_legal_user1_idx` (`user_id`),
  ADD KEY `fk_stat_legal_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_legal_detail`
--
ALTER TABLE `stat_legal_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_legal_detail_stat_legal1_idx` (`stat_legal_id`),
  ADD KEY `fk_stat_legal_detail_legal1_idx` (`legal_id`);

--
-- Indexes for table `stat_local_admin`
--
ALTER TABLE `stat_local_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_local_admin_user1_idx` (`user_id`),
  ADD KEY `fk_stat_local_admin_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_local_admin_detail`
--
ALTER TABLE `stat_local_admin_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_local_admin_detail_stat_local_admin1_idx` (`stat_local_admin_id`),
  ADD KEY `fk_stat_local_admin_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_map_create`
--
ALTER TABLE `stat_map_create`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_create_user1_idx` (`user_id`),
  ADD KEY `fk_stat_map_create_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_map_print`
--
ALTER TABLE `stat_map_print`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_print_user1_idx` (`user_id`),
  ADD KEY `fk_stat_map_print_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_map_produce`
--
ALTER TABLE `stat_map_produce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_produce_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_map_produce_user1_idx` (`user_id`);

--
-- Indexes for table `stat_map_produce_detail`
--
ALTER TABLE `stat_map_produce_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_produce_detail_stat_map_produce1_idx` (`stat_map_produce_id`);

--
-- Indexes for table `stat_map_service`
--
ALTER TABLE `stat_map_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_service_user1_idx` (`user_id`),
  ADD KEY `fk_stat_map_service_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_map_service_detail`
--
ALTER TABLE `stat_map_service_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_service_detail_stat_map_service1_idx` (`stat_map_service_id`);

--
-- Indexes for table `stat_map_support`
--
ALTER TABLE `stat_map_support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_map_service_user2_idx` (`user_id`),
  ADD KEY `fk_stat_map_support_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_ministry`
--
ALTER TABLE `stat_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_ministry_user1_idx` (`user_id`);

--
-- Indexes for table `stat_ministry_detail`
--
ALTER TABLE `stat_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_ministry_detail_stat_ministry1_idx` (`stat_ministry_id`);

--
-- Indexes for table `stat_oda`
--
ALTER TABLE `stat_oda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_oda_user1_idx` (`user_id`),
  ADD KEY `fk_stat_oda_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_oda_detail`
--
ALTER TABLE `stat_oda_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_oda_detail_stat_oda1_idx` (`stat_oda_id`);

--
-- Indexes for table `stat_officer`
--
ALTER TABLE `stat_officer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_add`
--
ALTER TABLE `stat_officer_add`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_add_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_add_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_add_detail`
--
ALTER TABLE `stat_officer_add_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_add_detail_stat_officer_add1_idx` (`stat_officer_add_id`),
  ADD KEY `fk_stat_officer_add_detail_ministry_group1_idx` (`ministry_group_id`);

--
-- Indexes for table `stat_officer_age`
--
ALTER TABLE `stat_officer_age`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_age_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_age_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_agelevel`
--
ALTER TABLE `stat_officer_agelevel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_agelevel_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_agelevel_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_agelevel_detail`
--
ALTER TABLE `stat_officer_agelevel_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_agelevel_detail_stat_officer_agelevel1_idx` (`stat_officer_agelevel_id`),
  ADD KEY `fk_stat_officer_agelevel_detail_officer_level1_idx` (`officer_level_id`);

--
-- Indexes for table `stat_officer_age_detail`
--
ALTER TABLE `stat_officer_age_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_stat_officer_age1_idx` (`stat_officer_age_id`),
  ADD KEY `fk_stat_officer_age_detail_organisation_group1_idx` (`organisation_group_id`);

--
-- Indexes for table `stat_officer_contract`
--
ALTER TABLE `stat_officer_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_contract_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_contract_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_contract_detail`
--
ALTER TABLE `stat_officer_contract_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_contract_detail_stat_officer_contract1_idx` (`stat_officer_contract_id`),
  ADD KEY `fk_stat_officer_contract_detail_ministry_group1_idx` (`ministry_group_id`);

--
-- Indexes for table `stat_officer_degree`
--
ALTER TABLE `stat_officer_degree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_offcer_degree_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_offcer_degree_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_degree_detail`
--
ALTER TABLE `stat_officer_degree_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_degree_detail_stat_officer_degree1_idx` (`stat_officer_degree_id`),
  ADD KEY `fk_stat_officer_degree_detail_organisation_group1_idx` (`organisation_group_id`);

--
-- Indexes for table `stat_officer_detail`
--
ALTER TABLE `stat_officer_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_detail_stat_officer1_idx` (`stat_officer_id`);

--
-- Indexes for table `stat_officer_ethnic`
--
ALTER TABLE `stat_officer_ethnic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ethnic_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_ethnic_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_ethnic_detail`
--
ALTER TABLE `stat_officer_ethnic_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ethnic_detail_stat_officer_ethnic1_idx` (`stat_officer_ethnic_id`),
  ADD KEY `fk_stat_officer_ethnic_detail_officer_level1_idx` (`officer_level_id`),
  ADD KEY `fk_stat_officer_ethnic_detail_ethnic1_idx` (`ethnic_id`);

--
-- Indexes for table `stat_officer_ministry`
--
ALTER TABLE `stat_officer_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_ministry_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_ministry_add`
--
ALTER TABLE `stat_officer_ministry_add`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_add_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_ministry_add_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_ministry_add_detail`
--
ALTER TABLE `stat_officer_ministry_add_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_add_detail_stat_officer_ministry_a_idx` (`stat_officer_ministry_add_id`),
  ADD KEY `fk_stat_officer_ministry_add_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_officer_ministry_detail`
--
ALTER TABLE `stat_officer_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_detail_stat_officer_ministry1_idx` (`stat_officer_ministry_id`),
  ADD KEY `fk_stat_officer_ministry_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_officer_ministry_train`
--
ALTER TABLE `stat_officer_ministry_train`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_train_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_ministry_train_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_ministry_train_detail`
--
ALTER TABLE `stat_officer_ministry_train_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_train_detail_stat_officer_ministry_idx` (`stat_officer_ministry_train_id`),
  ADD KEY `fk_stat_officer_ministry_train_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_officer_ministry_upgrade`
--
ALTER TABLE `stat_officer_ministry_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_ministry_upgrade_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_ministry_upgrade_detail`
--
ALTER TABLE `stat_officer_ministry_upgrade_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_ministry_upgrade_detail_stat_officer_minist_idx` (`stat_officer_ministry_upgrade_id`),
  ADD KEY `fk_stat_officer_ministry_upgrade_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_officer_need`
--
ALTER TABLE `stat_officer_need`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_need_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_need_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_need_detail`
--
ALTER TABLE `stat_officer_need_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_need_detail_stat_officer_need1_idx` (`stat_officer_need_id`);

--
-- Indexes for table `stat_officer_new`
--
ALTER TABLE `stat_officer_new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_new_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_new_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_new_detail`
--
ALTER TABLE `stat_officer_new_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_new_detail_stat_officer_new1_idx` (`stat_officer_new_id`),
  ADD KEY `fk_stat_officer_new_detail_officer_level1_idx` (`officer_level_id`);

--
-- Indexes for table `stat_officer_org`
--
ALTER TABLE `stat_officer_org`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_org_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_org_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_organisation_add`
--
ALTER TABLE `stat_officer_organisation_add`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_add_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_organisation_add_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_organisation_add_detail`
--
ALTER TABLE `stat_officer_organisation_add_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_add_detail_stat_officer_organi_idx` (`stat_officer_organisation_add_id`),
  ADD KEY `fk_stat_officer_organisation_add_detail_organisation1_idx` (`organisation_id`);

--
-- Indexes for table `stat_officer_organisation_train`
--
ALTER TABLE `stat_officer_organisation_train`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_train_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_organisation_train_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_organisation_train_detail`
--
ALTER TABLE `stat_officer_organisation_train_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_train_detail_stat_officer_orga_idx` (`stat_officer_organisation_train_id`),
  ADD KEY `fk_stat_officer_organisation_train_detail_organisation1_idx` (`organisation_id`);

--
-- Indexes for table `stat_officer_organisation_upgrade`
--
ALTER TABLE `stat_officer_organisation_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_upgrade_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_organisation_upgrade_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_organisation_upgrade_detail`
--
ALTER TABLE `stat_officer_organisation_upgrade_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_organisation_upgrade_detail_organisation1_idx` (`organisation_id`),
  ADD KEY `fk_stat_officer_organisation_upgrade_detail_stat_officer_or_idx` (`stat_officer_organisation_upgrade_id`);

--
-- Indexes for table `stat_officer_org_detail`
--
ALTER TABLE `stat_officer_org_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_org_detail_stat_officer_org1_idx` (`stat_officer_org_id`),
  ADD KEY `fk_stat_officer_org_detail_organisation1_idx` (`organisation_id`);

--
-- Indexes for table `stat_officer_position`
--
ALTER TABLE `stat_officer_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_position_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_position_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_position_detail`
--
ALTER TABLE `stat_officer_position_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_position_detail_stat_officer_position1_idx` (`stat_officer_position_id`),
  ADD KEY `fk_stat_officer_position_detail_organisation_group1_idx` (`organisation_group_id`);

--
-- Indexes for table `stat_officer_province`
--
ALTER TABLE `stat_officer_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_province_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_province_add`
--
ALTER TABLE `stat_officer_province_add`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_add_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_province_add_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_province_add_detail`
--
ALTER TABLE `stat_officer_province_add_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_add_detail_stat_officer_province_a_idx` (`stat_officer_province_add_id`),
  ADD KEY `fk_stat_officer_province_add_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_officer_province_detail`
--
ALTER TABLE `stat_officer_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_detail_stat_officer_province1_idx` (`stat_officer_province_id`),
  ADD KEY `fk_stat_officer_province_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_officer_province_train`
--
ALTER TABLE `stat_officer_province_train`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_train_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_province_train_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_province_train_detail`
--
ALTER TABLE `stat_officer_province_train_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_train_detail_stat_officer_province_idx` (`stat_officer_province_train_id`),
  ADD KEY `fk_stat_officer_province_train_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_officer_province_upgrade`
--
ALTER TABLE `stat_officer_province_upgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_upgrade_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_province_upgrade_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_province_upgrade_detail`
--
ALTER TABLE `stat_officer_province_upgrade_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_province_upgrade_detail_stat_officer_provin_idx` (`stat_officer_province_upgrade_id`),
  ADD KEY `fk_stat_officer_province_upgrade_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_officer_resign`
--
ALTER TABLE `stat_officer_resign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_resign_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_resign_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_resign_detail`
--
ALTER TABLE `stat_officer_resign_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_resign_detail_stat_officer_resign1_idx` (`stat_officer_resign_id`),
  ADD KEY `fk_stat_officer_resign_detail_ministry_group1_idx` (`ministry_group_id`);

--
-- Indexes for table `stat_officer_salary`
--
ALTER TABLE `stat_officer_salary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_salary_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_officer_salary_user1_idx` (`user_id`);

--
-- Indexes for table `stat_officer_salary_detail`
--
ALTER TABLE `stat_officer_salary_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_salary_detail_stat_officer_salary1_idx` (`stat_officer_salary_id`),
  ADD KEY `fk_stat_officer_salary_detail_officer_level1_idx` (`officer_level_id`),
  ADD KEY `fk_stat_officer_salary_detail_salary_level1_idx` (`salary_level_id`);

--
-- Indexes for table `stat_officer_technical`
--
ALTER TABLE `stat_officer_technical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_technical_user1_idx` (`user_id`),
  ADD KEY `fk_stat_officer_technical_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_officer_technical_detail`
--
ALTER TABLE `stat_officer_technical_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_officer_technical_detail_stat_officer_technical1_idx` (`stat_officer_technical_id`),
  ADD KEY `fk_stat_officer_technical_detail_officer_level1_idx` (`officer_level_id`);

--
-- Indexes for table `stat_people_move`
--
ALTER TABLE `stat_people_move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_people_move_user1_idx` (`user_id`),
  ADD KEY `fk_stat_people_move_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_people_move_detail`
--
ALTER TABLE `stat_people_move_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_people_move_detail_stat_people_move1_idx` (`stat_people_move_id`);

--
-- Indexes for table `stat_population_movement`
--
ALTER TABLE `stat_population_movement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_population_movement_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_population_movement_user1_idx` (`user_id`);

--
-- Indexes for table `stat_population_movement_detail`
--
ALTER TABLE `stat_population_movement_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_population_movement_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_population_movement_detail_stat_population_movement_idx` (`stat_population_movement_id`);

--
-- Indexes for table `stat_position`
--
ALTER TABLE `stat_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_position_user1_idx` (`user_id`),
  ADD KEY `fk_stat_position_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_position_detail`
--
ALTER TABLE `stat_position_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_position_detail_officer_level1_idx` (`officer_level_id`),
  ADD KEY `fk_stat_position_detail_stat_position1_idx` (`stat_position_id`);

--
-- Indexes for table `stat_religion`
--
ALTER TABLE `stat_religion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_religion_user1_idx` (`user_id`);

--
-- Indexes for table `stat_religion_detail`
--
ALTER TABLE `stat_religion_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_detail_stat_religion1_idx` (`stat_religion_id`),
  ADD KEY `fk_stat_religion_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_religion_place`
--
ALTER TABLE `stat_religion_place`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_place_user1_idx` (`user_id`),
  ADD KEY `fk_stat_religion_place_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_religion_place_detail`
--
ALTER TABLE `stat_religion_place_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_place_stat_religion_place1_idx` (`stat_religion_place_id`),
  ADD KEY `fk_stat_religion_place_province1_idx` (`province_id`);

--
-- Indexes for table `stat_religion_teacher`
--
ALTER TABLE `stat_religion_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_teacher_user1_idx` (`user_id`),
  ADD KEY `fk_stat_religion_teacher_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_religion_teacher_detail`
--
ALTER TABLE `stat_religion_teacher_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_religion_teacher_detail_stat_religion_teacher1_idx` (`stat_religion_teacher_id`),
  ADD KEY `fk_stat_religion_teacher_detail_province1_idx` (`province_id`);

--
-- Indexes for table `stat_research`
--
ALTER TABLE `stat_research`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_research_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_research_user1_idx` (`user_id`);

--
-- Indexes for table `stat_research_detail`
--
ALTER TABLE `stat_research_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_research_detail_stat_research1_idx` (`stat_research_id`);

--
-- Indexes for table `stat_resign`
--
ALTER TABLE `stat_resign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_resign_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_resign_user1_idx` (`user_id`);

--
-- Indexes for table `stat_resign_detail`
--
ALTER TABLE `stat_resign_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_resign_detail_stat_resign1_idx` (`stat_resign_id`),
  ADD KEY `fk_stat_resign_detail_officer_level1_idx` (`officer_level_id`);

--
-- Indexes for table `stat_single_gateway_implementation`
--
ALTER TABLE `stat_single_gateway_implementation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_single_gateway_implementation_user1_idx` (`user_id`),
  ADD KEY `fk_stat_single_gateway_implementation_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_single_gateway_implementation_detail`
--
ALTER TABLE `stat_single_gateway_implementation_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_single_gateway_implementation_detail_stat_single_ga_idx` (`stat_single_gateway_implementation_id`),
  ADD KEY `fk_stat_single_gateway_implementation_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_single_window`
--
ALTER TABLE `stat_single_window`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_single_window_user1_idx` (`user_id`),
  ADD KEY `fk_stat_single_window_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_single_window_detail`
--
ALTER TABLE `stat_single_window_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_single_window_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_single_window_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_single_window_detail_stat_single_window1_idx` (`stat_single_window_id`);

--
-- Indexes for table `stat_victorycoin_ministry`
--
ALTER TABLE `stat_victorycoin_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victorycoin_ministry_user1_idx` (`user_id`),
  ADD KEY `fk_stat_victorycoin_ministry_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_victorycoin_ministry_detail`
--
ALTER TABLE `stat_victorycoin_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victorycoin_ministry_detail_stat_victorycoin_minist_idx` (`stat_victorycoin_ministry_id`),
  ADD KEY `fk_stat_victorycoin_ministry_detail_award1_idx` (`award_id`),
  ADD KEY `fk_stat_victorycoin_ministry_detail_ministry1_idx` (`ministry_id`);

--
-- Indexes for table `stat_victorycoin_province`
--
ALTER TABLE `stat_victorycoin_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victorycoin_province_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_victorycoin_province_user1_idx` (`user_id`);

--
-- Indexes for table `stat_victorycoin_province_detail`
--
ALTER TABLE `stat_victorycoin_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victorycoin_province_detail_stat_victorycoin_provin_idx` (`stat_victorycoin_province_id`),
  ADD KEY `fk_stat_victorycoin_province_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_victorycoin_province_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_victoryoversea_ministry`
--
ALTER TABLE `stat_victoryoversea_ministry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victoryoversea_ministry_user1_idx` (`user_id`),
  ADD KEY `fk_stat_victoryoversea_ministry_phiscal_year1_idx` (`phiscal_year_id`);

--
-- Indexes for table `stat_victoryoversea_ministry_detail`
--
ALTER TABLE `stat_victoryoversea_ministry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victoryoversea_ministry_detail_stat_victoryoversea__idx` (`stat_victoryoversea_ministry_id`),
  ADD KEY `fk_stat_victoryoversea_ministry_detail_ministry1_idx` (`ministry_id`),
  ADD KEY `fk_stat_victoryoversea_ministry_detail_award1_idx` (`award_id`);

--
-- Indexes for table `stat_victoryoversea_province`
--
ALTER TABLE `stat_victoryoversea_province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victoryoversea_province_phiscal_year1_idx` (`phiscal_year_id`),
  ADD KEY `fk_stat_victoryoversea_province_user1_idx` (`user_id`);

--
-- Indexes for table `stat_victoryoversea_province_detail`
--
ALTER TABLE `stat_victoryoversea_province_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stat_victoryoversea_province_detail_stat_victoryoversea__idx` (`stat_victoryoversea_province_id`),
  ADD KEY `fk_stat_victoryoversea_province_detail_province1_idx` (`province_id`),
  ADD KEY `fk_stat_victoryoversea_province_detail_award1_idx` (`award_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_user_role_id` (`role_id`);

--
-- Indexes for table `user_has_branch`
--
ALTER TABLE `user_has_branch`
  ADD PRIMARY KEY (`user_id`,`branch_id`),
  ADD KEY `fk_user_has_branch_branch1_idx` (`branch_id`),
  ADD KEY `fk_user_has_branch_user1_idx` (`user_id`);

--
-- Indexes for table `user_has_province`
--
ALTER TABLE `user_has_province`
  ADD PRIMARY KEY (`user_id`,`province_id`),
  ADD KEY `fk_user_has_province_idx` (`province_id`),
  ADD KEY `fk_user_has_user_idx` (`user_id`);

--
-- Indexes for table `user_has_role`
--
ALTER TABLE `user_has_role`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `fk_user_has_role_role1_idx` (`role_id`),
  ADD KEY `fk_user_has_role_user1_idx` (`user_id`);

--
-- Indexes for table `user_subordinate`
--
ALTER TABLE `user_subordinate`
  ADD PRIMARY KEY (`user_id`,`subordinate_user_id`);

--
-- Indexes for table `use_subcordinate`
--
ALTER TABLE `use_subcordinate`
  ADD PRIMARY KEY (`user_id`,`subcordinate_user_id`),
  ADD KEY `fk_user_has_user_user2_idx` (`subcordinate_user_id`),
  ADD KEY `fk_user_has_user_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accociation`
--
ALTER TABLE `accociation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=775;

--
-- AUTO_INCREMENT for table `approver`
--
ALTER TABLE `approver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `approver_level`
--
ALTER TABLE `approver_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `controller`
--
ALTER TABLE `controller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `ethnic`
--
ALTER TABLE `ethnic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `goverment_level`
--
ALTER TABLE `goverment_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `goverment_unit`
--
ALTER TABLE `goverment_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal`
--
ALTER TABLE `legal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `legal_status`
--
ALTER TABLE `legal_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `legal_type`
--
ALTER TABLE `legal_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=497;

--
-- AUTO_INCREMENT for table `menugroup`
--
ALTER TABLE `menugroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ministry`
--
ALTER TABLE `ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `ministry_group`
--
ALTER TABLE `ministry_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `officer_level`
--
ALTER TABLE `officer_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organisation`
--
ALTER TABLE `organisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `organisation_group`
--
ALTER TABLE `organisation_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phiscal_year`
--
ALTER TABLE `phiscal_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `salary_level`
--
ALTER TABLE `salary_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `source_message`
--
ALTER TABLE `source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1916;

--
-- AUTO_INCREMENT for table `stat_3create`
--
ALTER TABLE `stat_3create`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_3create_detail`
--
ALTER TABLE `stat_3create_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_aids`
--
ALTER TABLE `stat_aids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_association_foundation`
--
ALTER TABLE `stat_association_foundation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_association_foundation_detail`
--
ALTER TABLE `stat_association_foundation_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `stat_contract`
--
ALTER TABLE `stat_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stat_contract_detail`
--
ALTER TABLE `stat_contract_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_copy`
--
ALTER TABLE `stat_copy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_copy_detail`
--
ALTER TABLE `stat_copy_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stat_course`
--
ALTER TABLE `stat_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `stat_course_detail`
--
ALTER TABLE `stat_course_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `stat_document`
--
ALTER TABLE `stat_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_document_detail`
--
ALTER TABLE `stat_document_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `stat_ethnic`
--
ALTER TABLE `stat_ethnic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stat_ethnic_detail`
--
ALTER TABLE `stat_ethnic_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1685;

--
-- AUTO_INCREMENT for table `stat_explore`
--
ALTER TABLE `stat_explore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stat_explore_detail`
--
ALTER TABLE `stat_explore_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `stat_govcoin_ministry`
--
ALTER TABLE `stat_govcoin_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_govcoin_ministry_detail`
--
ALTER TABLE `stat_govcoin_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `stat_govcoin_province`
--
ALTER TABLE `stat_govcoin_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_govcoin_province_detail`
--
ALTER TABLE `stat_govcoin_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `stat_goverment_unit`
--
ALTER TABLE `stat_goverment_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stat_goverment_unit_detail`
--
ALTER TABLE `stat_goverment_unit_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `stat_govoversea_ministry`
--
ALTER TABLE `stat_govoversea_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_govoversea_ministry_detail`
--
ALTER TABLE `stat_govoversea_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_govoversea_province`
--
ALTER TABLE `stat_govoversea_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_govoversea_province_detail`
--
ALTER TABLE `stat_govoversea_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stat_highcoin_foreigner`
--
ALTER TABLE `stat_highcoin_foreigner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_highcoin_foreigner_detail`
--
ALTER TABLE `stat_highcoin_foreigner_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_highcoin_ministry`
--
ALTER TABLE `stat_highcoin_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `stat_highcoin_ministry_detail`
--
ALTER TABLE `stat_highcoin_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stat_highoversea_ministry`
--
ALTER TABLE `stat_highoversea_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `stat_highoversea_ministry_detail`
--
ALTER TABLE `stat_highoversea_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_hornorcoin_province`
--
ALTER TABLE `stat_hornorcoin_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_hornorcoin_province_detail`
--
ALTER TABLE `stat_hornorcoin_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stat_institute_meeting`
--
ALTER TABLE `stat_institute_meeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_institute_meeting_detail`
--
ALTER TABLE `stat_institute_meeting_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stat_institute_train`
--
ALTER TABLE `stat_institute_train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_institute_train_detail`
--
ALTER TABLE `stat_institute_train_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_interco`
--
ALTER TABLE `stat_interco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_interco_detail`
--
ALTER TABLE `stat_interco_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_investment`
--
ALTER TABLE `stat_investment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_investment_detail`
--
ALTER TABLE `stat_investment_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stat_legal`
--
ALTER TABLE `stat_legal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `stat_legal_detail`
--
ALTER TABLE `stat_legal_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `stat_local_admin`
--
ALTER TABLE `stat_local_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `stat_local_admin_detail`
--
ALTER TABLE `stat_local_admin_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `stat_map_create`
--
ALTER TABLE `stat_map_create`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_map_print`
--
ALTER TABLE `stat_map_print`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_map_produce`
--
ALTER TABLE `stat_map_produce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_map_produce_detail`
--
ALTER TABLE `stat_map_produce_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stat_map_service`
--
ALTER TABLE `stat_map_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stat_map_service_detail`
--
ALTER TABLE `stat_map_service_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `stat_map_support`
--
ALTER TABLE `stat_map_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_ministry`
--
ALTER TABLE `stat_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_ministry_detail`
--
ALTER TABLE `stat_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_oda`
--
ALTER TABLE `stat_oda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stat_oda_detail`
--
ALTER TABLE `stat_oda_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `stat_officer`
--
ALTER TABLE `stat_officer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_add`
--
ALTER TABLE `stat_officer_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_add_detail`
--
ALTER TABLE `stat_officer_add_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_age`
--
ALTER TABLE `stat_officer_age`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_agelevel`
--
ALTER TABLE `stat_officer_agelevel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_agelevel_detail`
--
ALTER TABLE `stat_officer_agelevel_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stat_officer_age_detail`
--
ALTER TABLE `stat_officer_age_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_contract`
--
ALTER TABLE `stat_officer_contract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_contract_detail`
--
ALTER TABLE `stat_officer_contract_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_degree`
--
ALTER TABLE `stat_officer_degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_degree_detail`
--
ALTER TABLE `stat_officer_degree_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_detail`
--
ALTER TABLE `stat_officer_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_ethnic`
--
ALTER TABLE `stat_officer_ethnic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stat_officer_ethnic_detail`
--
ALTER TABLE `stat_officer_ethnic_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `stat_officer_ministry`
--
ALTER TABLE `stat_officer_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_add`
--
ALTER TABLE `stat_officer_ministry_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_add_detail`
--
ALTER TABLE `stat_officer_ministry_add_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_detail`
--
ALTER TABLE `stat_officer_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_train`
--
ALTER TABLE `stat_officer_ministry_train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_train_detail`
--
ALTER TABLE `stat_officer_ministry_train_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_upgrade`
--
ALTER TABLE `stat_officer_ministry_upgrade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_ministry_upgrade_detail`
--
ALTER TABLE `stat_officer_ministry_upgrade_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `stat_officer_need`
--
ALTER TABLE `stat_officer_need`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_need_detail`
--
ALTER TABLE `stat_officer_need_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_new`
--
ALTER TABLE `stat_officer_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_new_detail`
--
ALTER TABLE `stat_officer_new_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stat_officer_org`
--
ALTER TABLE `stat_officer_org`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_add`
--
ALTER TABLE `stat_officer_organisation_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_add_detail`
--
ALTER TABLE `stat_officer_organisation_add_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_train`
--
ALTER TABLE `stat_officer_organisation_train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_train_detail`
--
ALTER TABLE `stat_officer_organisation_train_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_upgrade`
--
ALTER TABLE `stat_officer_organisation_upgrade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_organisation_upgrade_detail`
--
ALTER TABLE `stat_officer_organisation_upgrade_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `stat_officer_org_detail`
--
ALTER TABLE `stat_officer_org_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stat_officer_position`
--
ALTER TABLE `stat_officer_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_position_detail`
--
ALTER TABLE `stat_officer_position_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_officer_province`
--
ALTER TABLE `stat_officer_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_officer_province_add`
--
ALTER TABLE `stat_officer_province_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_officer_province_add_detail`
--
ALTER TABLE `stat_officer_province_add_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `stat_officer_province_detail`
--
ALTER TABLE `stat_officer_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `stat_officer_province_train`
--
ALTER TABLE `stat_officer_province_train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_province_train_detail`
--
ALTER TABLE `stat_officer_province_train_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `stat_officer_province_upgrade`
--
ALTER TABLE `stat_officer_province_upgrade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_officer_province_upgrade_detail`
--
ALTER TABLE `stat_officer_province_upgrade_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `stat_officer_resign`
--
ALTER TABLE `stat_officer_resign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_resign_detail`
--
ALTER TABLE `stat_officer_resign_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_salary`
--
ALTER TABLE `stat_officer_salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stat_officer_salary_detail`
--
ALTER TABLE `stat_officer_salary_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `stat_officer_technical`
--
ALTER TABLE `stat_officer_technical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_officer_technical_detail`
--
ALTER TABLE `stat_officer_technical_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stat_people_move`
--
ALTER TABLE `stat_people_move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_people_move_detail`
--
ALTER TABLE `stat_people_move_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_population_movement`
--
ALTER TABLE `stat_population_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stat_population_movement_detail`
--
ALTER TABLE `stat_population_movement_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `stat_position`
--
ALTER TABLE `stat_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_position_detail`
--
ALTER TABLE `stat_position_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stat_religion`
--
ALTER TABLE `stat_religion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stat_religion_detail`
--
ALTER TABLE `stat_religion_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `stat_religion_place`
--
ALTER TABLE `stat_religion_place`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_religion_place_detail`
--
ALTER TABLE `stat_religion_place_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `stat_religion_teacher`
--
ALTER TABLE `stat_religion_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stat_religion_teacher_detail`
--
ALTER TABLE `stat_religion_teacher_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `stat_research`
--
ALTER TABLE `stat_research`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_research_detail`
--
ALTER TABLE `stat_research_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stat_resign`
--
ALTER TABLE `stat_resign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stat_resign_detail`
--
ALTER TABLE `stat_resign_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_single_gateway_implementation`
--
ALTER TABLE `stat_single_gateway_implementation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stat_single_gateway_implementation_detail`
--
ALTER TABLE `stat_single_gateway_implementation_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `stat_single_window`
--
ALTER TABLE `stat_single_window`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_single_window_detail`
--
ALTER TABLE `stat_single_window_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stat_victorycoin_ministry`
--
ALTER TABLE `stat_victorycoin_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stat_victorycoin_ministry_detail`
--
ALTER TABLE `stat_victorycoin_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stat_victorycoin_province`
--
ALTER TABLE `stat_victorycoin_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stat_victorycoin_province_detail`
--
ALTER TABLE `stat_victorycoin_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_victoryoversea_ministry`
--
ALTER TABLE `stat_victoryoversea_ministry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stat_victoryoversea_ministry_detail`
--
ALTER TABLE `stat_victoryoversea_ministry_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_victoryoversea_province`
--
ALTER TABLE `stat_victoryoversea_province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat_victoryoversea_province_detail`
--
ALTER TABLE `stat_victoryoversea_province_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
-- Constraints for table `notice`
--
ALTER TABLE `notice`
  ADD CONSTRAINT `fk_notice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `salary_level`
--
ALTER TABLE `salary_level`
  ADD CONSTRAINT `fk_salary_level_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_3create_detail`
--
ALTER TABLE `stat_3create_detail`
  ADD CONSTRAINT `fk_stat_3create_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_aids`
--
ALTER TABLE `stat_aids`
  ADD CONSTRAINT `fk_stat_aids_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_aids_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_highcoin_foreigner`
--
ALTER TABLE `stat_highcoin_foreigner`
  ADD CONSTRAINT `fk_stat_highcoin_foreigner_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_foreigner_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_highcoin_foreigner_detail`
--
ALTER TABLE `stat_highcoin_foreigner_detail`
  ADD CONSTRAINT `fk_stat_highcoin_foreigner_detail_award1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_foreigner_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_highcoin_foreigner_detail_stat_highcoin_foreigner1` FOREIGN KEY (`stat_highcoin_foreigner_id`) REFERENCES `stat_highcoin_foreigner` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_interco`
--
ALTER TABLE `stat_interco`
  ADD CONSTRAINT `fk_stat_interco_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_interco_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_interco_detail`
--
ALTER TABLE `stat_interco_detail`
  ADD CONSTRAINT `fk_stat_interco_detail_stat_interco1` FOREIGN KEY (`stat_interco_id`) REFERENCES `stat_interco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_investment`
--
ALTER TABLE `stat_investment`
  ADD CONSTRAINT `fk_stat_investment_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_investment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_investment_detail`
--
ALTER TABLE `stat_investment_detail`
  ADD CONSTRAINT `fk_stat_investment_detail_project1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_investment_detail_stat_investment1` FOREIGN KEY (`stat_investment_id`) REFERENCES `stat_investment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_map_create`
--
ALTER TABLE `stat_map_create`
  ADD CONSTRAINT `fk_stat_map_create_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_map_create_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_map_print`
--
ALTER TABLE `stat_map_print`
  ADD CONSTRAINT `fk_stat_map_print_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_map_print_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_map_support`
--
ALTER TABLE `stat_map_support`
  ADD CONSTRAINT `fk_stat_map_service_user2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_map_support_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_ministry`
--
ALTER TABLE `stat_ministry`
  ADD CONSTRAINT `fk_stat_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_ministry_detail`
--
ALTER TABLE `stat_ministry_detail`
  ADD CONSTRAINT `fk_stat_ministry_detail_stat_ministry1` FOREIGN KEY (`stat_ministry_id`) REFERENCES `stat_ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_officer_agelevel`
--
ALTER TABLE `stat_officer_agelevel`
  ADD CONSTRAINT `fk_stat_officer_agelevel_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_agelevel_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_agelevel_detail`
--
ALTER TABLE `stat_officer_agelevel_detail`
  ADD CONSTRAINT `fk_stat_officer_agelevel_detail_stat_officer_agelevel1` FOREIGN KEY (`stat_officer_agelevel_id`) REFERENCES `stat_officer_agelevel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_age_detail`
--
ALTER TABLE `stat_officer_age_detail`
  ADD CONSTRAINT `fk_stat_officer_age_detail_organisation_group1` FOREIGN KEY (`organisation_group_id`) REFERENCES `organisation_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_stat_officer_age1` FOREIGN KEY (`stat_officer_age_id`) REFERENCES `stat_officer_age` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_stat_officer_degree_detail_organisation_group1` FOREIGN KEY (`organisation_group_id`) REFERENCES `organisation_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_stat_officer_new_detail_stat_officer_new1` FOREIGN KEY (`stat_officer_new_id`) REFERENCES `stat_officer_new` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_officer_org`
--
ALTER TABLE `stat_officer_org`
  ADD CONSTRAINT `fk_stat_officer_org_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_org_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_officer_org_detail`
--
ALTER TABLE `stat_officer_org_detail`
  ADD CONSTRAINT `fk_stat_officer_org_detail_organisation1` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_officer_org_detail_stat_officer_org1` FOREIGN KEY (`stat_officer_org_id`) REFERENCES `stat_officer_org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_stat_officer_position_detail_organisation_group1` FOREIGN KEY (`organisation_group_id`) REFERENCES `organisation_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_stat_officer_salary_detail_salary_level1` FOREIGN KEY (`salary_level_id`) REFERENCES `salary_level` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  ADD CONSTRAINT `fk_stat_officer_technical_detail_stat_officer_technical1` FOREIGN KEY (`stat_officer_technical_id`) REFERENCES `stat_officer_technical` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_people_move`
--
ALTER TABLE `stat_people_move`
  ADD CONSTRAINT `fk_stat_people_move_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_people_move_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_people_move_detail`
--
ALTER TABLE `stat_people_move_detail`
  ADD CONSTRAINT `fk_stat_people_move_detail_stat_people_move1` FOREIGN KEY (`stat_people_move_id`) REFERENCES `stat_people_move` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `stat_single_window`
--
ALTER TABLE `stat_single_window`
  ADD CONSTRAINT `fk_stat_single_window_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_single_window_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stat_single_window_detail`
--
ALTER TABLE `stat_single_window_detail`
  ADD CONSTRAINT `fk_stat_single_window_detail_ministry1` FOREIGN KEY (`ministry_id`) REFERENCES `ministry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_single_window_detail_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stat_single_window_detail_stat_single_window1` FOREIGN KEY (`stat_single_window_id`) REFERENCES `stat_single_window` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Constraints for table `use_subcordinate`
--
ALTER TABLE `use_subcordinate`
  ADD CONSTRAINT `fk_user_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_user_user2` FOREIGN KEY (`subcordinate_user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
