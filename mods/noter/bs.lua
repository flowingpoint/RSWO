bs = {}

minetest.register_node("noter:bs00", {
	description = "*3 Bookshelf",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs00",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs00.obj"
	})

minetest.register_node("noter:bs01", {
	description = "Bookshelf and a Book",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs01",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs01.obj"
	})
	
minetest.register_node("noter:bs02", {
	description = "Bookshelf (2 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs02",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs02.obj"
	})

minetest.register_node("noter:bs03", {
	description = "Bookshelf (3 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs03",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs03.obj"
	})

minetest.register_node("noter:bs04", {
	description = "Bookshelf (4 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs04",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs04.obj"
	})

minetest.register_node("noter:bs05", {
	description = "Bookshelf Full (5 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs05",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
		{-0.5,-0.5,-0.5, -0.375,0.5,0.5},
		{0.375,-0.5,-0.5, 0.5,0.5,0.5},
		{-0.375,0.375,-0.5, 0.375,0.5,0.5},
		{-0.375,-0.375,0.375, 0.375,0.375,0.5}}},
	mesh = "bs05.obj"
	})

minetest.register_node("noter:b05", {
	description = "5 Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b05",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.1875, 0.2, 0.25, 0.375}}},
	collision_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.1875, 0.2, 0.25, 0.375}}},
	mesh = "b05.obj"
	})

minetest.register_node("noter:b04", {
	description = "4 Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b04",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.14, -0.5, -0.125, 0.3125, 0.12, 0.375},
		{-0.37,-0.5,-0.22, -0.22,0.125,0.28}}},
	collision_box = {type="fixed",fixed={
		{-0.14, -0.5, -0.125, 0.3125, 0.12, 0.375},
		{-0.37,-0.5,-0.22, -0.22,0.125,0.28}}},
	mesh = "b04.obj"
	})
	
minetest.register_node("noter:b03", {
	description = "3 Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b03",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.29, 0.2, -0.05, 0.28}}},
	collision_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.29, 0.2, -0.05, 0.28}}},
	mesh = "b03.obj"
	})

minetest.register_node("noter:b02", {
	description = "2 Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b02",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
	{-0.2, -0.5, -0.24, 0.19, -0.2, 0.26}}},
	collision_box = {type="fixed",fixed={
	{-0.2, -0.5, -0.24, 0.19, -0.2, 0.26}}},
	mesh = "b02.obj"
	})	
	
minetest.register_node("noter:ba1", {
	description = "Bookshelf Book Aligned",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:ba1",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.25, -0.5, -0.3125, 0.25, -0.35, 0.3125}}},
	collision_box = {type="fixed",fixed={
		{-0.25, -0.5, -0.3125, 0.25, -0.35, 0.3125}}},
	mesh = "ba1.obj"
	})

minetest.register_node("noter:b1", {
	description = "Bookshelf Book Standing",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b1",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{0, -0.5, -0.125, 0.05, 0.125, 0.36}}},
	collision_box = {type="fixed",fixed={
		{0, -0.5, -0.125, 0.05, 0.125, 0.36}}},
	mesh = "b1.obj"
	})

minetest.register_node("noter:bsb5", {
	description = "5 Book",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsb5",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.375, -0.5, -0.3125, 0.375, 0, 0.3125}}},
	collision_box = {type="fixed",fixed={
		{-0.375, -0.5, -0.3125, 0.375, 0, 0.3125}}},
	mesh = "bsb5.obj"
	})

minetest.register_node("noter:b5", {
	description = "Books5",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:b5",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.25, -0.5, 0, 0.5, 0.125, 0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.25, -0.5, 0, 0.5, 0.125, 0.5}}},
	mesh = "b5.obj"
	})

minetest.register_node("noter:bs1", {
	description = "Books5",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs1",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{0, -0.5, 0.3125, 0.5, 0.125, 0.4375}}},
	collision_box = {type="fixed",fixed={
		{0, -0.5, 0.3125, 0.5, 0.125, 0.4375}}},
	mesh = "bs1.obj"
	})


