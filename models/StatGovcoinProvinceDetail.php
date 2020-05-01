<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_govcoin_province_detail".
 *
 * @property int $id
 * @property int $labo_personal
 * @property int $labo_team
 * @property int $deve_personal
 * @property int $deve_team
 * @property int $memo_personal
 * @property int $memo_team
 * @property int $amer_personal
 * @property int $amer_team
 * @property int $fran_personal
 * @property int $fran_team
 * @property int $gove_personal
 * @property int $gove_team
 * @property string $remark
 * @property int $award_id
 * @property int $province_id
 * @property int $stat_govcoin_province_id
 * @property int $remember_personal
 * @property int $remember_team
 *
 * @property Award $award
 * @property Province $province
 * @property StatGovcoinProvince $statGovcoinProvince
 */
class StatGovcoinProvinceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_govcoin_province_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['labo_personal', 'labo_team', 'deve_personal', 'deve_team', 'memo_personal', 'memo_team', 'amer_personal', 'amer_team', 'fran_personal', 'fran_team', 'gove_personal', 'gove_team', 'award_id', 'province_id', 'stat_govcoin_province_id', 'remember_personal', 'remember_team'], 'integer'],
            [['award_id', 'province_id', 'stat_govcoin_province_id'], 'required'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_govcoin_province_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatGovcoinProvince::className(), 'targetAttribute' => ['stat_govcoin_province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
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
            'award_id' => Yii::t('app', 'Award ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'stat_govcoin_province_id' => Yii::t('app', 'Stat Govcoin Province ID'),
            'remember_personal' => Yii::t('app', 'Remember Personal'),
            'remember_team' => Yii::t('app', 'Remember Team'),
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
    public function getStatGovcoinProvince()
    {
        return $this->hasOne(StatGovcoinProvince::className(), ['id' => 'stat_govcoin_province_id']);
    }
}
