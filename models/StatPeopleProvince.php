<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_people_province".
 *
 * @property int $id
 * @property string $last_update
 * @property int $deleted
 * @property int $user_id
 * @property int $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatPeopleProvinceDetail[] $statPeopleProvinceDetails
 */
class StatPeopleProvince extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_people_province';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'user_id', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['deleted', 'user_id', 'phiscal_year_id'], 'integer'],
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
            'id' => 'ID',
            'last_update' => 'Last Update',
            'deleted' => 'Deleted',
            'user_id' => 'User ID',
            'phiscal_year_id' => 'Phiscal Year ID',
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
    public function getStatPeopleProvinceDetails()
    {
        return $this->hasMany(StatPeopleProvinceDetail::className(), ['stat_people_province_id' => 'id']);
    }
}
