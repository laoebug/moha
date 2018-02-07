<?php

use yii\db\Migration;

/**
 * Class m180202_144627_notification
 */
class m180202_144627_notification extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $sql = "
CREATE TABLE IF NOT EXISTS `moha`.`notice` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `created_date` DATETIME NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `show` INT(11) NOT NULL DEFAULT 1,
  `user_id` INT(11) NOT NULL,
  `position` INT(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_notice_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_notice_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moha`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
";
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180202_144627_notification cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180202_144627_notification cannot be reverted.\n";

        return false;
    }
    */
}
