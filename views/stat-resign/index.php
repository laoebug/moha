<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatResignSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statResign">
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
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label>ພາກສ່ວນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="14">ຈຳນວນລັດຖະກອນອອກໃນຮູບການຕ່າງໆ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2">ບຳນານ</th>
                            <th class="text-center" colspan="2">ບຳເນັດ</th>
                            <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                            <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
                            <th class="text-center" colspan="2">ຖືກວິໄນ ໄລ່ອອກ</th>
                            <th class="text-center" colspan="2">ລາອອກ</th>
                            <th class="text-center" colspan="2">ເສຍກຳລັງ ແຮງງານ</th>
                        </tr>
                        <tr>
                            <?php for ($i=1;$i<=14;$i++): ?>
                            <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.retire_total">
                                </td><td><input type="number" class="form-control" ng-model="model.retire_women">
                                </td><td><input type="number" class="form-control" ng-model="model.bumnet_total">
                                </td><td><input type="number" class="form-control" ng-model="model.bumnet_women">
                                </td><td><input type="number" class="form-control" ng-model="model.die_total">
                                </td><td><input type="number" class="form-control" ng-model="model.die_women">
                                </td><td><input type="number" class="form-control" ng-model="model.leave_total">
                                </td><td><input type="number" class="form-control" ng-model="model.leave_women">
                                </td><td><input type="number" class="form-control" ng-model="model.fire_total">
                                </td><td><input type="number" class="form-control" ng-model="model.fire_women">
                                </td><td><input type="number" class="form-control" ng-model="model.resign_total">
                                </td><td><input type="number" class="form-control" ng-model="model.resign_women">
                                </td><td><input type="number" class="form-control" ng-model="model.lose_total">
                                </td><td><input type="number" class="form-control" ng-model="model.lose_women">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-4">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" colspan="4">ຍົກຍ້າຍໄປພາກສ່ວນອື່ນ</th>
                            </tr>
                            <tr>
                                <th class="text-center" colspan="2">ກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                                <th class="text-center" colspan="2">ອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
                            </tr>
                            <tr>
                                <?php for ($i=1;$i<=4;$i++): ?>
                                    <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                                <?php endfor; ?>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="number" class="form-control" ng-model="model.army_total">
                                </td><td><input type="number" class="form-control" ng-model="model.army_women">
                                </td><td><input type="number" class="form-control" ng-model="model.ministry_total">
                                </td><td><input type="number" class="form-control" ng-model="model.ministry_women">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
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
                        <th rowspan="3" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                        <th rowspan="2" class="text-center" colspan="2">ຈຳນວນລັດຖະກອນ ອອກທັງໝົດ</th>
                        <th class="text-center" colspan="14">ຈຳນວນລັດຖະກອນອອກໃນຮູບການຕ່າງໆ</th>
                        <th class="text-center" colspan="4">ຍົກຍ້າຍໄປພາກສ່ວນອື່ນ</th>
                    </tr>
                    <tr>
                        <th class="text-center" colspan="2">ບຳນານ</th>
                        <th class="text-center" colspan="2">ບຳເນັດ</th>
                        <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                        <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
                        <th class="text-center" colspan="2">ຖືກວິໄນ ໄລ່ອອກ</th>
                        <th class="text-center" colspan="2">ລາອອກ</th>
                        <th class="text-center" colspan="2">ເສຍກຳລັງ ແຮງງານ</th>
                        <th class="text-center" colspan="2">ກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                        <th class="text-center" colspan="2">ອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
                    </tr>
                    <tr>
                        <?php for ($i=1;$i<=20;$i++): ?>
                            <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                        <?php endfor; ?>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <th>ກະຊວງພາຍໃນ</th>
                    <td class="text-center">{{sumtotal('total') | number }}</td>
                    <td class="text-center">{{sumtotal('women') | number }}</td>
                    <td class="text-center">{{sumcolumn('retire_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('retire_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('bumnet_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('bumnet_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('die_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('die_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('leave_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('leave_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('fire_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('fire_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('resign_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('resign_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('lose_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('lose_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('army_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('army_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('ministry_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('ministry_women') | number }}</td>
                </tr>
                <tr ng-repeat="m in models">
                    <td>{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number }}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number }}</td>
                    <td class="text-center">{{m.retire_total | number }}</td>
                    <td class="text-center">{{m.retire_women | number }}</td>
                    <td class="text-center">{{m.bumnet_total | number }}</td>
                    <td class="text-center">{{m.bumnet_women | number }}</td>
                    <td class="text-center">{{m.die_total | number }}</td>
                    <td class="text-center">{{m.die_women | number }}</td>
                    <td class="text-center">{{m.leave_total | number }}</td>
                    <td class="text-center">{{m.leave_women | number }}</td>
                    <td class="text-center">{{m.fire_total | number }}</td>
                    <td class="text-center">{{m.fire_women | number }}</td>
                    <td class="text-center">{{m.resign_total | number }}</td>
                    <td class="text-center">{{m.resign_women | number }}</td>
                    <td class="text-center">{{m.lose_total | number }}</td>
                    <td class="text-center">{{m.lose_women | number }}</td>
                    <td class="text-center">{{m.army_total | number }}</td>
                    <td class="text-center">{{m.army_women | number }}</td>
                    <td class="text-center">{{m.ministry_total | number }}</td>
                    <td class="text-center">{{m.ministry_women | number }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statResign', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-resign/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
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
              $scope.model.retire_total = parseInt(r.data.model.retire_total);
              $scope.model.retire_women = parseInt(r.data.model.retire_women);
              $scope.model.bumnet_total = parseInt(r.data.model.bumnet_total);
              $scope.model.bumnet_women = parseInt(r.data.model.bumnet_women);
              $scope.model.lose_total = parseInt(r.data.model.lose_total);
              $scope.model.lose_women = parseInt(r.data.model.lose_women);
              $scope.model.leave_total = parseInt(r.data.model.leave_total);
              $scope.model.leave_women = parseInt(r.data.model.leave_women);
              $scope.model.resign_total = parseInt(r.data.model.resign_total);
              $scope.model.resign_women = parseInt(r.data.model.resign_women);
              $scope.model.die_total = parseInt(r.data.model.die_total);
              $scope.model.die_women = parseInt(r.data.model.die_women);
              $scope.model.fire_total = parseInt(r.data.model.fire_total);
              $scope.model.fire_women = parseInt(r.data.model.fire_women);
              $scope.model.ministry_total = parseInt(r.data.model.ministry_total);
              $scope.model.ministry_women = parseInt(r.data.model.ministry_women);
              $scope.model.army_total = parseInt(r.data.model.army_total);
              $scope.model.army_women = parseInt(r.data.model.army_women);
            } else {
              $scope.model.retire_total = null;
              $scope.model.retire_women = null;
              $scope.model.bumnet_total = null;
              $scope.model.bumnet_women = null;
              $scope.model.lose_total = null;
              $scope.model.lose_women = null;
              $scope.model.leave_total = null;
              $scope.model.leave_women = null;
              $scope.model.resign_total = null;
              $scope.model.resign_women = null;
              $scope.model.die_total = null;
              $scope.model.die_women = null;
              $scope.model.fire_total = null;
              $scope.model.fire_women = null;
              $scope.model.ministry_total = null;
              $scope.model.ministry_women = null;
              $scope.model.army_total = null;
              $scope.model.army_women = null;
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
        if(m.retire_total) s += parseInt(m.retire_total);
        if(m.bumnet_total) s += parseInt(m.bumnet_total);
        if(m.die_total) s += parseInt(m.die_total);
        if(m.leave_total) s += parseInt(m.leave_total);
        if(m.lose_total) s += parseInt(m.lose_total);
        if(m.fire_total) s += parseInt(m.fire_total);
        if(m.resign_total) s += parseInt(m.resign_total);
      } else if(key == "women") {
        if(m.retire_women) s += parseInt(m.retire_women);
        if(m.bumnet_women) s += parseInt(m.bumnet_women);
        if(m.die_women) s += parseInt(m.die_women);
        if(m.leave_women) s += parseInt(m.leave_women);
        if(m.lose_women) s += parseInt(m.lose_women);
        if(m.fire_women) s += parseInt(m.fire_women);
        if(m.resign_women) s += parseInt(m.resign_women);
      }

      return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
        s = $scope.sumcolumn('retire_total')
          + $scope.sumcolumn('bumnet_total')
          + $scope.sumcolumn('die_total')
          + $scope.sumcolumn('leave_total')
          + $scope.sumcolumn('lose_total')
          + $scope.sumcolumn('fire_total')
          + $scope.sumcolumn('resign_total');
      } else if(key == 'women') {
        s = $scope.sumcolumn('retire_women')
          + $scope.sumcolumn('bumnet_women')
          + $scope.sumcolumn('die_women')
          + $scope.sumcolumn('leave_women')
          + $scope.sumcolumn('lose_women')
          + $scope.sumcolumn('fire_women')
          + $scope.sumcolumn('resign_women');
      }
      return s;
    };
  });
</script>
