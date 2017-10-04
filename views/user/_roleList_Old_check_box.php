<script type="text/javascript" src="js/jquery/jquery-3.2.1.js"></script>

<div class="bs-component">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title"><?php echo Yii::t("app","Roles")?></h3>
		</div>
		<div class="panel-body">
			
			<div class="row">
            	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            
            		<div class="animated-checkbox">
            			<label class="checkbox-inline"> <input type="checkbox"
            				id="select_all" /> <span class="label-text"><strong><?php echo Yii::t("app","Selecct All"); ?></strong></span>
            			</label>
            		</div>
            
            	</div>
            	<br />
            	<div class="row">
            		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            
            		<?php foreach ($roles as $key => $role): ?>		
                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
            				<label class="checkbox-inline"> <?php $checked="";?> 
                                                                        				<?php //echo $key;exit;?>
                                                                        				<?php //if($key=="student_code" || $key=="first_name"  ||  $key=="eng_first_name" || $key=="eng_last_name" || $key=="last_name" || $key=="gender" || $key=="birth_date" || $key=="title_description" || $key=="full_name" || $key=="full_eng_last_name"):?>
                    					<?php $checked="checked";?>
                                                                        				<?php //endif;?>
            							<div class="animated-checkbox">
            							<input class="checkbox" type="checkbox"
            							value="<?php echo $key; ?>" name="role[]" id="role[]"
            							<?php //echo $checked; ?>> <span class="label-text"><?php echo $role->name; ?></span>
            							</div>
            				</label>
            			</div>
                                                            				
            		<?php endforeach;?>
                                                                        
            		</div>
            
            	</div>
            
            </div>
		
		
		</div>
	</div>
		
</div>



<script type="text/javascript">

$(document).ready(function(){


	//select all checkboxes
	$("#select_all").change(function(){  //"select all" change
	    var status = this.checked; // "select all" checked status
	    $('.checkbox').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });
	});

	$('.checkbox').change(function(){ //".checkbox" change
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all")[0].checked = false; //change "select all" checked status to false
	    }
	   
	    //check "select all" if all checkbox items are checked
	    if ($('.checkbox:checked').length == $('.checkbox').length ){
	        $("#select_all")[0].checked = true; //change "select all" checked status to true
	    }
	});

	   
});

</script>