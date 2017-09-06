<?php

use yii\db\Migration;

class m170906_114910_fix_ministry_tb extends Migration
{
public function safeUp()
    {
        
        $sql = "
            set foreign_key_checks=0;
           
            DROP TABLE IF EXISTS `ministry_group`;
            CREATE TABLE `ministry_group` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL,
              `deleted` int(11) NOT NULL DEFAULT '0',
              `position` int(11) NOT NULL DEFAULT '0',
             `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
              `user_id` int(11)  NULL DEFAULT NULL,
              PRIMARY KEY (`id`),
              UNIQUE KEY `name_UNIQUE` (`name`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                        
                        
            DROP TABLE IF EXISTS `ministry`;
           
            CREATE TABLE `ministry` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL,
              `deleted` int(11) NOT NULL DEFAULT '0',
              `code` varchar(5) DEFAULT NULL,
              `last_update` datetime NOT NULL,
              `ministry_group_id` int(11) DEFAULT NULL,
              `position` int(11) NOT NULL DEFAULT '0',
              `phiscal_year_id` int(11) NULL DEFAULT NULL,
              `user_id` int(11)  NULL DEFAULT NULL,
              `remark` text,
              `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
              PRIMARY KEY (`id`),
              KEY `fk_ministry_ministry_group1_idx` (`ministry_group_id`),
              KEY `fk_ministry_phiscal_year1_idx` (`phiscal_year_id`),
              KEY `fk_ministry_user1_idx` (`user_id`),
              CONSTRAINT `fk_ministry_ministry_group1` FOREIGN KEY (`ministry_group_id`) REFERENCES `ministry_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              CONSTRAINT `fk_ministry_phiscal_year1` FOREIGN KEY (`phiscal_year_id`) REFERENCES `phiscal_year` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              CONSTRAINT `fk_ministry_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
                        
           
            
            DROP TABLE IF EXISTS `branch`;
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
            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
                       
            
            INSERT INTO `ministry_group` (`id`, `name`, `deleted`, `position`, `input_dt_stamp`, `user_id`) VALUES
            (1, 'ກະຊວງ', 0, 1, '2017-09-06 19:58:39', NULL),
            (2, 'ອົງການທຽບເທົ່າ', 0, 1, '2017-09-06 19:58:39', NULL),
            (3, 'ແຂວງ, ນະຄອນຫລວງ', 0, 1, '2017-09-06 19:58:39', NULL),
            (4, 'ອົງການຈັດຕັ້ງສຸນກາງ', 0, 1, '2017-09-06 19:58:39', NULL),
            (5, 'ສະຖາບັນ ແລະ ອົງການ', 0, 1, '2017-09-06 19:58:39', NULL),
            (6, 'ອື່ນໆ', 0, 1, '2017-09-06 19:58:39', NULL);
            
            INSERT INTO `ministry` (`id`, `name`, `deleted`, `code`, `last_update`, `ministry_group_id`, `position`, `phiscal_year_id`, `user_id`, `remark`, `input_dt_stamp`) VALUES
            (1, 'ກະຊວງ ກະສິກຳ ແລະ ປ່າໄມ້', 0, '1', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (2, 'ກະຊວງ ການເງິນ', 0, '2', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (3, 'ກະຊວງ ການຕ່າງປະເທດ', 0, '3', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (4, 'ສະພາແຫ່ງຊາດ', 0, '4', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (5, 'ສານປະຊາຊົນສູງສຸດ', 0, '5', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (6, 'ກະຊວງ ຍຸຕິທໍາ', 0, '6', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (7, 'ແຂວງ ຜົ້ງສາລີ', 0, '7', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (8, 'ແຂວງ ອຸດົມໄຊ', 0, '8', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (9, 'ແຂວງ ບໍ່ແກ້ວ', 0, '10', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (10, 'ນະຄອນຫຼວງວຽງຈັນ', 0, '11', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (11, 'ແຂວງ ຫຼວງນໍ້າທາ', 0, '12', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (12, 'ແຂວງ ຫົວພັນ', 0, '13', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (13, 'ແຂວງ ຊຽງຂວາງ', 0, '14', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (14, 'ແຂວງ ຫຼວງພະບາງ', 0, '15', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (15, 'ແຂວງ ໄຊຍະບູລີ', 0, '16', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (16, 'ແຂວງ ວຽງຈັນ', 0, '17', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (17, 'ແຂວງ ບໍລິຄໍາໄຊ', 0, '18', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (18, 'ແຂວງ ຄໍາມ່ວນ', 0, '19', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (19, 'ແຂວງ ສະຫວັນນະເຂດ', 0, '20', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (20, 'ແຂວງ ສາລະວັນ', 0, '21', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (21, 'ແຂວງ ຈໍາປາສັກ', 0, '22', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (22, 'ແຂວງ ອັດຕະປື', 0, '23', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (23, 'ແຂວງ ເຊກອງ', 0, '24', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (24, 'ແຂວງ ໄຊສົມບູນ', 0, '25', '2017-09-06 19:58:52', 3, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (25, 'ກະຊວງ ສຶກສາທິການ ແລະ ກິລາ', 0, '26', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (26, 'ສູນກາງຊາວໜຸ່ມ', 0, '27', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (27, 'ກະຊວງ ພາຍໃນ', 0, '28', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (28, 'ກະຊວງ ສາທາລະນະສຸກ', 0, '29', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (29, 'ກະຊວງ ໂຍທາທິການ ແລະ ຂົນສົ່ງ', 0, '30', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (30, 'ກະຊວງ ຖະແຫຼງຂ່າວ, ວັດທະນະທໍາ ແລະ ທ່ອງທ່ຽວ', 0, '31', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (31, 'ກະຊວງ ແຜນການ ແລະ ການລົງທຶນ', 0, '32', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (32, 'ກະຊວງ ແຮງງານ ແລະ ສະຫວັດດີການສັງຄົມ', 0, '33', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (33, 'ກະຊວງ ໄປສະນີ, ໂທລະຄົມມະນາຄົມ ແລະ ການສື່ສານ', 0, '34', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (34, 'ກະຊວງ ຊັບພະຍາກອນທໍາມະຊາດ ແລະ ສິ່ງແວດລ້ອມ', 0, '35', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (35, 'ກະຊວງ ວິທະຍາສາດ ແລະ ເທັກໂນໂລຊີ', 0, '36', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (36, 'ສະພາແຫ່ງຊາດ', 0, '37', '2017-09-06 19:58:52', 4, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (37, 'ສານປະຊາຊົນສູງສຸດ', 0, '38', '2017-09-06 19:58:52', 4, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (38, 'ກະຊວງ ພະລັງງານ ແລະ ບໍ່ແຮ່', 0, '39', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (39, 'ກະຊວງ ອຸດສາຫະກຳ ແລະ ການຄ້າ', 0, '40', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (40, 'ອົງການກວດກາລັດຖະບານ', 0, '41', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (41, 'ຫ້ອງວ່າການລັດຖະບານ', 0, '42', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (42, 'ທະນາຄານແຫ່ງ ສປປລາວ', 0, '43', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (43, 'ຂັ້ນກະຊວງ (ລວມ)', 0, '44', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (44, 'ຂັ້ນແຂວງ (ລວມ)', 0, '45', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (45, 'ຂັ້ນເມືອງ (ລວມ)', 0, '46', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (46, 'ຊັ້ນກາງ', 0, '47', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (47, 'ຊັ້ນຕົ້ນ', 0, '48', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (48, 'ຊັ້ນສູງ ຫຼື ທຽບເທົ່າ', 0, '49', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (49, 'ປະລິນຍາຕີ', 0, '50', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (50, 'ປະລິນຍາໂທ', 0, '51', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (51, 'ປະລິນຍາເອກ', 0, '52', '2017-09-06 19:58:52', 6, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (52, 'ກະຊວງ ຍຸຕິທໍາ', 0, '53', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (53, 'ກະຊວງ ປ້ອງກັນປະເທດ', 0, '54', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (54, 'ກະຊວງ ປ້ອງກັນຄວາມສະຫງົບ', 0, '55', '2017-09-06 19:58:52', 1, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (55, 'ສະຖາບັນວິທະຍາສາດສັງຄົມແຫ່ງຊາດ', 0, '56', '2017-09-06 19:58:52', 5, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (56, 'ສະຖາບັນການເມືອງການປົກຄອງແຫ່ງຊາດ', 0, '57', '2017-09-06 19:58:52', 5, 0, NULL, NULL, NULL, '2017-09-06 19:58:52'),
            (57, 'ອົງການກວດສອບແຫ່ງລັດ', 0, '58', '2017-09-06 19:58:52', 2, 0, NULL, NULL, NULL, '2017-09-06 19:58:52');
                        
        
            
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
                        
            set foreign_key_checks=1;
            ";
        $this->execute($sql);
        
        
        

    }

    public function safeDown()
    {
        $sql = "
            set foreign_key_checks=0;
            
            set foreign_key_checks=1;
            ";
        $this->execute($sql);
    }
}
