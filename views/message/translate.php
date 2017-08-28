<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MessageSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Messages');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="message-index" ng-app="mohaApp" ng-controller="translateController">
<!--    <div class="alert alert-danger" ng-if="error != null">-->
<!--        <strong>--><?//= Yii::t('app', 'Error') ?><!--!</strong> {{error}}-->
<!--    </div>-->
<!--    <div class="alert alert-success" ng-if="success == true">-->
<!--        <strong>--><?//= Yii::t('app', 'Operation Successful') ?><!--!</strong>-->
<!--    </div>-->

    <div class="col-sm-7">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th><?= Yii::t("app", "Message") ?></th>
                <th><?= Yii::t("app", "Translation") ?></th>
                <th rowspan="2"><?= Yii::t("app", "Action") ?></th>
            </tr>
            <tr>
                <th><input class="form-control" type="text" ng-model="filtermessage"></th>
                <th><input class="form-control" type="text" ng-model="filtertranslation"></th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="m in messages | filter : {message: filtermessage, translation: filtertranslation}">
                <td ng-click="select(m)">{{ m.message }}</td>
                <td ng-click="select(m)">{{ m.translation }}</td>
                <td>
                    <button type="button" class="btn btn-danger" ng-click="delete(m)"><i class="fa fa-trash"></i> </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="col-sm-5">
        <div class="form-group field-message-id required {{message.message.error}}">
            <label class="control-label" for="message-id"><?= Yii::t('app', 'Message') ?></label>
            <input class="form-control readonly" ng-model="message.message" >
        </div>
        <div class="form-group field-message-translation">
            <label class="control-label" for="message-translation">Translation</label>
            <textarea id="message-translation" class="form-control" name="Message[translation]" rows="6" ng-model="message.translation"></textarea>
            <div class="help-block"></div>
        </div>
        <div class="form-group">
            <button type="button" ng-click="create()" class="btn btn-success"><?= Yii::t('app', 'Add') ?></button>
            <button type="button" ng-click="update()" class="btn btn-primary"><?= Yii::t('app', 'Update') ?></button>
            <button type="button" ng-click="cancel()" class="btn btn-default"><?= Yii::t('app', 'Cancel') ?></button>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    app.controller('translateController', function($scope, $http) {
        $scope.message = null;
        $scope.success = false;
        $scope.error = null;
        $http.get("index.php?r=message/getall")
            .then(function (response) {
                $scope.messages = response.data;
            });

        $scope.select = function(m) {
            $scope.message = m;
        };

        $scope.update = function()  {
            if($scope.message == null) return;
            $.post("index.php?r=message/update&id=" + $scope.message.id, {"Message": $scope.message}, function() {
                if(r.error) {
                    $scope.error = r.error;
                    $scope.success = false;
                    return;
                }
                $scope.success = true;
                $scope.message = null;
            });
        };

        $scope.create = function() {
            if($scope.message == null) return;
            $.post("index.php?r=message/create", {"Message": $scope.message}, function(r) {
                if(r.error) {
                    $scope.error = r.error;
                    $scope.success = false;
                    return;
                }
                $scope.success = true;
                $scope.error = null;
                $scope.messages.push(r.model);
                $scope.message = null;
            });
        };
        $scope.cancel = function() {
            $scope.message = null;
        };
        $scope.delete = function(m) {
            if(confirm("OK?")) {
                $.post("index.php?r=message/delete&id="+m.id, {}, function(r) {
                    if(r.error) {
                        $scope.error = r.error;
                        $scope.success = false;
                        return;
                    }
                    $scope.messages.splice($scope.messages.indexOf(m), 1);
                });
            }
        };
    });
</script>
