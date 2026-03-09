local S = minetest.get_translator("noter")
local path = minetest.get_modpath("noter")
dofile(path .. "/bs.lua")
--dofile(path .. "/noter.lua")

local BOOK_FORMNAME = "noter:book_form"

local player_current_book = { }



	local function book_dig(pos, node, digger)
		if not digger or minetest.is_protected(pos, digger:get_player_name()) then return end
		local meta = minetest.get_meta(pos)
		local data = minetest.serialize({
			title = meta:get_string("title") or "",
			text = meta:get_string("text") or "",
			owner = meta:get_string("owner") or "",
			_recover = meta:get_string("_recover") or "",
		})
		local stack = ItemStack({
			name = "noter:book",
			metadata = data,
		})
		stack = digger:get_inventory():add_item("main", stack)
		if not stack:is_empty() then
			minetest.item_drop(stack, digger, pos)
		end
		minetest.remove_node(pos)
	end

minetest.register_node("noter:book", {
	description = ("Book"),
	inventory_image = "default_book.png",
	tiles = {
		"books_book_closed_topbottom.png",	-- Top
		"books_book_closed_topbottom.png",	-- Bottom
		"books_book_closed_right.png",	-- Right
		"books_book_closed_left.png",	-- Left
		"books_book_closed_front.png^[transformFX",	-- Back
		"books_book_closed_front.png"	-- Front
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.3125, 0.25, -0.35, 0.3125}}},
	groups = { dig_immediate=0, oddly_breakable_by_hand=3, book=1, not_in_creative_inventory=1},
	walkable = false,
    paramtype = "light",
    sunlight_propagates = true,
    paramtype2 = "facedir",
	stack_max = 1,
		on_rightclick = function(pos, node, puncher, pointed_thing)
			local fdir = node.param2
			minetest.swap_node(pos, { name = "noter:book_open", param2 = fdir })
		end,
		on_place = function(itemstack, placer, pointed_thing)
			local plname = placer:get_player_name()
			local pos = pointed_thing.under
			local node = minetest.get_node_or_nil(pos)
			local def = node and minetest.registered_nodes[node.name]
			if not def or not def.buildable_to then
				pos = pointed_thing.above
				node = minetest.get_node_or_nil(pos)
				def = node and minetest.registered_nodes[node.name]
				if not def or not def.buildable_to then return itemstack end
			end
			if minetest.is_protected(pos, plname) then return itemstack end
			local fdir = minetest.dir_to_facedir(placer:get_look_dir())
			minetest.set_node(pos, {
				name = "noter:book",
				param2 = fdir,
			})
			local text = itemstack:get_meta():get_string("")
			local meta = minetest.get_meta(pos)
			local data = minetest.deserialize(text) or {}
			if type(data) ~= "table" then
				data = {}
				-- Store raw metadata in case some data is lost by the
				-- transition to the new meta format, so it is not lost
				-- and can be recovered if needed.
				meta:set_string("_recover", text)
			end
			meta:set_string("title", data.title or "")
			meta:set_string("text", data.text or "")
			meta:set_string("owner", data.owner or "")
			if data.title and data.title ~= "" then
				meta:set_string("infotext", data.title)
			end
			itemstack:take_item()
			return itemstack
		end,
		on_dig = book_dig,
		selection_box = {
		        type = "fixed",
				fixed = {-0.2, -0.5, -0.25, 0.2, -0.35, 0.25}
		}
	})

minetest.register_node("noter:book_open", {
	inventory_image = "default_book_written.png",
	tiles = {
		"books_book_open_top.png",	-- Top
		"books_book_open_bottom.png",	-- Bottom
		"books_book_open_side.png",	-- Right
		"books_book_open_side.png",	-- Left
		"books_book_open_front.png",	-- Back
		"books_book_open_front.png"	-- Front
	},
	drawtype = "nodebox",
    node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.47, -0.282, 0.375, -0.4125, 0.282}, -- Top
			{-0.4375, -0.5, -0.3125, 0.4375, -0.47, 0.3125},
		}},


		groups = { snappy=3, oddly_breakable_by_hand=3, not_in_creative_inventory=1 },
		drop = "noter:book",
		walkable = false,
     paramtype = "light",
    sunlight_propagates = true,
    paramtype2 = "facedir",
		on_dig = book_dig,
		on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			local meta = minetest.get_meta(pos)
			local player_name = clicker:get_player_name()
			local title = meta:get_string("title") or ""
			local text = meta:get_string("text") or ""
			local owner = meta:get_string("owner") or ""
			local formspec
			if owner == "" or owner == player_name then
				formspec = "size[8,8]"..
					"field[0.5,1;7.5,0;title;Subject :;"..
						minetest.formspec_escape(title).."]"..
					"textarea[0.5,1.5;7.5,7;text;Details :;"..
						minetest.formspec_escape(text).."]"..
					"button_exit[2.5,7.5;3,1;save;Write]"
			else
				formspec = "size[8,8]"..
				"button_exit[7,0.25;1,0.5;close;X]"..
					"label[0.5,0.5;by "..owner.."]"..
					"label[0.5,0;"..minetest.formspec_escape(title).."]"..
					"textarea[0.5,1.5;7.5,7;;"..minetest.formspec_escape(text)..";]"
			end
			player_current_book[player_name] = pos
			minetest.show_formspec(player_name, BOOK_FORMNAME, formspec)
			return itemstack
		end,
		on_punch = function(pos, node, puncher, pointed_thing)
			local fdir = node.param2
			minetest.swap_node(pos, { name = "noter:book", param2 = fdir })
