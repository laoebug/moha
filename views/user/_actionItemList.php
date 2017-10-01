
<?php if (isset ( $role)) : ?>
	<h4><?php echo Yii::t("app","Role") . " : " .$role["name"]; ?> </h4>
<?php endif;?>

<?php createActionTreeView($actionList, 0); ?>
    

<?php
function createActionTreeView($array, $currentParent, $currLevel = 0, $prevLevel = -1) {
	foreach ( $array as $actionId => $action ) {
		
		if ($currentParent == $action ['parent_id']) {
			if ($currLevel > $prevLevel)
				echo " <ol class='tree'> ";
			if ($currLevel == $prevLevel)
				echo " </li> ";
			$checked = "";		
			if ($action ['id'] == $action ['action_id']) {
				$checked = "checked";
			}
			
			$output="";
			$output.='<li>';
			$output.='<input type="checkbox" value="' . $action ['id'] . '"   '.$checked .' name="actionList[]" id="actionList[]"/>';
			$output.='<label> &nbsp; ' . $action ['name'] . '</label>';
			$output.='</li>';

			
			echo $output;
			
			if ($currLevel > $prevLevel) {
				$prevLevel = $currLevel;
			}
			
			$currLevel ++;
			createActionTreeView ( $array, $actionId, $currLevel, $prevLevel );
			
			$currLevel --;
		}
	}
	
	if ($currLevel == $prevLevel)
		echo " </li>  </ol> ";
}
?>