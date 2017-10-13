<?php if (isset ( $role)) : ?>
	<h4><?php echo Yii::t("app","Role") . " : " .$role["name"]; ?> </h4>
<?php endif;?>
<input type="hidden" id="the_role_id" value="<?php echo isset($role["id"]) ?$role["id"]:""; ?>" >
<!-- <div class="animated-checkbox"> -->
	<label class="checkbox-inline">
	<input type="checkbox"  id="select_all_menu" /> <span class="label-text"><strong><?php echo Yii::t("app","Selecct All"); ?></strong></span>
	
	</label>    
<!-- </div> -->
<!-- <div class="animated-checkbox">            	 -->
<?php createMenuTreeView($menuList, 0); ?>
<!-- </div> -->

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
			//$output.='<div class="animated-checkbox">';
			$output.='<input class="menu" type="checkbox" value="' . $menu ['id'] . '"   '.$checked .' name="menuList[]" id="menuList[]"/>';
			//$output.='<label> &nbsp; <span class="label-text"> ' . $menu ['name'] . '</span> </label>';
			$output.='<span class="label-text"> ' . $menu ['name'] . '</span>';
			//$output.='</div>';
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
	
	   
});

</script>