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
    public $department_link;
    public $department_name;
    public $dept_id;
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
                'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')
            		
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
            'name' => 'ຊື່',
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
        	'department_name' => Yii::t('app', 'Department Name')
        		
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
    
 
    
    public static function  getMenuIdByParentId($menu_parent_id) {
    	$menuIds=[];
    	$connection = Yii::$app->db;
    	
    	$sql = " select a.id,menu_parent_id from menu a where a.deleted=:deleted AND id=:id;";
    	$params = [':deleted' => 0, ':id' => $menu_parent_id];
    	$command = $connection->createCommand ( $sql )->bindValues($params);
    	$results = $command->queryAll ();
    	foreach ($results as $row){
    		$menuIds[] =$row["id"];
    		//self::getMenuIdByParentId($row["menu_parent_id"]);
    		//$menu_parent_id = $row["menu_parent_id"];
    		//$menuIds[] = self::getMenuIdByParentId($menu_parent_id);
    		
    		if($row["menu_parent_id"]!=0 || $row["menu_parent_id"]!=''){
    			//$menuIds[] = self::getMenuIdByParentId($row["menu_parent_id"]);
    			$menuIds = array_merge(self::getMenuIdByParentId($row['menu_parent_id']), $menuIds);
    		}
    		
    	}
    	
    	//print_r($menuIds);exit;
    	return $menuIds;
    }
    
    public static function getMenuList($id) {    
    	$theMenus = [ ];
    	$menus = [ ];
    	if (isset ( $id ) && ! empty ( $id )) {
    		while ( 1 ) {
    			$sql = " select *,CONCAT('?r=department/view&id=', id) as department_link, ";
    			$sql.= " (select count(*) from menu where menu_parent_id=:menu_parent_id) as child_count ";
    			$sql.= " from menu where id=:id ";

    			$params = [
    					':menu_parent_id' => $id,
    					':id' => $id    					
    			];    			
    			$menu = Menu::findBySql($sql, $params)->one();    			    			    			    			
    			if (isset ( $menu )) {
    				$theMenus [] = $menu;
    				if (isset ( $menu->menu_parent_id ) && $menu->menu_parent_id == 0) {
    					$id = 0;
    				} else {
    					$id = $menu->menu_parent_id;
    				}
    			}
    
    			if ($menu->menu_parent_id == 0) {
    				break;
    			}
    		}
    
    		$menus = array_reverse ( $theMenus );
    	}
    	return $menus;
    }
}
