<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerAgeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerAgeController">
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
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">< 25</td>
                            <td class="text-center" colspan="2">25 - 30</td>
                            <td class="text-center" colspan="2">31 - 35</td>
                            <td class="text-center" colspan="2">36 - 40</td>
                            <td class="text-center" colspan="2">41 - 45</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i< 10; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_u25"  ></td><td><input type="number" class="form-control" min="0" max="model.total_u25" ng-model="model.women_u25"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_25_30"></td><td><input type="number" class="form-control" min="0" max="model.total_25_30" ng-model="model.women_25_30"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_31_35"></td><td><input type="number" class="form-control" min="0" max="model.total_31_35" ng-model="model.women_31_35"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_36_40"></td><td><input type="number" class="form-control" min="0" max="model.total_36_40" ng-model="model.women_36_40"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_41_45"></td><td><input type="number" class="form-control" min="0" max="model.total_41_45" ng-model="model.women_41_45"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">46 - 50</td>
                            <td class="text-center" colspan="2">51 - 55</td>
                            <td class="text-center" colspan="2">56 - 60</td>
                            <td class="text-center" colspan="2">61 +</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i< 8; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_46_50"></td><td><input type="number" class="form-control" min="0" max="model.total_46_50" ng-model="model.women_46_50"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_51_55"></td><td><input type="number" class="form-control" min="0" max="model.total_51_55" ng-model="model.women_51_55"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_56_60"></td><td><input type="number" class="form-control" min="0" max="model.total_56_60" ng-model="model.women_56_60"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_61u"  ></td><td><input type="number" class="form-control" min="0" max="model.total_61u" ng-model="model.women_61u"></td>
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
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" colspan="18" rowspan="2"><?= Yii::t('app', 'Description') ?></th>
                    <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Men') ?></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th rowspan="4">III</th>
                    <th class="text-center" colspan="18"><?= $this->title ?></th>
                    <th class="text-center">
                        {{model.total_u25+ model.total_25_30+ model.total_31_35+ model.total_36_40+ model.total_41_45+ model.total_46_50+ model.total_51_55+ model.total_56_60+ model.total_61u}}
                    </th>
                    <th class="text-center">
                        {{model.women_u25+ model.women_25_30+ model.women_31_35+ model.women_36_40+ model.women_41_45+ model.women_46_50+ model.women_51_55+ model.women_56_60+ model.women_61u}}
                    </th>
                    <th class="text-center">
                        {{model.total_u25+ model.total_25_30+ model.total_31_35+ model.total_36_40+ model.total_41_45+ model.total_46_50+ model.total_51_55+ model.total_56_60+ model.total_61u- (model.women_u25+ model.women_25_30+ model.women_31_35+ model.women_36_40+ model.women_41_45+ model.women_46_50+ model.women_51_55+ model.women_56_60+ model.women_61u)}}
                    </th>
                </tr>
                <tr>
                    <td class="text-center" colspan="2">< 25</td>
                    <td class="text-center" colspan="2">25 - 30</td>
                    <td class="text-center" colspan="2">31 - 35</td>
                    <td class="text-center" colspan="2">36 - 40</td>
                    <td class="text-center" colspan="2">41 - 45</td>
                    <td class="text-center" colspan="2">46 - 50</td>
                    <td class="text-center" colspan="2">51 - 55</td>
                    <td class="text-center" colspan="2">56 - 60</td>
                    <td class="text-center" colspan="2">61 +</td>
                    <td colspan="3" rowspan="3"></td>
                </tr>
                <tr>
                    <?php for ($i = 0; $i< 18; $i++): ?>
                        <td class="text-center"><?= Yii::t('app', $i%2==0?'T':'W') ?></td>
                    <?php endfor; ?>
                </tr>
                <tr>
                    <td class="text-center">{{model.total_u25  }}</td><td>{{model.women_u25   }}</td>
                    <td class="text-center">{{model.total_25_30}}</td><td>{{model.women_25_30 }}</td>
                    <td class="text-center">{{model.total_31_35}}</td><td>{{model.women_31_35 }}</td>
                    <td class="text-center">{{model.total_36_40}}</td><td>{{model.women_36_40 }}</td>
                    <td class="text-center">{{model.total_41_45}}</td><td>{{model.women_41_45 }}</td>
                    <td class="text-center">{{model.total_46_50}}</td><td>{{model.women_46_50 }}</td>
                    <td class="text-center">{{model.total_51_55}}</td><td>{{model.women_51_55 }}</td>
                    <td class="text-center">{{model.total_56_60}}</td><td>{{model.women_56_60 }}</td>
                    <td class="text-center">{{model.total_61u  }}</td><td>{{model.women_61u   }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerAgeController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-age/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
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
              $scope.model.total_u25 = parseInt($scope.model.total_u25);
              $scope.model.total_25_30 = parseInt($scope.model.total_25_30);
              $scope.model.total_31_35 = parseInt($scope.model.total_31_35);
              $scope.model.total_36_40 = parseInt($scope.model.total_36_40);
              $scope.model.total_41_45 = parseInt($scope.model.total_41_45);
              $scope.model.total_46_50 = parseInt($scope.model.total_46_50);
              $scope.model.total_51_55 = parseInt($scope.model.total_51_55);
              $scope.model.total_56_60 = parseInt($scope.model.total_56_60);
              $scope.model.total_61u = parseInt($scope.model.total_61u);

              $scope.model.women_u25   = parseInt($scope.model.women_u25);
              $scope.model.women_25_30 = parseInt($scope.model.women_25_30);
              $scope.model.women_31_35 = parseInt($scope.model.women_31_35);
              $scope.model.women_36_40 = parseInt($scope.model.women_36_40);
              $scope.model.women_41_45 = parseInt($scope.model.women_41_45);
              $scope.model.women_46_50 = parseInt($scope.model.women_46_50);
              $scope.model.women_51_55 = parseInt($scope.model.women_51_55);
              $scope.model.women_56_60 = parseInt($scope.model.women_56_60);
              $scope.model.women_61u   = parseInt($scope.model.women_61u);
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
