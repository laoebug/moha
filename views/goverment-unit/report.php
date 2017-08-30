<div class="panel panel-primary">
    <div class="panel-heading">
        <h2 class="text-center"><?= Yii::t('app','Statistics of Goverment Unit ') ?> (<?= $year->year ?>)</h2>
    </div>
    <div class="panel-body">
        <table class="table table-responsive table-bordered table-hover">
            <thead>
            <tr>
                <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                <th><?= Yii::t('app', 'Ministry') ?></th>
                <?php foreach ($govermentlevels as $l): ?>
                    <th style="width: 10%"><?= $l->name ?></th>
                <?php endforeach;  ?>
                <th><?= Yii::t('app', 'Remark') ?></th>
            </tr>
            </thead>
            <tbody>
            <?php
            $i = 0;
            foreach ($branchgroups as $g): ?>
                <tr>
                    <td colspan="2" class="text-center"><strong><?= $g->name ?></strong></td>
                    <?php foreach ($govermentlevels as $l): ?>
                        <td></td>
                    <?php endforeach;  ?>
                    <td></td>
                </tr>

                <?php foreach ($g->branches as $b): ?>
                    <tr>
                        <td><?= ++$i ?></td>
                        <td><?= $b->name ?></td>
                        <?php foreach ($govermentlevels as $l): ?>
                            <td></td>
                        <?php endforeach;  ?>
                        <td></td>
                    </tr>
                <?php endforeach; ?>
            <?php endforeach; ?>
            </tbody>
            <tfoot>
            <tr>
                <th colspan="2"><?= Yii::t('app', 'Total') ?></th>
                <?php foreach ($govermentlevels as $l): ?>
                    <td></td>
                <?php endforeach;  ?>
                <td></td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>