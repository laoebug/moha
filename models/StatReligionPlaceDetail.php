<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_religion_place_detail".
 *
 * @property integer $id
 * @property integer $buddhis_total
 * @property integer $buddhis_nomonk
 * @property integer $buddhis_nosim
 * @property integer $buddhis_sim
 * @property integer $christ_news_total
 * @property integer $christ_news_not
 * @property integer $christ_sat_total
 * @property integer $christ_sat_not
 * @property integer $christ_cato_total
 * @property integer $christ_cato_not
 * @property integer $bahai_total
 * @property integer $bahai_not
 * @property integer $idslam_total
 * @property integer $idslam_not
 * @property string $remark
 * @property integer $stat_religion_place_id
 * @property integer $province_id
 *
 * @property Province $province
 * @property StatReligionPlace $statReligionPlace
 */
class StatReligionPlaceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_religion_place_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['buddhis_total', 'buddhis_nomonk', 'buddhis_nosim', 'buddhis_sim', 'christ_news_total', 'christ_news_not', 'christ_sat_total', 'christ_sat_not', 'christ_cato_total', 'christ_cato_not', 'bahai_total', 'bahai_not', 'idslam_total', 'idslam_not', 'stat_religion_place_id', 'province_id'], 'integer'],
            [['remark'], 'string'],
            [['stat_religion_place_id', 'province_id'], 'required'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_religion_place_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatReligionPlace::className(), 'targetAttribute' => ['stat_religion_place_id' => 'id']],
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
            'buddhis_nomonk' => Yii::t('app', 'Buddhis Nomonk'),
            'buddhis_nosim' => Yii::t('app', 'Buddhis Nosim'),
            'buddhis_sim' => Yii::t('app', 'Buddhis Sim'),
            'christ_news_total' => Yii::t('app', 'Christ News Total'),
            'christ_news_not' => Yii::t('app', 'Christ News Not'),
            'christ_sat_total' => Yii::t('app', 'Christ Sat Total'),
            'christ_sat_not' => Yii::t('app', 'Christ Sat Not'),
            'christ_cato_total' => Yii::t('app', 'Christ Cato Total'),
            'christ_cato_not' => Yii::t('app', 'Christ Cato Not'),
            'bahai_total' => Yii::t('app', 'Bahai Total'),
            'bahai_not' => Yii::t('app', 'Bahai Not'),
            'idslam_total' => Yii::t('app', 'Idslam Total'),
            'idslam_not' => Yii::t('app', 'Idslam Not'),
            'remark' => Yii::t('app', 'Remark'),
            'stat_religion_place_id' => Yii::t('app', 'Stat Religion Place ID'),
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
    public function getStatReligionPlace()
    {
        return $this->hasOne(StatReligionPlace::className(), ['id' => 'stat_religion_place_id']);
    }

    /**
     * @inheritdoc
     * @return StatReligionPlaceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatReligionPlaceDetailQuery(get_called_class());
    }
}
