<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ExternalLink */

$this->title = Yii::t('app', 'Create External Link');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'External Links'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="external-link-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
