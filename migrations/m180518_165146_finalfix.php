<?php

use yii\db\Migration;

/**
 * Class m180518_165146_finalfix
 */
class m180518_165146_finalfix extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $sql = 'set foreign_key_checks=0;		
		ALTER TABLE `moha`.`stat_map_service_detail` ADD COLUMN `position` varchar(10)  NULL DEFAULT NULL AFTER `remark`;
		set foreign_key_checks=1;	';
        $this->execute($sql);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180518_165146_finalfix cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180518_165146_finalfix cannot be reverted.\n";

        return false;
    }
    */
}
