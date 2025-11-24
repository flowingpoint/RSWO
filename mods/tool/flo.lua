local S = core.get_translator("__builtin")
--Blackpool now called flo, after 'floo powder' in HP.
local t = tool

minetest.register_node(":default:flo", {
	description = "Flo / Portal In",
	drawtype = "mesh",
	mesh = "flo.obj",
	wield_image = "spinout.png",
	inventory_image = "spinout.png",
	tiles = {{name = "flo.png", animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}}},
--tiles = {{name = "black.png", backface_culling = false}},
	paramtype = "light",
	use_texture_alpha = "clip",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "default:flo",
	drowning = 1,
	groups = {cracky=3},
--Blackpool being used as output for teleporting from the dice hologram.
		after_place_node = function(pos)
		minetest.get_node_timer(pos):start(0.1)
	end,
	on_contruct = function(pos)
		minetest.get_node_timer(pos):start(0.1)
	end,
	on_timer = function(pos,_)
		local portal_pos = vector.add(pos,{x=0,y=0.5,z=0})
		local entity = minetest.get_objects_inside_radius(portal_pos,1)

		if entity and #entity >= 1 then
			local portal_name = t.get_portal_node(pos)
			if portal_name then
				for i,v in ipairs(entity) do
					t.tp_to_portal(portal_name,v)
				end
				t.try_collapse(portal_name)
			end
		end
		return true
	end,

	collision_box = {type = "fixed", fixed = {
	{-0.0625,-0.5,-0.0625, 0.0625,-0.4375,0.0625}}},
	selection_box = {type = "fixed", fixed = {
	{-0.0625,-0.5,-0.0625, 0.0625,-0.4375,0.0625}}},
	on_drop = function(itemstack, dropper, pos)
		local dir = dropper:get_look_dir();
		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
		minetest.add_item(pos, "noter:book")
		itemstack:take_item()
		return itemstack
	end
})

--[	node_box = {type = "fixed", fixed = {
--	{-1.5,-0.5,-1.45, 1.5,-0.47,1.45},
--	{-1.45,-0.5,-1.5, 1.45,-0.47,-0.5},
--	{-1.45,-0.5,0.5, 1.45,-0.47,1.5}}}]

minetest.register_abm({
    nodenames = {"default:flo"},
    interval = 2,
    chance = 12,
    action = function(pos, node)
        minetest.env:remove_node(pos)
    end,
})

-- Teleports player <name> to <p> if possible
local function teleport_to_pos(name, p)
	local lm = 31007 -- equals MAX_MAP_GENERATION_LIMIT in C++
	if p.x < -lm or p.x > lm or p.y < -lm or p.y > lm
			or p.z < -lm or p.z > lm then
		return false, S("Cannot teleport out of map bounds!")
	end
	local teleportee = core.get_player_by_name(name)
	if not teleportee then
		return false, S("Cannot get player with name @1.", name)
	end
	if teleportee:get_attach() then
		return false, S("Cannot teleport, @1 " ..
			"is attached to an object!", name)
	end
	teleportee:set_pos(p)
	return true, S("Teleporting @1 to @2.", name, core.pos_to_string(p, 1))
end

core.register_chatcommand("telp", {
	params = S("<a> <b> <c>"),
	description = S("Teleport relatively to your current position"),
	privs = {teleport=true},
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then
			return false, S("Cannot get player with name @1.", name)
		end

		local rel_x, rel_y, rel_z = param:match(
			"^([0-9%-%.]+) +([0-9%-%.]+) +([0-9%-%.]+)$")

		if not (rel_x and rel_y and rel_z) then
			return false, S("Invalid parameters. Expected three numbers a b c.")
		end

		rel_x = tonumber(rel_x)
		rel_y = tonumber(rel_y)
		rel_z = tonumber(rel_z)

		local current_pos = player:get_pos()
		local new_pos = {
			x = current_pos.x + rel_x,
			y = current_pos.y + rel_y,
			z = current_pos.z + rel_z
		}

		return teleport_to_pos(name, new_pos)
	end,
})

core.register_chatcommand("dow", {
	params = S("<d>"),
	description = S("Teleport forward by a distance <d>"),
	privs = {teleport=true},
	func = function(name, param)
		local player = core.get_player_by_name(name)
		if not player then
			return false, S("Cannot get player with name @1.", name)
		end

		local distance = tonumber(param)
		if not distance then
			return false, S("Invalid parameter. Expected a number for distance.")
		end

		local current_pos = player:get_pos()
		local look_dir = player:get_look_dir()

		local offset = vector.multiply(look_dir, distance)
		local new_pos = vector.add(current_pos, offset)

		return teleport_to_pos(name, new_pos)
	end,
})

		
minetest.register_node("tool:wlan",{	
	description = "Wuzzy's Lantern",
	inventory_image = "lanr.png",
	drawtype = "plantlike",
	visual_scale = 1,
	tiles = {"lanr.png"},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	drop = '',
	walkable = false,
	groups = {cracky=3},
	light_source = 14, 
	selection_box = {type = "wallmounted"},
	groups = {book=1,choppy=2, dig_immediate=3, attached_node=1, picture=1, not_in_creative_inventory=1},
	legacy_wallmounted = true,
	collision_box = {type = "fixed", fixed = {
	{-0.25,-0.5,-0.25, 0.25,0.25,0.25}}},
	selection_box = {type = "fixed", fixed = {
	{-0.25,-0.5,-0.25, 0.25,0.25,0.25}}},
	
})