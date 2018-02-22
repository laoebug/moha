<?php

namespace app\controllers;

use app\models\ContactForm;
use app\models\Content;
use app\models\LinkSearch;
use app\models\LoginForm;
use app\models\Notice;
use app\models\NoticeSearch;
use app\models\User;
use Yii;
use yii\db\Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class SiteController extends Controller
{
    public $subtitle;

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest)
            return $this->redirect(["site/login"]);
        else {
            $notices = Notice::find()->where(['show' => 1])
                ->orderBy('position, created_date desc')
                ->asArray()
                ->all();
            if (!Yii::$app->session->has('notices') || count(Yii::$app->session->get('notices', [])) != count($notices)) {
                Yii::$app->session->set('notices', $notices);
            }

            $searchModel = new NoticeSearch();
            $searchModel->show = 1;
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
            ]);
        }
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $cookies = Yii::$app->request->cookies;
        if ($cookies->has('username'))
            $model->username = $cookies->get('username');

        $this->layout = "login";
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->redirect(['site/login']);
    }

    public function actionChangepassword()
    {
        $model = User::findOne(Yii::$app->user->id);
        $post = Yii::$app->request->post();
        if (isset($post['User'])) {
            try {
                if ($model->password !== $post['User']['password']) {
                    throw new Exception('ລະຫັດຜ່ານ ປະຈຸບັນ ບໍ່ຖືກຕ້ອງ');
                }
                if ($post['User']['newpassword'] !== $post['User']['confirmpassword']) {
                    throw new Exception('ຢືນຢັນ ລະຫັດຜ່ານ ໃໝ່ ບໍ່ຖືກຕ້ອງ');
                }
                $model->password = $post['User']['newpassword'];
                if (!$model->save(false)) {
                    throw new Exception(json_encode($model->errors));
                }
                Yii::$app->session->setFlash('success', "ສຳເລັດ");
            } catch (Exception $exception) {
                Yii::$app->session->setFlash('danger', $exception->getMessage());
            }
        }
        $model->password = null;
        $model->newpassword = null;
        $model->confirmpassword = null;
        return $this->render('changepassword', [
            'model' => $model
        ]);
    }

    public function actionProfile()
    {
        $model = User::findOne(Yii::$app->user->id);
        return $this->render('profile', [
            'model' => $model
        ]);
    }

    public function actionNotices()
    {
        $searchModel = new NoticeSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('notices', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionNotice($id)
    {
        $model = Notice::findOne($id);
        if (!isset($model) || $model->show != 1)
            throw new NotFoundHttpException('ບໍ່ພົບຂໍ້ມູນ');

        return $this->render('notice', [
            'model' => $model
        ]);
    }

    public function actionContact()
    {
        $model = new ContactForm();
        $post = Yii::$app->request->post();
        if (isset($post['ContactForm'])) {
            $model->load($post);
        }
        $contents = Content::find()->all();
        $contents = ArrayHelper::map($contents, 'code', 'value');
        return $this->render('contact', [
            'model' => $model,
            'contents' => $contents
        ]);
    }

    public function actionLinks()
    {
        $searchModel = new LinkSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('links', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionUpload()
    {
        if ($_FILES['upload']) {
            try {
                $funcNum = $_REQUEST['CKEditorFuncNum'];
                if (($_FILES['upload'] == "none") OR (empty($_FILES['upload']['name']))) {
                    $message = 'ຟາຍບໍ່ຖືກຕ້ອງ';
                } else if ($_FILES['upload']["size"] == 0 OR $_FILES['upload']["size"] > 500 * 1024 * 1024) {
                    $message = 'ບໍ່ສາມາດອັບໂຫຼດຟາຍທີ່ມີຂະໜາດເກີນ 500MB';
                } else if (!is_uploaded_file($_FILES['upload']["tmp_name"])) {
                    $message = 'ພົບບັນຫາໃນການອັບໂຫຼດ';
                } else {
                    $extension = pathinfo($_FILES['upload']['name'], PATHINFO_EXTENSION);
                    $name = 'notice-' . date('YmdHis') . "-" . rand(1234567890, 9876543210) . '.' . $extension;
                    $folder = 'upload/' . date('Y') . '/';
                    if (!is_dir($folder)) {
                        mkdir($folder);
                        chmod($folder, 0755);
                    }
                    move_uploaded_file($_FILES['upload']['tmp_name'], $folder . $name);
                    $message = 'ສຳເລັດ';
                    $url = Yii::$app->urlManager->baseUrl . '/' . $folder . $name;
                    echo '<script type="text/javascript">window.parent.CKEDITOR.tools.callFunction("'
                        . $funcNum . '", "' . $url . '", "' . $message . '" );</script>';
                }
                echo $message;
            } catch (Exception $exception) {
                print_r($exception->getTraceAsString());
            }
        }
    }

    public function beforeAction($action)
    {
        if ($action->id == 'upload') {
            $this->enableCsrfValidation = false;
        }
        return parent::beforeAction($action); // TODO: Change the autogenerated stub
    }
}
