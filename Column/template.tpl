<div 
    fx:template="columns" 
    fx:of="list" 
    fx:name="Колонки"
    fx:b="columns">
    {css}
        flex-columns.less
    {/css}
    {if fx::isAdmin() }
        {js}edit.js{/js}
    {/if}
        {default $size = 'high' /}
        <div 
            fx:each="$items" 
            fx:area="$area_keyword" 
            fx:area-name="$name"
            fx:size="$size" 
            fx:e="col" 
            fx:area-render="manual"
            fx:container="$area_keyword"
            class="
                {if $placeholder}
                    fx_hidden_placeholded_block
                {elseif $max_blocks_per_column && count($blocks) >= $max_blocks_per_column}
                    fx_area_no_add
                {/if}"
            style="width:{if $item.id}{= round($width)}{else}30{/if}%;">
            {if !$id}
                <div fx:e="placeholder"></div>
            {else}
                {each $blocks as $ib}
                    {$ib.render() /}
                {/each}
            {/if}
        </div>
    
</div>
        
{preset id="columns#nav" name="Шапка"}
    {set $max_blocks_per_column = 1 /}
    {set $size = 'low' /}
    {set $columns_style = 'nav' /}
{/preset}