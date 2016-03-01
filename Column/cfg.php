<?php
use Floxim\Floxim\System\Fx as fx;

return array(
    'actions' => array(
        'list_infoblock' => array(
            'defaults' => array(
            	'!sorting' => 'manual',
                '!sorting_dir' => 'asc',
                '!limit' => 0,
                '!parent_type' => 'certain_page'
            )
        )
    )
);