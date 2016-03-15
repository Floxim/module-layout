<div fx:template="wrapper">{$content}</div>

<div 
    fx:template="nav_wrapper" 
    fx:b="wrapper type_nav style_{$wrapper_style} width_{$width} {if $wrapper_style == 'cover'}.dark{/if}" 
    fx:of="wrapper"
    {*fx:suit="header,content,footer,sub_header"*}
    {if $wrapper_style == 'cover'}
        {@background_image type="image" label="Картинка-фон" /}
        style="background-image:url('{$background_image}')"
    {/if}>
    {css}wrapper.less{/css}
    {@wrapper_style type="style" mask="wrapper_style_*" /}
    {@width values="`fx::module('floxim.layout')->getWrapperSizingVariants()`" type="livesearch" allow_empty="N" default="default" label="width" /}
    <div fx:e="content">{$content}</div>
</div>

<div 
    fx:template="content_wrapper" 
    fx:b="wrapper type_content header_{$header_variant} style_{$wrapper_style} width_{$width}" 
    fx:of="wrapper" 
    fx:size="high"
    fx:suit="content,column_*">
    {css}wrapper.less{/css}
    {@header_variant 
        type="select" 
        label="Заголовок" 
        values="`array('none' => 'Нет', '' => 'Вариант 1', 'variant2' => 'Вариант 2', 'variant3' => 'Вариант 3')`" default="none"}
        
    {@wrapper_style type="style" mask="wrapper_style_*" /}
    
    {@width values="`array('default' => 'default', 'fullwidth' => 'fullwidth', 'antipad' => 'antipad', 'fullwidth_wrapper' => 'fullwidth_wrapper')`" label="width" /}
        
    {set $ib_result = $infoblock.getResult() /}
    {set $has_link = $ib_result.more_url /}
    {if $has_link}
        {@link_position 
            type="select" 
            label="Ссылка &laquo;Подробнее&raquo;" 
            values="`array('none' => 'Не показывать', 'before' => 'Под заголовком', 'after' => 'После блока')`"}

        {set $link_html}
            <div fx:if="$link_position !== 'none' && $infoblock" fx:e="link position_{$link_position}">

                <a href="{%link label="Ссылка"}{$ib_result.more_url /}{/%}">{%more label="Текст на кнопке"}Подробнее!{/%}</a>
            </div>
        {/set}
    {/if}
    
    <div fx:e="header" fx:if="$header_variant != 'none' || $link_position == 'before'">
        <h2 fx:if="$header_variant != 'none'" fx:e="title {$header_variant}">
            <span>{%header label="Заголовок блока"}{$infoblock.name /}{/%}</span>
        </h2>
        {if $link_position == 'before'}{$link_html /}{/if}
    </div>
    <div fx:e="content">{$content}</div>
    {if $has_link && $link_position == 'after'}{$link_html /}{/if}
</div>