<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerPositionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ຈຳນວນລັດຖະກອນ ແຍກຕາມຕຳແໜ່ງບໍລິຫານປະເພດຕ່າງໆ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerPositionController">
  <!-- <div class="col-sm-12"> -->
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div> -->
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-2">
                    <select class="form-control" ng-model="model.orgGroup" ng-change="inquiry()"
                            ng-options="y.name for y in orgGroups"></select>
                </div>
                <div class="col-sm-10">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td colspan="2" class="text-center" ng-repeat="c in cols" ng-if="$index <= 2">ປະເພດ {{
                                $index + 1 }}
                            </td>
              </tr>
              <tr>
                <td class="text-center" ng-repeat-start="c in cols" ng-if="$index <= 2">ລ</td>
                            <td class="text-center" ng-repeat-end ng-if="$index <= 2">ຍ</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="width: 12.5%" ng-repeat-start="c in cols" ng-if="$index <= 2">
                                <input type="number" min="0" class="form-control"
                                       ng-model="model[c.col+'_total']">
                            </td>
                            <td style="width: 12.5%" ng-repeat-end ng-if="$index <= 2">
                                <input type="number" min="0" max="{{model[c.col+'_total']}}"
                                       ng-model="model[c.col+'_women']" class="form-control">
                            </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="col-sm-12">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td colspan="2" class="text-center" ng-repeat="c in cols" ng-if="$index >= 3">ປະເພດ {{
                                $index + 1 }}
                            </td>
              </tr>
              <tr>
                <td class="text-center" ng-repeat-start="c in cols" ng-if="$index >= 3">ລ</td>
                            <td class="text-center" ng-repeat-end ng-if="$index >= 3">ຍ</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="width: 10%" ng-repeat-start="c in cols" ng-if="$index >= 3">
                                <input type="number" min="0" class="form-control"
                                       ng-model="model[c.col+'_total']">
                            </td>
                            <td style="width: 10%" ng-repeat-end ng-if="$index >= 3">
                                <input type="number" min="0" max="{{model[c.col+'_total']}}"
                                       ng-model="model[c.col+'_women']" class="form-control">
                            </td>
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
  <div ng-show="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
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
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}">
                                    <i class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}">
                                    <i class="fa fa-download fa-2x"></i>
                                </a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                  <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                                <th class="text-center" colspan="2" rowspan="2">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                                <th class="text-center" colspan="16"
                                    colspan="16"><?= Yii::t('app', 'Description') ?></th>
                            </tr>
                            <tr>
                                <td colspan="2" class="text-center" ng-repeat="c in cols">ປະເພດ {{ $index + 1 }}</td>
                </tr>
                <tr>
                  <td class="text-center">ລ</td>
                                <td class="text-center">ຍ</td>
                  <td ng-repeat-start="c in cols" class="text-center">ລ</td>
                  <td ng-repeat-end class="text-center">ຍ</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th colspan="2" class="text-center">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                                <th class="text-center">{{sumtotal(models, '_total') | number | dash}}</th>
                  <th class="text-center">{{sumtotal(models, '_women') | number | dash}}</th>
                                <th ng-repeat-start="c in cols" class="text-center">
                                    {{sums(models, c.col + '_total') | number | dash}}
                  </th>
                  <th ng-repeat-end class="text-center">
                                    {{sums(models, c.col + '_women') | number | dash}}
                                </th>
                            </tr>
                            <tr ng-repeat="m in models">
                  <td>{{$index + 1}}</td>
                                <td>{{m.name}}</td>
                                <td class="text-center">{{sum(m, '_total') | number | dash}}</td>
                  <td class="text-center">{{sum(m, '_women') | number | dash}}</td>
                                <td ng-repeat-start="c in cols" class="text-center">
                                    {{m[c.col+'_total'] | number |dash}}
                                </td>
                                <td ng-repeat-end class="text-center">{{m[c.col+'_women'] | number | dash}}</td>
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
                            <input id="issued_date" class="form-control datepicker" data-ng-model="$parent.issued_date"
                                   type="text">
                        </div>
                        <div class="col-sm-3">
                            <label>ອອກໂດຍ</label>
                            <input type="text" ng-model="issued_by" class="form-control">
                        </div>

            <div class="col-sm-3">
              <label>ເລືອກໄຟລ໌</label>
              <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);" class="form-control" required>
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
                      <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a>
                                        </td>
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
<script type="text/javascript" src="js/sweetalert2.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', ['ui.bootstrap.datetimepicker']);
    app.filter('dash', function () {
        return function (input) {
            return input ? input : '-';
        };
    });
    app.controller('officerPositionController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat-officer-position/';
        $scope.mode = 'read';
        $scope.model = {};
        $scope.models = null;
        $scope.cols = [
            {col: 'p1'},
            {col: 'p2'},
            {col: 'p3'},
            {col: 'p4'},
            {col: 'p5'},
            {col: 'p6'},
            {col: 'p7'},
            {col: 'p8'},
        ];
        $scope.changemode = function() {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };

        $http.get($scope.url + 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.orgGroups = r.data.orgGroups;
            }, function(r) {
                $scope.response = r;
                $timeout(function() {
                    $scope.response = null;
                }, 15000);
            });

        $scope.sum = function(model, key) {
            let total = 0;
            if (model)
                $scope.cols.forEach(function(c) {
                    total += parseInt(model[c.col + key]);
                });
            return total;
        };

        $scope.sums = function (models, key) {
            let total = 0;
          if (models)
                $scope.models.forEach(function (model) {
                    total += parseInt(model[key]);
                });
            return total;
        };

        $scope.sumtotal = function (models, key) {
            let total = 0;
            if (models)
                $scope.models.forEach(function (model) {
                    $scope.cols.forEach(function (c) {
                        total += parseInt(model[c.col + key]);
                    });
                });
            return total;
        };

        $scope.inquiry = function () {
            if ($scope.year && $scope.model.orgGroup)
                $http.get($scope.url + 'inquiry&orgGroup=' + $scope.model.orgGroup.id + '&year=' + $scope.year.id)
                    .then(function (r) {
                        $scope.cols.forEach(function (c) {
                            $scope.model[c.col + '_total'] = r.data.model ? parseInt(r.data.model[c.col + '_total']) : null;
                            $scope.model[c.col + '_women'] = r.data.model ? parseInt(r.data.model[c.col + '_women']) : null;
                        });
                    });
        };

        $scope.enquiry = function () {
            if ($scope.year)
                $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
                    .then(function (r) {
                        $scope.models = r.data.models;
                        if (r.data.models) {
                            r.data.models.forEach(function (m) {
                                $scope.cols.forEach(function (c) {
                                    m[c.col + '_total'] = parseInt(m[c.col + '_total']);
                                    m[c.col + '_women'] = parseInt(m[c.col + '_women']);
                                });
                            });
                        }
                        $scope.getreferences();
                    }, function (r) {
                        $scope.response = r;
                        $timeout(function () {
                            $scope.response = null;
                        }, 15000);
                    });
        };

        $scope.save = function () {
            if ($scope.year && $scope.model) {
                $scope.model.organisation_group_id = $scope.model.orgGroup.id;
                $http.post($scope.url + 'save&year=' + $scope.year.id, {
                    'Model': $scope.model,
                    '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function (r) {
                    $scope.response = r;
                    $scope.enquiry();
                    $timeout(function () {
                        $scope.response = null;
                    }, 15000);
        if (r.status == 200) {
            Swal.fire({
              position: 'top-end',
              type: 'success',
              title: 'ການບັນທຶກສໍາເລັດ',
              text: r.status,
              showConfirmButton: false,
              timer: 3000
            });
          }        }, function (r) {
                    $scope.response = r;
                    $timeout(function () {
                        $scope.response = null;
                    }, 15000);Swal.fire({
            position: 'top-end',
            type: 'error',
            title: 'ການບັນທຶກບໍ່ສໍາເລັດ',
            text: r.status,
            showConfirmButton: false,
            timer: 3000
          });
                });
            }
        };

        $scope.formatNumber = function(num, dec) {
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


        $scope.uploadedFile = function(element) {
            if (!$scope.issued_no) {
                $scope.files = null;
                alert('ກະລຸນາປ້ອນເລກທີ');
                return;
            }
            $scope.issued_date = $('#issued_date').val();
            if (!$scope.issued_date) {
                $scope.files = null;
                alert('ກະລຸນາປ້ອນວັນທີ');
                return;
            }

            $scope.$apply(function($scope) {
                $scope.files = element.files;
                $http({
                    url: $scope.url + "upload&year=" + $scope.year.id,
                    method: "POST",
                    processData: false,
                    headers: {
            'Content-Type': undefined
          },
                    data: {
                        '_csrf': $('meta[name="csrf-token"]').attr("content"),
                        'issued_no': $scope.issued_no,
                        'issued_date': $scope.issued_date,
                        'issued_by': $scope.issued_by
                    },
                    transformRequest: function(data) {
                        var formData = new FormData();
                        var file = $scope.files[0];
                        formData.append("file_upload", file);
                        angular.forEach(data, function(value, key) {
                            formData.append(key, value);
                        });
                        return formData;
                    }
                }).success(function(data, status, headers, config) {
                    $scope.getreferences();
                    $scope.issued_date = null;
                    $scope.issued_no = null;
                    $scope.issued_by = null;
                    $("input[name='image'], #issued_date").val("");
                    $scope.status = data.status;
                    $scope.formdata = "";
                }).error(function(data, status, headers, config) {
                    $scope.response = data;
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                });
            });
        };

        $scope.getreferences = function () {
            if ($scope.year) {
                $http.get($scope.url + 'getreferences&year=' + $scope.year.id)
                    .then(function(r) {
                        if (r.data)
                            $scope.references = r.data.files;
                    }, function(r) {
                        $scope.response = r;
                        $timeout(function() {
                            $scope.response = null;
                        }, 15000);
                    });
            }
        };

        $scope.deletefile = function (f) {
            if ($scope.year && f) {
                swal({
                    title: "ໝັ້ນໃຈບໍ່?",
                    text: "ເມື່ອລຶບແລ້ວຈະບໍ່ສາມາດເອົາຄືນມາໄດ້",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "ແມ່ນ, ລຶບ",
                    cancelButtonText: "ບໍ່, ບໍ່ລຶບ",
                    closeOnConfirm: true,
                    closeOnCancel: true
                }, function (isConfirm) {
                    if (isConfirm) {
                        $http.post($scope.url + 'deletefile&year=' + $scope.year.id, {
                            'id': f.id,
                            '_csrf': $('meta[name="csrf-token"]').attr("content")
                        }).then(function (r) {
                            $scope.response = r;
                            $scope.getreferences();
                            $timeout(function () {
                                $scope.response = null;
                            }, 15000);
            if (r.status == 200) {
                Swal.fire({
                  position: 'top-end',
                  type: 'success',
                  title: 'ການລຶບສໍາເລັດ',
                  text: r.status,
                  showConfirmButton: false,
                  timer: 3000
                });
              }            }, function (r) {
                            $scope.response = r;
                            $timeout(function () {
                                $scope.response = null;
                            }, 15000);Swal.fire({
                position: 'top-end',
                type: 'error',
                title: 'ການລຶບບໍ່ສໍາເລັດ',
                text: r.status,
                showConfirmButton: false,
                timer: 3000
              });
                        });
                    }
                });
            }
        };
    });
</script>
