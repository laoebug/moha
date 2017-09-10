<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Role;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
   	
    	<?= $form->field($model, 'username')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('username')])?>
    	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'password')->passwordInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('password')])?>
    	</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'firstname')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('firstname')])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'lastname')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('lastname')])?>
		</div>
	</div>

    <div class="row">
    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'tel')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('tel')])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		
		<?= $form->field($model, 'email')->textInput(['maxlength' => true])->textInput(['placeholder' => $model->getAttributeLabel('email')])?>
		</div>
		
		
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
		
		<?= $form->field($model, 'status')->dropDownList(['A' => 'Active', 'I' => 'In Active'],['prompt'=>Yii::t('app','Plase select')]); ?>
		
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
		
		<?php //$form->field($model, 'status')->dropDownList([Role::find()->all()],['prompt'=>Yii::t('app','Plase select')]); ?>
		
		<?php
		echo $form->field($model, 'role_id')->dropDownList(
             ArrayHelper::map(Role::find()
    
                    ->all(),'id','name'),
            ['prompt'=>Yii::t('app','Plase select')]
        ) 
		?>
		
		</div>
						
	</div>
			

    
     <?php 
//      echo $this->render('_roleList', [
//             'model' => $model,
//             'roles' => $roles
//         ]) 
     ?>

	<br/>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Save') : Yii::t('app', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
        
    </div>

    <?php ActiveForm::end(); ?>

</div>
