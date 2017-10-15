<?php

use yii\db\Migration;

class m171014_080512_tb_role_updte extends Migration
{
	public function safeUp() {
		$sql = "
            set foreign_key_checks=0;
			DROP TABLE IF EXISTS `role`;
			
              CREATE TABLE `moha`.`role`(
            `id` int(11) NOT NULL AUTO_INCREMENT,
    		`name` varchar(45) NOT NULL,
    		`deleted` int(11) NOT NULL DEFAULT '0',
    		`user_id` int(11) DEFAULT NULL,
    		`input_dt_stamp` datetime DEFAULT CURRENT_TIMESTAMP,
    		`is_province` int(11) DEFAULT '0',
    		PRIMARY KEY (`id`),
              CONSTRAINT `fk_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              UNIQUE INDEX `name_UNIQUE` (`name` ASC))
            ENGINE = InnoDB
            DEFAULT CHARACTER SET = utf8;
				
			
			INSERT INTO `role` (`id`, `name`, `deleted`, `user_id`, `input_dt_stamp`, `is_province`)
			VALUES
			(1, 'Super Admin', 0, 1, '2017-09-24 19:04:46', 0);
				
				
           set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	public function safeDown() {
		$sql = "
            set foreign_key_checks=0;
   			
            set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	
    
    
    		
}
