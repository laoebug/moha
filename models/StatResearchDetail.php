<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_research_detail".
 *
 * @property integer $id
 * @property integer $stat_research_id
 * @property string $title
 * @property integer $total
 * @property integer $women
 * @property string $start_date
 * @property string $end_date
 * @property string $attendance
 * @property integer $times
 * @property string $place
 * @property string $remark
 * @property integer $goverment
 * @property integer $dornor
 *
 * @property StatResearch $statResearch
 */
class StatResearchDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_research_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_research_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_research_id', 'total', 'women', 'times', 'goverment', 'dornor'], 'integer'],
            [['start_date', 'end_date'], 'safe'],
            [['title', 'attendance', 'place', 'remark'], 'string', 'max' => 255],
            [['stat_research_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatResearch::className(), 'targetAttribute' => ['stat_research_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_research_id' => Yii::t('app', 'Stat Research ID'),
            'title' => Yii::t('app', 'Title'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'attendance' => Yii::t('app', 'Attendance'),
            'times' => Yii::t('app', 'Times'),
            'place' => Yii::t('app', 'Place'),
            'remark' => Yii::t('app', 'Remark'),
            'goverment' => Yii::t('app', 'Goverment'),
            'dornor' => Yii::t('app', 'Dornor'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatResearch()
    {
        return $this->hasOne(StatResearch::className(), ['id' => 'stat_research_id']);
    }

    /**
     * @inheritdoc
     * @return StatResearchDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatResearchDetailQuery(get_called_class());
    }
}
