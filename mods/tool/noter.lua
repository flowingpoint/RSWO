noter={}

minetest.register_node("tool:noter", {
    description = "A Scrap of Paper",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-0.4, -0.5, -0.4, 0.4, -0.48, 0.4},
    },
    tiles = {"blnk.png"},
    inventory_image = "blnk.png",
    paramtype = "light",
    paramtype2 = "facedir",
    use_texture_alpha = "clip",
    groups = {snappy = 3, attached_node = 1, not_in_creative_inventory=0},

preserve_metadata = function(pos, oldnode, oldmeta, drops)
        local text = oldmeta.text or ""
        if text ~= "" then
            local stack_meta = drops[1]:get_meta()
            stack_meta:set_string("text", text)
            local counts = oldmeta.char_counts or ""
            stack_meta:set_string("char_counts", counts)
            
            -- Inventory always shows the character sequence for utility
            if counts ~= "" then
                stack_meta:set_string("description", counts .. " chars")
            else
                stack_meta:set_string("description", #text .. " chars")
            end
        end
    end,

    after_place_node = function(pos, placer, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        local item_meta = itemstack:get_meta()
        local text = item_meta:get_string("text") or ""
        local counts = item_meta:get_string("char_counts") or ""
        
        if text ~= "" then
            meta:set_string("text", text)
            meta:set_string("char_counts", counts)
            
            -- THE FIX: Check if the note was recently edited (ends in .)
            local is_sealed = string.sub(counts, -1) == "."
            
            if counts ~= "" and not is_sealed then
                -- It's a combination note in an un-edited state
                meta:set_string("infotext", counts .. " chars")
            else
                -- It's a fresh note OR an edited note: show the placement time
                meta:set_string("infotext", os.date("%Y-%m-%d %H:%M"))
            end
        end
    end,

on_rightclick = function(pos, node, clicker, itemstack)
    local meta = minetest.get_meta(pos)
    local held_stack = clicker:get_wielded_item()
    
    if held_stack:get_name() == "tool:noter" then
        local item_meta = held_stack:get_meta()
        local held_text = item_meta:get_string("text") or ""
        
        if held_text ~= "" then
            local current_text = meta:get_string("text") or ""
            local history = meta:get_string("char_counts") or ""
            local held_history = item_meta:get_string("char_counts") or ""
            local new_time = os.date("%Y-%m-%d %H:%M")
            
            -- 1. Determine what count to add to the history
            -- If held note is a combo, use its tuple. Otherwise, use its length.
            local incoming_count = (held_history ~= "") and held_history or tostring(#held_text)

            -- 2. Prevent Double Timestamps
            local has_timestamp = string.match(held_text, "^%d%d%d%d%-%d%d%-%d%d %d%d:%d%d")
            local text_to_add = has_timestamp and held_text or (new_time .. "\n" .. held_text)

            local combined_text = ""
            if history == "" then
                -- FIRST APPEND
                local original_ts = meta:get_string("infotext")
                if original_ts == "" or original_ts == "Blank Paper" then original_ts = new_time end
                
                local current_has_ts = string.match(current_text, "^%d%d%d%d%-%d%d%-%d%d %d%d:%d%d")
                local original_block = current_has_ts and current_text or (original_ts .. "\n" .. current_text)
                
                combined_text = original_block .. "\n\n" .. text_to_add
                history = #current_text .. ", " .. incoming_count
            else
                -- FURTHER APPENDS
                combined_text = current_text .. "\n\n" .. text_to_add
                local last_char = string.sub(history, -1)
                
                -- Merge logic: handle the "Seal of Edit" full stop vs comma
                local separator = (last_char == ".") and " " or ", "
                history = history .. separator .. incoming_count
            end

            -- Clean up any double dots or messy spacing from merged histories
            history = history:gsub("%.%,", ".,"):gsub("%,%,", ",")

            meta:set_string("text", combined_text)
            meta:set_string("char_counts", history)
            meta:set_string("infotext", history .. " chars")
            
            held_stack:take_item()
            clicker:set_wielded_item(held_stack)
            return
        end
    end

        local current_text = meta:get_string("text") or ""
        local formspec = "size[8,5]textarea[0.5,0.5;7.5,4.5;text;;" .. 
            minetest.formspec_escape(current_text) .. "]image_button_exit[3.5,4.4;1,1;inq.png;save;]"
        minetest.show_formspec(clicker:get_player_name(), "noter:note_"..pos.x.."_"..pos.y.."_"..pos.z, formspec)
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if string.sub(formname, 1, 11) == "noter:note_" then
        if fields.save or fields.key_enter then
            local x, y, z = formname:match("noter:note_([%-0-9]+)_([%-0-9]+)_([%-0-9]+)")
            local pos = {x=tonumber(x), y=tonumber(y), z=tonumber(z)}
            local meta = minetest.get_meta(pos)
            meta:set_string("text", fields.text)
            local history = meta:get_string("char_counts") or ""
            if history ~= "" and string.sub(history, -1) ~= "." then
                meta:set_string("char_counts", history .. ".")
            end
            meta:set_string("infotext", os.date("%Y-%m-%d %H:%M"))
        end
    end
end)

