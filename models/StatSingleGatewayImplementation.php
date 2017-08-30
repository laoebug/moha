<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_single_gateway_implementation".
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $phiscal_year_id
 * @property string $last_update
 * @property integer $status
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 */
class StatSingleGatewayImplementation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_single_gateway_implementation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'phiscal_year_id', 'last_update'], 'required'],
            [['user_id', 'phiscal_year_id', 'status'], 'integer'],
            [['last_update'], 'safe'],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'status' => Yii::t('app', 'Status'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['stat_single_gateway_implementation_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatSingleGatewayImplementationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatSingleGatewayImplementationQuery(get_called_class());
    }
}
