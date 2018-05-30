<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Province]].
 *
 * @see Province
 */
use Yii;

class ProvinceQuery extends \yii\db\ActiveQuery
{
    /*
     * public function active()
     * {
     * return $this->andWhere('[[status]]=1');
     * }
     */
    public function init()
    {
        parent::init();
        $user = Yii::$app->user->identity;
        $modelClass = $this->modelClass;
        $tableName = $modelClass::tableName();
        if (!empty ($user->role->province_id)) {
            $this->onCondition($tableName . '.deleted <> :deleted AND ' . $tableName . '.id = :id ', [
                ':deleted' => 1,
                ':id' => $user->role->province_id
            ]);
        } else {
            $this->onCondition($tableName . '.deleted <> :deleted ', [
                ':deleted' => 1
            ]);
        }
    }

    /**
     * @inheritdoc
     *
     * @return Province[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     *
     * @return Province|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
