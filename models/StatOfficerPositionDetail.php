<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_position_detail".
 *
 * @property int $id
 * @property int $p1_total
 * @property int $p1_women
 * @property int $p2_total
 * @property int $p2_women
 * @property int $p3_total
 * @property int $p3_women
 * @property int $p4_total
 * @property int $p4_women
 * @property int $p5_total
 * @property int $p5_women
 * @property int $p6_total
 * @property int $p6_women
 * @property int $p7_total
 * @property int $p7_women
 * @property int $p8_total
 * @property int $p8_women
 * @property int $stat_officer_position_id
 * @property int $organisation_group_id
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerPosition $statOfficerPosition
 */
class StatOfficerPositionDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_position_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['p1_total', 'p1_women', 'p2_total', 'p2_women', 'p3_total', 'p3_women', 'p4_total', 'p4_women', 'p5_total', 'p5_women', 'p6_total', 'p6_women', 'p7_total', 'p7_women', 'p8_total', 'p8_women', 'stat_officer_position_id', 'organisation_group_id'], 'integer'],
            [['stat_officer_position_id', 'organisation_group_id'], 'required'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
            [['stat_officer_position_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerPosition::className(), 'targetAttribute' => ['stat_officer_position_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'p1_total' => Yii::t('app', 'P1 Total'),
            'p1_women' => Yii::t('app', 'P1 Women'),
            'p2_total' => Yii::t('app', 'P2 Total'),
            'p2_women' => Yii::t('app', 'P2 Women'),
            'p3_total' => Yii::t('app', 'P3 Total'),
            'p3_women' => Yii::t('app', 'P3 Women'),
            'p4_total' => Yii::t('app', 'P4 Total'),
            'p4_women' => Yii::t('app', 'P4 Women'),
            'p5_total' => Yii::t('app', 'P5 Total'),
            'p5_women' => Yii::t('app', 'P5 Women'),
            'p6_total' => Yii::t('app', 'P6 Total'),
            'p6_women' => Yii::t('app', 'P6 Women'),
            'p7_total' => Yii::t('app', 'P7 Total'),
            'p7_women' => Yii::t('app', 'P7 Women'),
            'p8_total' => Yii::t('app', 'P8 Total'),
            'p8_women' => Yii::t('app', 'P8 Women'),
            'stat_officer_position_id' => Yii::t('app', 'Stat Officer Position ID'),
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
    public function getStatOfficerPosition()
    {
        return $this->hasOne(StatOfficerPosition::className(), ['id' => 'stat_officer_position_id']);
    }
}
