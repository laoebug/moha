<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 8/28/17
 * Time: 10:04 PM
 */

namespace app\components;


class MyHelper
{
    static function convertdatefordisplay($date) {
        return $date != date('d-m-Y', strtotime($date)) ? date('d-m-Y', strtotime($date)) : $date;
    }

    static function converttimefordisplay($date) {
        return $date != date('d-m-Y H:i:s', strtotime($date)) ? date('d-m-Y H:i:s', strtotime($date)) : $date;
    }

    static function convertdatefordb($date) {
        return $date != date('Y-m-d', strtotime($date)) ? date('Y-m-d', strtotime($date)) : $date;
    }

    static function converttimefordb($date) {
        return $date != date('Y-m-d H:i:s', strtotime($date)) ? date('Y-m-d H:i:s', strtotime($date)) : $date;
    }

    /*
     * ActiveRecords $model
     */
    static function saveFlash( $model) {
        if($model->save())
            \Yii::$app->session->setFlash('success', \Yii::t('app','Successful'));
        else
            \Yii::$app->session->setFlash('danger', json_encode($model->errors));
    }
}