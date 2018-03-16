<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_copy_detail".
 *
 * @property integer $id
 * @property integer $stat_copy_id
 * @property string $activity
 * @property integer $start_year
 * @property integer $end_year
 * @property string $summary
 * @property string $remark
 *
 * @property StatCopy $statCopy
 */
class StatCopyDetail extends \yii\db\ActiveRecord
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
            [['stat_copy_id', 'activity'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
     * @return \yii\db\ActiveQuery
     */
    public function getStatCopy()
    {
        return $this->hasOne(StatCopy::className(), ['id' => 'stat_copy_id']);
    }

    /**
     * @inheritdoc
     * @return StatCopyDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatCopyDetailQuery(get_called_class());
    }
}
