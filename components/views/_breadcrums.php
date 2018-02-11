<?php
// use Yii;
use app\models\User;
use app\models\Menu;
?>
<?php
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ'), 'url' => ['index']];
// $this->title = "ຕາຕະລາງສັງລວມພະນັກງານຕາມສັນຍາKKKKK";
// $this->params['breadcrumbs'][] = $this->title;
// 	echo $breadcrumbs;
// 	foreach ($breadcrumbs as $breadcrumb){
// 		//echo $breadcrumb;
// 		print_r($breadcrumb);
// 	}
// 	echo count($menus);exit;
?>
<?php if(count($menus)>0): ?>
<?php foreach ($menus as $menu): ?>
<!-- Top Menu without any submenu -->
<?php //if($menu->menu_parent_id==0 && $menu->childcount==0): ?>
<?php if($menu->menu_parent_id==0): ?>
<?php //$url ="#"; ?>
<?php //$url= Yii::$app->request->getUrl(); ?>
<?php //$this->params['breadcrumbs'][] = ['label' => Yii::t('app', $menu->name), 'url' =>  $url];?>
<?php else: ?>
<?php //$url= Yii::$app->request->getUrl(); ?>
<?php //$this->params['breadcrumbs'][] = ['label' => Yii::t('app', $menu->name), 'url' =>  $url];?>
<?php endif;?>

<?php $url= Yii::$app->request->getUrl(); ?>
<?php $this->params['breadcrumbs'][] = ['label' => Yii::t('app', $menu->name), 'url' =>  $url];?>

<?php endforeach;?>
<?php endif;?>