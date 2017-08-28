<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "phiscal_year".
 *
 * @property integer $id
 * @property string $year
 * @property string $start_date
 * @property string $end_date
 * @property integer $deleted
 * @property string $status
 *
 * @property StatAssociationFoundation[] $statAssociationFoundations
 * @property StatGovermentUnit[] $statGovermentUnits
 * @property StatLegal[] $statLegals
 * @property StatSingleGatewayImplementation[] $statSingleGatewayImplementations
 */
class PhiscalYear extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'phiscal_year';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['year', 'start_date', 'end_date'], 'required'],
            [['start_date', 'end_date'], 'safe'],
            [['deleted'], 'integer'],
            [['year'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],
            [['year'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'year' => Yii::t('app', 'Year'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'deleted' => Yii::t('app', 'Deleted'),
            'status' => Yii::t('app', 'Status'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAssociationFoundations()
    {
        return $this->hasMany(StatAssociationFoundation::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnits()
    {
        return $this->hasMany(StatGovermentUnit::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegals()
    {
        return $this->hasMany(StatLegal::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementations()
    {
        return $this->hasMany(StatSingleGatewayImplementation::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return PhiscalYearQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PhiscalYearQuery(get_called_class());
    }
}
