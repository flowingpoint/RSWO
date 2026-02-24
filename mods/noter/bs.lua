bs = {}

minetest.register_node("noter:bs00", {
	description = "Bookshelf",
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
	
	minetest.register_node("noter:bsba", {
	description = "Bookshelf Book Aligned",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsba",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.25, -0.5, -0.3125, 0.25, -0.35, 0.3125}}},
	collision_box = {type="fixed",fixed={
		{-0.25, -0.5, -0.3125, 0.25, -0.35, 0.3125}}},
	mesh = "bsba.obj"
	})
	
	minetest.register_node("noter:bsba5", {
	description = "Bookshelf 5 Book Aligned",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsba5",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.1875, 0.2, 0.25, 0.375}}},
	collision_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.1875, 0.2, 0.25, 0.375}}},
	mesh = "bsba5.obj"
	})

	minetest.register_node("noter:bsb5", {
	description = "Bookshelf 5 Book",
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

	minetest.register_node("noter:bs5", {
	description = "Bookshelf 5",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs5",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.25, -0.5, 0, 0.5, 0.125, 0.5}}},
	collision_box = {type="fixed",fixed={
		{-0.25, -0.5, 0, 0.5, 0.125, 0.5}}},
	mesh = "bs5.obj"
	})

minetest.register_node("noter:bs2", {
	description = "2 Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bs2",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
	{-0.2, -0.5, -0.24, 0.19, -0.2, 0.26}}},
	collision_box = {type="fixed",fixed={
	{-0.2, -0.5, -0.24, 0.19, -0.2, 0.26}}},
	mesh = "bs2.obj"
	})
	
	
minetest.register_node("noter:bsbk", {
	description = "Bookshelf Books",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsbk",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.29, 0.2, -0.05, 0.28}}},
	collision_box = {type="fixed",fixed={
		{-0.2, -0.5, -0.29, 0.2, -0.05, 0.28}}},
	mesh = "bsbk.obj"
	})

minetest.register_node("noter:bsbs", {
	description = "Bookshelf Book Standing",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsbs",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{0, -0.5, -0.125, 0.05, 0.125, 0.36}}},
	collision_box = {type="fixed",fixed={
		{0, -0.5, -0.125, 0.05, 0.125, 0.36}}},
	mesh = "bsbs.obj"
	})

minetest.register_node("noter:bsbs4", {
	description = "Bookshelf 4 Books Standing",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsbs4",
	drawtype = "mesh",
	sunlight_propagates = true,
	climbable = false,
	selection_box = {type="fixed",fixed={
		{-0.14, -0.5, -0.125, 0.3125, 0.12, 0.375},
		{-0.37,-0.5,-0.22, -0.22,0.125,0.28}}},
	collision_box = {type="fixed",fixed={
		{-0.14, -0.5, -0.125, 0.3125, 0.12, 0.375},
		{-0.37,-0.5,-0.22, -0.22,0.125,0.28}}},
	mesh = "bsbs4.obj"
	})
	
	
	minetest.register_node("noter:bsb1", {
	description = "Bookshelf and a Book",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsb1",
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
	mesh = "bsb1.obj"
	})
	
minetest.register_node("noter:bsb2", {
	description = "Bookshelf (2 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsb2",
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
	mesh = "bsb2.obj"
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

minetest.register_node("noter:bsf", {
	description = "Bookshelf Full (5 Books)",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"bs00.png"},
--	inventory_image = "bs00inv.png",
--	wield_image = "bs00inv.png",
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "noter:bsf",
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
	mesh = "bs0.obj"
	})
