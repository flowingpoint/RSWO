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
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	paramtype = "light",
	tiles ={"rock.png"},
	groups = {cvol=1, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:rock',
	light_source = 0.005,
	legacy_mineral = false,
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rubble", {
	description = "Rubble",
	tiles ={"rubble.png"},
	groups = {cvol=1, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1}
})

minetest.register_node("stones:rush", {
	description = "Rush",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={{name = "dirt.png",
		tileable_vertical = true}},
	groups = {crumbly=3, soil=1},
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
	groups = {crumbly=2, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rush',
	light_source = 0,
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blush", {
	description = "Lush Brush",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blush.png"},
	groups = {crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rush',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blush.obj"
})

minetest.register_node("stones:brushrock_0", {
	description = "Brush | Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_0.png", "rushrock_0.png^[transformFY", "brushrock_s.png^[transformFX", "brushrock_s.png", "rock.png", "dirt.png^grass_side.png"},
	groups = {cvol=0.5, cracky=1, soil=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_0",
	light_source = 0,
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_0", {
	description = "Rush | Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_0.png", "rushrock_0.png^[transformFY", "rushrock_0.png^[transformR90^[transformFX", "rushrock_0.png^[transformR90", "rock.png", "dirt.png"},
	groups = {cvol=0.5, cracky=2, soil=1},
	drop = "stones:rushrock_0",
	light_source = 0,
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_0", {
	description = "Rush | Rubble",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_0.png", "rublish_0.png^[transformFY", "rublish_0.png^[transformR90^[transformFX", "rublish_0.png^[transformR90", "rubble.png", "dirt.png"},
	groups = {cvol=0.5, cracky=3, soil=1, not_in_creative_inventory=1},
	drop = "stones:rublish_0",
	light_source = 0,
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_0", {
	description = "Lush Brush | Rock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_0.png"},
	groups = {cvol=0.5, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_0',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_0.obj"
})

minetest.register_node("stones:brushrock_1", {
	description = "Brush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_1.png", "rushrock_1.png^[transformR90", {name = "dirt.png^grass_side.png", tileable_vertical = true}, "rock.png", "rock.png", {name = "dirt.png^grass_side.png", tileable_vertical = true}},
	groups = {cvol=0.5, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_1",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_1", {
	description = "Rush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_1.png", "rushrock_1.png^[transformR90", "dirt.png", "rock.png", "rock.png", "dirt.png"},
	groups = {cvol=0.5, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_1",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_1", {
	description = "Rush / Rubble",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_1.png", "rublish_1.png^[transformR90", "dirt.png", "rubble.png", "rubble.png", "dirt.png"},
	groups = {cvol=0.5, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_1",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_1", {
	description = "Lush Brush / Rock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_1.png"},
	groups = {cvol=0.5, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_1',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_1.obj"
})

minetest.register_node("stones:brushrock_2", {
	description = "Brush+Rock 3/1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_2.png", "rushrock_2.png^[transformFY", "dirt.png^grass_side.png", "rock.png", "brushrock_s.png^[transformFX", "dirt.png^grass_side.png"},
	groups = {cvol=0.25, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_2",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_2", {
	description = "Rush+Rock 3/1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_2.png", "rushrock_2.png^[transformFY", "dirt.png", "rock.png", "rushrock_0.png^[transformR90^[transformFX", "dirt.png"},
	groups = {cvol=0.25, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_2",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_2", {
	description = "Rubble+Rock 3/1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_2.png", "rublish_2.png^[transformFY", "dirt.png", "rubble.png", "rublish_0.png^[transformR90^[transformFX", "dirt.png"},
	groups = {cvol=0.25, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_2",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_2", {
	description = "Lush Brush+Rock 3/1",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_2.png"},
	groups = {cvol=0.25, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_2',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_2.obj"
})

minetest.register_node("stones:brushrock_3", {
	description = "Brush+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_3.png", "rushrock_3.png^[transformFY", "dirt.png^grass_side.png", "rock.png",   "rock.png", "brushrock_s.png"},
	groups = {cvol=0.75, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_3",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_3", {
	description = "Rush+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_3.png", "rushrock_3.png^[transformFY", "dirt.png", "rock.png",   "rock.png", "rushrock_0.png^[transformR90"},
	groups = {cvol=0.75, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_3",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_3", {
	description = "Rubble+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_3.png", "rublish_3.png^[transformFY", "dirt.png", "rubble.png",   "rubble.png", "rublish_0.png^[transformR90"},
	groups = {cvol=0.75, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_3",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_3", {
	description = "Blush+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blushrock_3.png"},
	groups = {cvol=0.75, cracky=1, soil=1,  not_in_creative_inventory=1},
	drop = "stones:rushrock_3",
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_3.obj"
})

minetest.register_node("stones:brushrock_4", {
	description = "Brush+Rock 3\1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_3.png^[transformFX^[transformR270", "rushrock_3.png^[transformR270", "rock.png", "brushrock_s.png^[transformFX", "dirt.png^grass_side.png", "rock.png",},
	groups = {cvol=0.75, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_4",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_4", {
	description = "Rush+Rock 3\1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_3.png^[transformFX^[transformR270", "rushrock_3.png^[transformR270", "rock.png", "rushrock_0.png^[transformR90^[transformFX", "dirt.png", "rock.png",},
	groups = {cvol=0.75, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_4",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_4", {
	description = "Rubble+Rock 3\1",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_3.png^[transformFX^[transformR270", "rublish_3.png^[transformR270", "rubble.png", "rublish_0.png^[transformR90^[transformFX", "dirt.png", "rubble.png",},
	groups = {cvol=0.75, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_4",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_4", {
	description = "Lush Blush+Rock 1/3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blushrock_4.png"},
	groups = {cvol=0.75, cracky=1, soil=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_4",
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_4.obj"
})

minetest.register_node("stones:brushrock_8", {
	description = "Brush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_8.png", "rushrock_8.png^[transformR90", {name = "dirt.png^grass_side.png", tileable_vertical = true}, {name = "brushrock_s.png", tileable_vertical = true}, {name = "brushrock_s.png^[transformFY^[transformR180", tileable_vertical = true}, {name = "dirt.png^grass_side.png", tileable_vertical = true}},
	groups = {cvol=0.125, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_8",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_8", {
	description = "Rush / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_8.png", "rushrock_8.png^[transformR90", {name = "dirt.png", tileable_vertical = true}, {name = "rushrock_0.png^[transformR90", tileable_vertical = true}, {name = "rushrock_0.png^[transformR270", tileable_vertical = true}, {name = "dirt.png", tileable_vertical = true}},
	groups = {cvol=0.125, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_8",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_8", {
	description = "Rubble / Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_8.png", "rublish_8.png^[transformR90", {name = "dirt.png", tileable_vertical = true}, {name = "rublish_0.png^[transformR90", tileable_vertical = true}, "rublish_0.png^[transformR270", {name = "dirt.png", tileable_vertical = true}},
	groups = {cvol=0.125, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_8",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_8", {
	description = "Lush Brush / Rock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_8.png"},
	groups = {cvol=0.125, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_8',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_8.obj"
})

minetest.register_node("stones:brushrock_5", {
	description = "Brush+Rock 1\3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_2.png^[transformFX^[transformR270", "rushrock_2.png^[transformR270", "brushrock_s.png", "dirt.png^grass_side.png", "dirt.png^grass_side.png", "rock.png"},
	groups = {cvol=0.25, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_5",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_5", {
	description = "Rush+Rock 1\3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_2.png^[transformFX^[transformR270", "rushrock_2.png^[transformR270", "rushrock_0.png^[transformR90", "dirt.png", "dirt.png", "rock.png"},
	groups = {cvol=0.25, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_5",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_5", {
	description = "Rubble+Rock 1\3",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_2.png^[transformFX^[transformR270", "rublish_2.png^[transformR270", "rublish_0.png^[transformR90", "dirt.png", "dirt.png", "rubble.png"},
	groups = {cvol=0.25, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_5",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_5", {
	description = "Lush Brush+Rock 3\1",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_5.png"},
	groups = {cvol=0.25, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_5',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_5.obj"
})

minetest.register_node("stones:brushrock_52ul", {
	description = "R5/2 Brush+Rock Left HighHalf",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_52ul.png"},
	groups = {cvol=0.5, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_52ul",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ul.obj"
})

minetest.register_node("stones:rushrock_52ul", {
	description = "R5/2 Rush+Rock Left HighHalf",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_52u.png"},
	groups = {cvol=0.5, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_52ul",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ul.obj"
})

minetest.register_node("stones:rublish_52ul", {
	description = "R5/2 Rush+Rock Left HighHalf Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_52u.png"},
	groups = {cvol=0.5, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_52ul",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ul.obj"
})

minetest.register_node("stones:blushrock_52ul", {
	description = "Lush R5/2 Brush+Rock Left HighHalf",
	paramtype = "light",
	use_texture_alpha = "clip",
	light_source = 0.5,
	paramtype2 = "facedir",
	tiles = {"blushrock_52ul.png"},
	groups = {cvol=0.5, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_52ul",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, 0, 0.5, 0.5},
{0, -0.5, -0.375, -0.0625, 0.5, 0.5},
{-0.0625, -0.5, -0.25, -0.125, 0.5, 0.5},
{-0.125, -0.5, -0.125, -0.1875, 0.5, 0.5},
{-0.1875, -0.5, 0, -0.25, 0.5, 0.5},
{-0.25, -0.5, 0.125, -0.3125, 0.5, 0.5},
{-0.3125, -0.5, 0.25, -0.375, 0.5, 0.5},
{-0.375, -0.5, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "blushrock_52ul.obj"
})

minetest.register_node("stones:brushrock_52ur", {
	description = "R5/2 Brush+Rock Right HighHalf ",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_52ur.png"},
	groups = {cvol=0.5, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_52ur",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ur.obj"
})

minetest.register_node("stones:rushrock_52ur", {
	description = "R5/2 Rush+Rock Right HighHalf ",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_52u.png"},
	groups = {cvol=0.5, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_52ur",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ur.obj"
})

minetest.register_node("stones:rublish_52ur", {
	description = "R5/2 Rush+Rock Right HighHalf Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_52u.png"},
	groups = {cvol=0.5, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_52ur",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "brushrock_52ur.obj"
})

minetest.register_node("stones:blushrock_52ur", {
	description = "Lush R5/2 Brush+Rock Right HighHalf",
	paramtype = "light",
	light_source = 0.5,
	paramtype2 = "facedir",
	tiles = {"brushrock_52ur.png"},
	groups = {cvol=0.5, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	use_texture_alpha = "clip",
	drop = "stones:rushrock_52ur",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.5, 0, -0.5, 0.5},
{0, 0.5, -0.375, 0.0625, -0.5, 0.5},
{0.0625, 0.5, -0.25, 0.125, -0.5, 0.5},
{0.125, 0.5, -0.125, 0.1875, -0.5, 0.5},
{0.1875, 0.5, 0, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.125, 0.3125, -0.5, 0.5},
{0.3125, 0.5, 0.25, 0.375, -0.5, 0.5},
{0.375, 0.5, 0.375, 0.4375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "blushrock_52ur.obj"
})

minetest.register_node("stones:brushrock_527l", {
	description = "R5/2 7/8 Brush+Rock Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527l.png"},
	groups = {cvol=0.75, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_527l",
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527l.obj"
})

minetest.register_node("stones:rushrock_527l", {
	description = "R5/2 7/8 Rush+Rock Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527l_1.png"},
	groups = {cvol=0.75, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_527l",
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527l.obj"
})

minetest.register_node("stones:rublish_527l", {
	description = "R5/2 7/8 Rush+Rock Left Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"r527l_1.png"},
	groups = {cvol=0.75, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_527l",
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527l.obj"
})

minetest.register_node("stones:blushrock_527l", {
	description = "Lush R5/2 7/8 Brush+Rock Left",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527l.png"},
	groups = {cvol=0.75, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	use_texture_alpha = "clip",
	drop = "stones:rushrock_527l",
	selection_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	collision_box = {type="fixed",fixed={
{0.5, -0.5, -0.5, -0.5, 0, 0.5},
{0.5, 0, -0.5, 0, 0.5, 0.5},
{-0.0625, 0, -0.375, -0.0625, 0.5, 0.5},
{-0.125, 0, -0.25, -0.125, 0.5, 0.5},
{-0.1825, 0, -0.125, -0.1875, 0.5, 0.5},
{-0.25, 0, 0, -0.25, 0.5, 0.5},
{-0.3125, 0, 0.125, -0.3125, 0.5, 0.5},
{-0.375, 0, 0.25, -0.375, 0.5, 0.5},
{-0.4375, 0, 0.375, -0.4375, 0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "blushrock_527l.obj"
})

minetest.register_node("stones:brushrock_527r", {
	description = "R5/2 7/8 Brush+Rock Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527r.png"},
	groups = {cvol=0.75, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_527r",
	selection_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527r.obj"
})

minetest.register_node("stones:rushrock_527r", {
	description = "R5/2 7/8 Rush+Rock Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527r_1.png"},
	groups = {cvol=0.75, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_527r",
	selection_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527r.obj"
})

minetest.register_node("stones:rublish_527r", {
	description = "R5/2 7/8 Rush+Rock Right Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"r527r_1.png"},
	groups = {cvol=0.75, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_527r",
	selection_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	drawtype = "mesh",
	mesh = "s_527r.obj"
})

minetest.register_node("stones:blushrock_527r", {
	description = "Lush R5/2 7/8 Brush+Rock Right",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s527r.png"},
	groups = {cvol=0.75, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	use_texture_alpha = "clip",
	drop = "stones:rushrock_527r",
	selection_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5, 0, -0.5, 0.5, -0.5, 0.5},
{-0.5, 0.5, -0.5, 0, 0, 0.5},
{0.0625, 0.5, -0.375, 0.0625, 0, 0.5},
{0.125, 0.5, -0.25, 0.125, 0, 0.5},
{0.1825, 0.5, -0.125, 0.1875, 0, 0.5},
{0.25, 0.5, 0, 0.25, 0, 0.5},
{0.3125, 0.5, 0.125, 0.3125, 0, 0.5},
{0.375, 0.5, 0.25, 0.375, 0, 0.5},
{0.4375, 0.5, 0.375, 0.4375, 0, 0.5}}},
	drawtype = "mesh",
	mesh = "blushrock_527r.obj"
})

minetest.register_node("stones:brushrock_28", {
	description = "Root 2 Brushrock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_28.png"},
	groups = {cvol=0.375, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_28",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_28.obj"
})

minetest.register_node("stones:rushrock_28", {
	description = "Root 2 Rushrock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_28.png"},
	groups = {cvol=0.375, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_28",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_28.obj"
})

minetest.register_node("stones:rublish_28", {
	description = "Root 2 Rushrock Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_28.png"},
	groups = {cvol=0.375, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_28",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "s_28.obj"
})

minetest.register_node("stones:blushrock_28", {
	description = "Lush Root 2 Brushrock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blushrock_28.png"},
	use_texture_alpha = "clip",
	groups = {cvol=0.375, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_28",
	collision_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5, 0.5, -0.375, -0.375, -0.5, 0.5},
{-0.375, 0.5, -0.25, -0.25, -0.5, 0.5},
{-0.25, 0.5, -0.125, -0.125, -0.5, 0.5},
{-0.125, 0.5, 0, 0, -0.5, 0.5},
{0, 0.5, 0.125, 0.125, -0.5, 0.5},
{0.125, 0.5, 0.25, 0.25, -0.5, 0.5},
{0.25, 0.5, 0.375, 0.375, -0.5, 0.5}}},
	drawtype = "mesh",
	mesh = "blushrock_28.obj"
})

minetest.register_node("stones:brushrock_2u", {
	description = "Root 2 Brushrock Diagstep",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s_2u.png"},
	groups = {cvol=0.625, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_2u",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	drawtype = "mesh",
	mesh = "s_2u.obj"
})

minetest.register_node("stones:rushrock_2u", {
	description = "Root 2 Rushrock Diagstep",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"s_2u_1.png"},
	groups = {cvol=0.625, cracky=2, oddly_breakable_by_hand=1},
	drop = "stones:rushrock_2u",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	drawtype = "mesh",
	mesh = "s_2u.obj"
})

minetest.register_node("stones:rublish_2u", {
	description = "Root 2 Rushrock Diagstep Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rb_2u_1.png"},
	groups = {cvol=0.625, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rublish_2u",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	drawtype = "mesh",
	mesh = "s_2u.obj"
})

minetest.register_node("stones:blushrock_2u", {
	description = "Lush Root 2 Brushrock Diagstep",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blushrock_28.png"},
	use_texture_alpha = "clip",
	groups = {cvol=0.625, cracky=1, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:rushrock_2u",
	collision_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	selection_box = {type="fixed",fixed={
{0.5, -0.5, 0.5, -0.5, 0, -0.5},
{0.375, 0, 0.5, -0.5, 0.5, 0.375},
{0.25, 0, 0.375, -0.5, 0.5, 0.25},
{0.125, 0, 0.25, -0.5, 0.5, 0.125},
{0, 0, 0.125, -0.5, 0.5, 0},
{-0.125, 0, 0, -0.5, 0.5, -0.125},
{-0.25, 0, -0.125, -0.5, 0.5, -0.25},
{-0.375, 0, -0.25, -0.5, 0.5, -0.375}}},
	drawtype = "mesh",
	mesh = "blushrock_2u.obj"
})

minetest.register_node("stones:brushrock_21", {
	description = "4Brush 3Rock /8",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"b9_dg_r_r9.png"},
	groups = {cvol=0.375, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_21",
	collision_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	selection_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	drawtype = "mesh",
	mesh = "s_21.obj"
})

minetest.register_node("stones:rushrock_21", {
	description = "4Rush 3Rock /8",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"b9_dg_r_r9_1.png"},
	groups = {cvol=0.375, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_21",
	collision_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	selection_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	drawtype = "mesh",
	mesh = "s_21.obj"
})

minetest.register_node("stones:rublish_21", {
	description = "4Rush 3Rock /8 Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"b9_dg_rb_r9_1.png"},
	groups = {cvol=0.375, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_21",
	collision_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	selection_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	drawtype = "mesh",
	mesh = "s_21.obj"
})

minetest.register_node("stones:blushrock_21", {
	description = "4Blush 3Rock /8",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"blushrock_1.png"},
	groups = {cvol=0.375, cracky=1, soil=1,  not_in_creative_inventory=1},
	light_source = 0,
	use_texture_alpha = "clip",
	drop = "stones:rushrock_21",
	collision_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	selection_box = {type="fixed",fixed={
{-0.4687,-0.5,-0.5, 0,0.5,-0.4687},
{-0.5,-0.5,-0.5, -0.4687,0.5,0.4687},
{-0.5,-0.5,0.4687, 0.4687,0.5,0.5},
{0.4687,-0.5,0, 0.5,0.5,0.4687},
{-0.4687,-0.5,0, 0,0.5,0.4687},
{-0.4687,-0.5,-0.4687, 0,0.5,0},
{0,-0.5,0, 0.4687,0.5,0.4687},
{0,-0.5,-0.25, 0.25,0.5,0},
{0,-0.5,-0.375, 0.125,0.5,-0.25},
{0.25,-0.5,-0.125, 0.375,0.5,0},
{0,-0.5,-0.4375, 0.0625,0.5,-0.375},
{0.125,-0.5,-0.3125, 0.1875,0.5,-0.25},
{0.25,-0.5,-0.1875, 0.3125,0.5,-0.125},
{0.375,-0.5,-0.0625, 0.4375,0.5,0}}},
	drawtype = "mesh",
	mesh = "blushrock_21.obj"
})

minetest.register_node("stones:brushrock_c", {
	description = "Brush Curved Into Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_c.png", "rushrock_c.png^[transformR270", "rock.png", "dirt.png^grass_side.png", "rock.png", "dirt.png^grass_side.png"},
	groups = {cvol=0.314, cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_c",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_c", {
	description = "Rush Curved Into Rock",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_c.png", "rushrock_c.png^[transformR270", "rock.png", "dirt.png", "rock.png", "dirt.png"},
	groups = {cvol=0.314, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_c",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_c", {
	description = "Rush Curved Into Rock Rubble",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_c.png", "rublish_c.png^[transformR270", "rubble.png", "dirt.png", "rubble.png", "dirt.png"},
	groups = {cvol=0.314, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_c",
	node_box = {type= "fixed", fixed= 
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_c", {
	description = "Lush Brush Curved Into Rock",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_c.png"},
	groups = {cvol=0.314, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_c',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_c.obj"
})

minetest.register_node("stones:brushrock_11", {
	description = "Brush+Rock+Brush //",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"brushrock_11.png", "rushrock_11.png^[transformFY", "dirt.png^grass_side.png", "dirt.png^grass_side.png", "brushrock_s.png", "brushrock_s.png"},
	groups = {cracky=1, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rushrock_11",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rushrock_11", {
	description = "Rush+Rock+Rush //",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rushrock_11.png", "rushrock_11.png^[transformFY", "dirt.png", "dirt.png", "rushrock_0.png^[transformR90", "rushrock_0.png^[transformR90"},
	groups = {cvol=0.5, cracky=2, soil=1},
	light_source = 0,
	drop = "stones:rushrock_11",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:rublish_11", {
	description = "Rubble+Rock+Rubble //",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rublish_11.png", "rublish_11.png^[transformFY", "dirt.png", "dirt.png", "rublish_0.png^[transformR90", "rublish_0.png^[transformR90"},
	groups = {cvol=0.5, cracky=3, soil=1, not_in_creative_inventory=1},
	light_source = 0,
	drop = "stones:rublish_11",
	node_box = {type= "fixed", fixed=
{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("stones:blushrock_11", {
	description = "Lush Brush+Rock+Brush //",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles ={"blushrock_11.png"},
	groups = {cvol=0.5, crumbly=1, soil=1, not_in_creative_inventory=1},
	drop = 'stones:rushrock_11',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    collision_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	drawtype = "mesh",
    mesh = "blushrock_11.obj"
})

minetest.register_node("stones:sku", {
	description = "Diagonal SkewSlab",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	groups = {cvol=0.5, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku',
	selection_box= { type= "fixed", fixed= {
{-0.5,0.375,-0.4375, 0.5,0.5,-0.375},
{-0.5,0.25,-0.375, 0.5,0.5,-0.3125},
{-0.5,0.125,-0.3125, 0.5,0.5,-0.25},
{-0.5,0,-0.25, 0.5,0.5,-0.1875},
{-0.5,-0.125,-0.1875, 0.5,0.5,-0.125},
{-0.5,-0.25,-0.125, 0.5,0.5,-0.0625},
{-0.5,-0.375,-0.0625, 0.5,0.5,0},
{-0.5,-0.5,0, 0.5,0.375,0.0625},
{-0.5,-0.5,0.0625, 0.5,0.25,0.125},
{-0.5,-0.5,0.125, 0.5,0.125,0.1875},
{-0.5,-0.5,0.1875, 0.5,0,0.25},
{-0.5,-0.5,0.25, 0.5,-0.125,0.3125},
{-0.5,-0.5,0.3125, 0.5,-0.25,0.375},
{-0.5,-0.5,0.375, 0.5,-0.375,0.4375}}},
	collision_box= { type = "fixed", fixed = {
{-0.5,0.375,-0.4375, 0.5,0.5,-0.375},
{-0.5,0.25,-0.375, 0.5,0.5,-0.3125},
{-0.5,0.125,-0.3125, 0.5,0.5,-0.25},
{-0.5,0,-0.25, 0.5,0.5,-0.1875},
{-0.5,-0.125,-0.1875, 0.5,0.5,-0.125},
{-0.5,-0.25,-0.125, 0.5,0.5,-0.0625},
{-0.5,-0.375,-0.0625, 0.5,0.5,0},
{-0.5,-0.5,0, 0.5,0.375,0.0625},
{-0.5,-0.5,0.0625, 0.5,0.25,0.125},
{-0.5,-0.5,0.125, 0.5,0.125,0.1875},
{-0.5,-0.5,0.1875, 0.5,0,0.25},
{-0.5,-0.5,0.25, 0.5,-0.125,0.3125},
{-0.5,-0.5,0.3125, 0.5,-0.25,0.375},
{-0.5,-0.5,0.375, 0.5,-0.375,0.4375}}},
	drawtype = "mesh",
	mesh = "sku.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:skubl", {
	description = "Diagonal SkewSlab Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.5, cracky=2, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = 'stones:skubl',
	selection_box= { type= "fixed", fixed= {
{-0.5,0.375,-0.4375, 0.5,0.5,-0.375},
{-0.5,0.25,-0.375, 0.5,0.5,-0.3125},
{-0.5,0.125,-0.3125, 0.5,0.5,-0.25},
{-0.5,0,-0.25, 0.5,0.5,-0.1875},
{-0.5,-0.125,-0.1875, 0.5,0.5,-0.125},
{-0.5,-0.25,-0.125, 0.5,0.5,-0.0625},
{-0.5,-0.375,-0.0625, 0.5,0.5,0},
{-0.5,-0.5,0, 0.5,0.375,0.0625},
{-0.5,-0.5,0.0625, 0.5,0.25,0.125},
{-0.5,-0.5,0.125, 0.5,0.125,0.1875},
{-0.5,-0.5,0.1875, 0.5,0,0.25},
{-0.5,-0.5,0.25, 0.5,-0.125,0.3125},
{-0.5,-0.5,0.3125, 0.5,-0.25,0.375},
{-0.5,-0.5,0.375, 0.5,-0.375,0.4375}}},
	collision_box= { type = "fixed", fixed = {
{-0.5,0.375,-0.4375, 0.5,0.5,-0.375},
{-0.5,0.25,-0.375, 0.5,0.5,-0.3125},
{-0.5,0.125,-0.3125, 0.5,0.5,-0.25},
{-0.5,0,-0.25, 0.5,0.5,-0.1875},
{-0.5,-0.125,-0.1875, 0.5,0.5,-0.125},
{-0.5,-0.25,-0.125, 0.5,0.5,-0.0625},
{-0.5,-0.375,-0.0625, 0.5,0.5,0},
{-0.5,-0.5,0, 0.5,0.375,0.0625},
{-0.5,-0.5,0.0625, 0.5,0.25,0.125},
{-0.5,-0.5,0.125, 0.5,0.125,0.1875},
{-0.5,-0.5,0.1875, 0.5,0,0.25},
{-0.5,-0.5,0.25, 0.5,-0.125,0.3125},
{-0.5,-0.5,0.3125, 0.5,-0.25,0.375},
{-0.5,-0.5,0.375, 0.5,-0.375,0.4375}}},
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
	groups = {cvol=0.25, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku2_r',
	collision_box= { type= "fixed", fixed= {
{-0.4375,-0.5,-0.5, -0.375,0,-0.375},
{-0.375,-0.5,-0.5, -0.3125,0,-0.25},
{-0.3125,-0.5,-0.5, -0.25,0,-0.125},
{-0.25,-0.5,-0.5, -0.1875,0,0},
{-0.1875,-0.5,-0.5, -0.125,0,0.125},
{-0.125,-0.5,-0.5, -0.0625,0,0.25},
{-0.0625,-0.5,-0.5, 0,0,0.375},
{0,-0.5,-0.375, 0.0625,0,0.5},
{0.0625,-0.5,-0.25, 0.125,0,0.5},
{0.125,-0.5,-0.125, 0.1875,0,0.5},
{0.1875,-0.5,0, 0.25,0,0.5},
{0.25,-0.5,0.125, 0.3125,0,0.5},
{0.3125,-0.5,0.25, 0.375,0,0.5},
{0.375,-0.5,0.375, 0.4375,0,0.5}}},
	selection_box= { type = "fixed", fixed = {
{-0.4375,-0.5,-0.5, -0.375,0,-0.375},
{-0.375,-0.5,-0.5, -0.3125,0,-0.25},
{-0.3125,-0.5,-0.5, -0.25,0,-0.125},
{-0.25,-0.5,-0.5, -0.1875,0,0},
{-0.1875,-0.5,-0.5, -0.125,0,0.125},
{-0.125,-0.5,-0.5, -0.0625,0,0.25},
{-0.0625,-0.5,-0.5, 0,0,0.375},
{0,-0.5,-0.375, 0.0625,0,0.5},
{0.0625,-0.5,-0.25, 0.125,0,0.5},
{0.125,-0.5,-0.125, 0.1875,0,0.5},
{0.1875,-0.5,0, 0.25,0,0.5},
{0.25,-0.5,0.125, 0.3125,0,0.5},
{0.3125,-0.5,0.25, 0.375,0,0.5},
{0.375,-0.5,0.375, 0.4375,0,0.5}}},
	drawtype = "mesh",
	mesh = "sku2_r.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:skub2_r", {
	description = "RightHalf SkewSlab Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.25, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = 'stones:skub2_r',
	collision_box= { type= "fixed", fixed= {
{-0.4375,-0.5,-0.5, -0.375,0,-0.375},
{-0.375,-0.5,-0.5, -0.3125,0,-0.25},
{-0.3125,-0.5,-0.5, -0.25,0,-0.125},
{-0.25,-0.5,-0.5, -0.1875,0,0},
{-0.1875,-0.5,-0.5, -0.125,0,0.125},
{-0.125,-0.5,-0.5, -0.0625,0,0.25},
{-0.0625,-0.5,-0.5, 0,0,0.375},
{0,-0.5,-0.375, 0.0625,0,0.5},
{0.0625,-0.5,-0.25, 0.125,0,0.5},
{0.125,-0.5,-0.125, 0.1875,0,0.5},
{0.1875,-0.5,0, 0.25,0,0.5},
{0.25,-0.5,0.125, 0.3125,0,0.5},
{0.3125,-0.5,0.25, 0.375,0,0.5},
{0.375,-0.5,0.375, 0.4375,0,0.5}}},
	selection_box= { type = "fixed", fixed = {
{-0.4375,-0.5,-0.5, -0.375,0,-0.375},
{-0.375,-0.5,-0.5, -0.3125,0,-0.25},
{-0.3125,-0.5,-0.5, -0.25,0,-0.125},
{-0.25,-0.5,-0.5, -0.1875,0,0},
{-0.1875,-0.5,-0.5, -0.125,0,0.125},
{-0.125,-0.5,-0.5, -0.0625,0,0.25},
{-0.0625,-0.5,-0.5, 0,0,0.375},
{0,-0.5,-0.375, 0.0625,0,0.5},
{0.0625,-0.5,-0.25, 0.125,0,0.5},
{0.125,-0.5,-0.125, 0.1875,0,0.5},
{0.1875,-0.5,0, 0.25,0,0.5},
{0.25,-0.5,0.125, 0.3125,0,0.5},
{0.3125,-0.5,0.25, 0.375,0,0.5},
{0.375,-0.5,0.375, 0.4375,0,0.5}}},
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
	groups = {cvol=0.25, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku2_l',
	collision_box= { type= "fixed", fixed= {
{0.375,-0.5,-0.5, 0.4375,0,-0.375},
{0.3125,-0.5,-0.5, 0.375,0,-0.25},
{0.25,-0.5,-0.5, 0.3125,0,-0.125},
{0.1875,-0.5,-0.5, 0.25,0,0},
{0.125,-0.5,-0.5, 0.1875,0,0.125},
{0.0625,-0.5,-0.5, 0.125,0,0.25},
{0,-0.5,-0.5, 0.0625,0,0.375},
{-0.0625,-0.5,-0.375, 0,0,0.5},
{-0.125,-0.5,-0.25, -0.0625,0,0.5},
{-0.1875,-0.5,-0.125, -0.125,0,0.5},
{-0.25,-0.5,0, -0.1875,0,0.5},
{-0.3125,-0.5,0.125, -0.25,0,0.5},
{-0.375,-0.5,0.25, -0.3125,0,0.5},
{-0.4375,-0.5,0.375, -0.375,0,0.5}}},
	selection_box= { type = "fixed", fixed = {
{0.375,-0.5,-0.5, 0.4375,0,-0.375},
{0.3125,-0.5,-0.5, 0.375,0,-0.25},
{0.25,-0.5,-0.5, 0.3125,0,-0.125},
{0.1875,-0.5,-0.5, 0.25,0,0},
{0.125,-0.5,-0.5, 0.1875,0,0.125},
{0.0625,-0.5,-0.5, 0.125,0,0.25},
{0,-0.5,-0.5, 0.0625,0,0.375},
{-0.0625,-0.5,-0.375, 0,0,0.5},
{-0.125,-0.5,-0.25, -0.0625,0,0.5},
{-0.1875,-0.5,-0.125, -0.125,0,0.5},
{-0.25,-0.5,0, -0.1875,0,0.5},
{-0.3125,-0.5,0.125, -0.25,0,0.5},
{-0.375,-0.5,0.25, -0.3125,0,0.5},
{-0.4375,-0.5,0.375, -0.375,0,0.5}}},
	drawtype = "mesh",
	mesh = "sku2_l.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:skub2_l", {
	description = "LeftHalf SkewSlab Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.25, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = 'stones:skub2_l',
	collision_box= { type= "fixed", fixed= {
{0.375,-0.5,-0.5, 0.4375,0,-0.375},
{0.3125,-0.5,-0.5, 0.375,0,-0.25},
{0.25,-0.5,-0.5, 0.3125,0,-0.125},
{0.1875,-0.5,-0.5, 0.25,0,0},
{0.125,-0.5,-0.5, 0.1875,0,0.125},
{0.0625,-0.5,-0.5, 0.125,0,0.25},
{0,-0.5,-0.5, 0.0625,0,0.375},
{-0.0625,-0.5,-0.375, 0,0,0.5},
{-0.125,-0.5,-0.25, -0.0625,0,0.5},
{-0.1875,-0.5,-0.125, -0.125,0,0.5},
{-0.25,-0.5,0, -0.1875,0,0.5},
{-0.3125,-0.5,0.125, -0.25,0,0.5},
{-0.375,-0.5,0.25, -0.3125,0,0.5},
{-0.4375,-0.5,0.375, -0.375,0,0.5}}},
	selection_box= { type = "fixed", fixed = {
{0.375,-0.5,-0.5, 0.4375,0,-0.375},
{0.3125,-0.5,-0.5, 0.375,0,-0.25},
{0.25,-0.5,-0.5, 0.3125,0,-0.125},
{0.1875,-0.5,-0.5, 0.25,0,0},
{0.125,-0.5,-0.5, 0.1875,0,0.125},
{0.0625,-0.5,-0.5, 0.125,0,0.25},
{0,-0.5,-0.5, 0.0625,0,0.375},
{-0.0625,-0.5,-0.375, 0,0,0.5},
{-0.125,-0.5,-0.25, -0.0625,0,0.5},
{-0.1875,-0.5,-0.125, -0.125,0,0.5},
{-0.25,-0.5,0, -0.1875,0,0.5},
{-0.3125,-0.5,0.125, -0.25,0,0.5},
{-0.375,-0.5,0.25, -0.3125,0,0.5},
{-0.4375,-0.5,0.375, -0.375,0,0.5}}},
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
	groups = {cvol=0.25, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku3_l',
	collision_box= { type= "fixed", fixed= {
{0,0.375,0, 0.4375,0.5,0.4375},
{-0.0625,0.25,-0.0625, 0.375,0.375,0.375},
{-0.125,0.125,-0.125, 0.3125,0.25,0.3125},
{-0.1875,0,-0.1875, 0.25,0.125,0.25},
{-0.25,-0.125,-0.25, 0.1875,0,0.1875},
{-0.3125,-0.25,-0.3125, 0.125,-0.125,0.125},
{-0.375,-0.375,-0.375, 0.0625,-0.25,0.0625},
{-0.4375,-0.5,-0.4375, 0,-0.375,0}}},
selection_box= { type = "fixed", fixed = {
{0,0.375,0, 0.4375,0.5,0.4375},
{-0.0625,0.25,-0.0625, 0.375,0.375,0.375},
{-0.125,0.125,-0.125, 0.3125,0.25,0.3125},
{-0.1875,0,-0.1875, 0.25,0.125,0.25},
{-0.25,-0.125,-0.25, 0.1875,0,0.1875},
{-0.3125,-0.25,-0.3125, 0.125,-0.125,0.125},
{-0.375,-0.375,-0.375, 0.0625,-0.25,0.0625},
{-0.4375,-0.5,-0.4375, 0,-0.375,0}}},
	drawtype = "mesh",
	mesh = "sku3_l.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:skub3_l", {
	description = "R3 SkewSlab Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.25, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = 'stones:skub3_l',
	collision_box= { type= "fixed", fixed= {
{0,0.375,0, 0.4375,0.5,0.4375},
{-0.0625,0.25,-0.0625, 0.375,0.375,0.375},
{-0.125,0.125,-0.125, 0.3125,0.25,0.3125},
{-0.1875,0,-0.1875, 0.25,0.125,0.25},
{-0.25,-0.125,-0.25, 0.1875,0,0.1875},
{-0.3125,-0.25,-0.3125, 0.125,-0.125,0.125},
{-0.375,-0.375,-0.375, 0.0625,-0.25,0.0625},
{-0.4375,-0.5,-0.4375, 0,-0.375,0}}},
selection_box= { type = "fixed", fixed = {
{0,0.375,0, 0.4375,0.5,0.4375},
{-0.0625,0.25,-0.0625, 0.375,0.375,0.375},
{-0.125,0.125,-0.125, 0.3125,0.25,0.3125},
{-0.1875,0,-0.1875, 0.25,0.125,0.25},
{-0.25,-0.125,-0.25, 0.1875,0,0.1875},
{-0.3125,-0.25,-0.3125, 0.125,-0.125,0.125},
{-0.375,-0.375,-0.375, 0.0625,-0.25,0.0625},
{-0.4375,-0.5,-0.4375, 0,-0.375,0}}},
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
	groups = {cvol=0.25, cracky=1, oddly_breakable_by_hand=1},
	drop = 'stones:sku3_r',
	collision_box= { type= "fixed", fixed= {
{-0.4375,0.375,0, 0,0.5,0.4375},
{-0.375,0.25,-0.0625, 0.0625,0.375,0.375},
{-0.3125,0.125,-0.125, 0.125,0.25,0.3125},
{-0.25,0,-0.1875, 0.1875,0.125,0.25},
{-0.1875,-0.125,-0.25, 0.25,0,0.1875},
{-0.125,-0.25,-0.3125, 0.3125,-0.125,0.125},
{-0.0625,-0.375,-0.375, 0.375,-0.25,0.0625},
{0,-0.5,-0.4375, 0.4375,-0.375,0}}},
selection_box= { type = "fixed", fixed = {
{-0.4375,0.375,0, 0,0.5,0.4375},
{-0.375,0.25,-0.0625, 0.0625,0.375,0.375},
{-0.3125,0.125,-0.125, 0.125,0.25,0.3125},
{-0.25,0,-0.1875, 0.1875,0.125,0.25},
{-0.1875,-0.125,-0.25, 0.25,0,0.1875},
{-0.125,-0.25,-0.3125, 0.3125,-0.125,0.125},
{-0.0625,-0.375,-0.375, 0.375,-0.25,0.0625},
{0,-0.5,-0.4375, 0.4375,-0.375,0}}},
	drawtype = "mesh",
	mesh = "sku3_r.obj",
	light_source = 0.005,
	is_ground_content = true,
})

minetest.register_node("stones:skub3_r", {
	description = "R3 SkewSlab Alt Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.25, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = 'stones:skub3_r',
	collision_box= { type= "fixed", fixed= {
{-0.4375,0.375,0, 0,0.5,0.4375},
{-0.375,0.25,-0.0625, 0.0625,0.375,0.375},
{-0.3125,0.125,-0.125, 0.125,0.25,0.3125},
{-0.25,0,-0.1875, 0.1875,0.125,0.25},
{-0.1875,-0.125,-0.25, 0.25,0,0.1875},
{-0.125,-0.25,-0.3125, 0.3125,-0.125,0.125},
{-0.0625,-0.375,-0.375, 0.375,-0.25,0.0625},
{0,-0.5,-0.4375, 0.4375,-0.375,0}}},
selection_box= { type = "fixed", fixed = {
{-0.4375,0.375,0, 0,0.5,0.4375},
{-0.375,0.25,-0.0625, 0.0625,0.375,0.375},
{-0.3125,0.125,-0.125, 0.125,0.25,0.3125},
{-0.25,0,-0.1875, 0.1875,0.125,0.25},
{-0.1875,-0.125,-0.25, 0.25,0,0.1875},
{-0.125,-0.25,-0.3125, 0.3125,-0.125,0.125},
{-0.0625,-0.375,-0.375, 0.375,-0.25,0.0625},
{0,-0.5,-0.4375, 0.4375,-0.375,0}}},
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
	groups = {cvol=0.75, cracky=1, oddly_breakable_by_hand=1},
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

minetest.register_node("stones:diagsterps", {
	description = "Diagonal Steps Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.75, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:diagsterps",
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
	groups = {cvol=0.25, cracky=1, oddly_breakable_by_hand=1},
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

minetest.register_node("stones:diagsterp", {
	description = "Diagonal Step Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	groups = {cvol=0.25, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:diagsterp",
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
{-0.5,-0.4375,0.4688, 0.5,0.5,0.5},
{-0.5,-0.2188,0.4063, 0.5,0.4688,0.4688},
{-0.5,-0.0313,0.3438, 0.5,0.4688,0.4063},
{-0.5,0.0313,0.2813, 0.5,0.4688,0.3438},
{-0.5,0.1813,0.1875, 0.5,0.4688,0.2813},
{-0.5,0.2438,0.125, 0.5,0.4688,0.1875},
{-0.5,0.3063,0, 0.5,0.4688,0.125},
{-0.5,0.3688,-0.0625, 0.5,0.4688,0},
{-0.5,0.4313,-0.25, 0.5,0.4688,-0.0625},
{-0.5,0.4844,-0.5, 0.5,0.5,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0.4688, 0.5,0.5,0.5},
{-0.5,-0.2188,0.4063, 0.5,0.4688,0.4688},
{-0.5,-0.0313,0.3438, 0.5,0.4688,0.4063},
{-0.5,0.0313,0.2813, 0.5,0.4688,0.3438},
{-0.5,0.1813,0.1875, 0.5,0.4688,0.2813},
{-0.5,0.2438,0.125, 0.5,0.4688,0.1875},
{-0.5,0.3063,0, 0.5,0.4688,0.125},
{-0.5,0.3688,-0.0625, 0.5,0.4688,0},
{-0.5,0.4313,-0.25, 0.5,0.4688,-0.0625},
{-0.5,0.4844,-0.5, 0.5,0.5,0.4688}}},
	groups = {cvol=0.383, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arch",
	drawtype = "mesh",
	mesh = "arch.obj"
})

minetest.register_node("stones:aruch", {
	description = "Arch Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0.4688, 0.5,0.5,0.5},
{-0.5,-0.2188,0.4063, 0.5,0.4688,0.4688},
{-0.5,-0.0313,0.3438, 0.5,0.4688,0.4063},
{-0.5,0.0313,0.2813, 0.5,0.4688,0.3438},
{-0.5,0.1813,0.1875, 0.5,0.4688,0.2813},
{-0.5,0.2438,0.125, 0.5,0.4688,0.1875},
{-0.5,0.3063,0, 0.5,0.4688,0.125},
{-0.5,0.3688,-0.0625, 0.5,0.4688,0},
{-0.5,0.4313,-0.25, 0.5,0.4688,-0.0625},
{-0.5,0.4844,-0.5, 0.5,0.5,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0.4688, 0.5,0.5,0.5},
{-0.5,-0.2188,0.4063, 0.5,0.4688,0.4688},
{-0.5,-0.0313,0.3438, 0.5,0.4688,0.4063},
{-0.5,0.0313,0.2813, 0.5,0.4688,0.3438},
{-0.5,0.1813,0.1875, 0.5,0.4688,0.2813},
{-0.5,0.2438,0.125, 0.5,0.4688,0.1875},
{-0.5,0.3063,0, 0.5,0.4688,0.125},
{-0.5,0.3688,-0.0625, 0.5,0.4688,0},
{-0.5,0.4313,-0.25, 0.5,0.4688,-0.0625},
{-0.5,0.4844,-0.5, 0.5,0.5,0.4688}}},
	groups = {cvol=0.383, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:aruch",
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
{0,-0.5,0.4688, 0.5,0.5,0.5},
{0,-0.225,0.4063, 0.5,0.4688,0.4688},
{0,-0.0375,0.3438, 0.5,0.4688,0.4063},
{0,0.025,0.2813, 0.5,0.4688,0.3438},
{0,0.1813,0.1875, 0.5,0.4688,0.2813},
{0,0.2438,0.125, 0.5,0.4688,0.1875},
{0,0.3063,0, 0.5,0.4688,0.125},
{0,0.3625,-0.0625, 0.5,0.4688,0},
{0,0.425,-0.25, 0.5,0.4688,-0.0625},
{0,0.4844,-0.5, 0.5,0.5,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{0,-0.5,0.4688, 0.5,0.5,0.5},
{0,-0.225,0.4063, 0.5,0.4688,0.4688},
{0,-0.0375,0.3438, 0.5,0.4688,0.4063},
{0,0.025,0.2813, 0.5,0.4688,0.3438},
{0,0.1813,0.1875, 0.5,0.4688,0.2813},
{0,0.2438,0.125, 0.5,0.4688,0.1875},
{0,0.3063,0, 0.5,0.4688,0.125},
{0,0.3625,-0.0625, 0.5,0.4688,0},
{0,0.425,-0.25, 0.5,0.4688,-0.0625},
{0,0.4844,-0.5, 0.5,0.5,0.4688}}},
	groups = {cvol=0.191, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arsh"
})

minetest.register_node("stones:arush", {
	description = "Shallow Arch Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arsh.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{0,-0.5,0.4688, 0.5,0.5,0.5},
{0,-0.225,0.4063, 0.5,0.4688,0.4688},
{0,-0.0375,0.3438, 0.5,0.4688,0.4063},
{0,0.025,0.2813, 0.5,0.4688,0.3438},
{0,0.1813,0.1875, 0.5,0.4688,0.2813},
{0,0.2438,0.125, 0.5,0.4688,0.1875},
{0,0.3063,0, 0.5,0.4688,0.125},
{0,0.3625,-0.0625, 0.5,0.4688,0},
{0,0.425,-0.25, 0.5,0.4688,-0.0625},
{0,0.4844,-0.5, 0.5,0.5,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{0,-0.5,0.4688, 0.5,0.5,0.5},
{0,-0.225,0.4063, 0.5,0.4688,0.4688},
{0,-0.0375,0.3438, 0.5,0.4688,0.4063},
{0,0.025,0.2813, 0.5,0.4688,0.3438},
{0,0.1813,0.1875, 0.5,0.4688,0.2813},
{0,0.2438,0.125, 0.5,0.4688,0.1875},
{0,0.3063,0, 0.5,0.4688,0.125},
{0,0.3625,-0.0625, 0.5,0.4688,0},
{0,0.425,-0.25, 0.5,0.4688,-0.0625},
{0,0.4844,-0.5, 0.5,0.5,0.4688}}},
	groups = {cvol=0.191, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:arush"
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
{-0.5,-0.4375,0, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.0187, -0.4063,0.5,0.5},
{-0.4063,-0.0313,-0.05, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.0813, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.1125, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.1594, -0.125,0.5,0.5},
{-0.125,0.3063,-0.2, 0,0.5,0.5},
{0,0.3625,-0.2563, 0.0625,0.5,0.5},
{0.0625,0.4219,-0.3, 0.25,0.5,0.5},
{0.25,0.4844,-0.4063, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.0187, -0.4063,0.5,0.5},
{-0.4063,-0.0313,-0.05, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.0813, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.1125, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.1594, -0.125,0.5,0.5},
{-0.125,0.3063,-0.2, 0,0.5,0.5},
{0,0.3625,-0.2563, 0.0625,0.5,0.5},
{0.0625,0.4219,-0.3, 0.25,0.5,0.5},
{0.25,0.4844,-0.4063, 0.5,0.5,0.5}}},
	groups = {vcol=0.293, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arschol"
})

minetest.register_node("stones:aruschol", {
	description = "Shallow to Arch Left Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arschol.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.0187, -0.4063,0.5,0.5},
{-0.4063,-0.0313,-0.05, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.0813, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.1125, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.1594, -0.125,0.5,0.5},
{-0.125,0.3063,-0.2, 0,0.5,0.5},
{0,0.3625,-0.2563, 0.0625,0.5,0.5},
{0.0625,0.4219,-0.3, 0.25,0.5,0.5},
{0.25,0.4844,-0.4063, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,0, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.0187, -0.4063,0.5,0.5},
{-0.4063,-0.0313,-0.05, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.0813, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.1125, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.1594, -0.125,0.5,0.5},
{-0.125,0.3063,-0.2, 0,0.5,0.5},
{0,0.3625,-0.2563, 0.0625,0.5,0.5},
{0.0625,0.4219,-0.3, 0.25,0.5,0.5},
{0.25,0.4844,-0.4063, 0.5,0.5,0.5}}},
	groups = {vcol=0.293, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:aruschol"
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
{-0.5,-0.4375,-0.5, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.4531, -0.4063,0.5,0.5},
{-0.4063,-0.0375,-0.4219, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.3906, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.3438, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.3125, -0.125,0.5,0.5},
{-0.125,0.3063,-0.25, 0,0.5,0.5},
{0,0.3688,-0.2188, 0.0625,0.5,0.5},
{0.0625,0.425,-0.125, 0.25,0.5,0.5},
{0.25,0.4844,0, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,-0.5, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.4531, -0.4063,0.5,0.5},
{-0.4063,-0.0375,-0.4219, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.3906, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.3438, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.3125, -0.125,0.5,0.5},
{-0.125,0.3063,-0.25, 0,0.5,0.5},
{0,0.3688,-0.2188, 0.0625,0.5,0.5},
{0.0625,0.425,-0.125, 0.25,0.5,0.5},
{0.25,0.4844,0, 0.5,0.5,0.5}}},
	groups = {vcol=0.281, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arcshol"
})

minetest.register_node("stones:arucshol", {
	description = "Arch to Shallow Left Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arcshol.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.4375,-0.5, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.4531, -0.4063,0.5,0.5},
{-0.4063,-0.0375,-0.4219, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.3906, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.3438, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.3125, -0.125,0.5,0.5},
{-0.125,0.3063,-0.25, 0,0.5,0.5},
{0,0.3688,-0.2188, 0.0625,0.5,0.5},
{0.0625,0.425,-0.125, 0.25,0.5,0.5},
{0.25,0.4844,0, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.4375,-0.5, -0.4688,0.5,0.5},
{-0.4688,-0.2188,-0.4531, -0.4063,0.5,0.5},
{-0.4063,-0.0375,-0.4219, -0.3438,0.5,0.5},
{-0.3438,0.025,-0.3906, -0.2813,0.5,0.5},
{-0.2813,0.1813,-0.3438, -0.1875,0.5,0.5},
{-0.1875,0.2438,-0.3125, -0.125,0.5,0.5},
{-0.125,0.3063,-0.25, 0,0.5,0.5},
{0,0.3688,-0.2188, 0.0625,0.5,0.5},
{0.0625,0.425,-0.125, 0.25,0.5,0.5},
{0.25,0.4844,0, 0.5,0.5,0.5}}},
	groups = {vcol=0.281, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:arucshol"
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
{0.4688,-0.4375,0, 0.5,0.5,0.5},
{0.4063,-0.2188,-0.0156, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.0469, 0.4063,0.5,0.5},
{0.2813,0.025,-0.0781, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.1094, 0.2813,0.5,0.5},
{0.125,0.2438,-0.1563, 0.1875,0.5,0.5},
{0,0.3063,-0.1875, 0.125,0.5,0.5},
{-0.0625,0.3625,-0.25, 0,0.5,0.5},
{-0.25,0.425,-0.2813, -0.0625,0.5,0.5},
{-0.5,0.4844,-0.375, -0.25,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{0.4688,-0.4375,0, 0.5,0.5,0.5},
{0.4063,-0.2188,-0.0156, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.0469, 0.4063,0.5,0.5},
{0.2813,0.025,-0.0781, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.1094, 0.2813,0.5,0.5},
{0.125,0.2438,-0.1563, 0.1875,0.5,0.5},
{0,0.3063,-0.1875, 0.125,0.5,0.5},
{-0.0625,0.3625,-0.25, 0,0.5,0.5},
{-0.25,0.425,-0.2813, -0.0625,0.5,0.5},
{-0.5,0.4844,-0.375, -0.25,0.5,0.5}}},
	groups = {vcol=0.293, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arschor"
})

minetest.register_node("stones:aruschor", {
	description = "Shallow to Arch Right Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arschor.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{0.4688,-0.4375,0, 0.5,0.5,0.5},
{0.4063,-0.2188,-0.0156, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.0469, 0.4063,0.5,0.5},
{0.2813,0.025,-0.0781, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.1094, 0.2813,0.5,0.5},
{0.125,0.2438,-0.1563, 0.1875,0.5,0.5},
{0,0.3063,-0.1875, 0.125,0.5,0.5},
{-0.0625,0.3625,-0.25, 0,0.5,0.5},
{-0.25,0.425,-0.2813, -0.0625,0.5,0.5},
{-0.5,0.4844,-0.375, -0.25,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{0.4688,-0.4375,0, 0.5,0.5,0.5},
{0.4063,-0.2188,-0.0156, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.0469, 0.4063,0.5,0.5},
{0.2813,0.025,-0.0781, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.1094, 0.2813,0.5,0.5},
{0.125,0.2438,-0.1563, 0.1875,0.5,0.5},
{0,0.3063,-0.1875, 0.125,0.5,0.5},
{-0.0625,0.3625,-0.25, 0,0.5,0.5},
{-0.25,0.425,-0.2813, -0.0625,0.5,0.5},
{-0.5,0.4844,-0.375, -0.25,0.5,0.5}}},
	groups = {vcol=0.293, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:aruschor"
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
{0.4688,-0.4375,-0.4844, 0.5,0.5,0.5},
{0.4063,-0.225,-0.4531, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.4219, 0.4063,0.5,0.5},
{0.2813,0.025,-0.3906, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.3438, 0.2813,0.5,0.5},
{0.125,0.2438,-0.3125, 0.1875,0.5,0.5},
{0,0.3063,-0.25, 0.125,0.5,0.5},
{-0.0625,0.3688,-0.2188, 0,0.5,0.5},
{-0.25,0.425,-0.125, -0.0625,0.5,0.5},
{-0.5,0.4844,0, -0.25,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{0.4688,-0.4375,-0.4844, 0.5,0.5,0.5},
{0.4063,-0.225,-0.4531, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.4219, 0.4063,0.5,0.5},
{0.2813,0.025,-0.3906, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.3438, 0.2813,0.5,0.5},
{0.125,0.2438,-0.3125, 0.1875,0.5,0.5},
{0,0.3063,-0.25, 0.125,0.5,0.5},
{-0.0625,0.3688,-0.2188, 0,0.5,0.5},
{-0.25,0.425,-0.125, -0.0625,0.5,0.5},
{-0.5,0.4844,0, -0.25,0.5,0.5}}},
	groups = {vcol=0.281, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arcshor"
})

minetest.register_node("stones:arucshor", {
	description = "Arch to Shallow Right Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arcshor.obj",
	climbable = true,
	selection_box = {type = "fixed", fixed = {
{0.4688,-0.4375,-0.4844, 0.5,0.5,0.5},
{0.4063,-0.225,-0.4531, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.4219, 0.4063,0.5,0.5},
{0.2813,0.025,-0.3906, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.3438, 0.2813,0.5,0.5},
{0.125,0.2438,-0.3125, 0.1875,0.5,0.5},
{0,0.3063,-0.25, 0.125,0.5,0.5},
{-0.0625,0.3688,-0.2188, 0,0.5,0.5},
{-0.25,0.425,-0.125, -0.0625,0.5,0.5},
{-0.5,0.4844,0, -0.25,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{0.4688,-0.4375,-0.4844, 0.5,0.5,0.5},
{0.4063,-0.225,-0.4531, 0.4688,0.5,0.5},
{0.3438,-0.0375,-0.4219, 0.4063,0.5,0.5},
{0.2813,0.025,-0.3906, 0.3438,0.5,0.5},
{0.1875,0.1813,-0.3438, 0.2813,0.5,0.5},
{0.125,0.2438,-0.3125, 0.1875,0.5,0.5},
{0,0.3063,-0.25, 0.125,0.5,0.5},
{-0.0625,0.3688,-0.2188, 0,0.5,0.5},
{-0.25,0.425,-0.125, -0.0625,0.5,0.5},
{-0.5,0.4844,0, -0.25,0.5,0.5}}},
	groups = {vcol=0.281, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:arucshor"
})
	
minetest.register_node("stones:arco", {
	description = "Outer Arc",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arco.obj",
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.5,0.4688, -0.4688,-0.2188,0.5},
{-0.5,-0.2188,0.4063, -0.4063,-0.0313,0.5},
{-0.5,-0.0313,0.3438, -0.3438,0.0313,0.5},
{-0.5,0.0313,0.2813, -0.2813,0.1563,0.5},
{-0.5,0.1563,0.2188, -0.2188,0.2188,0.5},
{-0.5,0.2188,0.1563, -0.1563,0.2813,0.5},
{-0.5,0.2813,0.0313, -0.0313,0.3438,0.5},
{-0.5,0.3438,-0.0313, 0.0313,0.4063,0.5},
{-0.5,0.4063,-0.2188, 0.2188,0.4688,0.5},
{-0.5,0.4688,-0.4688, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.5,0.4688, -0.4688,-0.2188,0.5},
{-0.5,-0.2188,0.4063, -0.4063,-0.0313,0.5},
{-0.5,-0.0313,0.3438, -0.3438,0.0313,0.5},
{-0.5,0.0313,0.2813, -0.2813,0.1563,0.5},
{-0.5,0.1563,0.2188, -0.2188,0.2188,0.5},
{-0.5,0.2188,0.1563, -0.1563,0.2813,0.5},
{-0.5,0.2813,0.0313, -0.0313,0.3438,0.5},
{-0.5,0.3438,-0.0313, 0.0313,0.4063,0.5},
{-0.5,0.4063,-0.2188, 0.2188,0.4688,0.5},
{-0.5,0.4688,-0.4688, 0.5,0.5,0.5}}},
	groups = {vcol=0.119, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arco"
})

minetest.register_node("stones:aruco", {
	description = "Outer Arc Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arco.obj",
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.5,0.4688, -0.4688,-0.2188,0.5},
{-0.5,-0.2188,0.4063, -0.4063,-0.0313,0.5},
{-0.5,-0.0313,0.3438, -0.3438,0.0313,0.5},
{-0.5,0.0313,0.2813, -0.2813,0.1563,0.5},
{-0.5,0.1563,0.2188, -0.2188,0.2188,0.5},
{-0.5,0.2188,0.1563, -0.1563,0.2813,0.5},
{-0.5,0.2813,0.0313, -0.0313,0.3438,0.5},
{-0.5,0.3438,-0.0313, 0.0313,0.4063,0.5},
{-0.5,0.4063,-0.2188, 0.2188,0.4688,0.5},
{-0.5,0.4688,-0.4688, 0.5,0.5,0.5}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,-0.5,0.4688, -0.4688,-0.2188,0.5},
{-0.5,-0.2188,0.4063, -0.4063,-0.0313,0.5},
{-0.5,-0.0313,0.3438, -0.3438,0.0313,0.5},
{-0.5,0.0313,0.2813, -0.2813,0.1563,0.5},
{-0.5,0.1563,0.2188, -0.2188,0.2188,0.5},
{-0.5,0.2188,0.1563, -0.1563,0.2813,0.5},
{-0.5,0.2813,0.0313, -0.0313,0.3438,0.5},
{-0.5,0.3438,-0.0313, 0.0313,0.4063,0.5},
{-0.5,0.4063,-0.2188, 0.2188,0.4688,0.5},
{-0.5,0.4688,-0.4688, 0.5,0.5,0.5}}},
	groups = {vcol=0.119, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:aruco"
})

minetest.register_node("stones:arci", {
	description = "Inner Arc",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png"},
	drawtype = "mesh",
	mesh = "arci.obj",
	selection_box = {type = "fixed", fixed = {
{-0.5,0.4688,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5, -0.4688,0.4688,0.5},
{-0.4688,-0.5,0.4688, 0.5,0.4688,0.5},
{-0.4688,-0.2188,-0.5, -0.4063,-0.0313,0.4688},
{-0.4688,-0.0313,-0.5, -0.3438,0.0313,0.4688},
{-0.4688,0.0313,-0.5, -0.2813,0.1563,0.4688},
{-0.4688,0.1563,-0.5, -0.1875,0.2188,0.4688},
{-0.4688,0.2188,-0.5, -0.125,0.2813,0.4688},
{-0.4688,0.2813,-0.5, 0,0.3438,0.4688},
{-0.4688,0.3438,-0.5, 0.0625,0.4063,0.4688},
{-0.4688,0.4063,-0.5, 0.25,0.4688,0.4688},
{-0.4688,-0.2188,0.4063, 0.5,-0.0313,0.4688},
{-0.4688,-0.0313,0.3438, 0.5,0.0313,0.4688},
{-0.4688,0.0313,0.2813, 0.5,0.1563,0.4688},
{-0.4688,0.1563,0.1875, 0.5,0.2188,0.4688},
{-0.4688,0.2188,0.125, 0.5,0.2813,0.4688},
{-0.4688,0.2813,0, 0.5,0.3438,0.4688},
{-0.4688,0.3438,-0.0625, 0.5,0.4063,0.4688},
{-0.4688,0.4063,-0.25, 0.5,0.4688,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,0.4688,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5, -0.4688,0.4688,0.5},
{-0.4688,-0.5,0.4688, 0.5,0.4688,0.5},
{-0.4688,-0.2188,-0.5, -0.4063,-0.0313,0.4688},
{-0.4688,-0.0313,-0.5, -0.3438,0.0313,0.4688},
{-0.4688,0.0313,-0.5, -0.2813,0.1563,0.4688},
{-0.4688,0.1563,-0.5, -0.1875,0.2188,0.4688},
{-0.4688,0.2188,-0.5, -0.125,0.2813,0.4688},
{-0.4688,0.2813,-0.5, 0,0.3438,0.4688},
{-0.4688,0.3438,-0.5, 0.0625,0.4063,0.4688},
{-0.4688,0.4063,-0.5, 0.25,0.4688,0.4688},
{-0.4688,-0.2188,0.4063, 0.5,-0.0313,0.4688},
{-0.4688,-0.0313,0.3438, 0.5,0.0313,0.4688},
{-0.4688,0.0313,0.2813, 0.5,0.1563,0.4688},
{-0.4688,0.1563,0.1875, 0.5,0.2188,0.4688},
{-0.4688,0.2188,0.125, 0.5,0.2813,0.4688},
{-0.4688,0.2813,0, 0.5,0.3438,0.4688},
{-0.4688,0.3438,-0.0625, 0.5,0.4063,0.4688},
{-0.4688,0.4063,-0.25, 0.5,0.4688,0.4688}}},
	groups = {vcol=0.327, cracky=1,oddly_breakable_by_hand=1},
	drop = "stones:arci"
})

minetest.register_node("stones:aruci", {
	description = "Inner Arc Rubble",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rubble.png"},
	drawtype = "mesh",
	mesh = "arci.obj",
	selection_box = {type = "fixed", fixed = {
{-0.5,0.4688,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5, -0.4688,0.4688,0.5},
{-0.4688,-0.5,0.4688, 0.5,0.4688,0.5},
{-0.4688,-0.2188,-0.5, -0.4063,-0.0313,0.4688},
{-0.4688,-0.0313,-0.5, -0.3438,0.0313,0.4688},
{-0.4688,0.0313,-0.5, -0.2813,0.1563,0.4688},
{-0.4688,0.1563,-0.5, -0.1875,0.2188,0.4688},
{-0.4688,0.2188,-0.5, -0.125,0.2813,0.4688},
{-0.4688,0.2813,-0.5, 0,0.3438,0.4688},
{-0.4688,0.3438,-0.5, 0.0625,0.4063,0.4688},
{-0.4688,0.4063,-0.5, 0.25,0.4688,0.4688},
{-0.4688,-0.2188,0.4063, 0.5,-0.0313,0.4688},
{-0.4688,-0.0313,0.3438, 0.5,0.0313,0.4688},
{-0.4688,0.0313,0.2813, 0.5,0.1563,0.4688},
{-0.4688,0.1563,0.1875, 0.5,0.2188,0.4688},
{-0.4688,0.2188,0.125, 0.5,0.2813,0.4688},
{-0.4688,0.2813,0, 0.5,0.3438,0.4688},
{-0.4688,0.3438,-0.0625, 0.5,0.4063,0.4688},
{-0.4688,0.4063,-0.25, 0.5,0.4688,0.4688}}},
	collision_box = {type = "fixed", fixed = {
{-0.5,0.4688,-0.5, 0.5,0.5,0.5},
{-0.5,-0.5,-0.5, -0.4688,0.4688,0.5},
{-0.4688,-0.5,0.4688, 0.5,0.4688,0.5},
{-0.4688,-0.2188,-0.5, -0.4063,-0.0313,0.4688},
{-0.4688,-0.0313,-0.5, -0.3438,0.0313,0.4688},
{-0.4688,0.0313,-0.5, -0.2813,0.1563,0.4688},
{-0.4688,0.1563,-0.5, -0.1875,0.2188,0.4688},
{-0.4688,0.2188,-0.5, -0.125,0.2813,0.4688},
{-0.4688,0.2813,-0.5, 0,0.3438,0.4688},
{-0.4688,0.3438,-0.5, 0.0625,0.4063,0.4688},
{-0.4688,0.4063,-0.5, 0.25,0.4688,0.4688},
{-0.4688,-0.2188,0.4063, 0.5,-0.0313,0.4688},
{-0.4688,-0.0313,0.3438, 0.5,0.0313,0.4688},
{-0.4688,0.0313,0.2813, 0.5,0.1563,0.4688},
{-0.4688,0.1563,0.1875, 0.5,0.2188,0.4688},
{-0.4688,0.2188,0.125, 0.5,0.2813,0.4688},
{-0.4688,0.2813,0, 0.5,0.3438,0.4688},
{-0.4688,0.3438,-0.0625, 0.5,0.4063,0.4688},
{-0.4688,0.4063,-0.25, 0.5,0.4688,0.4688}}},
	groups = {vcol=0.327, cracky=3,oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "stones:aruci"
})




