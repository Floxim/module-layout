<table fx:template="two_columns_table" fx:of="grid:two_columns" class="std_two_columns_table std_grid">
    {css}std_grid.less{/css}
    <tr>
        <td fx:each="$areas" class="table-grid-{$keyword}" fx:area="$id" fx:area-name="$name"></td>
    </tr>
</table>
    
<div 
    fx:template="columns" 
    fx:of="columns" 
    fx:name="Columns"
    fx:b="grid-cols count_{$areas | count} {$cols} wide_{$count_wide}">
    {css extend="1"}grid-cols.less{/css}
    <div fx:e="row">
        <div 
            fx:each="$areas" 
            fx:area="$id" 
            fx:area-name="$name"
            fx:size="$size" 
            fx:e="col width_{$width} blocks_{$blocks | count}" 
            fx:area-render="manual"
            class="{if $placeholder}fx_hidden_placeholded_block{/if}">

            {if $placeholder}
                <div fx:e="placeholder">{$placeholder}</div>
            {else}
                {each $blocks as $ib}
                    {$ib.render() /}
                {/each}
            {/if}
        </div>
    </div>
</div>