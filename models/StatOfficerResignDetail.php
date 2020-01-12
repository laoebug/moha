<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_resign_detail".
 *
 * @property int $id
 * @property int $stat_officer_resign_id
 * @property int $retire_total
 * @property int $bumnet_total
 * @property int $die_total
 * @property int $leave_total
 * @property int $fire_total
 * @property int $resign_total
 * @property int $lose_total
 * @property int $move_soe_total
 * @property int $moveto_ministry_total
 * @property int $movein_ministry_total
 * @property int $retire_women
 * @property int $bumnet_women
 * @property int $die_women
 * @property int $leave_women
 * @property int $fire_women
 * @property int $resign_women
 * @property int $lose_women
 * @property int $move_soe_women
 * @property int $moveto_ministry_women
 * @property int $movein_ministry_women
 * @property int $organisation_group_id
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerResign $statOfficerResign
 */
class StatOfficerResignDetail extends ActiveRecord
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
            [['stat_officer_resign_id', 'organisation_group_id'], 'required'],
            [['stat_officer_resign_id', 'retire_total', 'bumnet_total', 'die_total', 'leave_total', 'fire_total', 'resign_total', 'lose_total', 'move_soe_total', 'moveto_ministry_total', 'movein_ministry_total', 'retire_women', 'bumnet_women', 'die_women', 'leave_women', 'fire_women', 'resign_women', 'lose_women', 'move_soe_women', 'moveto_ministry_women', 'movein_ministry_women', 'organisation_group_id'], 'integer'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
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
            'organisation_group_id' => Yii::t('app', 'Organisation Group ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getOrganisationGroup()
    {
        return $this->hasOne(OrganisationGroup::className(), ['id' => 'organisation_group_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerResign()
    {
        return $this->hasOne(StatOfficerResign::className(), ['id' => 'stat_officer_resign_id']);
    }
}
