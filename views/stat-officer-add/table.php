<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */

?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Officers Addition') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.')?></th>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'Description')?></th>
                        <th class="text-center" colspan="3"><?= Yii::t('app', 'Officer')?></th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men')?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th class="text-center" rowspan="4">VI</th>
                        <th><?= Yii::t('app', 'Officers Addition') ?></th>
                        <th class="text-center"><?= number_format($model->quota_total + $model->army_total + $model->soe_total)?></th>
                        <th class="text-center"><?= number_format($model->quota_women + $model->army_women + $model->soe_women)?></th>
                        <th class="text-center"><?= number_format($model->quota_total + $model->army_total + $model->soe_total - ($model->quota_women + $model->army_women + $model->soe_women))?></th>
                    </tr>
                    <tr>
                        <td>1. <?= Yii::t('app', 'By Quota') ?></td><td class='text-center'><?= number_format($model->quota_total)?></td><td class='text-center'><?= number_format($model->quota_women)?></td><td class='text-center'><?= number_format($model->quota_total - $model->quota_women)?></td>
                    </tr>
                    <tr>
                        <td>2. <?= Yii::t('app', 'From Army') ?></td><td class='text-center'><?= number_format($model->army_total)?></td><td class='text-center'><?= number_format($model->army_women)?></td><td class='text-center'><?= number_format($model->army_total - $model->army_women)?></td>
                    </tr>
                    <tr>
                        <td>3. <?= Yii::t('app', 'From SOE') ?></td><td class='text-center'><?= number_format($model->soe_total)?></td><td class='text-center'><?= number_format($model->soe_women)?></td><td class='text-center'><?= number_format($model->soe_total - $model->soe_women)?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>