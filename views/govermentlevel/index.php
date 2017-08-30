<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Goverment Level');
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="govermentlevelController">
    <div class="col-sm-12">
        <div class="alert alert-success alert-dismissable" ng-if="success">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong><?= Yii::t('app', 'Successful') ?>!</strong>
        </div>
        <div class="alert alert-danger alert-dismissable" ng-if="error">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong><?= Yii::t('app', 'Error') ?>!</strong> {{errormessage}}
        </div>
    </div>
    <div class="col-sm-8">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-list"></i> <strong><?= Yii::t('app', 'List') ?></strong>
                <strong class="pull-right"><?= Yii::t('app', 'Total') ?>: {{ items.length }} <?= Yii::t('app', 'Row(s)') ?></strong>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th ng-click="dosort('name')"><a href="#"><?= Yii::t("app", "Name") ?></a> <i ng-class="getIcon('name')"></i> </th>
                        <th ng-click="dosort('deleted')"><a href="#"><?= Yii::t("app", "Deleted") ?></a> <i ng-class="getIcon('deleted')"></i> </th>
                        <th rowspan="2"><?= Yii::t("app", "Action") ?></th>
                    </tr>
                    <tr>
                        <th><input class="form-control" type="text" ng-model="filtername"></th>
                        <th><select ng-model="filterdeleted" class="form-control">
                                <option></option>
                                <option value="0"><?= Yii::t('app', 'NO') ?></option>
                                <option value="1"><?= Yii::t('app', 'YES') ?></option>
                            </select></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="m in items | orderBy:sort:active | filter : {name: filtername, deleted: filterdeleted}">
                        <td>{{ m.name }}</td>
                        <td><span class="label label-{{m.deleted == 0?'success':'danger'}}"> {{ m.deleted == 0 ? 'NO':'YES'  }}</span></td>
                        <td>
                            <button type="button" class="btn btn-info" ng-click="select(m)"><i class="fa fa-eye"></i> </button>
                            <button type="button" class="btn btn-danger" ng-click="delete(m)"><i class="fa fa-trash"></i> </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="panel panel-{{create?'default':'info'}}">
            <div class="panel-heading">
                <i class="fa fa-{{create?'plus':'save'}}"></i>
            </div>
            <div class="panel-body">
                <div class="form-group required">
                    <label class="control-label"><?= Yii::t('app', 'Name') ?></label>
                    <input id="govermentlevel-name" type="text" class="form-control" name="Govermentlevel[name]" ng-model="item.name"></input>
                </div>
                <div class="form-group">
                    <label class="control-label"><?= Yii::t('app', 'Deleted') ?></label>
                    <select class="form-control" ng-model="item.deleted" name="Govermentlevel[deleted]">
                        <option value="0"><?= Yii::t('app', 'NO') ?></option>
                        <option value="1"><?= Yii::t('app', 'YES') ?></option>
                    </select>
                    <div class="help-block"></div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6">
                        <button type="button" ng-click="new()" class="btn btn-default"><?= Yii::t('app', 'New') ?></button>
                    </div>
                    <div class="col-sm-6 text-right">
                        <button type="button" ng-click="save()" class="btn btn-primary"><?= Yii::t('app', 'Save') ?></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<!--<script type="text/javascript" src="js/dirPagination.js"></script>-->
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var baseurl = "index.php?r=govermentlevel/";
    app.controller('govermentlevelController', function($scope, $http, $timeout) {
        $scope.item = null;
        $scope.items = [];
        $scope.sort = "name";
        $scope.active = false;
        $scope.create = true;
        $scope.error = false;
        $scope.errormessage = "";
        $scope.success = false;

        getall();

        function getall() {
          $http.get(baseurl + "getall")
            .then(function (response) {
              $scope.items = response.data;
            });
        }

        $scope.getIcon = function(column) {
            if($scope.sort == column) {
                return $scope.active ? 'fa fa-sort-alpha-asc':'fa fa-sort-alpha-desc';
            }
            return '';
        };

        $scope.dosort = function(column) {
            $scope.sort = column;
            $scope.active = !$scope.active;
        };

        $scope.select = function(m) {
            $scope.item = m;
            $scope.create = false;
            $('#govermentlevel-name').focus();
        };

        $scope.new = function() {
            $scope.item = null;
            $scope.create = true;
            $('#govermentlevel-name').focus();
        };

        $scope.save = function()  {
            if($scope.item == null) return;
            var url = $scope.create ? baseurl + 'create' : baseurl+'update&id=' + $scope.item.id;
            $http
                .post(url, {"Govermentlevel": $scope.item})
                .then(function(response) {
                    $timeout(function() {
                        $scope.success = false;
                        $scope.error = false;
                        $scope.errormessage = "";
                    }, 15000);

                    if(response.data.error) {
                        $scope.success = false;
                        $scope.error = true;
                        $scope.errormessage = response.data.error;
                        return;
                    }
                    $scope.success = true;
                    if($scope.create) getall();
//                    $scope.items.push(response.data.model);
                });

            $scope.new();
        };

        $scope.delete = function(m) {
            if(confirm("Sure?")) {
                $http
                    .post(baseurl +'delete', {"id": m.id})
                    .then(function(response) {
                        $timeout(function() {
                            $scope.success = false;
                            $scope.error = false;
                            $scope.errormessage = "";
                        }, 15000);

                        if(response.data.error) {
                            $scope.success = false;
                            $scope.error = true;
                            $scope.errormessage = response.data.error;
                            return;
                        }
                        $scope.success = true;
                        m.deleted = 1;
                    });
            }
        };
    });
</script>
