<?php
// VoteWidget.php
namespace app\components;

use app\models\Menu;
use Yii;
use yii\base\Widget;

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
