<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_investment_detail".
 *
 * @property integer $id
 * @property integer $stat_investment_id
 * @property string $place
 * @property string $description
 * @property string $implement
 * @property string $remark
 * @property integer $project_id
 * @property integer $deleted
 *
 * @property Project $project
 * @property StatInvestment $statInvestment
 */
class StatInvestmentDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_investment_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_investment_id', 'place', 'description', 'project_id'], 'required'],
            [['stat_investment_id', 'project_id', 'deleted'], 'integer'],
            [['description'], 'string'],
            [['place', 'implement', 'remark'], 'string', 'max' => 255],
            [['project_id'], 'exist', 'skipOnError' => true, 'targetClass' => Project::className(), 'targetAttribute' => ['project_id' => 'id']],
            [['stat_investment_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatInvestment::className(), 'targetAttribute' => ['stat_investment_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_investment_id' => Yii::t('app', 'Stat Investment ID'),
            'place' => Yii::t('app', 'Place'),
            'description' => Yii::t('app', 'Description'),
            'implement' => Yii::t('app', 'Implement'),
            'remark' => Yii::t('app', 'Remark'),
            'project_id' => Yii::t('app', 'Project ID'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProject()
    {
        return $this->hasOne(Project::className(), ['id' => 'project_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatInvestment()
    {
        return $this->hasOne(StatInvestment::className(), ['id' => 'stat_investment_id']);
    }
}
