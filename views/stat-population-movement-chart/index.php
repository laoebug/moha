<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPopulationMovementSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Population Movements');
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
</style>
<div class="row" ng-app="mohaApp" ng-controller="statPopulationMovementController">
    <div class="col-sm-12 hidden">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" multiple="" ng-model="year" ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-2">
            <button type="button" class="btn btn-primary col-sm-12" ng-click="enquiry()">
                <i class="fa fa-search"></i> <?= Yii::t('app', 'Inquiry') ?>
            </button>
        </div>
    </div>

    <div class="col-sm-12" ng-show="response.status == 200">
        <div ng-show="response" class="alert alert-danger">
            {{response.statusText}}
        </div>
    </div>

    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
        <div class="card-title-w-btn ">
            <h3><?= Yii::t('app', 'Comparations of Population Movement') ?></h3>
            <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
            </p>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Year') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Population') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'District') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Village') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Die') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-Out') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
            </tr>
            <tr>
                <?php for($i = 0; $i < 12; $i++): ?>
                <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                <?php endfor; ?>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="m in models">
                <td>{{m.year}}</td>
                <?php foreach ($columns as $c): ?>
                    <td class="text-center">{{m.<?= $c ?> | number}}</td>
                <?php endforeach; ?>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="col-sm-12">
        <div class="card">
            <h3><?= Yii::t('app', 'The Chart of Population Movement Yearly') ?></h3>
            <canvas id="stat" class="chart chart-bar"
                    chart-data="stat.data"
                    chart-labels="stat.labels"
                    chart-series="stat.series"
                    chart-colors="stat.colors"
            </canvas
        </div>
    </div>
</div>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', ['chart.js']);
  app.controller('statPopulationMovementController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-population-movement-chart/';
    $scope.enquiry = function() {
      $scope.model=null;
        $http.get($scope.url + 'inquiry')
          .then(function(r) {
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.stat.colors = ['#FF0000', '#0000FF'];
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.enquiry();
  });
</script>
