<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\Stat3createSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statMinistryController">
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="row">
                    <div class="col-sm-2">
                        <label for="">ສະໄໝ</label>
                        <input class="form-control" ng-model="model.batch">
                    </div>
                    <div class="col-sm-2">
                        <label for="">ປີເລີ່ມຕົ້ນ</label>
                        <input type="number" min="0" class="form-control" ng-model="model.from_year">
                    </div>
                    <div class="col-sm-2">
                        <label for="">ປີໝົດສະໄໝ</label>
                        <input type="number" min="0" class="form-control" ng-model="model.to_year">
                    </div>
                    <div class="col-sm-4">
                        <label for=""><?= Yii::t('app', 'Remark') ?></label>
                        <input type="text" class="form-control" ng-model="model.remark">
                    </div>
                    <div class="col-sm-2">
                        <label for="">&nbsp;</label>
                        <button type="button" class="btn btn-info col-sm-12" ng-click="save()">
                            <i class="fa fa-save"></i> ບັນທຶກ
                        </button>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-8">
                        <table class="table table-bordered">
                            <thead>
                                <th style="width: 20%">ລຳດັບ</th>
                                <th>ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                                <th style="width: 10%">ເພີ່ມ</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="number" min="0" class="form-control" ng-model="ministry.position"></td>
                                    <td><input type="text" class="form-control" ng-model="ministry.name"></td>
                                    <td>
                                        <button type="button" class="btn btn-success col-sm-12" ng-click="add()">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr ng-repeat="item in model.ministries track by $index">
                                    <td>{{item.position}}</td>
                                    <td>{{item.name}}</td>
                                    <td>
                                        <button type="button" class="btn btn-danger col-sm-12" ng-click="remove($index)">
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
                            <h3><?= $this->title ?> ສະໄໝທີ {{model.batch}} ({{model.from_year}} - {{model.to_year}})</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&id={{model.id}}"><i class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&id={{model.id}}"><i class="fa fa-download fa-2x"></i>
                                </a>
                            </p>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 card">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th class="text-center">ສະໄໝ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="item in models track by $index" ng-click="select(item)">
                                            <td class="text-center" style="cursor: pointer">{{item.batch}} (ປີ {{item.from_year}} - {{item.to_year}})</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-sm-9" ng-show="model.ministries && model.ministries.length > 0">

                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                                            <th class="text-center">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="m in model.ministries">
                                            <td class="text-center">{{m.position}}</td>
                                            <td>{{m.name}}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
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
    app.filter('dash', function() {
        return function(input) {
            return input ? input : '-';
        };
    });
    app.controller('statMinistryController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat-ministry/';
        $scope.mode = 'read';
        $scope.model = {};
        $scope.ministry = {
            name: null,
            position: null
        };
        $scope.models = null;
        $scope.changemode = function() {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };


        $scope.get = function() {
            $http.get($scope.url + 'get').then(function(r) {
                $scope.response = r;
                if (r.data.models) {
                    $scope.models = r.data.models;
                    $scope.select($scope.models[0]);
                }

                $timeout(function() {
                    $scope.response = null;
                }, 15000);
            });
        };
        $scope.get();

        $scope.add = function() {
            if (!$scope.ministry.name) return;
            if (!$scope.model.ministries || $scope.model.ministries.length == 0) {
                $scope.model.ministries = [];
            }
            var m = $scope.ministry;
            $scope.model.ministries.push(m);
            $scope.ministry = {
                name: null,
                position: null
            }
        };

        $scope.select = function(item) {
            if ($scope.model) {
                $scope.model.ministries = [];
                $scope.model.batch = item.batch;
                $scope.model.from_year = item.from_year * 1;
                $scope.model.to_year = item.to_year * 1;
                $scope.model.id = item.id;
            }
            $http.get($scope.url + 'enquiry&id=' + item.id).then(function(r) {
                if (r.data.models) {
                    if (!$scope.model) $scope.model = {};
                    if (!$scope.model.ministries || $scope.model.ministries.length == 0) {
                        $scope.model.ministries = [];
                    }
                    $scope.model.ministries = r.data.models;
                }
            })
        };

        $scope.save = function() {
            if ($scope.model && $scope.model.batch && $scope.model.ministries && $scope.model.ministries.length > 0) {
                $http.post($scope.url + 'save', {
                    'StatMinistry': $scope.model,
                    '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {
                    $scope.response = r;
                    $scope.get();
                    $scope.model = null;
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                }, function(r) {
                    $scope.response = r;
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                });
            }
        };

        $scope.remove = function($i) {
            $scope.model.ministries.splice($i, 1);
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
                        }, function(r) {
                            $scope.response = r;
                            $timeout(function() {
                                $scope.response = null;
                            }, 15000);
                        });
                    }
                });
            }
        };
    });
</script>