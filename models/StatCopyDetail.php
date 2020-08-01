<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_copy_detail".
 *
 * @property int $id
 * @property int $stat_copy_id
 * @property string $activity
 * @property int $start_year
 * @property int $end_year
 * @property string $summary
 * @property string $remark
 *
 * @property StatCopy $statCopy
 */
class StatCopyDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_copy_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_copy_id', 'activity'], 'required'],
            [['stat_copy_id', 'start_year', 'end_year'], 'integer'],
            [['activity', 'summary', 'remark'], 'string', 'max' => 255],
            [['stat_copy_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatCopy::className(), 'targetAttribute' => ['stat_copy_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_copy_id' => Yii::t('app', 'Stat Copy ID'),
            'activity' => Yii::t('app', 'Activity'),
            'start_year' => Yii::t('app', 'Start Year'),
            'end_year' => Yii::t('app', 'End Year'),
            'summary' => Yii::t('app', 'Summary'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatCopy()
    {
        return $this->hasOne(StatCopy::className(), ['id' => 'stat_copy_id']);
    }
}
