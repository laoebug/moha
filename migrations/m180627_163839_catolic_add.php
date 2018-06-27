<?php

use yii\db\Migration;

/**
 * Class m180627_163839_catolic_add
 */
class m180627_163839_catolic_add extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $sql = 'ALTER TABLE stat_religion_teacher_detail ADD christ_novice_total INT NULL;
ALTER TABLE stat_religion_teacher_detail ADD christ_novice_women INT NULL;';
        $this->execute($sql);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180627_163839_catolic_add cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180627_163839_catolic_add cannot be reverted.\n";

        return false;
    }
    */
}
