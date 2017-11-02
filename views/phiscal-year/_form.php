<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="phiscal-year-form">

    <?php $form = ActiveForm::begin(); ?>

    
    <div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
    		<?php // $model->isNewRecord?"": $form->field($model, 'deleted')->dropDownList(["NO", "YES"])  ?>
    		<?= $form->field($model, 'year')->textInput(['maxlength' => true])?>
    	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    		<?= $form->field($model, 'status')->dropDownList(["C" => Yii::t('app', 'Closed'), "O" => Yii::t('app','Opening')])?>
    	</div>
	</div>

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
		
			
	    <?php
					echo $form->field ( $model, 'start_date' )->widget ( DatePicker::className (), [ 
							'clientOptions' => [ 
									'autoclose' => true,
									'format' => 'dd-mm-yyyy',
									'todayHighlight' => true 
							] 
					] );
					
					?>
    	</div>
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	    <?php
					echo $form->field ( $model, 'end_date' )->widget ( DatePicker::className (), [ 
							'clientOptions' => [ 
									'autoclose' => true,
									'format' => 'dd-mm-yyyy',
									'todayHighlight' => true 
							] 
					] );
					?>
    	</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
    		<?php $form->field($model, 'deleted')->dropDownList(["NO", "YES"])?>
    	</div>
	</div>
	<div class="form-group">       
        <?= Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
    </div>
    
    <?php ActiveForm::end(); ?>
</div>


<!-- <script type="text/javascript" src="js/plugins/pace.min.js"></script> -->
<!-- <script type="text/javascript" src="js/main.js"></script> -->
<!-- <script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script> -->
<!-- <script type="text/javascript" src="js/plugins/sweetalert.min.js"></script> -->
<!-- <script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script> -->
<!-- <script type="text/javascript" src="js/plugins/chart.js"></script> -->
<!-- <script type="text/javascript" src="js/plugins/select2.min.js"></script> -->

