<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_highcoin_foreigner".
 *
 * @property int $id
 * @property string $last_update
 * @property int $phiscal_year_id
 * @property int $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatHighcoinForeignerDetail[] $statHighcoinForeignerDetails
 */
class StatHighcoinForeigner extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_highcoin_foreigner';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update'], 'safe'],
            [['phiscal_year_id', 'user_id'], 'required'],
            [['phiscal_year_id', 'user_id'], 'integer'],
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
            'last_update' => Yii::t('app', 'Last Update'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
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
    public function getStatHighcoinForeignerDetails()
    {
        return $this->hasMany(StatHighcoinForeignerDetail::className(), ['stat_highcoin_foreigner_id' => 'id']);
    }
}
