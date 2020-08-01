<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_govcoin_ministry_detail".
 *
 * @property int $id
 * @property int $stat_govcoin_ministry_id
 * @property int $ministry_id
 * @property int $award_id
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
 * @property int $remember_team
 * @property int $remember_personal
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatGovcoinMinistry $statGovcoinMinistry
 */
class StatGovcoinMinistryDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_govcoin_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_govcoin_ministry_id', 'ministry_id', 'award_id'], 'required'],
            [['stat_govcoin_ministry_id', 'ministry_id', 'award_id', 'labo_personal', 'labo_team', 'deve_personal', 'deve_team', 'memo_personal', 'memo_team', 'amer_personal', 'amer_team', 'fran_personal', 'fran_team', 'gove_personal', 'gove_team', 'remember_team', 'remember_personal'], 'integer'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_govcoin_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatGovcoinMinistry::className(), 'targetAttribute' => ['stat_govcoin_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_govcoin_ministry_id' => Yii::t('app', 'Stat Govcoin Ministry ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
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
            'remember_team' => Yii::t('app', 'Remember Team'),
            'remember_personal' => Yii::t('app', 'Remember Personal'),
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
    public function getStatGovcoinMinistry()
    {
        return $this->hasOne(StatGovcoinMinistry::className(), ['id' => 'stat_govcoin_ministry_id']);
    }
}
