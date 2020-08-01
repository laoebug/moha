<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_org_detail".
 *
 * @property int $id
 * @property int $total
 * @property int $women
 * @property int $stat_officer_org_id
 * @property int $organisation_id
 *
 * @property Organisation $organisation
 * @property StatOfficerOrg $statOfficerOrg
 */
class StatOfficerOrgDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getOrganisation()
    {
        return $this->hasOne(Organisation::className(), ['id' => 'organisation_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerOrg()
    {
        return $this->hasOne(StatOfficerOrg::className(), ['id' => 'stat_officer_org_id']);
    }
}
