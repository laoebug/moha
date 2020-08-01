<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_single_gateway_implementation_detail".
 *
 * @property int $id
 * @property int $stat_single_gateway_implementation_id
 * @property string $start_date
 * @property string $name
 * @property string $remark
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property StatSingleGatewayImplementation $statSingleGatewayImplementation
 */
class StatSingleGatewayImplementationDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_single_gateway_implementation_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_single_gateway_implementation_id', 'ministry_id'], 'required'],
            [['stat_single_gateway_implementation_id', 'ministry_id'], 'integer'],
            [['start_date'], 'safe'],
            [['remark'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_single_gateway_implementation_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatSingleGatewayImplementation::className(), 'targetAttribute' => ['stat_single_gateway_implementation_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_single_gateway_implementation_id' => Yii::t('app', 'Stat Single Gateway Implementation ID'),
            'start_date' => Yii::t('app', 'Start Date'),
            'name' => Yii::t('app', 'Name'),
            'remark' => Yii::t('app', 'Remark'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatSingleGatewayImplementation()
    {
        return $this->hasOne(StatSingleGatewayImplementation::className(), ['id' => 'stat_single_gateway_implementation_id']);
    }
}
