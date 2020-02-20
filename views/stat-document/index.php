<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatDocumentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="statDocument">
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-3">
          <label>ກະຊວງ, ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ</label>
          <select class="form-control" ng-model="model.section" ng-change="inquiry()" ng-options="m.name for m in sections"></select>
        </div>
        <div class="col-sm-3" ng-if="model.section.code=='m'">
          <label><?= Yii::t('app', 'Ministry') ?></label>
          <select class="form-control" ng-model="model.ministry" ng-change="inquiry()" ng-options="m.name for m in ministries"></select>
        </div>
        <div class="col-sm-3" ng-if="model.section.code=='o'">
          <label>ອົງການຈັດຕັ້ງ</label>
          <select class="form-control" ng-model="model.organisation" ng-change="inquiry()" ng-options="m.name for m in organisations"></select>
        </div>
        <div class="col-sm-3" ng-if="model.section.code=='p'">
          <label><?= Yii::t('app', 'Province') ?></label>
          <select class="form-control" ng-model="model.province" ng-change="inquiry()" ng-options="m.province_name for m in provinces"></select>
        </div>
        <div class="col-sm-3" ng-if="model.section.code=='b'">
          <label><?= Yii::t('app', 'Book Type') ?></label>
          <select class="form-control" ng-model="model.book" ng-change="inquiry()" ng-options="m.name for m in books"></select>
        </div>

        <div class="col-sm-12">
          <table class="table table-bordered" style="margin-top: 1em">
            <thead>
              <tr>
                <!-- <th class="text-center" rowspan="2">ປີ 1975 ຄືນຫຼັງ</th> -->
                <th class="text-center" colspan="2">1975 ຄືນ​ຫລັງ</th>
                <th class="text-center" colspan="2">1975 ເຖິງ​ປະຈຸ​ບັນ</th>
              </tr>
              <tr>
                <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                <th class="text-center">ຂໍ້ມູນເພີ່ມໃໝ່</th>
                <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                <th class="text-center">ຂໍ້ມູນເພີ່ມໃໝ່</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <!-- <td><input class="form-control" ng-model="model.before" type="number" min="0"></td> -->
                <td><input class="form-control" ng-model="model.after" type="number" min="0"></td>
                <td><input class="form-control" ng-model="model.after_new" type="number" min="0"></td>
                <td><input class="form-control" ng-model="model.now_before" type="number" min="0"></td>
                <td><input class="form-control" ng-model="model.now_new" type="number" min="0"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-sm-12">
          <label><?= Yii::t('app', 'Remark') ?></label>
          <input type="text" class="form-control" ng-model="model.remark">
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
          <div class="card" style="overflow-x: scroll">
            <div class="card-title-w-btn ">
              <h3><?= $this->title ?> {{year.year}}</h3>
              <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
              </p>
            </div>
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                  <th class="text-center" rowspan="3">ເອກະສານບັນດາກະຊວງ, ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ</th>
                  <th class="text-center" colspan="3">ຈຳນວນເອກະສານປະຫວັດສາດ 1975 ຄືນຫຼັງ</th>
                  <th class="text-center" colspan="3">ຈໍານວນສໍາ​ນວນເອກະສານປະຫວັດສາດ​ 1975 ເຖິງ​ປະຈຸ​ບັນ</th>
                  <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                </tr>
                <tr>
                  <th class="text-center" colspan="3">ປີ {{year.year}}</th>
                  <th class="text-center" colspan="3">ປີ {{year.year}}</th>
                </tr>
                <tr>
                  <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                  <th class="text-center">ຂໍ້ມູນທີ່ເພີ່ມຂຶ້ນໃໝ່</th>
                  <th class="text-center">ລວມທັງໝົດ</th>
                  <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                  <th class="text-center">ຂໍ້ມູນທີ່ເພີ່ມຂຶ້ນໃໝ່</th>
                  <th class="text-center">ລວມທັງໝົດ</th>
                </tr>
              </thead>
              <tbody ng-repeat="model in models">
                <tr>
                  <th colspan="9" class="text-center" style="background-color: #dcd18b">{{model.name}}
                  </th>
                </tr>
                <tr ng-repeat="m in model.details">
                  <td class="text-center">{{$index + 1}}</td>
                  <td>{{m.name}}</td>
                  <!-- <td class="text-center">{{m.before | number | dash}}</td> -->
                  <td class="text-center">{{m.after | number | dash}}</td>
                  <td class="text-center">{{m.after_new | number | dash}}</td>
                  <td class="text-center">{{m.after*1 + m.after_new*1 | number | dash}}</td>
                  <td class="text-center">{{m.now_before | number | dash}}</td>
                  <td class="text-center">{{m.now_new | number | dash}}</td>
                  <td class="text-center">{{m.now_before*1 + m.now_new*1 | number | dash}}</td>
                  <td>{{m.remark}}</td>
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
              <input class="form-control datepicker" data-ng-model="$parent.issued_date" type="text">
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
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('statDocument', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-document/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $scope.sections = [{
        'code': 'm',
        'name': 'ກະຊວງ ອົງການທຽນເທົ່າ'
      },
      {
        'code': 'o',
        'name': 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ'
      },
      {
        'code': 'p',
        'name': 'ແຂວງ'
      },
      {
        'code': 'b',
        'name': 'ປະເພດປຶ້ມ'
      }
    ];
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
        $scope.ministries = r.data.ministries;
        $scope.organisations = r.data.organisations;
        $scope.books = r.data.books;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.section = null;
      $scope.models = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          r.data.models.forEach(function(d) {
            d.after = parseInt(d.after);
            d.after_new = parseInt(d.after_new);
            d.now_before = parseInt(d.now_before);
            d.now_new = parseInt(d.now_new);
          });
          $scope.models = r.data.models;
          $scope.getreferences();
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.inquiry = function() {
      if ($scope.model.section.code == 'm' && !$scope.model.ministry) return;
      if ($scope.model.section.code == 'o' && !$scope.model.organisation) return;
      if ($scope.model.section.code == 'p' && !$scope.model.province) return;
      if ($scope.model.section.code == 'b' && !$scope.model.book) return;

      if ($scope.year) {
        $scope.model.before = null;
        $scope.model.after = null;
        $scope.model.after_new = null;
        $scope.model.remark = null;

        var u = $scope.url + 'inquiry&year=' + $scope.year.id;
        if ($scope.model.section.code == 'm' && $scope.model.ministry) u += '&ministry=' + $scope.model.ministry.id;
        if ($scope.model.section.code == 'o' && $scope.model.organisation) u += '&organisation=' + $scope.model.organisation.id;
        if ($scope.model.section.code == 'p' && $scope.model.province) u += '&province=' + $scope.model.province.id;
        if ($scope.model.section.code == 'b' && $scope.model.book) u += '&book=' + $scope.model.book.id;

        $http.get(u)
          .then(function(r) {
            if (r.data.model) {
              $scope.model.before = parseInt(r.data.model.before);
              $scope.model.after = parseInt(r.data.model.after);
              $scope.model.after_new = parseInt(r.data.model.after_new);
              $scope.model.now_before = parseInt(r.data.model.now_before);
              $scope.model.now_new = parseInt(r.data.model.now_new);
              $scope.model.remark = r.data.model.remark;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function() {
              $scope.response = null;
            }, 15000);
          });
      }
    };

    $scope.save = function() {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
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


        }, function(r) {
          $scope.response = r;
          $timeout(function() {
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

    $scope.uploadedFile = function(element) {
      if (!$scope.issued_no) {
        $scope.files = null;
        alert('ກະລຸນາປ້ອນເລກທີ');
        return;
      }
      $scope.issued_date = $('.datepicker').val();
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
          $("input[name='image'], .datepicker").val("");
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

    $scope.getreferences = function() {
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

    $scope.deletefile = function(f) {
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
        }, function(isConfirm) {
          if (isConfirm) {
            $http.post($scope.url + 'deletefile&year=' + $scope.year.id, {
              'id': f.id,
              '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function(r) {
              $scope.response = r;
              $scope.getreferences();
              $timeout(function() {
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


            }, function(r) {
              $scope.response = r;
              $timeout(function() {
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