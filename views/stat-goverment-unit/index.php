<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)";
$this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statGovermentUnitController">

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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-2 hidden">
                    <label for=""><?= Yii::t('app', 'Group') ?></label>
                    <select class="form-control" ng-model="ministrygroup"
                            ng-options="g.name for g in ministrygroups"></select>
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Ministry') ?></label>
                    <select class="form-control" ng-model="ministry" ng-options="b.name for b in ministries"
                            ng-change="inquiry()">
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
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-show="year">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="row">
                        <div class="col-sm-12" style="margin-top: 2em" ng-bind-html="result"></div>
                    </div>
                </div>
                <div class="tab-pane fade" id="reference">
                    <div class="row">
                        <div class="col-sm-3">
                            <label>ເລກທີ</label>
                            <input type="text" ng-model="issued_no" class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <label>ລົງວັນທີ</label>
                            <input class="form-control datepicker" data-ng-model="$parent.issued_date" type="text">
                        </div>
                        <div class="col-sm-3">
                            <label>ອອກໂດຍ</label>
                            <input type="text" ng-model="issued_by" class="form-control">
                        </div>

                        <div class="col-sm-3">
                            <label>ເລືອກຟາຍ</label>
                            <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);"
                                   class="form-control" required>
                            <p ng-show="myform.image.$invalid && !myform.image.$pristine" class="help-block">
                                File ບໍ່ສາມາດວ່າງເປົ່າ
                            </p>
                        </div>

                        <div class="col-sm-12" ng-if="references">
                            <div class="card">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>ວັນທີອັບໂຫຼດ</th>
                                        <th>ຊື່</th>
                                        <th>ເລກທີ</th>
                                        <th>ລົງວັນທີ</th>
                                        <th>ອອກໂດຍ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="f in references">
                                        <td>{{f.upload_date}}</td>
                                        <td>{{f.name}}</td>
                                        <td>{{f.issued_no}}</td>
                                        <td>{{f.issued_date}}</td>
                                        <td>{{f.issued_by}}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['ui.bootstrap.datetimepicker']);

  app.controller('statGovermentUnitController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-goverment-unit/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $scope.uploadedFile = function (element) {
      if(!$scope.issued_no) {
        alert('ກະລຸນາປ້ອນເລກທີ');
        return;
      }
      $scope.issued_date = $('.datepicker').val();
      if(!$scope.issued_date) {
        alert('ກະລຸນາປ້ອນວັນທີ');
        return;
      }

      $scope.$apply(function ($scope) {
        $scope.files = element.files;
        $http({
          url: $scope.url + "upload&year=" + $scope.year.id,
          method: "POST",
          processData: false,
          headers: {'Content-Type': undefined},
          data: {
            '_csrf': $('meta[name="csrf-token"]').attr("content"),
              'issued_no': $scope.issued_no,
              'issued_date': $scope.issued_date,
              'issued_by': $scope.issued_by
          },
          transformRequest: function (data) {
            var formData = new FormData();
            var file = $scope.files[0];
            formData.append("file_upload", file);
            angular.forEach(data, function (value, key) {
              formData.append(key, value);
            });
            return formData;
          }
        }).success(function (data, status, headers, config) {
          $scope.getreferences();
          $scope.status = data.status;
          if ($scope.status == 1) {
            $scope.formdata = "";
            $scope.myform.$setPristine();
          }
        }).error(function (data, status, headers, config) {
          alert("Something Error in form process");
        });
      });
    };

    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
        $scope.references = r.data.references;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.result = $sce.trustAsHtml(r.data);
            $scope.getreferences();
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function () {
      if ($scope.ministry)
        $http.get($scope.url + 'inquiry&ministry=' + $scope.ministry.id + '&year=' + $scope.year.id)
          .then(function (r) {
            $scope.office = parseInt(r.status == 200 ? r.data.office : "");
            $scope.department = parseInt(r.status == 200 ? r.data.department : "");
            $scope.insitute = parseInt(r.status == 200 ? r.data.insitute : "");
            $scope.center = parseInt(r.status == 200 ? r.data.center : "");
            $scope.remark = parseInt(r.status == 200 ? r.data.remark : "");
          }, function (r) {
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

    $scope.save = function () {
      if ($scope.year && $scope.ministry) {
        $http.post($scope.url + 'save', {
          'year': $scope.year.id,
          'ministry': $scope.ministry.id,
          'office': $scope.office,
          'department': $scope.department,
          'insitute': $scope.insitute,
          'center': $scope.center,
          'remark': $scope.remark,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.uploadFile();
          $scope.response = r;
          if (r.data) $scope.result = $sce.trustAsHtml(r.data);
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

    $scope.getreferences = function() {
      if($scope.year) {
        $http.get($scope.url + 'getreferences&year=' + $scope.year.id)
          .then(function (r) {
            if (r.data)
              $scope.references = r.data.references;
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
    };
  });
</script>