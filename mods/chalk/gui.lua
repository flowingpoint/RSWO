local shared = ...
local S = core.get_translator("chalk")

function shared.get_raw_etch_def(item)
    local def = item:get_definition()
    return def and def.chardust
end

local function update_item_meta(item, meta)
    local etch_def = shared.get_raw_etch_def(item)
    local size = shared.meta_get_size(meta)
    meta:set_string("count_meta",      size == 1 and "" or          tostring(size))
    meta:set_string("count_alignment", size == 1 and "" or "13") -- 1 + 3 * 4
    if etch_def.applier then
        local color = "#f2ebd9"
        meta:set_string("description",
            item:get_short_description() .. "\n" ..
            S("Color: @1", color)) 
    end  
    if etch_def.remover then
          local color = "#00000000"
          meta:set_string("description",
          item:get_short_description() .. "\n" ..
          S("Color: @1", color))      
    end
end
