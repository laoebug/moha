<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_age_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_age_id
 * @property integer $total_u25
 * @property integer $women_u25
 * @property integer $total_25_30
 * @property integer $women_25_30
 * @property integer $total_31_35
 * @property integer $women_31_35
 * @property integer $total_36_40
 * @property integer $women_36_40
 * @property integer $total_41_45
 * @property integer $women_41_45
 * @property integer $total_46_50
 * @property integer $women_46_50
 * @property integer $total_51_55
 * @property integer $women_51_55
 * @property integer $total_56_60
 * @property integer $women_56_60
 * @property integer $total_61u
 * @property integer $women_61u
 *
 * @property StatOfficerAge $statOfficerAge
 */
class StatOfficerAgeDetail extends \yii\db\ActiveRecord
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
            [['stat_officer_age_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_age_id', 'total_u25', 'women_u25', 'total_25_30', 'women_25_30', 'total_31_35', 'women_31_35', 'total_36_40', 'women_36_40', 'total_41_45', 'women_41_45', 'total_46_50', 'women_46_50', 'total_51_55', 'women_51_55', 'total_56_60', 'women_56_60', 'total_61u', 'women_61u'], 'integer'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerAge()
    {
        return $this->hasOne(StatOfficerAge::className(), ['id' => 'stat_officer_age_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAgeDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerAgeDetailQuery(get_called_class());
    }
}
