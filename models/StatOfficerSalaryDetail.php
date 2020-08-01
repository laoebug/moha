<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_salary_detail".
 *
 * @property int $id
 * @property int $stat_officer_salary_id
 * @property int $level1_total
 * @property int $level1_women
 * @property int $level2_total
 * @property int $level2_women
 * @property int $level3_total
 * @property int $level3_women
 * @property int $level4_total
 * @property int $level4_women
 * @property int $level5_total
 * @property int $level5_women
 * @property int $level6_total
 * @property int $level6_women
 * @property int $level7_total
 * @property int $level7_women
 * @property int $level8_total
 * @property int $level8_women
 * @property int $level9_total
 * @property int $level9_women
 * @property int $level10_total
 * @property int $level10_women
 * @property int $level11_total
 * @property int $level11_women
 * @property int $level12_total
 * @property int $level12_women
 * @property int $level13_total
 * @property int $level13_women
 * @property int $level14_total
 * @property int $level14_women
 * @property int $level15_total
 * @property int $level15_women
 * @property int $officer_level_id
 * @property int $salary_level_id
 *
 * @property SalaryLevel $salaryLevel
 * @property StatOfficerSalary $statOfficerSalary
 */
class StatOfficerSalaryDetail extends ActiveRecord
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
            [['stat_officer_salary_id', 'officer_level_id', 'salary_level_id'], 'required'],
            [['stat_officer_salary_id', 'level1_total', 'level1_women', 'level2_total', 'level2_women', 'level3_total', 'level3_women', 'level4_total', 'level4_women', 'level5_total', 'level5_women', 'level6_total', 'level6_women', 'level7_total', 'level7_women', 'level8_total', 'level8_women', 'level9_total', 'level9_women', 'level10_total', 'level10_women', 'level11_total', 'level11_women', 'level12_total', 'level12_women', 'level13_total', 'level13_women', 'level14_total', 'level14_women', 'level15_total', 'level15_women', 'officer_level_id', 'salary_level_id'], 'integer'],
            [['salary_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => SalaryLevel::className(), 'targetAttribute' => ['salary_level_id' => 'id']],
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
            'salary_level_id' => Yii::t('app', 'Salary Level ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getSalaryLevel()
    {
        return $this->hasOne(SalaryLevel::className(), ['id' => 'salary_level_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerSalary()
    {
        return $this->hasOne(StatOfficerSalary::className(), ['id' => 'stat_officer_salary_id']);
    }
}
