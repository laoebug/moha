<?php
// VoteWidget.php
namespace app\components;

use yii\base\Widget;
use Yii;
use app\models\Menu;

class BreacrumbWidget extends Widget {
	public $breadcrumbs = [ ];
	public function init() {
		parent::init ();
	}
	
	public function run() {
		$request = Yii::$app->request;
		$id = $request->get ( 'id' );
		$menus = Menu::getMenuList($id);		
		return $this->render ( "_breadcrums", array (
				"menus" => $menus
		) );
	}
}
?>
