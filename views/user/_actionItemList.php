
<?php if (isset ( $role)) : ?>
<h4><?php echo Yii::t("app","Role") . " : " .$role["name"]; ?> </h4>
<?php endif;?>

<label class="checkbox-inline"> <input type="checkbox"
	id="select_all_action" /> <span class="label-text"><strong><?php echo Yii::t("app","Selecct All"); ?></strong></span>

</label>

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
			
			echo '<li>' . ' <input class="action" type="checkbox" value="' . $action ['id'] . '"   ' . $checked . ' name="actionList[]" id="actionList[]"/> '. '   '. $action ["name"];
			
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

<script type="text/javascript">

$(document).ready(function(){


	//select all checkboxes
	$("#select_all_action").change(function(){  //"select all" change		
	    var status = this.checked; // "select all" checked status
	    $('.action').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });	   
	});

	$('.action').change(function(){ //".checkbox" change
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all_action")[0].checked = false; //change "select all" checked status to false
	    }
	   
	    //check "select all" if all checkbox items are checked
	    if ($('.action:checked').length == $('.action').length ){
	        $("#select_all_action")[0].checked = true; //change "select all" checked status to true
	    }
	});

	checkAllAction();
	function checkAllAction(){

		var numberOfActionCheckBoxes = $('.action').length;
		var numberOfActionChildCheckBox = $('.action:checked').length;
		if (numberOfActionChildCheckBox == numberOfActionCheckBoxes)
		     $("#select_all_action").prop('checked', true);
		  else
		     $("#select_all_action").prop('checked', false);


	}

	$('.action').change(function () {
		checkAllAction();
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