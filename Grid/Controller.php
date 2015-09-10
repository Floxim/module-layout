<?php

namespace Floxim\Layout\Grid;

use \Floxim\Floxim\System\Fx as fx;

class Controller extends \Floxim\Floxim\Controller\Widget
{

    public function process()
    {
        $res = parent::process();
        if (isset($res['areas'])) {
            foreach ($res['areas'] as $i => &$area) {
                if (!isset($area['id'])) {
                    //$area['id'] = (isset($area['keyword']) ? $area['keyword'] : $i).'_'.$this->getParam('infoblock_id');
                    $area['id'] = 'grid_' . (isset($area['keyword']) ? $area['keyword'] : $i) . '_' . $this->getParam('infoblock_id');
                }
            }
        }
        return $res;
    }
    
    public function configColumns($settings)
    {
        $variants = array(
            'n-w',
            'w-n',
            'w-w',
            'n-w-n',
            'w-w-w',
            'n-n-w',
            'w-n-n',
            'n-w-w',
            'w-w-n',
            'w-n-w'
        );
        
        $values = array();
        foreach ($variants as $var) {
            $parts = explode("-", $var);
            $count_wide = 0;
            foreach ($parts as $p) {
                if ($p === 'w') {
                    $count_wide++;
                }
            }
            $b = 'fx_grid_livesearch';
            $bv = $b.'_variant';
            $val = '<span class="'.$bv.' '.$bv.'__'.count($parts).'_cols '.$bv.'__'.$var.' '.$bv.'__'.$count_wide.'_w">';
            foreach ($parts as $part) {
                $val .= '<span class="'.$b.'_col '.$b.'_col__'.$part.'"></span>';
            }
            $val .= '</span>';
            $val = str_replace('"', '\'', $val);
            $values [] = array('id' => $var, 'name' => $val);
        }
        
        return array(
            'settings' => array(
                'cols' => array(
                    'type' => 'livesearch',
                    'values' => $values
                )
            )
        );
    }
    
    public function doColumns()
    {
        $cols = $this->getParam('cols', 'n-w');
        $parts = explode("-", $cols);
        $res = array();
        $count_wide = 0;
        foreach ($parts as $col_num => $col) {
            $res[]= array(
                'name' => $col === 'n' ? 'Sidebar' : 'Column',
                'keyword' => 'col_'.($col_num+1),
                'size' => $col === 'n' ? 'narrow' : 'wide',
                'width' => $col
            );
            if ($col === 'w') {
                $count_wide++;
            }
        }
        return array(
            'areas' => $res,
            'cols' => $cols,
            'count_wide' => $count_wide
        );
        $form = $this->ajaxForm();
        $form->addFields(array(
            'test' => array('type' => 'text', 'label' => "Test", 'value' => 'ok'),
            'livesearch' => array(
                'type' => 'livesearch', 
                'label' => 'Complex',
                'values' => array(
                    'test' => 'Test <b>So</b> Cool!<br /><span style=&apos;font-size:12px; color:#999;&apos;>not joking</span>',
                    'west' => 'West'
                ),
                'value' => array('test'),
                'is_multiple' => true,
                'params' => array(
                    'multiple' => true 
                )
            ),
            'cnt' => array(
                'type' => 'livesearch',
                'label' => 'Section',
                'is_multiple' => true,
                'params' => array(
                    'content_type' => 'floxim.nav.section'
                )
            )
        ));
        if ($form->isSent()) {
            fx::log($form, $form->getValues());
        }
        $this->assign('form', $form);
    }

    public function doTwoColumns()
    {
        return array(
            'areas' => array(
                array('name' => 'Sidebar', 'keyword' => 'sidebar'),
                array('name' => 'Data', 'keyword' => 'content')
            )
        );
    }
}