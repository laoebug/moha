<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_single_gateway_implementation".
 *
 * @property int $id
 * @property int $user_id
 * @property int $phiscal_year_id
 * @property string $last_update
 * @property int $saved
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 */
class StatSingleGatewayImplementation extends ActiveRecord
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
            [['user_id', 'phiscal_year_id', 'saved'], 'integer'],
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
            'saved' => Yii::t('app', 'Saved'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['stat_single_gateway_implementation_id' => 'id']);
    }
}
