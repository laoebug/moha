
<!-- <div class="card"> -->
	<div class="card-body">
		<table class="table table-hover table-bordered" id="_user_table">
			<thead>
				<tr>
					<th><?php echo Yii::t("app","No")?></th>
					<th><?php echo Yii::t("app","User Name")?></th>
					<th><?php echo Yii::t("app","First Name")?></th>
					<th><?php echo Yii::t("app","Last Name")?></th>
					<th><?php echo Yii::t("app","Status")?></th>
					<th><?php echo Yii::t("app","Telephone")?></th>
					<th><?php echo Yii::t("app","Email")?></th>
					<th><?php echo Yii::t("app","Role")?></th>
					
				</tr>
			</thead>
			<tbody>
				<?php if(count($models)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($models as $model): ?>
					<tr id="user_id" name="user_id" data-value="<?php echo isset($model["id"])? $model["id"]: ""; ?>">
					
					<td>
					<?php echo $sq++; ?>					
					</td>
					<td><?php echo isset($model["username"])? $model["username"]: ""; ?></td>
					<td><?php echo isset($model["firstname"])? $model["firstname"]: ""; ?></td>
					<td><?php echo isset($model["lastname"])? $model["lastname"]: ""; ?></td>
					<td><?php echo isset($model["status"])? $model["status"]: ""; ?></td>
					<td><?php echo isset($model["tel"])? $model["tel"]: ""; ?></td>
					<td><?php echo isset($model["email"])? $model["email"]: ""; ?></td>
					<td id="role_id" data-role_id="<?php echo isset($model["role_id"])? $model["role_id"]: ""; ?>"><?php echo isset($model->role["name"])? $model->role["name"]: ""; ?></td>
				</tr>
				<?php endforeach;?>
				<?php else:?>
				<tr>
					<td colspans="8"><?php echo Yii::t("app","No data available")?></td>
					
				</tr>
				<?php endif;?>
			</tbody>
		</table>
	</div>
<!-- </div> -->




