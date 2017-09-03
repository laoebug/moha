<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ministry".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property string $code
 * @property string $last_update
 * @property integer $ministry_group_id
 * @property integer $position
 * @property integer $phiscal_year_id
 * @property integer $user_id
 *
 * @property Branch[] $branches
 * @property MinistryGroup $ministryGroup
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 * @property StatSingleGatewayImplementationDetail[] $statSingleGatewayImplementationDetails
 */
class Ministry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ministry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'last_update', 'phiscal_year_id', 'user_id'], 'required'],
            [['deleted', 'ministry_group_id', 'position', 'phiscal_year_id', 'user_id'], 'integer'],
            [['last_update'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 5],
            [['ministry_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => MinistryGroup::className(), 'targetAttribute' => ['ministry_group_id' => 'id']],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
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
            'code' => Yii::t('app', 'Code'),
            'last_update' => Yii::t('app', 'Last Update'),
            'ministry_group_id' => Yii::t('app', 'Ministry Group ID'),
            'position' => Yii::t('app', 'Position'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranches()
    {
        return $this->hasMany(Branch::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistryGroup()
    {
        return $this->hasOne(MinistryGroup::className(), ['id' => 'ministry_group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementationDetails()
    {
        return $this->hasMany(StatSingleGatewayImplementationDetail::className(), ['ministry_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return MinistryQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MinistryQuery(get_called_class());
    }
}
