
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Unauthorized');
$this->params['breadcrumbs'][] = $this->title;
?>

<!-- <div class="card"> -->

<div class="page-error">
      <h1><i class="fa fa-exclamation-circle"></i> <?php echo Yii::t("app","HTTP Error 401 Unauthorized operation")?></h1>
      <p>
      <?php //echo Yii::t("app","You are not authorized to access this page due to invalid authentication")." with ID:  " . !empty($controller_id)?$controller_id: "" . "/ " . !empty($acton_id)?$acton_id: ""  ?>
      <?php echo Yii::t("app","You are not authorized to access this page due to invalid authentication"); ?>
      </p>
      <p><?php echo Yii::t("app","Please contact administrator")?></p>
      <p><a href="javascript:window.history.back();">Go back to previous page</a></p>
</div>

<!-- </div> -->


        

    