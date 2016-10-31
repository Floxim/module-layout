<div 
    fx:template="wrapper" 
    fx:b="wrapper" 
    fx:of="wrapper"
    fx:name="По умолчанию"
    fx:styled-inline>
    {css}wrapper.less{/css}
    
    {@show_header label="Заголовок?" type="checkbox" default="0" /}
    
    <div fx:e="before" fx:hide-empty fx:if="$show_header">
        {apply floxim.ui.header:header}
            {$header}<span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>{/$}
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
        {set $header}
            <span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>
        {/set}
        {apply floxim.ui.header:header /}
    {/use}
{/preset}