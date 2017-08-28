<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 08/28/2017
 * Time: 13:08
 */

namespace app\components;

use app\models\Message;
use app\models\SourceMessage;
use yii\i18n\MissingTranslationEvent;

class TranslationEventHandler
{
    public static function handleMissingTranslation(MissingTranslationEvent $event)
    {
//        $event->translatedMessage = "@MISSING: {$event->category}.{$event->message} FOR LANGUAGE {$event->language} @";

        try {
            $exis = SourceMessage::find()->where(["message" => $event->message])->one();
            if(!isset($exis)) {
                $s = new SourceMessage();
                $s->message = $event->message;
                $s->category = $event->category;
                if (!$s->save()) {
                    \Yii::error(json_encode($s->errors));
                }
                $m = new Message();
                $m->language = "la-LA";
                $m->id = $s->id;
                $m->translation = "";
                if (!$m->save()) {
                    \Yii::$app->session->setFlash("danger", json_encode($m->errors));
                    \Yii::error(json_encode($m->errors));
                }
            }
        } catch (Exception $x) {
            print_r($x);
            \Yii::error(json_encode($x));
        }
    }
}