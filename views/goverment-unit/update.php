<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $model app\models\StatGovermentUnit */

$this->title = Yii::t('app', 'Goverment Unit'). " (".$year->year.")";
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    th, input[type=number]{
        text-align: center;
    }
</style>
<div class="row" ng-app="mohaApp" ng-controller="govermentUnitUpdateController">
    <div class="col-sm-3">
        <label for=""><?= Yii::t('app', 'Group') ?></label>
        <select class="form-control" ng-model="branchgroup" ng-options="g.name for g in branchgroups"></select>
    </div>
    <div class="col-sm-3">
        <label for=""><?= Yii::t('app', 'Ministry') ?></label>
        <select class="form-control" ng-model="branch" ng-options="b.name for b in branchgroup.branches">
        </select>
    </div>
    <div class="col-sm-2">
        <label for=""><?= Yii::t('app', 'Department') ?></label>
        <input type="number" min="0" class="form-control" ng-model="department">
    </div>
    <div class="col-sm-2">
        <label for=""><?= Yii::t('app', 'Insitute') ?></label>
        <input type="number" min="0" class="form-control" ng-model="insitute">
    </div>
    <div class="col-sm-2">
        <label for=""><?= Yii::t('app', 'Center') ?></label>
        <input type="number" min="0" class="form-control" ng-model="center">
    </div>
    <div class="col-sm-12">
        <label for=""><?= Yii::t('app', 'Remark') ?></label>
        <input type="text" class="form-control" ng-model="remark">
    </div>
    <div class="col-sm-2 col-sm-offset-5" style="vertical-align: middle">
        <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
        </button>
    </div>
    <hr />
    <div class="col-sm-12 card">
        <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <th><?=Yii::t('app','No.')?></th>
                    <th><?=Yii::t('app','Ministry')?></th>
                    <th><?=Yii::t('app','Department')?></th>
                    <th><?=Yii::t('app','Insitute')?></th>
                    <th><?=Yii::t('app','Center')?></th>
                    <th><?=Yii::t('app','Remark')?></th>
                </tr>
            </thead>
            <tbody ng-repeat="g in branchgroups">
                <tr>
                    <td colspan="2">{{g.name}}</td>
                    <td colspan="4"></td>
                </tr>
                <tr ng-repeat="b in g.branches | orderBy: b.position" ng-click="select(g, b)">
                    <td>{{ $index +1 }}</td>
                    <td>{{b.name}}</td>
                    <td>{{b.statGovermentUnitDetails.department}}</td>
                    <td>{{b.statGovermentUnitDetails.insitute}}</td>
                    <td>{{b.statGovermentUnitDetails.center}}</td>
                    <td>{{b.statGovermentUnitDetails.remark}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script src="js/angular.js" type="text/javascript"></script>
<script type="text/javascript">
    var app = angular.module("mohaApp",[]);
    var baseurl = "index.php?r=goverment-unit/";
    app.controller("govermentUnitUpdateController", function($scope, $http, $timeout) {
      $scope.no = 0;
      $http.get(baseurl + 'get&year='+<?=$year->id?>).
        then(function(r) {
        $scope.branchgroups = r.data.branchgroups;
        $scope.models = r.data.models;
      });

      $scope.select = function(g, b) {
        $scope.branchgroup = g;
        $scope.branch = b;
      };

      $scope.save = function() {
        $http.post(baseurl+'save', {
          'id':
          'branch_id':$scope.branch,
          'department':$scope.department,
          'insitute':$scope.insitute,
          'center':$scope.center,
          'remark':$scope.remark
        }).then(function(r) {
          console.log(r);
        });
      }
    });
</script>