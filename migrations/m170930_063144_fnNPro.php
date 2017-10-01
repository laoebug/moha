<?php

use yii\db\Migration;

class m170930_063144_fnNPro extends Migration
{
    
	public function safeUp()
	{
		$sql = "
            set foreign_key_checks=0;
			DROP FUNCTION IF EXISTS `getActionIdAction`;
			CREATE FUNCTION `getActionIdAction` (`i_role_id` INT(11), `i_action_id` INT(11)) RETURNS INT(11) 
    		BEGIN 
				DECLARE result int(11);
                SELECT action_id INTO result 
                FROM role_has_action 
                WHERE role_id=i_role_id AND action_id=i_action_id ;										                                
                IF result IS NULL THEN
                    SET result=0;                   		
                END IF;
                
                RETURN result;
			END;			
				
			CREATE FUNCTION `getRoleIdAction` (`i_role_id` INT(11), `i_action_id` INT(11)) RETURNS INT(11) 
    		BEGIN 
				DECLARE result int(11);
                SELECT role_id INTO result 
                FROM role_has_action 
                WHERE role_id=i_role_id AND action_id=i_action_id ;										                                
                IF result IS NULL THEN
                    SET result=0;                   		
                END IF;
                
                RETURN result;
			END;
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
	
           set foreign_key_checks=1;
            ";
		$this->execute($sql);
	
	}
	
	
}
