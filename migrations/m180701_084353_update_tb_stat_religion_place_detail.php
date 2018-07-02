<?php

use yii\db\Migration;

/**
 * Class m180701_084353_update_tb_stat_religion_place_detail
 */
class m180701_084353_update_tb_stat_religion_place_detail extends Migration
{
	public function safeUp()
	{
     $sql = '
				SET FOREIGN_KEY_CHECKS=0;


				ALTER TABLE `moha`.`stat_religion_place_detail` 
				ADD COLUMN `buddhis_monk` INT(11) DEFAULT NULL AFTER `buddhis_nomonk`,
     			ADD COLUMN `buddhis_agreement_built_temple` INT(11) DEFAULT NULL AFTER `buddhis_monk`,
     			ADD COLUMN `buddhis_no_agreement_built_temple` INT(11) DEFAULT NULL AFTER `buddhis_agreement_built_temple`;
        		SET FOREIGN_KEY_CHECKS=0;
		';
        $this->execute($sql);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
       $sql = '
				SET FOREIGN_KEY_CHECKS=0;
				



				ALTER TABLE `moha`.`stat_religion_place_detail` 
				DROP COLUMN `buddhis_monk`,
       		    DROP COLUMN `buddhis_agreement_built_temple`,
       			DROP COLUMN `buddhis_no_agreement_built_temple`;
        		
				SET FOREIGN_KEY_CHECKS=1;
		';
        $this->execute($sql);
    }
}
