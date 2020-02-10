<?php

namespace app\components;
use Yii;
use yii\helpers\Html;
use yii\base\Component;


class ContorllerAndActionHandleComponent  extends Component
{


    public function init()
    {
        parent::init();
        // $this->handleControllerAndAction();
        
    }

    
    

    protected function handleControllerAndAction()
    {

        $controllerlist = [];
        if ($handle = opendir('../controllers')) {
            echo "<br/>";
            echo "<br/>";
            echo "<br/>";
            echo "<br/>";

            while (false !== ($file = readdir($handle))) {
                if ($file != "." && $file != ".." && substr($file, strrpos($file, '.') - 10) == 'Controller.php') {
                    $controllerlist[] = $file;
                }

                echo $file . "<br/>";
            }
            closedir($handle);
        }
        asort($controllerlist);
        $fulllist = [];
        foreach ($controllerlist as $controller) :
            $handle = fopen('../controllers/' . $controller, "r");
            if ($handle) {
                while (($line = fgets($handle)) !== false) {
                    if (preg_match('/public function action(.*?)\(/', $line, $display)) :
                        if (strlen($display[1]) > 2) :
                            $fulllist[substr($controller, 0, -4)][] = strtolower($display[1]);
                        endif;
                    endif;
                }
            }
            fclose($handle);
        endforeach;
        return $fulllist;
    }
}
