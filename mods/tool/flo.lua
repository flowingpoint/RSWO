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
})

--[	node_box = {type = "fixed", fixed = {
--	{-1.5,-0.5,-1.45, 1.5,-0.47,1.45},
--	{-1.45,-0.5,-1.5, 1.45,-0.47,-0.5},
--	{-1.45,-0.5,0.5, 1.45,-0.47,1.5}}}]
