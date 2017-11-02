<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */

$this->title = $model->year;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Phiscal Years'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">    
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'year',
            'start_date',
            'end_date',
            'deleted',
            'status',
        ],
    ]) ?>

</div>
