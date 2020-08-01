<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_religion_teacher_detail".
 *
 * @property int $id
 * @property int $stat_religion_teacher_id
 * @property int $buddhis_monk
 * @property int $buddhis_novice
 * @property int $buddhis_dad
 * @property int $buddhis_mom
 * @property int $buddhis_boy
 * @property int $christ_news_total
 * @property int $christ_news_women
 * @property int $christ_sat_total
 * @property int $christ_sat_women
 * @property int $christ_cato_total
 * @property int $christ_cato_women
 * @property int $bahai_total
 * @property int $bahai_women
 * @property int $idslam_total
 * @property int $idslam_women
 * @property int $province_id
 * @property string $remark
 * @property int $christ_novice_total
 * @property int $christ_novice_women
 *
 * @property Province $province
 * @property StatReligionTeacher $statReligionTeacher
 */
class StatReligionTeacherDetail extends ActiveRecord
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
            [['stat_religion_teacher_id', 'province_id'], 'required'],
            [['stat_religion_teacher_id', 'buddhis_monk', 'buddhis_novice', 'buddhis_dad', 'buddhis_mom', 'buddhis_boy', 'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women', 'christ_cato_total', 'christ_cato_women', 'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women', 'province_id', 'christ_novice_total', 'christ_novice_women'], 'integer'],
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
            'bahai_total' => Yii::t('app', 'Bahai Total'),
            'bahai_women' => Yii::t('app', 'Bahai Women'),
            'idslam_total' => Yii::t('app', 'Idslam Total'),
            'idslam_women' => Yii::t('app', 'Idslam Women'),
            'province_id' => Yii::t('app', 'Province ID'),
            'remark' => Yii::t('app', 'Remark'),
            'christ_novice_total' => Yii::t('app', 'Christ Novice Total'),
            'christ_novice_women' => Yii::t('app', 'Christ Novice Women'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligionTeacher()
    {
        return $this->hasOne(StatReligionTeacher::className(), ['id' => 'stat_religion_teacher_id']);
    }
}
