<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPositionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ສະຖິຕິຜູູ້ທີ່ໄດ້ຮັບຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statOfficerAgeLevel">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading"><i class="fa fa-pencil"></i></div>
            <div class="panel-body">
                <div class="col-sm-4">
                    <label>ພາກສ່ວນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-8">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for ($i=1;$i<=3;$i++): ?>
                            <th colspan="2" class="text-center">ປະເພດ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i=0;$i<6;$i++): ?>
                                <th class="text-center"><?= $i%2==0?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i=1;$i<=3;$i++): ?>
                                <td>
                                    <input type="number" class="form-control" ng-model="model.position<?=$i?>_total">
                                </td>
                                <td>
                                    <input type="number" class="form-control" ng-model="model.position<?=$i?>_women">
                                </td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for ($i=4;$i<=8;$i++): ?>
                                <th colspan="2" class="text-center">ປະເພດ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i=0;$i<10;$i++): ?>
                                <th class="text-center"><?= $i%2==0?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i=4;$i<=8;$i++): ?>
                                <td>
                                    <input type="number" class="form-control" ng-model="model.position<?=$i?>_total">
                                </td>
                                <td>
                                    <input type="number" class="form-control" ng-model="model.position<?=$i?>_women">
                                </td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="col-sm-3" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-if="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card" style="overflow-x: scroll">
            <div class="card-title-w-btn ">
                <h3><?= $this->title ?> {{year.year}}</h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                    <th class="text-center" rowspan="2" colspan="2">ລວມທັງໝົດ</th>
                    <th class="text-center" colspan="16">ຕຳແໜ່ງບໍລິຫານ</th>
                </tr>
                <?php for($c = 1; $c <= 8; $c++): ?>
                    <th colspan="2" class="text-center">ປະເພດ <?=$c ?></th>
                <?php endfor; ?>
                <tr>
                    <?php for($i=0;$i<18;$i++): ?>
                        <th class="text-center"><?= $i%2==0?'ລ':'ຍ'?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center">ກະຊວງພາຍໃນ</th>
                    <th class="text-center">{{sumtotal('total') | number}}</th>
                    <th class="text-center">{{sumtotal('women') | number}}</th>
                    <?php for($c = 1; $c <= 8; $c++): ?>
                        <th class="text-center">{{sumcolumn('position<?=$c?>_total') | number}}</th>
                        <th class="text-center">{{sumcolumn('position<?=$c?>_women') | number}}</th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td>{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number}}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number}}</td>
                    <?php for($c = 1; $c <= 8; $c++): ?>
                        <td class="text-center">{{m.position<?=$c?>_total | number}}</td>
                        <td class="text-center">{{m.position<?=$c?>_women | number}}</td>
                    <?php endfor; ?>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statOfficerAgeLevel', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-position/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.levels = r.data.levels;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.inquiry = function() {
      if($scope.year && $scope.model.level)
        $http.get($scope.url + 'inquiry&year='+$scope.year.id + '&level='+$scope.model.level.id)
          .then(function(r) {
            if(r.data.model) {
                <?php for($i = 1;$i <= 8; $i++): ?>
              $scope.model.position<?=$i?>_total = parseInt(r.data.model.position<?=$i?>_total);
              $scope.model.position<?=$i?>_women = parseInt(r.data.model.position<?=$i?>_women);
                <?php endfor; ?>
            } else {
                <?php for($i = 1;$i <= 8; $i++): ?>
              $scope.model.position<?=$i?>_total = null;
              $scope.model.position<?=$i?>_women = null;
                <?php endfor; ?>
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.enquiry = function() {
      $scope.model = null;
      if($scope.year)
        $http.get($scope.url + 'enquiry&year='+$scope.year.id)
          .then(function(r) {
            $scope.models = r.data.models;
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function() {
      if($scope.year && $scope.model) {
        $http.post($scope.url+'save&year='+$scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        }, function(r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.sumcolumn = function(key) {
      var s = 0;
      for(var i=0;i<$scope.models.length;i++)
        if($scope.models[i][key])
          s+= parseInt($scope.models[i][key]);
      return s;
    };

    $scope.sumrow = function(m, key) {
      var s = 0;
      if(key == "total") {
        if(m.position1_total) s += parseInt(m.position1_total);
        if(m.position2_total) s += parseInt(m.position2_total);
        if(m.position3_total) s += parseInt(m.position3_total);
        if(m.position4_total) s += parseInt(m.position4_total);
        if(m.position5_total) s += parseInt(m.position5_total);
        if(m.position6_total) s += parseInt(m.position6_total);
        if(m.position7_total) s += parseInt(m.position7_total);
        if(m.position8_total) s += parseInt(m.position8_total);
      } else if(key == "women") {
        if(m.position1_women) s += parseInt(m.position1_women);
        if(m.position2_women) s += parseInt(m.position2_women);
        if(m.position3_women) s += parseInt(m.position3_women);
        if(m.position4_women) s += parseInt(m.position4_women);
        if(m.position5_women) s += parseInt(m.position5_women);
        if(m.position6_women) s += parseInt(m.position6_women);
        if(m.position7_women) s += parseInt(m.position7_women);
        if(m.position8_women) s += parseInt(m.position8_women);
      }

      return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
        s = $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total')
          + $scope.sumcolumn('position1_total');
      } else if(key == 'women') {
        s = $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women')
          + $scope.sumcolumn('position1_women');
      }
      return s;
    };
  });
</script>
