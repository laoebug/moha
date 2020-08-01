<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ'), 'url' => ['index']];
$this->title = 'ສະຖິຕິໜ່ວຍງານຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ';
// $this->params['breadcrumbs'][] = $this->title;
?>

<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="singleGatewayController">

  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div> -->

  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
        ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="row">
          <div class="col-sm-3">
            <label for=""><?= Yii::t('app', 'Ministry') ?></label>
            <select ng-change="inquiry()" class="form-control" ng-model="selected.ministry" ng-options="m.name for m in ministries">
            </select>
          </div>
          <div class="col-sm-3">
            <label for=""><?= Yii::t('app', 'Start Date') ?></label>
            <input class="form-control datepicker" data-ng-model="$parent.selected.start_date" type="text">
          </div>
          <div class="col-sm-3">
            <label for=""><?= Yii::t('app', 'Service Unit Name') ?></label>
            <input type="text" class="form-control" ng-model="selected.name">
          </div>
          <div class="col-sm-3">
            <label for=""><?= Yii::t('app', 'Remark') ?></label>
            <input type="text" class="form-control" ng-model="selected.remark">
          </div>
        </div>
        <div class="col-sm-2" style="margin-top: 2em">
          <button type="button" class="btn btn-info col-sm-12" ng-click="save()">
            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
          </button>
        </div>
        <div class="col-sm-2" style="margin-top: 2em">
          <button ng-if="selected" type="button" class="btn btn-danger col-sm-12" ng-click="delete()">
            <i class="fa fa-trash"></i> <?= Yii::t('app', 'Delete') ?>
          </button>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-12" ng-show="models" style="margin-top: 2em">
    <div class="bs-component card">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
        <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade active in" id="table">
          <div class="card">
            <div class="card-title-w-btn ">
              <h3 class="title"><?= $this->title ?> ({{year.year}})</h3>
              <p class="hidden-print">
                <a class="btn btn-default" target="_blank" href="index.php?r=stat-single-gateway-implementation/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="index.php?r=stat-single-gateway-implementation/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
              </p>
            </div>
            <div class="card-body">
              <table class="table table-responsive table-bordered table-hover">
                <thead>
                  <tr>
                    <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Ministry') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Start Date') ?></th>
                    <th class="text-center">ຊື່ໜ່ວຍງານ</th>
                    <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                  </tr>
                </thead>
                <tbody>
                  <tr ng-repeat="m in models" style="cursor:pointer;" ng-click="select(m)">
                    <td>{{$index + 1}}</td>
                    <td>{{m.name}}</td>
                    <td class="text-center">{{m.start_date | dash}}</td>
                    <td class="text-center">{{m.servicename | dash}}</td>
                    <td>{{m.remark}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
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
                                            <td class="text-center">{{(f.issued_by=='undefined')?'':f.issued_by}}</td>
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
  app.controller('singleGatewayController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-single-gateway-implementation/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.selected = null;
      $scope.models = null;
      $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
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
      if ($scope.selected.ministry)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&ministry=' + $scope.selected.ministry.id)
        .then(function(r) {
          if (r.data.model)
            if (r.data.model.start_date)
              $(".datepicker").val(r.data.model.start_date);
            else
              $(".datepicker").val("");
          else
            $(".datepicker").val("");

          if (r.data.model) {
            $scope.selected.name = r.data.model.name;
            $scope.selected.remark = r.data.model.remark;
          } else {
            $scope.selected.name = null;
            $scope.selected.remark = null;
            $scope.selected.start_date = null;
          }
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.select = function(m) {
      $scope.selected = {};
      for (var i in $scope.ministries) {
        var ministry = $scope.ministries[i];
        if (m.id === ministry.id) {
          $scope.selected.ministry = ministry;
          $scope.inquiry();
          break;
        }
      }
    };

    $scope.save = function() {
      $scope.selected.start_date = $(".datepicker").val();
      $http.post($scope.url + 'save&year=' + $scope.year.id, {
        Model: $scope.selected,
        '_csrf': $('meta[name="csrf-token"]').attr("content")
      }).then(function(r) {
        $scope.response = r;
        $scope.selected = null;
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
    };

    $scope.delete = function() {
      if ($scope.selected) {
        $http.post($scope.url + 'delete', {
            'id': $scope.selected.id
          })
          .then(function(r) {
            $scope.selected = null;
            $scope.enquiry();
          }, function(r) {
            $scope.response = r;
            $timeout(function() {
              $scope.response = null;
            }, 15000);
          });
      }
    };


    $scope.uploadedFile = function(element) {
      if (!$scope.issued_no) {
        $scope.files = null;
        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນເລກທີ',

        });
        return;
      }
      $scope.issued_date = $('#issued_date').val();
      if (!$scope.issued_date) {
        $scope.files = null;

        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນວັນທີ',

        });
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
        }).then(
          function(r) {

            $scope.getreferences();
            $scope.issued_date = null;
            $scope.issued_no = null;
            $scope.issued_by = null;
            $("input[name='image'], #issued_date").val("");
            $scope.status = r.status;
            $scope.formdata = "";
            Swal.fire({
              position: 'top-end',
              type: 'success',
              title: 'ອັບໂຫລດຟາຍສໍາເລັດ',
              text: r.status + " " + r.statusText,
              showConfirmButton: false,
              timer: 3000
            });
          },
          function(r) {
            $scope.response = r;
            Swal.fire({
              position: 'top-end',
              type: 'error',
              title: 'ອັບໂຫລດຟາຍບໍ່ສໍາເລັດ',
              text: r.status + " " + r.statusText,
              showConfirmButton: false,
              timer: 3000
            });
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
                  text: r.status + " " + r.statusText,
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
                text: r.status + " " + r.statusText,
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