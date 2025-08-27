openings = {}

minetest.register_node("tool:door_closed", {
	description = "Door",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_0.png",
	wield_image = "door_rear.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=0},
	drop = "tool:door_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5, 1.5,-0.375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open", {
	description = "Door",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_0.png",
	wield_image = "door_rear.png^dice_0.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5, -0.5, -0.5, -0.375, 1.5, 0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_a", {
	description = "Door a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_1.png",
	wield_image = "door_rear.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.375, 0,1.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_a", {
	description = "Door a",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_1.png",
	wield_image = "door_rear.png^dice_1.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_a",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1.5,-0.5,0.375, -1,1.5,0.5},
{0,-0.5,0.375, 0.5,1.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_a", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_b", {
	description = "Door b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_6.png",
	wield_image = "door_rear.png^dice_6.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, 0,1.5,0.625}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_b", {
	description = "Door b",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_6.png",
	wield_image = "door_rear.png^dice_6.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_b",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,0.5, -0.875,1.5,1},
{-0.125,-0.5,0.5, 0,1.5,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_b", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_c", {
	description = "Door c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_5.png",
	wield_image = "door_rear.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,-0.5, 1,2.5,-0.375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_c", {
	description = "Door c",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_5.png",
	wield_image = "door_rear.png^dice_5.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_c",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,-0.5, -0.875,2.5,0.5},
{0.875,-0.5,-0.5, 1,2.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_c", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_d", {
	description = "Door d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_8.png",
	wield_image = "door_rear.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1.5,-0.5,-0.125, 0.5,1.5,0}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_d", {
	description = "Door d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_8.png",
	wield_image = "door_rear.png^dice_8.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_d",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1.5,-0.5,0, -1.375,1.5,1},
{0.375,-0.5,0, 0.5,1.5,1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_d", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_e", {
	description = "Door e",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_9.png",
	wield_image = "door_rear.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,-0.5, 1,1.5,-0.375}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_e", {
	description = "Door e",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_9.png",
	wield_image = "door_rear.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_e",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-1,-0.5,-0.5, -0.875,1.5,0.5},
{0.875,-0.5,-0.5, 1,1.5,0.5}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_e", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_closed_f", {
	description = "Door",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_12.png",
	wield_image = "door_rear.png^dice_12.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_f",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5,-0.5,0, 0.5, 1.5,0.125}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_open_f", param2 = node.param2})
	end,
	})

minetest.register_node("tool:door_open_f", {
	description = "Door",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"door_rear.png"},
	inventory_image = "door_rear.png^dice_09.png",
	wield_image = "door_rear.png^dice_9.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "tool:door_closed_f",
	drawtype = "nodebox",
	sunlight_propagates = true,
	climbable = true,
	node_box = {type="fixed",fixed={
{-0.5, -0.5, 0, -0.375, 1.5, 1}}},
	on_rightclick = function(pos, node, clicker, pointed_thing)
		minetest.set_node(pos, {name = "tool:door_closed_f", param2 = node.param2})
	end,
	})
