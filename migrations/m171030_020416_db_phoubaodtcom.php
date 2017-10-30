<?php

use yii\db\Migration;

class m171030_020416_db_phoubaodtcom extends Migration
{
public function safeUp() {
		$sql = file_get_contents(dirname(__FILE__).'/moha_phoubao.sql');
		$this->execute ( $sql );

	}
	public function safeDown() {
// 		$sql = "
// 	        SELECT CONCAT('DROP TABLE IF EXISTS `', table_schema, '`.`', table_name, '`;')
// 			FROM   information_schema.tables
// 			WHERE  table_schema = 'moha';
			
//             ";
		
// 		$sql_drop = $this->execute ( $sql );
// 		$this->execute ( $sql_drop );
	}
}
