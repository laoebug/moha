<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_map_produce_detail".
 *
 * @property integer $id
 * @property integer $stat_map_produce_id
 * @property string $activity
 * @property integer $amount
 * @property string $remark
 *
 * @property StatMapProduce $statMapProduce
 */
class StatMapProduceDetail extends \yii\db\ActiveRecord
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
     * @return \yii\db\ActiveQuery
     */
    public function getStatMapProduce()
    {
        return $this->hasOne(StatMapProduce::className(), ['id' => 'stat_map_produce_id']);
    }

    /**
     * @inheritdoc
     * @return StatMapProduceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatMapProduceDetailQuery(get_called_class());
    }
}
