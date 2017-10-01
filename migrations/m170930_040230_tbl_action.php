<?php

use yii\db\Migration;

class m170930_040230_tbl_action extends Migration
{
 public function safeUp()
    {
    	$sql = "
            set foreign_key_checks=0;
   		   
    	   DROP TABLE IF EXISTS `action`;
			CREATE TABLE `action` (
			  `id` int(11) NOT NULL AUTO_INCREMENT,
			  `class_name` varchar(255) NOT NULL,
			  `method` varchar(255) NOT NULL,
			  `deleted` int(11) NOT NULL DEFAULT 0,
			  `controller_id` int(11) NULL DEFAULT 0,
			  `description` text,
    		  `parent_id` int(11) NULL DEFAULT 0,	
			  PRIMARY KEY (`id`,`class_name`,`method`) 
			  
			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
            set foreign_key_checks=1;
            ";
    	$this->execute($sql);
    	
    	
    }
    
    public function safeDown()
    {
    	$sql = "
            set foreign_key_checks=0;
    	
	       DROP TABLE IF EXISTS `action`;
			
           set foreign_key_checks=1;
            ";
    	$this->execute($sql);
    	 
    }
}
