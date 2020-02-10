<?php $_GET['menu']=1;?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOdaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມແຜນການ ແລະ ການຮ່ວມມື'), 'url' => ['index']];
$this->title = "ຕາຕາລາງບັນດາໂຄງການຊ່ວຍເຫຼືອຂອງຕ່າງປະເທດປະຈຳປີ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="statContract">
    
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()"
                    ng-options="y.year for y in years"></select>
        </div>
        <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div> -->
    
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                            <th class="text-center" rowspan="2">ລະຫັດ</th>
                            <th class="text-center" rowspan="2" colspan="2">ໄລຍະຈັດຕັ້ງປະຕິບັດ</th>
                            <th class="text-center" rowspan="2">ມູນຄ່າລວມໂຄງການ</th>
                            <th class="text-center" colspan="2">ປະເພດການຊ່ວຍເຫຼືອ</th>
                            <th class="text-center" rowspan="2">ຊື່ອົງການຜູ້ໃຫ້ທຶນ</th>
                            <th class="text-center" rowspan="2">ງົບປະມານທີ່ໄດ້ຮັບ ປີຜ່ານມາ</th>
                        </tr>
                        <tr>
                            <th class="text-center">ຊ່ວຍລ້າ</th>
                            <th class="text-center">ກູ້ຢືມ</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="text" class="form-control" ng-model="model.name">
                            </td>
                            <td style="width: 10%"><input type="text" class="form-control" ng-model="model.code">
                            </td>
                            <td style="width: 10%"><input type="number" class="form-control"
                                                          ng-model="model.start_year">
                            </td>
                            <td style="width: 10%"><input type="number" class="form-control" ng-model="model.end_year">
                            </td>
                            <td><input type="number" class="form-control" ng-model="model.amount">
                            </td>
                            <td><input style="margin: 0 auto" type="checkbox" ng-checked="model.free == 1"
                                       class="form-control" ng-model="model.free">
                            </td>
                            <td><input type="checkbox" class="form-control" ng-checked="model.loan == 1"
                                       ng-model="model.loan">
                            </td>
                            <td><input type="text" class="form-control" ng-model="model.organisation">
                            </td>
                            <td><input type="number" class="form-control" ng-model="model.receive">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-class="{disabled: !model}"
                            ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-danger col-sm-12" ng-class="{disabled: !model}"
                            ng-click="delete()">
                        <i class="fa fa-trash"></i> <?= Yii::t('app', 'Delete') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-default col-sm-12" ng-click="clear()">
                        <i class="fa fa-refresh"></i> <?= Yii::t('app', 'Cancel') ?>
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
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="2">ລ/ດ</th>
                                <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                                <th class="text-center" rowspan="2">ລະຫັດ</th>
                                <th class="text-center" rowspan="2">ໄລຍະຈັດຕັ້ງປະຕິບັດ</th>
                                <th class="text-center" rowspan="2">ມູນຄ່າລວມໂຄງການ</th>
                                <th class="text-center" colspan="2">ປະເພດການຊ່ວຍເຫຼືອ</th>
                                <th class="text-center" rowspan="2">ຊື່ອົງການຜູ້ໃຫ້ທຶນ</th>
                                <th class="text-center" rowspan="2">ງົບປະມານທີ່ໄດ້ຮັບ ປີຜ່ານມາ</th>
                            </tr>
                            <tr>
                                <th class="text-center">ຊ່ວຍລ້າ</th>
                                <th class="text-center">ກູ້ຢືມ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models" ng-click="select(m)" style="cursor: pointer">
                                <td>{{$index + 1}}</td>
                                <td>{{m.name}}</td>
                                <td class="text-center">{{m.code}}</td>
                                <td class="text-center">{{m.start_year}} - {{m.end_year}}</td>
                                <td class="text-right">{{m.amount | number | dash}}</td>
                                <td class="text-center">{{m.free ? 'P' : ''}}</td>
                                <td class="text-center">{{m.loan ? 'P' : ''}}</td>
                                <td class="text-center">{{m.organisation}}</td>
                                <td class="text-right">{{m.receive | number | dash}}</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="2">ລວມ</th>
                                <th></th>
                                <th></th>
                                <th class="text-right">{{sumcolumn('amount') | number | dash }}</th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th class="text-right">{{sumcolumn('receive') | number | dash }}</th>
                            </tr>
                            </tfoot>
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
  app.controller('statContract', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-oda/';
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
      $scope.models = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.models = r.data.models;
            $scope.getreferences();
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.select = function (m) {
      $scope.model = m;
      $scope.model.start_year = parseInt(m.start_year);
      $scope.model.end_year = parseInt(m.end_year);
      $scope.model.amount = parseInt(m.amount);
      $scope.model.receive = parseInt(m.receive);
      $scope.model.free = parseInt(m.free);
      $scope.model.loan = parseInt(m.loan);
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
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

    $scope.delete = function () {
      if ($scope.model)
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
            $http.post($scope.url + 'delete&year=' + $scope.year.id, {
              'id': $scope.model.id,
              '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function (r) {
              $scope.model = null;
              $scope.response = r;
              $scope.enquiry();
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
    };

    $scope.clear = function () {
      $scope.model = null;
    };

    $scope.sumcolumn = function (key) {
      var s = 0;
      if($scope.models)
      for (var i = 0; i < $scope.models.length; i++)
        if ($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      return s;
    };


    $scope.uploadedFile = function (element) {
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

    $scope.getreferences = function () {
      if ($scope.year) {
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
            }, function (r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });
          }
        });
      }
    };
  });
</script>
