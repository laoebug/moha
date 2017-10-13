<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerMinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຕາຕະລາງສັງລວມສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນກະຊວງ ທີ່ໄປຝຶກອົບຮົມ ຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerMinistryTrainController">
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
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label ><?= Yii::t('app', 'Ministry') ?></label>
                    <select ng-options="m.name for m in ministries" ng-model="model.ministry" ng-change="inquiry()" class="form-control"></select>
                </div>
                <br />
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center" colspan="4"><?= Yii::t('app', 'Technical Trainning') ?></th>
                                <th class="text-center" colspan="4"><?= Yii::t('app', 'Theory Trainning') ?></th>
                            </tr>
                            <tr>
                                <?php for($i=0;$i<4;$i++): ?>
                                    <th class="text-center" colspan="2"><?= Yii::t('app', $i%2==0?'Local':'Oversea') ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <?php for($i=0;$i<8;$i++): ?>
                                    <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                                <?php endfor; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_in_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_in_women" min="0" max="{{model.tech_in_total}}" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_out_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_out_women" min="0" max="{{model.tech_out_total}}" type="number"></td>

                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_in_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_in_women" min="0" max="{{model.theo_in_total}}" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_out_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_out_women" min="0" max="{{model.theo_out_total}}" type="number"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label >&nbsp;</label>
                        <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-if="models">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3><?= $this->title ?> {{year.year}}</h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="text-center" rowspan="5"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'Ministry')?></th>
                    <th class="text-center" rowspan="2" colspan="2"><?= Yii::t('app', 'Total')?></th>
                    <th class="text-center" colspan="4"><?= Yii::t('app', 'Technical Trainning')?></th>
                    <th class="text-center" colspan="4"><?= Yii::t('app', 'Theory Trainning')?></th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Local') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Oversea') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Local') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Oversea') ?></th>
                </tr>
                <tr>
                    <?php for($i=0;$i<10;$i++): ?>
                        <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                    <th class="text-center">{{formatNumber(sum('tech_in_total') + sum('tech_out_total') + sum('theo_in_total') + sum('theo_out_total'))}}</th>
                    <th class="text-center">{{formatNumber(sum('tech_in_women') + sum('tech_out_women') + sum('theo_in_women') + sum('theo_out_women'))}}</th>
                    <th class="text-center">{{formatNumber(sum('tech_in_total'))}}</th>
                    <th class="text-center">{{formatNumber(sum('tech_in_women'))}}</th>
                    <th class="text-center">{{formatNumber(sum('tech_out_total'))}}</th>
                    <th class="text-center">{{formatNumber(sum('tech_out_women'))}}</th>
                    <th class="text-center">{{formatNumber(sum('theo_in_total'))}}</th>
                    <th class="text-center">{{formatNumber(sum('theo_in_women'))}}</th>
                    <th class="text-center">{{formatNumber(sum('theo_out_total'))}}</th>
                    <th class="text-center">{{formatNumber(sum('theo_out_women'))}}</th>
                </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="m in models">
                        <td class="text-center">{{$index + 1}}</td>
                        <td class="text-center">{{m.name}}</td>
                        <td class="text-center">{{formatNumber(sumtotal(m)) | number}}</td>
                        <td class="text-center">{{formatNumber(sumwomen(m)) | number}}</td>
                        <td class="text-center">{{formatNumber(m.tech_in_total )| number}}</td>
                        <td class="text-center">{{formatNumber(m.tech_in_women )| number}}</td>
                        <td class="text-center">{{formatNumber(m.tech_out_total) | number}}</td>
                        <td class="text-center">{{formatNumber(m.tech_out_women) | number}}</td>
                        <td class="text-center">{{formatNumber(m.theo_in_total )| number}}</td>
                        <td class="text-center">{{formatNumber(m.theo_in_women )| number}}</td>
                        <td class="text-center">{{formatNumber(m.theo_out_total) | number}}</td>
                        <td class="text-center">{{formatNumber(m.theo_out_women) | number}}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="row card" ng-show="stat">
            <h3><?= $this->title ?> {{year.year}}</h3>
            <div class="col-sm-8">
                <canvas id="stat" class="chart chart-bar"
                        chart-data="stat.data"
                        chart-labels="stat.labels"
                        chart-series="stat.series"
                        chart-colors="stat.colors"
                </canvas
            </div>
        </div>
        <div class="col-sm-4">
            <canvas id="stat" class="chart chart-pie"
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
  app.controller('officerMinistryTrainController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-ministry-train/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.models=null;
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
      if($scope.year && $scope.model.ministry)
        $http.get($scope.url + 'inquiry&year='+$scope.year.id+'&ministry='+$scope.model.ministry.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.tech_in_total = parseInt(r.data.model.tech_in_total);
              $scope.model.tech_in_women = parseInt(r.data.model.tech_in_women);
              $scope.model.tech_out_total = parseInt(r.data.model.tech_out_total);
              $scope.model.tech_out_women = parseInt(r.data.model.tech_out_women);
              $scope.model.theo_in_total = parseInt(r.data.model.theo_in_total);
              $scope.model.theo_in_women = parseInt(r.data.model.theo_in_women);
              $scope.model.theo_out_total = parseInt(r.data.model.theo_out_total);
              $scope.model.theo_out_women = parseInt(r.data.model.theo_out_women);
            } else {
              $scope.model.tech_in_total =  null;
              $scope.model.tech_in_women =  null;
              $scope.model.tech_out_total = null;
              $scope.model.tech_out_women = null;
              $scope.model.theo_in_total =  null;
              $scope.model.theo_in_women =  null;
              $scope.model.theo_out_total = null;
              $scope.model.theo_out_women = null;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function() {
      if($scope.model)
        $http.post($scope.url + 'save&year='+$scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.enquiry();
          $scope.model = null;
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function(r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        })
    };

    $scope.sum = function (key) {
      var total = 0;
      if ($scope.models)
        for (var n = 0; n < $scope.models.length; n++)
          if ($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total == 0 ? null : total;
    };

    $scope.sumtotal = function(m) {
      var s = 0;
      if(m.tech_in_total) s += parseInt(m.tech_in_total);
      if(m.tech_out_total) s += parseInt(m.tech_out_total);
      if(m.theo_in_total) s += parseInt(m.theo_in_total);
      if(m.theo_out_total) s += parseInt(m.theo_out_total);
      return s == 0 ? null : s;
    };

    $scope.sumwomen = function(m) {
      var s = 0;
      if(m.tech_in_women) s += parseInt(m.tech_in_women);
      if(m.tech_out_women) s += parseInt(m.tech_out_women);
      if(m.theo_in_women) s += parseInt(m.theo_in_women);
      if(m.theo_out_women) s += parseInt(m.theo_out_women);
      return s == 0 ? null : s;
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