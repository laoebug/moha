<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_institute_meeting_detail".
 *
 * @property int $id
 * @property string $title
 * @property int $total
 * @property int $women
 * @property string $start_date
 * @property string $end_date
 * @property int $times
 * @property string $place
 * @property int $stat_institute_meeting_id
 *
 * @property StatInstituteMeeting $statInstituteMeeting
 */
class StatInstituteMeetingDetail extends ActiveRecord
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
            [['stat_institute_meeting_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getStatInstituteMeeting()
    {
        return $this->hasOne(StatInstituteMeeting::className(), ['id' => 'stat_institute_meeting_id']);
    }
}
