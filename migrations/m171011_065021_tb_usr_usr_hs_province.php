<?php

use yii\db\Migration;

class m171011_065021_tb_usr_usr_hs_province extends Migration
{
	public function safeUp() {
		$sql = "
            set foreign_key_checks=0;
				DROP TABLE IF EXISTS `user`;
			  CREATE TABLE  `moha`.`user` (
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
			  `province_id` int(11) DEFAULT NULL,
			  PRIMARY KEY (`id`),
			  UNIQUE KEY `username_UNIQUE` (`username`),
			  KEY `fk_user_id` (`user_id`),
			  KEY `fk_user_role_id` (`role_id`),
			  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
			  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
			) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
	
			INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`,`role_id`) VALUES
				(1, 'admin', 'admin', 'Administrator', '', 'A', '', NULL, 0,1);
				
			DROP TABLE IF EXISTS `user_has_province`;
			CREATE TABLE  `moha`.`user_has_province` (
			  `user_id` int(11) NOT NULL,
			  `province_id` int(11) NOT NULL,
			  PRIMARY KEY (`user_id`,`province_id`),
			  KEY `fk_user_has_province_idx` (`province_id`),
			  KEY `fk_user_has_user_idx` (`user_id`),
			  CONSTRAINT `fk_user_has_province_idx` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
			  CONSTRAINT `fk_user_has_user_idx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
							
           set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	public function safeDown() {
		$sql = "
            set foreign_key_checks=0;
   			DROP TABLE IF EXISTS `user`;	 
			DROP TABLE IF EXISTS `user_has_province`;
            set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	
}
