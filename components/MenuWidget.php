<?php
// VoteWidget.php
namespace app\components;

use yii\base\Widget;
use app\services\AuthenticationService;

class MenuWidget extends Widget
{

    public $authorizeMenus = [];

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        //$this->authorizeMenus = AuthenticationService::getAuthorizedMenuAndRole();
        
        return $this->render("_menuList", array(
//            'authorizeMenus' => $this->authorizeMenus
        ));
    }
}
?>
