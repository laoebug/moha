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
		$theMenus = [ ];
		$menus = [ ];
		if (isset ( $id ) && ! empty ( $id )) {
			while ( 1 ) {
				$menu = $this->getMenu ( $id );
				if (isset ( $menu )) {
					$theMenus [] = $menu;
					if (isset ( $menu->menu_parent_id ) && $menu->menu_parent_id == 0) {
						$id = 0;
					} else {
						$id = $menu->menu_parent_id;
					}
				}
				
				if ($menu->menu_parent_id == 0) {
					break;
				}
			}
			
			$menus = array_reverse ( $theMenus );
		}
		return $this->render ( "_breadcrums", array (
				
				"menus" => $menus 
		) );
	}
	public function getMenu($id) {
		return Menu::findOne ( $id );
	}
}
?>
