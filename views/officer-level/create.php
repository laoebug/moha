<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\OfficerLevel */

$this->title = Yii::t('app', 'Create Officer Level');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Officer Levels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="officer-level-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
