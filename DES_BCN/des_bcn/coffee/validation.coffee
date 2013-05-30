disable_cf = (el_nbr, option) ->
        if option
            color = "#eeeeee"
        else 
            color = "#141414"
        $("#item-deformField"+el_nbr).css("color", color)
        $("#item-deformField"+el_nbr+(".control-group input:radio")).attr('disabled',option)

appear_cf = (child, parent, ids) ->
     disable_cf(child, true)
     for el in ids
                   if ($("#item-deformField"+parent+".control-group input:checked").val() == el) && (!($("#item-deformField"+parent+".control-group input:radio").attr('disabled') == "disabled"))   
                        disable_cf(child, false);
