minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")

minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

minetest.register_biome({
	name = "default:grassland",
	--node_dust = "",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 1,
	--node_stone = "",
	--node_water_top = "",
	--depth_water_top = ,
	--node_water = "",
	y_min = 5,
	y_max = 31000,
	heat_point = 50,
	humidity_point = 50,
})
