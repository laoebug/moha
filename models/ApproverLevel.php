<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "approver_level".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 * @property string $code
 *
 * @property Approver[] $approvers
 */
class ApproverLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'approver_level';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['deleted', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
            'code' => Yii::t('app', 'Code'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getApprovers()
    {
        return $this->hasMany(Approver::className(), ['approver_level_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return ApproverLevelQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ApproverLevelQuery(get_called_class());
    }
}
