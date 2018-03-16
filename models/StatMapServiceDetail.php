<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_map_service_detail".
 *
 * @property integer $id
 * @property integer $stat_map_service_id
 * @property string $activity
 * @property integer $amount
 * @property integer $km
 * @property integer $point
 * @property string $remark
 *
 * @property StatMapService $statMapService
 */
class StatMapServiceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_map_service_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_map_service_id', 'activity'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_map_service_id', 'amount', 'km', 'point'], 'integer'],
            [['activity', 'remark'], 'string', 'max' => 255],
            [['stat_map_service_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatMapService::className(), 'targetAttribute' => ['stat_map_service_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_map_service_id' => Yii::t('app', 'Stat Map Service ID'),
            'activity' => Yii::t('app', 'Activity'),
            'amount' => Yii::t('app', 'Amount'),
            'km' => Yii::t('app', 'Km'),
            'point' => Yii::t('app', 'Point'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatMapService()
    {
        return $this->hasOne(StatMapService::className(), ['id' => 'stat_map_service_id']);
    }

    /**
     * @inheritdoc
     * @return StatMapServiceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatMapServiceDetailQuery(get_called_class());
    }
}
