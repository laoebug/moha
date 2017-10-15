<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\models\Role;
use app\models\Province;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin([
    				'enableAjaxValidation' => false,
    				'enableClientValidation' => false,
    		] ); ?>
	<div class="row">
		<?= $form->field($model, 'id',['inputOptions' => ['value' => $model["id"]]])->hiddenInput(['id'=>'the_user_id'])->label(false) ?>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
   	
    	<?= $form->field($model, 'username')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('username'),'id' => 'username'])?>
    	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'password')->passwordInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('password'),'id' => 'password'])?>
    	</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<?= $form->field($model, 'firstname')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('firstname'),'id' => 'firstname'])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'lastname')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('lastname'),'id' => 'lastname'])?>
		</div>
	</div>

    <div class="row">
    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		<?= $form->field($model, 'tel')->textInput(['maxlength' => true,'placeholder' => $model->getAttributeLabel('tel'),'id' => 'tel'])?>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		
		<?= $form->field($model, 'email')->textInput(['maxlength' => true])->textInput(['placeholder' => $model->getAttributeLabel('email'),'id' => 'email'])?>
		</div>
		
		
	</div>
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
		
		<?= $form->field($model, 'status')->dropDownList(['A' => 'Active', 'I' => 'In Active'],['prompt'=>Yii::t('app','Plase select'),'id'=>'status']); ?>
		
		</div>
		
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
		
		<?php //$form->field($model, 'status')->dropDownList([Role::find()->all()],['prompt'=>Yii::t('app','Plase select')]); ?>
		
		<?php
		echo $form->field($model, 'role_id')->dropDownList(
             ArrayHelper::map(Role::find()
    
                    ->all(),'id','name'),
            ['prompt'=>Yii::t('app','Plase select'),'id'=>'role']
        ) 
		?>
		
		</div>
						
	</div>

	
    <div class="form-group">
        <?= Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
        <?= Html::button('<i class="fa fa-fw fa-user"></i>'. Yii::t('app', 'New'), [
            'class' => 'btn btn-md btn-info',            
             'title'=>Yii::t('app', 'New Record'),
            'id'=>'btnNew','id'=>'btnNew'
        ]);
        ?>
        
        
        <?php
//         echo Html::button("<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>",
//             ['class'=>'btn btn-md btn-info',
//                 'onclick'=>"window.location.href = '" . \Yii::$app->urlManager->createUrl(['/create','id'=>$model->id]) . "';",
//                 'data-toggle'=>'tooltip',
//                 'title'=>Yii::t('app', 'Create New Record'),
//             ]
//             )
            
        ?>

        
    </div>

    <?php ActiveForm::end(); ?>

</div>
