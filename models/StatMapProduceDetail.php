<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_map_produce_detail".
 *
 * @property int $id
 * @property int $stat_map_produce_id
 * @property string $activity
 * @property int $amount
 * @property string $remark
 *
 * @property StatMapProduce $statMapProduce
 */
class StatMapProduceDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_map_produce_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_map_produce_id', 'activity'], 'required'],
            [['stat_map_produce_id', 'amount'], 'integer'],
            [['activity', 'remark'], 'string', 'max' => 255],
            [['stat_map_produce_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatMapProduce::className(), 'targetAttribute' => ['stat_map_produce_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_map_produce_id' => Yii::t('app', 'Stat Map Produce ID'),
            'activity' => Yii::t('app', 'Activity'),
            'amount' => Yii::t('app', 'Amount'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatMapProduce()
    {
        return $this->hasOne(StatMapProduce::className(), ['id' => 'stat_map_produce_id']);
    }
}
