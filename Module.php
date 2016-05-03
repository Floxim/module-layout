<?php
namespace Floxim\Layout;

use \Floxim\Floxim\System\Fx as fx;

class Module extends \Floxim\Floxim\Component\Module\Entity {
    public function init()
    {
        fx::template()->import('floxim.layout.wrapper');
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