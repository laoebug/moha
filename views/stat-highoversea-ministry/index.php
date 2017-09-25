<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatHighoverseaMinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Goverment Coin Ministries');
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statHighoverseaMinistry">
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
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Ministry') ?></label>
                    <select class="form-control" ng-model="model.ministry" ng-change="inquiry()" ng-options="m.name for m in ministries"></select>
                </div>
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Award') ?></label>
                    <select class="form-control" ng-model="model.award" ng-change="inquiry()" ng-options="a.name for a in awards"></select>
                </div>
                <div class="col-sm-6">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-12" style="margin-top: 1em">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <?php foreach($labels as $label): ?>
                                <th class="text-center" colspan="2"><?= $label ?></th>
                            <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<6;$i++): ?>
                            <th class="text-center"><?= $i%2==0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.gold_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.gold_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.lanx_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.lanx_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.hono_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.hono_team"        min="0"></td>
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
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="2">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                    <th class="text-center" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                    <?php foreach ($labels as $label): ?>
                        <th class="text-center" colspan="2"><?= $label ?></th>
                    <?php endforeach; ?>
                    <th class="text-center" colspan="2">ລວມ</th>
                    <th class="text-center" rowspan="2">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <?php for ($i=0;$i<count($labels)*2 + 2;$i++):?>
                        <th class="text-center"><?= $i%2 == 0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="text-center" colspan="3">ລວມ</th>
                    <td class="text-center">{{sumcolumn('gold_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('gold_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('lanx_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('lanx_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('hono_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('hono_team')     | number }} </td>
                    <td class="text-center">{{sumtotal('personal')         | number }}</td>
                    <td class="text-center">{{sumtotal('team')             | number }}</td>
                    <td class="text-center"></td>
                </tr>
                <tr ng-repeat="model in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td class="text-center">{{model.ministry}}</td>
                    <td class="text-center">{{model.award}}</td>
                    <td class="text-center">{{model.gold_personal| number }} </td>
                    <td class="text-center">{{model.gold_team    | number }} </td>
                    <td class="text-center">{{model.lanx_personal| number }} </td>
                    <td class="text-center">{{model.lanx_team    | number }} </td>
                    <td class="text-center">{{model.hono_personal| number }} </td>
                    <td class="text-center">{{model.hono_team    | number }} </td>

                    <td class="text-center">{{sumrow($index, 'personal') | number }}</td>
                    <td class="text-center">{{sumrow($index, 'team')      | number }}</td>

                    <td class="text-center">{{model.remark}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statHighoverseaMinistry', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-highoversea-ministry/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
        $scope.awards = r.data.awards;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.models = null;
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
      if($scope.model.ministry && $scope.model.award) {
        $http.get($scope.url + 'inquiry&year='+$scope.year.id + '&ministry='+$scope.model.ministry.id+'&award='+$scope.model.award.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.gold_personal  = parseInt(r.data.model.gold_personal);
              $scope.model.gold_team      = parseInt(r.data.model.gold_team);
              $scope.model.lanx_personal  = parseInt(r.data.model.lanx_personal);
              $scope.model.lanx_team      = parseInt(r.data.model.lanx_team);
              $scope.model.hono_personal  = parseInt(r.data.model.hono_personal);
              $scope.model.hono_team      = parseInt(r.data.model.hono_team);
              $scope.model.remark         = r.data.model.remark;
            } else {
              $scope.model.gold_personal  = null;
              $scope.model.gold_team      = null;
              $scope.model.lanx_personal  = null;
              $scope.model.lanx_team      = null;
              $scope.model.hono_personal  = null;
              $scope.model.hono_team      = null;
              $scope.model.remark         = null;
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
      for(var i = 0;i < $scope.models.length; i++) {
        if($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      }
      return s;
    };

    $scope.sumrow = function(index, key) {
        var s = 0;
        var model = $scope.models[index];
        if(key == 'personal') {
          if(model.gold_personal) s += parseInt(model.gold_personal);
          if(model.lanx_personal) s += parseInt(model.lanx_personal);
          if(model.hono_personal) s += parseInt(model.hono_personal);
        } else if(key == 'team') {
            if(model.gold_team    ) s += parseInt(model.gold_team);
            if(model.lanx_team    ) s += parseInt(model.lanx_team);
            if(model.hono_team    ) s += parseInt(model.hono_team);
          }
        return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'personal')
        s += $scope.sumcolumn('gold_personal') + $scope.sumcolumn('lanx_personal') + $scope.sumcolumn('hono_personal');

      else if(key == 'team')
        s += $scope.sumcolumn('gold_team') + $scope.sumcolumn('lanx_team') + $scope.sumcolumn('hono_team');

      return s;
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
