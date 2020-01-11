<?php
// VoteWidget.php
namespace app\components;

use yii\base\Widget;

class TopMenuWidget extends Widget
{

    public $authorizeMenus = [];

    public function init()
    {
        parent::init();
    }

    public function run()
    {
        //$this->authorizeMenus = AuthenticationService::getAuthorizedMenuAndRole();
        
        return $this->render("_topmenuList", array(
//            'authorizeMenus' => $this->authorizeMenus
        ));
    }
}
