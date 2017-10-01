<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerDegreeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນລັດຖະກອນແຍກຕາມຊັ້ນວິຊາສະເພາະ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerDegreeController">
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
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">ປະລິນຍາເອກ</td>
                            <td class="text-center" colspan="2">ເໜືອປະລິນຍາໂທ</td>
                            <td class="text-center" colspan="2">ປະລິນຍາໂທ</td>
                            <td class="text-center" colspan="2">ເໜືອປະລິນຍາຕີ</td>
                            <td class="text-center" colspan="2">ປະລິນຍາຕີ</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i< 10; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.doctor_total"></td><td><input type="number" class="form-control" min="0" max="model.doctor_total" ng-model="model.doctor_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.post_master_total"></td><td><input type="number" class="form-control" min="0" max="model.post_master_total" ng-model="model.post_master_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.master_total"></td><td><input type="number" class="form-control" min="0" max="model.master_total" ng-model="model.master_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.post_bachelor_total"></td><td><input type="number" class="form-control" min="0" max="model.post_bachelor_total" ng-model="model.post_bachelor_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.bachelor_total"></td><td><input type="number" class="form-control" min="0" max="model.bachelor_total" ng-model="model.bachelor_women"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">ຊັ້ນສູງ</td>
                            <td class="text-center" colspan="2">ຊັ້ນກາງ</td>
                            <td class="text-center" colspan="2">ຊັ້ນຕົ້ນ</td>
                            <td class="text-center" colspan="2">ບໍ່ມີຊັ້ນ ວິຊາສະເພາະ</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i< 8; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.high_total"></td><td><input type="number" class="form-control" min="0" max="model.high_total" ng-model="model.high_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.middle_total"></td><td><input type="number" class="form-control" min="0" max="model.middle_total" ng-model="model.middle_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.begin_total"></td><td><input type="number" class="form-control" min="0" max="model.begin_total" ng-model="model.begin_women"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.no_total"></td><td><input type="number" class="form-control" min="0" max="model.no_total" ng-model="model.no_women"></td>
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
    <div ng-show="model" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card">
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
                    <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" colspan="18"><?= Yii::t('app', 'Description') ?></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="text-center" rowspan="4">IV</th>
                    <th class="" colspan="18"><?= $this->title ?></th>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">ປະລິນຍາເອກ</td>
                    <td class="text-center" colspan="2">ເໜືອປະລິນຍາໂທ</td>
                    <td class="text-center" colspan="2">ປະລິນຍາໂທ</td>
                    <td class="text-center" colspan="2">ເໜືອປະລິນຍາຕີ</td>
                    <td class="text-center" colspan="2">ປະລິນຍາຕີ</td>
                    <td class="text-center" colspan="2">ຊັ້ນສູງ</td>
                    <td class="text-center" colspan="2">ຊັ້ນກາງ</td>
                    <td class="text-center" colspan="2">ຊັ້ນຕົ້ນ</td>
                    <td class="text-center" colspan="2">ບໍ່ມີຊັ້ນ ວິຊາສະເພາະ</td>
                </tr>
                <tr>
                    <?php for ($i = 0; $i< 18; $i++): ?>
                        <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <td class="text-center">{{formatNumber(model.doctor_total  )}}</td><td class="text-center">{{formatNumber(model.doctor_women   )}}</td>
                    <td class="text-center">{{formatNumber(model.post_master_total)}}</td><td class="text-center">{{formatNumber(model.post_master_women )}}</td>
                    <td class="text-center">{{formatNumber(model.master_total)}}</td><td class="text-center">{{formatNumber(model.master_women )}}</td>
                    <td class="text-center">{{formatNumber(model.post_bachelor_total)}}</td><td class="text-center">{{formatNumber(model.post_bachelor_women )}}</td>
                    <td class="text-center">{{formatNumber(model.bachelor_total)}}</td><td class="text-center">{{formatNumber(model.bachelor_women )}}</td>
                    <td class="text-center">{{formatNumber(model.high_total)}}</td><td class="text-center">{{formatNumber(model.high_women )}}</td>
                    <td class="text-center">{{formatNumber(model.middle_total)}}</td><td class="text-center">{{formatNumber(model.middle_women )}}</td>
                    <td class="text-center">{{formatNumber(model.begin_total)}}</td><td class="text-center">{{formatNumber(model.begin_women )}}</td>
                    <td class="text-center">{{formatNumber(model.no_total)}}</td><td class="text-center">{{formatNumber(model.no_women   )}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerDegreeController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-degree/';
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
            $scope.model = r.data.model;
            if(r.data.model) {
              $scope.model.doctor_total = parseInt($scope.model.doctor_total);
              $scope.model.post_master_total = parseInt($scope.model.post_master_total);
              $scope.model.master_total = parseInt($scope.model.master_total);
              $scope.model.post_bachelor_total = parseInt($scope.model.post_bachelor_total);
              $scope.model.bachelor_total = parseInt($scope.model.bachelor_total);
              $scope.model.high_total = parseInt($scope.model.high_total);
              $scope.model.middle_total = parseInt($scope.model.middle_total);
              $scope.model.begin_total = parseInt($scope.model.begin_total);
              $scope.model.no_total = parseInt($scope.model.no_total);

              $scope.model.doctor_women = parseInt($scope.model.doctor_women);
              $scope.model.post_master_women = parseInt($scope.model.post_master_women);
              $scope.model.master_women = parseInt($scope.model.master_women);
              $scope.model.post_bachelor_women = parseInt($scope.model.post_bachelor_women);
              $scope.model.bachelor_women = parseInt($scope.model.bachelor_women);
              $scope.model.high_women = parseInt($scope.model.high_women);
              $scope.model.middle_women = parseInt($scope.model.middle_women);
              $scope.model.begin_women = parseInt($scope.model.begin_women);
              $scope.model.no_women = parseInt($scope.model.no_women );
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
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
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
