<?php

use yii\db\Migration;

/**
 * Class m180213_143709_content
 */
class m180213_143709_content extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
$sql = "CREATE TABLE content
(
    code VARCHAR(20) PRIMARY KEY NOT NULL,
    value TEXT
);
CREATE UNIQUE INDEX content_code_uindex ON content (code);";
$this->execute($sql);
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180213_143709_content cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180213_143709_content cannot be reverted.\n";

        return false;
    }
    */
}
