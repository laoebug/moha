<!-- <div id="role_list"> -->
<div class="card-body">
	<table class="table table-hover table-bordered" id="role_table">
		<thead>
			<tr>
				<th><?php echo Yii::t("app","No.")?></th>
				<th><?php echo Yii::t("app","Role Name")?></th>
				<th><?php echo Yii::t("app","Created Date Time")?></th>
				<th style="text-align:center"><?php echo Yii::t("app","Is Province")?></th>
				<th><?php echo Yii::t("app","Province")?></th>
			</tr>
		</thead>
		<tbody>
				
				<?php if(count($models)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($models as $model): ?>
				
				<tr id="role_id"  data-value="<?php echo isset($model['id'])? $model['id']: ''; ?> ">
				
				<td>
					<?php echo $sq++; ?>					
				</td>
				<td><?php echo isset($model["name"])? $model["name"]: ""; ?></td>
				<td><?php echo isset($model["input_dt_stamp"])? $model["input_dt_stamp"]: ""; ?></td>	
				<td style="text-align:center" id="is_the_province" data-is_the_province="<?php echo isset($model["is_province"])? $model["is_province"]: ""; ?>">				
				<?php echo (isset($model["is_province"]) && $model["is_province"] ==1)? "Yes": "No"; ?>
				</td>								
				<td id="province_id"  data-province_id="<?php echo isset($model["province_id"])? $model["province_id"]: ""; ?>" ><?php echo isset($model->province["province_name"])? $model->province["province_name"]: ""; ?></td>

				</tr>
				<?php endforeach;?>
				<?php else:?>
				
				<?php endif;?>
			</tbody>
	</table>
</div>
<!-- </div> -->

