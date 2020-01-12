<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_age_detail".
 *
 * @property int $id
 * @property int $stat_officer_age_id
 * @property int $total_u25
 * @property int $women_u25
 * @property int $total_25_30
 * @property int $women_25_30
 * @property int $total_31_35
 * @property int $women_31_35
 * @property int $total_36_40
 * @property int $women_36_40
 * @property int $total_41_45
 * @property int $women_41_45
 * @property int $total_46_50
 * @property int $women_46_50
 * @property int $total_51_55
 * @property int $women_51_55
 * @property int $total_56_60
 * @property int $women_56_60
 * @property int $total_61u
 * @property int $women_61u
 * @property int $organisation_group_id
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerAge $statOfficerAge
 */
class StatOfficerAgeDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_age_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_age_id', 'organisation_group_id'], 'required'],
            [['stat_officer_age_id', 'total_u25', 'women_u25', 'total_25_30', 'women_25_30', 'total_31_35', 'women_31_35', 'total_36_40', 'women_36_40', 'total_41_45', 'women_41_45', 'total_46_50', 'women_46_50', 'total_51_55', 'women_51_55', 'total_56_60', 'women_56_60', 'total_61u', 'women_61u', 'organisation_group_id'], 'integer'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
            [['stat_officer_age_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerAge::className(), 'targetAttribute' => ['stat_officer_age_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_age_id' => Yii::t('app', 'Stat Officer Age ID'),
            'total_u25' => Yii::t('app', 'Total U25'),
            'women_u25' => Yii::t('app', 'Women U25'),
            'total_25_30' => Yii::t('app', 'Total 25 30'),
            'women_25_30' => Yii::t('app', 'Women 25 30'),
            'total_31_35' => Yii::t('app', 'Total 31 35'),
            'women_31_35' => Yii::t('app', 'Women 31 35'),
            'total_36_40' => Yii::t('app', 'Total 36 40'),
            'women_36_40' => Yii::t('app', 'Women 36 40'),
            'total_41_45' => Yii::t('app', 'Total 41 45'),
            'women_41_45' => Yii::t('app', 'Women 41 45'),
            'total_46_50' => Yii::t('app', 'Total 46 50'),
            'women_46_50' => Yii::t('app', 'Women 46 50'),
            'total_51_55' => Yii::t('app', 'Total 51 55'),
            'women_51_55' => Yii::t('app', 'Women 51 55'),
            'total_56_60' => Yii::t('app', 'Total 56 60'),
            'women_56_60' => Yii::t('app', 'Women 56 60'),
            'total_61u' => Yii::t('app', 'Total 61u'),
            'women_61u' => Yii::t('app', 'Women 61u'),
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
    public function getStatOfficerAge()
    {
        return $this->hasOne(StatOfficerAge::className(), ['id' => 'stat_officer_age_id']);
    }
}
