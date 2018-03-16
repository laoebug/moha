<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\StatSingleGatewayImplementation;

/**
 * StatSingleGatewayImplementationSearch represents the model behind the search form about `app\models\StatSingleGatewayImplementation`.
 */
class StatSingleGatewayImplementationSearch extends StatSingleGatewayImplementation
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'phiscal_year_id', 'status'], 'integer'],
            [['last_update'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StatSingleGatewayImplementation::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'phiscal_year_id' => $this->phiscal_year_id,
            'last_update' => $this->last_update,
            'status' => $this->status,
        ]);

        return $dataProvider;
    }
}
