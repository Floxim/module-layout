<div 
    fx:template="columns" 
    fx:of="list" 
    fx:name="Колонки"
    fx:b="columns {*{if $columns_height}height_{$columns_height}{/if}*} style_{$columns_style}"
    {default $allow_column_background = true /}>
    {@columns_style type="style" mask="columns_style_*" label="Стиль колонок" /}
    {*{@columns_height label="Высота блока" values="`array('low' => 'Низкий', 'high' => 'Высокий')`" /}*}
    {@pad label="Отступы" type="checkbox" default="1" /}
    {css extend="1"}columns.less{/css}
    {if fx::isAdmin() }
        {js}edit.js{/js}
    {/if}
    {default $size = 'high' /}
    <div fx:e="row">
        <div 
            fx:each="$items" 
            fx:area="$area_keyword" 
            fx:area-name="$name"
            fx:size="$size" 
            fx:e="col {if $pad}padded{/if}" 
            fx:area-render="manual"
            class="
                {if $placeholder}
                    fx_hidden_placeholded_block
                {elseif $max_blocks_per_column && count($blocks) >= $max_blocks_per_column}
                    fx_area_no_add
                {/if}"
            style="
                width:{if $item.id}{$width editable="false"}{else}30{/if}%;
                {if $allow_column_background}
                    background-image:url('{$item.%column_bg type="image"}');
                {/if}
                ">
            {if !$id}
                <div fx:e="placeholder">{$name}</div>
            {else}
                <div fx:e="area-wrapper">
                    <div fx:each="$blocks as $ib" fx:e="block" class="fx_infoblock_wrapper">
                        {$ib.render() /}
                    </div>
                </div>
            {/if}
        </div>
    </div>
</div>
        
{preset columns#nav name="Шапка"}
    {set $allow_column_background = false /}
    {set $max_blocks_per_column = 1 /}
    {set $size = 'low' /}
    {set $columns_style = 'nav' /}
{/preset}