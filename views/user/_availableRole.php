<div class="panel panel-info">
    		<div class="panel-heading">
    			<div class="card-title-w-btn" style="height:5px;margin-top:10px;">
    			<h3 class="panel-title"><?php echo Yii::t("app","Available Roles")?></h3>
    			
        		<a class="btn btn-success icon-btn pull-right" id="btn_assign"><i class="fa fa-plus"></i><?php echo Yii::t("app","Add Role")?></a>
        		</div>
    		</div>
    		<div class="panel-body">
    		
				<div class="animated-checkbox">
					<label class="checkbox-inline"> <input type="checkbox"
						id="select_all_available_role" /> <span class="label-text"><strong><?php echo Yii::t("app","Selecct All"); ?></strong></span>
					</label>
				</div>
				
				<?php if(count($model->userHasRoles)>0):?>
					<?php foreach ($model->userHasRoles as $userHasRole):?>
					
					
					<label class="checkbox-inline"> 
                                                                        			
						<div class="animated-checkbox">
            						<input class="checkbox_available_role" type="checkbox" value="<?php echo $userHasRole->role_id; ?>" name="available_role[]" id="available_role[]"> <span class="label-text"><?php echo $userHasRole->role["name"];?></span>
						</div>
					</label>					
			
					<?php endforeach;?>
				<?php endif;?>	

			</div>
</div>
			
			