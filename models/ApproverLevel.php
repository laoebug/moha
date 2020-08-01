<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "approver_level".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $position
 * @property string $code M:Ministry P:Province
 *
 * @property Approver[] $approvers
 */
class ApproverLevel extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getApprovers()
    {
        return $this->hasMany(Approver::className(), ['approver_level_id' => 'id']);
    }
}
