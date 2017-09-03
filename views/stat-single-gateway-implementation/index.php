<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Statistics of Single Gateway Implementations');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="singleGatewayController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
    </div><div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Ministry') ?></label>
                    <select class="form-control" ng-model="model.name">
                        <option value=""></option>
                        <option ng-repeat="m in ministries" value="{{m.id}}">{{m.name}}</option>
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Start Date') ?></label>
                    <input class="form-control datepicker" type="text" placeholder="Select Date" ng-model="model.start_date">
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Service Unit Name') ?></label>
                    <input type="text" class="form-control" ng-model="model.servicename">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-info col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
        <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">{{response.statusText}}</div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em">
        <div class="card" ng-show="models">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Structure') ?> ({{year.year}})</h3>
                <p class="hidden-print">
                    <a class="btn btn-default" target="_blank" href="index.php?r=stat-single-gateway-implementation/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="index.php?r=stat-single-gateway-implementation/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Ministry') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Start Date') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="model in models | orderBy:model.position:false" ng-click="select(model)" style="cursor:pointer;">
                        <td>{{$index + 1}}</td>
                        <td>{{model.name}}</td>
                        <td>{{model.start_date}}</td>
                        <td>{{model.servicename}}</td>
                        <td class="text-center">{{model.remark}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-single-gateway-implementation/';
    app.controller('singleGatewayController', function($scope, $http, $sce, $timeout) {
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.ministries = r.data.ministries;
            });

        $scope.enquiry = function() {
            $http.get(url+'enquiry&year='+$scope.year.id)
                .then(function(r) {
                    $scope.models = r.data.models;
                });
        };

        $scope.select = function(m) {
            $scope.model = m;
            $scope.model.position = parseInt(m.position);
        };

        $scope.save = function(create) {
            if($scope.model)
                if($scope.model.name)
                    $http.post(url + 'save&year='+$scope.year.id, {
                        Model: $scope.model,
                        '_csrf': $('meta[name="csrf-token"]').attr("content")
                    }).then(function(r) {
                        $scope.response = r;
                        $scope.model = null;
                        $scope.enquiry();
                        $timeout(function() {
                            $scope.response = null;
                        }, 15000);
                    });
        };
    });
</script>