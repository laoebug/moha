<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "salary_level".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property string $last_update
 * @property int $position
 * @property int $user_id
 *
 * @property User $user
 * @property StatOfficerSalaryDetail[] $statOfficerSalaryDetails
 */
class SalaryLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'salary_level';
    }

    /**
     * @inheritdoc
     * @return SalaryLevelQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new SalaryLevelQuery(get_called_class());
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'last_update', 'user_id'], 'required'],
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
    public function getStatOfficerSalaryDetails()
    {
        return $this->hasMany(StatOfficerSalaryDetail::className(), ['salary_level_id' => 'id']);
    }
}
