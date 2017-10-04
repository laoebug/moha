<?php

use yii\db\Migration;

class m171004_163823_drop_func extends Migration
{
	public function safeUp()
	{
		$sql = "
            set foreign_key_checks=0;
   
	       DROP FUNCTION IF EXISTS `getActionIdAction`;
		   DROP FUNCTION IF EXISTS `getRoleIdAction`;
		   DROP FUNCTION IF EXISTS `getRoleId`;
		   DROP FUNCTION IF EXISTS `getMenuId`;
	
           set foreign_key_checks=1;
            ";
		$this->execute($sql);
	
		 
	}
	
	public function safeDown()
	{
		$sql = "
            set foreign_key_checks=0;
   
	       DROP FUNCTION IF EXISTS `getActionIdAction`;
		   DROP FUNCTION IF EXISTS `getRoleIdAction`;
		   DROP FUNCTION IF EXISTS `getRoleId`;
		   DROP FUNCTION IF EXISTS `getMenuId`;
	
           set foreign_key_checks=1;
            ";
		$this->execute($sql);
	
	}
}
