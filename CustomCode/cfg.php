<?php
use Floxim\Floxim\System\Fx as fx;

return array(
    'actions' => array(
        'show' => array(
            'name' => 'Произвольный HTML-код',
            'settings' => array(
                'code' => array(
                    'type' => 'text',
                    'label' => fx::alang('HTML code snippet'),
                    'code' => true
                )
            )
        )
    )
);