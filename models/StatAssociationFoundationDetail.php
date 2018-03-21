<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_association_foundation_detail".
 *
 * @property integer $id
 * @property integer $association
 * @property integer $foundation
 * @property string $remark
 * @property integer $stat_association_foundation_id
 * @property integer $approver_id
 *
 * @property Approver $approver
 * @property StatAssociationFoundation $statAssociationFoundation
 */
class StatAssociationFoundationDetail extends \yii\db\ActiveRecord
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
            [['stat_association_foundation_id', 'approver_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
     * @return \yii\db\ActiveQuery
     */
    public function getApprover()
    {
        return $this->hasOne(Approver::className(), ['id' => 'approver_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAssociationFoundation()
    {
        return $this->hasOne(StatAssociationFoundation::className(), ['id' => 'stat_association_foundation_id']);
    }

    /**
     * @inheritdoc
     * @return StatAssociationFoundationDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatAssociationFoundationDetailQuery(get_called_class());
    }
}
