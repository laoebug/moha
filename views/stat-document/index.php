<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatDocumentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statDocument">
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
                    <label>ກະຊວງ, ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ</label>
                    <select class="form-control" ng-model="model.section" ng-change="inquiry()" ng-options="m.name for m in sections"></select>
                </div>
                <div class="col-sm-3" ng-if="model.section.code=='m'">
                    <label><?= Yii::t('app', 'Ministry') ?></label>
                    <select class="form-control" ng-model="model.ministry" ng-change="inquiry()" ng-options="m.name for m in ministries"></select>
                </div>
                <div class="col-sm-3" ng-if="model.section.code=='o'">
                    <label>ອົງການຈັດຕັ້ງ</label>
                    <select class="form-control" ng-model="model.organisation" ng-change="inquiry()" ng-options="m.name for m in organisations"></select>
                </div>
                <div class="col-sm-3" ng-if="model.section.code=='p'">
                    <label><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-change="inquiry()" ng-options="m.province_name for m in provinces"></select>
                </div>
                <div class="col-sm-3" ng-if="model.section.code=='b'">
                    <label><?= Yii::t('app', 'Book Type') ?></label>
                    <select class="form-control" ng-model="model.book" ng-change="inquiry()" ng-options="m.name for m in books"></select>
                </div>

                <div class="col-sm-12">
                    <table class="table table-bordered" style="margin-top: 1em">
                        <thead>
                            <tr>
                                <th class="text-center" rowspan="2">ປີ 1975 ຄືນຫຼັງ</th>
                                <th class="text-center" colspan="2">{{year.year}}</th>
                            </tr>
                        <tr>
                            <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                            <th class="text-center">ຂໍ້ມູນເພີ່ມໃໝ່</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input class="form-control" ng-model="model.before" type="number" min="0"></td>
                                <td><input class="form-control" ng-model="model.after" type="number" min="0"></td>
                                <td><input class="form-control" ng-model="model.after_new" type="number" min="0"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
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
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3">ເອກະສານບັນດາກະຊວງ, ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ</th>
                    <th class="text-center" rowspan="3">ຈຳນວນເອກະສານປະຫວັດສາດ 1975 ຄືນຫຼັງ</th>
                    <th class="text-center" colspan="3">ຈຳນວນເອກະສານປະຫວັດສາດ 1975 ຄືນຫຼັງ</th>
                    <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="3">ປີ {{year.year}}</th>
                </tr>
                <tr>
                    <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                    <th class="text-center">ຂໍ້ມູນທີ່ເພີ່ມຂຶ້ນໃໝ່</th>
                    <th class="text-center">ລວມທັງໝົດ</th>
                </tr>
                </thead>
                <tbody ng-repeat="model in models">
                <tr>
                    <th colspan="7" class="text-center" style="background-color: #dcd18b">{{model.name}}</th>
                </tr>
                <tr ng-repeat="m in model.details">
                    <td class="text-center">{{$index + 1}}</td>
                    <td class="text-center">{{m.name}}</td>
                    <td class="text-center">{{m.before | number}}</td>
                    <td class="text-center">{{m.after | number}}</td>
                    <td class="text-center">{{m.after_new | number}}</td>
                    <td class="text-center">{{sumrow(m) | number}}</td>
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
  app.controller('statDocument', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-document/';
    $scope.sections = [
      {'code':'m','name': 'ກະຊວງ ອົງການທຽນເທົ່າ'},
      {'code':'o','name': 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ'},
      {'code':'p','name': 'ແຂວງ'},
      {'code':'b','name': 'ປະເພດປຶ້ມ'} ];
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
        $scope.ministries = r.data.ministries;
        $scope.organisations = r.data.organisations;
        $scope.books = r.data.books;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.section = null;
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
      if($scope.model.section.code == 'm' && !$scope.model.ministry) return;
      if($scope.model.section.code == 'o' && !$scope.model.organisation) return;
      if($scope.model.section.code == 'p' && !$scope.model.province) return;
      if($scope.model.section.code == 'b' && !$scope.model.book) return;

      if($scope.year) {
        $scope.model.before       = null;
        $scope.model.after        = null;
        $scope.model.after_new    = null;
        $scope.model.remark       = null;

        var u = $scope.url+'inquiry&year='+$scope.year.id;
        if($scope.model.section.code == 'm' && $scope.model.ministry)       u += '&ministry=' + $scope.model.ministry.id;
        if($scope.model.section.code == 'o' && $scope.model.organisation)   u += '&organisation=' + $scope.model.organisation.id;
        if($scope.model.section.code == 'p' && $scope.model.province)       u += '&province=' + $scope.model.province.id;
        if($scope.model.section.code == 'b' && $scope.model.book)           u += '&book=' + $scope.model.book.id;

        $http.get(u)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.before       = parseInt(r.data.model.before);
              $scope.model.after        = parseInt(r.data.model.after);
              $scope.model.after_new    = parseInt(r.data.model.after_new);
              $scope.model.remark       = r.data.model.remark;
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

    $scope.sumrow = function(m) {
      var s = 0;
      if(m.after) s += parseInt(m.after);
      if(m.after_new) s += parseInt(m.after_new);
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
