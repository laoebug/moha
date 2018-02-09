<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_institute_meeting_detail".
 *
 * @property integer $id
 * @property string $title
 * @property integer $total
 * @property integer $women
 * @property string $start_date
 * @property string $end_date
 * @property integer $times
 * @property string $place
 * @property integer $stat_institute_meeting_id
 *
 * @property StatInstituteMeeting $statInstituteMeeting
 */
class StatInstituteMeetingDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_institute_meeting_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total', 'women', 'times', 'stat_institute_meeting_id'], 'integer'],
            [['start_date', 'end_date'], 'safe'],
            [['stat_institute_meeting_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['title', 'place'], 'string', 'max' => 255],
            [['stat_institute_meeting_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatInstituteMeeting::className(), 'targetAttribute' => ['stat_institute_meeting_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'times' => Yii::t('app', 'Times'),
            'place' => Yii::t('app', 'Place'),
            'stat_institute_meeting_id' => Yii::t('app', 'Stat Institute Meeting ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatInstituteMeeting()
    {
        return $this->hasOne(StatInstituteMeeting::className(), ['id' => 'stat_institute_meeting_id']);
    }

    /**
     * @inheritdoc
     * @return StatInstituteMeetingDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatInstituteMeetingDetailQuery(get_called_class());
    }
}
