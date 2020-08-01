<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_map_service_detail".
 *
 * @property int $id
 * @property int $stat_map_service_id
 * @property string $activity
 * @property int $amount
 * @property int $km
 * @property int $point
 * @property string $remark
 *
 * @property StatMapService $statMapService
 */
class StatMapServiceDetail extends ActiveRecord
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
            [['stat_map_service_id', 'activity'], 'required'],
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
     * @return ActiveQuery
     */
    public function getStatMapService()
    {
        return $this->hasOne(StatMapService::className(), ['id' => 'stat_map_service_id']);
    }
}
