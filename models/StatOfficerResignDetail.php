<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_resign_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_resign_id
 * @property integer $retire_total
 * @property integer $bumnet_total
 * @property integer $die_total
 * @property integer $leave_total
 * @property integer $fire_total
 * @property integer $resign_total
 * @property integer $lose_total
 * @property integer $move_soe_total
 * @property integer $moveto_ministry_total
 * @property integer $movein_ministry_total
 * @property integer $retire_women
 * @property integer $bumnet_women
 * @property integer $die_women
 * @property integer $leave_women
 * @property integer $fire_women
 * @property integer $resign_women
 * @property integer $lose_women
 * @property integer $move_soe_women
 * @property integer $moveto_ministry_women
 * @property integer $movein_ministry_women
 *
 * @property StatOfficerResign $statOfficerResign
 */
class StatOfficerResignDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_resign_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_resign_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_resign_id', 'retire_total', 'bumnet_total', 'die_total', 'leave_total', 'fire_total', 'resign_total', 'lose_total', 'move_soe_total', 'moveto_ministry_total', 'movein_ministry_total', 'retire_women', 'bumnet_women', 'die_women', 'leave_women', 'fire_women', 'resign_women', 'lose_women', 'move_soe_women', 'moveto_ministry_women', 'movein_ministry_women'], 'integer'],
            [['stat_officer_resign_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerResign::className(), 'targetAttribute' => ['stat_officer_resign_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_resign_id' => Yii::t('app', 'Stat Officer Resign ID'),
            'retire_total' => Yii::t('app', 'Retire Total'),
            'bumnet_total' => Yii::t('app', 'Bumnet Total'),
            'die_total' => Yii::t('app', 'Die Total'),
            'leave_total' => Yii::t('app', 'Leave Total'),
            'fire_total' => Yii::t('app', 'Fire Total'),
            'resign_total' => Yii::t('app', 'Resign Total'),
            'lose_total' => Yii::t('app', 'Lose Total'),
            'move_soe_total' => Yii::t('app', 'Move Soe Total'),
            'moveto_ministry_total' => Yii::t('app', 'Moveto Ministry Total'),
            'movein_ministry_total' => Yii::t('app', 'Movein Ministry Total'),
            'retire_women' => Yii::t('app', 'Retire Women'),
            'bumnet_women' => Yii::t('app', 'Bumnet Women'),
            'die_women' => Yii::t('app', 'Die Women'),
            'leave_women' => Yii::t('app', 'Leave Women'),
            'fire_women' => Yii::t('app', 'Fire Women'),
            'resign_women' => Yii::t('app', 'Resign Women'),
            'lose_women' => Yii::t('app', 'Lose Women'),
            'move_soe_women' => Yii::t('app', 'Move Soe Women'),
            'moveto_ministry_women' => Yii::t('app', 'Moveto Ministry Women'),
            'movein_ministry_women' => Yii::t('app', 'Movein Ministry Women'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerResign()
    {
        return $this->hasOne(StatOfficerResign::className(), ['id' => 'stat_officer_resign_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerResignDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerResignDetailQuery(get_called_class());
    }
}
