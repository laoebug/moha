<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionPlaceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Religion Places');
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="rerigionPlaceController">
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
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="4"><?=Yii::t('app', 'Buddhism') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Christ') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="4"><?=Yii::t('app', 'Temple') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'News') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'No Monk') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Sim')?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'No Sim') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Not') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.buddhis_total"></td>
                            <td class="text-center"><input max="{{model.buddhis_total - model.buddhis_sim - model.buddhis_nosim}}"
                                        min="0" type="number" class="form-control" ng-model="model.buddhis_nomonk"></td>
                            <td class="text-center"><input max="{{model.buddhis_total - model.buddhis_nomonk - model.buddhis_nosim}}"
                                        min="0" type="number" class="form-control" ng-model="model.buddhis_sim"></td>
                            <td class="text-center"><input max="{{model.buddhis_total - model.buddhis_nomonk - model.buddhis_sim}}"
                                        min="0" type="number" class="form-control" ng-model="model.buddhis_nosim"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.christ_news_total"></td>
                            <td class="text-center"><input min="0" max="{{model.christ_news_total}}" type="number" class="form-control" ng-model="model.christ_news_not"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="4"><?=Yii::t('app', 'Christian') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Bahaiy') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Idslam') ?></td>
                            <td class="text-center" rowspan="3"><?=Yii::t('app', 'Remark') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Saturday') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Catolic') ?></td>
                            <td class="text-center" colspan="2">ທຳມະສະພາ</td>
                            <td class="text-center" colspan="2">ສຸເຫຼົ່າ ຫຼື ມັດສະຍິດ</td>
                        </tr>
                        <tr>
                            <?php for ($i=0;$i<8;$i++): ?>
                            <td style="width: 10%" class="text-center"><?=Yii::t('app', $i%2==0?'T':'N') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <input ng-model="model.christ_sat_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_sat_not" class="form-control" min="0" max="{{model.christ_sat_total}}" type="number"
                                       ng-blur="model.christ_sat_not = model.christ_sat_total < model.christ_sat_not ? null : model.christ_sat_not">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_cato_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_cato_not" class="form-control" min="0" max="{{model.christ_cato_total}}" type="number"
                                       ng-blur="model.christ_cato_not = model.christ_cato_total < model.christ_cato_not ? null : model.christ_cato_not">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.bahai_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.bahai_not" class="form-control" min="0" max="{{model.bahai_total}}" type="number"
                                       ng-blur="model.bahai_not = model.bahai_total < model.bahai_not ? null : model.bahai_not">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_not" class="form-control" min="0" max="{{model.idslam_total}}" type="number"
                                       ng-blur="model.idslam_not = model.idslam_total < model.idslam_not ? null : model.idslam_not">
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
                <h3><?= Yii::t('app', 'Statistics of Religion Place') ?> {{year.year}}</h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered table-hover" ng-show="models">
                <thead>
                <tr>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" colspan="4"><?= Yii::t('app', 'Buddhism') ?></th>
                    <th class="text-center" colspan="6"><?= Yii::t('app', 'Christian') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Bahaiy') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Idslam') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></th>
                </tr>
                <tr>
                    <th class="text-center" colspan="4"><?= Yii::t('app', 'Temple') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'News') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Saturday') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Catolic') ?></th>
                    <th class="text-center" colspan="2">ທຳມະສະພາ</th>
                    <th class="text-center" colspan="2">ສຸເຫຼົ່າ ຫຼື ມັດສະຍິດ</th>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'No Monk') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Sim') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'No Sim') ?></th>
                    <?php for ($i=0; $i<10; $i++): ?>
                    <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'N') ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th style="width: 10%" class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_nomonk') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_sim') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('buddhis_nosim') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_news_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_news_not') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_sat_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_sat_not') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_cato_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('christ_cato_not') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('bahai_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('bahai_not') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('idslam_total') | number}}</th>
                    <th style="width: 10%" class="text-center">{{sum('idslam_not') | number}}</th>
                    <th style="width: 10%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="m in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{m.province_name}}</td>
                    <td class="text-center">{{m.buddhis_total | number}}</td>
                    <td class="text-center">{{m.buddhis_nomonk | number}}</td>
                    <td class="text-center">{{m.buddhis_sim | number}}</td>
                    <td class="text-center">{{m.buddhis_nosim | number}}</td>
                    <td class="text-center">{{m.christ_news_total | number}}</td>
                    <td class="text-center">{{m.christ_news_not | number}}</td>
                    <td class="text-center">{{m.christ_sat_total | number}}</td>
                    <td class="text-center">{{m.christ_sat_not | number}}</td>
                    <td class="text-center">{{m.christ_cato_total | number}}</td>
                    <td class="text-center">{{m.christ_cato_not | number}}</td>
                    <td class="text-center">{{m.bahai_total | number}}</td>
                    <td class="text-center">{{m.bahai_not | number}}</td>
                    <td class="text-center">{{m.idslam_total | number}}</td>
                    <td class="text-center">{{m.idslam_not | number}}</td>
                    <td class="text-center">{{m.remark}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div ng-show="stat" class="col-sm-12">
        <div class="card">
            <h3><?= Yii::t('app', 'The Chart of Religions Places') ?> {{year.year}}</h3>
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
  app.controller('rerigionPlaceController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-religion-place/';
    $scope.sum = [];
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
      $scope.model=null;
      if($scope.year)
        $http.get($scope.url + 'enquiry&year='+$scope.year.id)
          .then(function(r) {
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.stat.colors = ['#FF0000', '#0000FF', '#00FF00', '#FFFF00'];
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function() {
      if($scope.year && $scope.model.province)
        $http.get($scope.url+'inquiry&province='+$scope.model.province.id+'&year='+ $scope.year.id)
          .then(function(r) {
            var p = $scope.model.province;
            if(r.data.model) {
              $scope.model.buddhis_total           = parseInt(r.data.model.buddhis_total);
              $scope.model.buddhis_nomonk         = parseInt(r.data.model.buddhis_nomonk);
              $scope.model.buddhis_sim            = parseInt(r.data.model.buddhis_sim);
              $scope.model.buddhis_nosim            = parseInt(r.data.model.buddhis_nosim);
              $scope.model.christ_news_total      = parseInt(r.data.model.christ_news_total);
              $scope.model.christ_news_not      = parseInt(r.data.model.christ_news_not);
              $scope.model.christ_sat_total       = parseInt(r.data.model.christ_sat_total);
              $scope.model.christ_sat_not       = parseInt(r.data.model.christ_sat_not);
              $scope.model.christ_cato_total      = parseInt(r.data.model.christ_cato_total);
              $scope.model.christ_cato_not      = parseInt(r.data.model.christ_cato_not);
              $scope.model.bahai_total            = parseInt(r.data.model.bahai_total);
              $scope.model.bahai_not            = parseInt(r.data.model.bahai_not);
              $scope.model.idslam_total           = parseInt(r.data.model.idslam_total);
              $scope.model.idslam_not           = parseInt(r.data.model.idslam_not);
              $scope.model.remark                 = r.data.model.remark;
            } else {
              $scope.model.buddhis_total          = null;
              $scope.model.buddhis_nomonk         = null;
              $scope.model.buddhis_sim            = null;
              $scope.model.buddhis_nosim          = null;
              $scope.model.christ_news_total      = null;
              $scope.model.christ_news_not        = null;
              $scope.model.christ_sat_total       = null;
              $scope.model.christ_sat_not       = null;
              $scope.model.christ_cato_total      = null;
              $scope.model.christ_cato_not      = null;
              $scope.model.bahai_total            = null;
              $scope.model.bahai_not            = null;
              $scope.model.idslam_total           = null;
              $scope.model.idslam_not           = null;
              $scope.model.remark                 = null;
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
        console.log($scope.model);
        $http.post($scope.url+'save&year='+$scope.year.id, {
          'StatReligionPlaceDetail': $scope.model,
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

    $scope.sum = function(key) {
      var total = 0;
      if($scope.models)
        for(var n = 0; n < $scope.models.length; n++)
          if($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total == 0 ? null:total;
    };
  });
</script>
