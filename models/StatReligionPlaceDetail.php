<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_religion_place_detail".
 *
 * @property int $id
 * @property int $buddhis_total
 * @property int $buddhis_nomonk
 * @property int $buddhis_monk
 * @property int $buddhis_agreement_built_temple
 * @property int $buddhis_no_agreement_built_temple
 * @property int $buddhis_nosim
 * @property int $buddhis_sim
 * @property int $christ_news_total
 * @property int $christ_news_not
 * @property int $christ_sat_total
 * @property int $christ_sat_not
 * @property int $christ_cato_total
 * @property int $christ_cato_not
 * @property int $bahai_total
 * @property int $bahai_not
 * @property int $idslam_total
 * @property int $idslam_not
 * @property string $remark
 * @property int $stat_religion_place_id
 * @property int $province_id
 *
 * @property Province $province
 * @property StatReligionPlace $statReligionPlace
 */
class StatReligionPlaceDetail extends ActiveRecord
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
            [['buddhis_total', 'buddhis_nomonk', 'buddhis_monk', 'buddhis_agreement_built_temple', 'buddhis_no_agreement_built_temple', 'buddhis_nosim', 'buddhis_sim', 'christ_news_total', 'christ_news_not', 'christ_sat_total', 'christ_sat_not', 'christ_cato_total', 'christ_cato_not', 'bahai_total', 'bahai_not', 'idslam_total', 'idslam_not', 'stat_religion_place_id', 'province_id'], 'integer'],
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
            'buddhis_monk' => Yii::t('app', 'Buddhis Monk'),
            'buddhis_agreement_built_temple' => Yii::t('app', 'Buddhis Agreement Built Temple'),
            'buddhis_no_agreement_built_temple' => Yii::t('app', 'Buddhis No Agreement Built Temple'),
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
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligionPlace()
    {
        return $this->hasOne(StatReligionPlace::className(), ['id' => 'stat_religion_place_id']);
    }
}
