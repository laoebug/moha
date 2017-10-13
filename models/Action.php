<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "action".
 *
 * @property integer $id
 * @property string $class_name
 * @property string $method
 * @property integer $deleted
 * @property integer $controller_id
 * @property string $description
 * @property integer $parent_id
 *
 * @property RoleHasAction[] $roleHasActions
 * @property Role[] $roles
 */
class Action extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
	public $role_id;
	public $action_id;
	public $allowed;
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
            [['class_name', 'method'], 'required'],
            [['deleted', 'controller_id', 'parent_id'], 'integer'],
            [['description'], 'string'],
            [['class_name', 'method'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'class_name' => Yii::t('app', 'Class Name'),
            'method' => Yii::t('app', 'Method'),
            'deleted' => Yii::t('app', 'Deleted'),
            'controller_id' => Yii::t('app', 'Controller ID'),
            'description' => Yii::t('app', 'Description'),
            'parent_id' => Yii::t('app', 'Parent ID'),
        ];
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
}
