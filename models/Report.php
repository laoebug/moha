<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/3/18
 * Time: 3:31 PM
 */

namespace app\models;


use yii\db\ActiveRecord;

class Report extends ActiveRecord
{
    public $phiscalyear_id;
    public $keyword;
}