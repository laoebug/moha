<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_highcoin_ministry_detail".
 *
 * @property integer $id
 * @property integer $gold_personal
 * @property integer $gold_team
 * @property integer $hero_personal
 * @property integer $hero_team
 * @property integer $knight_personal
 * @property integer $knight_team
 * @property integer $labor_personal
 * @property integer $labor_team
 * @property integer $dev_personal
 * @property integer $dev_team
 * @property string $remark
 * @property integer $stat_highcoin_ministry_id
 * @property integer $award_id
 * @property integer $ministry_id
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatHighcoinMinistry $statHighcoinMinistry
 */
class StatHighcoinMinistryDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_highcoin_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['gold_personal', 'gold_team', 'hero_personal', 'hero_team', 'knight_personal', 'knight_team', 'labor_personal', 'labor_team', 'dev_personal', 'dev_team', 'stat_highcoin_ministry_id', 'award_id', 'ministry_id'], 'integer'],
            [['stat_highcoin_ministry_id', 'award_id', 'ministry_id'], 'required'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_highcoin_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatHighcoinMinistry::className(), 'targetAttribute' => ['stat_highcoin_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'gold_personal' => Yii::t('app', 'Gold Personal'),
            'gold_team' => Yii::t('app', 'Gold Team'),
            'hero_personal' => Yii::t('app', 'Hero Personal'),
            'hero_team' => Yii::t('app', 'Hero Team'),
            'knight_personal' => Yii::t('app', 'Knight Personal'),
            'knight_team' => Yii::t('app', 'Knight Team'),
            'labor_personal' => Yii::t('app', 'Labor Personal'),
            'labor_team' => Yii::t('app', 'Labor Team'),
            'dev_personal' => Yii::t('app', 'Dev Personal'),
            'dev_team' => Yii::t('app', 'Dev Team'),
            'remark' => Yii::t('app', 'Remark'),
            'stat_highcoin_ministry_id' => Yii::t('app', 'Stat Highcoin Ministry ID'),
            'award_id' => Yii::t('app', 'Award ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
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
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatHighcoinMinistry()
    {
        return $this->hasOne(StatHighcoinMinistry::className(), ['id' => 'stat_highcoin_ministry_id']);
    }

    /**
     * @inheritdoc
     * @return StatHighcoinMinistryDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatHighcoinMinistryDetailQuery(get_called_class());
    }
}
