<?php

use yii\db\Migration;

class m170901_012901_init_db extends Migration
{
    public function safeUp()
    {
        $sql = "
            set foreign_key_checks=0;

-- MySQL Workbench Synchronization
-- Generated: 2017-09-03 21:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: adsavin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER SCHEMA `moha`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

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
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `user` (`id`, `username`, `password`, `firstname`, `lastname`, `status`, `tel`, `email`, `deleted`) VALUES
(1, 'admin', 'admin', 'Administrator', '', 'A', '', NULL, 0);
            
CREATE TABLE IF NOT EXISTS `moha`.`branch` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) NULL DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `tel` VARCHAR(255) NULL DEFAULT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `position` INT(11) NOT NULL DEFAULT 0,
  `remark` TEXT NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `ministry_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_branch_user1_idx` (`user_id` ASC),
  INDEX `fk_branch_ministry1_idx` (`ministry_id` ASC),
  CONSTRAINT `fk_branch_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_ministry1`
    FOREIGN KEY (`ministry_id`)
    REFERENCES `moha`.`ministry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`use_subcordinate` (
  `user_id` INT(11) NOT NULL,
  `subcordinate_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `subcordinate_user_id`),
  INDEX `fk_user_has_user_user2_idx` (`subcordinate_user_id` ASC),
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`subcordinate_user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`menu` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `menugroup_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_menu_menugroup1_idx` (`menugroup_id` ASC),
  CONSTRAINT `fk_menu_menugroup1`
    FOREIGN KEY (`menugroup_id`)
    REFERENCES `moha`.`menugroup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`role_has_menu` (
  `role_id` INT(11) NOT NULL,
  `menu_id` INT(11) NOT NULL,
  `accessible` VARCHAR(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`, `menu_id`),
  INDEX `fk_role_has_menu_menu1_idx` (`menu_id` ASC),
  INDEX `fk_role_has_menu_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_role_has_menu_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `moha`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_menu_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `moha`.`menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_goverment_unit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `last_update` DATETIME NOT NULL,
  `saved` INT(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_statistic1_user1_idx` (`user_id` ASC),
  INDEX `fk_stat_goverment_unit_phiscal_year1_idx` (`phiscal_year_id` ASC),
  CONSTRAINT `fk_statistic1_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_goverment_unit_phiscal_year1`
    FOREIGN KEY (`phiscal_year_id`)
    REFERENCES `moha`.`phiscal_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`user_has_role` (
  `user_id` INT(11) NOT NULL,
  `role_id` INT(11) NOT NULL,
  `set_date` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fk_user_has_role_role1_idx` (`role_id` ASC),
  INDEX `fk_user_has_role_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_role_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `moha`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`user_has_branch` (
  `user_id` INT(11) NOT NULL,
  `branch_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_id`, `branch_id`),
  INDEX `fk_user_has_branch_branch1_idx` (`branch_id` ASC),
  INDEX `fk_user_has_branch_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_branch_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_branch_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `moha`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`controller` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`action` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `controller_id` INT(11) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_action_controller1_idx` (`controller_id` ASC),
  CONSTRAINT `fk_action_controller1`
    FOREIGN KEY (`controller_id`)
    REFERENCES `moha`.`controller` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`role_has_action` (
  `role_id` INT(11) NOT NULL,
  `action_id` INT(11) NOT NULL,
  `allowed` VARCHAR(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`, `action_id`),
  INDEX `fk_role_has_action_action1_idx` (`action_id` ASC),
  INDEX `fk_role_has_action_role1_idx` (`role_id` ASC),
  CONSTRAINT `fk_role_has_action_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `moha`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_role_has_action_action1`
    FOREIGN KEY (`action_id`)
    REFERENCES `moha`.`action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`menugroup` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`ministry_group` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `position` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`message` (
  `id` INT(11) NOT NULL,
  `language` VARCHAR(16) CHARACTER SET 'utf8' NOT NULL,
  `translation` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `language`),
  INDEX `idx_message_language` (`language` ASC),
  CONSTRAINT `fk_message_source_message`
    FOREIGN KEY (`id`)
    REFERENCES `moha`.`source_message` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `moha`.`migration` (
  `version` VARCHAR(180) NOT NULL,
  `apply_time` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`phiscal_year` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `year` VARCHAR(255) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `status` VARCHAR(1) NULL DEFAULT NULL COMMENT 'o:openning\nc:closed',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `year_UNIQUE` (`year` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_goverment_unit_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `department` INT(11) NULL DEFAULT NULL,
  `insitute` INT(11) NULL DEFAULT NULL,
  `center` INT(11) NULL DEFAULT NULL,
  `stat_goverment_unit_id` INT(11) NOT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  `office` INT(11) NULL DEFAULT NULL,
  `ministry_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_goverment_unit_detail_stat_goverment_unit1_idx` (`stat_goverment_unit_id` ASC),
  INDEX `fk_stat_goverment_unit_detail_ministry1_idx` (`ministry_id` ASC),
  CONSTRAINT `fk_stat_goverment_unit_detail_stat_goverment_unit1`
    FOREIGN KEY (`stat_goverment_unit_id`)
    REFERENCES `moha`.`stat_goverment_unit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_goverment_unit_detail_ministry1`
    FOREIGN KEY (`ministry_id`)
    REFERENCES `moha`.`ministry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`goverment_level` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `position` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_legal` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `last_update` DATETIME NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `phiscal_year_id` INT(11) NOT NULL,
  `saved` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_legal_user1_idx` (`user_id` ASC),
  INDEX `fk_stat_legal_phiscal_year1_idx` (`phiscal_year_id` ASC),
  CONSTRAINT `fk_stat_legal_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_legal_phiscal_year1`
    FOREIGN KEY (`phiscal_year_id`)
    REFERENCES `moha`.`phiscal_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`legal_status` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_legal_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `new` INT(11) NULL DEFAULT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  `improve` INT(11) NULL DEFAULT NULL,
  `publish` INT(11) NULL DEFAULT NULL,
  `stat_legal_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_legal_detail_stat_legal1_idx` (`stat_legal_id` ASC),
  CONSTRAINT `fk_stat_legal_detail_stat_legal1`
    FOREIGN KEY (`stat_legal_id`)
    REFERENCES `moha`.`stat_legal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_single_gateway_implementation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `phiscal_year_id` INT(11) NOT NULL,
  `last_update` DATETIME NOT NULL,
  `saved` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_single_gateway_implementation_user1_idx` (`user_id` ASC),
  INDEX `fk_stat_single_gateway_implementation_phiscal_year1_idx` (`phiscal_year_id` ASC),
  CONSTRAINT `fk_stat_single_gateway_implementation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_single_gateway_implementation_phiscal_year1`
    FOREIGN KEY (`phiscal_year_id`)
    REFERENCES `moha`.`phiscal_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_single_gateway_implementation_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `stat_single_gateway_implementation_id` INT(11) NOT NULL,
  `start_date` DATETIME NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  `ministry_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_single_gateway_implementation_detail_stat_single_ga_idx` (`stat_single_gateway_implementation_id` ASC),
  INDEX `fk_stat_single_gateway_implementation_detail_ministry1_idx` (`ministry_id` ASC),
  CONSTRAINT `fk_stat_single_gateway_implementation_detail_stat_single_gate1`
    FOREIGN KEY (`stat_single_gateway_implementation_id`)
    REFERENCES `moha`.`stat_single_gateway_implementation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_single_gateway_implementation_detail_ministry1`
    FOREIGN KEY (`ministry_id`)
    REFERENCES `moha`.`ministry` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`province` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `position` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`district` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `province_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_district_province1_idx` (`province_id` ASC),
  CONSTRAINT `fk_district_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `moha`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`source_message` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(255) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `message` TEXT CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_source_message_category` (`category` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 83
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `moha`.`stat_association_foundation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `last_update` DATETIME NOT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `phiscal_year_id` INT(11) NOT NULL,
  `status` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_association_foundation_user1_idx` (`user_id` ASC),
  INDEX `fk_stat_association_foundation_phiscal_year1_idx` (`phiscal_year_id` ASC),
  CONSTRAINT `fk_stat_association_foundation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stat_association_foundation_phiscal_year1`
    FOREIGN KEY (`phiscal_year_id`)
    REFERENCES `moha`.`phiscal_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`stat_association_foundation_detail` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `association` INT(11) NULL DEFAULT NULL,
  `foundation` INT(11) NULL DEFAULT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  `stat_association_foundation_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stat_association_foundation_detail_stat_association_foun_idx` (`stat_association_foundation_id` ASC),
  CONSTRAINT `fk_stat_association_foundation_detail_stat_association_founda1`
    FOREIGN KEY (`stat_association_foundation_id`)
    REFERENCES `moha`.`stat_association_foundation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`accociation` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `approved_date` DATETIME NOT NULL,
  `province_id` INT(11) NULL DEFAULT NULL,
  `approved_by_moha` INT(11) NULL DEFAULT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  `position` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_accociation_province1_idx` (`province_id` ASC),
  CONSTRAINT `fk_accociation_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `moha`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`foundation` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `approved_date` DATETIME NOT NULL,
  `province_id` INT(11) NULL DEFAULT NULL,
  `approved_by_moha` INT(11) NULL DEFAULT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_foundation_province1_idx` (`province_id` ASC),
  CONSTRAINT `fk_foundation_province1`
    FOREIGN KEY (`province_id`)
    REFERENCES `moha`.`province` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`goverment_unit` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `branch_id` INT(11) NOT NULL,
  `position` INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_goverment_unit_branch1_idx` (`branch_id` ASC),
  CONSTRAINT `fk_goverment_unit_branch1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `moha`.`branch` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `moha`.`ministry` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `code` VARCHAR(5) NULL DEFAULT NULL,
  `last_update` DATETIME NOT NULL,
  `ministry_group_id` INT(11) NULL DEFAULT NULL,
  `position` INT(11) NOT NULL DEFAULT 0,
  `phiscal_year_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `remark` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ministry_ministry_group1_idx` (`ministry_group_id` ASC),
  INDEX `fk_ministry_phiscal_year1_idx` (`phiscal_year_id` ASC),
  INDEX `fk_ministry_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_ministry_ministry_group1`
    FOREIGN KEY (`ministry_group_id`)
    REFERENCES `moha`.`ministry_group` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ministry_phiscal_year1`
    FOREIGN KEY (`phiscal_year_id`)
    REFERENCES `moha`.`phiscal_year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ministry_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
            

            set foreign_key_checks=1;
            ";
        $this->execute($sql);
    }

    public function safeDown()
    {
        $sql = "
//             set foreign_key_checks=0;                     
//             DROP TABLE IF EXISTS `action`;
//             DROP TABLE IF EXISTS `branch`;
//             DROP TABLE IF EXISTS `user_has_role`;
//             DROP TABLE IF EXISTS `foundation`;
//             DROP TABLE IF EXISTS `user`;
//             DROP TABLE IF EXISTS `use_subcordinate`;
//             DROP TABLE IF EXISTS `user_has_branch`;
            
            
            
            
//             set foreign_key_checks=1;
            ";
        $this->execute($sql);
       
    }

 
}
