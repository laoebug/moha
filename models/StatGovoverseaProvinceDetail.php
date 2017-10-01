<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_govoversea_province_detail".
 *
 * @property integer $id
 * @property integer $stat_govoversea_province_id
 * @property integer $province_id
 * @property integer $award_id
 * @property integer $labo_personal
 * @property integer $labo_team
 * @property integer $deve_personal
 * @property integer $deve_team
 * @property integer $memo_personal
 * @property integer $memo_team
 * @property integer $amer_personal
 * @property integer $amer_team
 * @property integer $fran_personal
 * @property integer $fran_team
 * @property integer $gove_personal
 * @property integer $gove_team
 * @property string $remark
 *
 * @property Award $award
 * @property Province $province
 * @property StatGovoverseaProvince $statGovoverseaProvince
 */
class StatGovoverseaProvinceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_govoversea_province_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_govoversea_province_id', 'province_id', 'award_id'], 'required'],
            [['stat_govoversea_province_id', 'province_id', 'award_id', 'labo_personal', 'labo_team', 'deve_personal', 'deve_team', 'memo_personal', 'memo_team', 'amer_personal', 'amer_team', 'fran_personal', 'fran_team', 'gove_personal', 'gove_team'], 'integer'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_govoversea_province_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatGovoverseaProvince::className(), 'targetAttribute' => ['stat_govoversea_province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_govoversea_province_id' => Yii::t('app', 'Stat Govoversea Province ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'award_id' => Yii::t('app', 'Award ID'),
            'labo_personal' => Yii::t('app', 'Labo Personal'),
            'labo_team' => Yii::t('app', 'Labo Team'),
            'deve_personal' => Yii::t('app', 'Deve Personal'),
            'deve_team' => Yii::t('app', 'Deve Team'),
            'memo_personal' => Yii::t('app', 'Memo Personal'),
            'memo_team' => Yii::t('app', 'Memo Team'),
            'amer_personal' => Yii::t('app', 'Amer Personal'),
            'amer_team' => Yii::t('app', 'Amer Team'),
            'fran_personal' => Yii::t('app', 'Fran Personal'),
            'fran_team' => Yii::t('app', 'Fran Team'),
            'gove_personal' => Yii::t('app', 'Gove Personal'),
            'gove_team' => Yii::t('app', 'Gove Team'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAward()
    {
        return $this->hasOne(Award::className(), ['id' => 'award_id']);
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
    public function getStatGovoverseaProvince()
    {
        return $this->hasOne(StatGovoverseaProvince::className(), ['id' => 'stat_govoversea_province_id']);
    }

    /**
     * @inheritdoc
     * @return StatGovoverseaProvinceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatGovoverseaProvinceDetailQuery(get_called_class());
    }
}
