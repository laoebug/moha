<?php
use yii\db\Migration;
class m171030_075007_mh20171030 extends Migration {
	public function safeUp() {
		$sql = file_get_contents ( dirname ( __FILE__ ) . '/moha_20171030.sql' );
		$this->execute ( $sql );
	}
	public function safeDown() {
		$connection = Yii::$app->db;
		$hostName = $this->getDsnAttribute ( 'mysql:host', $connection->dsn );
		$dbName = $this->getDsnAttribute ( 'dbname', $connection->dsn );
		$userName = $connection->username;
		$password = $connection->password;
		$sql = " SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA= DATABASE()  AND TABLE_NAME<>'migration'; ";
		$mysqli = new mysqli ( $hostName, $userName, $password, $dbName );
		$mysqli->query ( 'SET foreign_key_checks = 0' );
		if ($result = $mysqli->query ( $sql )) {
			while ( $row = $result->fetch_array ( MYSQLI_NUM ) ) {
				$mysqli->query ( 'DROP TABLE IF EXISTS ' . $row [0] );
			}
		}
		
		$mysqli->query ( 'SET foreign_key_checks = 1' );
		$mysqli->close ();
	}
	private function getDsnAttribute($name, $dsn) {
		if (preg_match ( '/' . $name . '=([^;]*)/', $dsn, $match )) {
			return $match [1];
		} else {
			return null;
		}
	}
}
