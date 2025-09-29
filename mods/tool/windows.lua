openings = {}

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
{-0.375,-0.5,-0.125, -0.25, 0.5,0},
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
{-0.375,0.375,-0.125, -0.25, 0.5,0},
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
{-0.0625,-0.5,-0.125, 0.0625,-0.375,0},
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
		minetest.set_node(pos, {name = "tool:bars_1a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_2a", {
	description = "Bars 2",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, -0.4375,0.375},
{-0.375,0.375,0.25, -0.25, 0.5,0.375},
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_2c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.25, -0.25, -0.4375,0.375},
{-0.0625,-0.5,0.4375, 0.0625,-0.375,0.5625},
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
		minetest.set_node(pos, {name = "tool:bars_2a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_3a", {
	description = "Bars 3",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, -0.4375,0.25},
{-0.375,0.375,0.125, -0.25, 0.5,0.25},
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:bars_3c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.375,-0.5,0.125, -0.25, -0.4375,0.25},
{-0.0625,-0.5,-0.0625, 0.0625,-0.375,0.0625},
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
		minetest.set_node(pos, {name = "tool:bars_3a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:bars_4a", {
	description = "Bars 4",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"kopper.png"},
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
	inventory_image = "bars.png",
	wield_image = "bars.png",
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
		minetest.set_node(pos, {name = "tool:bars_4a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed", {
	description = "Window",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_0.png",
	wield_image = "window.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:window_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.375, 0.5, 0.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open", {
	description = "Window",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_0.png",
	wield_image = "window.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5, -0.5, -0.5, -0.375, 0.5, 0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_a", {
	description = "Window a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_1.png",
	wield_image = "window.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.375, 0,0.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_a", {
	description = "Window a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_1.png",
	wield_image = "window.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1.5,-0.5,0.375, -1,0.5,0.5},
{0,-0.5,0.375, 0.5,0.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_b", {
	description = "Window b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_4.png",
	wield_image = "window.png^dice_4.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, 0,0.5,0.625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_b", {
	description = "Window b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_4.png",
	wield_image = "window.png^dice_4.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, -0.875,0.5,1},
{-0.125,-0.5,0.5, 0,0.5,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_c", {
	description = "Window c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_5.png",
	wield_image = "window.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.875, 0,0.5,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_c", {
	description = "Window c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_5.png",
	wield_image = "window.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0.5, -0.375,0.5,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_closed_d", {
	description = "Window d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_8.png",
	wield_image = "window.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,1, 0,0.5,1.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_open_d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:window_open_d", {
	description = "Window d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"window.png"},
	inventory_image = "window.png^dice_8.png",
	wield_image = "window.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:window_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,1, -0.875,0.5,1.5},
{-0.125,-0.5,1, 0,0.5,1.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:window_closed_d", param2 = node.param2})
	end,
	})
