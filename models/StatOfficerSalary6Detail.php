<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_salary6_detail".
 *
 * @property int $id
 * @property int $deleted
 * @property int $step1
 * @property int $step2
 * @property int $step3
 * @property int $step4
 * @property int $step5
 * @property int $step6
 * @property int $stat_officer_salary6_id
 * @property int $ministry_id
 * @property int $study_level_id
 * @property int $step1_women
 * @property int $step2_women
 * @property int $step3_women
 * @property int $step4_women
 * @property int $step5_women
 * @property int $step6_women
 *
 * @property Ministry $ministry
 * @property StatOfficerSalary6 $statOfficerSalary6
 * @property StudyLevel $studyLevel
 */
class StatOfficerSalary6Detail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_salary6_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted', 'step1', 'step2', 'step3', 'step4', 'step5', 'step6', 'stat_officer_salary6_id', 'ministry_id', 'study_level_id', 'step1_women', 'step2_women', 'step3_women', 'step4_women', 'step5_women', 'step6_women'], 'integer'],
            [['stat_officer_salary6_id', 'ministry_id', 'study_level_id'], 'required'],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_officer_salary6_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerSalary6::className(), 'targetAttribute' => ['stat_officer_salary6_id' => 'id']],
            [['study_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => StudyLevel::className(), 'targetAttribute' => ['study_level_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'deleted' => Yii::t('app', 'Deleted'),
            'step1' => Yii::t('app', 'Step1'),
            'step2' => Yii::t('app', 'Step2'),
            'step3' => Yii::t('app', 'Step3'),
            'step4' => Yii::t('app', 'Step4'),
            'step5' => Yii::t('app', 'Step5'),
            'step6' => Yii::t('app', 'Step6'),
            'stat_officer_salary6_id' => Yii::t('app', 'Stat Officer Salary6 ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'study_level_id' => Yii::t('app', 'Study Level ID'),
            'step1_women' => Yii::t('app', 'Step1 Women'),
            'step2_women' => Yii::t('app', 'Step2 Women'),
            'step3_women' => Yii::t('app', 'Step3 Women'),
            'step4_women' => Yii::t('app', 'Step4 Women'),
            'step5_women' => Yii::t('app', 'Step5 Women'),
            'step6_women' => Yii::t('app', 'Step6 Women'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerSalary6()
    {
        return $this->hasOne(StatOfficerSalary6::className(), ['id' => 'stat_officer_salary6_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStudyLevel()
    {
        return $this->hasOne(StudyLevel::className(), ['id' => 'study_level_id']);
    }
}
