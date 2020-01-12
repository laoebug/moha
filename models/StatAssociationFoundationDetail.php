<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_association_foundation_detail".
 *
 * @property int $id
 * @property int $association
 * @property int $foundation
 * @property string $remark
 * @property int $stat_association_foundation_id
 * @property int $approver_id
 *
 * @property Approver $approver
 * @property StatAssociationFoundation $statAssociationFoundation
 */
class StatAssociationFoundationDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_association_foundation_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['association', 'foundation', 'stat_association_foundation_id', 'approver_id'], 'integer'],
            [['remark'], 'string'],
            [['stat_association_foundation_id', 'approver_id'], 'required'],
            [['approver_id'], 'exist', 'skipOnError' => true, 'targetClass' => Approver::className(), 'targetAttribute' => ['approver_id' => 'id']],
            [['stat_association_foundation_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatAssociationFoundation::className(), 'targetAttribute' => ['stat_association_foundation_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'association' => Yii::t('app', 'Association'),
            'foundation' => Yii::t('app', 'Foundation'),
            'remark' => Yii::t('app', 'Remark'),
            'stat_association_foundation_id' => Yii::t('app', 'Stat Association Foundation ID'),
            'approver_id' => Yii::t('app', 'Approver ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getApprover()
    {
        return $this->hasOne(Approver::className(), ['id' => 'approver_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatAssociationFoundation()
    {
        return $this->hasOne(StatAssociationFoundation::className(), ['id' => 'stat_association_foundation_id']);
    }
}
