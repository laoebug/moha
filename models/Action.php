<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "action".
 *
 * @property integer $id
 * @property string $code
 * @property string $deleted
 * @property integer $controller_id
 *
 * @property Controller $controller
 * @property RoleHasAction[] $roleHasActions
 * @property Role[] $roles
 */
class Action extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'action';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code', 'controller_id'], 'required'],
            [['controller_id'], 'integer'],
            [['code'], 'string', 'max' => 255],
            [['deleted'], 'string', 'max' => 1],
            [['controller_id'], 'exist', 'skipOnError' => true, 'targetClass' => Controller::className(), 'targetAttribute' => ['controller_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'deleted' => Yii::t('app', 'Deleted'),
            'controller_id' => Yii::t('app', 'Controller ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getController()
    {
        return $this->hasOne(Controller::className(), ['id' => 'controller_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoleHasActions()
    {
        return $this->hasMany(RoleHasAction::className(), ['action_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), ['id' => 'role_id'])->viaTable('role_has_action', ['action_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return ActionQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ActionQuery(get_called_class());
    }
}
