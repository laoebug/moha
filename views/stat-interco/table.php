<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */

?>
<style type="text/css" media="print">
    * {
        font-family: "Saysettha OT", "Phetsarath OT" !important;
    }

    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ຕາຕະລາງສັງລວມສະຖິຕິການຮ່ວມມືສາກົນຂອງຂະແໜງການພາຍໃນ ປະຈຳປີ (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 20px">ລ/ດ</th>
                        <th class="text-center">ຊື່ປະເທດ/ອົງການຈັດຕັ້ງສາກົນ</th>
                        <th class="text-center">ຂົງເຂດວຽກງານທີ່ສະໜັບສະໜູນ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $i => $model): ?>
                        <tr>
                            <td><?= $i + 1 ?></td>
                            <td><?= $model['name'] ?></td>
                            <td><?= $model['area'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
