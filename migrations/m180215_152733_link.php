<?php

use yii\db\Migration;

/**
 * Class m180215_152733_link
 */
class m180215_152733_link extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
$sql = "CREATE TABLE link
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX link_id_uindex ON link (id);";
$this->execute($sql);
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180215_152733_link cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180215_152733_link cannot be reverted.\n";

        return false;
    }
    */
}
