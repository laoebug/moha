<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/7/18
 * Time: 12:28 AM
 */

namespace app\controllers;

use app\models\Menu;
use app\models\MenuSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class DepartmentController extends Controller
{
    public function actionIndex()
    {
        $searchModel = new MenuSearch ();
        $dataProvider = $searchModel->search(\Yii::$app->request->queryParams);
        $dataProvider->query->andWhere([
            'menu_parent_id' => 3
        ]);
        $dataProvider->query->orderBy('position');

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionView($id = 0)
    {
        if ($id == 0)
            throw new NotFoundHttpException ('| number | dash');
        $model = Menu::findOne($id);

// 		$x = 1;

// 		while($model->id <= 5) {
// 			echo "The number is: $x <br>";
// 			$x++;
// 		}

        $searchModel = new MenuSearch ();
        $dataProvider = $searchModel->search(\Yii::$app->request->queryParams);
        $dataProvider->query->andWhere([
            'menu_parent_id' => $id
        ]);
        return $this->render('view', [
            'model' => $model,
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }
}