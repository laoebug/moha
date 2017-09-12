<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Officers By Positions') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Description') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center" rowspan="4">IX</td>
                        <td><?= Yii::t('app', 'Needed Plan') ?></td>
                        <td class="text-center"><?= number_format($model->center + $model->province+ $model->district)?></td>
                    </tr>
                    <tr>
                        <td><?= Yii::t('app', 'Center') ?></td>
                        <td class="text-center"><?= number_format($model->center)?></td>
                    </tr>
                    <tr>
                        <td><?= Yii::t('app', 'Province') ?></td>
                        <td class="text-center"><?= number_format($model->province)?></td>
                    </tr>
                    <tr>
                        <td><?= Yii::t('app', 'District') ?></td>
                        <td class="text-center"><?= number_format($model->district)?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
