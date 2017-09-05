<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Ministries');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="ministryController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">{{response.statusText}}</div>
        </div>
    </div><div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-6">
                    <label for=""><?= Yii::t('app', 'Name') ?></label>
                    <input type="text" class="form-control" ng-model="ministry.name">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Position') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="ministry.position">
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="ministry.remark">
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-success col-sm-12" ng-click="save(1)">
                        <i class="fa fa-plus"></i> <?= Yii::t('app', 'Add') ?>
                    </button>
                </div>
                <div class="col-sm-2" ng-show="ministry">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-info col-sm-12" ng-click="save(0)">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-2" ng-show="ministry">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-danger col-sm-12" ng-click="delete(0)">
                        <i class="fa fa-trash"></i> <?= Yii::t('app', 'Delete') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em">

        <div class="card" ng-show="ministries">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Structure') ?> ({{year.year}})</h3>
                <p class="hidden-print">
                    <a class="btn btn-default" target="_blank" href="index.php?r=ministry/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="index.php?r=ministry/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="ministry in ministries | orderBy:ministry.position:false" ng-click="select(ministry)" style="cursor:pointer;">
                            <td>{{$index+1}}</td>
                            <td>{{ministry.name}}</td>
                            <td class="text-center">{{ministry.remark}}</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="2" class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center">{{ministries.length}}</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=ministry/';
    app.controller('ministryController', function($scope, $http, $sce, $timeout) {
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
            }, function(r) {
                $scope.response = r;
                $timeout(function () {
                    $scope.response = null;
                });
            });

        $scope.enquiry = function() {
            $http.get(url + 'enquiry&year=' + $scope.year.id)
                .then(function (r) {
                    $scope.ministries = r.data.ministries;
                }, function (r) {
                    $scope.response = r;
                    $timeout(function () {
                        $scope.response = null;
                    });
                });
        };

        $scope.select = function (m) {
            $scope.ministry = m;
            $scope.ministry.position = parseInt(m.position);
        };

            $scope.save = function (create) {
                if ($scope.ministry)
                    if ($scope.ministry.name)
                        $http.post(url + 'save&year=' + $scope.year.id, {
                            Ministry: $scope.ministry,
                            create: create,
                            '_csrf': $('meta[name="csrf-token"]').attr("content")
                        }).then(function (r) {
                            $scope.response = r;
                            $scope.ministry = null;
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
            };

            $scope.delete = function () {
                if ($scope.ministry)
                    $http.post(url + 'delete', {
                        Ministry: $scope.ministry,
                        '_csrf': $('meta[name="csrf-token"]').attr("content")
                    }).then(function (r) {
                        $scope.response = r;
                        $scope.ministry = null;
                        $scope.enquiry();
                        $timeout(function () {
                            $scope.response = null;

                        }, 15000);
                    }, function (r) {
                        $scope.response = r;
                        $timeout(function () {
                            $scope.response = null;
                        });
                    });
            };
        });
</script>