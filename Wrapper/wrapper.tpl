<div 
    fx:template="wrapper" 
    fx:b="wrapper" 
    fx:of="wrapper"
    fx:name="По умолчанию"
    fx:styled-inline>
    {css}wrapper.less{/css}
    {@show_header label="Заголовок?" type="checkbox" default="0" /}
    
    <div fx:e="before" fx:hide-empty fx:if="$show_header">
        {set $ibid = $infoblock.id /}
        {apply floxim.ui.header:header}
            {$header}
                <span>{%header_$ibid label="Заголовок блока"}{$infoblock.name /}{/%}</span>
            {/$}
        {/apply}
    </div>
    <div fx:e="content">{$infoblock.getOutput()}</div>
    {*
    <div fx:e="after" fx:hide-empty>{apply wrapper_after /}</div>
    *}
</div>

{preset id="wrapper#titled" name="С заголовком"}
    {set $show_header = true /}
    {use as="wrapper_before"}
        {set $ibid = $infoblock.id /}{set $ibid = $infoblock.id /}
        {set $header}
            <span>{%header_$ibid label="Заголовок блока"}{$infoblock.name /}{/%}</span>
        {/set}
        {apply floxim.ui.header:header /}
    {/use}
{/preset}


<div 
    fx:template="wrapper_complex"
    fx:b="w"
    fx:of="wrapper#1"
    fx:name="Сложный"
    fx:styled-inline>
    {apply floxim.ui.box:box with $box_id = 'blockbox', $field_source = 'block' /}
</div>

{template id="wrapper_content"}
    {$infoblock.getOutput()}
{/template}

{template id="wrapper_header"}
    {set $header}
        <span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>
    {/set}
    {apply floxim.ui.header:header /}
{/template}