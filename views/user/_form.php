<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
   	
    	<?= $form->field($model, 'username')->textInput(['maxlength' => true])?>
    	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'password')->passwordInput(['maxlength' => true])?>
    	</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'firstname')->textInput(['maxlength' => true])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'lastname')->textInput(['maxlength' => true])?>
		</div>
	</div>

    <div class="row">
    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'tel')->textInput(['maxlength' => true])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		
		<?= $form->field($model, 'email')->textInput(['maxlength' => true])?>
		</div>
		
		
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'status')->textInput(['maxlength' => true])?>
		</div>
	</div>
			

    

    

    

    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
