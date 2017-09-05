<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\LegalType */

$this->title = Yii::t('app', 'Create Legal Type');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Legal Types'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="legal-type-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
