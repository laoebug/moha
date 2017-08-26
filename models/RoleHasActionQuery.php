<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[RoleHasAction]].
 *
 * @see RoleHasAction
 */
class RoleHasActionQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return RoleHasAction[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return RoleHasAction|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
