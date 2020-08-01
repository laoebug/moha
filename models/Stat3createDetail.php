<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_3create_detail".
 *
 * @property int $id
 * @property int $stat_3create_id
 * @property int $province_id
 * @property int $dev_total
 * @property int $dev_continue
 * @property int $dev_new
 * @property int $strong_total
 * @property int $strong_continue
 * @property int $strong_new
 * @property int $big
 *
 * @property Province $province
 */
class Stat3createDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_3create_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_3create_id', 'province_id'], 'required'],
            [['stat_3create_id', 'province_id', 'dev_total', 'dev_continue', 'dev_new', 'strong_total', 'strong_continue', 'strong_new', 'big'], 'integer'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_3create_id' => Yii::t('app', 'Stat 3create ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'dev_total' => Yii::t('app', 'Dev Total'),
            'dev_continue' => Yii::t('app', 'Dev Continue'),
            'dev_new' => Yii::t('app', 'Dev New'),
            'strong_total' => Yii::t('app', 'Strong Total'),
            'strong_continue' => Yii::t('app', 'Strong Continue'),
            'strong_new' => Yii::t('app', 'Strong New'),
            'big' => Yii::t('app', 'Big'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }
}
