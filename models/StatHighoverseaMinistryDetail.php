<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_highoversea_ministry_detail".
 *
 * @property integer $id
 * @property integer $stat_highoversea_ministry_id
 * @property integer $ministry_id
 * @property integer $award_id
 * @property integer $gold_personal
 * @property integer $gold_team
 * @property integer $lanx_personal
 * @property integer $lanx_team
 * @property integer $hono_personal
 * @property integer $hono_team
 * @property string $remark
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatHighoverseaMinistry $statHighoverseaMinistry
 */
class StatHighoverseaMinistryDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_highoversea_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_highoversea_ministry_id', 'ministry_id', 'award_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_highoversea_ministry_id', 'ministry_id', 'award_id', 'gold_personal', 'gold_team', 'lanx_personal', 'lanx_team', 'hono_personal', 'hono_team'], 'integer'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_highoversea_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatHighoverseaMinistry::className(), 'targetAttribute' => ['stat_highoversea_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_highoversea_ministry_id' => Yii::t('app', 'Stat Highoversea Ministry ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'award_id' => Yii::t('app', 'Award ID'),
            'gold_personal' => Yii::t('app', 'Gold Personal'),
            'gold_team' => Yii::t('app', 'Gold Team'),
            'lanx_personal' => Yii::t('app', 'Lanx Personal'),
            'lanx_team' => Yii::t('app', 'Lanx Team'),
            'hono_personal' => Yii::t('app', 'Hono Personal'),
            'hono_team' => Yii::t('app', 'Hono Team'),
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
    public function getStatHighoverseaMinistry()
    {
        return $this->hasOne(StatHighoverseaMinistry::className(), ['id' => 'stat_highoversea_ministry_id']);
    }

    /**
     * @inheritdoc
     * @return StatHighoverseaMinistryDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatHighoverseaMinistryDetailQuery(get_called_class());
    }
}
