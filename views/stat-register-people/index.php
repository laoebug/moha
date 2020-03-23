<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatRegisterPeopleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ການຈົດທະບຽນພົນລະເມືອງ";
?>
<div class="row" ng-app="mohaApp" ng-controller="statRegisterPeopleController">
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>

  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th class="text-center">ເກີດ</th>
              <th class="text-center">ເສຍຊີວິດ</th>
              <th class="text-center">ແຕ່ງດອງ ລາວ-ລາວ</th>
              <th class="text-center">ຢ່າຮ້າງ ລາວ-ລາວ</th>
              <th class="text-center">ຍ້າຍມາ</th>
              <th class="text-center">ຍ້າຍອອກ</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.born" />
              </td>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.die" />
              </td>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.married_laolao" />
              </td>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.divorce_laolao" />
              </td>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.movein" />
              </td>
              <td class="text-center">
                <input class="form-control" type="number" ng-model="model.moveout" />
              </td>
            </tr>
          </tbody>
        </table>

        <div class="col-sm-2" style="margin-top: 1em">
          <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
    <div class="bs-component card">
      <div class="card-title-w-btn " ng-if="year">
        <h3><?= $this->title ?> {{year.year}}</h3>
        <p class="hidden">
          <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
          <a class="btn btn-info" target="_blank" href="{{url}}download"><i class="fa fa-download fa-2x"></i></a>
        </p>
      </div>
      <table class="table table-bordered table-hover" ng-if="model">
        <thead>
          <tr>
            <th style="width: 16%" class="text-center">ເກີດ</th>
            <th style="width: 16%" class="text-center">ເສຍຊີວິດ</th>
            <th style="width: 16%" class="text-center">ແຕ່ງດອງ ລາວ-ລາວ</th>
            <th style="width: 16%" class="text-center">ຢ່າຮ້າງ ລາວ-ລາວ</th>
            <th style="width: 16%" class="text-center">ຍ້າຍມາ</th>
            <th style="width: 16%" class="text-center">ຍ້າຍອອກ</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-center">{{model.born | number | dash}}</td>
            <td class="text-center">{{model.die | number | dash}}</td>
            <td class="text-center">{{model.married_laolao | number | dash}}</td>
            <td class="text-center">{{model.divorce_laolao | number | dash}}</td>
            <td class="text-center">{{model.movein | number | dash}}</td>
            <td class="text-center">{{model.moveout | number | dash}}</td>
          </tr>
        </tbody>
      </table>

      <canvas id="stat" chart-options="chartoption" class="chart chart-bar" chart-data="stat.data" chart-labels="stat.labels" chart-series="stat.series">
      </canvas>
    </div>
  </div>
</div>

<script type="text/javascript" src="js/sweetalert2.js"></script>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['chart.js']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('statRegisterPeopleController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-register-people/';
    $scope.mode = 'read';
    $scope.chartoption = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    };
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

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

    $scope.enquiry = function() {
      $scope.model = null;
      $scope.stat = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.model = r.data.model;
          $scope.model.born = parseInt($scope.model.born);
          $scope.model.die = parseInt($scope.model.die);
          $scope.model.married_laolao = parseInt($scope.model.married_laolao);
          $scope.model.divorce_laolao = parseInt($scope.model.divorce_laolao);
          $scope.model.movein = parseInt($scope.model.movein);
          $scope.model.moveout = parseInt($scope.model.moveout);
          $scope.stat = r.data.stat;
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
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