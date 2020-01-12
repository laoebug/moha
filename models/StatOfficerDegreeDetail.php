<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_degree_detail".
 *
 * @property int $id
 * @property int $doctor_total
 * @property int $doctor_women
 * @property int $post_master_total
 * @property int $post_master_women
 * @property int $master_total
 * @property int $master_women
 * @property int $post_bachelor_total
 * @property int $post_bachelor_women
 * @property int $bachelor_total
 * @property int $bachelor_women
 * @property int $high_total
 * @property int $high_women
 * @property int $middle_total
 * @property int $middle_women
 * @property int $begin_total
 * @property int $begin_women
 * @property int $no_total
 * @property int $no_women
 * @property int $stat_officer_degree_id
 * @property int $organisation_group_id
 * @property int $highschool_total
 * @property int $highschool_women
 * @property int $second_total
 * @property int $second_women
 * @property int $primary_total
 * @property int $primary_women
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerDegree $statOfficerDegree
 */
class StatOfficerDegreeDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_degree_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['doctor_total', 'doctor_women', 'post_master_total', 'post_master_women', 'master_total', 'master_women', 'post_bachelor_total', 'post_bachelor_women', 'bachelor_total', 'bachelor_women', 'high_total', 'high_women', 'middle_total', 'middle_women', 'begin_total', 'begin_women', 'no_total', 'no_women', 'stat_officer_degree_id', 'organisation_group_id', 'highschool_total', 'highschool_women', 'second_total', 'second_women', 'primary_total', 'primary_women'], 'integer'],
            [['stat_officer_degree_id', 'organisation_group_id'], 'required'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
            [['stat_officer_degree_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerDegree::className(), 'targetAttribute' => ['stat_officer_degree_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'doctor_total' => Yii::t('app', 'Doctor Total'),
            'doctor_women' => Yii::t('app', 'Doctor Women'),
            'post_master_total' => Yii::t('app', 'Post Master Total'),
            'post_master_women' => Yii::t('app', 'Post Master Women'),
            'master_total' => Yii::t('app', 'Master Total'),
            'master_women' => Yii::t('app', 'Master Women'),
            'post_bachelor_total' => Yii::t('app', 'Post Bachelor Total'),
            'post_bachelor_women' => Yii::t('app', 'Post Bachelor Women'),
            'bachelor_total' => Yii::t('app', 'Bachelor Total'),
            'bachelor_women' => Yii::t('app', 'Bachelor Women'),
            'high_total' => Yii::t('app', 'High Total'),
            'high_women' => Yii::t('app', 'High Women'),
            'middle_total' => Yii::t('app', 'Middle Total'),
            'middle_women' => Yii::t('app', 'Middle Women'),
            'begin_total' => Yii::t('app', 'Begin Total'),
            'begin_women' => Yii::t('app', 'Begin Women'),
            'no_total' => Yii::t('app', 'No Total'),
            'no_women' => Yii::t('app', 'No Women'),
            'stat_officer_degree_id' => Yii::t('app', 'Stat Officer Degree ID'),
            'organisation_group_id' => Yii::t('app', 'Organisation Group ID'),
            'highschool_total' => Yii::t('app', 'Highschool Total'),
            'highschool_women' => Yii::t('app', 'Highschool Women'),
            'second_total' => Yii::t('app', 'Second Total'),
            'second_women' => Yii::t('app', 'Second Women'),
            'primary_total' => Yii::t('app', 'Primary Total'),
            'primary_women' => Yii::t('app', 'Primary Women'),
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
    public function getStatOfficerDegree()
    {
        return $this->hasOne(StatOfficerDegree::className(), ['id' => 'stat_officer_degree_id']);
    }
}
