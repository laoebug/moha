<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "branch_group".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 *
 * @property Branch[] $branches
 */
class BranchGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'branch_group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['deleted', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['branch_group_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return BranchGroupQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new BranchGroupQuery(get_called_class());
    }
}
