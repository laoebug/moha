<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_degree_detail".
 *
 * @property integer $id
 * @property integer $doctor_total
 * @property integer $doctor_women
 * @property integer $post_master_total
 * @property integer $post_master_women
 * @property integer $master_total
 * @property integer $master_women
 * @property integer $post_bachelor_total
 * @property integer $post_bachelor_women
 * @property integer $bachelor_total
 * @property integer $bachelor_women
 * @property integer $high_total
 * @property integer $high_women
 * @property integer $middle_total
 * @property integer $middle_women
 * @property integer $begin_total
 * @property integer $begin_women
 * @property integer $no_total
 * @property integer $no_women
 * @property integer $stat_officer_degree_id
 *
 * @property StatOfficerDegree $statOfficerDegree
 */
class StatOfficerDegreeDetail extends \yii\db\ActiveRecord
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
            [['doctor_total', 'doctor_women', 'post_master_total', 'post_master_women', 'master_total', 'master_women', 'post_bachelor_total', 'post_bachelor_women', 'bachelor_total', 'bachelor_women', 'high_total', 'high_women', 'middle_total', 'middle_women', 'begin_total', 'begin_women', 'no_total', 'no_women', 'stat_officer_degree_id'], 'integer'],
            [['stat_officer_degree_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerDegree()
    {
        return $this->hasOne(StatOfficerDegree::className(), ['id' => 'stat_officer_degree_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerDegreeDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerDegreeDetailQuery(get_called_class());
    }
}
