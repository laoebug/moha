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
                <h3 class="title">ສະຖິຕິຜະລິດແຜນທີ່ (<?= isset($year) ? $year->year : '' ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center">ລ/ດ</th>
                        <th class="text-center">ກິດຈະກຳ</th>
                        <th class="text-center">ຈຳນວນພິມ (ໃບ)</th>
                        <th class="text-center">ໝາຍເຫດ</th>
                    </tr>
                    <tr>
                        <?php
                        $sum = 0;
                        if (isset($models))
                            foreach ($models as $model)
                                $sum += $model['amount'];
                        ?>
                        <th class="text-center" colspan="2">ລວມ</th>
                        <th class="text-center"><?= number_format($sum) ?></th>
                        <td></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    if (isset($models))
                        foreach ($models as $index => $m): ?>
                            <tr>
                                <td class="text-center"><?= $index + 1 ?></td>
                                <td><?= $m['activity'] ?></td>
                                <td class="text-center"><?= number_format($m['amount']) ?></td>
                                <td><?= $m['remark'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
