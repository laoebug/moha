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
        <h3>ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ</h3>
        <p>
            <a class="btn btn-default" target="_blank" href="index.php?r=stat-ethnic/print&year=<?= $year->id ?>"><i
                        class="fa fa-print fa-2x"></i></a>
            <a class="btn btn-info" target="_blank" href="index.php?r=stat-ethnic/download&year=<?= $year->id ?>"><i
                        class="fa fa-download fa-2x"></i></a>
        </p>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
        <tr>
            <th><?= Yii::t('app', 'No.') ?></th>
            <th><?= Yii::t('app', 'Province') ?></th>
            <th>ຊົນເຜົ່າ</th>
            <?php foreach ($ethnics as $i => $ethnic): if ($i == 25) break; ?>
                <th><?= $ethnic->name ?></th>
            <?php endforeach; ?>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($provinces as $i => $province): ?>
            <tr>
                <td rowspan="2"><?= $i + 1 ?></td>
                <td rowspan="2"><?= $province->province_name ?></td>
                <td><?= Yii::t('app', 'Total') ?></td>
                <?php foreach ($ethnics as $j => $ethnic): ?>
                    <td class="text-center">
                        <?php
                        $value = '-';
                        foreach ($models as $model)
                            if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                $value = number_format($model->total);
                                break;
                            }
                        echo $value;
                        ?>
                    </td>
                    <?php
                    if ($j == 24) break;
                endforeach; ?>
            </tr>
            <tr>
                <td><?= Yii::t('app', 'Women') ?></td>
                <?php foreach ($ethnics as $e => $ethnic): ?>
                    <td class="text-center">
                        <?php
                        $value = '-';
                        foreach ($models as $model)
                            if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                $value = number_format($model->women);
                                break;
                            }
                        echo $value;
                        ?>
                    </td>
                    <?php
                    if ($e == 24) break;
                endforeach; ?>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>

    <?php if (isset($ethnics[25])) : ?>
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th><?= Yii::t('app', 'No.') ?></th>
                <th><?= Yii::t('app', 'Province') ?></th>
                <th><?= Yii::t('app', 'Ethnic') ?></th>
                <?php for ($i = 25; $i < count($ethnics); $i++):
                    $ethnic = $ethnics[$i];
                    ?>
                    <th><?= $ethnic->name ?></th>
                <?php endfor; ?>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($provinces as $p => $province): ?>
                <tr>
                    <td rowspan="2"><?= $p + 1 ?></td>
                    <td rowspan="2"><?= $province->province_name ?></td>
                    <td><?= Yii::t('app', 'Total') ?></td>
                    <?php for ($i = 25; $i < count($ethnics); $i++):
                        $ethnic = $ethnics[$i];
                        ?>
                        <td class="text-center">
                            <?php
                            $value = '-';
                            foreach ($models as $model)
                                if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                    $value = number_format($model->total);
                                    break;
                                }
                            echo $value;
                            ?>
                        </td>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <td><?= Yii::t('app', 'Women') ?></td>
                    <?php for ($i = 25; $i < count($ethnics); $i++):
                        $ethnic = $ethnics[$i];
                        ?>
                        <td class="text-center">
                            <?php
                            $value = '-';
                            foreach ($models as $model)
                                if ($model->province_id == $province->id && $model->ethnic_id == $ethnic->id) {
                                    $value = number_format($model->women);
                                    break;
                                }
                            echo $value;
                            ?>
                        </td>
                    <?php endfor; ?>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    <?php endif; ?>
</div>