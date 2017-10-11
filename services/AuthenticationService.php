<?php
namespace app\services;

use Yii;
use app\models\User;
use app\models\Menu; 

class AuthenticationService
{

    public static function getAuthorizedMenuAndRole()
    {
        
        $authorizeMenus = [];
        $user = User::findOne(Yii::$app->user->id);
        try {
            
            $sql = " select o1.*,ifnull(child_count.count,0) as child_count from (SELECT a.* FROM menu a ,  role_has_menu b ";
            $sql .= " WHERE a.id=b.menu_id ";
            $sql .= " and b.role_id=1 ";
            $sql .= " and b.accessible=1 ";
            $sql .= " and a.menu_parent_id=0 ) o1 ";
            $sql .= " LEFT OUTER JOIN (SELECT menu_parent_id, COUNT(*) AS count FROM `menu` GROUP BY menu_parent_id) child_count";
            $sql .= " ON o1.id = child_count.menu_parent_id order by o1.name";

//             $sql =" select o1.*,ifnull(child_count.count,0) as child_count from (SELECT a.* FROM menu a ,  role_has_menu b ";
//             $sql.=" WHERE a.id=b.menu_id ";
//             $sql.=" and b.role_id=:role_id ";
//             $sql.=" and b.accessible=:accessible ";
//             $sql.=" and a.menu_parent_id=:menu_parent_id ) o1 ";
//             $sql.=" LEFT OUTER JOIN (SELECT menu_parent_id, COUNT(*) AS count FROM `menu` GROUP BY menu_parent_id) child_count";
//             $sql.=" ON o1.id = child_count.menu_parent_id order by o1.name ";
//             echo $sql;exit;
            
            $params = [
                ':role_id' => $user->role_id,
                ':accessible' => 1,
                //':menu_parent_id' => $menu_parent_id
            ];
            $authorizeMenus = Menu::findBySql($sql, $params)->all();
        } catch (Exception $e) {
            echo "Data could not be retrieved";
            exit();
        }
        
        return $authorizeMenus;
    }
    
    public static function isAccessibleAction($controller_id,$action_id){
    	$isAccessisbleAction = false;
    	echo $action_id;exit;
    	echo $controller_id;exit;
    	
    	return $isAccessisbleAction;
    }
    
}