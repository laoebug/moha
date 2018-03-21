<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_institute_meeting".
 *
 * @property integer $id
 * @property string $last_update
 * @property integer $saved
 * @property integer $user_id
 * @property integer $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatInstituteMeetingDetail[] $statInstituteMeetingDetails
 */
class StatInstituteMeeting extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_institute_meeting';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'user_id', 'phiscal_year_id'],  'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['last_update'], 'safe'],
            [['saved', 'user_id', 'phiscal_year_id'], 'integer'],
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
            'user_id' => Yii::t('app', 'User ID'),
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
    public function getStatInstituteMeetingDetails()
    {
        return $this->hasMany(StatInstituteMeetingDetail::className(), ['stat_institute_meeting_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return StatInstituteMeetingQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatInstituteMeetingQuery(get_called_class());
    }
}
