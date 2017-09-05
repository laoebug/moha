<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Approver */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="approver-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'level')->dropDownList([
            '' => '',
            'M' => Yii::t('app', 'Ministry'),
            'P' => Yii::t('app', 'Province'),
    ]) ?>

    <?= $form->field($model, 'ministry_id')
        ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Ministry::find()
            ->where(['deleted' => 0])
            ->orderBy('position')->all(),'id', 'name'), [
                    'prompt' => ''
        ]) ?>

    <?= $form->field($model, 'province_id')
        ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Province::find()
            ->where(['deleted' => 0])
            ->orderBy('position')->all(),'id', 'province_name'), [
            'prompt' => ''
        ]) ?>

    <?= $form->field($model, 'approver_level_id')
        ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\ApproverLevel::find()
            ->where(['deleted' => 0])
            ->orderBy('position')->all(),'id', 'name'), [
            'prompt' => ''
        ]) ?>

    <?= $form->field($model, 'deleted')->dropDownList(Yii::$app->params['YESNO']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
<?php
$this->registerJs("$('#approver-level').change(function() {
    if($(this).val() == 'P') $('.field-approver-ministry_id').hide();
    else if($(this).val() == 'M') $('.field-approver-province_id').hide();
    else $('.field-approver-ministry_id, .field-approver-province_id').show();
});");
