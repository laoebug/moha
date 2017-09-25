<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatExploreSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Explores');
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statExplore">
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
                    <label><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-change="inquiry()" ng-model="model.province" ng-options="p.province_name for p in provinces"></select>
                </div>
                <div class="col-sm-2">
                    <label>ຫຼັກໝາຍ</label>
                    <input class="form-control" ng-model="model.mark" type="number" min="0">
                </div>
                <div class="col-sm-2">
                    <label>ຈຸດ</label>
                    <input class="form-control" ng-model="model.point" type="number" min="0">
                </div>
                <div class="col-sm-2">
                    <label>ເນື້ອທີ່ ເຮັກຕາ</label>
                    <input class="form-control" ng-model="model.hm" type="number" min="0">
                </div>
                <div class="col-sm-2">
                    <label>ເນື້ອທີ່ ກິໂລແມັດ</label>
                    <input class="form-control" ng-model="model.km" type="number" min="0">
                </div>
                <div class="col-sm-12">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
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
                    <th class="text-center" rowspan="2">ລ/ດ</th>
                    <th class="text-center" rowspan="2">ແຂວງ</th>
                    <th class="text-center" colspan="4">ຫົວໜ່ວຍ</th>
                    <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <th class="text-center">ຫຼັກໝາຍ</th>
                    <th class="text-center">ຈຸດ</th>
                    <th class="text-center">ເນື້ອທີ່ ເຮັກຕາ</th>
                    <th class="text-center">ເນື້ອທີ່ ກິໂລແມັດ</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2">ລວມ</th>
                    <th class="text-center">{{sumcolumn('mark') | number}}</th>
                    <th class="text-center">{{sumcolumn('point') | number}}</th>
                    <th class="text-center">{{sumcolumn('hm') | number}}</th>
                    <th class="text-center">{{sumcolumn('km') | number}}</th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models" style="cursor: pointer">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{m.province}}</td>
                    <td class="text-center">{{m.mark | number }}</td>
                    <td class="text-center">{{m.point | number }}</td>
                    <td class="text-center">{{m.hm | number }}</td>
                    <td class="text-center">{{m.km | number }}</td>
                    <td class="text-center">{{m.remark}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statExplore', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-explore/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

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

    $scope.inquiry = function() {
      if($scope.year && $scope.model.province) {
        $http.get($scope.url + 'inquiry&year='+ $scope.year.id + '&province='+ $scope.model.province.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.mark = parseInt(r.data.model.mark);
              $scope.model.point = parseInt(r.data.model.point);
              $scope.model.hm = parseInt(r.data.model.hm);
              $scope.model.km = parseInt(r.data.model.km);
              $scope.model.remark = r.data.model.remark;
            } else {
              $scope.model.mark     = null;
              $scope.model.point    = null;
              $scope.model.hm       = null;
              $scope.model.km       = null;
              $scope.model.remark   = null;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
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
  });
</script>
