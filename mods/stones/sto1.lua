stones = {}
default = {}

minetest.register_alias("stones:stone", "default:stone", "stones:rock")
minetest.register_alias("stones:dirt_with_grass", "default:dirt_with_grass", "stones:brush")
minetest.register_alias("stones:scree", "default:scree", "stones:rubble")

function default.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="footstep", gain=0.2}
	default.node_sound_defaults(table)
	return table
end

minetest.register_node("stones:rock", {
	description = "Rock",
	paramtype = "light",
	tiles ={"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:rock',
	light_source = 0.005,
	legacy_mineral = false
})

minetest.register_node("stones:rubble", {
	description = "Rubble",
	tiles ={"rubble.png"},
	groups = {oddly_breakable_by_hand=1}
})

minetest.register_node("stones:rush", {
	description = "Rush",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={{name = "dirt.png",
		tileable_vertical = true}},
	groups = {crumbly=1, soil=1},
	drop = 'stones:rush',
	light_source = 0,
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brush", {
	description = "Brush",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"grass.png", "dirt.png",
		{name = "dirt.png^grass_side.png",
		tileable_vertical = true}},
	groups = {crumbly=1, soil=1},
	drop = 'stones:brush',
	light_source = 0,
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_0", {
	description = "Brush | Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_0.png", "rushrock_0.png^[transformFY", "brushrock_s.png^[transformFX", "brushrock_s.png", "rock.png", "dirt.png^grass_side.png"},
	groups = {cracky=1, soil=1},
	drop = "stones:brushrock_0",
	light_source = 0,
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_1", {
	description = "Brush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_1.png", "rushrock_1.png^[transformR90", {name = "dirt.png^grass_side.png", tileable_vertical = true}, "rock.png", "rock.png", {name = "dirt.png^grass_side.png", tileable_vertical = true}},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_1",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_2", {
	description = "Brush+Rock 3/1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_2.png", "rushrock_2.png^[transformFY", "dirt.png^grass_side.png", "rock.png", "brushrock_s.png^[transformFX", "dirt.png^grass_side.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_3",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_3", {
	description = "Brush+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_3.png", "rushrock_3.png^[transformFY", "dirt.png^grass_side.png", "rock.png",   "rock.png", "brushrock_s.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_3",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_4", {
	description = "Brush+Rock 3\1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_3.png^[transformFX^[transformR270", "rushrock_3.png^[transformR270", "rock.png", "brushrock_s.png^[transformFX", "dirt.png^grass_side.png", "rock.png",},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_4",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_8", {
	description = "Brush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_8.png", "rushrock_8.png^[transformR90", {name = "dirt.png^grass_side.png", tileable_vertical = true}, {name = "brushrock_s.png", tileable_vertical = true}, {name = "brushrock_s.png^[transformFY^[transformR180", tileable_vertical = true}, {name = "dirt.png^grass_side.png", tileable_vertical = true}},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_8",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_5", {
	description = "Brush+Rock 1\3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_2.png^[transformFX^[transformR270", "rushrock_2.png^[transformR270", "brushrock_s.png", "dirt.png^grass_side.png", "dirt.png^grass_side.png", "rock.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_5",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_52ul", {
	description = "R5/2 Brush+Rock Left HighHalf",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png","dirt.png^grass_side.png^[transformR270","brushrock_3.png^[transformFY^[transformR270","rushrock_3.png^[transformR270","brushrock_s.png^[transformFX^[transformR90","rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_52ul",
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5,  0.5,0,0.5},
{-0.5,0,-0.375, 0.5,0.0625,0.5},
{-0.5,0.0625,-0.25, 0.5,0.125,0.5},
{-0.5,0.125,-0.125, 0.5,0.1875,0.5},
{-0.5,0.1875,0, 0.5,0.25,0.5},
{-0.5,0.25,0.125, 0.5,0.3125,0.5},
{-0.5,0.3125,0.25, 0.5,0.375,0.5},
{-0.5,0.375,0.375, 0.5,0.4375,0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5,  0.5,0,0.5},
{-0.5,0,-0.375, 0.5,0.0625,0.5},
{-0.5,0.0625,-0.25, 0.5,0.125,0.5},
{-0.5,0.125,-0.125, 0.5,0.1875,0.5},
{-0.5,0.1875,0, 0.5,0.25,0.5},
{-0.5,0.25,0.125, 0.5,0.3125,0.5},
{-0.5,0.3125,0.25, 0.5,0.375,0.5},
{-0.5,0.375,0.375, 0.5,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "s_52u.obj"
})

minetest.register_node("stones:brushrock_52ur", {
	description = "R5/2 Brush+Rock Right HighHalf ",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png","dirt.png^grass_side.png^[transformR90","rushrock_3.png^[transformFY^[transformR270","brushrock_3.png^[transformR270","brushrock_s.png^[transformR270","rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_52ur",
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5,  0.5,0,0.5},
{-0.5,0,-0.375, 0.5,0.0625,0.5},
{-0.5,0.0625,-0.25, 0.5,0.125,0.5},
{-0.5,0.125,-0.125, 0.5,0.1875,0.5},
{-0.5,0.1875,0, 0.5,0.25,0.5},
{-0.5,0.25,0.125, 0.5,0.3125,0.5},
{-0.5,0.3125,0.25, 0.5,0.375,0.5},
{-0.5,0.375,0.375, 0.5,0.4375,0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5,  0.5,0,0.5},
{-0.5,0,-0.375, 0.5,0.0625,0.5},
{-0.5,0.0625,-0.25, 0.5,0.125,0.5},
{-0.5,0.125,-0.125, 0.5,0.1875,0.5},
{-0.5,0.1875,0, 0.5,0.25,0.5},
{-0.5,0.25,0.125, 0.5,0.3125,0.5},
{-0.5,0.3125,0.25, 0.5,0.375,0.5},
{-0.5,0.375,0.375, 0.5,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "s_52u.obj"
})

minetest.register_node("stones:brushrock_527l", {
	description = "R5/2 7/8 Brush+Rock Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527l.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_527l",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0,0.5,0.5},
{0, -0.5,   -0.5,  0.5, 0, 0.5},
{0, 0.0625, -0.375, 0.5, 0.0625, 0.5},
{0, 0.125, -0.25, 0.5, 0.125, 0.5},
{0, 0.1825, -0.125, 0.5, 0.1875, 0.5},
{0, 0.25, 0, 0.5, 0.25, 0.5},
{0, 0.3125, 0.125, 0.5, 0.3125, 0.5},
{0, 0.375, 0.25, 0.5, 0.375, 0.5},
{0, 0.4375, 0.375, 0.5, 0.4375, 0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0,0.5,0.5},
{0, -0.5,   -0.5,  0.5, 0.0625, 0.5},
{0, 0.0625, -0.375, 0.5, 0.125, 0.5},
{0, 0.125, -0.25, 0.5, 0.1825, 0.5},
{0, 0.1825, -0.125, 0.5, 0.25, 0.5},
{0, 0.25, 0, 0.5, 0.3125, 0.5},
{0, 0.3125, 0.125, 0.5, 0.375, 0.5},
{0, 0.375, 0.25, 0.5, 0.4375, 0.5},
{0, 0.4375, 0.375, 0.5, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527l.obj"
})

minetest.register_node("stones:brushrock_527r", {
	description = "R5/2 7/8 Brush+Rock Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527r.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_527r",
	selection_box = {type="fixed",fixed={
{0,-0.5,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5,  0,0,0.5},
{-0.5,0.0625,-0.375, 0,0.0625,0.5},
{-0.5,0.125,-0.25, 0,0.125,0.5},
{-0.5,0.1825,-0.125, 0,0.1875,0.5},
{-0.5,0.25,0, 0,0.25,0.5},
{-0.5,0.3125,0.125, 0,0.3125,0.5},
{-0.5,0.375,0.25, 0,0.375,0.5},
{-0.5,0.4375,0.375, 0,0.4375,0.5}}},
	collision_box = {type="fixed",fixed={
{0,-0.5,-0.5, 0.5,0.5,0.5},
{-0.5, -0.5,   -0.5,  0, 0.0625, 0.5},
{-0.5, 0.0625, -0.375, 0, 0.125, 0.5},
{-0.5, 0.125, -0.25, 0, 0.1825, 0.5},
{-0.5, 0.1825, -0.125, 0, 0.25, 0.5},
{-0.5, 0.25, 0, 0, 0.3125, 0.5},
{-0.5, 0.3125, 0.125, 0, 0.375, 0.5},
{-0.5, 0.375, 0.25, 0, 0.4375, 0.5},
{-0.5, 0.4375, 0.375, 0, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527r.obj"
})

minetest.register_node("stones:brushrock_22", {
	description = "Root 2 Brushrock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png","brushrock_s.png^[transformR270","brushrock_6.png","rushrock_6.png^[transformR270","brushrock_s.png^[transformFY^[transformR270"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_22",
	collision_box = {type="fixed",fixed={
{-0.5,  -0.5,  -0.375, 0.5, -0.375, 0.5},
{-0.5, -0.375, -0.25, 0.5, -0.25, 0.5},
{-0.5, -0.25, -0.125, 0.5, -0.125, 0.5},
{-0.5, -0.125, 0, 0.5, 0, 0.5},
{-0.5, 0, 0.125, 0.5, 0.125, 0.5},
{-0.5, 0.125, 0.25, 0.5, 0.25, 0.5},
{-0.5, 0.25, 0.375, 0.5, 0.375, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5,  -0.5,  -0.375, 0.5, -0.375, 0.5},
{-0.5, -0.375, -0.25, 0.5, -0.25, 0.5},
{-0.5, -0.25, -0.125, 0.5, -0.125, 0.5},
{-0.5, -0.125, 0, 0.5, 0, 0.5},
{-0.5, 0, 0.125, 0.5, 0.125, 0.5},
{-0.5, 0.125, 0.25, 0.5, 0.25, 0.5},
{-0.5, 0.25, 0.375, 0.5, 0.375, 0.5}}},
	drawtype = "mesh",
	mesh = "s_2.obj"
})

minetest.register_node("stones:brushrock_2u", {
	description = "Root 2 Brushrock Diagstep",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s_2u.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:brushrock_2u",
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0,0.5,0.5},
{0,-0.5,-0.375, 0.5,-0.375,0.5},
{0,-0.375,-0.25, 0.5,-0.25,0.5},
{0,-0.25,-0.125, 0.5,-0.125,0.5},
{0,-0.125,0, 0.5,0,0.5},
{0,0,0.125, 0.5,0.125,0.5},
{0,0.125,0.25, 0.5,0.25,0.5},
{0,0.25,0.375, 0.5,0.375,0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0,0.5,0.5},
{0,-0.5,-0.375, 0.5,-0.375,0.5},
{0,-0.375,-0.25, 0.5,-0.25,0.5},
{0,-0.25,-0.125, 0.5,-0.125,0.5},
{0,-0.125,0, 0.5,0,0.5},
{0,0,0.125, 0.5,0.125,0.5},
{0,0.125,0.25, 0.5,0.25,0.5},
{0,0.25,0.375, 0.5,0.375,0.5}}},
	drawtype = "mesh",
	mesh = "s_2u.obj"
})

minetest.register_node("stones:brushrock_21", {
	description = "4Brush 3Rock /8",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"b9_dg_r_r9.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_21",
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,-0.4687, 0.5,0.5,0.5},
{0,-0.5,-0.5, 0.4687,0.5,-0.4687},
{0,-0.5,0, 0.4687,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{0,-0.5,-0.4687, 0.4687,0.5,0},
{-0.25,-0.5,-0.25, 0,0.5,0},
{-0.375,-0.5,-0.125, -0.25,0.5,0},
{-0.125,-0.5,-0.375, 0,0.5,-0.25},
{-0.4375,-0.5,-0.0625, -0.375,0.5,0},
{-0.3125,-0.5,-0.1875, -0.25,0.5,-0.125},
{-0.1875,-0.5,-0.3125, -0.125,0.5,-0.25},
{-0.0625,-0.5,-0.4375, 0,0.5,-0.375}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,-0.4687, 0.5,0.5,0.5},
{0,-0.5,-0.5, 0.4687,0.5,-0.4687},
{0,-0.5,0, 0.4687,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{0,-0.5,-0.4687, 0.4687,0.5,0},
{-0.25,-0.5,-0.25, 0,0.5,0},
{-0.375,-0.5,-0.125, -0.25,0.5,0},
{-0.125,-0.5,-0.375, 0,0.5,-0.25},
{-0.4375,-0.5,-0.0625, -0.375,0.5,0},
{-0.3125,-0.5,-0.1875, -0.25,0.5,-0.125},
{-0.1875,-0.5,-0.3125, -0.125,0.5,-0.25},
{-0.0625,-0.5,-0.4375, 0,0.5,-0.375}}},
	drawtype = "mesh",
	mesh = "s_21.obj"
})

minetest.register_node("stones:brushrock_c", {
	description = "Brush Curved Into Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_c.png", "rushrock_c.png^[transformR270", "rock.png", "dirt.png^grass_side.png", "rock.png", "dirt.png^grass_side.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_c",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:brushrock_11", {
	description = "Brush+Rock+Brush //",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_11.png", "rushrock_11.png^[transformFY", "dirt.png^grass_side.png", "dirt.png^grass_side.png", "brushrock_s.png", "brushrock_s.png"},
	groups = {cracky=1, soil=1},
	light_source = 0,
	drop = "stones:brushrock_11",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:sku", {
	description = "Diagonal SkewSlab",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku',
	selection_box= { type= "fixed", fixed= {
{-0.5,-0.4375,-0.5, 0.5,-0.375,-0.375},
{-0.5,-0.375,-0.5, 0.5,-0.3125,-0.25},
{-0.5,-0.3125,-0.5, 0.5,-0.25,-0.125},
{-0.5,-0.25,-0.5, 0.5,-0.1875,0},
{-0.5,-0.1875,-0.5, 0.5,-0.125,0.125},
{-0.5,-0.125,-0.5, 0.5,-0.0625,0.25},
{-0.5,-0.0625,-0.5, 0.5,0,0.375},
{-0.5,0,-0.375, 0.5,0.0625,0.5},
{-0.5,0.0625,-0.25, 0.5,0.125,0.5},
{-0.5,0.125,-0.125, 0.5,0.1875,0.5},
{-0.5,0.1875,0, 0.5,0.25,0.5},
{-0.5,0.25,0.125, 0.5,0.3125,0.5},
{-0.5,0.3125,0.25, 0.5,0.375,0.5},
{-0.5,0.375,0.375, 0.5,0.4375,0.5}}},
	collision_box= { type = "fixed", fixed = {
{-0.5, -0.5, -0.5, 0.5, -0.4375, -0.375},
{-0.5, -0.4375, -0.5, 0.5, -0.375, -0.25},
{-0.5, -0.375, -0.5, 0.5, -0.3125, -0.125},
{-0.5, -0.3125, -0.5, 0.5, -0.25, 0},
{-0.5, -0.25, -0.5, 0.5, -0.1875, 0.125},
{-0.5, -0.1875, -0.5, 0.5, -0.125, 0.25},
{-0.5, -0.125, -0.5, 0.5, -0.0625, 0.375},
{-0.5, -0.0625, -0.5, 0.5, 0.0625, 0.5},
{-0.5, 0.0625, -0.375, 0.5, 0.125, 0.5},
{-0.5, 0.125, -0.25, 0.5, 0.1875, 0.5},
{-0.5, 0.1875, -0.125, 0.5, 0.25, 0.5},
{-0.5, 0.25, 0, 0.5, 0.3125, 0.5},
{-0.5, 0.3125, 0.125, 0.5, 0.375, 0.5},
{-0.5, 0.375, 0.25, 0.5, 0.4375, 0.5},
{-0.5, 0.4375, 0.375, 0.5, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "sku.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:sku2_r", {
	description = "RightHalf SkewSlab",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku2_r',
	collision_box= { type= "fixed", fixed= {
{0,-0.4375,-0.5, 0.5,-0.375,-0.375},
{0,-0.375,-0.5, 0.5,-0.3125,-0.25},
{0,-0.3125,-0.5, 0.5,-0.25,-0.125},
{0,-0.25,-0.5, 0.5,-0.1875,0},
{0,-0.1875,-0.5, 0.5,-0.125,0.125},
{0,-0.125,-0.5, 0.5,-0.0625,0.25},
{0,-0.0625,-0.5, 0.5,0,0.375},
{0,0,-0.375, 0.5,0.0625,0.5},
{0,0.0625,-0.25, 0.5,0.125,0.5},
{0,0.125,-0.125, 0.5,0.1875,0.5},
{0,0.1875,0, 0.5,0.25,0.5},
{0,0.25,0.125, 0.5,0.3125,0.5},
{0,0.3125,0.25, 0.5,0.375,0.5},
{0,0.375,0.375, 0.5,0.4375,0.5}}},
	selection_box= { type = "fixed", fixed = {
{0,-0.4375,-0.5, 0.5,-0.375,-0.375},
{0,-0.375,-0.5, 0.5,-0.3125,-0.25},
{0,-0.3125,-0.5, 0.5,-0.25,-0.125},
{0,-0.25,-0.5, 0.5,-0.1875,0},
{0,-0.1875,-0.5, 0.5,-0.125,0.125},
{0,-0.125,-0.5, 0.5,-0.0625,0.25},
{0,-0.0625,-0.5, 0.5,0,0.375},
{0,0,-0.375, 0.5,0.0625,0.5},
{0,0.0625,-0.25, 0.5,0.125,0.5},
{0,0.125,-0.125, 0.5,0.1875,0.5},
{0,0.1875,0, 0.5,0.25,0.5},
{0,0.25,0.125, 0.5,0.3125,0.5},
{0,0.3125,0.25, 0.5,0.375,0.5},
{0,0.375,0.375, 0.5,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "sku2_r.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:sku2_l", {
	description = "LeftHalf SkewSlab",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku2_l',
	collision_box= { type= "fixed", fixed= {
{-0.5,-0.4375,-0.5, 0,-0.375,-0.375},
{-0.5,-0.375,-0.5, 0,-0.3125,-0.25},
{-0.5,-0.3125,-0.5, 0,-0.25,-0.125},
{-0.5,-0.25,-0.5, 0,-0.1875,0},
{-0.5,-0.1875,-0.5, 0,-0.125,0.125},
{-0.5,-0.125,-0.5, 0,-0.0625,0.25},
{-0.5,-0.0625,-0.5, 0,0,0.375},
{-0.5,0,-0.375, 0,0.0625,0.5},
{-0.5,0.0625,-0.25, 0,0.125,0.5},
{-0.5,0.125,-0.125, 0,0.1875,0.5},
{-0.5,0.1875,0, 0,0.25,0.5},
{-0.5,0.25,0.125, 0,0.3125,0.5},
{-0.5,0.3125,0.25, 0,0.375,0.5},
{-0.5,0.375,0.375, 0,0.4375,0.5}}},
	selection_box= { type = "fixed", fixed = {
{-0.5,-0.4375,-0.5, 0,-0.375,-0.375},
{-0.5,-0.375,-0.5, 0,-0.3125,-0.25},
{-0.5,-0.3125,-0.5, 0,-0.25,-0.125},
{-0.5,-0.25,-0.5, 0,-0.1875,0},
{-0.5,-0.1875,-0.5, 0,-0.125,0.125},
{-0.5,-0.125,-0.5, 0,-0.0625,0.25},
{-0.5,-0.0625,-0.5, 0,0,0.375},
{-0.5,0,-0.375, 0,0.0625,0.5},
{-0.5,0.0625,-0.25, 0,0.125,0.5},
{-0.5,0.125,-0.125, 0,0.1875,0.5},
{-0.5,0.1875,0, 0,0.25,0.5},
{-0.5,0.25,0.125, 0,0.3125,0.5},
{-0.5,0.3125,0.25, 0,0.375,0.5},
{-0.5,0.375,0.375, 0,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "sku2_l.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:sku3_l", {
	description = "R3 SkewSlab",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku3_l',
	collision_box= { type= "fixed", fixed= {
	{0,-0.4375,-0.5, 0.4375,0,-0.375},
	{-0.0625,-0.375,-0.375, 0.375,0.0625,-0.25},
	{-0.125,-0.3125,-0.25, 0.3125,0.125,-0.125},
	{-0.1875,-0.25,-0.125, 0.25,0.1875,0},
	{-0.25,-0.1875,0, 0.1875,0.25,0.125},
	{-0.3125,-0.125,0.125, 0.125,0.3125,0.25},
	{-0.375,-0.0625,0.25, 0.0625,0.375,0.375},
	{-0.4375,0,0.375, 0,0.4375,0.5}}},
selection_box= { type = "fixed", fixed = {
	{0,-0.4375,-0.5, 0.4375,0,-0.375},
	{-0.0625,-0.375,-0.375, 0.375,0.0625,-0.25},
	{-0.125,-0.3125,-0.25, 0.3125,0.125,-0.125},
	{-0.1875,-0.25,-0.125, 0.25,0.1875,0},
	{-0.25,-0.1875,0, 0.1875,0.25,0.125},
	{-0.3125,-0.125,0.125, 0.125,0.3125,0.25},
	{-0.375,-0.0625,0.25, 0.0625,0.375,0.375},
	{-0.4375,0,0.375, 0,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "sku3_l.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:sku3_r", {
	description = "R3 SkewSlab Alt",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku3_r',
	collision_box= { type= "fixed", fixed= {
{-0.5,-0.5,-0.5, 0.0625,0.0625,-0.375},
{-0.4375,-0.4375,-0.375, 0.125,0.125,-0.25},
{-0.375,-0.375,-0.25, 0.1875,0.1875,-0.125},
{-0.3125,-0.3125,-0.125, 0.25,0.25,0},
{-0.25,-0.25,0, 0.3125,0.3125,0.125},
{-0.1875,-0.1875,0.125, 0.375,0.375,0.25},
{-0.125,-0.125,0.25, 0.4375,0.4375,0.375},
{-0.0625,-0.0625,0.375, 0.5,0.5,0.5}}},
selection_box= { type = "fixed", fixed = {
{-0.4375,-0.4375,-0.5, 0,0,-0.375},
{-0.375,-0.375,-0.375, 0.0625,0.0625,-0.25},
{-0.3125,-0.3125,-0.25, 0.125,0.125,-0.125},
{-0.25,-0.25,-0.125, 0.1875,0.1875,0},
{-0.1875,-0.1875,0, 0.25,0.25,0.125},
{-0.125,-0.125,0.125, 0.3125,0.3125,0.25},
{-0.0625,-0.0625,0.25, 0.375,0.375,0.375},
{0,0,0.375, 0.4375,0.4375,0.5}}},
	drawtype = "mesh",
	mesh = "sku3_r.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:diagsteps", {
	description = "Diagonal Steps",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:diagsteps",
	selection_box={type="fixed",fixed={
{0,0,0.0625, 0.0625,0.5,0.5},
{0.0625,0,0.125, 0.125,0.5,0.5},
{0.125,0,0.1875, 0.1875,0.5,0.5},
{0.1875,0,0.25, 0.25,0.5,0.5},
{0.25,0,0.3125, 0.3125,0.5,0.5},
{0.3125,0,0.375, 0.375,0.5,0.5},
{0.375,0,0.4375, 0.4375,0.5,0.5},
{-0.5,0,-0.4375, -0.4375,0.5,-0.375},
{-0.5,0,-0.375, -0.375,0.5,-0.3125},
{-0.5,0,-0.3125, -0.3125,0.5,-0.25},
{-0.5,0,-0.25, -0.25,0.5,-0.1875},
{-0.5,0,-0.1875, -0.1875,0.5,-0.125},
{-0.5,0,-0.125, -0.125,0.5,-0.0625},
{-0.5,0,-0.0625, -0.0625,0.5,0},
{-0.5,0,0, 0,0.5,0.5},
{-0.5,-0.5,-0.5, 0.5,0,0.5}}},
	collision_box={type="fixed",fixed={
{0,0,0.0625, 0.0625,0.5,0.5},
{0.0625,0,0.125, 0.125,0.5,0.5},
{0.125,0,0.1875, 0.1875,0.5,0.5},
{0.1875,0,0.25, 0.25,0.5,0.5},
{0.25,0,0.3125, 0.3125,0.5,0.5},
{0.3125,0,0.375, 0.375,0.5,0.5},
{0.375,0,0.4375, 0.4375,0.5,0.5},
{-0.5,0,-0.4375, -0.4375,0.5,-0.375},
{-0.5,0,-0.375, -0.375,0.5,-0.3125},
{-0.5,0,-0.3125, -0.3125,0.5,-0.25},
{-0.5,0,-0.25, -0.25,0.5,-0.1875},
{-0.5,0,-0.1875, -0.1875,0.5,-0.125},
{-0.5,0,-0.125, -0.125,0.5,-0.0625},
{-0.5,0,-0.0625, -0.0625,0.5,0},
{-0.5,0,0, 0,0.5,0.5},
{-0.5,-0.5,-0.5, 0.5,0,0.5}}},
	drawtype="mesh",
	mesh = "diagsteps.obj"
})

minetest.register_node("stones:diagstep", {
	description = "Diagonal Step",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cracky=1, oddly_breakable_by_hand=1},
	drop = "stones:diagstep",
	collision_box={type="fixed",fixed={
{-0.5,-0.5,0, 0,0,0.5},
{0,-0.5,0.0625, 0.0625,0,0.5},
{0.0625,-0.5,0.125, 0.125,0,0.5},
{0.125,-0.5,0.1875, 0.1875,0,0.5},
{0.1875,-0.5,0.25, 0.25,0,0.5},
{0.25,-0.5,0.3125, 0.3125,0,0.5},
{0.3125,-0.5,0.375, 0.375,0,0.5},
{0.375,-0.5,0.4375, 0.4375,0,0.5},
{-0.5,-0.5,-0.4375, -0.4375,0,-0.375},
{-0.5,-0.5,-0.375, -0.375,0,-0.3125},
{-0.5,-0.5,-0.3125, -0.3125,0,-0.25},
{-0.5,-0.5,-0.25, -0.25,0,-0.1875},
{-0.5,-0.5,-0.1875, -0.1875,0,-0.125},
{-0.5,-0.5,-0.125, -0.125,0,-0.0625},
{-0.5,-0.5,-0.0625, -0.0625,0,0}}},
	selection_box={type="fixed",fixed={
{-0.5,-0.5,0, 0,0,0.5},
{0,-0.5,0.0625, 0.0625,0,0.5},
{0.0625,-0.5,0.125, 0.125,0,0.5},
{0.125,-0.5,0.1875, 0.1875,0,0.5},
{0.1875,-0.5,0.25, 0.25,0,0.5},
{0.25,-0.5,0.3125, 0.3125,0,0.5},
{0.3125,-0.5,0.375, 0.375,0,0.5},
{0.375,-0.5,0.4375, 0.4375,0,0.5},
{-0.5,-0.5,-0.4375, -0.4375,0,-0.375},
{-0.5,-0.5,-0.375, -0.375,0,-0.3125},
{-0.5,-0.5,-0.3125, -0.3125,0,-0.25},
{-0.5,-0.5,-0.25, -0.25,0,-0.1875},
{-0.5,-0.5,-0.1875, -0.1875,0,-0.125},
{-0.5,-0.5,-0.125, -0.125,0,-0.0625},
{-0.5,-0.5,-0.0625, -0.0625,0,0}}},
	drawtype="mesh",
	mesh = "diagstep.obj"
})

function nb(n)
	return n/16-1/2
end
	
minetest.register_node("stones:arch", {
	description = "Arch",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(15.5), nb(16)},
{nb(1.5), nb(7.5), nb(0), nb(2.5), nb(15.5), nb(16)},
{nb(2.5), nb(8.5), nb(0), nb(3.5), nb(15.5), nb(16)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(15.5), nb(16)},
{nb(5), nb(11.9), nb(0), nb(6), nb(15.5), nb(16)},
{nb(6), nb(12.9), nb(0), nb(8), nb(15.5), nb(16)},
{nb(8), nb(13.9), nb(0), nb(9), nb(15.5), nb(16)},
{nb(9), nb(14.9), nb(0), nb(12), nb(15.5), nb(16)},
{nb(0.5), nb(15.75), nb(0), nb(16), nb(16), nb(16)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(15.5), nb(16)},
{nb(1.5), nb(7.5), nb(0), nb(2.5), nb(15.5), nb(16)},
{nb(2.5), nb(8.5), nb(0), nb(3.5), nb(15.5), nb(16)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(15.5), nb(16)},
{nb(5), nb(11.9), nb(0), nb(6), nb(15.5), nb(16)},
{nb(6), nb(12.9), nb(0), nb(8), nb(15.5), nb(16)},
{nb(8), nb(13.9), nb(0), nb(9), nb(15.5), nb(16)},
{nb(9), nb(14.9), nb(0), nb(12), nb(15.5), nb(16)},
{nb(0.5), nb(15.75), nb(0), nb(16), nb(16), nb(16)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arch",
	drawtype = "mesh",
	mesh = "arch.obj"
})

minetest.register_node("stones:arsh", {
	description = "Shallow Arch",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arsh.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(0), nb(8), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.4), nb(8), nb(1.5), nb(15.5), nb(16)},
{nb(1.5), nb(7.4), nb(8), nb(2.5), nb(15.5), nb(16)},
{nb(2.5), nb(8.4), nb(8), nb(3.5), nb(15.5), nb(16)},
{nb(3.5), nb(10.9), nb(8), nb(5), nb(15.5), nb(16)},
{nb(5), nb(11.9), nb(8), nb(6), nb(15.5), nb(16)},
{nb(6), nb(12.9), nb(8), nb(8), nb(15.5), nb(16)},
{nb(8), nb(13.8), nb(8), nb(9), nb(15.5), nb(16)},
{nb(9), nb(14.8), nb(8), nb(12), nb(15.5), nb(16)},
{nb(0.5), nb(15.75), nb(8), nb(16), nb(16), nb(16)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(0), nb(8), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.4), nb(8), nb(1.5), nb(15.5), nb(16)},
{nb(1.5), nb(7.4), nb(8), nb(2.5), nb(15.5), nb(16)},
{nb(2.5), nb(8.4), nb(8), nb(3.5), nb(15.5), nb(16)},
{nb(3.5), nb(10.9), nb(8), nb(5), nb(15.5), nb(16)},
{nb(5), nb(11.9), nb(8), nb(6), nb(15.5), nb(16)},
{nb(6), nb(12.9), nb(8), nb(8), nb(15.5), nb(16)},
{nb(8), nb(13.8), nb(8), nb(9), nb(15.5), nb(16)},
{nb(9), nb(14.8), nb(8), nb(12), nb(15.5), nb(16)},
{nb(0.5), nb(15.75), nb(8), nb(16), nb(16), nb(16)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arsh"
})

minetest.register_node("stones:arschol", {
	description = "Shallow to Arch Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arschol.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(8), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(7.7), nb(1.5), nb(16), nb(16)},
{nb(1.5), nb(7.5), nb(7.2), nb(2.5), nb(16), nb(16)},
{nb(2.5), nb(8.4), nb(6.7), nb(3.5), nb(16), nb(16)},
{nb(3.5), nb(10.9), nb(6.2), nb(5), nb(16), nb(16)},
{nb(5), nb(11.9), nb(5.45), nb(6), nb(16), nb(16)},
{nb(6), nb(12.9), nb(4.8), nb(8), nb(16), nb(16)},
{nb(8), nb(13.8), nb(3.9), nb(9), nb(16), nb(16)},
{nb(9), nb(14.75), nb(3.2), nb(12), nb(16), nb(16)},
{nb(12), nb(15.75), nb(1.5), nb(16), nb(16), nb(16)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(8), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(7.7), nb(1.5), nb(16), nb(16)},
{nb(1.5), nb(7.5), nb(7.2), nb(2.5), nb(16), nb(16)},
{nb(2.5), nb(8.4), nb(6.7), nb(3.5), nb(16), nb(16)},
{nb(3.5), nb(10.9), nb(6.2), nb(5), nb(16), nb(16)},
{nb(5), nb(11.9), nb(5.45), nb(6), nb(16), nb(16)},
{nb(6), nb(12.9), nb(4.8), nb(8), nb(16), nb(16)},
{nb(8), nb(13.8), nb(3.9), nb(9), nb(16), nb(16)},
{nb(9), nb(14.75), nb(3.2), nb(12), nb(16), nb(16)},
{nb(12), nb(15.75), nb(1.5), nb(16), nb(16), nb(16)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arschol"
})

minetest.register_node("stones:arcshol", {
	description = "Arch to Shallow Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arcshol.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(0.75), nb(1.5), nb(16), nb(16)},
{nb(1.5), nb(7.4), nb(1.25), nb(2.5), nb(16), nb(16)},
{nb(2.5), nb(8.4), nb(1.75), nb(3.5), nb(16), nb(16)},
{nb(3.5), nb(10.9), nb(2.5), nb(5), nb(16), nb(16)},
{nb(5), nb(11.9), nb(3), nb(6), nb(16), nb(16)},
{nb(6), nb(12.9), nb(4), nb(8), nb(16), nb(16)},
{nb(8), nb(13.9), nb(4.5), nb(9), nb(16), nb(16)},
{nb(9), nb(14.8), nb(6), nb(12), nb(16), nb(16)},
{nb(12), nb(15.75), nb(8), nb(16), nb(16), nb(16)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(16)},
{nb(0.5), nb(4.5), nb(0.75), nb(1.5), nb(16), nb(16)},
{nb(1.5), nb(7.4), nb(1.25), nb(2.5), nb(16), nb(16)},
{nb(2.5), nb(8.4), nb(1.75), nb(3.5), nb(16), nb(16)},
{nb(3.5), nb(10.9), nb(2.5), nb(5), nb(16), nb(16)},
{nb(5), nb(11.9), nb(3), nb(6), nb(16), nb(16)},
{nb(6), nb(12.9), nb(4), nb(8), nb(16), nb(16)},
{nb(8), nb(13.9), nb(4.5), nb(9), nb(16), nb(16)},
{nb(9), nb(14.8), nb(6), nb(12), nb(16), nb(16)},
{nb(12), nb(15.75), nb(8), nb(16), nb(16), nb(16)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arcshol"
})

minetest.register_node("stones:arschor", {
	description = "Shallow to Arch Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arschor.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(8)},
{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(16), nb(8.25)},
{nb(1.5), nb(7.4), nb(0), nb(2.5), nb(16), nb(8.75)},
{nb(2.5), nb(8.4), nb(0), nb(3.5), nb(16), nb(9.25)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(16), nb(9.75)},
{nb(5), nb(11.9), nb(0), nb(6), nb(16), nb(10.5)},
{nb(6), nb(12.9), nb(0), nb(8), nb(16), nb(11)},
{nb(8), nb(13.8), nb(0), nb(9), nb(16), nb(12)},
{nb(9), nb(14.8), nb(0), nb(12), nb(16), nb(12.5)},
{nb(12), nb(15.75), nb(0), nb(16), nb(16), nb(14)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(8)},
{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(16), nb(8.25)},
{nb(1.5), nb(7.4), nb(0), nb(2.5), nb(16), nb(8.75)},
{nb(2.5), nb(8.4), nb(0), nb(3.5), nb(16), nb(9.25)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(16), nb(9.75)},
{nb(5), nb(11.9), nb(0), nb(6), nb(16), nb(10.5)},
{nb(6), nb(12.9), nb(0), nb(8), nb(16), nb(11)},
{nb(8), nb(13.8), nb(0), nb(9), nb(16), nb(12)},
{nb(9), nb(14.8), nb(0), nb(12), nb(16), nb(12.5)},
{nb(12), nb(15.75), nb(0), nb(16), nb(16), nb(14)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arschor"
})

minetest.register_node("stones:arcshor", {
	description = "Arch to Shallow Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arcshor.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(15.75)},
{nb(0.5), nb(4.4), nb(0), nb(1.5), nb(16), nb(15.25)},
{nb(1.5), nb(7.4), nb(0), nb(2.5), nb(16), nb(14.75)},
{nb(2.5), nb(8.4), nb(0), nb(3.5), nb(16), nb(14.25)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(16), nb(13.5)},
{nb(5), nb(11.9), nb(0), nb(6), nb(16), nb(13)},
{nb(6), nb(12.9), nb(0), nb(8), nb(16), nb(12)},
{nb(8), nb(13.9), nb(0), nb(9), nb(16), nb(11.5)},
{nb(9), nb(14.8), nb(0), nb(12), nb(16), nb(10)},
{nb(12), nb(15.75), nb(0), nb(16), nb(16), nb(8)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(1), nb(0), nb(0.5), nb(16), nb(15.75)},
{nb(0.5), nb(4.4), nb(0), nb(1.5), nb(16), nb(15.25)},
{nb(1.5), nb(7.4), nb(0), nb(2.5), nb(16), nb(14.75)},
{nb(2.5), nb(8.4), nb(0), nb(3.5), nb(16), nb(14.25)},
{nb(3.5), nb(10.9), nb(0), nb(5), nb(16), nb(13.5)},
{nb(5), nb(11.9), nb(0), nb(6), nb(16), nb(13)},
{nb(6), nb(12.9), nb(0), nb(8), nb(16), nb(12)},
{nb(8), nb(13.9), nb(0), nb(9), nb(16), nb(11.5)},
{nb(9), nb(14.8), nb(0), nb(12), nb(16), nb(10)},
{nb(12), nb(15.75), nb(0), nb(16), nb(16), nb(8)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arcshor"
})
	
minetest.register_node("stones:arco", {
	description = "Outer Arc",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arco.obj",
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(0), nb(16-0.5), nb(0.5), nb(4.5), nb(16)},
{nb(0), nb(4.5), nb(16-1.5), nb(1.5), nb(7.5), nb(16)},
{nb(0), nb(7.5), nb(16-2.5), nb(2.5), nb(8.5), nb(16)},
{nb(0), nb(8.5), nb(16-3.5), nb(3.5), nb(10.5), nb(16)},
{nb(0), nb(10.5), nb(16-4.5), nb(4.5), nb(11.5), nb(16)},
{nb(0), nb(11.5), nb(16-5.5), nb(5.5), nb(12.5), nb(16)},
{nb(0), nb(12.5), nb(16-7.5), nb(7.5), nb(13.5), nb(16)},
{nb(0), nb(13.5), nb(16-8.5), nb(8.5), nb(14.5), nb(16)},
{nb(0), nb(14.5), nb(16-11.5), nb(11.5), nb(15.5), nb(16)},
{nb(0), nb(15.5), nb(16-15.5), nb(16), nb(16), nb(16)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(0), nb(16-0.5), nb(0.5), nb(4.5), nb(16)},
{nb(0), nb(4.5), nb(16-1.5), nb(1.5), nb(7.5), nb(16)},
{nb(0), nb(7.5), nb(16-2.5), nb(2.5), nb(8.5), nb(16)},
{nb(0), nb(8.5), nb(16-3.5), nb(3.5), nb(10.5), nb(16)},
{nb(0), nb(10.5), nb(16-4.5), nb(4.5), nb(11.5), nb(16)},
{nb(0), nb(11.5), nb(16-5.5), nb(5.5), nb(12.5), nb(16)},
{nb(0), nb(12.5), nb(16-7.5), nb(7.5), nb(13.5), nb(16)},
{nb(0), nb(13.5), nb(16-8.5), nb(8.5), nb(14.5), nb(16)},
{nb(0), nb(14.5), nb(16-11.5), nb(11.5), nb(15.5), nb(16)},
{nb(0), nb(15.5), nb(16-15.5), nb(16), nb(16), nb(16)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arco"
})

minetest.register_node("stones:arci", {
	description = "Inner Arc",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arci.obj",
	selection_box = {type = "fixed", fixed = {
{nb(0), nb(16-0.5), nb(0), nb(16), nb(16), nb(16)},
{nb(0), nb(0), nb(0), nb(0.5), nb(15.5), nb(16)},
{nb(0.5), nb(0), nb(16-0.5), nb(16), nb(15.5), nb(16)},

{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(7.5), nb(16-0.5)},
{nb(0.5), nb(7.5), nb(0), nb(2.5), nb(8.5), nb(16-0.5)},
{nb(0.5), nb(8.5), nb(0), nb(3.5), nb(10.5), nb(16-0.5)},
{nb(0.5), nb(10.5), nb(0), nb(5), nb(11.5), nb(16-0.5)},
{nb(0.5), nb(11.5), nb(0), nb(6), nb(12.5), nb(16-0.5)},
{nb(0.5), nb(12.5), nb(0), nb(8), nb(13.5), nb(16-0.5)},
{nb(0.5), nb(13.5), nb(0), nb(9), nb(14.5), nb(16-0.5)},
{nb(0.5), nb(14.5), nb(0), nb(12), nb(15.5), nb(16-0.5)},

{nb(0.5), nb(4.5), nb(16-1.5), nb(16), nb(7.5), nb(16-0.5)},
{nb(0.5), nb(7.5), nb(16-2.5), nb(16), nb(8.5), nb(16-0.5)},
{nb(0.5), nb(8.5), nb(16-3.5), nb(16), nb(10.5), nb(16-0.5)},
{nb(0.5), nb(10.5), nb(16-5), nb(16), nb(11.5), nb(16-0.5)},
{nb(0.5), nb(11.5), nb(16-6), nb(16), nb(12.5), nb(16-0.5)},
{nb(0.5), nb(12.5), nb(16-8), nb(16), nb(13.5), nb(16-0.5)},
{nb(0.5), nb(13.5), nb(16-9), nb(16), nb(14.5), nb(16-0.5)},
{nb(0.5), nb(14.5), nb(16-12), nb(16), nb(15.5), nb(16-0.5)}}},
	collision_box = {type = "fixed", fixed = {
{nb(0), nb(16-0.5), nb(0), nb(16), nb(16), nb(16)},
{nb(0), nb(0), nb(0), nb(0.5), nb(15.5), nb(16)},
{nb(0.5), nb(0), nb(16-0.5), nb(16), nb(15.5), nb(16)},

{nb(0.5), nb(4.5), nb(0), nb(1.5), nb(7.5), nb(16-0.5)},
{nb(0.5), nb(7.5), nb(0), nb(2.5), nb(8.5), nb(16-0.5)},
{nb(0.5), nb(8.5), nb(0), nb(3.5), nb(10.5), nb(16-0.5)},
{nb(0.5), nb(10.5), nb(0), nb(5), nb(11.5), nb(16-0.5)},
{nb(0.5), nb(11.5), nb(0), nb(6), nb(12.5), nb(16-0.5)},
{nb(0.5), nb(12.5), nb(0), nb(8), nb(13.5), nb(16-0.5)},
{nb(0.5), nb(13.5), nb(0), nb(9), nb(14.5), nb(16-0.5)},
{nb(0.5), nb(14.5), nb(0), nb(12), nb(15.5), nb(16-0.5)},

{nb(0.5), nb(4.5), nb(16-1.5), nb(16), nb(7.5), nb(16-0.5)},
{nb(0.5), nb(7.5), nb(16-2.5), nb(16), nb(8.5), nb(16-0.5)},
{nb(0.5), nb(8.5), nb(16-3.5), nb(16), nb(10.5), nb(16-0.5)},
{nb(0.5), nb(10.5), nb(16-5), nb(16), nb(11.5), nb(16-0.5)},
{nb(0.5), nb(11.5), nb(16-6), nb(16), nb(12.5), nb(16-0.5)},
{nb(0.5), nb(12.5), nb(16-8), nb(16), nb(13.5), nb(16-0.5)},
{nb(0.5), nb(13.5), nb(16-9), nb(16), nb(14.5), nb(16-0.5)},
{nb(0.5), nb(14.5), nb(16-12), nb(16), nb(15.5), nb(16-0.5)}}},
	groups = {cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arci"
})




