<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Ethnic */

$this->title = Yii::t('app', 'Create Ethnic');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Ethnics'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="ethnic-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
