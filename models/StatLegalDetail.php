<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_legal_detail".
 *
 * @property integer $id
 * @property integer $new
 * @property string $remark
 * @property integer $improve
 * @property integer $publish
 * @property integer $stat_legal_id
 *
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
            [['new', 'improve', 'publish', 'stat_legal_id'], 'integer'],
            [['remark'], 'string'],
            [['stat_legal_id'], 'required'],
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
            'new' => Yii::t('app', 'New'),
            'remark' => Yii::t('app', 'Remark'),
            'improve' => Yii::t('app', 'Improve'),
            'publish' => Yii::t('app', 'Publish'),
            'stat_legal_id' => Yii::t('app', 'Stat Legal ID'),
        ];
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
