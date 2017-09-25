<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerSalarySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Officer Salaries');
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statOfficerSalary">
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
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-4">
                    <label>ພາກສ່ວນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-8">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <?php for($i=1;$i<4;$i++) : ?>
                                <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <?php for($i=1;$i<7;$i++) : ?>
                                    <th class="text-center"><?= $i%2==1?'ລ':'ຍ' ?></th>
                                <?php endfor; ?>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=1;$i<4;$i++) : ?>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_total" type="number" min="0"></td>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_women" type="number" max="{{model.level<?=$i?>_total}}"></td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for($i=4;$i<10;$i++) : ?>
                                <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for($i=1;$i<13;$i++) : ?>
                                <th class="text-center"><?= $i%2==1?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=4;$i<10;$i++) : ?>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_total" type="number" min="0"></td>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_women" type="number" max="{{model.level<?=$i?>_total}}"></td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for($i=10;$i<16;$i++) : ?>
                                <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for($i=1;$i<13;$i++) : ?>
                                <th class="text-center"><?= $i%2==1?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=10;$i<16;$i++) : ?>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_total" type="number" min="0"></td>
                                <td><input class="form-control" ng-model="model.level<?=$i?>_women" type="number" max="{{model.level<?=$i?>_total}}"></td>
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
                    <th class="text-center" rowspan="3">ລ/ດ</th>
                    <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                    <th class="text-center" rowspan="3" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                    <th class="text-center" colspan="30">ຈຳນວນລັດຖະກອນທີ່ບັນຈຸຕາມຊັ້ນເງິນເດືອນ</th>
                </tr>
                <tr>
                    <?php for($i=1;$i<16;$i++): ?>
                    <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <?php for($i=1;$i<31;$i++): ?>
                        <th class="text-center"><?= $i%2==1?'ລ':'ຍ'?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center" colspan="2">1. ກະຊວງພາຍໃນ ລວມທັງໝົດ</th>
                    <th class="text-center">{{sumtotal('total') | number}}</th>
                    <th class="text-center">{{sumtotal('women') | number}}</th>

                    <?php for($i=1;$i<16;$i++): ?>
                        <th class="text-center">{{sumcolumn('level<?=$i?>_total') | number}}</th>
                        <th class="text-center">{{sumcolumn('level<?=$i?>_women') | number}}</th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td colspan="2">{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number}}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number}}</td>
                    <?php for($i=1;$i<16;$i++): ?>
                        <td class="text-center">{{m.level<?=$i?>_total | number}}</td>
                        <td class="text-center">{{m.level<?=$i?>_women | number}}</td>
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
  app.controller('statOfficerSalary', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-salary/';
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
              <?php for($i=0;$i<16;$i++): ?>
              $scope.model.level<?=$i?>_total = parseInt(r.data.model.level<?=$i?>_total);
              $scope.model.level<?=$i?>_women = parseInt(r.data.model.level<?=$i?>_women);
              <?php endfor; ?>

            } else {
                <?php for($i=0;$i<16;$i++): ?>
              $scope.model.level<?=$i?>_total = null;
              $scope.model.level<?=$i?>_women = null;
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
        if(key == 'total') {
            <?php for($i=1;$i<16;$i++): ?>
          if(m.level<?=$i?>_total)
            s += parseInt(m.level<?=$i?>_total);
            <?php endfor; ?>
        } else if(key == 'women') {
            <?php for($i=1;$i<16;$i++): ?>
          if(m.level<?=$i?>_women)
            s += parseInt(m.level<?=$i?>_women);
            <?php endfor; ?>
        }
        return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
          <?php for($i=1;$i<16;$i++): ?>
          s += $scope.sumcolumn('level<?=$i?>_total');
          <?php endfor; ?>
      } else if(key == 'women') {
          <?php for($i=1;$i<16;$i++): ?>
            s += $scope.sumcolumn('level<?=$i?>_women');
          <?php endfor; ?>
      }
      return s;
    };
  });
</script>