<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_salary6".
 *
 * @property int $id
 * @property int $deleted
 * @property string $last_update
 * @property int $phiscal_year_id
 * @property int $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatOfficerSalary6Detail[] $statOfficerSalary6Details
 */
class StatOfficerSalary6 extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_salary6';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted', 'last_update', 'phiscal_year_id', 'user_id'], 'required'],
            [['deleted', 'phiscal_year_id', 'user_id'], 'integer'],
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
            'deleted' => Yii::t('app', 'Deleted'),
            'last_update' => Yii::t('app', 'Last Update'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
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
    public function getStatOfficerSalary6Details()
    {
        return $this->hasMany(StatOfficerSalary6Detail::className(), ['stat_officer_salary6_id' => 'id']);
    }
}
