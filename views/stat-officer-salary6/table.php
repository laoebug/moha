<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

function sum($items, $key)
{
    $sum = 0;
    for ($i = 1; $i < 7; $i++)
        $sum += sumcolumn($items, 'step' . $i . $key);

    return $sum;
}

function sumrow($item, $key)
{
    $sum = 0;
    if (isset($item))
        for ($k = 1; $k < 7; $k++)
            $sum += $item['step' . $k . $key];

    return $sum;
}

function sumcolumn($items, $key)
{
    $sum = 0;
    foreach ($items as $item)
        $sum += isset($item[$key]) ? $item[$key] : 0;

    return $sum;
}
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <h3 class="text-center">ຕະຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນດືອນ (ສະເພາະຊັ້ນ VI) ປະຈຳປີ <?= @$year->year ?></h3>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                            <th class="text-center" rowspan="3">ຊັ້ນວິຊາສະເພາະ</th>
                            <th class="text-center" rowspan="2" colspan="2">ຈຳນວນພະນັກງານຊັ້ນ VI ທັງໝົດ</th>
                            <th class="text-center" colspan="12">ຈຳນວນລັດຖະກອນທີ່ບັນຈຸຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 1; $i < 7; $i++) : ?>
                                <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 1; $i < 8; $i++) : ?>
                                <th class="text-center">ລ</th>
                                <th class="text-center">ຍ</th>
                            <?php endfor; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($models as $index => $model) : ?>
                            <tr style="background-color: #eeffff;">
                                <th class="text-center"><?= $index + 1 ?></th>
                                <th colspan="2"><?= $model['name'] ?></th>
                                <th class="text-center"><?= number_format(sum($model['items'], '')) ?></th>
                                <th class="text-center"><?= number_format(sum($model['items'], '_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step1')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step1_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step2')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step2_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step3')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step3_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step4')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step4_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step5')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step5_women')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step6')) ?></th>
                                <th class="text-center"><?= number_format(sumcolumn($model['items'], 'step6_women')) ?></th>
                            </tr>

                            <?php foreach ($model['items'] as $i => $m) : ?>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>- <?= $m['level'] ?></td>
                                    <td class="text-center"><?= number_format(sumrow($m, '')) ?></td>
                                    <td class="text-center"><?= number_format(sumrow($m, '_women')) ?></td>
                                    <td class="text-center"><?= number_format($m['step1']) ?></td>
                                    <td class="text-center"><?= number_format($m['step1_women']) ?></td>
                                    <td class="text-center"><?= number_format($m['step2']) ?></td>
                                    <td class="text-center"><?= number_format($m['step2_women']) ?></td>
                                    <td class="text-center"><?= number_format($m['step3']) ?></td>
                                    <td class="text-center"><?= number_format($m['step3_women']) ?></td>
                                    <td class="text-center"><?= number_format($m['step4']) ?></td>
                                    <td class="text-center"><?= number_format($m['step4_women']) ?></td>
                                    <td class="text-center"><?= number_format($m['step5']) ?></td>
                                    <td class="text-center"><?= number_format($m['step5_women']) ?></td>
                                    <td class="text-center"><?= number_format($m['step6']) ?></td>
                                    <td class="text-center"><?= number_format($m['step6_women']) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>