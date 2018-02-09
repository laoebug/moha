<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_govcoin_ministry_detail".
 *
 * @property integer $id
 * @property integer $stat_govcoin_ministry_id
 * @property integer $ministry_id
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
 * @property Ministry $ministry
 * @property StatGovcoinMinistry $statGovcoinMinistry
 */
class StatGovcoinMinistryDetail extends \yii\db\ActiveRecord
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
            [['stat_govcoin_ministry_id', 'ministry_id', 'award_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_govcoin_ministry_id', 'ministry_id', 'award_id', 'labo_personal', 'labo_team', 'deve_personal', 'deve_team', 'memo_personal', 'memo_team', 'amer_personal', 'amer_team', 'fran_personal', 'fran_team', 'gove_personal', 'gove_team'], 'integer'],
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
    public function getStatGovcoinMinistry()
    {
        return $this->hasOne(StatGovcoinMinistry::className(), ['id' => 'stat_govcoin_ministry_id']);
    }

    /**
     * @inheritdoc
     * @return StatGovcoinMinistryDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatGovcoinMinistryDetailQuery(get_called_class());
    }
}
