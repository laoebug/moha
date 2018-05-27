<?php if (isset ( $role)) : ?>
<h4><?php echo Yii::t("app","Role") . " : " .$role["name"]; ?> </h4>
<?php endif;?>
<input type="hidden" id="the_role_id"
	value="<?php echo isset($role["id"]) ?$role["id"]:""; ?>">
<label class="checkbox-inline"> <input type="checkbox"
	id="select_all_menu" /> <span class="label-text"><strong><?php echo Yii::t("app","Select All"); ?></strong></span>

</label>
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
			$dataInputUser="";
			if(isset($menu->has_province) && $menu->has_province==1){
				$dataInputUser=Yii::t("app","Table for provincial user input data");
			}else{				
				$dataInputUser=Yii::t("app","Table for central user input data");
			}
			
			//echo '<li>' . ' <input type="checkbox" class="menu"  value="' . $menu ['id'] . '"   ' . $checked . ' name="menuList[]" id="menuList[]"/>'. '   '. $menu ["name"]. $dataInputUser;
			echo '<li>' . ' <input type="checkbox" class="menu"  value="' . $menu ['id'] . '"   ' . $checked . ' name="menuList[]" id="menuList[]"/>'. '   '. $menu ["name"];
			
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

<script type="text/javascript">

$(document).ready(function(){


	//select all checkboxes
	$("#select_all_menu").change(function(){  //"select all" change		
	    var status = this.checked; // "select all" checked status
	    $('.menu').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });	   
	});

	$('.menu').change(function(){ //".checkbox" change
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all_menu")[0].checked = false; //change "select all" checked status to false
	    }
	   
	    //check "select all" if all checkbox items are checked
	    if ($('.menu:checked').length == $('.menu').length ){
	        $("#select_all_menu")[0].checked = true; //change "select all" checked status to true
	    }
	});


	checkAllMenu();
	function checkAllMenu(){
		var numberOfMenuCheckBoxes = $('.menu').length;
		var numberOfMenuChildCheckBox = $('.menu:checked').length;
		if (numberOfMenuChildCheckBox == numberOfMenuCheckBoxes)
		     $("#select_all_menu").prop('checked', true);
		  else
		     $("#select_all_menu").prop('checked', false);


	}

	$('.menu').change(function () {
		checkAllMenu();
	});

	$('input[type=checkbox]').click(function(){
	    // children checkboxes depend on current checkbox
	    $(this).next().find('input[type=checkbox]').prop('checked',this.checked);
	    // go up the hierarchy - and check/uncheck depending on number of children checked/unchecked
	    $(this).parents('ol').prev('input[type=checkbox]').prop('checked',function(){
	        return $(this).next().find(':checked').length;
	    });
	});
	   
});

</script>