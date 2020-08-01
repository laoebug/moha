<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ)";
?>

<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statGovermentUnitController">

  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>

  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-2 hidden">
          <label for=""><?= Yii::t('app', 'Group') ?></label>
          <select class="form-control" ng-model="ministrygroup" ng-options="g.name for g in ministrygroups"></select>
        </div>
        <div class="col-sm-2">
          <label for="">ພາກສ່ວນຕ່າງໆ</label>
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
          <label for=""><?= Yii::t('app', 'Center') ?></label>
          <input type="number" min="0" class="form-control" ng-model="center">
        </div>

        <div class="col-sm-2">
          <label for="">ສະຖາບັນ</label>
          <input type="number" min="0" class="form-control" ng-model="insitute">
        </div>

        <div class="col-sm-2">
          <label for="">ພະແນກ</label>
          <input type="number" min="0" class="form-control" ng-model="division">
        </div>

        <div class="col-sm-12">
          <label for="">ໝາຍເຫດ</label>
          <input type="text" class="form-control"  ng-model="remark" >
        </div>

        <div class="col-sm-2" style="margin-top: 1em"  ng-show="!id">
          <button type="button" class="btn btn-primary col-sm-12" ng-click="save(1)">
            <i class="fa fa-save"></i> ບັນທຶກ
          </button>
        </div>

        
        <div class="col-sm-2" style="margin-top: 1em" ng-show="id"> 

          <button type="button" class="btn btn-info col-sm-12" ng-click="save(0)">
            <i class="fa fa-save"></i> ແກ້ໄຂ
          </button>
        </div>

        <div class="col-sm-2" style="margin-top: 1em">

          <button type=" button" class="btn btn-danger col-sm-12" ng-click="delete(0)">
            <i class="fa fa-trash"></i> ລຶບ
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
            <!-- <div class="col-sm-12" style="margin-top: 2em" ng-bind-html="result"></div> -->


            <!-- Start -->
            <div class="col-sm-12" style="margin-top: 2em">


              <div class="card">
                <div class="card-title-w-btn ">
                  <h3 class="title">ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ) {{year.year}}</h3>
                  <p class="hidden-print">
                    <a class="btn btn-default" target="_blank" href="index.php?r=stat-goverment-unit/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="index.php?r=stat-goverment-unit/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                  </p>
                </div>
                <div class="card-body">
                  <table class="table table-responsive table-bordered table-hover">
                    <thead>
                      <tr>
                        <th class="text-center" style="width: 20px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center">ພາກສ່ວນຕ່າງໆ</th>
                        <?php foreach (['ຫ້ອງການ', 'ກົມ', 'ສູນ', 'ສະຖາບັນ', 'ພະແນກ'] as $item) : ?>
                          <th class="text-center" style="width: 10%"><?= $item ?></th>
                        <?php endforeach; ?>
                        <th class="text-center">ໝາຍເຫດ</th>
                      </tr>
                    </thead>
                    <tbody>

                      <tr ng-repeat="model in models | orderBy:model.position:false" ng-click="select(ministry)" style="cursor:pointer;">
                        <td class="text-center">{{$index+1}}</td>
                        <td class="text-left">{{model.name}}</td>
                        <td class="text-center">{{model.office}}</td>
                        <td class="text-center">{{model.department}}</td>
                        <td class="text-center">{{model.center}}</td>
                        <td class="text-center">{{model.insitute}}</td>
                        <td class="text-center">{{model.division}}</td>
                        <td class="text-center">{{model.remark}}</td>
                      </tr>

                    </tbody>
                    <tfoot>
                      <tr>
                        <td colspan="2">ລວມ</td>
                        <td class="text-center"><strong>{{sum('office')}}</strong></td>
                        <td class="text-center"><strong>{{sum('department')}}</strong></td>
                        <td class="text-center"><strong>{{sum('center')}}</strong></td>
                        <td class="text-center"><strong>{{sum('insitute')}}</strong></td>
                        <td class="text-center"><strong>{{sum('division')}}</strong></td>
                        <td class="text-center">&nbsp;</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>


            </div>
            <!-- End -->

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
                      <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a></td>
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

  app.controller('statGovermentUnitController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-goverment-unit/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
        $scope.references = r.data.references;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.sum = function(key) {
      var total = 0;
      if ($scope.models) {        
        for (var n = 0; n < $scope.models.length; n++) {
          if ($scope.models[n][key]) {
            total += parseInt($scope.models[n][key]);
          }
        }
      }
      return total == 0 ? 0 : total;
    };


    $scope.enquiry = function() {
      $scope.result = null;
      $scope.ministries = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {          
          $scope.ministries = r.data.ministries;
          $scope.models = r.data.models;
          console.log(r);
          $scope.getreferences();
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };
    $scope.clear = function(){
      $scope.ministry.id=null;
      $scope.office = "";
      $scope.department = "";
      $scope.division = "";
      $scope.insitute = "";
      $scope.center = "";
      $scope.remark = "";
    }
    
    $scope.inquiry = function() {
      if ($scope.ministry)
        $http.get($scope.url + 'inquiry&ministry=' + $scope.ministry.id + '&year=' + $scope.year.id)
        .then(function(r) {
               
          $scope.office = parseInt(r.status == 200 ? r.data.office : "");
          $scope.department = parseInt(r.status == 200 ? r.data.department : "");
          $scope.division = parseInt(r.status == 200 ? r.data.division : "");
          $scope.insitute = parseInt(r.status == 200 ? r.data.insitute : "");
          $scope.center = parseInt(r.status == 200 ? r.data.center : "");
          $scope.remark = r.status == 200 ? r.data.remark : "";
          $scope.id = r.data.id;
          
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
      else {
        $scope.office = "";
        $scope.department = "";
        $scope.division = "";
        $scope.insitute = "";
        $scope.center = "";
        $scope.remark = "";
      }
    };
    
    $scope.reload = function() {
      $scope.enquiry();
      $scope.inquiry();
      $scope.clear();
    }
    $scope.save = function(saveOrUpdate) {        
      if ($scope.year && $scope.ministry) {
        
        $http.post($scope.url + 'save', {
          'saveOrUpdate':saveOrUpdate,
          'year': $scope.year.id,
          'ministry': $scope.ministry.id,
          'office': $scope.office,
          'department': $scope.department,
          'division': $scope.division,
          'insitute': $scope.insitute,
          'center': $scope.center,
          'remark': $scope.remark,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.response = r;
          
          $scope.reload();
          $timeout(function() {
            $scope.response = null;
          }, 15000);

          Swal.fire({
            position: 'top-end',
            type: 'success',
            title: 'ການບັນທຶກສໍາເລັດ',
            text: r.status + " " + r.statusText,            
            showConfirmButton: false,
            timer: 3000
          });
          $scope.reload();

          
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);

          Swal.fire({
            position: 'top-end',
            type: 'error',
            title: 'ການບັນທຶກບໍ່ສໍາເລັດ',
            text: r.status + " " + r.statusText,
            showConfirmButton: false,
            timer: 3000
          });
        });
      }
    };

    $scope.uploadedFile = function(element) {
      if (!$scope.issued_no) {
        $scope.files = null;
        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນເລກທີ'
        });
        return;
      }
      $scope.issued_date = $('#issued_date').val();
      if (!$scope.issued_date) {
        $scope.files = null;
        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນວັນທີ'
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


    $scope.delete = function() {
      var url = 'index.php?r=stat-goverment-unit/';
      
      if ($scope.id)
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
            $http.post(url + 'delete', {
              'id': $scope.id,
              '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function(r) {
              $timeout(function() {
                $scope.response = null;
              }, 15000);
              if (r.status == 200) {
                $scope.reload();
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
                title: 'ການບັນທຶກບໍ່ສໍາເລັດ',
                text: r.status + '  ' + r.statusText,
                showConfirmButton: false,
                timer: 3000
              });


            });
          }
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