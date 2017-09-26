<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatCopySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິການສັງລວມການສຳເນົາ";
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statCopy">
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
                <div class="col-sm-6">
                    <label>ເນື້ອໃນກິດຈະກຳ</label>
                    <input class="form-control" ng-model="model.activity" type="text">
                </div>
                <div class="col-sm-6 text-center">
                    <label><?= Yii::t('app', 'ໄລຍະເວລາຈັດຕັ້ງປະຕິບັດ') ?></label>
                </div>
                    <div class="col-sm-3">
                        <input class="form-control" ng-model="model.start_year" type="number" min="1900" max="{{model.end_year}}">
                    </div>
                    <div class="col-sm-3">
                        <input class="form-control" ng-model="model.end_year" type="number" min="{{model.start_year}}" max="2999">
                    </div>

                <div class="col-sm-6">
                    <label>ສັງລວມ</label>
                    <input type="text" class="form-control" ng-model="model.summary">
                </div>
                <div class="col-sm-6">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-3" style="margin-top: 1em">
                    <button type="button" class="btn btn-info col-sm-12" ng-click="add()">
                        <i class="fa fa-plus"></i> ເພີ່ມ
                    </button>
                </div>
                <div class="col-sm-3" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-3" style="margin-top: 1em">
                    <button type="button" class="btn btn-danger col-sm-12" ng-click="delete()">
                        <i class="fa fa-trash"></i> ລຶບ
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
                    <th class="text-center">ລ/ດ</th>
                    <th class="text-center">ເນື້ອໃນກິດຈະກຳ</th>
                    <th class="text-center">ໄລຍະເວລາ ຈັດຕັ້ງປະຕິບັດ</th>
                    <th class="text-center">ສັງລວມ</th>
                    <th class="text-center">ໝາຍເຫດ</th>
                </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="m in models" ng-click="select(m)" style="cursor: pointer">
                        <td class="text-center">{{$index + 1}}</td>
                        <td>{{m.activity}}</td>
                        <td class="text-center">{{m.start_year}} - {{m.end_year}}</td>
                        <td class="text-center">{{m.summary}}</td>
                        <td>{{m.remark}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statCopy', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-copy/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.model = null;
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

    $scope.select = function(m) {
        $scope.model = m;
        $scope.model.start_year = parseInt(m.start_year);
        $scope.model.end_year = parseInt(m.end_year);
    };

    $scope.add = function() {
        $scope.model.id = null;
        $scope.save();
    };

    $scope.delete = function() {
      if($scope.model)
        if($scope.model.id)
          swal({
            title: "ໝັ້ນໃຈບໍ່?",
            text: "ເມື່ອລຶບແລ້ວຈະບໍ່ສາມາດເອົາຄືນມາໄດ້",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "ແມ່ນ, ລຶບ",
            cancelButtonText: "ບໍ່, ບໍ່ລຶບ",
            closeOnConfirm: true,
            closeOnCancel: true
          }, function(isConfirm) {
            if (isConfirm) {
              $http.post($scope.url + 'delete', {
                'Model': $scope.model,
                '_csrf': $('meta[name="csrf-token"]').attr("content")
              }).then(function(r){
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
          });
    }
  });
</script>
