<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <h3 class="title">ຕາຕະລາງສະຖິຕິປະເພດຫຼຽນຊັ້ນສູງທີ່ໄດ້ມອບໃຫ້ຕ່າງປະເທດຂອງບັນດາກະຊວງ, ອົງການທຽບເທົ່າ ປະຈຳປີ (<?= $year->year ?>)</h3>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="2">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                    <th class="text-center" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                    <?php foreach ($labels as $label) : ?>
                        <th class="text-center" colspan="2"><?= $label ?></th>
                    <?php endforeach; ?>
                    <th class="text-center" colspan="2">ລວມ</th>
                    <th class="text-center" rowspan="2">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <?php for ($i = 0; $i < count($labels) * 2 + 2; $i++) : ?>
                        <th class="text-center"><?= $i % 2 == 0 ? 'ບຸກຄົນ' : 'ກົມກອງ' ?></th>
                    <?php endfor; ?>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th class="text-center" colspan="3">ລວມ</th>
                    <?php
                    $sum = [];
                    foreach ($cols as $col) $sum[$col] = 0;
                    foreach ($models as $model)
                        foreach ($cols as $col)
                            $sum[$col] += $model[$col];

                    $total = ['personal' => 0, 'team' => 0];
                    foreach ($sum as $key => $s) :
                        if (strpos($key, 'personal'))
                            $total['personal'] += $s;

                        if (strpos($key, 'team'))
                            $total['team'] += $s;
                    ?>
                        <td class="text-center"><?= number_format($s) ?></td>
                    <?php endforeach; ?>

                    <td class="text-center"><?= number_format($total['personal']) ?></td>
                    <td class="text-center"><?= number_format($total['team']) ?></td>

                    <td class="text-center"></td>
                </tr>

                <?php foreach ($models as $index => $model) : ?>
                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td><?= $model['ministry'] ?></td>
                        <td><?= $model['award'] ?></td>
                        <?php
                        $row = ['personal' => 0, 'team' => 0];
                        foreach ($cols as $col) :
                            if (strpos($col, 'personal'))
                                $row['personal'] += $model[$col];
                            if (strpos($col, 'team'))
                                $row['team'] += $model[$col];
                        ?>
                            <td class="text-center"><?= number_format($model[$col]) ?></td>
                        <?php endforeach; ?>
                        <td class="text-center"><?= number_format($row['personal']) ?></td>
                        <td class="text-center"><?= number_format($row['team']) ?></td>
                        <td><?= $model['remark'] ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>