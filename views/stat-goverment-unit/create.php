<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\StatGovermentUnit */

$this->title = Yii::t('app', 'Create Stat Goverment Unit');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Stat Goverment Units'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="stat-goverment-unit-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
