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
                <h3 class="title"><?= Yii::t('app','Statistics of Officers By Ages') ?> (<?= $year->year ?>)</h3>
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
                        <th class="text-center" rowspan="12">V</th>
                        <th><?= Yii::t('app', 'Officers Resignation') ?></th>
                        <th class="text-center"><?= number_format($model->retire_total + $model->bumnet_total + $model->die_total + $model->leave_total + $model->fire_total + $model->resign_total + $model->lose_total)?></th>
                        <th class="text-center"><?= number_format($model->retire_women + $model->bumnet_women + $model->die_women + $model->leave_women + $model->fire_women + $model->resign_women + $model->lose_women)?></th>
                        <th class="text-center"><?= number_format($model->retire_total + $model->bumnet_total + $model->die_total + $model->leave_total + $model->fire_total + $model->resign_total + $model->lose_total - ($model->retire_women + $model->bumnet_women + $model->die_women + $model->leave_women + $model->fire_women + $model->resign_women + $model->lose_women))?></th>
                    </tr>
                    <tr>
                        <td>1. <?= Yii::t('app', 'Retire') ?></td><td class='text-center'><?= number_format($model->retire_total)?></td><td class='text-center'><?= number_format($model->retire_women)?></td><td class='text-center'><?= number_format($model->retire_total - $model->retire_women)?></td>
                    </tr>
                    <tr>
                        <td>2. <?= Yii::t('app', 'Bumnet') ?></td><td class='text-center'><?= number_format($model->bumnet_total)?></td><td class='text-center'><?= number_format($model->bumnet_women)?></td><td class='text-center'><?= number_format($model->bumnet_total - $model->bumnet_women)?></td>
                    </tr>
                    <tr>
                        <td>3. <?= Yii::t('app', 'Die') ?></td><td class='text-center'><?= number_format($model->die_total)?></td><td class='text-center'><?= number_format($model->die_women)?></td><td class='text-center'><?= number_format($model->die_total - $model->die_women)?></td>
                    </tr>
                    <tr>
                        <td>4. <?= Yii::t('app', 'Leave') ?></td><td class='text-center'><?= number_format($model->leave_total)?></td><td class='text-center'><?= number_format($model->leave_women)?></td><td class='text-center'><?= number_format($model->leave_total - $model->leave_women)?></td>
                    </tr>
                    <tr>
                        <td>5. <?= Yii::t('app', 'Fire') ?></td><td class='text-center'><?= number_format($model->fire_total)?></td><td class='text-center'><?= number_format($model->fire_women)?></td><td class='text-center'><?= number_format($model->fire_total - $model->fire_women)?></td>
                    </tr>
                    <tr>
                        <td>6. <?= Yii::t('app', 'Resign') ?></td><td class='text-center'><?= number_format($model->resign_total)?></td><td class='text-center'><?= number_format($model->resign_women)?></td><td class='text-center'><?= number_format($model->resign_total - $model->resign_women)?></td>
                    </tr>
                    <tr>
                        <td>7. <?= Yii::t('app', 'Lose') ?></td><td class='text-center'><?= number_format($model->lose_total)?></td><td class='text-center'><?= number_format($model->lose_women)?></td><td class='text-center'><?= number_format($model->lose_total - $model->lose_women)?></td>
                    </tr>
                    <tr>
                        <td>8. <?= Yii::t('app', 'Move to SOE') ?></td><td class='text-center'><?= number_format($model->move_soe_total)?></td><td class='text-center'><?= number_format($model->move_soe_women)?></td><td class='text-center'><?= number_format($model->move_soe_total - $model->move_soe_women)?></td>
                    </tr>
                    <tr>
                        <th><?= Yii::t('app', 'Moveto Ministry') ?></th>
                        <th class="text-center"><?= number_format($model->moveto_ministry_total + $model->movein_ministry_total)?></th>
                        <th class="text-center"><?= number_format($model->moveto_ministry_women + $model->movein_ministry_women)?></th>
                        <th class="text-center"><?= number_format($model->moveto_ministry_total + $model->movein_ministry_total - ($model->moveto_ministry_women + $model->movein_ministry_women))?></th>
                    </tr>
                    <tr>
                        <td>1. <?= Yii::t('app', 'Moveto Ministry') ?></td><td class='text-center'><?= number_format($model->moveto_ministry_total)?></td><td class='text-center'><?= number_format($model->moveto_ministry_women)?></td><td class='text-center'><?= number_format($model->moveto_ministry_total - $model->moveto_ministry_women)?></td>
                    </tr>
                    <tr>
                        <td>2. <?= Yii::t('app', 'Move-In Ministry') ?></td><td class='text-center'><?= number_format($model->movein_ministry_total)?></td><td class='text-center'><?= number_format($model->movein_ministry_women)?></td><td class='text-center'><?= number_format($model->movein_ministry_total - $model->movein_ministry_women)?></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>