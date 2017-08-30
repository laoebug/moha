<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $url
 * @property integer $deleted
 * @property integer $menugroup_id
 * @property integer $menu_parent_id
 *
 * @property Menu $menuParent
 * @property Menu[] $menus
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
            [['name', 'url', 'menugroup_id'], 'required'],
            [['deleted', 'menugroup_id', 'menu_parent_id'], 'integer'],
            [['name'], 'string', 'max' => 45],
            [['url'], 'string', 'max' => 255],
            [['menu_parent_id'], 'exist', 'skipOnError' => true, 'targetClass' => Menu::className(), 'targetAttribute' => ['menu_parent_id' => 'id']],
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
            'menugroup_id' => Yii::t('app', 'Menugroup ID'),
            'menu_parent_id' => Yii::t('app', 'Menu Parent ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenuParent()
    {
        return $this->hasOne(Menu::className(), ['id' => 'menu_parent_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), ['menu_parent_id' => 'id']);
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
}
