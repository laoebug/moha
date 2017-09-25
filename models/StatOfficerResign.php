<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_resign".
 *
 * @property integer $id
 * @property string $last_update
 * @property integer $saved
 * @property integer $phiscal_year_id
 * @property integer $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatOfficerResignDetail[] $statOfficerResignDetails
 */
class StatOfficerResign extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_resign';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'saved', 'phiscal_year_id', 'user_id'], 'required'],
            [['last_update'], 'safe'],
            [['saved', 'phiscal_year_id', 'user_id'], 'integer'],
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
            'saved' => Yii::t('app', 'Saved'),
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
    public function getStatOfficerResignDetails()
    {
        return $this->hasMany(StatOfficerResignDetail::className(), ['stat_officer_resign_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerResignQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerResignQuery(get_called_class());
    }
}