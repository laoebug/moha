<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_victoryoversea_ministry_detail".
 *
 * @property int $id
 * @property int $free1_personal
 * @property int $free1_team
 * @property int $free2_personal
 * @property int $free2_team
 * @property int $free3_personal
 * @property int $free3_team
 * @property int $revo1_personal
 * @property int $revo1_team
 * @property int $revo2_personal
 * @property int $revo2_team
 * @property int $revo3_personal
 * @property int $revo3_team
 * @property int $labo1_personal
 * @property int $labo1_team
 * @property int $labo2_personal
 * @property int $labo2_team
 * @property int $labo3_personal
 * @property int $labo3_team
 * @property int $deve1_personal
 * @property int $deve1_team
 * @property int $deve2_personal
 * @property int $deve2_team
 * @property int $deve3_personal
 * @property int $deve3_team
 * @property string $remark
 * @property int $frien_personal
 * @property int $frien_team
 * @property int $stat_victoryoversea_ministry_id
 * @property int $ministry_id
 * @property int $award_id
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatVictoryoverseaMinistry $statVictoryoverseaMinistry
 */
class StatVictoryoverseaMinistryDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_victoryoversea_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['free1_personal', 'free1_team', 'free2_personal', 'free2_team', 'free3_personal', 'free3_team', 'revo1_personal', 'revo1_team', 'revo2_personal', 'revo2_team', 'revo3_personal', 'revo3_team', 'labo1_personal', 'labo1_team', 'labo2_personal', 'labo2_team', 'labo3_personal', 'labo3_team', 'deve1_personal', 'deve1_team', 'deve2_personal', 'deve2_team', 'deve3_personal', 'deve3_team', 'frien_personal', 'frien_team', 'stat_victoryoversea_ministry_id', 'ministry_id', 'award_id'], 'integer'],
            [['stat_victoryoversea_ministry_id', 'ministry_id', 'award_id'], 'required'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_victoryoversea_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatVictoryoverseaMinistry::className(), 'targetAttribute' => ['stat_victoryoversea_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'free1_personal' => Yii::t('app', 'Free1 Personal'),
            'free1_team' => Yii::t('app', 'Free1 Team'),
            'free2_personal' => Yii::t('app', 'Free2 Personal'),
            'free2_team' => Yii::t('app', 'Free2 Team'),
            'free3_personal' => Yii::t('app', 'Free3 Personal'),
            'free3_team' => Yii::t('app', 'Free3 Team'),
            'revo1_personal' => Yii::t('app', 'Revo1 Personal'),
            'revo1_team' => Yii::t('app', 'Revo1 Team'),
            'revo2_personal' => Yii::t('app', 'Revo2 Personal'),
            'revo2_team' => Yii::t('app', 'Revo2 Team'),
            'revo3_personal' => Yii::t('app', 'Revo3 Personal'),
            'revo3_team' => Yii::t('app', 'Revo3 Team'),
            'labo1_personal' => Yii::t('app', 'Labo1 Personal'),
            'labo1_team' => Yii::t('app', 'Labo1 Team'),
            'labo2_personal' => Yii::t('app', 'Labo2 Personal'),
            'labo2_team' => Yii::t('app', 'Labo2 Team'),
            'labo3_personal' => Yii::t('app', 'Labo3 Personal'),
            'labo3_team' => Yii::t('app', 'Labo3 Team'),
            'deve1_personal' => Yii::t('app', 'Deve1 Personal'),
            'deve1_team' => Yii::t('app', 'Deve1 Team'),
            'deve2_personal' => Yii::t('app', 'Deve2 Personal'),
            'deve2_team' => Yii::t('app', 'Deve2 Team'),
            'deve3_personal' => Yii::t('app', 'Deve3 Personal'),
            'deve3_team' => Yii::t('app', 'Deve3 Team'),
            'remark' => Yii::t('app', 'Remark'),
            'frien_personal' => Yii::t('app', 'Frien Personal'),
            'frien_team' => Yii::t('app', 'Frien Team'),
            'stat_victoryoversea_ministry_id' => Yii::t('app', 'Stat Victoryoversea Ministry ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'award_id' => Yii::t('app', 'Award ID'),
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
    public function getStatVictoryoverseaMinistry()
    {
        return $this->hasOne(StatVictoryoverseaMinistry::className(), ['id' => 'stat_victoryoversea_ministry_id']);
    }
}
