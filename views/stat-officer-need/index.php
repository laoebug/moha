<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerNeedSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerNeedController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()"
                    ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label><?= Yii::t('app', 'Center') ?></label>
                        <input class="form-control" ng-model="model.center" min="0" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label><?= Yii::t('app', 'Province') ?></label>
                        <input class="form-control" ng-model="model.province" min="0" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label><?= Yii::t('app', 'District') ?></label>
                        <input class="form-control" ng-model="model.district" min="0" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label>&nbsp;</label>
                        <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="model" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Description') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="text-center" rowspan="4">IX</td>
                                <td>ແຜນຄວາມຕ້ອງການລັດຖະກອນໃໝ່</td>
                                <td class="text-center">{{formatNumber(model.center + model.province+
                                    model.district)}}
                                </td>
                            </tr>
                            <tr>
                                <td>ຂັ້ນສູນກາງ</td>
                                <td class="text-center">{{formatNumber(model.center)}}</td>
                            </tr>
                            <tr>
                                <td>ຂັ້ນແຂວງ</td>
                                <td class="text-center">{{formatNumber(model.province)}}</td>
                            </tr>
                            <tr>
                                <td>ຂັ້ນເມືອງ</td>
                                <td class="text-center">{{formatNumber(model.district)}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="reference">

                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerNeedController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-need/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.model = r.data.model;
            if (r.data.model) {
              $scope.model.center = parseInt($scope.model.center);
              $scope.model.province = parseInt($scope.model.province);
              $scope.model.district = parseInt($scope.model.district);
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.response = r;
          $scope.enquiry();
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function (r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.formatNumber = function (num, dec) {
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

