<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOdaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຕາຕະລາງບັນຊີໂຄງການຊ່ວຍເຫຼືອທາງການເພື່ອການພັດທະນາ (ODA)";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statContract">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()"
                    ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                            <th class="text-center" rowspan="2">ລະຫັດ</th>
                            <th class="text-center" rowspan="2" colspan="2">ໄລຍະຈັດຕັ້ງປະຕິບັດ</th>
                            <th class="text-center" rowspan="2">ມູນຄ່າລວມໂຄງການ</th>
                            <th class="text-center" colspan="2">ປະເພດການຊ່ວຍເຫຼືອ</th>
                            <th class="text-center" rowspan="2">ຊື່ອົງການຜູ້ໃຫ້ທຶນ</th>
                            <th class="text-center" rowspan="2">ງົບປະມານທີ່ໄດ້ຮັບ ປີຜ່ານມາ</th>
                        </tr>
                        <tr>
                            <th class="text-center">ຊ່ວຍລ້າ</th>
                            <th class="text-center">ກູ້ຢືມ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="text" class="form-control" ng-model="model.name">
                            </td>
                            <td style="width: 10%"><input type="text" class="form-control" ng-model="model.code">
                            </td>
                            <td style="width: 10%"><input type="number" class="form-control"
                                                          ng-model="model.start_year">
                            </td>
                            <td style="width: 10%"><input type="number" class="form-control" ng-model="model.end_year">
                            </td>
                            <td><input type="number" class="form-control" ng-model="model.amount">
                            </td>
                            <td><input style="margin: 0 auto" type="checkbox" ng-checked="model.free == 1"
                                       class="form-control" ng-model="model.free">
                            </td>
                            <td><input type="checkbox" class="form-control" ng-checked="model.loan == 1"
                                       ng-model="model.loan">
                            </td>
                            <td><input type="text" class="form-control" ng-model="model.organisation">
                            </td>
                            <td><input type="number" class="form-control" ng-model="model.receive">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-class="{disabled: !model}"
                            ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-danger col-sm-12" ng-class="{disabled: !model}"
                            ng-click="delete()">
                        <i class="fa fa-trash"></i> <?= Yii::t('app', 'Delete') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-default col-sm-12" ng-click="clear()">
                        <i class="fa fa-refresh"></i> <?= Yii::t('app', 'Cancel') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-if="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card" style="overflow-x: scroll">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="2">ລ/ດ</th>
                                <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                                <th class="text-center" rowspan="2">ລະຫັດ</th>
                                <th class="text-center" rowspan="2">ໄລຍະຈັດຕັ້ງປະຕິບັດ</th>
                                <th class="text-center" rowspan="2">ມູນຄ່າລວມໂຄງການ</th>
                                <th class="text-center" colspan="2">ປະເພດການຊ່ວຍເຫຼືອ</th>
                                <th class="text-center" rowspan="2">ຊື່ອົງການຜູ້ໃຫ້ທຶນ</th>
                                <th class="text-center" rowspan="2">ງົບປະມານທີ່ໄດ້ຮັບ ປີຜ່ານມາ</th>
                            </tr>
                            <tr>
                                <th class="text-center">ຊ່ວຍລ້າ</th>
                                <th class="text-center">ກູ້ຢືມ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models" ng-click="select(m)">
                                <td>{{$index + 1}}</td>
                                <td>{{m.name}}</td>
                                <td class="text-center">{{m.code}}</td>
                                <td class="text-center">{{m.start_year}} - {{m.end_year}}</td>
                                <td class="text-right">{{m.amount | number}}</td>
                                <td class="text-center">{{m.free ? 'P' : ''}}</td>
                                <td class="text-center">{{m.loan ? 'P' : ''}}</td>
                                <td class="text-center">{{m.organisation}}</td>
                                <td class="text-right">{{m.receive | number}}</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="2">ລວມ</th>
                                <th></th>
                                <th></th>
                                <th class="text-right">{{sumcolumn('amount') | number }}</th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th class="text-right">{{sumcolumn('receive') | number }}</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="reference">

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statContract', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-oda/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.models = r.data.models;
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.select = function (m) {
      $scope.model = m;
      $scope.model.start_year = parseInt(m.start_year);
      $scope.model.end_year = parseInt(m.end_year);
      $scope.model.amount = parseInt(m.amount);
      $scope.model.receive = parseInt(m.receive);
      $scope.model.free = parseInt(m.free);
      $scope.model.loan = parseInt(m.loan);
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $scope.response = r;
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
      }
    };

    $scope.delete = function () {
      if ($scope.model && confirm('ຕ້ອງການລຶບແທ້ບໍ່?'))
        $http.post($scope.url + 'delete&year=' + $scope.year.id, {
          'id': $scope.model.id,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $scope.response = r;
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

    $scope.clear = function () {
      $scope.model = null;
    };

    $scope.sumcolumn = function (key) {
      var s = 0;
      for (var i = 0; i < $scope.models.length; i++)
        if ($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      return s;
    };
  });
</script>