<div 
    fx:template="wrapper" 
    fx:b="wrapper type_nav style_{$wrapper_style}" 
    fx:of="wrapper"
    fx:container="'wrapper_' . $infoblock.id">
    {css}wrapper.less{/css}
    {js}wrapper.js{/js}
    {@wrapper_style type="style" mask="wrapper_style_*" default="default" /}
    <div fx:e="before" fx:hide-empty>{apply wrapper_before /}</div>
    <div fx:e="content">{$infoblock.getOutput()}</div>
    <div fx:e="after" fx:hide-empty>{apply wrapper_after /}</div>
</div>

{preset id="wrapper#titled"}
    {use as="wrapper_before"}
        {set $header}
            <span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>
        {/set}
        {apply floxim.ui.header:header /}
    {/use}
{/preset}