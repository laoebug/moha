<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerContractSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນພະນັກງານຕາມສັນຍາ";
$this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerContractController">
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
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'Description') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>ຮັບເຂົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                            <td><input type="number" min="0" ng-model="model.admin_approve_total" class="form-control">
                            </td>
                            <td><input type="number" min="0" ng-model="model.admin_approve_women"
                                       max="{{model.admin_approve_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                            <td><input type="number" min="0" ng-model="model.admin_non_total" class="form-control"></td>
                            <td><input type="number" min="0" ng-model="model.admin_non_women"
                                       max="{{model.admin_non_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>ຮັບເຂົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                            <td><input type="number" min="0" ng-model="model.officer_approve_total"
                                       class="form-control"></td>
                            <td><input type="number" min="0" ng-model="model.officer_approve_women"
                                       max="{{model.officer_approve_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                            <td><input type="number" min="0" ng-model="model.officer_non_total" class="form-control">
                            </td>
                            <td><input type="number" min="0" ng-model="model.officer_non_women"
                                       max="{{model.officer_non_total}}" class="form-control"></td>
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
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center" rowspan="2" colspan="2"><?= Yii::t('app', 'Description') ?></th>
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
                                <th class="text-center" rowspan="7">VII</th>
                                <th colspan="2">ຈຳນວນລັດຖະກອນຕາມສັນຍາ</th>
                                <th class="text-center">{{formatNumber(model.admin_approve_total + model.admin_non_total
                                    + model.officer_approve_total + model.officer_non_total)}}
                                </th>
                                <th class="text-center">{{formatNumber(model.admin_approve_women + model.admin_non_women
                                    + model.officer_approve_women + model.officer_non_women)}}
                                </th>
                                <th class="text-center">{{formatNumber(model.admin_approve_total + model.admin_non_total
                                    + model.officer_approve_total + model.officer_non_total - (model.admin_approve_women
                                    + model.admin_non_women + model.officer_approve_women + model.officer_non_women))}}
                                </th>
                            </tr>
                            <tr>
                                <td colspan="2">1. ຈຳນວນພະນັກງານຕາມສັນຍາ (ບໍລິຫານຮັບໃຊ້)</td>
                                <td class='text-center'>{{formatNumber(model.admin_approve_total +
                                    model.admin_non_total)}}
                                </td>
                                <td class='text-center'>{{formatNumber(model.admin_approve_women +
                                    model.admin_non_women)}}
                                </td>
                                <td class='text-center'>{{formatNumber(model.admin_approve_total+model.admin_non_total -
                                    (model.admin_approve_women + model.admin_non_women))}}
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>ຮັບເຂົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                                <td class="text-center">{{formatNumber(model.admin_approve_total)}}</td>
                                <td class="text-center">{{formatNumber(model.admin_approve_women)}}</td>
                                <td class="text-center">{{formatNumber(model.admin_approve_total -
                                    model.admin_approve_women)}}
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                                <td class="text-center">{{formatNumber(model.admin_non_total)}}</td>
                                <td class="text-center">{{formatNumber(model.admin_non_women)}}</td>
                                <td class="text-center">{{formatNumber(model.admin_non_total -
                                    model.admin_non_women)}}
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">2. ຈຳນວນພະນັກງານຕາມສັນຍາ (ວິຊາການ)</td>
                                <td class='text-center'>{{formatNumber(model.officer_approve_total +
                                    model.officer_non_total)}}
                                </td>
                                <td class='text-center'>{{formatNumber(model.officer_approve_women +
                                    model.officer_non_women)}}
                                </td>
                                <td class='text-center'>{{formatNumber(model.officer_approve_total +
                                    model.officer_non_total - (model.officer_approve_women + model.officer_non_women))}}
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>ຮັບເຂົ້າຕາມຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ</td>
                                <td class="text-center">{{formatNumber(model.officer_approve_total)}}</td>
                                <td class="text-center">{{formatNumber(model.officer_approve_women)}}</td>
                                <td class="text-center">{{formatNumber(model.officer_approve_total -
                                    model.officer_approve_women)}}
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>ຮັບເຂົ້າໂດຍບໍ່ນອນໃນຈຳນວນຕົວເລກທີ່ລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</td>
                                <td class="text-center">{{formatNumber(model.officer_non_total)}}</td>
                                <td class="text-center">{{formatNumber(model.officer_non_women)}}</td>
                                <td class="text-center">{{formatNumber(model.officer_non_total -
                                    model.officer_non_women)}}
                                </td>
                            </tr>
                            </tbody>
                        </table>
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
                            <input id="issued_date" class="form-control datepicker" data-ng-model="$parent.issued_date" type="text">
                        </div>
                        <div class="col-sm-3">
                            <label>ອອກໂດຍ</label>
                            <input type="text" ng-model="issued_by" class="form-control">
                        </div>

                        <div class="col-sm-3">
                            <label>ເລືອກໄຟລ໌</label>
                            <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);"
                                   class="form-control" required>
                        </div>

                        <div class="col-sm-12" ng-if="references">
                            <div class="card">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">ວັນທີອັບໂຫຼດ</th>
                                        <th class="text-center">ຊື່</th>
                                        <th class="text-center">ເລກທີ</th>
                                        <th class="text-center">ລົງວັນທີ</th>
                                        <th class="text-center">ອອກໂດຍ</th>
                                        <th class="text-center">ລຶບ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="f in references">
                                        <td class="text-center">{{f.upload_date}}</td>
                                        <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a></td>
                                        <td class="text-center">{{f.issued_no}}</td>
                                        <td class="text-center">{{f.issued_date | date}}</td>
                                        <td class="text-center">{{f.issued_by}}</td>
                                        <td class="text-center">
                                            <button class="btn btn-danger" type="button" ng-click="deletefile(f)">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
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

  app.controller('officerContractController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-contract/';
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
            $scope.model = r.data.model;
            if (r.data.model) {
              $scope.model.admin_approve_total = parseInt($scope.model.admin_approve_total);
              $scope.model.admin_non_total = parseInt($scope.model.admin_non_total);
              $scope.model.officer_approve_total = parseInt($scope.model.officer_approve_total);
              $scope.model.officer_non_total = parseInt($scope.model.officer_non_total);

              $scope.model.admin_approve_women = parseInt($scope.model.admin_approve_women);
              $scope.model.admin_non_women = parseInt($scope.model.admin_non_women);
              $scope.model.officer_approve_women = parseInt($scope.model.officer_approve_women);
              $scope.model.officer_non_women = parseInt($scope.model.officer_non_women);
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
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

    $scope.formatNumber = function (num, dec) {
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
    };

    $scope.uploadedFile = function (element) {
      if(!$scope.issued_no) {
        $scope.files = null;
        alert('ກະລຸນາປ້ອນເລກທີ');
        return;
      }
      $scope.issued_date = $('#issued_date').val();
      if(!$scope.issued_date) {
        $scope.files = null;
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
          $scope.issued_date = null;
          $scope.issued_no = null;
          $scope.issued_by = null;
          $("input[name='image'], #issued_date").val("");
          $scope.status = data.status;
          $scope.formdata = "";
        }).error(function (data, status, headers, config) {
          $scope.response = data;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      });
    };

    $scope.getreferences = function() {
      if($scope.year) {
        $http.get($scope.url + 'getreferences&year=' + $scope.year.id)
          .then(function (r) {
            if (r.data)
              $scope.references = r.data.files;
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
    };

    $scope.deletefile = function(f) {
      if($scope.year && f) {
        if(confirm('ທ່ານຕ້ອງການລຶບແທ້ບໍ?'))
          $http.post($scope.url + 'deletefile&year='+$scope.year.id, {
            'id': f.id,
            '_csrf': $('meta[name="csrf-token"]').attr("content")
          }).then(function (r) {
            $scope.response = r;
            $scope.getreferences();
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
  });
</script>
