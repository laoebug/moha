<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_organisation_add_detail".
 *
 * @property int $id
 * @property int $add
 * @property int $resign
 * @property int $stat_officer_organisation_add_id
 * @property int $organisation_id
 *
 * @property Organisation $organisation
 * @property StatOfficerOrganisationAdd $statOfficerOrganisationAdd
 */
class StatOfficerOrganisationAddDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_organisation_add_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['add', 'resign', 'stat_officer_organisation_add_id', 'organisation_id'], 'integer'],
            [['stat_officer_organisation_add_id', 'organisation_id'], 'required'],
            [['organisation_id'], 'exist', 'skipOnError' => true, 'targetClass' => Organisation::className(), 'targetAttribute' => ['organisation_id' => 'id']],
            [['stat_officer_organisation_add_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerOrganisationAdd::className(), 'targetAttribute' => ['stat_officer_organisation_add_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'add' => Yii::t('app', 'Add'),
            'resign' => Yii::t('app', 'Resign'),
            'stat_officer_organisation_add_id' => Yii::t('app', 'Stat Officer Organisation Add ID'),
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
    public function getStatOfficerOrganisationAdd()
    {
        return $this->hasOne(StatOfficerOrganisationAdd::className(), ['id' => 'stat_officer_organisation_add_id']);
    }
}
