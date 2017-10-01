<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_salary_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_salary_id
 * @property integer $level1_total
 * @property integer $level1_women
 * @property integer $level2_total
 * @property integer $level2_women
 * @property integer $level3_total
 * @property integer $level3_women
 * @property integer $level4_total
 * @property integer $level4_women
 * @property integer $level5_total
 * @property integer $level5_women
 * @property integer $level6_total
 * @property integer $level6_women
 * @property integer $level7_total
 * @property integer $level7_women
 * @property integer $level8_total
 * @property integer $level8_women
 * @property integer $level9_total
 * @property integer $level9_women
 * @property integer $level10_total
 * @property integer $level10_women
 * @property integer $level11_total
 * @property integer $level11_women
 * @property integer $level12_total
 * @property integer $level12_women
 * @property integer $level13_total
 * @property integer $level13_women
 * @property integer $level14_total
 * @property integer $level14_women
 * @property integer $level15_total
 * @property integer $level15_women
 * @property integer $officer_level_id
 *
 * @property OfficerLevel $officerLevel
 * @property StatOfficerSalary $statOfficerSalary
 */
class StatOfficerSalaryDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_salary_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_salary_id', 'officer_level_id'], 'required'],
            [['stat_officer_salary_id', 'level1_total', 'level1_women', 'level2_total', 'level2_women', 'level3_total', 'level3_women', 'level4_total', 'level4_women', 'level5_total', 'level5_women', 'level6_total', 'level6_women', 'level7_total', 'level7_women', 'level8_total', 'level8_women', 'level9_total', 'level9_women', 'level10_total', 'level10_women', 'level11_total', 'level11_women', 'level12_total', 'level12_women', 'level13_total', 'level13_women', 'level14_total', 'level14_women', 'level15_total', 'level15_women', 'officer_level_id'], 'integer'],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_officer_salary_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerSalary::className(), 'targetAttribute' => ['stat_officer_salary_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_salary_id' => Yii::t('app', 'Stat Officer Salary ID'),
            'level1_total' => Yii::t('app', 'Level1 Total'),
            'level1_women' => Yii::t('app', 'Level1 Women'),
            'level2_total' => Yii::t('app', 'Level2 Total'),
            'level2_women' => Yii::t('app', 'Level2 Women'),
            'level3_total' => Yii::t('app', 'Level3 Total'),
            'level3_women' => Yii::t('app', 'Level3 Women'),
            'level4_total' => Yii::t('app', 'Level4 Total'),
            'level4_women' => Yii::t('app', 'Level4 Women'),
            'level5_total' => Yii::t('app', 'Level5 Total'),
            'level5_women' => Yii::t('app', 'Level5 Women'),
            'level6_total' => Yii::t('app', 'Level6 Total'),
            'level6_women' => Yii::t('app', 'Level6 Women'),
            'level7_total' => Yii::t('app', 'Level7 Total'),
            'level7_women' => Yii::t('app', 'Level7 Women'),
            'level8_total' => Yii::t('app', 'Level8 Total'),
            'level8_women' => Yii::t('app', 'Level8 Women'),
            'level9_total' => Yii::t('app', 'Level9 Total'),
            'level9_women' => Yii::t('app', 'Level9 Women'),
            'level10_total' => Yii::t('app', 'Level10 Total'),
            'level10_women' => Yii::t('app', 'Level10 Women'),
            'level11_total' => Yii::t('app', 'Level11 Total'),
            'level11_women' => Yii::t('app', 'Level11 Women'),
            'level12_total' => Yii::t('app', 'Level12 Total'),
            'level12_women' => Yii::t('app', 'Level12 Women'),
            'level13_total' => Yii::t('app', 'Level13 Total'),
            'level13_women' => Yii::t('app', 'Level13 Women'),
            'level14_total' => Yii::t('app', 'Level14 Total'),
            'level14_women' => Yii::t('app', 'Level14 Women'),
            'level15_total' => Yii::t('app', 'Level15 Total'),
            'level15_women' => Yii::t('app', 'Level15 Women'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
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
    public function getStatOfficerSalary()
    {
        return $this->hasOne(StatOfficerSalary::className(), ['id' => 'stat_officer_salary_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerSalaryDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerSalaryDetailQuery(get_called_class());
    }
}
