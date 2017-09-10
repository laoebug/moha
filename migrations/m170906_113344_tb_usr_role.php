<?php

use yii\db\Migration;

class m170906_113344_tb_usr_role extends Migration
{
    public function safeUp()
    {
        
        $sql = "
            set foreign_key_checks=0;
            DROP TABLE IF EXISTS `user_has_role`;
            
            DROP TABLE IF EXISTS `user`;
            CREATE TABLE IF NOT EXISTS `moha`.`user` (
            `id` INT(11) NOT NULL AUTO_INCREMENT,
            `username` VARCHAR(50) NOT NULL,
            `password` VARCHAR(100) NOT NULL,
            `firstname` VARCHAR(255) NOT NULL,
            `lastname` VARCHAR(255) NOT NULL,
            `status` VARCHAR(1) NOT NULL DEFAULT 'A',
            `tel` VARCHAR(50) NOT NULL,
            `email` VARCHAR(100) NULL DEFAULT NULL,
            `deleted` INT(11) NOT NULL DEFAULT 0,
            `role_id` INT(11) NOT NULL,
            `user_id` INT(11) NULL DEFAULT NULL,
            `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (`id`),
            CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
            CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
            UNIQUE INDEX `username_UNIQUE` (`username` ASC))
            ENGINE = InnoDB
            DEFAULT CHARACTER SET = utf8;
        
            INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`,`role_id`) VALUES
            (1, 'admin', 'admin', 'Administrator', '', 'A', '', NULL, 0,1);
        
            DROP TABLE IF EXISTS `role`;
            
            
            CREATE TABLE `moha`.`role`(
              `id` INT(11) NOT NULL AUTO_INCREMENT,
              `name` VARCHAR(45) NOT NULL,
              `deleted` INT(11) NOT NULL DEFAULT 0,
              PRIMARY KEY (`id`),
            `user_id` INT(11) NULL DEFAULT NULL,
            `input_dt_stamp` DATETIME DEFAULT CURRENT_TIMESTAMP,
              CONSTRAINT `fk_role_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
              UNIQUE INDEX `name_UNIQUE` (`name` ASC))
            ENGINE = InnoDB
            DEFAULT CHARACTER SET = utf8;
            
            insert into role(name,deleted,user_id) value ('Super Admin',0,1);
                
            set foreign_key_checks=1;
            ";
        $this->execute($sql);
        
        
        

    }

    public function safeDown()
    {
//         $sql = "
//             set foreign_key_checks=0;
//             DROP TABLE IF EXISTS `menu`;
      
        
//             DROP TABLE IF EXISTS `menugroup`;
        
//             set foreign_key_checks=1;
//             ";
//         $this->execute($sql);
    }

   
}
