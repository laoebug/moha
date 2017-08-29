<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_single_gateway_implementation_detail".
 *
 * @property integer $id
 * @property integer $stat_single_gateway_implementation_id
 * @property integer $branch_id
 * @property string $start_date
 * @property string $name
 * @property string $remark
 *
 * @property Branch $branch
 * @property StatSingleGatewayImplementation $statSingleGatewayImplementation
 */
class StatSingleGatewayImplementationDetail extends \yii\db\ActiveRecord
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
            [['stat_single_gateway_implementation_id', 'branch_id'], 'required'],
            [['stat_single_gateway_implementation_id', 'branch_id'], 'integer'],
            [['start_date'], 'safe'],
            [['remark'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
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
            'branch_id' => Yii::t('app', 'Branch ID'),
            'start_date' => Yii::t('app', 'Start Date'),
            'name' => Yii::t('app', 'Name'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branch::className(), ['id' => 'branch_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementation()
    {
        return $this->hasOne(StatSingleGatewayImplementation::className(), ['id' => 'stat_single_gateway_implementation_id']);
    }

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementationDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatSingleGatewayImplementationDetailQuery(get_called_class());
    }
}
