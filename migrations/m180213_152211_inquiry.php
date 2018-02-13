<?php

use yii\db\Migration;

/**
 * Class m180213_152211_inquiry
 */
class m180213_152211_inquiry extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $sql = "CREATE TABLE inquiry
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    title VARCHAR(200) NOT NULL,
    body TEXT,
    post_date DATETIME NOT NULL,
    replied INT DEFAULT 0 NOT NULL
);";
        $this->execute($sql);
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180213_152211_inquiry cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180213_152211_inquiry cannot be reverted.\n";

        return false;
    }
    */
}
