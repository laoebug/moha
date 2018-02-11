<?php
// use Yii;
use app\models\User;
use app\models\Menu;
?>
<!-- Default URL -->
<?php $url= Yii::$app->request->getUrl(); ?>
<?php if(count($menus)>0): ?>
<?php foreach ($menus as $menu): ?>

<!-- Top Menu without any submenu -->

<?php if($menu->menu_parent_id==0): ?>
	<?php //if($menu->child_count>0): ?>	
	<?php //$url ="#"; ?>	
	<?php //else: ?>
	<?php //$url= Yii::$app->request->getUrl(); ?>
	<?php //endif;?>
	<?php $url =null; ?>

<?php else: ?>

	<?php if($menu->child_count>0): ?>		
	<?php $url= $menu->department_link; ?>
	<?php else: ?>
	<?php $url= Yii::$app->request->getUrl(); ?>
	<?php endif;?>	
<?php endif;?>


<?php $this->params['breadcrumbs'][] = ['label' => Yii::t('app', $menu->name), 'url' =>  $url];?>

<?php endforeach;?>
<?php endif;?>