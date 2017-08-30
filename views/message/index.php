<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MessageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Messages');
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="translateController">
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
                <strong class="pull-right"><?= Yii::t('app', 'Total') ?>: {{ messages.length }} <?= Yii::t('app', 'Row(s)') ?></strong>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th ng-click="dosort('message')"><a href="#"><?= Yii::t("app", "Message") ?></a> <i ng-class="getIcon('message')"></i> </th>
                        <th ng-click="dosort('translation')"><a href="#"><?= Yii::t("app", "Translation") ?></a> <i ng-class="getIcon('translation')"></i> </th>
                        <th rowspan="2"><?= Yii::t("app", "Action") ?></th>
                    </tr>
                    <tr>
                        <th><input class="form-control" type="text" ng-model="filtermessage"></th>
                        <th><input class="form-control" type="text" ng-model="filtertranslation"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="m in messages | orderBy:sort:active | filter : {message: filtermessage, translation: filtertranslation}">
                        <td>{{ m.message }}</td>
                        <td>{{ m.translation }}</td>
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
                <div class="form-group field-message-id required {{message.message.error}}">
                    <label class="control-label" for="message-id"><?= Yii::t('app', 'Message') ?></label>
                    <input id="message-message" type="text" class="form-control" name="Message[message]" ng-model="message.message"></input>
                </div>
                <div class="form-group field-message-translation">
                    <label class="control-label" for="message-translation"><?= Yii::t('app', 'Translation') ?></label>
                    <input id="message-translation" type="text" class="form-control" name="Message[translation]" ng-model="message.translation"></input>
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
    var baseurl = "index.php?r=message/";
    app.controller('translateController', function($scope, $http, $timeout) {
        $scope.message = null;
        $scope.messages = [];
        $scope.sort = "message";
        $scope.active = false;
        $scope.create = true;
        $scope.error = false;
        $scope.errormessage = "";
        $scope.success = false;
        $http.get(baseurl + "getall")
            .then(function (response) {
                $scope.messages = response.data;
            });

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
            $scope.message = m;
            $scope.create = false;
            $('#message-translation').focus();
        };

        $scope.new = function() {
            $scope.message = null;
            $scope.create = true;
            $('#message-message').focus();
        };

        $scope.save = function()  {
            if($scope.message == null) return;
            var url = $scope.create ? baseurl + 'create' : baseurl+'update&id=' + $scope.message.id;
            $http
                .post(url, {"Message": $scope.message})
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
                    $scope.messages.push(response.data.model);
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
                        $scope.messages.splice($scope.messages.indexOf(m), 1);
                    });
            }
        };
    });
</script>
