<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/3/18
 * Time: 3:12 PM
 */
?>
<div class="card">
    <div class="row">
        <div class="col-xs-12">
            <h3>ລາຍງານຂໍ້ມູນທີ່ຍັງປ້ອນບໍ່ສຳເລັດ</h3>
            <form action="index.php?r=report/incomplete" class="hidden">
                <div class="col-xs-4">
                    <select name="year" id="year" class="form-control">
                        <option value="">ເລືອກປີ</option>
                        <?php foreach ($years as $year): ?>
                            <option value="<?= $year->id ?>"><?= $year->year ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col-xs-4">
                    <button class="btn btn-primary" type="submit">ຊອກຫາ</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>ລຳດັບ</th>
                    <th>ຊື່ສະຖິຕິ</th>
                    <th>ເບິ່ງ</th>
                </tr>
                </thead>
                <tbody>
                <?php
                foreach ($reports as $year => $years) :
                    if(count($years) == 0) continue;
                    ?>
                    <tr>
                        <th colspan="3" class="text-center">ປີ <?= $year ?></th>
                    </tr>
                    <?php
                    foreach ($years as $i => $report) :
                        ?>
                        <tr>
                            <td><?= ++$i ?></td>
                            <td>
                                <a target="_blank" href="index.php?r=<?= $report['url'] ?>"><?= $report['name'] ?></a>
                            </td>
                            <td>
                                <a target="_blank" class="btn btn-primary" href="index.php?r=<?= $report['url'] ?>">
                                    <i class="fa fa-eye"></i>
                                </a>
                            </td>
                        </tr>
                        <?php
                    endforeach;
                endforeach;
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
