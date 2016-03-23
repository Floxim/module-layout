<?php
namespace Floxim\Layout\Column;

use Floxim\Floxim\System\Fx as fx;

class Entity extends \Floxim\Main\Content\Entity
{
    public function _getAreaKeyword() 
    {
        return 'column_'.$this['id'];
    }
    
    public function beforeSave()
    {
        parent::beforeSave();
        if (!$this['width']) {
            $this['width'] = 30;
        }
    }
    
    public function _getBlocks() 
    {
        return $this['id'] ? fx::page()->getAreaInfoblocks($this->_getAreaKeyword()) : array();
    }
}