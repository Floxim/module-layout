<?php
namespace Floxim\Layout;

use \Floxim\Floxim\System\Fx as fx;

class Module extends \Floxim\Floxim\Component\Module\Entity {
    public function init()
    {
        fx::template()->import('floxim.layout.wrapper');
        fx::listen('before_save', function($e) {
            $entity = $e['entity'];
            if ( ! ($entity instanceof \Floxim\Floxim\Component\InfoblockVisual\Entity)) {
                return;
            }
            if (!preg_match("~column_new-in-(\d+)~", $entity['area'], $column_infoblock_id)) {
                return;
            }
            $column_infoblock_id = $column_infoblock_id[1];

            $column = fx::data('floxim.layout.column')->create(
                array(
                    'infoblock_id' => $column_infoblock_id
                )
            );
            if (preg_match("~(before|after)-(\d+)~", $entity['area'], $rel_col)) {
                $column['__move_'.$rel_col[1]] = $rel_col[2];
            }
            fx::log($rel_col, $column);
            $column->save();
            $entity['area'] = $column['area_keyword'];
        });
    }
    
    public function _getWrapperSizingVariants()
    {
        $variants = array(
            'default',
            'fullwidth',
            'antipad',
            'fullwidth-outer'
        );
        $res = array();
        foreach($variants as $v) {
            $html = '<span class="fx_livesearch_wrapper_sizing '.$v.'">';
            $html .= '<span class="c"><span class="w"><span class="d"></span></span></span>';
            $html .= '</span>';
            $html = str_replace('"', '\'', $html);
            $res []= array(
                $v,
                $html
            );
        }
        return $res;
    }
}