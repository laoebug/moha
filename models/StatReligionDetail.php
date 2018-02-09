<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_religion_detail".
 *
 * @property integer $id
 * @property integer $buddhis_total
 * @property integer $buddhis_women
 * @property integer $christ_news_total
 * @property integer $christ_news_women
 * @property integer $christ_sat_total
 * @property integer $christ_sat_women
 * @property integer $christ_cato_total
 * @property integer $christ_cato_women
 * @property integer $bahai_total
 * @property integer $bahai_women
 * @property integer $idslam_total
 * @property integer $idslam_women
 * @property integer $other_total
 * @property integer $other_women
 * @property string $remark
 * @property integer $stat_religion_id
 * @property integer $province_id
 *
 * @property Province $province
 * @property StatReligion $statReligion
 */
class StatReligionDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_religion_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['buddhis_total', 'buddhis_women', 'christ_news_total', 'christ_news_women', 'christ_sat_total', 'christ_sat_women', 'christ_cato_total', 'christ_cato_women', 'bahai_total', 'bahai_women', 'idslam_total', 'idslam_women', 'other_total', 'other_women', 'stat_religion_id', 'province_id'], 'integer'],
            [['remark'], 'string'],
            [['stat_religion_id', 'province_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_religion_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatReligion::className(), 'targetAttribute' => ['stat_religion_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'buddhis_total' => Yii::t('app', 'Buddhis Total'),
            'buddhis_women' => Yii::t('app', 'Buddhis Women'),
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
            'other_total' => Yii::t('app', 'Other Total'),
            'other_women' => Yii::t('app', 'Other Women'),
            'remark' => Yii::t('app', 'Remark'),
            'stat_religion_id' => Yii::t('app', 'Stat Religion ID'),
            'province_id' => Yii::t('app', 'Province ID'),
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
    public function getStatReligion()
    {
        return $this->hasOne(StatReligion::className(), ['id' => 'stat_religion_id']);
    }

    /**
     * @inheritdoc
     * @return StatReligionDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatReligionDetailQuery(get_called_class());
    }
}
