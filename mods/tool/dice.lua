-- support for MT game translation. (from default/nodes.lua where I got template for dice


--As plantlike is good for random but if animation can be called, with 'name_'..math.random(x,y)' or something then we have the one item with multiple textures on placing, which is EXACTLE what you need for a dice game. Torch is probably a good model for this. Pity Blacklight didn't place before.

local t = tool


local function try_set_portal(pos)
	local name = t.get_portal_node(pos)
	if not name or not pos then
		return false
	end

	t.set_portal(pos,name)
end

minetest.register_node("tool:dice", {
	description = "Dice / Portal Out",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1,
	tiles = {"dice_"..math.random(0,15)..".png"},
	-- Use texture out of a group of 16 that doesn't increase the nodes in the menu
	inventory_image = "dice.png",
	wield_image = "dice_0.png",
	paramtype = "light",
	light_source = 14,
	sunlight_propagates = true,
	walkable = false,
	groups={snappy=3,attached_node=1,flammable=1},
	selection_box={type="fixed",fixed=
	{-0.7071/16,-0.5,-0.7071/16, 0.7071/16,-7/16,0.7071/16}},
	
--Dice being used as Output for portal. Input at Flo..	
	on_rightclick = function(pos,node)
		try_set_portal(pos)
	end,
	on_drop = function(itemstack, dropper, pos)
		local dir = dropper:get_look_dir();
		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
		minetest.add_item(pos, "teletool:teletool_mana")
		itemstack:take_item()
		return itemstack
	end
})

--This produces a number between 0 and 15 but only one per log, so even taking it and placing it again, isn't a roll. Just the first place per log is a roll. If it's already placed it'll be different. math.random was set in the img description bracket so that's sort of why but the way it works better with general grass assuming a state out of 5 makes me want to find some reset mechanic method by checking the grass file in ... default/nodes.lua but the math.random there is for selection out of a group of different nodes, not textures, so to use that would be to make another mess of duplicates the way I filled the menu with 25 pockmons...

--[[If it's better to use mesh:
minetest.register_node("misc:dice", {
	description = S("Dice"),
	drawtype = "mesh",
	mesh = "dice.obj",
	inventory_image = {"dice_" math.random(0,15) ".png"},
	wield_image = "dice.png",
	tiles = {{
		    name = "dice_0.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	walkable = false,
	light_source = 4,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, dice=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -1/2, -0.2, 0.2, -0.3, 0.2},
	},
})]]
	
