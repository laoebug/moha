<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Notice */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'ແຈ້ງການ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <h4><?= Html::encode($this->title) ?></h4>
    <p class="pull-right">
        <span class="badge badge-primary"><?= \app\components\MyHelper::converttimefordisplay($model->created_date) ?></span></p>
    <hr>
    <div>
        <?= $model->content ?>
    </div>
</div>
