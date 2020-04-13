<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_register_people".
 *
 * @property int $id
 * @property int $deleted
 * @property string $last_update
 * @property int $phiscal_year_id
 * @property int $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatRegisterPeopleDetail[] $statRegisterPeopleDetails
 */
class StatRegisterPeople extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_register_people';
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
            'id' => 'ID',
            'deleted' => 'Deleted',
            'last_update' => 'Last Updated',
            'phiscal_year_id' => 'Phiscal Year ID',
            'user_id' => 'User ID',
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
    public function getStatRegisterPeopleDetails()
    {
        return $this->hasMany(StatRegisterPeopleDetail::className(), ['stat_register_people_id' => 'id']);
    }
}
