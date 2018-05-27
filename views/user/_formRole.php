<?php

use app\models\Province;
use yii\helpers\ArrayHelper;
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
    <div class="row">
	    <?= $form->field($model, 'id',['inputOptions' => ['value' => $model["id"]]])->hiddenInput(['id'=>'the_role_id'])->label(false) ?>
	    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
		
	    <?= $form->field($model, 'name')->textInput(['maxlength' => true,'id'=>'role_name']) ?>
	    </div>
	    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="margin-top: 2em">
	   
	    <?= $form->field($model, 'is_province')->checkbox(['id'=>'is_province']) ?>
		</div>
	</div>
   
	 <div class="row">
		    
		    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
		   <?php
				echo $form->field($model, 'province_id')->dropDownList(
		             ArrayHelper::map(Province::find()
		    
		                    ->all(),'id','province_name'),
		            ['prompt'=>Yii::t('app','Please select'),'id'=>'province']
		        ) 
			?>
		    </div>
		   
	</div>
	
	
		
    
    	<div class="row">
    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	    
	        <?= Html::button('<i class="fa fa-fw fa-user"></i>'. Yii::t('app', 'New'), [
	            'class' => 'btn btn-md btn-info',            
	             'title'=>Yii::t('app', 'New Record'),
	            'id'=>'btnNew','name'=>'btnNew'
	        ]);
	        ?>
	        
	        <?= Html::button('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save Role'), [
	            'class' => 'btn btn-md btn-success',            
	             'title'=>Yii::t('app', 'Save Role'),
	            'id'=>'btnAddRole','name'=>'btnAddRole'
	        ]);
	        ?>
			
			<?= Html::button('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Update Role'), [
	            'class' => 'btn btn-md btn-primary',            
	             'title'=>Yii::t('app', 'Update Role'),
	            'id'=>'btnUpdateRole','name'=>'btnUpdateRole'
	        ]);
	        ?>
	        
	        <?= Html::button('<i class="fa fa-fw fa-trash"></i>'. Yii::t('app', 'Delete Role'), [
	            'class' => 'btn btn-md btn-danger',            
	             'title'=>Yii::t('app', 'Delete Role'),
	            'id'=>'btnDeleteRole','name'=>'btnDeleteRole'
	        ]);
	        ?>
        </div>
        </div>
                
        
        
        
    

    <?php ActiveForm::end(); ?>

</div>
