<h4><?php echo Yii::t("app","Department"); ?> </h4>
<div class="table-responsive">
	<div class="card-body">
		<table class="table table-hover table-bordered" id="_branch_table">
			<thead>
				<tr>
					<th>
					<input type="checkbox" name="check-all-branch" id="check-all-branch" value="">
					<?php echo Yii::t("app","Select All"); ?>
					</th>
					<th><?php echo Yii::t("app","No")?></th>
					<th><?php echo Yii::t("app","Department List")?></th>
					
				</tr>
			</thead>
			<tbody>
				<?php if(count($model->theBraches)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($model->theBraches as $model): ?>
					<tr id="branch_id"  data-value="<?php echo isset($model["id"])? $model["id"]: ""; ?>">
					
					<td style="width:110px" data-row-id="<?php echo $model["id"]?>">
					<?php $checked = "" ; ?>
					<?php if($model->branch_id == $model->id): ?>					
					<?php $checked="checked"; ?>					
					<?php endif;?>
					<input type="checkbox" name="branch_id[]" id="branch_id[]" class="branch_id" value="<?php echo $model["id"]; ?>"
										data-id="<?php echo $model["id"]; ?>" <?php echo $checked; ?> >										
					</td>
					
					<td>
					<?php echo $sq++; ?>					
					</td>
					<td><?php echo isset($model["name"])? $model["name"]: ""; ?></td>
					
				</tr>
				<?php endforeach;?>
				
				<?php endif;?>
			</tbody>
		</table>
	</div>
</div>	

