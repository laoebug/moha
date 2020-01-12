<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_highcoin_ministry_detail".
 *
 * @property int $id
 * @property int $gold_personal
 * @property int $gold_team
 * @property int $hero_personal
 * @property int $hero_team
 * @property int $knight_personal
 * @property int $knight_team
 * @property int $labor_personal
 * @property int $labor_team
 * @property int $dev_personal
 * @property int $dev_team
 * @property string $remark
 * @property int $stat_highcoin_ministry_id
 * @property int $award_id
 * @property int $ministry_id
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatHighcoinMinistry $statHighcoinMinistry
 */
class StatHighcoinMinistryDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getAward()
    {
        return $this->hasOne(Award::className(), ['id' => 'award_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHighcoinMinistry()
    {
        return $this->hasOne(StatHighcoinMinistry::className(), ['id' => 'stat_highcoin_ministry_id']);
    }
}
