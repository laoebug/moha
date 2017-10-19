<?php

use yii\db\Migration;

class m171019_042001_menu_data extends Migration
{
public function safeUp() {
		$sql = "
            set foreign_key_checks=0;
			DROP TABLE IF EXISTS `menu`;

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
		  KEY `fk_menu_user_id` (`input_id`),
		  CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
		  CONSTRAINT `fk_menu_menugroup1` FOREIGN KEY (`menugroup_id`) REFERENCES `menugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
		  CONSTRAINT `fk_menu_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
				
INSERT INTO `menu` (`id`, `name`, `url`, `icon`, `description`, `deleted`, `menugroup_id`, `menu_parent_id`, `input_id`, `input_dt_stamp`, `position`, `table_name`, `has_province`)
VALUES
	(1, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', NULL, NULL, 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ', 0, NULL, 3, NULL, '2017-09-03 18:41:53', 14, NULL, NULL),
	(2, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 'stat-officer-salary', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ ແຕ່ຊັ້ນ I ເຖິງ ຊັ້ນ V', 0, NULL, 1, NULL, '2017-09-03 18:45:05', 1, 'stat_officer_salary', NULL),
	(3, 'ກົມ', '#', NULL, 'ກົມ', 0, NULL, 0, 1, '2017-09-25 20:17:01', 1, '#', NULL),
	(13, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', NULL, NULL, 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ', 0, NULL, 3, NULL, '2017-09-03 18:45:38', 7, NULL, NULL),
	(14, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 'stat-course', NULL, 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດເຝິກອົບຮົມລັດຖະກອນ', 0, NULL, 13, NULL, '2017-09-03 18:47:12', 1, 'stat_course', NULL),
	(21, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', NULL, NULL, 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ', 0, NULL, 3, NULL, '2017-09-03 18:47:24', 3, NULL, NULL),
	(22, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 'stat-religion', NULL, 'ສະຖິຕິປະຊາຊົນເຊື່ອຖືສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນໃນທົ່ວປະເທດ ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 2, 'stat_religion', NULL),
	(23, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 'stat-religion-teacher', NULL, 'ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 3, 'stat_religion_teacher', NULL),
	(24, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 'stat-religion-place', NULL, 'ສະຖິຕິສາສະນະສະຖານໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 4, 'stat_religion_place', NULL),
	(25, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 'stat-ethnic', NULL, 'ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ', 0, NULL, 21, NULL, '2017-09-03 18:48:20', 1, 'stat_ethnic', NULL),
	(27, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', NULL, NULL, 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 18:49:19', 6, NULL, NULL),
	(54, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', NULL, NULL, 'ກົມຄຸ້ມຄອງພົນລະເມືອງ', 0, NULL, 3, NULL, '2017-09-03 18:50:38', 4, NULL, NULL),
	(56, 'ການເກັບກຳສະຖິຕິການເໜັງຕີງຂອງພົນລະເມືອງ ຂອງກະຊວງພາຍໃນ ປະຈຳປີ', 'stat-population-movement', NULL, 'ຕາຕະລາງສັງລວມສະຖິຕິພົນລະເມືອງລາວທົ່ວປະເທດ', 0, NULL, 54, NULL, '2017-09-03 18:51:25', 1, 'stat_population_movement', NULL),
	(57, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 'stat-population-movement-chart', NULL, 'ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງປີ', 0, NULL, 54, NULL, '2017-09-03 18:51:25', 2, 'stat_population_movement_chart', NULL),
	(67, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', NULL, NULL, 'ກົມການປົກຄອງທ້ອງຖິ່ນ', 0, NULL, 3, NULL, '2017-09-03 18:51:37', 2, NULL, NULL),
	(71, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 'stat-local-admin', NULL, 'ຕາຕະລາງສັງລວມຂໍ້ມູນກ່ຽວກັບເມືອງ, ບ້ານ ທົ່ວແຂວງ', 0, NULL, 67, NULL, '2017-09-03 18:52:20', NULL, 'stat_local_admin', NULL),
	(79, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', NULL, NULL, 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ', 0, NULL, 3, NULL, '2017-09-03 18:52:28', 1, NULL, NULL),
	(80, 'ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ', 'ministry', NULL, 'ສະຖິຕິກົງຈັກຂອງລັດຖະບານ.... ກະຊວງ ..... ອົງການລັດທຽບເທົ່າ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 1, 'ministry', NULL),
	(81, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 'stat-goverment-unit', NULL, 'ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ, ສະຖາບັນ, ສູນ ແລະ ທຽບເທົ່າກົມ)', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 2, 'stat_goverment_unit', NULL),
	(82, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 'stat-legal', NULL, 'ສະຖິຕິບັນດານິຕິກຳຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 4, 'stat_legal', NULL),
	(83, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 'stat-single-gateway-implementation', NULL, 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 3, 'stat_single_gateway_implementation', NULL),
	(84, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 'stat-association-foundation', NULL, 'ສະຖິຕິສະມາຄົມ/ມູນນິທິໃນທົ່ວປະເທດ', 0, NULL, 79, NULL, '2017-09-03 18:53:04', 5, 'stat_association_foundation', NULL),
	(86, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', '', NULL, 'ກົມສຳເນົາເອກະສານແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:53:18', 8, '', NULL),
	(87, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 'stat-copy', NULL, 'ສະຖິຕິການສັງລວມ ການສຳເນົາ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 2, 'stat_copy', NULL),
	(88, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 'stat-document', NULL, 'ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ', 0, NULL, 86, NULL, '2017-09-03 18:54:01', 1, 'stat_document', NULL),
	(89, 'ກົມແຜນທີ່ແຫ່ງຊາດ', NULL, NULL, 'ກົມແຜນທີ່ແຫ່ງຊາດ', 0, NULL, 3, NULL, '2017-09-03 18:54:01', 10, NULL, NULL),
	(90, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 'stat-explore', NULL, 'ສະຖິຕິການເຄື່ອນໄຫວວຽກງານສຳຫຼວດປະຈຳປີ ......', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 3, 'stat_explore', NULL),
	(91, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 'stat-map-service', NULL, 'ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 1, 'stat_map_service', NULL),
	(92, 'ສະຖິຕິການຜະລິດແຜນທີ່', 'stat-map-produce', NULL, 'ສະຖິຕິການຜະລິດແຜນທີ່', 0, NULL, 89, NULL, '2017-09-03 18:55:00', 2, 'stat_map_produce', NULL),
	(93, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', NULL, NULL, 'ສູນສຳຫຼວດວັດແທກ ແລະ ແຜນທີ່', 0, NULL, 3, NULL, '2017-09-03 18:55:01', 11, NULL, NULL),
	(94, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 'stat-explore', NULL, 'ສະຖິຕິການສຳຫຼວດວັດແທກ ແລະ ວຽກງານການພິມ', 0, NULL, 93, NULL, '2017-09-03 18:55:28', NULL, 'stat_explore', NULL),
	(95, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', NULL, NULL, 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ', 0, NULL, 3, NULL, '2017-09-03 18:55:29', 9, NULL, NULL),
	(96, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victorycoin-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 4, 'stat_victorycoin_province', NULL),
	(97, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 'stat-govcoin-province', NULL, 'ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 10, 'stat_govcoin_province', NULL),
	(98, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govcoin-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 5, 'stat_govcoin_ministry', NULL),
	(99, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-victoryoversea-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 7, 'stat_victoryoversea_ministry', NULL),
	(100, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highcoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຊັ້ນສູງ ແລະ ຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 1, 'stat_highcoin_ministry', NULL),
	(101, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-highoversea-ministry', NULL, 'ປະເພດຫຼຽນຊັ້ນສູງ ສຳລັບການຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 6, 'stat_highoversea_ministry', NULL),
	(102, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 'stat-govoversea-ministry', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 9, 'stat_govoversea_ministry', NULL),
	(103, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-victoryoversea-province', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 8, 'stat_victoryoversea_province', NULL),
	(104, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 'stat-hornorcoin-province', NULL, 'ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 2, 'stat_hornorcoin_province', NULL),
	(105, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 'stat-victorycoin-ministry', NULL, 'ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາກະຊວງ', 0, NULL, 95, NULL, '2017-09-03 19:00:16', 3, 'stat_victorycoin_ministry', NULL),
	(106, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', NULL, NULL, 'ກົມແຜນການ ແລະ ການຮ່ວມມື', 0, NULL, 3, NULL, '2017-09-03 19:00:17', 13, NULL, NULL),
	(109, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', NULL, NULL, 'ກົມຄຸ້ມຄອງລັດຖະກອນ', 0, NULL, 3, NULL, '2017-09-03 19:01:13', 5, NULL, NULL),
	(110, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 'stat-officer', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນໃນທົ່ວປະເທດ', 0, NULL, 109, NULL, '2017-09-03 19:05:41', 1, 'stat_officer', NULL),
	(111, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 'stat-officer-need', NULL, 'ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່', 0, NULL, 109, NULL, '2017-09-03 19:06:06', 8, 'stat_officer_need', NULL),
	(112, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 'stat-officer-degree', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 3, 'stat_officer_degree', NULL),
	(113, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age', NULL, 'ຕາຕະລາງສັງລວມລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 2, 'stat_officer_age', NULL),
	(114, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-org', NULL, 'ສະຖິຕິລວມຂອງອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 10, 'stat_officer_org', NULL),
	(115, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-officer-position', NULL, 'ຈຳນວນລັດຖະກອນແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 7, 'stat_officer_position', NULL),
	(116, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 'stat-officer-add', NULL, 'ຈຳນວນລັດຖະກອນທີ່ເຂົ້າເພີ່ມໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 5, 'stat_officer_add', NULL),
	(117, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-officer-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 4, 'stat_officer_resign', NULL),
	(118, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 'stat-officer-contract', NULL, 'ຈຳນວນພະນັກງານຕາມສັນຍາ', 0, NULL, 109, NULL, '2017-09-03 19:10:17', 6, 'stat_officer_contract', NULL),
	(119, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 'stat-officer-ministry', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງແຕ່ລະກະຊວງ, ອົງການທຽບເທົ່າກະຊວງ', 0, NULL, 109, NULL, '2017-09-03 19:10:18', 9, 'stat_officer_ministry', NULL),
	(120, 'ຫ້ອງການກະຊວງ', NULL, NULL, 'ຫ້ອງການກະຊວງ', 0, NULL, 3, NULL, '2017-09-19 08:37:26', 12, NULL, NULL),
	(122, 'ກົມກວດກາ', NULL, NULL, 'ກົມກວດກາ', 0, NULL, 3, NULL, '2017-09-19 08:43:44', 15, NULL, NULL),
	(441, 'ຜູ້ໃຊ້ລະບົບ', 'user/manageuser', NULL, 'ຜູ້ໃຊ້ລະບົບ', 0, NULL, 0, NULL, '2017-09-19 09:25:56', 16, 'user/manageuser', NULL),
	(442, 'ສິດແລະບົດບາດ', 'user/managerole', NULL, 'ສິດແລະບົດບາດ', 0, NULL, 0, NULL, '2017-09-19 09:27:25', 17, 'user/managerole', NULL),
	(443, 'ຕັ້ງຄ່າ', NULL, NULL, 'ຕັ້ງຄ່າ', 0, NULL, 0, NULL, '2017-09-19 09:27:34', 18, NULL, NULL),
	(444, 'Phiscal Year', 'phiscal-year', 'fa fa-circle-o', 'Phiscal Year', 0, 1, 443, 1, '2017-09-19 09:27:34', 1, 'phiscal_year', NULL),
	(445, 'Translation', 'message', '', 'Translation', 0, 1, 443, 1, '2017-09-19 09:27:34', 2, 'message', NULL),
	(446, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 'stat-officer-province', NULL, 'ສະຖິຕິລັດຖະກອນລວມຂອງບັນດາແຂວງ/ນະຄອນຫຼວງ', 0, NULL, 109, NULL, '2017-09-25 19:11:04', 11, 'stat_officer_province', NULL),
	(447, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 'stat-officer-ministry-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ', 0, NULL, 109, NULL, '2017-09-25 19:16:43', 12, 'stat_officer_ministry_add', NULL),
	(448, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 'stat-officer-organisation-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການອົງການຈັດຕັ້ງຂັ້ນສູນກາງ', 0, NULL, 109, NULL, '2017-09-25 19:18:36', 13, 'stat_officer_organisation_add', NULL),
	(449, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 'stat-officer-province-add', NULL, 'ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງໃນ ສປປ ລາວ', 0, NULL, 109, NULL, '2017-09-25 19:19:33', 14, 'stat_officer_province_add', NULL),
	(450, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:22:58', 1, 'stat_officer_ministry_train', NULL),
	(451, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-organisation-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:24:15', 2, 'stat_officer_organisation_train', NULL),
	(452, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-train', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປເຝິກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:25:30', 3, 'stat_officer_province_train', NULL),
	(453, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-ministry-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:27:21', 4, 'stat_officer_ministry_upgrade', NULL),
	(454, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-org-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:28:50', 5, 'stat_officer_organisation_upgrade', NULL),
	(457, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 'stat-officer-province-upgrade', NULL, 'ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນທ້ອງຖິ່ນທີ່ໄປຍົກລະດັບ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ', 0, NULL, 27, NULL, '2017-09-25 19:29:59', 6, 'stat_officer_province_upgrade', NULL),
	(458, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 'stat-institute-train', NULL, 'ສະຖາບັນຮ່ວມກັບພາກສ່ວນພາຍນອກຈັດເຝິກອົບຮົມ', 0, NULL, 13, NULL, '2017-09-25 19:33:51', 2, 'stat_institute_train', NULL),
	(460, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 'stat-institute-meeting', NULL, 'ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ, ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ', 0, NULL, 13, NULL, '2017-09-25 19:37:21', 3, 'stat_institute_meeting', NULL),
	(461, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 'stat-research', NULL, 'ສັງລວມສະຖິຕິສູນຄົ້ນຄວ້າວຽກງານການປົກຄອງ', 0, NULL, 13, NULL, '2017-09-25 19:39:45', 4, 'stat_research', NULL),
	(462, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 'stat-govoversea-province', NULL, 'ປະເພດຫຼຽນກາຕ່າງໆ ແລະ ໃບຍ້ອງຍໍລັດຖະບານ ສຳລັບຍ້ອງຍໍຕ່າງປະເທດຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ', 0, NULL, 95, NULL, '2017-09-25 19:59:15', 11, 'stat_govoversea_province', NULL),
	(463, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', NULL, NULL, 'ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ', 0, NULL, 89, NULL, '2017-09-25 20:05:03', 4, NULL, NULL),
	(464, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 'stat-officer-technical', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມວິຊາສະເພາະ', 0, NULL, 1, NULL, '2017-09-25 20:09:25', 2, 'stat_officer_technical', NULL),
	(465, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 'stat-officer-age-level', NULL, 'ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນແຍກຕາມເກນອາຍຸ', 0, NULL, 1, NULL, '2017-09-25 20:11:26', 3, 'stat_officer_age_level', NULL),
	(466, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 'stat-officer-ethnic', NULL, 'ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ', 0, NULL, 1, NULL, '2017-09-25 20:12:20', 3, 'stat_officer_ethnic', NULL),
	(467, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 'stat-position', NULL, 'ສະຖິຕິຜູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:14:05', 4, 'stat_position', NULL),
	(469, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 'stat-officer-new', NULL, 'ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:04', 5, 'stat_officer_new', NULL),
	(471, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 'stat-resign', NULL, 'ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ', 0, NULL, 1, NULL, '2017-09-25 20:15:59', 6, 'stat_resign', NULL),
	(472, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 'stat-contract', NULL, 'ຕາຕະລາງສັງລວມ ພະນັກງານຕາມສັນຍາ', 0, NULL, 1, NULL, '2017-09-25 20:16:26', 7, 'stat_contract', NULL),
	(473, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 'stat-oda', NULL, 'ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ', 0, NULL, 106, NULL, '2017-09-25 20:17:01', 8, 'stat_oda', NULL),
	(475, 'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ', 'stat-officer-ethnic', NULL, 'ຕາຕະລາງຈຳນວນລັດຖະກອນ ແຍກຕາມຊົນເຜົ່າ', 0, NULL, 1, NULL, '2017-09-25 20:17:01', 9, 'stat_officer_ethnic', NULL);
				
				
           set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	public function safeDown() {
		$sql = "
            set foreign_key_checks=0;
   			DROP TABLE IF EXISTS `menu`;
            set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
}
