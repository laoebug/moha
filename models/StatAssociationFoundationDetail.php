<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_association_foundation_detail".
 *
 * @property int $id
 * @property int $association
 * @property int $foundation
 * @property string $remark
 * @property int $stat_association_foundation_id
 * @property int $approver_id
 * @property string $date_notice_use
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
            [['stat_association_foundation_id', 'approver_id'], 'required'],
            [['date_notice_use'], 'string', 'max' => 45],
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
            'date_notice_use' => Yii::t('app', 'Date Notice Use'),
        ];
    }

    /**
     * @inheritdoc
     * @return StatAssociationFoundationDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatAssociationFoundationDetailQuery(get_called_class());
    }

    public function getApprover()
    {
        return $this->hasOne(Approver::className(), ['id' => 'approver_id']);
    }
    
}
