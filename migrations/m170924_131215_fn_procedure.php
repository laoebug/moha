<?php

use yii\db\Migration;

class m170924_131215_fn_procedure extends Migration
{
  
    public function safeUp()
    {
    	$sql = "
            set foreign_key_checks=0;
   		   
    	   DROP FUNCTION IF EXISTS `getMenuId`;
	       CREATE FUNCTION `getMenuId` (`i_role_id` INT(11), `i_menu_id` INT(11))
	       		RETURNS INT(11)
	       BEGIN 
					DECLARE result int(11);
	                SELECT menu_id INTO result 
	                FROM role_has_menu 
	                WHERE role_id=i_role_id AND menu_id=i_menu_id ;										                                
	                IF result IS NULL THEN
	                    SET result=0;                   		
	                END IF;
	                
	                RETURN result;
			END;			
			
    		DROP FUNCTION IF EXISTS `getRoleId`;
			CREATE FUNCTION `getRoleId` (`i_role_id` INT(11), `i_menu_id` INT(11)) RETURNS INT(11) 
    		BEGIN 
				DECLARE result int(11);
                SELECT role_id INTO result 
                FROM role_has_menu 
                WHERE role_id=i_role_id AND menu_id=i_menu_id ;										                                
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
    	
	       DROP FUNCTION IF EXISTS `getMenuId`;
    	   DROP FUNCTION IF EXISTS `getRoleId`;
			
            set foreign_key_checks=1;
            ";
    	$this->execute($sql);
    	 
    }
    
}
