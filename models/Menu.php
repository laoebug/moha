<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $url
 * @property string $deleted
 * @property integer $menugroup_id
 *
 * @property Menugroup $menugroup
 * @property RoleHasMenu[] $roleHasMenus
 * @property Role[] $roles
 */
class Menu extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'menu';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'url', 'deleted', 'menugroup_id'], 'required'],
            [['menugroup_id'], 'integer'],
            [['name'], 'string', 'max' => 45],
            [['url'], 'string', 'max' => 255],
            [['deleted'], 'string', 'max' => 1],
            [['menugroup_id'], 'exist', 'skipOnError' => true, 'targetClass' => Menugroup::className(), 'targetAttribute' => ['menugroup_id' => 'id']],
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
            'url' => Yii::t('app', 'Url'),
            'deleted' => Yii::t('app', 'Deleted'),
            'menugroup_id' => Yii::t('app', 'Menu Group'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenugroup()
    {
        return $this->hasOne(Menugroup::className(), ['id' => 'menugroup_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoleHasMenus()
    {
        return $this->hasMany(RoleHasMenu::className(), ['menu_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), ['id' => 'role_id'])->viaTable('role_has_menu', ['menu_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return MenuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MenuQuery(get_called_class());
    }
}
