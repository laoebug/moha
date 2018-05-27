<?php
// use Yii;
use app\models\Menu;
use app\models\User;

function displayTopMenu($menu_parent_id) {
	$li = '';
    $user = User::findOne(Yii::$app->user->id);
    try {
        $sql = "select o1.*,ifnull(child_count.count,0) as child_count from (SELECT a.*,CONCAT('?r=department/view&id=', id) as department_link  FROM menu a ,  role_has_menu b
        WHERE a.id=b.menu_id 
        and b.role_id=:role_id 
        and b.accessible=:accessible 
        and a.deleted=:deleted		
        and a.menu_parent_id=:menu_parent_id ) o1 
        LEFT OUTER JOIN ( 
        SELECT menu_parent_id, COUNT(*) AS count FROM `menu` am,role_has_menu rm 
        WHERE am.id=rm.menu_id 
        and rm.accessible=:accessible 
        and rm.role_id=:role_id 
        GROUP BY menu_parent_id ) child_count
        ON o1.id = child_count.menu_parent_id order by o1.position ASC";
		
        $params = [
            ':role_id' => $user->role_id,
            ':accessible' => 1,
        	':deleted'=>0,
            ':menu_parent_id' => $menu_parent_id,
            ':accessible' => 1,
            ':role_id' => $user->role_id
        ];

        $authorizeMenus = Menu::findBySql($sql, $params)->all();
        $li = '';
        foreach ($authorizeMenus as $menu) {
            $url = isset($menu->url) ? $menu->url : "#";
            if ($menu->child_count == 0) {
            	
               $li .= '<li><a href="index.php?r='.$url.'&id='.$menu->id.'">' . $menu->name . '</a>';
            	//$li .= '<li><a href="index.php?r='.$url.'">' . $menu->name . '</a>';
            } else {
                $caret = $menu_parent_id == 0?'<b class="caret"></b>' : '';
                if($menu_parent_id == 0){
                	$caret = '<b class="caret"></b>';
                }else{
                	$caret = ' ';
                }
                //$c = $menu_parent_id == 0 ? '' : 'dropdown-submenu';
                if($menu_parent_id== 0){
                	
                	$c='';
                	$li .= '<li class="'.$c.'"><a href="#" class="dropdown-toggle" data-toggle="dropdown">'.$menu->name.$caret.'</a>
                            <ul class="dropdown-menu">'.displayTopMenu($menu['id']).'</ul>';
                }else{
                	$c='dropdown-submenu';
                	$li .= '<li class="'.$c.'"><a href="'.$menu->department_link. '" class="dropdown-toggle" >'.$menu->name.$caret.'</a>
                            <ul class="dropdown-menu">'.displayTopMenu($menu['id']).'</ul>';
                }
                
//                $li .= '<li class="'.$c.'"><a href="'.$menu->department_link. '" class="dropdown-toggle" >'.$menu->name.$caret.'</a>
//                             <ul class="dropdown-menu">'.displayTopMenu($menu['id']).'</ul>';
                
            }
            $li .= '</li>';
        }
    } catch (Exception $e) {
        Yii::$app->session->setFlash('danger', "Menu could not be retrieved");
    }
    return $li;
}

echo displayTopMenu(0);
