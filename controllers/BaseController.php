<?php

/**
 * https://thecodeninja.net/2014/12/simpler-role-based-authorization-in-yii-2-0/
 */

namespace app\controllers;

use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use \app\models\User;

/**
 * MinistryController implements the CRUD actions for Ministry model.
 */
class BaseController extends Controller
{

	public function behaviors()
	{
		return [
			'verbs' => [
				'class' => VerbFilter::className(),
				'actions' => [
					'delete' => [
						'POST'
					]
				]
			],
			'access' => [
				'class' => \app\models\TheAccessControl::className(),
				'rules' => [
					[
						// 'allow' => ! Yii::$app->user->isGuest && in_array ( Yii::$app->user->identity->role_id, User::getAllowedRoleIds () ) 										
						'allow' => !Yii::$app->user->isGuest &&  User::isAllowedRole()
					]
				]

				// 'rules' => [
				//     [
				//         'actions' => ['index', 'update', 'view', 'delete'],
				//         'allow' => true,
				//         'roles' => ['admin'],
				//     ],
				// ],
			]
		];
	}
}
