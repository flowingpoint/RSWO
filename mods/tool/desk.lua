desk = {}

minetest.register_node("tool:desk", {
	description = "*2 Desk",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"wood00.png"},
	--inventory_image = "wood00.png",
	--wield_image = "wood00.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:desk",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,0.375,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5, -0.375,0.375,-0.375},
{-0.5,-0.5,0.375, -0.375,0.375,0.5},
{0.375,-0.5,-0.5, 0.5,0.375,-0.375},
{0.375,-0.5,0.375, 0.5,0.375,0.5}}}
})	

minetest.register_node("tool:bedf", {
	description = "*2 Wooden Bed Frame",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"wood00.png"},
	inventory_image = "bedf.png",
	wield_image = "bedf.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bedf",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, -0.375,0,-0.375},
{0.375,-0.5,-0.5, 0.5,0,-0.375},
{0.375,-0.1875,-0.375, 0.4375,-0.0625,1.375},
{-0.375,-0.1562,-0.3125, 0.375,-0.0938,-0.1875},
{-0.375,-0.1562,-0.0625, 0.375,-0.0938,0.0625},
{-0.375,-0.1562,0.1875, 0.375,-0.0938,0.3125},
{-0.375,-0.1562,0.4375, 0.375,-0.0938,0.5625},
{-0.375,-0.1562,0.6875, 0.375,-0.0938,0.8125},
{-0.375,-0.1562,0.9375, 0.375,-0.0938,1.0625},
{-0.375,-0.1562,1.1875, 0.375,-0.0938,1.3125},
{-0.375,-0.1875,-0.4375, 0.375,-0.0625,-0.375},
{-0.375,-0.125,1.4063, 0.375,0.375,1.4688},
{-0.375,0.375,1.375, 0.375,0.4375,1.5},
{-0.5,-0.5,1.375, -0.375,0.5,1.5},
{0.375,-0.5,1.375, 0.5,0.5,1.5},
{-0.4375,-0.1875,-0.375, -0.375,-0.0625,1.375},
{-0.375,-0.1875,1.375, 0.375,-0.0625,1.5}}}
})

minetest.register_node("tool:blkt", {
	description = "*4 Bed Blanket Cover",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blkt_bg.png"},
	inventory_image = "blkt.png",
	wield_image = "blkt.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:blkt",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	--mesh = "blkt.obj",
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-1.375, -0.4375,-0.0625,0.375},
{-0.5,-0.0625,-1.375, 0.5,0,0.375},
{0.4375,-0.5,-1.375, 0.5,-0.0625,0.375}}}
})

minetest.register_node("tool:blkt_fl0", {
	description = "*4 Blanket Flat",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blkt_bg.png"},
	inventory_image = "blkt_fl0.png",
	wield_image = "blkt_fl0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:blkt_fl0",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	--mesh = "blkt.obj",
	node_box = {type="fixed",fixed={
{-1.5,-0.5,-1.375, 0.5,-0.4375,0.375}}}
})

minetest.register_node("tool:blkt_fl1", {
	description = "*4 Blanket Folded",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blkt_bg.png"},
	inventory_image = "blkt_fl1.png",
	wield_image = "blkt_fl1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:blkt_fl1",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	--mesh = "blkt.obj",
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-1.375, 0.5,-0.375,0.375}}}
})

minetest.register_node("tool:blkt_fl2", {
	description = "*4 Blanket Folded Twice",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blkt_bg.png"},
	inventory_image = "blkt_fl2.png",
	wield_image = "blkt_fl2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:blkt_fl2",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	--mesh = "blkt.obj",
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-0.375, 0.5,-0.25,0.375}}}
})


--[[
Possible abm to auto re-cover a bedframe after a while has passed (just v.basic container, no content yet, similar to the 'bed''s obn_r.click)
minetest.register_abm({
	nodenames = {"tool:bedf"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})]]
