<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerAgeDetail */
    $sum = [];
    foreach ($models as $model)
        foreach ($cols as $col) {
            if(!isset($sum[$col]))
                $sum[$col] = 0;
            $sum[$col] += $model[$col];
        }
?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Tranining of Province Officers ') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="5"><?= Yii::t('app', 'No.')?></th>
                            <th class="text-center" rowspan="3"><?= Yii::t('app', 'Name')?></th>
                            <th class="text-center" rowspan="2" colspan="2"><?= Yii::t('app', 'Total')?></th>
                            <th class="text-center" colspan="4"><?= Yii::t('app', 'Technical Trainning') ?></th>
                            <th class="text-center" colspan="4"><?= Yii::t('app', 'Theory Trainning') ?></th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Local')?></th>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Oversea')?></th>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Local')?></th>
                            <th class="text-center" colspan="2"><?= Yii::t('app', 'Oversea')?></th>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<10;$i++): ?>
                            <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?= number_format($sum['tech_in_total'] + $sum['tech_out_total'] + $sum['theo_in_total'] + $sum['theo_out_total']) ?></th>
                            <th class="text-center"><?= number_format($sum['tech_in_women'] + $sum['tech_out_women'] + $sum['theo_in_women'] + $sum['theo_out_women']) ?></th>
                            <?php foreach ($sum as $s): ?>
                            <th class="text-center"><?= number_format($s) ?></th>
                            <?php endforeach; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($models as $index => $model): ?>
                        <tr>
                            <td style="2%"><?= $index + 1 ?></td>
                            <td><?= $model['province_name'] ?></td>
                            <th style="width: 7%" class="text-center"><?= number_format($model['tech_in_total'] + $model['tech_out_total'] + $model['theo_in_total'] + $model['theo_out_total']) ?></th>
                            <th style="width: 7%" class="text-center"><?= number_format($model['tech_in_women'] + $model['tech_out_women'] + $model['theo_in_women'] + $model['theo_out_women']) ?></th>
                            <td style="width: 7%" class="text-center"><?= number_format($model['tech_in_total'] )?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['tech_in_women'])?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['tech_out_total']) ?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['tech_out_women']) ?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['theo_in_total'])?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['theo_in_women'])?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['theo_out_total']) ?></td>
                            <td style="width: 7%" class="text-center"><?= number_format($model['theo_out_women']) ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>