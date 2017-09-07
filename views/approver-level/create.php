<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ApproverLevel */

$this->title = Yii::t('app', 'Create Approver Level');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Approver Levels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="approver-level-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
