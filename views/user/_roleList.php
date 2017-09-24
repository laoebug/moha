<div class="card-body">
	<table class="table table-hover table-bordered" id="role_table">
		<thead>
			<tr>
				<th><?php echo Yii::t("app","No")?></th>
				<th><?php echo Yii::t("app","Role Name")?></th>
				<th><?php echo Yii::t("app","Created Date Time")?></th>
				<th></th>
				
			</tr>
		</thead>
		<tbody>
				
				<?php if(count($models)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($models as $model): ?>
					<tr id="role_id" name="role_id"
				data-value="<?php echo isset($model["id"])? $model["id"]: ""; ?>">
				<td>
					<?php echo $sq++; ?>					
					</td>
				<td><?php echo isset($model["name"])? $model["name"]: ""; ?></td>
				<td><?php echo isset($model["input_dt_stamp"])? $model["input_dt_stamp"]: ""; ?></td>
				<td>
				
				<select id="menu_list" name="menu_list[]" multiple="multiple">

	<?php if(count($models)>0): ?>
		<?php foreach ($models as $menu): ?>
		<option value="one" data-section="top" selected="selected" data-index="3">
		<?php echo $menu["name"];?>
		</option>
		<?php endforeach;?>
	<?php endif;?>
	
</select>

				</td>
			</tr>
				<?php endforeach;?>
				<?php else:?>
				<tr>
				<td colspans="3"><?php echo Yii::t("app","No data available")?></td>

			</tr>
				<?php endif;?>
			</tbody>
	</table>
</div>