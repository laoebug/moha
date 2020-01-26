<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_highcoin_foreigner_detail".
 *
 * @property int $id
 * @property int $national_personal
 * @property int $national_group
 * @property int $million_personal
 * @property int $million_group
 * @property int $hornor_personal
 * @property int $hornor_group
 * @property string $remark
 * @property int $ministry_id
 * @property int $award_id
 * @property int $stat_highcoin_foreigner_id
 *
 * @property Award $award
 * @property Ministry $ministry
 * @property StatHighcoinForeigner $statHighcoinForeigner
 */
class StatHighcoinForeignerDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_highcoin_foreigner_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['national_personal', 'national_group', 'million_personal', 'million_group', 'hornor_personal', 'hornor_group', 'ministry_id', 'award_id', 'stat_highcoin_foreigner_id'], 'integer'],
            [['ministry_id', 'award_id', 'stat_highcoin_foreigner_id'], 'required'],
            [['remark'], 'string', 'max' => 255],
            [['award_id'], 'exist', 'skipOnError' => true, 'targetClass' => Award::className(), 'targetAttribute' => ['award_id' => 'id']],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_highcoin_foreigner_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatHighcoinForeigner::className(), 'targetAttribute' => ['stat_highcoin_foreigner_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'national_personal' => Yii::t('app', 'National Personal'),
            'national_group' => Yii::t('app', 'National Group'),
            'million_personal' => Yii::t('app', 'Million Personal'),
            'million_group' => Yii::t('app', 'Million Group'),
            'hornor_personal' => Yii::t('app', 'Hornor Personal'),
            'hornor_group' => Yii::t('app', 'Hornor Group'),
            'remark' => Yii::t('app', 'Remark'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'award_id' => Yii::t('app', 'Award ID'),
            'stat_highcoin_foreigner_id' => Yii::t('app', 'Stat Highcoin Foreigner ID'),
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
    public function getStatHighcoinForeigner()
    {
        return $this->hasOne(StatHighcoinForeigner::className(), ['id' => 'stat_highcoin_foreigner_id']);
    }
}
