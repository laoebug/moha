<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)";
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statGovermentUnitController">
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
                <div class="col-sm-2 hidden">
                    <label for=""><?= Yii::t('app', 'Group') ?></label>
                    <select class="form-control" ng-model="ministrygroup" ng-options="g.name for g in ministrygroups"></select>
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Ministry') ?></label>
                    <select class="form-control" ng-model="ministry" ng-options="b.name for b in ministries" ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Office') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="office">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Department') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="department">
                </div>
                <div class="col-sm-2">
                    <label for="">ສະຖາບັນ</label>
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
                <div class="col-sm-4">
                    <label class="control-label col-sm-12">ເອກສານອ້າງອີງ</label>
                    <input class="form-control" type="file" file-model="myFile">
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em" ng-bind-html="result"></div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-goverment-unit/';

    app.directive('fileModel', ['$parse', function ($parse) {
      return {
        restrict: 'A',
        link: function(scope, element, attrs) {
          var model = $parse(attrs.fileModel);
          var modelSetter = model.assign;

          element.bind('change', function(){
            scope.$apply(function(){
              modelSetter(scope, element[0].files[0]);
            });
          });
        }
      };
    }]);



    app.service('fileUpload', ['$http', function ($http) {
      this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);

        $http.post(uploadUrl, fd, {
          body: {'_csrf': $('meta[name="csrf-token"]').attr("content")},
          transformRequest: angular.identity,
          headers: {'Content-Type': undefined}
        })
          .success(function(){
          })
          .error(function(){
          });
      }
    }]);

//    app.controller('myCtrl', ['$scope', 'fileUpload', function($scope, fileUpload){
//
//    }]);

    app.controller('statGovermentUnitController', function($scope, $http, $sce, $timeout, fileUpload) {
      $scope.mode = 'read';
      $scope.changemode = function() {
        $scope.mode = $scope.mode == 'read'?'input':'read';
      };

      $scope.uploadFile = function(){
        var file = $scope.myFile;

        console.log('file is ' );
        console.dir(file);

        fileUpload.uploadFileToUrl(file, url + "upload");
      };

        $http.get(url+ 'get')
          .then(function(r) {
            $scope.years = r.data.years;
            $scope.ministries = r.data.ministries;
          }, function(r) {
              $scope.response = r;
              $timeout(function () {
                  $scope.response = null;
              }, 15000);
          });

        $scope.enquiry = function() {
          if($scope.year)
            $http.get(url + 'enquiry&year='+$scope.year.id)
              .then(function(r) {
              $scope.result = $sce.trustAsHtml(r.data);
            }, function(r) {
                $scope.response = r;
                $timeout(function () {
                    $scope.response = null;
                }, 15000);
            });
        };

        $scope.inquiry = function() {
          if($scope.ministry)
              $http.get(url+'inquiry&ministry='+$scope.ministry.id+'&year='+ $scope.year.id)
                .then(function(r) {
                      $scope.office = parseInt(r.status == 200? r.data.office:"");
                      $scope.department = parseInt(r.status == 200? r.data.department:"");
                      $scope.insitute = parseInt(r.status == 200? r.data.insitute:"");
                      $scope.center = parseInt(r.status == 200? r.data.center:"");
                      $scope.remark = parseInt(r.status == 200? r.data.remark:"");
                }, function(r) {
                    $scope.response = r;
                    $timeout(function () {
                        $scope.response = null;
                    }, 15000);
                });
          else {
            $scope.office = "";
            $scope.department = "";
            $scope.insitute = "";
            $scope.center = "";
            $scope.remark = "";
          }
        };

        $scope.save = function() {
            if($scope.year && $scope.ministry) {
                $http.post(url+'save', {
                  'year':$scope.year.id,
                  'ministry':$scope.ministry.id,
                  'office':$scope.office,
                  'department':$scope.department,
                  'insitute':$scope.insitute,
                  'center':$scope.center,
                  'remark':$scope.remark,
                  '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {
                  $scope.uploadFile();
                  $scope.response = r;
                  if(r.data) $scope.result = $sce.trustAsHtml(r.data);
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