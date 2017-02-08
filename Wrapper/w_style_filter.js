function floxim_layout_wrapper_w_style_filter(fields, params, values) {
    for (var i = 0; i < fields.length; i++) {
        var f = fields[i];
        if (f.name === 'width') {
            var wt = params.width_type,
                wv = params.width_value;
        
            if (wv*1 !== 1) {
                delete f.values.layout;
                delete f.values.full;
            } else {
                if (wt === 'layout') {
                    delete f.values.layout;
                } else {
                    delete f.values.full;
                }
            }
            f.force_redraw = function(e) {
                var $t = $(e.target),
                    $f = $t.closest('.field'),
                    v = $t.val();
                
                if (isNaN(v*1)) {
                    return true;
                } 
                var last_val = $f.data('last_control_value');
                return !isNaN(last_val*1);
            };
        }
    }
    return fields;
}