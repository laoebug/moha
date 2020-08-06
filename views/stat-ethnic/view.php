<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/9/17
 * Time: 8:36 PM
 */

?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
    <div class="card-title-w-btn hidden-print">
        <h3>ສະຖິຕິຊົນເຜົ່າໃນຂອບເຂດທົ່ວປະເທດ ປະຈໍາປີ <?= $year->year ?></h3>
        <p>
            <a class="btn btn-default" target="_blank" href="index.php?r=stat-ethnic/print&year=<?= $year->id ?>"><i class="fa fa-print fa-2x"></i></a>
            <a class="btn btn-info" target="_blank" href="index.php?r=stat-ethnic/download&year=<?= $year->id ?>"><i class="fa fa-download fa-2x"></i></a>
        </p>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th rowspan="2" style="vertical-align: middle;"><?= Yii::t('app', 'No.') ?></th>
                <th rowspan="2" style="vertical-align: middle;"><?= Yii::t('app', 'Province') ?></th>
                <th rowspan="2" style="vertical-align: middle;">ຊົນເຜົ່າ</th>
                <?php foreach ($ethnics as $i => $ethnic) : ?>
                    <th style="vertical-align: middle;"><?= $ethnic->name ?></th>
                <?php endforeach; ?>
                <th class="text-center">ລວມ</th>
            </tr>
                 
            <tr>
                
                <?php foreach ($ethnics as $i => $ethnic) : ?>
                    <th style="vertical-align: middle;">
                        
                        <?= str_pad($ethnic->position,2,"0",STR_PAD_LEFT); ?>
                    </th>

                <?php endforeach; ?>
                
            </tr>


        </thead>
        <tbody>
            <?php foreach ($provinces as $i => $province) : ?>
                <tr>
                    <td rowspan="2"><?= $i + 1 ?></td>
                    <td rowspan="2"><?= $province->province_name ?></td>
                    <td><?= Yii::t('app', 'Total') ?></td>
                    <?php $sum_total = 0; ?>
                    <?php $sum_women = 0; ?>

                    <?php foreach ($ethnics as $j => $ethnic) : ?>
                        <td class="text-center">
                            <?php
                            $value = '-';
                            foreach ($models as $model)
                                if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                    $value = number_format($model->total);
                                    $sum_total += $model->total;
                                    break;
                                }
                            echo $value;
                            ?>
                        </td>
                    <?php endforeach; ?>
                    <td class="text-right">
                        <?php echo number_format($sum_total); ?>
                    </td>
                </tr>
                <tr>
                    <td><?= Yii::t('app', 'Women') ?></td>
                    <?php foreach ($ethnics as $e => $ethnic) : ?>
                        <td class="text-center">
                            <?php
                            $value = '-';
                            foreach ($models as $model)
                                if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                    $value = number_format($model->women);
                                    $sum_women += $model->women;
                                    break;
                                }
                            echo $value;
                            ?>
                        </td>
                    <?php
                    endforeach; ?>
                    <td class="text-right">
                        <?php echo number_format($sum_women); ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>