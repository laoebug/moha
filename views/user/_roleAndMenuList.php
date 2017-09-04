
  
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<input type="checkbox" id="select_all" /> <strong>Selecct All</strong>
	</div>
	<br />
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                
                                                            <?php //$export_colums=$model->attributeExport(); ?>
                                                            
                                                            <?php foreach ($roles as $key => $role): ?>		
                                                                			
                                            						<div
				class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
				<label class="checkbox-inline"> 
                                                    				<?php $checked="";?> 
                                                    				<?php //echo $key;exit;?>
                                                    				<?php //if($key=="student_code" || $key=="first_name"  ||  $key=="eng_first_name" || $key=="eng_last_name" || $key=="last_name" || $key=="gender" || $key=="birth_date" || $key=="title_description" || $key=="full_name" || $key=="full_eng_last_name"):?>
                                                    				<?php $checked="checked";?>
                                                    				<?php //endif;?>                          				
                                                    				<input
					class="checkbox" type="checkbox" value="<?php echo $key; ?>"
					name="export_colum[]" id="export_colum[]" <?php echo $checked; ?>>
                                                    				<?php echo $role->name; ?>
                                                    				
                                                    				</label>
			</div>
                                                				
                                                            <?php endforeach;?>
                                                            
                                                        </div>

	</div>

</div>
