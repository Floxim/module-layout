Floxim.handle('.wrapper_width_fullwidth, .wrapper_width_fullwidth-outer', function() {
    var $wrapper = $(this);
    function fix_size() {
        var total_width = $(window).width(),
            $container = $wrapper.parent(),
            container_width = $container.width(),
            margin_left = ( (total_width - container_width) / 2 * -1);
        
        $wrapper.css({
            width:total_width+'px',
            'margin-left':  margin_left
        });
        
    }
    fix_size();
    $(window).on('resize', fix_size);
});