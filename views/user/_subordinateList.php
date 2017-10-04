<h4><?php echo Yii::t("app","User List"); ?> </h4>
<div class="table-responsive">
	<div class="card-body">
		<table class="table table-hover table-bordered" id="_user_table">
			<thead>
				<tr>
					<th>
					<input type="checkbox" name="check-all-user" id="check-all-user" value="">
					<?php echo Yii::t("app","Select All"); ?>
					</th>
					<th><?php echo Yii::t("app","No")?></th>
					<th><?php echo Yii::t("app","User Name ")?></th>
					
				</tr>
			</thead>
			<tbody>
				<?php if(count($model->theSubcordinateUsers)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($model->theSubcordinateUsers as $model): ?>
				<tr id="user_id"  data-value="<?php echo isset($model["id"])? $model["id"]: ""; ?>">
					<td style="width:110px" data-row-id="<?php echo $model["id"]?>">
					<?php $checked = "" ; ?>
					<?php if($model->subordinate_user_id == $model->id): ?>					
					<?php $checked="checked"; ?>
					<?php endif;?>
					<input type="checkbox" name="user_id[]" id="user_id[]" class="user_id" value="<?php echo $model["id"]; ?>"
										data-id="<?php echo $model["id"]; ?>" <?php echo $checked; ?>>										
					</td>
										
					<td>
					
					<?php echo $sq++; ?>					
					</td>
					<td><?php echo isset($model["username"])? $model["username"]: ""; ?></td>
					
				</tr>
				<?php endforeach;?>
				<?php else:?>
				<tr>
					<td colspan="2"><?php echo Yii::t("app","No data available")?></td>
					
				</tr>
				<?php endif;?>
			</tbody>
		</table>
	</div>
</div>	

