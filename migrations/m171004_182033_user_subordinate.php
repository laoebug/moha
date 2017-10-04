<?php
use yii\db\Migration;
class m171004_182033_user_subordinate extends Migration {
	public function safeUp() {
		$sql = "
            set foreign_key_checks=0;
				DROP TABLE IF EXISTS `user_subordinate`;
    			CREATE TABLE `user_subordinate` (
    			`user_id` int(11) NOT NULL,
    			`subordinate_user_id` int(11) NOT NULL,
    			PRIMARY KEY (`user_id`,`subordinate_user_id`),
    			KEY `fk_user_has_user_user2_idx` (`subordinate_user_id`),
    			KEY `fk_user_has_user_user1_idx` (`user_id`),
    			CONSTRAINT `fk_user_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
    			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
           set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
	public function safeDown() {
		$sql = "
            set foreign_key_checks=0;
   			DROP TABLE IF EXISTS `user_subordinate`;	   
            set foreign_key_checks=1;
            ";
		$this->execute ( $sql );
	}
}
