<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Legal');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statLegalController">
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
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Legal Type') ?></label>
                    <select class="form-control" ng-model="model.legalType" ng-options="b.name for b in legalTypes">
                    </select>
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Legal') ?></label>
                    <select class="form-control" ng-model="model.legal" ng-options="b.name for b in model.legalType.legals"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-checkbox">
                        <label>
                            <input ng-model="model.new" type="checkbox"><span class="label-text"><?= Yii::t('app','New') ?></span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-checkbox">
                        <label>
                            <input ng-model="model.improve" type="checkbox"><span class="label-text"><?=Yii::t('app','Improve') ?></span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label for=""><?= Yii::t('app', 'Publish') ?></label>
                    <input type="text" class="form-control" ng-model="model.publish">
                </div>
                <div class="col-sm-7">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em">
        <div class="card-title-w-btn ">
            <h3><?= Yii::t('app', 'Statistics of Internal Legal') ?></h3>
            <p>
                <a class="btn btn-default" target="_blank" href="index.php?r=stat-legal/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="index.php?r=stat-legal/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
            </p>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                    <th class="text-center" style="width: 10%"><?= Yii::t('app', 'New') ?></th>
                    <th class="text-center" style="width: 10%"><?= Yii::t('app', 'Improve') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Publish') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                </tr>
            </thead>
            <tbody ng-repeat="t in models" ng-show="t.legals.length > 0">
                <tr>
                    <th colspan="6" class="text-center">{{t.name}}</th>
                </tr>
                <tr ng-repeat="l in t.legals">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{l.name}}</td>
                    <td class="text-center">{{l.new == '1' ? '1':''}}</td>
                    <td class="text-center">{{l.improve == '1' ? '1':''}}</td>
                    <td class="text-center">{{l.publish}}</td>
                    <td class="text-center">{{l.remark}}</td>
                </tr>
                <tr ng-show="t.legals.length > 0">
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <th class="text-center">{{sum(t, 'new')}}</th>
                    <th class="text-center">{{sum(t, 'improve')}}</th>
                    <th></th>
                    <th></th>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-legal/';
    app.controller('statLegalController', function($scope, $http, $sce, $timeout) {
      $scope.sum = [];
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.legalTypes = r.data.legalTypes;
            }, function(r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });

        $scope.enquiry = function() {
          $scope.model=null;
            if($scope.year)
                $http.get(url + 'enquiry&year='+$scope.year.id)
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
            if($scope.year && $scope.model.legal)
                $http.get(url+'inquiry&legal='+$scope.model.legal.id+'&year='+ $scope.year.id)
                    .then(function(r) {
                      if(r.data.model) {
                        $scope.model.new = r.data.model.new=="1"?true:false;
                        $scope.model.improve = r.data.model.improve=="1"?true:false;
                        $scope.model.publish = r.data.model.publish;
                        $scope.model.remark = r.data.model.remark;
                      } else {
                        $scope.model.new = null;
                        $scope.model.improve = null;
                        $scope.model.publish = null;
                        $scope.model.remark = null;
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
              $scope.model.new = $scope.model.new?1:0;
              $scope.model.improve = $scope.model.improve?1:0;
              $http.post(url+'save&year='+$scope.year.id, {
                'StatLegalDetail': $scope.model,
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
                console.log($scope.response);
                $timeout(function () {
                  $scope.response = null;
                }, 15000);
              });
            }
        };

        $scope.sum = function(t, key) {
          var total = 0;
          for(var n = 0; n < t.legals.length; n++)
            total += parseInt(t.legals[n][key]);
          return total;
        };

        $scope.getIcon = function(value) {
          if(value == '1') return '<i class="fa fa-check"></i>';
          return '';
        }
    });
</script>