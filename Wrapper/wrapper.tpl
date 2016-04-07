<div 
    fx:template="wrapper" 
    fx:b="wrapper type_nav style_{$wrapper_style} width_{$width} {if $wrapper_style == 'cover'}.dark{/if}" 
    fx:of="wrapper"
    {if $wrapper_style == 'cover'}
        {@background_image type="image" label="Картинка-фон" /}
        style="background-image:url('{$background_image}')"
    {/if}>
    {css}wrapper.less{/css}
    {@wrapper_style type="style" mask="wrapper_style_*" /}
    {@width 
        values="`fx::module('floxim.layout')->getWrapperSizingVariants()`" 
        type="livesearch" 
        allow_empty="N" 
        default="default" 
        label="width" /}
    <div fx:e="content">{$content}</div>
</div>