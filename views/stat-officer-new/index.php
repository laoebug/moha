<?php $_GET['menu']=1;?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerNewSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ'), 'url' => ['index']];
$this->title = "ຈຳນວນລັດຖະກອນເພີ່ມເຂົ້າໃໝ່ ໃນຮູບການຕ່າງໆ ແລະ ແຜນຄວາມຕ້ອງການ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="statOfficerNew">
    <!-- <div class="col-sm-12"> -->
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
    </div> -->
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-4">
                    <label>ພາກສ່ວນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()"
                            ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                            <!--                            <th class="text-center" rowspan="3">ໂກຕາທີ່ໄດ້ຮັບ</th>-->
                            <th class="text-center" rowspan="3">ຄວາມຕ້ອງການໃໝ່</th>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-center">ຮັບເຂົ້າໃໝ່</th>
                            <th colspan="2" class="text-center">ມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                            <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <th class="text-center"><?= $i % 2 == 0 ? 'ລ' : 'ຍ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.new_total"></td>
                            <td><input type="number" class="form-control" min="{{model.new_total}}"
                                       ng-model="model.new_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.ministry_total"></td>
                            <td><input type="number" class="form-control" min="{{model.ministry_total}}"
                                       ng-model="model.ministry_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.army_total"></td>
                            <td><input type="number" class="form-control" min="{{model.army_total}}"
                                       ng-model="model.army_women"></td>
                            <td><input type="number" class="form-control" ng-model="model.soe_total"></td>
                            <td><input type="number" class="form-control" min="{{model.soe_total}}"
                                       ng-model="model.soe_women"></td>
                            <!--                            <td><input type="number" class="form-control" ng-model="model.quota"></td>-->
                            <td><input type="number" class="form-control" ng-model="model.need"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-3" style="margin-top: 1em">
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
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                        class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="3">ພາກສ່ວນຕ່າງໆ</th>
                                <th class="text-center" rowspan="2" colspan="2">ລວມທັງໝົດ</th>
                                <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                                <!--                                <th class="text-center" rowspan="3">ໂກຕາທີ່ໄດ້ຮັບ</th>-->
                                <th class="text-center" rowspan="3">ຄວາມຕ້ອງການໃໝ່</th>
                            </tr>
                            <tr>
                                <th colspan="2" class="text-center">ຮັບເຂົ້າໃໝ່</th>
                                <th colspan="2" class="text-center">ມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                                <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                                <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < 10; $i++): ?>
                                    <th class="text-center"><?= $i % 2 == 0 ? 'ລ' : 'ຍ' ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <th class="text-center">ກະຊວງພາຍໃນ</th>
                                <th class="text-center">{{sumtotal('total') | number | dash}}</th>
                                <th class="text-center">{{sumtotal('women') | number | dash}}</th>
                                <?php foreach (["new", "ministry", "army", "soe"] as $c): ?>
                                    <th class="text-center">{{sumcolumn('<?= $c ?>_total') | number | dash}}</th>
                                    <th class="text-center">{{sumcolumn('<?= $c ?>_women') | number | dash}}</th>
                                <?php endforeach; ?>
                                <!--                                <th class="text-center">{{sumcolumn('quota') | number | dash}}</th>-->
                                <th class="text-center">{{sumcolumn('need') | number | dash}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models">
                                <td>{{m.name}}</td>
                                <td class="text-center">{{sumrow(m, 'total') | number | dash}}</td>
                                <td class="text-center">{{sumrow(m, 'women') | number | dash}}</td>
                                <td class="text-center">{{m.new_total | number | dash}}</td>
                                <td class="text-center">{{m.new_women | number | dash}}</td>
                                <td class="text-center">{{m.ministry_total | number | dash}}</td>
                                <td class="text-center">{{m.ministry_women | number | dash}}</td>
                                <td class="text-center">{{m.army_total | number | dash}}</td>
                                <td class="text-center">{{m.army_women | number | dash}}</td>
                                <td class="text-center">{{m.soe_total | number | dash}}</td>
                                <td class="text-center">{{m.soe_women | number | dash}}</td>
                                <!--                                <td class="text-center">{{m.quota | number | dash}}</td>-->
                                <td class="text-center">{{m.need | number | dash}}</td>
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
  app.controller('statOfficerNew', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-new/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.levels = r.data.levels;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.inquiry = function () {
      if ($scope.year && $scope.model.level)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&level=' + $scope.model.level.id)
            .then(function (r) {
                if (r.data.model) {
                    $scope.model.new_total = parseInt(r.data.model.new_total);
                    $scope.model.new_women = parseInt(r.data.model.new_women);
                    $scope.model.ministry_total = parseInt(r.data.model.ministry_total);
                    $scope.model.ministry_women = parseInt(r.data.model.ministry_women);
                    $scope.model.army_total = parseInt(r.data.model.army_total);
                    $scope.model.army_women = parseInt(r.data.model.army_women);
                    $scope.model.soe_total = parseInt(r.data.model.soe_total);
                    $scope.model.soe_women = parseInt(r.data.model.soe_women);
                    // $scope.model.quota = parseInt(r.data.model.quota);
                    $scope.model.need = parseInt(r.data.model.need);
                } else {
                    $scope.model.new_total = null;
                    $scope.model.new_women = null;
                    $scope.model.ministry_total = null;
                    $scope.model.ministry_women = null;
                    $scope.model.army_total = null;
                    $scope.model.army_women = null;
                    $scope.model.soe_total = null;
                    $scope.model.soe_women = null;
                    // $scope.model.quota = null;
                    $scope.model.need = null;
                }
            }, function (r) {
                $scope.response = r;
                $timeout(function () {
                    $scope.response = null;
                }, 15000);
            });
    };

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

    $scope.sumcolumn = function (key) {
      var s = 0;
      if($scope.models)
      for (var i = 0; i < $scope.models.length; i++)
        if ($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      return s;
    };

    $scope.sumrow = function (m, key) {
      var s = 0;
      if (key == "total") {
        if (m.new_total) s += parseInt(m.new_total);
        if (m.ministry_total) s += parseInt(m.ministry_total);
        if (m.army_total) s += parseInt(m.army_total);
        if (m.soe_total) s += parseInt(m.soe_total);
      } else if (key == "women") {
        if (m.new_women) s += parseInt(m.new_women);
        if (m.ministry_women) s += parseInt(m.ministry_women);
        if (m.army_women) s += parseInt(m.army_women);
        if (m.soe_women) s += parseInt(m.soe_women);
      }

      return s;
    };

    $scope.sumtotal = function (key) {
      var s = 0;
      if (key == 'total') {
        s = $scope.sumcolumn('new_total')
          + $scope.sumcolumn('ministry_total')
          + $scope.sumcolumn('army_total')
          + $scope.sumcolumn('soe_total');
      } else if (key == 'women') {
        s = $scope.sumcolumn('new_women')
          + $scope.sumcolumn('ministry_women')
          + $scope.sumcolumn('army_women')
          + $scope.sumcolumn('soe_women');
      }
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
