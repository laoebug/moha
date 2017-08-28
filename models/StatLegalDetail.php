<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_legal_detail".
 *
 * @property integer $id
 * @property integer $stat_legal_id
 * @property integer $legal_status_id
 * @property integer $value
 * @property string $remark
 *
 * @property LegalStatus $legalStatus
 * @property StatLegal $statLegal
 */
class StatLegalDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_legal_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_legal_id', 'legal_status_id'], 'required'],
            [['stat_legal_id', 'legal_status_id', 'value'], 'integer'],
            [['remark'], 'string'],
            [['legal_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => LegalStatus::className(), 'targetAttribute' => ['legal_status_id' => 'id']],
            [['stat_legal_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatLegal::className(), 'targetAttribute' => ['stat_legal_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_legal_id' => Yii::t('app', 'Stat Legal ID'),
            'legal_status_id' => Yii::t('app', 'Legal Status ID'),
            'value' => Yii::t('app', 'Value'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLegalStatus()
    {
        return $this->hasOne(LegalStatus::className(), ['id' => 'legal_status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegal()
    {
        return $this->hasOne(StatLegal::className(), ['id' => 'stat_legal_id']);
    }

    /**
     * @inheritdoc
     * @return StatLegalDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatLegalDetailQuery(get_called_class());
    }
}
