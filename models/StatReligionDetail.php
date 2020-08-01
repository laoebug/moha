<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_religion_detail".
 *
 * @property int $id
 * @property int $buddhis_total
 * @property int $buddhis_women
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
 * @property int $other_total
 * @property int $other_women
 * @property string $remark
 * @property int $stat_religion_id
 * @property int $province_id
 *
 * @property Province $province
 * @property StatReligion $statReligion
 */
class StatReligionDetail extends ActiveRecord
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
            [['stat_religion_id', 'province_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligion()
    {
        return $this->hasOne(StatReligion::className(), ['id' => 'stat_religion_id']);
    }
}
