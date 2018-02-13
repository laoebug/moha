<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_hornorcoin_province_detail".
 *
 * @property integer $id
 * @property integer $hero_personal
 * @property integer $hero_team
 * @property integer $knight_personal
 * @property integer $knight_team
 * @property integer $labor_personal
 * @property integer $labor_team
 * @property integer $dev_personal
 * @property integer $dev_team
 * @property string $remark
 * @property integer $province_id
 * @property integer $award_id
 * @property integer $stat_hornorcoin_province_id
 *
 * @property Award $award
 * @property Province $province
 * @property StatHornorcoinProvince $statHornorcoinProvince
 */
class StatHornorcoinProvinceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_hornorcoin_province_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['hero_personal', 'hero_team', 'knight_personal', 'knight_team', 'labor_personal', 'labor_team', 'dev_personal', 'dev_team', 'province_id', 'award_id', 'stat_hornorcoin_province_id'], 'integer'],
            [['province_id', 'award_id', 'stat_hornorcoin_province_id'],  'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_hornorcoin_province_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatHornorcoinProvince::className(), 'targetAttribute' => ['stat_hornorcoin_province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'hero_personal' => Yii::t('app', 'Hero Personal'),
            'hero_team' => Yii::t('app', 'Hero Team'),
            'knight_personal' => Yii::t('app', 'Knight Personal'),
            'knight_team' => Yii::t('app', 'Knight Team'),
            'labor_personal' => Yii::t('app', 'Labor Personal'),
            'labor_team' => Yii::t('app', 'Labor Team'),
            'dev_personal' => Yii::t('app', 'Dev Personal'),
            'dev_team' => Yii::t('app', 'Dev Team'),
            'remark' => Yii::t('app', 'Remark'),
            'province_id' => Yii::t('app', 'Province ID'),
            'award_id' => Yii::t('app', 'Award ID'),
            'stat_hornorcoin_province_id' => Yii::t('app', 'Stat Hornorcoin Province ID'),
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
    public function getStatHornorcoinProvince()
    {
        return $this->hasOne(StatHornorcoinProvince::className(), ['id' => 'stat_hornorcoin_province_id']);
    }

    /**
     * @inheritdoc
     * @return StatHornorcoinProvinceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatHornorcoinProvinceDetailQuery(get_called_class());
    }
}
