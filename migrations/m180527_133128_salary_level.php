<?php

use yii\db\Migration;

/**
 * Class m180527_133128_salary_level
 */
class m180527_133128_salary_level extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $sql = '
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'TRADITIONAL,ALLOW_INVALID_DATES\';


ALTER TABLE `moha`.`stat_officer_salary_detail` 
ADD COLUMN `salary_level_id` INT(11) NOT NULL AFTER `officer_level_id`,
ADD INDEX `fk_stat_officer_salary_detail_salary_level1_idx` (`salary_level_id` ASC);

CREATE TABLE IF NOT EXISTS `moha`.`salary_level` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `deleted` INT(11) NOT NULL DEFAULT 0,
  `last_update` DATETIME NOT NULL,
  `position` INT(11) NULL DEFAULT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_salary_level_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_salary_level_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `moha`.`stat_officer_salary_detail` 
ADD CONSTRAINT `fk_stat_officer_salary_detail_officer_level1`
  FOREIGN KEY (`officer_level_id`)
  REFERENCES `moha`.`officer_level` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_stat_officer_salary_detail_stat_officer_salary1`
  FOREIGN KEY (`stat_officer_salary_id`)
  REFERENCES `moha`.`stat_officer_salary` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_stat_officer_salary_detail_salary_level1`
  FOREIGN KEY (`salary_level_id`)
  REFERENCES `moha`.`salary_level` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
';
        $this->execute($sql);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180527_133128_salary_level cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180527_133128_salary_level cannot be reverted.\n";

        return false;
    }
    */
}
