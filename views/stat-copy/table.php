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
                <h3 class="title">ສະຖິຕິການສັງລວມການສຳເນົາ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center">ລ/ດ</th>
                        <th class="text-center">ເນື້ອໃນກິດຈະກຳ</th>
                        <th class="text-center">ໄລຍະເວລາ ຈັດຕັ້ງປະຕິບັດ</th>
                        <th class="text-center">ສັງລວມ</th>
                        <th class="text-center">ໝາຍເຫດ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $index => $m): ?>
                    <tr>
                        <td class="text-center"><?= $index + 1 ?></td>
                        <td><?= $m['activity'] ?></td>
                        <td class="text-center"><?= $m['start_year'] ?> - <?= $m['end_year'] ?></td>
                        <td class="text-center"><?= $m['summary'] ?></td>
                        <td><?= $m['remark'] ?></td>
                    </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
