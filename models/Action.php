<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "action".
 *
 * @property int $id
 * @property string $class_name
 * @property string $method
 * @property int $deleted
 * @property int $controller_id
 * @property string $description
 * @property int $parent_id
 * @property int $position
 *
 * @property RoleHasAction[] $roleHasActions
 * @property Role[] $roles
 */
class Action extends ActiveRecord
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
            [['class_name', 'method'], 'required'],
            [['deleted', 'controller_id', 'parent_id', 'position'], 'integer'],
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
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getRoleHasActions()
    {
        return $this->hasMany(RoleHasAction::className(), ['action_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), ['id' => 'role_id'])->viaTable('role_has_action', ['action_id' => 'id']);
    }
}
