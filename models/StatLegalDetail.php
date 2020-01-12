<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_legal_detail".
 *
 * @property int $id
 * @property int $new
 * @property string $remark
 * @property int $improve
 * @property string $publish
 * @property int $stat_legal_id
 * @property int $legal_id
 * @property string $legal_name
 * @property int $legal_type_id
 *
 * @property Legal $legal
 * @property StatLegal $statLegal
 */
class StatLegalDetail extends ActiveRecord
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
            [['new', 'improve', 'stat_legal_id', 'legal_id', 'legal_type_id'], 'integer'],
            [['remark', 'legal_name'], 'string'],
            [['stat_legal_id', 'legal_id'], 'required'],
            [['publish'], 'string', 'max' => 255],
            [['legal_id'], 'exist', 'skipOnError' => true, 'targetClass' => Legal::className(), 'targetAttribute' => ['legal_id' => 'id']],
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
            'legal_id' => Yii::t('app', 'Legal ID'),
            'legal_name' => Yii::t('app', 'Legal Name'),
            'legal_type_id' => Yii::t('app', 'Legal Type ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getLegal()
    {
        return $this->hasOne(Legal::className(), ['id' => 'legal_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatLegal()
    {
        return $this->hasOne(StatLegal::className(), ['id' => 'stat_legal_id']);
    }
}
