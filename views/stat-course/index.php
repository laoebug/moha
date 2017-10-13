<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Statistics of Officer Training Course Development');
$this->params['breadcrumbs'][] = "";
?>
<div class="row" ng-app="mohaApp" ng-controller="statCourseController">
    <div class="col-sm-12">
        <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
            {{response.statusText}}
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-6">
                    <label for=""><?= Yii::t('app', 'Course') ?></label>
                    <input type="text" class="form-control" ng-model="model.name">
                </div>
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Position') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="model.position">
                </div>
                <div class="col-sm-3">
                    <label for="">&nbsp;</label>
                    <div class="animated-checkbox">
                        <label>
                            <input type="checkbox" ng-model="model.deleted"><span class="label-text"><?= Yii::t('app', 'Delete') ?></span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <label for=""><?= Yii::t('app', 'Parent') ?></label>
                    <select class="form-control" ng-model="model.name" ng-options="g.name for g in models"></select>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
<!--    <div class="col-sm-12" style="margin-top: 2em" ng-bind-html="result"></div>-->
    <div class="col-sm-12" style="margin-top: 2em" ng-if="models">
        <div class="card">
            <h3><?= Yii::t('app', 'Table of statistic of officer training course')?></h3>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Course') ?></th>
                </tr>
                </thead>
                <tbody ng-repeat="m in models" ng-click="select(m)">
                <tr>
                    <th class="text-center">{{$index+1}}</th>
                    <th>{{m.name}}</th>
                </tr>
                <tr ng-repeat="c in m.statCourses" ng-click="select(c)">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{c.name}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  var url = 'index.php?r=stat-course/';
  app.controller('statCourseController', function($scope, $http, $sce, $timeout) {
    $scope.enquiry = function() {
        $http.get(url + 'enquiry')
          .then(function(r) {
            $scope.models = r.data.models;
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.enquiry();

    $scope.select = function(m) {
      console.log(m);
        if(m.statCourses) {

        }
        $scope.model= m;
        if($scope.model.position)
            $scope.model.position = parseInt($scope.model.position);
    };

    $scope.save = function() {
      if($scope.model) {
        $http.post(url+'save', {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.response = r;
          if(r.data)
            $scope.models = r.data.models;
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
  });
</script>