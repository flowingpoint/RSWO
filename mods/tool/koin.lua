koin = {}

minetest.register_tool("tool:coin", {
	description = "Classic Spinning Koin",
	inventory_image = "inv_coin_0.png",
	on_use = function(itemstack, placer, pointed_thing)
		local dir = placer:get_look_dir();
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x, y=playerpos.y+1.5+dir.y, z=playerpos.z+0+dir.z}, "tool:flip")
              obj:set_sprite({x=0,y=0},4,0.1,true)
		local vec = {x=dir.x*3, y=dir.y*3, z=dir.z*3}
		obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})

minetest.register_node("tool:koin_1", {
	description = "Classic Spinning Coin 1",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=1, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_1",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_2", {
	description = "Classic Spinning Coin 2",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip2_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_2.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=2, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_2",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_3", {
	description = "Classic Spinning Coin 3",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip3_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_3.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=3, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_3",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_4", {
	description = "Classic Spinning Coin 4",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip4_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_4.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=4, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_4",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_5", {
	description = "Classic Spinning Coin 5",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip5_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_5.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=5, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_5",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_6", {
	description = "Classic Spinning Coin 6",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip6_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_6.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=6, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_6",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koin_7", {
	description = "Classic Spinning Coin 7",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "coinstrip7_64x1536.png", animation = {type = "vertical_frames", length = 0.88}}},
	drawtype = "mesh",
	mesh = "koin.obj",
	stack_max = 9999,
	inventory_image = "inv_coin_7.png",
	collision_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	selection_box = {type="fixed",fixed={
{-0.04,-0.45,-0.04, 0.04,0.45,0.04}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {coinvalue=7, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koin_7",
	use_texture_alpha = "clip",
	light_source = 6
})

minetest.register_node("tool:koins", {
	description = "Classic Spinning Coin Stack",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"koin_8.png"},
	drawtype = "mesh",
	mesh = "koins.obj",
	stack_max = 9999,
	inventory_image = "inv_coins.png",
    selection_box = {type = "fixed", fixed = {
{-0.3,-0.5,-0.3, 0.3,0.39,0.3}}},
	collision_box = {type = "fixed", fixed = {
{-0.3,-0.5,-0.3, 0.3,0.39,0.3}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = false,
	walkable = true,
	groups = {coinvalue=8, cracky=3, not_in_creative_inventory=1},
	drop = "tool:koins",
	light_source = 7
})

minetest.register_entity("tool:flip", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"inv_coin_s.png"},
	spritediv = {x = 4, y = 5},
	velocity = 7,
	light_source = 12,
	selection_box = { type = "fixed", fixed = {{-0.2,-0.2,-0.2, 0.2,0.2,0.2}}},
	collision_box = { type = "fixed", fixed = {{-0.2,-0.2,-0.2, 0.2,0.2,0.2}}},
	on_step = function(self, dtime)
    local pos = self.object:getpos()
        if minetest.env:get_node(self.object:getpos()).name ~= "air" then
        self.hit_node(self, pos, node)
	    self.object:remove()
	    return				
        end 
    end,
    hit_node = function(self, pos, node)
	minetest.sound_play({name="koin", gain=0.03}, {pos=selfpos}, true)
    local p = {x=pos.x, y=pos.y+1, z=pos.z}
    local q = {x=pos.x, y=pos.y, z=pos.z}
    s = minetest.env:get_node(self.object:getpos())
        if s.name ~= "air" then 
            if s.name ~= "tool:koin_1" and s.name ~= "tool:koin_2" and s.name ~= "tool:koin_3" and s.name ~= "tool:koin_4" and s.name ~= "tool:koin_5" and s.name ~= "tool:koin_6" and s.name ~= "tool:koin_7" then
  	minetest.env:set_node(p, {name="tool:koin_1", param2=math.random(0,23)}) 
            end
        end
        if s.name == "tool:koin_1"	then 
    minetest.env:set_node(q, {name="tool:koin_2", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_2"	then 
    minetest.env:set_node(q, {name="tool:koin_3", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_3"	then 
    minetest.env:set_node(q, {name="tool:koin_4", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_4"	then 
    minetest.env:set_node(q, {name="tool:koin_5", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_5"	then 
    minetest.env:set_node(q, {name="tool:koin_6", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_6"	then 
    minetest.env:set_node(q, {name="tool:koin_7", param2=math.random(0,23)}) 
        end
        if s.name == "tool:koin_7"	then 
    minetest.env:set_node(q, {name="tool:koins", param2=0}) 
        end
    end
})

---
--tesseract

minetest.register_node("tool:tess", {
	description = "Classic Tesseract",
	paramtype = "light",
	paramtype2 = "facedir",
    tiles = {{name = "tess32x384.png", animation = {type = "vertical_frames", length = 1}}},
	drawtype = "mesh",
	mesh = "tess.obj",
	inventory_image = "tess.png",
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
	visual_scale = 1,
	pointable = true,
	sunlight_propagates = true,
	walkable = false,
	groups = {cracky=3, not_in_creative_inventory=1},
	drop = "tool:tess",
	use_texture_alpha = "clip",
	light_source = 14
})