--			minetest.sound_play("homedecor_book_close", {pos=pos, max_hear_distance = 3, gain = 2,})
            minetest.add_particlespawner({
        		amount = 12,
	        	time = 3,
	        	glow = 10,
	        	pos = {x=pos.x, y=pos.y, z=pos.z},
	        	minvel = {x=-0.2, y=0, z=-0.2},
	        	maxvel = {x=0.2, y=0, z=0.2},
	        	minacc = {x=0, y=0.2, z=0},
	        	maxacc = {x=0, y=0.7, z=0},
	        	exptime = {min=2, max=2},
	        	collisiondetection = true,
	        	collision_removal = false,
                    texpool = {
                {name = 'alpha_a.png', blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_b.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_c.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, 
                {name = 'alpha_d.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_e.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_f.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_g.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_h.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_i.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_j.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_k.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_l.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_m.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_n.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_o.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_p.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_q.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_r.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_s.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_t.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_u.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_v.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_w.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_x.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_y.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}},
                {name = 'alpha_z.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}}
            		})
		end,
		selection_box = {
		        type = "fixed",
				fixed = {-0.35, -0.5, -0.25, 0.35, -0.4, 0.25}
		}
})


minetest.register_on_player_receive_fields(function(player, form_name, fields)
	if form_name ~= BOOK_FORMNAME then
		return false
	end
	local player_name = player:get_player_name()
	local pos = player_current_book[player_name]
	if not pos then
		return true
	end
	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")
	if owner ~= "" and player_name ~= owner or not fields.save then
		player_current_book[player_name] = nil
		return true
	end
	meta:set_string("title", fields.title or "")
	meta:set_string("text", fields.text or "")
	meta:set_string("owner", player_name)
	if (fields.title or "") ~= "" then
		meta:set_string("infotext", fields.title)
	end
	minetest.log("action", ("%s has written in a book (title: \"%s\"): \"%s\" at location %s"):format(
			player:get_player_name(), fields.title, fields.text, minetest.pos_to_string(pos)))

	player_current_book[player_name] = nil
	return true
end)


-- aliases

-- 1. Initialize the tracking table at the top!
local player_stack_pos = {}

-- 2. Your stack sequence
local stack_sequence = {
    [1] = "noter:book",
    [2] = "noter:b02",
    [3] = "noter:b03",
    [4] = "noter:b04",
    [5] = "noter:b05",
}

-- 3. Helper function
local function get_count_from_name(name)
    for count, node_name in pairs(stack_sequence) do
        if node_name == name then return count end
    end
    return 0
end

-- 4. Updated UI function
local function show_book_retrieval_ui(player, pos, count)
    local player_name = player:get_player_name()
    
    -- This line was crashing because player_stack_pos wasn't a table yet
    player_stack_pos[player_name] = pos 
    
    local width = count * 1.1 + 0.2
    local formspec = "size[" .. width .. ",1.2]" ..
                     "bgcolor[#00000000;false]"
    
    for i = 1, count do
        local x = (i - 1) * 1.1 + 0.1
        formspec = formspec .. string.format(
            "item_image_button[%f,0.1;1,1;noter:book;book_choice_%d;]",
            x, i
        )
    end  
    minetest.show_formspec(player_name, "noter:book_retrieval", formspec)
end

-- Handle the selection
minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "noter:book_retrieval" then return false end
    
    local player_name = player:get_player_name()
    local pos = player_stack_pos[player_name]
    if not pos then return true end

    for i = 1, 5 do
        if fields["book_choice_" .. i] then
            local node = minetest.get_node(pos)
            local current_count = get_count_from_name(node.name)
            
            -- Give the book to the player
            local inv = player:get_inventory()
            if inv:room_for_item("main", "noter:book") then
                inv:add_item("main", "noter:book")
            else
                minetest.add_item(player:get_pos(), "noter:book")
            end

            -- Reduce stack and CLOSE formspec
            local next_count = current_count - 1
            if next_count <= 0 then
                minetest.remove_node(pos)
            else
                minetest.swap_node(pos, {name = stack_sequence[next_count], param2 = node.param2})
            end
            
            -- Close the UI immediately after taking one
            minetest.close_formspec(player_name, "noter:book_retrieval")
            player_stack_pos[player_name] = nil
            return true
        end
    end
    return true
end)

-- Applying the "Stack Up" and "Retrieve" logic
for _, node_name in pairs(stack_sequence) do
    minetest.override_item(node_name, {
        on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
            local current_count = get_count_from_name(node.name)
            
            -- ADDING A BOOK: If player is holding a book and stack isn't full (5)
            if itemstack:get_name() == "noter:book" then
                if current_count < 5 then
                    local next_node = stack_sequence[current_count + 1]
                    minetest.swap_node(pos, {name = next_node, param2 = node.param2})
                    
                    -- Remove 1 book from the player's hand
                    itemstack:take_item(1)
                    return itemstack
                else
                    -- Stack is full, maybe send a tiny tip?
                    return itemstack
                end
            end
            
            -- RETRIEVING A BOOK: If hand is empty or holding something else
            show_book_retrieval_ui(clicker, pos, current_count)
        end,
    })
end
