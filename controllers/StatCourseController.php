<?php

namespace app\controllers;

use app\components\MyHelper;
use Codeception\Util\HttpCode;
use function foo\func;
use Yii;
use app\models\StatCourse;
use app\models\StatCourseSearch;
use yii\db\ActiveQuery;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatCourseController implements the CRUD actions for StatCourse model.
 */
class StatCourseController extends Controller
{
    /**
     * Lists all StatCourse models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionEnquiry() {
        $models = StatCourse::find()->alias('s')
            ->select('s.*')
            ->addSelect([
                'parent' => 'c.name'
            ])
            ->join('on','stat_course c', 'c.stat_course_id=s.id')
            ->with([
                'statCourses' => function(ActiveQuery $query) {
                    $query->orderBy('position');
                }
            ])
            ->where(['s.deleted' => 0])->orderBy('s.position')->asArray()->all();
        return json_encode(['models' => $models]);
    }

    public function actionSave() {
        $post = Yii::$app->request->post();
        $model = null;
        if(isset($post))
            if(isset($post['Model'])) {
                $model = isset($post['Model']['id']) ? StatCourse::findOne($post['Model']['id']) : new StatCourse();
                $model->attributes = $post['Model'];
                $model->last_update = date('Y-m-d H:i:s');
                $model->user_id = Yii::$app->user->id;
                if(!$model->save()) {
                    MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                    return;
                }
                return json_encode(['message' => 'OK']);
            }
    }

    /**
     * Finds the StatCourse model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatCourse the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatCourse::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
