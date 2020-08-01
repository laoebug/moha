<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use Yii;
/**
 * MenuSearch represents the model behind the search form about `app\models\Menu`.
 */
class MenuSearch extends Menu
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'menugroup_id'], 'integer'],
            [['name', 'url', 'deleted'], 'safe'],
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

    	$user = Yii::$app->user->identity;    	
		if($user->role ["is_province"]){			
			$query = Menu::find()->where('has_province =:has_province AND menu_parent_id=:menu_parent_id and id in (select menu_id from role_has_menu where role_id=:role_id)',
					[
							':has_province' => $user->role ["is_province"],
							':menu_parent_id' => $params["id"],
							':role_id' => $user->role["id"]
							
					])->orderBy(['position'=>SORT_ASC]);
		}else {
			$query = Menu::find()->orderBy(['position'=>SORT_ASC]);
		}
        
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
            'menugroup_id' => $this->menugroup_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'url', $this->url])
            ->andFilterWhere(['like', 'deleted', $this->deleted]);

        return $dataProvider;
    }
}
