<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerNewSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ ໃນຮູບການຕ່າງໆ ແລະ ແຜນຄວາມຕ້ອງການ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statOfficerNew">
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
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                            <th class="text-center" rowspan="3">ໂກຕາທີ່ໄດ້ຮັບ</th>
                            <th class="text-center" rowspan="3">ຄວາມຕ້ອງການໃໝ່</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">ຮັບເຂົ້າໃໝ່</th>
                            <th colspan="2" class="text-center">ມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<8;$i++): ?>
                                <th class="text-center"><?=$i%2==0?'ລ':'ຍ'?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.new_total"></td>
                            <td><input type="number" class="form-control" min="{{model.new_total}}" ng-model="model.new_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.ministry_total"></td>
                            <td><input type="number" class="form-control" min="{{model.ministry_total}}" ng-model="model.ministry_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.army_total"></td>
                            <td><input type="number" class="form-control" min="{{model.army_total}}" ng-model="model.army_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.soe_total"></td>
                            <td><input type="number" class="form-control" min="{{model.soe_total}}" ng-model="model.soe_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.quota"></td>
                            <td><input type="number" class="form-control" ng-model="model.need"></td>
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
                    <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                    <th class="text-center" rowspan="3">ໂກຕາທີ່ໄດ້ຮັບ</th>
                    <th class="text-center" rowspan="3">ຄວາມຕ້ອງການໃໝ່</th>
                </tr>
                <tr>
                    <th colspan="2" class="text-center">ຮັບເຂົ້າໃໝ່</th>
                    <th colspan="2" class="text-center">ມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                    <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                    <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                </tr>
                <tr>
                    <?php for($i=0;$i<10;$i++): ?>
                    <th class="text-center"><?=$i%2==0?'ລ':'ຍ'?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center">ກະຊວງພາຍໃນ</th>
                    <th class="text-center">{{sumtotal('total') | number}}</th>
                    <th class="text-center">{{sumtotal('women') | number}}</th>
                    <?php foreach(["new","ministry", "army", "soe"] as $c): ?>
                        <th class="text-center">{{sumcolumn('<?=$c?>_total') | number}}</th>
                        <th class="text-center">{{sumcolumn('<?=$c?>_women') | number}}</th>
                    <?php endforeach; ?>
                    <th class="text-center">{{sumcolumn('quota')}}</th>
                    <th class="text-center">{{sumcolumn('need')}}</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td>{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number}}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number}}</td>
                    <td class="text-center">{{m.new_total}}</td>
                    <td class="text-center">{{m.new_women}}</td>
                    <td class="text-center">{{m.ministry_total}}</td>
                    <td class="text-center">{{m.ministry_women}}</td>
                    <td class="text-center">{{m.army_total}}</td>
                    <td class="text-center">{{m.army_women}}</td>
                    <td class="text-center">{{m.soe_total}}</td>
                    <td class="text-center">{{m.soe_women}}</td>
                    <td class="text-center">{{m.quota}}</td>
                    <td class="text-center">{{m.need}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statOfficerNew', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-new/';
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
              $scope.model.new_total = parseInt(r.data.model.new_total);
              $scope.model.new_women = parseInt(r.data.model.new_women);
              $scope.model.ministry_total = parseInt(r.data.model.ministry_total);
              $scope.model.ministry_women = parseInt(r.data.model.ministry_women);
              $scope.model.army_total = parseInt(r.data.model.army_total);
              $scope.model.army_women = parseInt(r.data.model.army_women);
              $scope.model.soe_total = parseInt(r.data.model.soe_total);
              $scope.model.soe_women = parseInt(r.data.model.soe_women);
              $scope.model.quota = parseInt(r.data.model.quota);
              $scope.model.need = parseInt(r.data.model.need);
            } else {
              $scope.model.new_total = null;
              $scope.model.new_women = null;
              $scope.model.ministry_total = null;
              $scope.model.ministry_women = null;
              $scope.model.army_total = null;
              $scope.model.army_women = null;
              $scope.model.soe_total = null;
              $scope.model.soe_women = null;
              $scope.model.quota = null;
              $scope.model.need = null;
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
        if(m.new_total) s += parseInt(m.new_total);
        if(m.ministry_total) s += parseInt(m.ministry_total);
        if(m.army_total) s += parseInt(m.army_total);
        if(m.soe_total) s += parseInt(m.soe_total);
      } else if(key == "women") {
        if(m.new_women) s += parseInt(m.new_women);
        if(m.ministry_women) s += parseInt(m.ministry_women);
        if(m.army_women) s += parseInt(m.army_women);
        if(m.soe_women) s += parseInt(m.soe_women);
      }

      return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
        s = $scope.sumcolumn('new_total')
          + $scope.sumcolumn('ministry_total')
          + $scope.sumcolumn('army_total')
          + $scope.sumcolumn('soe_total');
      } else if(key == 'women') {
        s = $scope.sumcolumn('new_women')
          + $scope.sumcolumn('ministry_women')
          + $scope.sumcolumn('army_women')
          + $scope.sumcolumn('soe_women');
      }
      return s;
    };
  });
</script>