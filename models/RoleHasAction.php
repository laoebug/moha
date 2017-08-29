<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "role_has_action".
 *
 * @property integer $role_id
 * @property integer $action_id
 * @property string $allowed
 *
 * @property Action $action
 * @property Role $role
 */
class RoleHasAction extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'role_has_action';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'action_id'], 'required'],
            [['role_id', 'action_id'], 'integer'],
            [['allowed'], 'string', 'max' => 1],
            [['action_id'], 'exist', 'skipOnError' => true, 'targetClass' => Action::className(), 'targetAttribute' => ['action_id' => 'id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'role_id' => Yii::t('app', 'Role ID'),
            'action_id' => Yii::t('app', 'Action ID'),
            'allowed' => Yii::t('app', 'Allowed'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAction()
    {
        return $this->hasOne(Action::className(), ['id' => 'action_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }

    /**
     * @inheritdoc
     * @return RoleHasActionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new RoleHasActionQuery(get_called_class());
    }
}
