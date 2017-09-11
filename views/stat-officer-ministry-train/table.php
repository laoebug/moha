<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/10/17
 * Time: 5:11 PM
 */
?>

<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
/* @var $model app\models\StatOfficerTrainDetail */

?>
<style type="text/css" media="print">
    @page { size: landscape; }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Officers By Positions') ?> (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.')?></th>
                        <th class="text-center" rowspan="2" colspan="16"><?= Yii::t('app', 'Description')?></th>
                        <th class="text-center" colspan="3"><?= Yii::t('app', 'Officer')?></th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men')?></th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
