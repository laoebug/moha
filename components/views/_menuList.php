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
//         $sql = " SELECT a.* FROM menu a , role_has_menu b ";
//         $sql .= " where a.id=b.menu_id and b.role_id=:role_id and b.accessible=:accessible and a.menu_parent_id=:menu_parent_id order by name ASC";
        
        
        $sql =" select o1.*,ifnull(child_count.count,0) as child_count from (SELECT a.* FROM menu a ,  role_has_menu b ";
        $sql.=" WHERE a.id=b.menu_id ";
        $sql.=" and b.role_id=:role_id ";
        $sql.=" and b.accessible=:accessible ";
        $sql.=" and a.menu_parent_id=:menu_parent_id ) o1 ";
        $sql.=" LEFT OUTER JOIN (SELECT menu_parent_id, COUNT(*) AS count FROM `menu` GROUP BY menu_parent_id) child_count";
        $sql.=" ON o1.id = child_count.menu_parent_id order by o1.name ";                             
        $params = [
            ':role_id' => $user->role_id,
            ':accessible' => 1,
            ':menu_parent_id' => $menu_parent_id
        ];
        $authorizeMenus = Menu::findBySql($sql, $params)->all();
        $class="";
        foreach ($authorizeMenus as $menu) {
            // $menuList='<li class=""><a href="index.php"><i class="fa fa-dashboard"></i><span>'.$menu["name"]. '</span></a></li>';
           // $menuList .= "<li><a href='" . $menu['url'] . "'>" .'<i class="'.$menu['icon']. '"></i><span>' .   $menu['name'] . "<span></a>";
           if($menu->child_count>0)
               $class="treeview";
            
            $menuList .= "<li>";
            
            $menuList .="<a href= $menu->url >";
            if(isset($menu->icon))
                $icon=$menu->icon;
            else 
                $icon=$default_icon;

            $menuList .="<i class='$icon'></i>";
            $menuList .="  $menu->name . $menu->child_count"."<br/>";
           // $menuList .="  $menu->id " ;
            $menuList .="</a>";
            $menuList .= "<ul>" . displayMenu($menu['id']) . "</ul>"; // call recursively
            
            $menuList .= "</li>";
        }
    } catch (Exception $e) {
        echo "Data could not be retrieved";
        exit();
    }
    return $menuList;
}
?>
<!-- <ul class="sidebar-menu"> -->
<?php echo displayMenu(0); ?>




