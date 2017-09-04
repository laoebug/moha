<?php

use yii\db\Migration;

class m170901_015159_fix_menu_tabl extends Migration
{
    public function safeUp()
    {
        $sql = "
            set foreign_key_checks=0;
            
            DROP TABLE IF EXISTS `menugroup`;
            CREATE TABLE `menugroup` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(255) NOT NULL,
              `deleted` int(11) NOT NULL DEFAULT '0',
              `input_id` int(11)   DEFAULT NULL,
              `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
              PRIMARY KEY (`id`),          
              UNIQUE KEY `name_UNIQUE` (`name`),
              CONSTRAINT `fk_menugroup_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
            
            
            DROP TABLE IF EXISTS `menu`;
            CREATE TABLE `menu` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(45) NOT NULL,
              `url` varchar(255) DEFAULT NULL,
              `description` varchar(255) DEFAULT NULL,
              `deleted` int(11) NOT NULL DEFAULT '0',
              `menugroup_id` int(11) DEFAULT NULL,
              `menu_parent_id` int(11) DEFAULT NULL,
              `input_id` int(11)   DEFAULT NULL,
              `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,            
              PRIMARY KEY (`id`),
              KEY `fk_menu_menugroup1_idx` (`menugroup_id`),
              KEY `fk_menu_menu1_idx` (`menu_parent_id`),
              CONSTRAINT `fk_menu_user_id` FOREIGN KEY (`input_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              CONSTRAINT `fk_menu_menu1` FOREIGN KEY (`menu_parent_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              CONSTRAINT `fk_menu_menugroup1` FOREIGN KEY (`menugroup_id`) REFERENCES `menugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
            
             INSERT INTO `menugroup` (`id`,`name`, `deleted`, `input_id`) VALUES 
            (1,'ການຕັ້ງຄ່າ', 0, 1),
            (2,'ຜູ້ຄຸ້ມຄອງລະບົບນ', 0, 1);
            
            
            
            set foreign_key_checks=1;
            ";
        $this->execute($sql);
    }
    

    public function safeDown()
    {
        $sql = "
            set foreign_key_checks=0;
            DROP TABLE IF EXISTS `menu`;
            CREATE TABLE `menu` (
              `id` int(11) NOT NULL AUTO_INCREMENT,
              `name` varchar(45) NOT NULL,
              `url` varchar(255) NOT NULL,
              `deleted` int(11) NOT NULL DEFAULT '0',
              `menugroup_id` int(11) NOT NULL,
              PRIMARY KEY (`id`),
              KEY `fk_menu_menugroup1_idx` (`menugroup_id`),                          
              CONSTRAINT `fk_menu_menugroup1` FOREIGN KEY (`menugroup_id`) REFERENCES `menugroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
            ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
            
            
            DROP TABLE IF EXISTS `menugroup`;
            
            set foreign_key_checks=1;
            ";
        $this->execute($sql);
    }

  
}
