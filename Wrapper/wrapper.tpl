<div 
    fx:template="wrapper" 
    fx:b="wrapper" 
    fx:of="wrapper"
    fx:styled-inline>
    <div fx:e="before" fx:hide-empty>{apply wrapper_before /}</div>
    <div fx:e="content">{$infoblock.getOutput()}</div>
    <div fx:e="after" fx:hide-empty>{apply wrapper_after /}</div>
</div>

{preset id="wrapper#titled" name="С заголовком"}
    {use as="wrapper_before"}
        {set $header}
            <span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>
        {/set}
        {apply floxim.ui.header:header /}
    {/use}
{/preset}