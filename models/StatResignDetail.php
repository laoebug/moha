<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_resign_detail".
 *
 * @property int $id
 * @property int $retire_total
 * @property int $retire_women
 * @property int $bumnet_total
 * @property int $bumnet_women
 * @property int $stat_resign_id
 * @property int $die_total
 * @property int $die_women
 * @property int $officer_level_id
 * @property int $leave_total
 * @property int $leave_women
 * @property int $fire_total
 * @property int $fire_women
 * @property int $resign_total
 * @property int $resign_women
 * @property int $lose_total
 * @property int $lose_women
 * @property int $army_total
 * @property int $army_women
 * @property int $ministry_total
 * @property int $ministry_women
 *
 * @property StatResign $statResign
 */
class StatResignDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_resign_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['retire_total', 'retire_women', 'bumnet_total', 'bumnet_women', 'stat_resign_id', 'die_total', 'die_women', 'officer_level_id', 'leave_total', 'leave_women', 'fire_total', 'fire_women', 'resign_total', 'resign_women', 'lose_total', 'lose_women', 'army_total', 'army_women', 'ministry_total', 'ministry_women'], 'integer'],
            [['stat_resign_id', 'officer_level_id'], 'required'],
            [['stat_resign_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatResign::className(), 'targetAttribute' => ['stat_resign_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'retire_total' => Yii::t('app', 'Retire Total'),
            'retire_women' => Yii::t('app', 'Retire Women'),
            'bumnet_total' => Yii::t('app', 'Bumnet Total'),
            'bumnet_women' => Yii::t('app', 'Bumnet Women'),
            'stat_resign_id' => Yii::t('app', 'Stat Resign ID'),
            'die_total' => Yii::t('app', 'Die Total'),
            'die_women' => Yii::t('app', 'Die Women'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'leave_total' => Yii::t('app', 'Leave Total'),
            'leave_women' => Yii::t('app', 'Leave Women'),
            'fire_total' => Yii::t('app', 'Fire Total'),
            'fire_women' => Yii::t('app', 'Fire Women'),
            'resign_total' => Yii::t('app', 'Resign Total'),
            'resign_women' => Yii::t('app', 'Resign Women'),
            'lose_total' => Yii::t('app', 'Lose Total'),
            'lose_women' => Yii::t('app', 'Lose Women'),
            'army_total' => Yii::t('app', 'Army Total'),
            'army_women' => Yii::t('app', 'Army Women'),
            'ministry_total' => Yii::t('app', 'Ministry Total'),
            'ministry_women' => Yii::t('app', 'Ministry Women'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatResign()
    {
        return $this->hasOne(StatResign::className(), ['id' => 'stat_resign_id']);
    }
}
