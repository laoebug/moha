<?php

use yii\helpers\Html;

use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Govermentlevels');
$this->params['breadcrumbs'][] = $this->title;
$model = new \app\models\GovermentLevel();
?>
<div class="govermentlevel-index">
    <div class="col-sm-7">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-list"></i>
                <?= Yii::t('app', 'List') ?>
            </div>
            <div class="panel-body" id="grid">
                <?= $this->render('gridview', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
                ]) ?>
            </div>
        </div>
    </div>
    <div class="col-sm-5">
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-save"></i>
                <?= Yii::t('app', 'New/Update') ?>
            </div>
            <div class="panel-body">
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
            <?php $form = ActiveForm::begin(); ?>
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
            <?= $form->field($model, 'deleted')->dropDownList(["NO", "YES"]) ?>
            <div class="form-group">
                <div class="col-sm-6">
                    <?= Html::a(Yii::t('app', 'New'), ['create'], ['class' => 'btn btn-success']) ?>
                </div>
                <div class="col-sm-6 text-right">
                    <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-info']) ?>
                </div>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
<?php
$this->registerJs("$('form').submit(function(e) {
    e.preventDefault();
    $.post('index.php?r=govermentlevel/index',{'command': 'create', 'Govermentlevel': {'name': $('#govermentlevel-name').val(), 'deleted': '0'}}, function(r) {
        $('#grid').html(r);
    });
});");