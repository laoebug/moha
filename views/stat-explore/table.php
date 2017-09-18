<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Map Service') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2">ລ/ດ</th>
                        <th class="text-center" rowspan="2">ແຂວງ</th>
                        <th class="text-center" colspan="4">ຫົວໜ່ວຍ</th>
                        <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                    </tr>
                    <tr>
                        <th class="text-center">ຫຼັກໝາຍ</th>
                        <th class="text-center">ຈຸດ</th>
                        <th class="text-center">ເນື້ອທີ່ ເຮັກຕາ</th>
                        <th class="text-center">ເນື້ອທີ່ ກິໂລແມັດ</th>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="2">ລວມ</th>
                        <?php
                        $sum = ['mark' => 0, 'point' => 0, 'hm' => 0, 'km' => 0];
                        foreach ($models as $model)
                            foreach (['mark','point','hm','km'] as $item) {
                                if(!isset($sum[$item])) $sum[$item] = 0;
                                else $sum[$item] += $model[$item];
                            }
                         ?>
                        <?php foreach ($sum as $s): ?>
                        <th class="text-center"><?= number_format($s) ?></th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $index => $m): ?>
                        <tr>
                            <td class="text-center"><?=$index + 1?></td>
                            <td><?=$m['province']?></td>
                            <td class="text-center"><?=$m['mark']?></td>
                            <td class="text-center"><?=$m['point']?></td>
                            <td class="text-center"><?=$m['hm']?></td>
                            <td class="text-center"><?=$m['km']?></td>
                            <td class="text-center"><?=$m['remark']?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
