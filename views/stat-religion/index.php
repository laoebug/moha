<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິປະຊາຊົນເຊື່ອຖື ສາສະໜາ ແລະ ຄວາມເຊື່ອອື່ນ ໃນທົ່ວປະເທດ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statReligionController">
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
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province"
                            ng-options="b.province_name for b in provinces"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <tr>
                            <th class="text-center" colspan="2" rowspan="2">ສາສະໜາພຸດ</th>
                            <th class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2">ຂ່າວປະເສີດ</th>
                            <th class="text-center" colspan="2">ວັນເສົາ</th>
                            <th class="text-center" colspan="2">ກາໂທລິກ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <th class="text-center" style="width: 12.5%">
                                    <?= Yii::t('app', $i % 2 == 0 ? 'Total' : 'Women') ?>
                                </th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <input min="0" type="number" class="form-control" ng-model="model.buddhis_total">
                            </td>
                            <td class="text-center">
                                <input max="{{model.buddhis_total}}" type="number"
                                                           ng-blur="model.buddhis_women = model.buddhis_total < model.buddhis_women ? null: model.buddhis_women"
                                                           class="form-control" ng-model="model.buddhis_women">
                            </td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.christ_news_total"></td>
                            <td class="text-center"><input max="{{model.christ_news_total}}" type="number"
                                                           ng-blur="model.christ_news_women = model.christ_news_total < model.christ_news_women ? null: model.christ_news_women"
                                                           class="form-control" ng-model="model.christ_news_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.christ_sat_total"></td>
                            <td class="text-center"><input max="{{model.christ_sat_total}}" type="number"
                                                           ng-blur="model.christ_sat_women = model.christ_sat_total < model.christ_sat_women ? null: model.christ_sat_women"
                                                           class="form-control" ng-model="model.christ_sat_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.christ_cato_total"></td>
                            <td class="text-center"><input max="{{model.christ_cato_total}}" type="number"
                                                           ng-blur="model.christ_cato_women = model.christ_cato_total < model.christ_cato_women ? null: model.christ_cato_women"
                                                           class="form-control" ng-model="model.christ_cato_women"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <th class="text-center" colspan="2">ສາສະໜາບາຮາຍ</th>
                            <th class="text-center" colspan="2">ສາສະໜາອິດສະລາມ</th>
                            <th class="text-center" colspan="2">ຄວາມເຊື່ອອື່ນ</th>
                            <th class="text-center" rowspan="2" style="width: 12.5%"><?= Yii::t('app', 'Remark') ?></th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 6; $i++): ?>
                                <th class="text-center" style="width: 12.5%"><?= Yii::t('app', $i % 2 == 0 ? 'Total' : 'Women') ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <input ng-model="model.bahai_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.bahai_women" class="form-control" min="0"
                                       max="{{model.bahai_total}}" type="number"
                                       ng-blur="model.bahai_women = model.bahai_total < model.bahai_women ? null : model.bahai_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_women" class="form-control" min="0"
                                       max="{{model.idslam_total}}" type="number"
                                       ng-blur="model.idslam_women = model.idslam_total < model.idslam_women ? null : model.idslam_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.other_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.other_women" class="form-control" min="0"
                                       max="{{model.other_total}}" type="number"
                                       ng-blur="model.other_women = model.other_total < model.other_women ? null : model.other_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.remark" class="form-control" type="text">
                            </td>
                        </tr>
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
    <div ng-show="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3><?= $this->title ?></h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered table-hover" ng-show="models">
                <thead>
                <tr>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" colspan="2" rowspan="2">ສາສະໜາພຸດ</th>
                    <th class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</th>
                    <th class="text-center" colspan="2" rowspan="2">ສາສະໜາບາຮາຍ</th>
                    <th class="text-center" colspan="2" rowspan="2">ສາສະໜາອິດສະລາມ</th>
                    <th class="text-center" colspan="2" rowspan="2">ຄວາມເຊື່ອອື່ນ</th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2">ຂ່າວປະເສີດ</th>
                    <th class="text-center" colspan="2">ວັນເສົາ</th>
                    <th class="text-center" colspan="2">ກາໂທລິກ</th>
                </tr>
                <tr>
                    <?php for ($i = 0; $i < 14; $i++): ?>
                        <td class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'Total' : 'Women') ?></td>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th style="width: 10%" class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_news_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_news_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_sat_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_sat_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_cato_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_cato_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('bahai_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('bahai_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('idslam_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('idslam_women') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('other_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('other_women') | number}}</th>
                    <th style="width: 10%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{m.province_name}}</td>
                    <td class="text-center">{{m.buddhis_total | number}}</td>
                    <td class="text-center">{{m.buddhis_women | number}}</td>
                    <td class="text-center">{{m.christ_news_total | number}}</td>
                    <td class="text-center">{{m.christ_news_women | number}}</td>
                    <td class="text-center">{{m.christ_sat_total | number}}</td>
                    <td class="text-center">{{m.christ_sat_women | number}}</td>
                    <td class="text-center">{{m.christ_cato_total | number}}</td>
                    <td class="text-center">{{m.christ_cato_women | number}}</td>
                    <td class="text-center">{{m.bahai_total | number}}</td>
                    <td class="text-center">{{m.bahai_women | number}}</td>
                    <td class="text-center">{{m.idslam_total | number}}</td>
                    <td class="text-center">{{m.idslam_women | number}}</td>
                    <td class="text-center">{{m.other_total | number}}</td>
                    <td class="text-center">{{m.other_women | number}}</td>
                    <td class="text-center">{{m.remark}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div ng-show="stat" class="col-sm-12">
        <div class="card">
            <h3><?= $this->title ?></h3>
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
  app.controller('statReligionController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-religion/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
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
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.stat.colors = ['#FF0000', '#0000FF', '#00FF00', '#FFFF00', '#00FFFF'];
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function () {
      if ($scope.year && $scope.model.province)
        $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year.id)
          .then(function (r) {
            var p = $scope.model.province;
            if (r.data.model) {
              $scope.model.buddhis_total = parseInt(r.data.model.buddhis_total);
              $scope.model.buddhis_women = parseInt(r.data.model.buddhis_women);
              $scope.model.christ_news_total = parseInt(r.data.model.christ_news_total);
              $scope.model.christ_news_women = parseInt(r.data.model.christ_news_women);
              $scope.model.christ_sat_total = parseInt(r.data.model.christ_sat_total);
              $scope.model.christ_sat_women = parseInt(r.data.model.christ_sat_women);
              $scope.model.christ_cato_total = parseInt(r.data.model.christ_cato_total);
              $scope.model.christ_cato_women = parseInt(r.data.model.christ_cato_women);
              $scope.model.bahai_total = parseInt(r.data.model.bahai_total);
              $scope.model.bahai_women = parseInt(r.data.model.bahai_women);
              $scope.model.idslam_total = parseInt(r.data.model.idslam_total);
              $scope.model.idslam_women = parseInt(r.data.model.idslam_women);
              $scope.model.other_total = parseInt(r.data.model.other_total);
              $scope.model.other_women = parseInt(r.data.model.other_women);
              $scope.model.remark = r.data.model.remark;
            } else {
              $scope.model.buddhis_total = null;
              $scope.model.buddhis_women = null;
              $scope.model.christ_news_total = null;
              $scope.model.christ_news_women = null;
              $scope.model.christ_sat_total = null;
              $scope.model.christ_sat_women = null;
              $scope.model.christ_cato_total = null;
              $scope.model.christ_cato_women = null;
              $scope.model.bahai_total = null;
              $scope.model.bahai_women = null;
              $scope.model.idslam_total = null;
              $scope.model.idslam_women = null;
              $scope.model.other_total = null;
              $scope.model.other_women = null;
              $scope.model.remark = null;
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
          'StatReligionDetail': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
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

    $scope.sum = function (key) {
      var total = 0;
      if ($scope.models)
        for (var n = 0; n < $scope.models.length; n++)
          if ($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total == 0 ? null : total;
    };
  });
</script>
