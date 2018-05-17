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
                <h3 class="title">ສະຖິຕິການບໍລິການແຜນທີ່ມາດຕາສ່ວນ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center">ລ/ດ</th>
                        <th class="text-center">ກິດຈະກຳ</th>
                        <th class="text-center">ຈຳນວນ (ໃບ)</th>
                        <th class="text-center">ຈຳນວນ km<sup>2</sup></th>
                        <th class="text-center">ຈຳນວນຈຸດ</th>
                        <th class="text-center">ໝາຍເຫດ</th>
                    </tr>
                    <tr>
                        <?php
                            $sum = ['amount' => 0, 'km' => 0, 'point' => 0];
                            foreach ($models as $model)
                                foreach (['amount', 'km', 'point'] as $item)
                                    $sum[$item] += $model[$item]
                        ?>
                        <th class="text-center" colspan="2">ລວມ</th>
                        <th class="text-center"><?= number_format($sum['amount']) ?></th>
                        <th class="text-center"><?= number_format($sum['km']) ?></th>
                        <th class="text-center"><?= number_format($sum['point']) ?></th>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $index=> $m): ?>
                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td><?= $m['activity'] ?></td>
                        <td class="text-center"><?= number_format($m['amount']) ?></td>
                        <td class="text-center"><?= number_format($m['km']) ?></td>
                        <td class="text-center"><?= number_format($m['point']) ?></td>
                        <td><?= $m['remark'] ?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
