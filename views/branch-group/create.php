<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\BranchGroup */

$this->title = Yii::t('app', 'Create Branch Group');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Branch Groups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="branch-group-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
