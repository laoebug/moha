<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_goverment_unit".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $last_update
 * @property string $status
 * @property integer $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 */
class StatGovermentUnit extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_goverment_unit';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'last_update', 'status', 'phiscal_year_id'], 'required'],
            [['user_id', 'phiscal_year_id'], 'integer'],
            [['last_update'], 'safe'],
            [['status'], 'string', 'max' => 45],
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
            'last_update' => Yii::t('app', 'Last Update'),
            'status' => Yii::t('app', 'Status'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
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
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['stat_goverment_unit_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatGovermentUnitQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatGovermentUnitQuery(get_called_class());
    }
}