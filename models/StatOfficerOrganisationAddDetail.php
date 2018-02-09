<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_organisation_add_detail".
 *
 * @property integer $id
 * @property integer $add
 * @property integer $resign
 * @property integer $stat_officer_organisation_add_id
 * @property integer $organisation_id
 *
 * @property Organisation $organisation
 * @property StatOfficerOrganisationAdd $statOfficerOrganisationAdd
 */
class StatOfficerOrganisationAddDetail extends \yii\db\ActiveRecord
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
            [['stat_officer_organisation_add_id', 'organisation_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
     * @return \yii\db\ActiveQuery
     */
    public function getOrganisation()
    {
        return $this->hasOne(Organisation::className(), ['id' => 'organisation_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationAdd()
    {
        return $this->hasOne(StatOfficerOrganisationAdd::className(), ['id' => 'stat_officer_organisation_add_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerOrganisationAddDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerOrganisationAddDetailQuery(get_called_class());
    }
}
