<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerAddSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ";
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerAddController">
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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'Description')?></th>
                            <th class="text-center" style="width: 20%"><?= Yii::t('app', 'Total')?></th>
                            <th class="text-center" style="width: 20%"><?= Yii::t('app', 'Women')?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>ຮັບເຂົ້າໃໝ່ຕາມການແບ່ງປັນ (ໂກຕ້າ)</td><td><input type="number" min="0" ng-model="model.quota_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.quota_women" max="{{model.quota_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>ຍົກຍ້າຍມາຈາກຝ່າຍກຳລັງປະກອບອາວຸດ (ທະຫານ, ຕຳຫຼວດ)</td><td><input type="number" min="0" ng-model="model.army_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.army_women" max="{{model.army_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</td><td><input type="number" min="0" ng-model="model.soe_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.soe_women" max="{{model.soe_total}}" class="form-control"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="model" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card">
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
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.')?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Description')?></th>
                    <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                    <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                    <th class="text-center"><?= Yii::t('app', 'Men')?></th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="text-center" rowspan="12">VI</th>
                        <th>ຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ</th>
                        <th class="text-center">{{formatNumber(model.quota_total + model.army_total + model.soe_total)}}</th>
                        <th class="text-center">{{formatNumber(model.quota_women + model.army_women + model.soe_women)}}</th>
                        <th class="text-center">{{formatNumber(model.quota_total + model.army_total + model.soe_total - (model.quota_women + model.army_women + model.soe_women))}}</th>
                    </tr>
                    <tr>
                        <td>1. ຮັບເຂົ້າໃໝ່ຕາມການແບ່ງປັນ (ໂກຕ້າ)</td><td class='text-center'>{{formatNumber(model.quota_total)}}</td><td class='text-center'>{{formatNumber(model.quota_women)}}</td><td class='text-center'>{{formatNumber(model.quota_total - model.quota_women)}}</td>
                    </tr>
                    <tr>
                        <td>2. ຍົກຍ້າຍມາຈາກຝ່າຍກຳລັງປະກອບອາວຸດ (ທະຫານ, ຕຳຫຼວດ)</td><td class='text-center'>{{formatNumber(model.army_total)}}</td><td class='text-center'>{{formatNumber(model.army_women)}}</td><td class='text-center'>{{formatNumber(model.army_total - model.army_women)}}</td>
                    </tr>
                    <tr>
                        <td>3. ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</td><td class='text-center'>{{formatNumber(model.soe_total)}}</td><td class='text-center'>{{formatNumber(model.soe_women)}}</td><td class='text-center'>{{formatNumber(model.soe_total - model.soe_women)}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerAddController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-add/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
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
            $scope.model = r.data.model;
            if(r.data.model) {
              $scope.model.quota_total = parseInt($scope.model.quota_total);
              $scope.model.army_total  = parseInt($scope.model.army_total);
              $scope.model.soe_total   = parseInt($scope.model.soe_total);

              $scope.model.quota_women = parseInt($scope.model.quota_women);
              $scope.model.army_women  = parseInt($scope.model.army_women);
              $scope.model.soe_women   = parseInt($scope.model.soe_women);
            }
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

    $scope.formatNumber = function(num, dec) {
      if (dec === undefined) dec = 2;
      var r = "" + Math.abs(parseFloat(num).toFixed(dec));
      var decimals = "";
      if (r.lastIndexOf(".") != -1) {
        decimals = "." + r.substring(r.lastIndexOf(".") + 1);
        decimals = decimals.substring(0, Math.min(dec + 1, decimals.length)); // Take only 2 digits after decimals
        r = r.substring(0, r.lastIndexOf("."));
      }
      for (var i = r.length - 3; i > 0; i -= 3)
        r = r.substr(0, i) + "," + r.substr(i);
      return (num < 0 ? "-" : "") + r + decimals;
    }
  });
</script>