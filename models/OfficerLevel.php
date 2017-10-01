<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "officer_level".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property string $last_update
 * @property integer $position
 * @property integer $user_id
 *
 * @property User $user
 * @property StatOfficerAgelevelDetail[] $statOfficerAgelevelDetails
 * @property StatOfficerSalaryDetail[] $statOfficerSalaryDetails
 * @property StatOfficerTechnicalDetail[] $statOfficerTechnicalDetails
 */
class OfficerLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'officer_level';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'deleted', 'last_update', 'user_id'], 'required'],
            [['deleted', 'position', 'user_id'], 'integer'],
            [['last_update'], 'safe'],
            [['name'], 'string', 'max' => 255],
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
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'last_update' => Yii::t('app', 'Last Update'),
            'position' => Yii::t('app', 'Position'),
            'user_id' => Yii::t('app', 'User ID'),
        ];
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
    public function getStatOfficerAgelevelDetails()
    {
        return $this->hasMany(StatOfficerAgelevelDetail::className(), ['officer_level_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerSalaryDetails()
    {
        return $this->hasMany(StatOfficerSalaryDetail::className(), ['officer_level_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerTechnicalDetails()
    {
        return $this->hasMany(StatOfficerTechnicalDetail::className(), ['officer_level_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return OfficerLevelQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new OfficerLevelQuery(get_called_class());
    }
}
