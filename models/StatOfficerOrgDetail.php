<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_org_detail".
 *
 * @property integer $id
 * @property integer $total
 * @property integer $women
 * @property integer $stat_officer_org_id
 * @property integer $organisation_id
 *
 * @property Organisation $organisation
 * @property StatOfficerOrg $statOfficerOrg
 */
class StatOfficerOrgDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_org_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total', 'women', 'stat_officer_org_id', 'organisation_id'], 'integer'],
            [['stat_officer_org_id', 'organisation_id'], 'required'],
            [['organisation_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organisation::className(), 'targetAttribute' => ['organisation_id' => 'id']],
            [['stat_officer_org_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerOrg::className(), 'targetAttribute' => ['stat_officer_org_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'stat_officer_org_id' => Yii::t('app', 'Stat Officer Org ID'),
            'organisation_id' => Yii::t('app', 'Organisation ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrganisation()
    {
        return $this->hasOne(Organisation::className(), ['id' => 'organisation_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrg()
    {
        return $this->hasOne(StatOfficerOrg::className(), ['id' => 'stat_officer_org_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrgDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerOrgDetailQuery(get_called_class());
    }
}
