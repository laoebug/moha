<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Role */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="role-form">

    <?php $form = ActiveForm::begin(
    		[
    		"id"=>"role_form"		
    		]
    ); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true,'id'=>'role_name']) ?>

   

    <div class="form-group">
        <?php 
        //Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])
        ?>
        
        <?= Html::button('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Add Role'), [
            'class' => 'btn btn-md btn-success',            
             'title'=>Yii::t('app', 'Add Record'),
            'id'=>'btnAddRole','name'=>'btnAddRole'
        ]);
        ?>
        
        <?= Html::button('<i class="fa fa-fw fa-user"></i>'. Yii::t('app', 'New'), [
            'class' => 'btn btn-md btn-info',            
             'title'=>Yii::t('app', 'New Record'),
            'id'=>'btnNew','name'=>'btnNew'
        ]);
        ?>
        
        
    </div>

    <?php ActiveForm::end(); ?>

</div>
