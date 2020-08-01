<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Role */
/* @var $form yii\widgets\ActiveForm */
?>



<link rel="stylesheet"
	href="js/multi_select_tree/jquery.tree-multiselect.min.css">
<script type="text/javascript" src="js/jquery/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="js/multi_select_tree/jquery.tree-multiselect.min.js"></script>





<div class="role-form">

    <?php $form = ActiveForm::begin(
    		[
    		"id"=>"menu_action_form"
    				]
    ); ?>
    <div class="form-group">
        <?php 
        //Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class'=>'btn btn-primary'])
        ?>
        <?= Html::button('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), [
            'class' => 'btn btn-md btn-primary',            
             'title'=>Yii::t('app', 'Save'),
            'id'=>'btnSaveMenuAndAction','name'=>'btnSaveMenuAndAction'
        ]);
        ?>
    </div>


	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="pill" href="#menuItemInfo"><strong><?php echo Yii::t('app', 'Menu Item(s)') ?></strong></a></li>
		<li><a data-toggle="pill" href="#actionItemInfo"><?php echo Yii::t('app', 'Action Item(s)') ?></a></li>

	</ul>


	<div class="tab-content">
		
			<div id="menuItemInfo" class="tab-pane fade in active">
				<div id="menu_list">	
				<?php
// 				echo Yii::$app->controller->renderPartial ( '_menuItemList', [ 
// 						'menuList' => $menuList 
// 				] )
				?>
                
        		</div>
            
		</div>
			<div id="actionItemInfo" class="tab-pane fade">
				<?php
				//echo Yii::$app->controller->renderPartial ( '_actionItemList', [ ] )
				?>
            	<div id="action_list">
            	</div>
			</div>
		
		</div>



	

		

		
    <?php ActiveForm::end(); ?>

</div>


<script type="text/javascript">

</script>

