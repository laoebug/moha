<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ";
?>
<div class="row" ng-app="mohaApp" ng-controller="ministryController">
    <div class="col-sm-12">
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em">
            <div class="panel-heading" ng-click="changemode()">
                <i class="fa fa-{{mode == 'input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hide'}}">
                <div class="col-sm-6">
                    <label for="">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</label>
                    <input type="text" class="form-control" ng-model="ministry.name">
                </div>
                <div class="col-sm-2">
                    <label for="">ລຳດັບ</label>
                    <input type="number" min="0" class="form-control" ng-model="ministry.position">
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="ministry.remark">
                </div>
                <div class="col-sm-2" ng-show="ministry && !ministry.id">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-success col-sm-12" ng-click="save(1)">
                        <i class="fa fa-plus"></i> ເພີ່ມ
                    </button>
                </div>
                <div class="col-sm-2" ng-show="ministry && ministry.id">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-info col-sm-12" ng-click="save(0)">
                        <i class="fa fa-save"></i> ແກ້ໄຂ
                    </button>
                </div>
                <div class="col-sm-2" ng-show="ministry && ministry.id">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-danger col-sm-12" ng-click="delete(0)">
                        <i class="fa fa-trash"></i> ລຶບ
                    </button>
                </div>
                <div class="col-sm-2" ng-show="ministry && ministry.id">
                    <label for="">&nbsp;</label>
                    <button type="button" class="btn btn-default col-sm-12" ng-click="ministry = null">
                        <i class="fa fa-refresh"></i> ຍົກເລີກ
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-show="ministries" style="margin-top: 2em">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card">
                        <div class="card-title-w-btn ">
                            <h3 class="title">ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ</h3>
                            <p class="hidden-print">
                                <a class="btn btn-default" target="_blank" href="index.php?r=ministry/print"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="index.php?r=ministry/download"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <div class="card-body">
                            <table class="table table-responsive table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                                    <th class="text-center">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                                    <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr ng-repeat="ministry in ministries | orderBy:ministry.position:false"
                                    ng-click="select(ministry)" style="cursor:pointer;">
                                    <td>{{$index+1}}</td>
                                    <td>{{ministry.name}}</td>
                                    <td>{{ministry.remark}}</td>
                                </tr>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="2" class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                    <th class="text-center">{{ministries.length}}</th>
                                </tr>
                                </tfoot>
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
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=ministry/';
    app.controller('ministryController', function ($scope, $http, $sce, $timeout) {
        $scope.mode = 'read';
        $scope.changemode = function () {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };
        $scope.enquiry = function () {
            $scope.ministries = null;
            $http.get(url + 'enquiry')
                .then(function (r) {
                    $scope.ministries = r.data.ministries;
                }, function (r) {
                    $scope.response = r;
                    $timeout(function () {
                        $scope.response = null;
                    }, 15000);
                });
        };

        $scope.enquiry();

        $scope.select = function (m) {
            $scope.ministry = m;
            $scope.ministry.position = parseInt(m.position);
        };

        $scope.save = function (create) {
            if ($scope.ministry)
                if ($scope.ministry.name)
                    $http.post(url + 'save', {
                        Ministry: $scope.ministry,
                        create: create,
                        '_csrf': $('meta[name="csrf-token"]').attr("content")
                    }).then(function (r) {
                        $scope.response = r;
                        $scope.ministry = null;
                        $scope.enquiry();
                        $timeout(function () {
                            $scope.response = null;
                        }, 15000);
                    }, function (r) {
                        $scope.response = r;
                        $timeout(function () {
                            $scope.response = null;
                        }, 15000);
                    });
        };

        $scope.delete = function () {
            if ($scope.ministry)
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
                        $http.post(url + 'delete', {
                            Ministry: $scope.ministry,
                            '_csrf': $('meta[name="csrf-token"]').attr("content")
                        }).then(function (r) {
                            $scope.response = r;
                            $scope.ministry = null;
                            $scope.enquiry();
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
        };
    });
</script>
