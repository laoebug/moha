<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "goverment_unit".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $branch_id
 * @property string $effective_date
 *
 * @property Branch $branch
 */
class GovermentUnit extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goverment_unit';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'branch_id', 'effective_date'], 'required'],
            [['deleted', 'branch_id'], 'integer'],
            [['effective_date'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
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
            'branch_id' => Yii::t('app', 'Branch ID'),
            'effective_date' => Yii::t('app', 'Effective Date'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branch::className(), ['id' => 'branch_id']);
    }

    /**
     * @inheritdoc
     * @return GovermentUnitQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new GovermentUnitQuery(get_called_class());
    }
}
