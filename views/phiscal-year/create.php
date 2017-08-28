<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */

$this->title = Yii::t('app', 'Create Phiscal Year');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Phiscal Years'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="phiscal-year-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
