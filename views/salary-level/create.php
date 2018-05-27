<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SalaryLevel */

$this->title = Yii::t('app', 'Create Salary Level');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Salary Levels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="salary-level-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
