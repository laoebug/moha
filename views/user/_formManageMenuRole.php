<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Role */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="role-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="form-group">
        <?= Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class'=>'btn btn-primary'])?>
    </div>

	
	<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="pill" href="#menuItemInfo"><strong><?php echo Yii::t('app', 'Menu Item(s)') ?></strong></a></li>
			<li><a data-toggle="pill" href="#actionItemInfo"><?php echo Yii::t('app', 'Aaction Item(s)') ?></a></li>

		</ul>

		<div class="tab-content">
			<div id="menuItemInfo" class="tab-pane fade in active">
				<?php 
                echo Yii::$app->controller->renderPartial('_menuItemList', [

                ]) 
                ?>
            	
			</div>
			<div id="actionItemInfo" class="tab-pane fade">
				<?php 
                echo Yii::$app->controller->renderPartial('_actionItemList', [
                ]) 
                ?>
            	
			</div>

		</div>
		
    <?php ActiveForm::end(); ?>

</div>
