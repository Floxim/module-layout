$(function() {
    Floxim.handle('.columns', function() {
        var $node = $(this),
            $cols = $node.find('.columns__col:not(:last-child)'),
            full_width = $node[0].getBoundingClientRect().width,
            $all_draggers;

        function update_pair_width($dragger) {
            var col = $dragger.data('col'),
                next_col = $dragger.data('next_col'),
                pair_width = (col.getBoundingClientRect().width + next_col.getBoundingClientRect().width) / full_width * 100;
            $dragger.data('pair_width', pair_width);
        };
        
        $cols.each(function() {
           var $col = $(this),
               $dragger = $('<div class="fx_col_resize_handler"></div>'),
               $next_col = $col.next();
               
            $dragger.data('col', $col[0]);
            $dragger.data('next_col', $next_col[0]);
            
            update_pair_width($dragger);
            
            $col.append($dragger);
            
            var dragger_width = $dragger[0].getBoundingClientRect().width;
            
            $dragger.draggable({
                axis:'x',
                start:function() {
                    $node.addClass('columns_show-layout');
                },
                stop: function() {
                    $node.removeClass('columns_show-layout');
                    $all_draggers.attr('style', '');
                    $all_draggers.each(function() {
                        update_pair_width($(this));
                    });
                    var vars = [];
                    $([ $col, $next_col]).each(function() {
                        var $c = $(this),
                            meta = $c.data('fx_entity'),
                            val = $c.data('width');
                        vars.push({
                            value: val,
                            var: {
                                content_id: meta[0],
                                content_type: meta[1],
                                name: 'width',
                                var_type: 'content'
                            }
                        });
                    });
                    var post_data = {
                        action: "save_var",
                        entity: "infoblock",
                        fx_admin: "true",
                        infoblock: $node.closest('.fx_infoblock').data('fx_infoblock'),
                        vars: vars
                    };
                    $fx.post(
                        post_data, 
                        function(res) {
                            //console.log('saved', res);
                        }
                    );
                },
                drag:function(e, ui) {
                    var left = ui.position.left + dragger_width/2,
                        col_width = left / full_width * 100, // %
                        pair_width = $dragger.data('pair_width'),
                        next_col_width = pair_width - col_width;
                    
                    $col.css('width', col_width + '%').data('width', col_width);
                    $next_col.css('width', next_col_width + '%').data('width', next_col_width);
                }
            });
        });
        
        $all_draggers = $node.find('.fx_col_resize_handler');
    });
});