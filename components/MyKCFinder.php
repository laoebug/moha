<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 3/16/18
 * Time: 10:17 PM
 */

namespace app\components;


use iutbay\yii2kcfinder\KCFinder;
use iutbay\yii2kcfinder\KCFinderAsset;
use yii\helpers\ArrayHelper;

class MyKCFinder extends \dosamigos\ckeditor\CKEditor
{

    public $enableKCFinder = true;

    /**
     * Registers CKEditor plugin
     */
    protected function registerPlugin()
    {
        if ($this->enableKCFinder) {
            $this->registerKCFinder();
        }

        parent::registerPlugin();
    }

    /**
     * Registers KCFinder
     */
    protected function registerKCFinder()
    {
        $register = KCFinderAsset::register($this->view);
        $kcfinderUrl = $register->baseUrl;

        $browseOptions = [
            'filebrowserBrowseUrl' => $kcfinderUrl . '/browse.php?opener=ckeditor&type=files',
            'filebrowserUploadUrl' => $kcfinderUrl . '/index.php?r=site/browse&opener=ckeditor&type=files',
        ];

        $this->clientOptions = ArrayHelper::merge($browseOptions, $this->clientOptions);

        $kcfOptions = array_merge(KCFinder::$kcfDefaultOptions, [
            'uploadURL' => \Yii::getAlias('@web').'/upload',
            'access' => [
                'files' => [
                    'upload' => true,
                    'delete' => false,
                    'copy' => false,
                    'move' => false,
                    'rename' => false,
                ],
                'dirs' => [
                    'create' => true,
                    'delete' => false,
                    'rename' => false,
                ],
            ],
        ]);

        \Yii::$app->session->set('KCFINDER', $kcfOptions);
    }

}