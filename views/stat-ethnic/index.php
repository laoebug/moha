<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Ethnics');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statEthnicController">
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
                    <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces">
                    </select>
                </div>
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Enthnic') ?></label>
                    <select class="form-control" ng-model="model.ethnic" ng-options="e.name for e in ethnics" ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Total') ?></label>
                    <input type="number" class="form-control" ng-model="model.total" min="0">
                </div>
                <div class="col-sm-2">
                    <label class="col-sm-12" for=""><?= Yii::t('app', 'Women') ?></label>
                    <input type="number" class="form-control" ng-model="model.women" max="{{model.total}}">
                </div>
                <div class="col-sm-2">
                    <label class="col-sm-12" for="">&nbsp;</label>
                    <button class="btn btn-primary" type="button"><i class="fa fa-search"></i> <?= Yii::t('app', 'Search') ?></button>
                </div>
            </div>
        </div>
    </div>
    <div class="row" >
        <div class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
            <div class="card-title-w-btn ">
                <h3><?= Yii::t('app', 'Statistics of Ehtnics') ?></h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th><?= Yii::t('app', 'No.') ?></th>
                        <th><?= Yii::t('app', 'Province') ?></th>
                        <th ng-repeat="e in ethnics">{{e.name}}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="m in models">
                        <td>{{$index}}</td>
                        <td>{{m.province_name}}</td>
                        <td>{{m.ethnic.total}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    app.controller('statEthnicController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat-ethnic/';
        $http.get($scope.url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.provinces = r.data.provinces;
                $scope.ethnics = r.data.ethnics;
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
                    }, function(r) {
                        $scope.response = r;
                        $timeout(function () {
                            $scope.response = null;
                        }, 15000);
                    });
        };

        $scope.inquiry = function() {
            if($scope.year && $scope.model.province && $scope.model.ethnic)
                $http.get($scope.url+'inquiry&province='+$scope.model.province.id+'&year='+ $scope.year.id+'&ethnic=' + $scope.model.ethnic.id)
                    .then(function(r) {
                        if(r.data.model) {
                            $scope.model.total = parseInt(r.data.model.total);
                            $scope.model.value = parseInt(r.data.model.value);
                        } else {
                            $scope.model.total = null;
                            $scope.model.value = null;
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
                    'StatEthnic': $scope.model,
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
