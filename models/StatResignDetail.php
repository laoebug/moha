<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_resign_detail".
 *
 * @property integer $id
 * @property integer $retire_total
 * @property integer $retire_women
 * @property integer $bumnet_total
 * @property integer $bumnet_women
 * @property integer $stat_resign_id
 * @property integer $die_total
 * @property integer $die_women
 * @property integer $officer_level_id
 * @property integer $leave_total
 * @property integer $leave_women
 * @property integer $fire_total
 * @property integer $fire_women
 * @property integer $resign_total
 * @property integer $resign_women
 * @property integer $lose_total
 * @property integer $lose_women
 * @property integer $army_total
 * @property integer $army_women
 * @property integer $ministry_total
 * @property integer $ministry_women
 *
 * @property OfficerLevel $officerLevel
 * @property StatResign $statResign
 */
class StatResignDetail extends \yii\db\ActiveRecord
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
            [['stat_resign_id', 'officer_level_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
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
     * @return \yii\db\ActiveQuery
     */
    public function getOfficerLevel()
    {
        return $this->hasOne(OfficerLevel::className(), ['id' => 'officer_level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatResign()
    {
        return $this->hasOne(StatResign::className(), ['id' => 'stat_resign_id']);
    }

    /**
     * @inheritdoc
     * @return StatResignDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatResignDetailQuery(get_called_class());
    }
}
