<?php
namespace app\models;

use Yii;

/**
 * This is the model class for table "menu".
 *
 * @property integer $id
 * @property string $name
 * @property string $url
 * @property string $description
 * @property integer $deleted
 * @property integer $menugroup_id
 * @property integer $menu_parent_id
 * @property integer $input_id
 * @property string $input_dt_stamp
 *
 * @property Menu $menuParent
 * @property Menu[] $menus
 * @property Menugroup $menugroup
 * @property User $input
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
            'description' => Yii::t('app', 'Description'),
            'deleted' => Yii::t('app', 'Deleted'),
            'menugroup_id' => Yii::t('app', 'Menugroup ID'),
            'menu_parent_id' => Yii::t('app', 'Menu Parent ID'),
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp')
        ];
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

    public function getMenus($parent_id, $level)
    {
        
//         // retrieve all children of $parent
//         $result = mysql_query('SELECT title FROM menu ' . 'WHERE $parent_id="' . $parent_id . '";');
        
//         // display each child
//         while ($row = mysql_fetch_array($result)) {
//             // indent and display the title of this child
//             echo str_repeat('  ', $level) . $row['name'] . "n";
            
//             // call this function again to display this
//             // child's children
//             display_children($row['name'], $level + 1);
//         }
//         exit;
    }
    
}
