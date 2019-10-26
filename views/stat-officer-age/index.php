<?php $_GET['menu']=1;?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerAgeSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຄຸ້ມຄອງລັດຖະກອນ'), 'url' => ['index']];
 $this->title = "ຈຳນວນລັດຖະກອນ ແຍກຕາມເກນອາຍຸ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerAgeController">
    
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()"
                    ng-options="y.year for y in years"></select>
        </div>
        <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
     -->
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">ອາຍຸຕໍ່າກວ່າ 25 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 25 ຫາ 30 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 31 ຫາ 35 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 36 ຫາ 40 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 41 ຫາ 45 ປີ</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i < 10; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_u25"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_u25"
                                       ng-model="model.women_u25"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_25_30"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_25_30"
                                       ng-model="model.women_25_30"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_31_35"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_31_35"
                                       ng-model="model.women_31_35"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_36_40"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_36_40"
                                       ng-model="model.women_36_40"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_41_45"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_41_45"
                                       ng-model="model.women_41_45"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td class="text-center" colspan="2">ອາຍຸ 46 ຫາ 50 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 51 ຫາ 55 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 56 ຫາ 60 ປີ</td>
                            <td class="text-center" colspan="2">ອາຍຸ 61 ປີ ຂຶ້ນໄປ</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <td class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_46_50"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_46_50"
                                       ng-model="model.women_46_50"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_51_55"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_51_55"
                                       ng-model="model.women_51_55"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_56_60"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_56_60"
                                       ng-model="model.women_56_60"></td>
                            <td><input type="number" class="form-control" min="0" ng-model="model.total_61u"></td>
                            <td><input type="number" class="form-control" min="0" max="model.total_61u"
                                       ng-model="model.women_61u"></td>
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
    <div ng-show="model" class="col-sm-12">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card" style="margin-top: 2em;overflow-x: scroll">
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
                                <th class="text-center" colspan="18"
                                    rowspan="2"><?= Yii::t('app', 'Description') ?></th>
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
                                <th rowspan="4">III</th>
                                <th colspan="18"><?= $this->title ?></th>
                                <th class="text-center">
                                    {{model.total_u25 ? model.total_u25 : 0
                                    + model.total_25_30 ? model.total_25_30 : 0
                                    + model.total_31_35 ? model.total_31_35 : 0
                                    + model.total_36_40 ? model.total_36_40 : 0
                                    + model.total_41_45 ? model.total_41_45 : 0
                                    + model.total_46_50 ? model.total_46_50 : 0
                                    + model.total_51_55 ? model.total_51_55 : 0
                                    + model.total_56_60 ? model.total_56_60 : 0
                                    + model.total_61u ? model.total_61u : 0
                                    }}
                                </th>
                                <th class="text-center">
                                    {{
                                    model.women_u25 ? model.women_u25 : 0
                                    + model.women_25_30 ? model.women_25_30 : 0
                                    + model.women_31_35 ? model.women_31_35 : 0
                                    + model.women_36_40 ? model.women_36_40 : 0
                                    + model.women_41_45 ? model.women_41_45 : 0
                                    + model.women_46_50 ? model.women_46_50 : 0
                                    + model.women_51_55 ? model.women_51_55 : 0
                                    + model.women_56_60 ? model.women_56_60 : 0
                                    + model.women_61u ? model.women_61u : 0
                                    }}
                                </th>
                                <th class="text-center">
                                    {{
                                    model.total_u25 ? model.total_u25 : 0
                                    + model.total_25_30 ? model.total_25_30 : 0
                                    + model.total_31_35 ? model.total_31_35 : 0
                                    + model.total_36_40 ? model.total_36_40 : 0
                                    + model.total_41_45 ? model.total_41_45 : 0
                                    + model.total_46_50 ? model.total_46_50 : 0
                                    + model.total_51_55 ? model.total_51_55 : 0
                                    + model.total_56_60 ? model.total_56_60 : 0
                                    + model.total_61u ? model.total_61u : 0
                                    - (model.women_u25 ? model.women_u25 : 0
                                    + model.women_25_30 ? model.women_25_30 : 0
                                    + model.women_31_35 ? model.women_31_35 : 0
                                    + model.women_36_40 ? model.women_36_40 : 0
                                    + model.women_41_45 ? model.women_41_45 : 0
                                    + model.women_46_50 ? model.women_46_50 : 0
                                    + model.women_51_55 ? model.women_51_55 : 0
                                    + model.women_56_60 ? model.women_56_60 : 0
                                    + model.women_61u ? model.women_61u : 0
                                    )}}
                                </th>
                            </tr>
                            <tr>
                                <td class="text-center" colspan="2">ອາຍຸຕໍ່າກວ່າ 25 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 25 ຫາ 30 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 31 ຫາ 35 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 36 ຫາ 40 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 41 ຫາ 45 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 46 ຫາ 50 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 51 ຫາ 55 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 56 ຫາ 60 ປີ</td>
                                <td class="text-center" colspan="2">ອາຍຸ 61 ປີ ຂຶ້ນໄປ</td>
                                <td colspan="3" rowspan="3"></td>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < 18; $i++): ?>
                                    <td class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></td>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <td class="text-center">{{model.total_u25 | number | dash}}</td>
                                <td class="text-center">{{model.women_u25 | number | dash}}</td>
                                <td class="text-center">{{model.total_25_30 | number | dash}}</td>
                                <td class="text-center">{{model.women_25_30 | number | dash}}</td>
                                <td class="text-center">{{model.total_31_35 | number | dash}}</td>
                                <td class="text-center">{{model.women_31_35 | number | dash}}</td>
                                <td class="text-center">{{model.total_36_40 | number | dash}}</td>
                                <td class="text-center">{{model.women_36_40 | number | dash}}</td>
                                <td class="text-center">{{model.total_41_45 | number | dash}}</td>
                                <td class="text-center">{{model.women_41_45 | number | dash}}</td>
                                <td class="text-center">{{model.total_46_50 | number | dash}}</td>
                                <td class="text-center">{{model.women_46_50 | number | dash}}</td>
                                <td class="text-center">{{model.total_51_55 | number | dash}}</td>
                                <td class="text-center">{{model.women_51_55 | number | dash}}</td>
                                <td class="text-center">{{model.total_56_60 | number | dash}}</td>
                                <td class="text-center">{{model.women_56_60 | number | dash}}</td>
                                <td class="text-center">{{model.total_61u | number | dash}}</td>
                                <td class="text-center">{{model.women_61u | number | dash}}</td>
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
<script type="text/javascript" src="js/sweetalert2.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['ui.bootstrap.datetimepicker']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('officerAgeController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-age/';
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
              $scope.model.total_u25 = parseInt($scope.model.total_u25);
              $scope.model.total_25_30 = parseInt($scope.model.total_25_30);
              $scope.model.total_31_35 = parseInt($scope.model.total_31_35);
              $scope.model.total_36_40 = parseInt($scope.model.total_36_40);
              $scope.model.total_41_45 = parseInt($scope.model.total_41_45);
              $scope.model.total_46_50 = parseInt($scope.model.total_46_50);
              $scope.model.total_51_55 = parseInt($scope.model.total_51_55);
              $scope.model.total_56_60 = parseInt($scope.model.total_56_60);
              $scope.model.total_61u = parseInt($scope.model.total_61u);

              $scope.model.women_u25 = parseInt($scope.model.women_u25);
              $scope.model.women_25_30 = parseInt($scope.model.women_25_30);
              $scope.model.women_31_35 = parseInt($scope.model.women_31_35);
              $scope.model.women_36_40 = parseInt($scope.model.women_36_40);
              $scope.model.women_41_45 = parseInt($scope.model.women_41_45);
              $scope.model.women_46_50 = parseInt($scope.model.women_46_50);
              $scope.model.women_51_55 = parseInt($scope.model.women_51_55);
              $scope.model.women_56_60 = parseInt($scope.model.women_56_60);
              $scope.model.women_61u = parseInt($scope.model.women_61u);
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
          }


        }, function (r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);

          Swal.fire({                          
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
              } 

            }, function (r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);

              Swal.fire({
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
