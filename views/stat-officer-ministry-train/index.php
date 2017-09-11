<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerMinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Officer Ministries');
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
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-3">
                    <label ><?= Yii::t('app', 'Ministry') ?></label>
                    <select ng-options="m.name for m in ministries" ng-model="model.ministry" ng-change="inquiry()" class="form-control"></select>
                </div>
                <br />
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th colspan="4"><?= Yii::t('app', 'Technical Trainning') ?></th>
                                <th colspan="4"><?= Yii::t('app', 'Theory Trainning') ?></th>
                            </tr>
                            <tr>
                                <?php for($i=0;$i<4;$i++): ?>
                                    <th colspan="2"><?= Yii::t('app', $i%2==0?'Local':'Oversea') ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <?php for($i=0;$i<8;$i++): ?>
                                    <th><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                                <?php endfor; ?>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_in_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_in_women" min="0" max="{{model.tech_in_total}}" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_out_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.tech_out_women" min="0" max="{{model.tech_in_total}}" type="number"></td>

                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_in_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_in_women" min="0" max="{{model.tech_in_total}}" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_out_total" min="0" type="number"></td>
                                <td style="width: 12.5%"><input class="form-control" ng-model="model.theo_out_women" min="0" max="{{model.tech_in_total}}" type="number"></td>
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
            <h3><?= $this->title ?> {{year.year}}</h3>
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
                    <?php for($i=0;$i=8;$i++): ?>
                        <th class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></th>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <th><?= Yii::t('app', 'Total') ?></th>
                    <th>{{formatNumber(sum('tech_in_total') + sum('tech_out_total') + sum('theo_in_total') + sum('theo_out_total'))}}</th>
                    <th>{{formatNumber(sum('tech_in_women') + sum('tech_out_women') + sum('theo_in_women') + sum('theo_out_women'))}}</th>

                    <th>{{formatNumber(sum('tech_in_total'))}}</th>
                    <th>{{formatNumber(sum('tech_in_women'))}}</th>
                    <th>{{formatNumber(sum('tech_out_total'))}}</th>
                    <th>{{formatNumber(sum('tech_out_women'))}}</th>

                    <th>{{formatNumber(sum('theo_in_total'))}}</th>
                    <th>{{formatNumber(sum('theo_in_women'))}}</th>
                    <th>{{formatNumber(sum('theo_out_total'))}}</th>
                    <th>{{formatNumber(sum('theo_out_women'))}}</th>
                </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="m in models">
                        <td>{{$index}}</td>
                        <td>{{m.name}}</td>
                        <td>{{formatNumber(m.tech_in_total)}}</td>
                        <td>{{formatNumber(m.tech_in_total)}}</td>
                    </tr>
                </tbody>
            </table>
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
            $scope.stat.colors = ['#0000FF', '#FF0000'];
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
              $scope.model.total = parseInt(r.data.model.total);
              $scope.model.women = parseInt(r.data.model.women);
            } else {
              $scope.model.total = null;
              $scope.model.women = null;
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
          $scope.model = null;
          $scope.enquiry();
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

    $scope.enquiry();
  });
</script>