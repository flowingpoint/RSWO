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
    groups = {snappy = 3, attached_node = 1,not_in_creative_inventory=0},

    -- 1. CAPTURE: When dug, move text from the world into the item in your inventory
    preserve_metadata = function(pos, oldnode, oldmeta, drops)
        local text = oldmeta.text or ""
        if text ~= "" then
            local stack_meta = drops[1]:get_meta()
            stack_meta:set_string("text", text)
            -- Optional: Change the item name so you know which note is which in your bags
            stack_meta:set_string("description", "" .. #text .. " chars")
        end
    end,

    -- 2. RESTORE: When placed, move text from the item back into the world meta
    after_place_node = function(pos, placer, itemstack, pointed_thing)
        local meta = minetest.get_meta(pos)
        local item_meta = itemstack:get_meta()
        local text = item_meta:get_string("text") or ""
        
        if text ~= "" then
            meta:set_string("text", text)
            -- This restores the timestamp if you saved it previously
            -- Or you can set a "Placed on [date]" timestamp here
            meta:set_string("infotext", "" .. os.date("%Y-%m-%d %H:%M"))
        end
    end,

    on_rightclick = function(pos, node, clicker, itemstack)
        local meta = minetest.get_meta(pos)
        local player_name = clicker:get_player_name()
        local current_text = meta:get_string("text") or ""
        
        -- Added formspec_escape to prevent crashes with special characters
        local formspec = "size[8,5]" ..
            "textarea[0.5,0.5;7.5,4.5;text;;" .. minetest.formspec_escape(current_text) .. "]" ..
            "image_button_exit[3.5,4.4;1,1;inq.png;save;]"
        
        minetest.show_formspec(player_name, "noter:note_"..pos.x.."_"..pos.y.."_"..pos.z, formspec)
    end,
})

-- The Save Logic (remains your working version)
minetest.register_on_player_receive_fields(function(player, formname, fields)
    if string.sub(formname, 1, 11) == "noter:note_" then
        -- Triggered by the image_button_exit (fields.save) or Enter
        if fields.save or fields.key_enter then
            local x, y, z = formname:match("noter:note_([%-0-9]+)_([%-0-9]+)_([%-0-9]+)")
            local pos = {x=tonumber(x), y=tonumber(y), z=tonumber(z)}
            local meta = minetest.get_meta(pos)
            
            meta:set_string("text", fields.text)
            local timestamp = os.date("%Y-%m-%d %H:%M")
            -- 'Last Saved' timestamp, or blank
            if fields.text ~= "" then
                meta:set_string("infotext", "" .. timestamp)
            else
                meta:set_string("infotext", "Blank Paper")
            end
        end
    end
end)


