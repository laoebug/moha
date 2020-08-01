<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Approver */
/* @var $form yii\widgets\ActiveForm */
?>

    <div class="approver-form">

        <?php $form = ActiveForm::begin();
        function getStyle($approverLevel, $code)
        {
            if (isset($approverLevel))
                if ($approverLevel->code == $code) return '';
                else return 'display: none';
            else return '';
        }

        ?>

        <?= $form->field($model, 'approver_level')
            ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\ApproverLevel::find()
                ->where(['deleted' => 0])
                ->orderBy('position')->all(), 'code', 'name'), [
                'prompt' => ''
            ]) ?>
        <?= $form->field($model, 'ministry_id', ['options' => ['style' => getStyle($model->approverLevel, 'M')]])
            ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Ministry::find()
                ->where(['deleted' => 0])
                ->orderBy('position')->all(), 'id', 'name'), [
                'prompt' => '',
            ]) ?>
        <?= $form->field($model, 'province_id', ['options' => ['style' => getStyle($model->approverLevel, 'P')]])
            ->dropDownList(\yii\helpers\ArrayHelper::map(\app\models\Province::find()->all(), 'id', 'province_name'), [
                'prompt' => '',
            ]) ?>

        <?= !$model->isNewRecord ? $form->field($model, 'deleted')->dropDownList(Yii::$app->params['YESNO']) : "" ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
<?php
$this->registerJs("$('#approver-approver_level').change(function() {
    var code = $(this).val();
    if(code == 'P') {
        $('.field-approver-ministry_id').hide();
        $('.field-approver-province_id').show();
    }
    else if(code == 'M') {
        $('.field-approver-province_id').hide();
        $('.field-approver-ministry_id').show();
    }
    else 
        $('.field-approver-ministry_id, .field-approver-province_id').hide();
});");
