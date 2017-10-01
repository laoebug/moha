<?php if (isset ( $role)) : ?>
	<h4><?php echo Yii::t("app","Role") . " : " .$role["name"]; ?> </h4>
<?php endif;?>
<input type="hidden" id="the_role_id" value="<?php echo isset($role["id"]) ?$role["id"]:""; ?>" >
<?php createMenuTreeView($menuList, 0); ?>
    

<?php
function createMenuTreeView($array, $currentParent, $currLevel = 0, $prevLevel = -1) {
	foreach ( $array as $menuId => $menu ) {
		
		if ($currentParent == $menu ['menu_parent_id']) {
			if ($currLevel > $prevLevel)
				echo " <ol class='tree'> ";
			if ($currLevel == $prevLevel)
				echo " </li> ";
			$checked = "";
			if ($menu ['id'] == $menu ['menu_id']) {
				$checked = "checked";
			}
			
			$output="";
			$output.='<li>';
			$output.='<input type="checkbox" value="' . $menu ['id'] . '"   '.$checked .' name="menuList[]" id="menuList[]"/>';
			$output.='<label> &nbsp; ' . $menu ['name'] . '</label>';
			$output.='</li>';

			
			echo $output;
			
			if ($currLevel > $prevLevel) {
				$prevLevel = $currLevel;
			}
			
			$currLevel ++;
			createMenuTreeView ( $array, $menuId, $currLevel, $prevLevel );
			
			$currLevel --;
		}
	}
	
	if ($currLevel == $prevLevel)
		echo " </li>  </ol> ";
}
?>