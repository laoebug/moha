<h4><?php echo Yii::t("app","Province"); ?> </h4>
<div class="table-responsive">
	<div class="card-body">
		<table class="table table-hover table-bordered" id="_province_table">
			<thead>
				<tr>
					<th>
					<input type="checkbox" name="check-all-province" id="check-all-province" value="">
					<?php echo Yii::t("app","Select All"); ?>
					</th>
					<th><?php echo Yii::t("app","No.")?></th>
					<th><?php echo Yii::t("app","Province")?></th>
					
				</tr>
			</thead>
			<tbody>
				<?php if(count($model->theProvinces)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($model->theProvinces as $model): ?>
					<tr id="province_id"  data-value="<?php echo isset($model["id"])? $model["id"]: ""; ?>">
					
					<td style="width:110px" data-row-id="<?php echo $model["id"]?>">
					<?php $checked = "" ; ?>
					<?php if($model->province_id == $model->id): ?>					
					<?php $checked="checked"; ?>					
					<?php endif;?>
					<input type="checkbox" name="province_id[]" id="province_id[]" class="province_id" value="<?php echo $model["id"]; ?>"
										data-id="<?php echo $model["id"]; ?>" <?php echo $checked; ?> >										
					</td>
					
					<td>
					<?php echo $sq++; ?>					
					</td>
					<td><?php echo isset($model["province_name"])? $model["province_name"]: ""; ?></td>
					
				</tr>
				<?php endforeach;?>
				
				<?php endif;?>
			</tbody>
		</table>
	</div>
</div>	

