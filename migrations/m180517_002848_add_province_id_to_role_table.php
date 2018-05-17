<?php
use yii\db\Migration;

/**
 * Class m180517_002848_add_province_id_to_role_table
 */
class m180517_002848_add_province_id_to_role_table extends Migration {
	/**
	 * @inheritdoc
	 */
	public function safeUp() {
		$sql = "
		set foreign_key_checks=0;		
		ALTER TABLE `moha`.`role` ADD COLUMN `province_id` INT  NULL DEFAULT NULL AFTER `is_province`;
		set foreign_key_checks=1;		
	";
		$this->execute ( $sql );
	}
	
	/**
	 * @inheritdoc
	 */
	public function safeDown() {
		
	}
}
