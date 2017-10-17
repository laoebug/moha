<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $url
 * @property string $icon
 * @property string $description
 * @property integer $deleted
 * @property integer $menugroup_id
 * @property integer $menu_parent_id
 * @property integer $input_id
 * @property string $input_dt_stamp
 * @property integer $position
 * @property string $table_name
 *
 * @property Attachment[] $attachments
 * @property Menu $menuParent
 * @property Menu[] $menus
 * @property Menugroup $menugroup
 * @property User $input
 * @property RoleHasMenu[] $roleHasMenus
 * @property Role[] $roles
 */
class Menu extends \yii\db\ActiveRecord
{

    public $child_count;
    public $menu_id;
    public $role_id;
    public $has_province;
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
            [
                [
                    'name',
                    'url',
                    'menugroup_id'
                ],
                'required'
            ],
            [
                [
                    'deleted',
                    'menugroup_id',
                    'menu_parent_id',
                    'input_id'
                ],
                'integer'
            ],
            [
                [
                    'input_dt_stamp'
                ],
                'safe'
            ],
            [
                [
                    'name'
                ],
                'string',
                'max' => 45
            ],
            [
                [
                    'url',
                    'description'
                ],
                'string',
                'max' => 255
            ],
            [
                [
                    'menu_parent_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => Menu::className(),
                'targetAttribute' => [
                    'menu_parent_id' => 'id'
                ]
            ],
            [
                [
                    'menugroup_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => Menugroup::className(),
                'targetAttribute' => [
                    'menugroup_id' => 'id'
                ]
            ],
            [
                [
                    'input_id'
                ],
                'exist',
                'skipOnError' => true,
                'targetClass' => User::className(),
                'targetAttribute' => [
                    'input_id' => 'id'
                ]
            ]
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
            'icon' => Yii::t('app', 'Icon'),
            'description' => Yii::t('app', 'Description'),
            'deleted' => Yii::t('app', 'Deleted'),
            'menugroup_id' => Yii::t('app', 'Menugroup ID'),
            'menu_parent_id' => Yii::t('app', 'Menu Parent ID'),
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'position' => Yii::t('app', 'Position'),
            'table_name' => Yii::t('app', 'Table Name'),
        ];
    }

    /**
     * * @return \yii\db\ActiveQuery
     */
    public function getAttachments()
    {
        return $this->hasMany(Attachment::className(), ['menu_id' => 'id']);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMenuParent()
    {
        return $this->hasOne(Menu::className(), [
            'id' => 'menu_parent_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMenus()
    {
        return $this->hasMany(Menu::className(), [
            'menu_parent_id' => 'id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMenugroup()
    {
        return $this->hasOne(Menugroup::className(), [
            'id' => 'menugroup_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getInput()
    {
        return $this->hasOne(User::className(), [
            'id' => 'input_id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRoleHasMenus()
    {
        return $this->hasMany(RoleHasMenu::className(), [
            'menu_id' => 'id'
        ]);
    }

    /**
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRoles()
    {
        return $this->hasMany(Role::className(), [
            'id' => 'role_id'
        ])->viaTable('role_has_menu', [
            'menu_id' => 'id'
        ]);
    }
    
    public static function displayMenu()
    {
        
//         $user = User::findOne(Yii::$app->user->id);
        
//         $parent_menu = array();
//         $sub_menu = array();
        
//         try {
            
            
//             $sql = " SELECT a.* FROM `menu` a , role_has_menu b ";
//             $sql .= " where a.id=b.menu_id and b.role_id=:role_id";
            
//             $command = Yii::$app->db->createCommand($sql);
//             $command->bindValue(':role_id', $user->role_id);
//             $rows = $command->queryAll();
            
//             foreach ($rows as $row) {
            
//             }
//         } catch (Exception $e) {
//             echo "Data could not be retrieved";
//             exit();
//         }
        
        // exit();
    }
}
