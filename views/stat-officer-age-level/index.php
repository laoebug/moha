<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerSalarySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ";
//$this->params['breadcrumbs'][] = $this->title;
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
                                <?php for($i=0;$i<3;$i++) : ?>
                                    <th colspan="2" class="text-center"><?= $labels[$i] ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <?php for($i=0;$i< 3 * 2;$i++) : ?>
                                    <th class="text-center"><?= $i%2==0 ? 'ລ':'ຍ' ?></th>
                                <?php endfor; ?>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=0;$i<6;$i++) : ?>
                                <td><input class="form-control" ng-model="model.<?= $columns[$i] ?>" type="number" min="0"></td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for($i=3;$i<7;$i++) : ?>
                                <th colspan="2" class="text-center"><?= $labels[$i] ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<8;$i++) : ?>
                                <th class="text-center"><?= $i%2==1?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=6;$i<14;$i++) : ?>
                                <td><input class="form-control" ng-model="model.<?= $columns[$i] ?>" type="number" min="0"></td>
                            <?php endfor; ?>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <?php for($i=7;$i<11;$i++) : ?>
                                <th colspan="2" class="text-center"><?= $labels[$i] ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<8;$i++) : ?>
                                <th class="text-center"><?= $i%2==1?'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for($i=13;$i<21;$i++) : ?>
                                <td><input class="form-control" ng-model="model.<?= $columns[$i] ?>" type="number" min="0"></td>
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
                    <th class="text-center" rowspan="2" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                    <th class="text-center" colspan="16">ຊັ້ນວິຊາສະເພາະ</th>
                    <th class="text-center" colspan="6">ບໍ່ມີວິຊາສະເພາະ</th>
                </tr>
                <tr>
                    <?php foreach($labels as $label): ?>
                    <th class="text-center" colspan="2"><?= $label ?></th>
                    <?php endforeach; ?>
                </tr>
                <tr>
                    <?php for($i=0;$i<24;$i++): ?>
                        <th class="text-center"><?= $i%2==0?'ລ':'ຍ'?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center">1. ກະຊວງພາຍໃນ ລວມທັງໝົດ</th>
                    <th class="text-center">{{sumtotal('total') | number}}</th>
                    <th class="text-center">{{sumtotal('women') | number}}</th>

                    <?php foreach($columns as $c): ?>
                        <th class="text-center">{{sumcolumn('<?=$c?>') | number}}</th>
                    <?php endforeach; ?>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td>{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number}}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number}}</td>
                    <?php foreach($columns as $c): ?>
                        <td class="text-center">{{m.<?=$c?> | number}}</td>
                    <?php endforeach; ?>
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
    $scope.url = 'index.php?r=stat-officer-age-level/';
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
                <?php foreach($columns as $i): ?>
              $scope.model.<?=$i?> = parseInt(r.data.model.<?=$i?>);
              <?php endforeach; ?>
            } else {
                <?php foreach($columns as $i): ?>
              $scope.model.<?=$i?> = null;
                <?php endforeach; ?>
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
        if(m.total_18) s += parseInt(m.total_18);
        if(m.total_20) s += parseInt(m.total_20);
        if(m.total_25) s += parseInt(m.total_25);
        if(m.total_30) s += parseInt(m.total_30);
        if(m.total_35) s += parseInt(m.total_35);
        if(m.total_40) s += parseInt(m.total_40);
        if(m.total_45) s += parseInt(m.total_45);
        if(m.total_50) s += parseInt(m.total_50);
        if(m.total_55) s += parseInt(m.total_55);
        if(m.total_60) s += parseInt(m.total_60);
        if(m.total_60p) s += parseInt(m.total_60p);
      }

      if(key == "women") {
        if(m.women_18) s += parseInt(m.women_18);
        if(m.women_20) s += parseInt(m.women_20);
        if(m.women_25) s += parseInt(m.women_25);
        if(m.women_30) s += parseInt(m.women_30);
        if(m.women_35) s += parseInt(m.women_35);
        if(m.women_40) s += parseInt(m.women_40);
        if(m.women_45) s += parseInt(m.women_45);
        if(m.women_50) s += parseInt(m.women_50);
        if(m.women_55) s += parseInt(m.women_55);
        if(m.women_60) s += parseInt(m.women_60);
        if(m.women_60p) s += parseInt(m.women_60p);
      }
      
      return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
          s = $scope.sumcolumn('total_18')
            + $scope.sumcolumn('total_20')
            + $scope.sumcolumn('total_25')
            + $scope.sumcolumn('total_30')
            + $scope.sumcolumn('total_35')
            + $scope.sumcolumn('total_40')
            + $scope.sumcolumn('total_45')
            + $scope.sumcolumn('total_50')
            + $scope.sumcolumn('total_55')
            + $scope.sumcolumn('total_60')
            + $scope.sumcolumn('total_60p');

      } else if(key == 'women') {
        s = $scope.sumcolumn('women_18')
          + $scope.sumcolumn('women_20')
          + $scope.sumcolumn('women_25')
          + $scope.sumcolumn('women_30')
          + $scope.sumcolumn('women_35')
          + $scope.sumcolumn('women_40')
          + $scope.sumcolumn('women_45')
          + $scope.sumcolumn('women_50')
          + $scope.sumcolumn('women_55')
          + $scope.sumcolumn('women_60')
          + $scope.sumcolumn('women_60p');
      }
      return s;
    };
  });
</script>
