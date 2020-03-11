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
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງສະຖິຕິປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ທີ່ໄດ້ມອບໃຫ້ພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນ ແລະ ນະຄອນຫຼວງ ປະຈຳປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center" rowspan="2" rowspan="2">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                            <th class="text-center" rowspan="2" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດວິລະຊົນແຫ່ງຊາດ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດນັກຮົບແຂ່ງຂັນແຫ່ງຊາດ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດວິລະຊົນແຮງງານ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດພັດທະນາດີເດັ່ນແຫ່ງຊາດ</th>
                            <th class="text-center" colspan="2">ລວມ</th>
                            <th class="text-center" rowspan="2">ໝາຍເຫດ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 10; $i++) : ?>
                                <th class="text-center"><?= $i % 2 == 0 ? 'ບຸກຄົນ' : 'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $cols = [
                            'hero_personal',
                            'hero_team',
                            'knight_personal',
                            'knight_team',
                            'labor_personal',
                            'labor_team',
                            'dev_personal',
                            'dev_team',
                        ];
                        $sum = [];
                        $total = ['personal' => 0, 'team' => 0];
                        foreach ($cols as $col) $sum[$col] = 0;
                        foreach ($models as $model)
                            foreach ($cols as $col) {
                                $sum[$col] += $model[$col];
                                if (strpos($col, 'personal')) $total['personal'] += $model[$col];
                                else if (strpos($col, 'team')) $total['team'] += $model[$col];
                            }

                        ?>
                        <tr>
                            <th colspan="3">ລວມ</th>
                            <?php foreach ($sum as $s) : ?>
                                <th class="text-center"><?= number_format($s) ?></th>
                            <?php endforeach; ?>
                            <th><?= $total['personal'] ?></th>
                            <th><?= $total['team'] ?></th>
                            <td></td>
                        </tr>
                        <?php
                        $t = [];
                        foreach ($models as $index => $model) :
                            foreach ($cols as $col) {
                                if (!isset($t['personal'])) $t['personal'] = 0;
                                if (!isset($t['team'])) $t['team'] = 0;
                                if (strpos($col, 'personal'))
                                    $t['personal'] += $model[$col];
                                else if (strpos($col, 'team'))
                                    $t['team'] += $model[$col];
                            }

                        ?>
                            <tr>
                                <td class="text-center"><?= $index + 1 ?></td>
                                <td><?= $model['province'] ?></td>
                                <td><?= $model['award'] ?></td>
                                <?php foreach ($cols as $col) : ?>
                                    <td class="text-center"><?= number_format($model[$col]) ?></td>
                                <?php endforeach; ?>
                                <td><?= number_format($t['personal']) ?></td>
                                <td><?= number_format($t['team']) ?></td>
                                <td><?= $model['remark'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>