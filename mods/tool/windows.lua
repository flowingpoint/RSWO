openings = {}

minetest.register_node("tool:bars_a", {
	description = "Bars",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_0.png",
	wield_image = "bars.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.4375, -0.25,0.5,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,0.5,-0.3125},
{0.25,-0.5,-0.4375, 0.375,0.5,-0.3125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_b", {
	description = "Bar #1 broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_0.png",
	wield_image = "bars.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.4375, -0.25,-0.4375,-0.3125},
{-0.375,0.4375,-0.4375, -0.25,0.5,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.375,-0.3125},
{-0.0625,0.4375,-0.4375, 0.0625,0.5,-0.3125},
{0.25,-0.5,-0.4375, 0.375,-0.4375,-0.3125},
{0.25,0.375,-0.4375, 0.375,0.5,-0.3125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_c", {
	description = "Bar #1 broke one-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_0.png",
	wield_image = "bars.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.4375, -0.25,-0.375,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.4375,-0.3125},
{0.25,-0.5,-0.4375, 0.375,-0.4375,-0.3125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_d", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_d", {
	description = "Bar #1 broke other-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_0.png",
	wield_image = "bars.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,0.375,-0.4375, -0.25,0.5,-0.3125},
{-0.0625,0.4375,-0.4375, 0.0625,0.5,-0.3125},
{0.25,0.375,-0.4375, 0.375,0.5,-0.3125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_e", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_e", {
	description = "Bars x2",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_0.png",
	wield_image = "bars.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.4375, -0.25,1.49,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,1.49,-0.3125},
{0.25,-0.5,-0.4375, 0.375,1.49,-0.3125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_1a", {
	description = "Bars",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:bars_1a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.125, -0.25,0.5,0},
{-0.0625,-0.5,-0.125, 0.0625,0.5,0},
{0.25,-0.5,-0.125, 0.375,0.5,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_1b", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_1b", {
	description = "Bar #1 broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_1b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.125, -0.25, -0.4375,0},
{-0.375,0.4375,-0.125, -0.25, 0.5,0},
{-0.0625,-0.5,-0.125, 0.0625,-0.375,0},
{-0.0625,0.4375,-0.125, 0.0625,0.5,0},
{0.25,-0.5,-0.125, 0.375,-0.4375,0},
{0.25,0.375,-0.125, 0.375,0.5,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_1c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_1c", {
	description = "Bar #1 broke one-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_1c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.125, -0.25, -0.375,0},
{-0.0625,-0.5,-0.125, 0.0625,-0.4375,0},
{0.25,-0.5,-0.125, 0.375,-0.4375,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_1d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_1d", {
	description = "Bar #1 broke other-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_1d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,0.375,-0.125, -0.25, 0.5,0},
{-0.0625,0.4375,-0.125, 0.0625,0.5,0},
{0.25,0.375,-0.125, 0.375,0.5,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_1e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_1e", {
	description = "Bars x2",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_1e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,-0.125, -0.25, 1.49,0},
{-0.0625,-0.5,-0.125, 0.0625,1.49,0},
{0.25,-0.5,-0.125, 0.375,1.49,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_1a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_2a", {
	description = "Bars 2",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_1.png",
	wield_image = "bars.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, 0.5,0.375},
{-0.0625,-0.5,0.4375, 0.0625,0.5,0.5625},
{0.25,-0.5,0.625, 0.375,0.5,0.75}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_2b", param2 = node.param2})
	end,
	})
minetest.register_node("tool:bars_2b", {
	description = "Bar #2 broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_1.png",
	wield_image = "bars.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, -0.4375,0.375},
{-0.375,0.4375,0.25, -0.25, 0.5,0.375},
{-0.0625,-0.5,0.4375, 0.0625,-0.375,0.5625},
{-0.0625,0.4375,0.4375, 0.0625,0.5,0.5625},
{0.25,-0.5,0.625, 0.375,-0.4375,0.75},
{0.25,0.375,0.625, 0.375,0.5,0.75}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_2c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_2c", {
	description = "Bar #2 broke one-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_1.png",
	wield_image = "bars.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, -0.4375,0.375},
{-0.0625,-0.5,0.4375, 0.0625,-0.4375,0.5625},
{0.25,-0.5,0.625, 0.375,-0.4375,0.75}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_2d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_2d", {
	description = "Bar #2 broke other-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_1.png",
	wield_image = "bars.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,0.375,0.25, -0.25, 0.5,0.375},
{-0.0625,0.4375,0.4375, 0.0625,0.5,0.5625},
{0.25,0.375,0.625, 0.375,0.5,0.75}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_2e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_2e", {
	description = "Bars 2 Double",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_1.png",
	wield_image = "bars.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, 1.49,0.375},
{-0.0625,-0.5,0.4375, 0.0625,1.49,0.5625},
{0.25,-0.5,0.625, 0.375,1.49,0.75}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_2a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_3a", {
	description = "Bars 3",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_2.png",
	wield_image = "bars.png^dice_2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, 0.5,0.25},
{-0.0625,-0.5,-0.0625, 0.0625,0.5,0.0625},
{0.25,-0.5,-0.25, 0.375,0.5,-0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_3b", param2 = node.param2})
	end,
	})
minetest.register_node("tool:bars_3b", {
	description = "Bar #3 broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_2.png",
	wield_image = "bars.png^dice_2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, -0.4375,0.25},
{-0.375,0.4375,0.125, -0.25, 0.5,0.25},
{-0.0625,-0.5,-0.0625, 0.0625,-0.375,0.0625},
{-0.0625,0.4375,-0.0625, 0.0625,0.5,0.0625},
{0.25,-0.5,-0.25, 0.375,-0.4375,-0.125},
{0.25,0.375,-0.25, 0.375,0.5,-0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_3c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_3c", {
	description = "Bar #3 broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_2.png",
	wield_image = "bars.png^dice_2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, -0.4375,0.25},
{-0.0625,-0.5,-0.0625, 0.0625,-0.4375,0.0625},
{0.25,-0.5,-0.25, 0.375,-0.4375,-0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_3d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_3d", {
	description = "Bar #3 broke other-way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_2.png",
	wield_image = "bars.png^dice_2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,0.375,0.125, -0.25, 0.5,0.25},
{-0.0625,0.4375,-0.0625, 0.0625,0.5,0.0625},
{0.25,0.375,-0.25, 0.375,0.5,-0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_3e", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_3e", {
	description = "Bars 3 Double",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_2.png",
	wield_image = "bars.png^dice_2.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, 1.49,0.25},
{-0.0625,-0.5,-0.0625, 0.0625,1.49,0.0625},
{0.25,-0.5,-0.25, 0.375,1.49,-0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_3a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_4a", {
	description = "Bars 4",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_3.png",
	wield_image = "bars.png^dice_3.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_4a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.0625,-0.5,-0.5, 0.0625,0.5,-0.4375},
{0.1875,-0.5,-0.3125, 0.3125,0.5,-0.1875},
{0.4375,-0.5,-0.0625, 0.5,0.5,0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_4b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_4b", {
	description = "Bars 4b broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_3.png",
	wield_image = "bars.png^dice_3.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_4b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.0625,-0.5,-0.5, 0.0625,-0.4375,-0.4375},
{0.1875,-0.5,-0.3125, 0.3125,-0.4375,-0.1875},
{0.4375,-0.5,-0.0625, 0.5,-0.375,0.0625},
{-0.0625,0.375,-0.5, 0.0625,0.5,-0.4375},
{0.1875,0.4375,-0.3125, 0.3125,0.5,-0.1875},
{0.4375,0.4375,-0.0625, 0.5,0.5,0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_4c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_4c", {
	description = "Bars 4b broke one way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_3.png",
	wield_image = "bars.png^dice_3.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_4c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.0625,-0.5,-0.5, 0.0625,-0.4375,-0.4375},
{0.1875,-0.5,-0.3125, 0.3125,-0.4375,-0.1875},
{0.4375,-0.5,-0.0625, 0.5,-0.375,0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_4d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_4d", {
	description = "Bars 4b broke other way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_3.png",
	wield_image = "bars.png^dice_3.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_4d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.0625,0.375,-0.5, 0.0625,0.5,-0.4375},
{0.1875,0.4375,-0.3125, 0.3125,0.5,-0.1875},
{0.4375,0.4375,-0.0625, 0.5,0.5,0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_4e", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_4e", {
	description = "Bars 4 Double",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_3.png",
	wield_image = "bars.png^dice_3.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_4e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.0625,-0.5,-0.5, 0.0625,1.49,-0.4375},
{0.1875,-0.5,-0.3125, 0.3125,1.49,-0.1875},
{0.4375,-0.5,-0.0625, 0.5,1.49,0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_4a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_5a", {
	description = "Bars 5",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_8.png",
	wield_image = "bars.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_5a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.1875,-0.5,-0.4375, -0.0625,0.5,-0.3125},
{0.0625,-0.5,-0.1875, 0.1875,0.5,-0.0625},
{0.3125,-0.5,0.0625, 0.4375,0.5,0.1875}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_5b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_5b", {
	description = "Bars 5b broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_8.png",
	wield_image = "bars.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_5b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.1875,-0.5,-0.4375, -0.0625,-0.4375,-0.3125},
{0.0625,-0.5,-0.1875, 0.1875,-0.4375,-0.0625},
{0.3125,-0.5,0.0625, 0.4375,-0.375,-0.0625},
{-0.1875,0.375,-0.4375, -0.0625,0.5,-0.3125},
{0.0625,0.4375,-0.1875, 0.1875,0.5,-0.0625},
{0.3125,0.4375,0.0625, 0.4375,0.5,-0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_5c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_5c", {
	description = "Bars 5b broke one way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_8.png",
	wield_image = "bars.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_5c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.1875,-0.5,-0.4375, -0.0625,-0.4375,-0.3125},
{0.0625,-0.5,-0.1875, 0.1875,-0.4375,-0.0625},
{0.3125,-0.5,0.0625, 0.4375,-0.375,-0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_5d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_5d", {
	description = "Bars 5b broke other way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_8.png",
	wield_image = "bars.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_5d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.1875,0.375,-0.4375, -0.0625,0.5,-0.3125},
{0.0625,0.4375,-0.1875, 0.1875,0.5,-0.0625},
{0.3125,0.4375,0.0625, 0.4375,0.5,-0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_5e", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:bars_5e", {
	description = "Bars 5 Double",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_8.png",
	wield_image = "bars.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_5e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.1875,-0.5,-0.4375, -0.0625,1.49,-0.3125},
{0.0625,-0.5,-0.1875, 0.1875,1.49,-0.0625},
{0.3125,-0.5,0.0625, 0.4375,1.49,0.1875}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_5a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_6a", {
	description = "Bars 6",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_9.png",
	wield_image = "bars.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_6a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.4375,-0.5,0.3125, -0.3125,0.5,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_6b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_6b", {
	description = "Bars 6b broke",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_9.png",
	wield_image = "bars.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_6b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.4375,-0.5,0.3125, -0.3125,-0.4375,0.4375},
{-0.4375,0.375,0.3125, -0.3125,0.5,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_6c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_6c", {
	description = "Bars 6b broke one way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_9.png",
	wield_image = "bars.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_6c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.4375,-0.5,0.3125, -0.3125,-0.4375,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_6d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_6d", {
	description = "Bars 6b broke other way",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_9.png",
	wield_image = "bars.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_6d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.4375,0.375,0.3125, -0.3125,0.5,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_6e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_6e", {
	description = "Bars 6 Double",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png^dice_9.png",
	wield_image = "bars.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_6e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.4375,-0.5,0.3125, -0.3125,1.49,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:bars_6a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed", {
	description = "Window",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_0.png",
	wield_image = "window0.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:window_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.375, 0.5, -0.4375,0.5},
{-0.5,-0.4375,0.375, -0.4375,0.4375,0.5},
{-0.0625,-0.4375,0.375, 0.0625,0.4375,0.5},
{0.4375,-0.4375,0.375, 0.5,0.4375,0.5},
{-0.5,0.4375,0.375, 0.5,0.5,0.5},
{-0.4375,-0.3125,0.375, -0.0625,-0.1875,0.5},
{0.0625,-0.3125,0.375, 0.4375,-0.1875,0.5},
{-0.4375,-0.0625,0.375, -0.0625,0.0625,0.5},
{0.0625,-0.0625,0.375, 0.4375,0.0625,0.5},
{-0.4375,0.1875,0.375, -0.0625,0.3125,0.5},
{0.0625,0.1875,0.375, 0.4375,0.3125,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open", {
	description = "Window",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_0.png",
	wield_image = "window0.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5, -0.5, -0.5, -0.375, -0.4375, 0.5},
{-0.5,-0.4375,-0.5, -0.375,0.4375,-0.4375},
{-0.5,-0.4375,-0.0625, -0.375,0.4375,0.0625},
{-0.5,-0.4375,0.4375, -0.375,0.4375,0.5},
{-0.5,0.4375,-0.5, -0.375,0.5,0.5},
{-0.5,-0.3125,-0.4375, -0.375,-0.1875,-0.0625},
{-0.5,-0.3125,0.0625, -0.375,-0.1875,0.4375},
{-0.5,-0.0625,-0.4375, -0.375,0.0625,-0.0625},
{-0.5,-0.0625,0.0625, -0.375,0.0625,0.4375},
{-0.5,0.1875,-0.4375, -0.375,0.3125,-0.0625},
{-0.5,0.1875,0.0625, -0.375,0.3125,0.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_a", {
	description = "Window a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_1.png",
	wield_image = "window0.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.375, 0,-0.4375,0.5},
{-1,-0.4375,0.375, -0.9375,0.4375,0.5},
{-0.5625,-0.4375,0.375, -0.4375,0.4375,0.5},
{-0.0625,-0.4375,0.375, 0,0.4375,0.5},
{-1,0.4375,0.375, 0,0.5,0.5},
{-0.9375,-0.3125,0.375, -0.5625,-0.1875,0.5},
{-0.4375,-0.3125,0.375, -0.0625,-0.1875,0.5},
{-0.9375,-0.0625,0.375, -0.5625,0.0625,0.5},
{-0.4375,-0.0625,0.375, -0.0625,0.0625,0.5},
{-0.9375,0.1875,0.375, -0.5625,0.3125,0.5},
{-0.4375,0.1875,0.375, -0.0625,0.3125,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_a", {
	description = "Window a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_1.png",
	wield_image = "window0.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1.5,-0.5,0.375, -1,-0.4375,0.5},
{-1.5,-0.4375,0.375, -1.4375,0.4375,0.5},
{-1.0625,-0.4375,0.375, -1,0.4375,0.5},
{-1.5,0.4375,0.375, -1,0.5,0.5},
{-1.4375,-0.3125,0.375, -1.0625,-0.1875,0.5},
{-1.4375,-0.0625,0.375, -1.0625,0.0625,0.5},
{-1.4375,0.1875,0.375, -1.0625,0.3125,0.5},
{0,-0.5,0.375, 0.5,-0.4375,0.5},
{0,-0.4375,0.375, 0.0625,0.4375,0.5},
{0.4375,-0.4375,0.375, 0.5,0.4375,0.5},
{0,0.4375,0.375, 0.5,0.5,0.5},
{0.0625,-0.3125,0.375, 0.4375,-0.1875,0.5},
{0.0625,-0.0625,0.375, 0.4375,0.0625,0.5},
{0.0625,0.1875,0.375, 0.4375,0.3125,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_b", {
	description = "Window b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_4.png",
	wield_image = "window0.png^dice_4.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, 0,-0.4375,0.625},
{-1,-0.4375,0.5, -0.9375,0.4375,0.625},
{-0.5625,-0.4375,0.5, -0.4375,0.4375,0.625},
{-0.0625,-0.4375,0.5, 0,0.4375,0.625},
{-1,0.4375,0.5, 0,0.5,0.625},
{-0.9375,-0.3125,0.5, -0.5625,-0.1875,0.625},
{-0.4375,-0.3125,0.5, -0.0625,-0.1875,0.625},
{-0.9375,-0.0625,0.5, -0.5625,0.0625,0.625},
{-0.4375,-0.0625,0.5, -0.0625,0.0625,0.625},
{-0.9375,0.1875,0.5, -0.5625,0.3125,0.625},
{-0.4375,0.1875,0.5, -0.0625,0.3125,0.625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_b", {
	description = "Window b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_4.png",
	wield_image = "window0.png^dice_4.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, -0.875,-0.4375,1},
{-1,-0.4375,0.5, -0.875,0.4375,0.5625},
{-1,-0.4375,0.9375, -0.875,0.4375,1},
{-1,0.4375,0.5, -0.875,0.5,1},
{-1,-0.3125,0.5625, -0.875,-0.1875,0.9375},
{-1,-0.0625,0.5625, -0.875,0.0625,0.9375},
{-1,0.1875,0.5625, -0.875,0.3125,0.9375},
{-0.125,-0.5,0.5, 0,-0.4375,1},
{-0.125,-0.4375,0.5, 0,0.4375,0.5625},
{-0.125,-0.4375,0.9375, 0,0.4375,1},
{-0.125,0.4375,0.5, 0,0.5,1},
{-0.125,-0.3125,0.5625, 0,-0.1875,0.9375},
{-0.125,-0.0625,0.5625, -0,0.0625,0.9375},
{-0.125,0.1875,0.5625, 0,0.3125,0.9375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_c", {
	description = "Window c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_5.png",
	wield_image = "window0.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.875, 0,-0.4375,1},
{-0.5,-0.4375,0.875, -0.4375,0.4375,1},
{-0.0625,-0.4375,0.875, 0,0.4375,1},
{-0.5,0.4375,0.875, 0,0.5,1},
{-0.4375,-0.3125,0.875, -0.0625,-0.1875,1},
{-0.4375,-0.0625,0.875, -0.0625,0.0625,1},
{-0.4375,0.1875,0.875, -0.0625,0.3125,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_c", {
	description = "Window c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_5.png",
	wield_image = "window0.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.5, -0.375,-0.4375,1},
{-0.5,-0.4375,0.5, -0.375,0.4375,0.5625},
{-0.5,-0.4375,0.9375, -0.375,0.4375,1},
{-0.5,0.4375,0.5, -0.375,0.5,1},
{-0.5,-0.3125,0.5625, -0.375,-0.1875,1},
{-0.5,-0.0625,0.5625, -0.375,0.0625,1},
{-0.5,0.1875,0.5625, -0.375,0.3125,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_d", {
	description = "Window d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_8.png",
	wield_image = "window0.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1,-0.5,1, 0,-0.4375,1.125},
{-1,-0.4375,1, -0.9375,0.4375,1.125},
{-0.5625,-0.4375,1, -0.4375,0.4375,1.125},
{-0.0625,-0.4375,1, 0,0.4375,1.125},
{-1,0.4375,1, 0,0.5,1.125},
{-0.9375,-0.3125,1, -0.5625,-0.1875,1.125},
{-0.4375,-0.3125,1, -0.0625,-0.1875,1.125},
{-0.9375,-0.0625,1, -0.5625,0.0625,1.125},
{-0.4375,-0.0625,1, -0.0625,0.0625,1.125},
{-0.9375,0.1875,1, -0.5625,0.3125,1.125},
{-0.4375,0.1875,1, -0.0625,0.3125,1.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_d", {
	description = "Window d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_8.png",
	wield_image = "window0.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-1,-0.5,1, -0.875,-0.4375,1.5},
{-1,-0.4375,1, -0.875,0.4375,1.0625},
{-1,-0.4375,1.4375, -0.875,0.4375,1.5},
{-1,0.4375,1, -0.875,0.5,1.5},
{-1,-0.3125,1.0625, -0.875,-0.1875,1.4375},
{-1,-0.0625,1.0625, -0.875,0.0625,1.4375},
{-1,0.1875,1.0625, -0.875,0.3125,1.4375},
{-0.125,-0.5,1, 0,-0.4375,1.5},
{-0.125,-0.4375,1, 0,0.4375,1.0625},
{-0.125,-0.4375,1.4375, 0,0.4375,1.5},
{-0.125,0.4375,1, 0,0.5,1.5},
{-0.125,-0.3125,1.0625, 0,-0.1875,1.4375},
{-0.125,-0.0625,1.0625, 0,0.0625,1.4375},
{-0.125,0.1875,1.0625, 0,0.3125,1.4375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_f", {
	description = "Window f",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_10.png",
	wield_image = "window0.png^dice_10.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_f",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-0.125, 0.5,-0.4375,0},
{-0.5,-0.4375,-0.125, -0.4375,0.4375,0},
{-0.0625,-0.4375,-0.125, 0.0625,0.4375,0},
{0.4375,-0.4375,-0.125, 0.5,0.4375,0},
{-0.5,0.4375,-0.125, 0.5,0.5,0},
{-0.4375,-0.3125,-0.125, -0.0625,-0.1875,0},
{0.0625,-0.3125,-0.125, 0.4375,-0.1875,0},
{-0.4375,-0.0625,-0.125, -0.0625,0.0625,0},
{0.0625,-0.0625,-0.125, 0.4375,0.0625,0},
{-0.4375,0.1875,-0.125, -0.0625,0.3125,0},
{0.0625,0.1875,-0.125, 0.4375,0.3125,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_f", param2 = node.param2})
	end,
	})
	
minetest.register_node("tool:window_open_f", {
	description = "Window",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_10.png",
	wield_image = "window0.png^dice_10.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_f",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-1, -0.375,-0.4375,0},
{-0.5,-0.4375,-1, -0.375,0.4375,-0.9375},
{-0.5,-0.4375,-0.5625, -0.375,0.4375,-0.4375},
{-0.5,-0.4375,-0.0625, -0.375,0.4375,0},
{-0.5,0.4375,-1, -0.375,0.5,0},
{-0.5,-0.3125,-0.9375, -0.375,-0.1875,-0.5625},
{-0.5,-0.3125,-0.4375, -0.375,-0.1875,-0.0625},
{-0.5,-0.0625,-0.9375, -0.375,0.0625,-0.5625},
{-0.5,-0.0625,-0.4375, -0.375,0.0625,-0.0625},
{-0.5,0.1875,-0.9375, -0.375,0.3125,-0.5625},
{-0.5,0.1875,-0.4375, -0.375,0.3125,-0.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_f", param2 = node.param2})
	end,
	})

minetest.register_node("tool:board_2216", {
	description = "Board on Slope Cornerfill",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"board_rock.png"},
	inventory_image = "window0.png^dice_0.png",
	wield_image = "window0.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:board_2216",
	drawtype = "mesh",
	mesh = "board2216.obj",
	sunlight_propagates = true,
	climbable = false,
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625, -0.4375,0,0.5},
{-0.4375,-0.5,0.125, -0.375,0,0.5},
{-0.375,-0.5,0.1875, -0.3125,0,0.5},
{-0.3125,-0.5,0.25, -0.25,0,0.5},
{-0.25,-0.5,0.3125, -0.1875,0,0.5},
{-0.1875,-0.5,0.375, -0.125,0,0.5},
{-0.125,-0.5,0.4375, -0.0625,0,0.5},
{-0.3125,0,0.5, -0.125,0.5,0.5625},
{-1.125,0,-0.3125, -0.9375,0.5,-0.25},
{-1.0625,0,-0.25, -0.875,0.5,-0.1875},
{-1,0,-0.1875, -0.8125,0.5,-0.125},
{-0.9375,0,-0.125, -0.75,0.5,-0.0625},
{-0.875,0,-0.0625, -0.6875,0.5,0},
{-0.8125,0,0, -0.625,0.5,0.0625},
{-0.75,0,0.0625, -0.5625,0.5,0.125},
{-0.6875,0,0.125, -0.5,0.5,0.1875},
{-0.625,0,0.1875, -0.4375,0.5,0.25},
{-0.5625,0,0.25, -0.375,0.5,0.3125},
{-0.5,0,0.3125, -0.3125,0.5,0.375},
{-0.4375,0,0.375, -0.25,0.5,0.4375},
{-0.375,0,0.4375, -0.1875,0.5,0.5},
{-0.3125,0,0.5, -0.125,0.5,0.5625},
{-0.25,0,0.5625, -0.0625,0.5,0.625},
{-0.1875,0,0.625, 0,0.5,0.6875},
{-0.125,0,0.6875, 0.0625,0.5,0.75},
{-0.0625,0,0.75, 0.125,0.5,0.8125},
{0,0,0.8125, 0.1875,0.5,0.875},
{0.0625,0,0.875, 0.25,0.5,0.9375},
{0.125,0,0.9375, 0.3125,0.5,1},
{0.1875,0,1, 0.375,0.5,1.0625}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625, -0.4375,0,0.5},
{-0.4375,-0.5,0.125, -0.375,0,0.5},
{-0.375,-0.5,0.1875, -0.3125,0,0.5},
{-0.3125,-0.5,0.25, -0.25,0,0.5},
{-0.25,-0.5,0.3125, -0.1875,0,0.5},
{-0.1875,-0.5,0.375, -0.125,0,0.5},
{-0.125,-0.5,0.4375, -0.0625,0,0.5},
{-0.3125,0,0.5, -0.125,0.5,0.5625},
{-1.125,0,-0.3125, -0.9375,0.5,-0.25},
{-1.0625,0,-0.25, -0.875,0.5,-0.1875},
{-1,0,-0.1875, -0.8125,0.5,-0.125},
{-0.9375,0,-0.125, -0.75,0.5,-0.0625},
{-0.875,0,-0.0625, -0.6875,0.5,0},
{-0.8125,0,0, -0.625,0.5,0.0625},
{-0.75,0,0.0625, -0.5625,0.5,0.125},
{-0.6875,0,0.125, -0.5,0.5,0.1875},
{-0.625,0,0.1875, -0.4375,0.5,0.25},
{-0.5625,0,0.25, -0.375,0.5,0.3125},
{-0.5,0,0.3125, -0.3125,0.5,0.375},
{-0.4375,0,0.375, -0.25,0.5,0.4375},
{-0.375,0,0.4375, -0.1875,0.5,0.5},
{-0.3125,0,0.5, -0.125,0.5,0.5625},
{-0.25,0,0.5625, -0.0625,0.5,0.625},
{-0.1875,0,0.625, 0,0.5,0.6875},
{-0.125,0,0.6875, 0.0625,0.5,0.75},
{-0.0625,0,0.75, 0.125,0.5,0.8125},
{0,0,0.8125, 0.1875,0.5,0.875},
{0.0625,0,0.875, 0.25,0.5,0.9375},
{0.125,0,0.9375, 0.3125,0.5,1},
{0.1875,0,1, 0.375,0.5,1.0625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
	local paramap02 = {
	[0]=11, [1]=16, [2]=5, [3]=14, [4]=3, [5]=19, [6]=23, [7]=15, [8]=21,
	[9]=17, [10]=1, [11]=13, [12]=8, [13]=0, [14]=4, [15]=22, [16]=10, 
	[17]=20, [18]=6, [19]=2, [20]=9, [21]=12, [22]=7, [23]=18
	}
	minetest.set_node(pos, {name = "runes:sl4", param2 = paramap02[node.param2]})
	end,
	})

minetest.register_node("tool:window_closed_e", {
	description = "Window e",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_9.png",
	wield_image = "window0.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{0.4375,-0.5,0.375, 0.5,0,0.5},
{-0.4375,-0.5,0.375, 0.4375,-0.4375,0.5},
{-0.4375,-0.0625,0.375, 0.4375,0,0.5},
{-0.5,-0.5,0.375, -0.4375,0,0.5},
{0.1875,-0.4375,0.375, 0.3125,-0.0625,0.5},
{-0.0625,-0.4375,0.375, 0.0625,-0.0625,0.5},
{-0.3125,-0.4375,0.375, -0.1875,-0.0625,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_e", {
	description = "Window e",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window0.png^dice_9.png",
	wield_image = "window0.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = false,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.4375, -0.375,0,0.5},
{-0.5,-0.5,-0.4375, -0.375,-0.4375,0.4375},
{-0.5,-0.0625,-0.4375, -0.375,0,0.4375},
{-0.5,-0.5,-0.5, -0.375,0,-0.4375},
{-0.5,-0.4375,0.1875, -0.375,-0.0625,0.3125},
{-0.5,-0.4375,-0.0625, -0.375,-0.0625,0.0625},
{-0.5,-0.4375,-0.3125, -0.375,-0.0625,-0.1875}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_e", param2 = node.param2})
	end,
	})
