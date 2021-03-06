<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = 'ສະຖິຕິອົງການບໍຫານລັດທີ່ໄດ້ຈັດຕັ້ງປະຕິບັດກົນໄກການບໍລິການຜ່ານປະຕູດຽວ ປະຈຳປີ';
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="singleGatewayController">

    <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
    <div class="col-sm-4">
        <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
    </div>


    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
            <input type="hidden"  ng-model="id">
                <div class="row">
                    <div class="col-sm-2">
                        <label for="">ຂັ້ນ</label>
                        <select  class="form-control" ng-model="selected.type" ng-options="m.name for m in levels">
                        </select>
                    </div>
                    <div class="col-sm-2" ng-if="selected.type.id === 'ministry'">
                        <label for="">ກະຊວງ</label>
                        <select ng-change="inquiry()" class="form-control" ng-model="selected.ministry" ng-options="m.name for m in ministries">
                        </select>
                    </div>
                    <div class="col-sm-2" ng-if="selected.type.id === 'province'">
                        <label for="">ແຂວງ</label>
                        <select ng-change="inquiry()" class="form-control" ng-model="selected.province" ng-options="m.province_name for m in provinces">
                        </select>
                    </div>

                    <div class="col-sm-2" ng-if="selected.type.id === 'ministry'">
                        <label for="">ຂັ້ນກົມ</label>
                        <input type="number" class="form-control" ng-model="selected.total_department">
                    </div>
                    <div class="col-sm-2" ng-if="selected.type.id === 'province'">
                        <label for="">ຂັ້ນແຂວງ</label>
                        <input type="number" class="form-control" ng-model="selected.total_province">
                    </div>
                    <div class="col-sm-2" ng-if="selected.province.id">
                        <label for="">ຂັ້ນເມືອງ</label>
                        <input type="number" class="form-control" ng-model="selected.total_district">
                    </div>

                    <div class="col-sm-2">
                        <label for="">ຊື່ຈຸດບໍລິການຜ່ານປະຕູດຽວ</label>
                        <input type="text" class="form-control" ng-model="selected.name">
                    </div>
                    <div class="col-sm-2">
                        <label for="">ປີຈັດຕັ້ງປະຕິບັດ</label>
                        <input class="form-control" ng-model="selected.year" type="text">
                    </div>
                    
                </div>

                <div class="col-sm-2" style="margin-top: 1em" ng-show="!id">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save(1)">
                        <i class="fa fa-save"></i> ບັນທຶກ
                    </button>
                </div>



                <div class="col-sm-2" style="margin-top: 1em" ng-show="id">

                    <button type="button" class="btn btn-info col-sm-12" ng-click="save(0)">
                        <i class="fa fa-save"></i> ແກ້ໄຂ
                    </button>
                </div>

                <div class="col-sm-2" style="margin-top: 1em" ng-show="id">

                    <button type=" button" class="btn btn-danger col-sm-12" ng-click="delete(0)">
                        <i class="fa fa-trash"></i> ລຶບ
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
                            <h3 class="title"><?= $this->title ?> {{year.year}}</h3>
                            <p class="hidden-print">
                                <a class="btn btn-default" target="_blank" href="index.php?r=stat-single-window/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="index.php?r=stat-single-window/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th colspan="6">ຂັ້ນສູນກາງ ແລະ ຂັ້ນທ້ອງຖິ່ນ</th>
                                    </tr>
                                    <tr>
                                        <th colspan="6">I. ຂັ້ນສູນກາງ</th>
                                    </tr>
                                    <tr>
                                        <th style="width: 10px">ລ/ດ</th>
                                        <th class="text-center">ຊື່ກະຊວງ</th>
                                        <th class="text-center" colspan="2">ຂັ້ນກົມ</th>
                                        <th class="text-center">ຊື່ຈຸດບໍລິການຜ່ານປະຕູດຽວ</th>
                                        <th class="text-center">ປີຈັດຕັ້ງປະຕິບັດ</th>
                                    </tr>
                                </thead>
                                <tbody ng-if="models.ministries">
                                    <tr ng-repeat="m in models.ministries" style="cursor:pointer;">
                                        <td>{{$index + 1}}</td>
                                        <td>{{m.name}}</td>
                                        <td class="text-center" colspan="2">{{m.department | dash}}</td>
                                        <td class="text-center">{{m.servicename | dash}}</td>
                                        <td class="text-center">{{m.year | dash}}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" colspan="2">ລວມ</th>
                                        <th colspan="2" class="text-center">{{sum(models.ministries, 'department') | number
                                        | dash}}
                                        </th>

                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>

                                        

                                    </tr>
                                </tbody>

                                <thead>
                                    <tr>
                                        <th colspan="6">II. ຂັ້ນທ້ອງຖິ່ນ</th>
                                    </tr>
                                    <tr>
                                        <th style="width: 10px">ລ/ດ</th>
                                        <th class="text-center">ຊື່ແຂວງ</th>
                                        <th class="text-center">ຂັ້ນແຂວງ (ພະແນກ)</th>
                                        <th class="text-center">ຂັ້ນເມືອງ</th>
                                        <th class="text-center">ຊື່ຈຸດບໍລິການຜ່ານປະຕູດຽວ</th>
                                        <th class="text-center">ປີຈັດຕັ້ງປະຕິບັດ</th>
                                    </tr>
                                </thead>
                                <tbody ng-if="models.provinces">
                                    <tr ng-repeat="m in models.provinces" style="cursor:pointer;">
                                        <td>{{$index + 1}}</td>
                                        <td>{{m.province_name}}</td>
                                        <td class="text-center">{{m.province | number | dash}}</td>
                                        <td class="text-center">{{m.district | number | dash}}</td>
                                        <td class="text-center">{{m.servicename | dash}}</td>
                                        <td class="text-center">{{m.year | dash}}</td>
                                    </tr>
                                    <tr>
                                        <th class="text-center" colspan="2">ລວມ</th>
                                        <th class="text-center">{{sum(models.provinces, 'province') | number | dash}}</th>
                                        <th class="text-center">{{sum(models.provinces, 'district') | number | dash}}</th>
                                        <th>&nbsp;</th>
                                        <th>&nbsp;</th>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="reference">

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
        
        $scope.url = 'index.php?r=stat-single-window/';
        $scope.mode = 'read';
        $scope.selected = {
            type: 'ministry'
        };
        $scope.levels = [{
            id: 'ministry',
            name: 'ຂັ້ນສູນກາງ'
        }, {
            id: 'province',
            name: 'ຂັ້ນທ້ອງຖິ່ນ'
        }];
        $scope.changemode = function() {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };
        $http.get($scope.url + 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.ministries = r.data.ministries;
                $scope.provinces = r.data.provinces;
            }, function(r) {
                $scope.response = r;
                $timeout(function() {
                    $scope.response = null;
                }, 15000);
            });
        $scope.sum = function(items, key) {
            var sum = 0;
            if (items)
                for (let i = 0; i < items.length; i++) {
                    if (items[i][key]) {
                        sum += parseInt(items[i][key]);
                    }
                }
            return sum;
        };

        $scope.enquiry = function() {
            $scope.selected = null;
            $scope.models = null;
            $scope.id = null;
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
            
            $scope.selected.name = null;
            $scope.selected.year = null;
            $scope.selected.total_department = null;
            $scope.selected.total_province = null;
            $scope.selected.total_district = null;
            if ($scope.selected.type.id === 'ministry') $scope.selected.province = null;
            else $scope.selected.ministry = null;
            
            $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&' + 'level='+$scope.selected.type.id+'&'+'ministry_or_province_id='+ $scope.selected[$scope.selected.type.id].id)
                .then(function(r) {                    
                    if (r.data.model) {
                        if(r.data && r.data.model.id){
                        $scope.id= r.data.model.id;                                                
                    }
                        $scope.selected.name = r.data.model.name;
                        $scope.selected.year = r.data.model.year;
                        $scope.selected.total_department = parseInt(r.data.model.department);
                        $scope.selected.total_province = parseInt(r.data.model.province);
                        $scope.selected.total_district = parseInt(r.data.model.district);
                    }
                }, function(r) {
                    $scope.response = r;
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                });
        };

        $scope.save = function() {
            $scope.selected.start_date = $(".datepicker").val();
            $http.post($scope.url + 'save&year=' + $scope.year.id, {
                Model: $scope.selected,
                '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function(r) {
                $scope.response = r;
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

                $scope.selected = null;
                $scope.enquiry();
                $timeout(function() {
                    $scope.response = null;
                }, 15000);
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



        $scope.delete = function() {
            
            if ($scope.id) {
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
                        $http.post($scope.url + 'delete', {
                            'id': $scope.id,
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