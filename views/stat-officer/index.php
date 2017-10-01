<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */

$this->title = "ຈຳນວນລັດຖະກອນທົ່ວປະເທດ";
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerController">
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
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ຂັ້ນ</th>
                                <th><?= Yii::t('app', 'Total') ?></th>
                                <th><?= Yii::t('app', 'Women') ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><?= Yii::t('app', 'Center')?></td>
                                <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.center_total"></td>
                                <td class="text-center"><input max="{{model.center_total}}"
                                                               min="0" type="number" class="form-control" ng-model="model.center_women"></td>
                            </tr>
                            <tr>
                                <td><?= Yii::t('app', 'Province')?></td>
                                <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.province_total"></td>
                                <td class="text-center"><input max="{{model.province_total}}"
                                                               min="0" type="number" class="form-control" ng-model="model.province_women"></td>
                            </tr>
                            <tr>
                                <td><?= Yii::t('app', 'District')?></td>
                                <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.district_total"></td>
                                <td class="text-center"><input max="{{model.district_total}}"
                                                               min="0" type="number" class="form-control" ng-model="model.district_women"></td>
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
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center" colspan="2" rowspan="2"><?= Yii::t('app', 'Description') ?></th>
                        <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men') ?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th rowspan="5">I</th>
                        <th colspan="2"><?= $this->title ?></th>
                        <th class="text-right">{{formatNumber(model.center_total + model.province_total + model.district_total)}}</th>
                        <th class="text-right">{{formatNumber(model.center_women + model.province_women + model.district_women)}}</th>
                        <th class="text-right">{{formatNumber(model.center_total + model.province_total + model.district_total -(model.center_women + model.province_women + model.district_women))}}</th>
                    </tr>
                    <tr>
                        <th>1</th>
                        <th>ຂັ້ນກະຊວງ (ສູນກາງ)</th>
                        <th class="text-right">{{formatNumber(model.center_total)}}</th>
                        <th class="text-right">{{formatNumber(model.center_women)}}</th>
                        <th class="text-right">{{formatNumber(model.center_total- model.center_women)}}</th>
                    </tr>
                    <tr>
                        <th rowspan="3">2</th>
                        <th>ຂັ້ນທ້ອງຖິ່ນ</th>
                        <th class="text-right">{{formatNumber(model.province_total + model.district_total)}}</th>
                        <th class="text-right">{{formatNumber(model.province_women + model.district_women)}}</th>
                        <th class="text-right">{{formatNumber(model.province_total + model.district_total - (model.province_women + model.district_women))}}</th>
                    </tr>
                    <tr>
                        <td>ພະແນກການແຂວງ</td>
                        <td class="text-right">{{formatNumber(model.province_total)}}</td>
                        <td class="text-right">{{formatNumber(model.province_women)}}</td>
                        <td class="text-right">{{formatNumber(model.province_total - model.province_women)}}</td>
                    </tr>
                    <tr>
                        <td>ຫ້ອງການຂັ້ນເມືອງ</td>
                        <td class="text-right">{{formatNumber(model.district_total)}}</td>
                        <td class="text-right">{{formatNumber(model.district_women)}}</td>
                        <td class="text-right">{{formatNumber(model.district_total - model.district_women)}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer/';
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
            $scope.model.center_total = parseInt(r.data.model.center_total);
            $scope.model.center_women = parseInt(r.data.model.center_women);
            $scope.model.province_total = parseInt(r.data.model.province_total);
            $scope.model.province_women = parseInt(r.data.model.province_women);
            $scope.model.district_total = parseInt(r.data.model.district_total);
            $scope.model.district_women = parseInt(r.data.model.district_women);
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
