<?php

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statCourseController">
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
        <div class="panel panel-primary" style="margin-top: 2em">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-6">
                    <label for="">ຊື່ຫຼັກສູດ</label>
                    <input type="text" class="form-control" ng-model="model.name">
                </div>
                <div class="col-sm-3">
                    <label for="">ຕຳແໜ່ງ</label>
                    <input type="number" min="0" class="form-control" ng-model="model.position">
                </div>
                <div class="col-sm-6">
                    <label for="">ກຸ່ມຫຼັກສູດ</label>
                    <select class="form-control" ng-model="model.parent" ng-options="g.name for g in parents"></select>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <button type="button" ng-if="model" class="btn btn-danger col-sm-12" ng-click="delete()">
                        <i class="fa fa-trash"></i> ລຶບ
                    </button>
                </div>
                <div class="col-sm-2" ng-if="model">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-default col-sm-12" ng-click="clear()">
                        <i class="fa fa-refresh"></i> ເລີມໃໝ່
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em" ng-if="models">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center" style="width: 15%;"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center">ຈຳນວນຫຼັກສູດຕ່າງໆ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat-start="m in models" ng-click="select(m)">
                                <th class="text-center">{{romans[$index]}}</th>
                                <th>{{m.name}}</th>
                            </tr>
                            <tr ng-repeat-start="c in m.childs" ng-click="select(c)">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{c.name}}</td>
                            </tr>
                            <tr ng-repeat-end>{{m.childs}}</tr>
                            <tr ng-repeat-end ng-hide="true"></tr>
                            </tbody>
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
  app.controller('statCourseController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-course/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $scope.romans = [
      'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV'
    ];

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
      $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function (r) {
          $scope.models = r.data.models;
          $scope.parents = r.data.parents;
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

    $scope.select = function (k) {
      $scope.model = k;
      if ($scope.model.position)
        $scope.model.position = parseInt($scope.model.position);
      if ($scope.model.parent_id)
        $scope.model.parent_id = parseInt($scope.model.parent_id);

      for (var i = 0; i < $scope.models.length; i++) {
        if (parseInt($scope.models[i].id) == parseInt(k.parent_id)) {
          $scope.model.parent = $scope.models[i];
          break;
        }
        for (var j = 0; j < $scope.models[i].childs.length; i++) {
          if (parseInt($scope.models[i].childs[j].id) == parseInt(k.parent_id)) {
            $scope.model.parent = $scope.models[i].childs[j];
            break;
          }
        }
      }
    };

    $scope.save = function () {
      if ($scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.response = r;
          $scope.enquiry();
          $scope.model = null;
        }, function (r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.delete = function () {
      if ($scope.model && confirm('ທ່ານຕ້ອງການລຶບແທ້ບໍ່?'))
        $http.post($scope.url + 'delete&=' + $scope.year.id, {
          'id': $scope.model.id,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.response = r;
          $scope.enquiry();
        }, function (r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
    };
  });
</script>