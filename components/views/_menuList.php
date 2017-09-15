<?php
// use Yii;
use app\models\User;
use app\models\Menu;
?>
 
<?php
function displayMenu($menu_parent_id)
{
    $default_icon="fa fa-bars";
    $icon="";
    $menuList = "";
    $authorizeMenus = [];
    $user = User::findOne(Yii::$app->user->id);
    try {

        
           $sql = " select o1.*,ifnull(child_count.count,0) as child_count from (SELECT a.* FROM menu a ,  role_has_menu b ";
           $sql.= " WHERE a.id=b.menu_id ";
           $sql.= " and b.role_id=:role_id ";
           $sql.= " and b.accessible=:accessible ";
           $sql.= " and a.menu_parent_id=:menu_parent_id ) o1 ";
           $sql.= " LEFT OUTER JOIN ( ";
           $sql.= " SELECT menu_parent_id, COUNT(*) AS count FROM `menu` am,role_has_menu rm ";
           $sql.= " WHERE am.id=rm.menu_id ";
           $sql.= " and rm.accessible=:accessible ";
           $sql.= " and rm.role_id=:role_id ";
           $sql.= " GROUP BY menu_parent_id ) child_count";                
           $sql.= " ON o1.id = child_count.menu_parent_id order by o1.name";
                
        
                
        
        
        $params = [
            ':role_id' => $user->role_id,
            ':accessible' => 1,
            ':menu_parent_id' => $menu_parent_id,
            ':accessible' => 1,
            ':role_id' => $user->role_id
        ];
        $authorizeMenus = Menu::findBySql($sql, $params)->all();
                
        foreach ($authorizeMenus as $menu) {            
            
            /**
             * top root parent
             * 
             */
            $left_icon='';
            $right_icon='';
            $class_tree_view_menu='';
            $url='';
            $li='<li>';
            if(isset($menu->icon)){
                $left_icon=$menu->icon;
            }else{ 
                $left_icon='fa fa-bar-chart';
            }
            if($menu->child_count>0){
                $right_icon = 'fa fa-angle-right'; 
                $li ='<li class="treeview">';
                $class_tree_view_menu='treeview-menu';
            }            
            $menuList.=$li;
            if(isset($menu->url)){
                $url=$menu->url;
            }else{
                $url='#';
            }
            
            //top root link
            $menuList.='<a href="'. $url. '">';
            
            $menuList.='<i class="'. $left_icon .' "></i>';
            
            $menuList.'<span>';
            
            $menuList.=Yii::t("app",$menu->name);
            
            $menuList.='</span>';
            
            $menuList.='<i class="' .$right_icon .' "></i> ';
            
            $menuList.='</a>'; 
            //end top root link
            
            //child menu <ul> call recursively
            $menuList .= "<ul class='".$class_tree_view_menu.  "'> </i>" . displayMenu($menu['id']) . "</ul>"; 
            //end child menu <ul>
            
            $menuList.='</li>'; //end top root parent
  
        }
    } catch (Exception $e) {
//        echo "Data could not be retrieved";
        Yii::$app->session->setFlash('danger', "Menu could not be retrieved");
//        exit();
    }
    return $menuList;
}
?>
<!-- <ul class="sidebar-menu"> -->
<?php echo displayMenu(0); ?>




