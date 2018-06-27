<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_religion_teacher_detail".
 *
 * @property integer $id
 * @property integer $stat_religion_teacher_id
 * @property integer $buddhis_monk
 * @property integer $buddhis_novice
 * @property integer $buddhis_dad
 * @property integer $buddhis_mom
 * @property integer $buddhis_boy
 * @property integer $christ_news_total
 * @property integer $christ_news_women
 * @property integer $christ_sat_total
 * @property integer $christ_sat_women
 * @property integer $christ_cato_total
 * @property integer $christ_cato_women
 * @property integer $christ_novice_total
 * @property integer $christ_novice_women
 * @property integer $bahai_total
 * @property integer $bahai_women
 * @property integer $idslam_total
 * @property integer $idslam_women
 * @property integer $province_id
 * @property string $remark
 *
 * @property Province $province
 * @property StatReligionTeacher $statReligionTeacher
 */
class StatReligionTeacherDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_religion_teacher_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_religion_teacher_id', 'province_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_religion_teacher_id', 'buddhis_monk', 'buddhis_novice', 'buddhis_dad', 'buddhis_mom', 'buddhis_boy', 'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women', 'christ_cato_total', 'christ_cato_women', 'christ_novice_total', 'christ_novice_women', 'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women', 'province_id'], 'integer'],
            [['remark'], 'string'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_religion_teacher_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatReligionTeacher::className(), 'targetAttribute' => ['stat_religion_teacher_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_religion_teacher_id' => Yii::t('app', 'Stat Religion Teacher ID'),
            'buddhis_monk' => Yii::t('app', 'Buddhis Monk'),
            'buddhis_novice' => Yii::t('app', 'Buddhis Novice'),
            'buddhis_dad' => Yii::t('app', 'Buddhis Dad'),
            'buddhis_mom' => Yii::t('app', 'Buddhis Mom'),
            'buddhis_boy' => Yii::t('app', 'Buddhis Boy'),
            'christ_news_total' => Yii::t('app', 'Christ News Total'),
            'christ_news_women' => Yii::t('app', 'Christ News Women'),
            'christ_sat_total' => Yii::t('app', 'Christ Sat Total'),
            'christ_sat_women' => Yii::t('app', 'Christ Sat Women'),
            'christ_cato_total' => Yii::t('app', 'Christ Cato Total'),
            'christ_cato_women' => Yii::t('app', 'Christ Cato Women'),
            'christ_novice_total' => Yii::t('app', 'Christ Novice Total'),
            'christ_novice_women' => Yii::t('app', 'Christ Novice Women'),
            'bahai_total' => Yii::t('app', 'Bahai Total'),
            'bahai_women' => Yii::t('app', 'Bahai Women'),
            'idslam_total' => Yii::t('app', 'Idslam Total'),
            'idslam_women' => Yii::t('app', 'Idslam Women'),
            'province_id' => Yii::t('app', 'Province ID'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatReligionTeacher()
    {
        return $this->hasOne(StatReligionTeacher::className(), ['id' => 'stat_religion_teacher_id']);
    }

    /**
     * @inheritdoc
     * @return StatReligionTeacherDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatReligionTeacherDetailQuery(get_called_class());
    }
}
