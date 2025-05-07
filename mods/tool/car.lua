tool = {}

minetest.register_node("tool:car",{
	description = "Car",
	inventory_image = "car.png",
	drawtype = "mesh",
    mesh = "car.obj",
	visual_scale = 1,
	tiles = {"peck.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, not_in_creative_inventory=1},
	drop = 'tool:car',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.89,-0.2,-2,0.89,0.46,2.1},
{-0.66,0.48,-1.2,0.66,1,0.2},
{-0.88,-0.18,2.1,0.88,0.1,2.25}}},
    collision_box = {type = "fixed", fixed = {
{-0.89,-0.2,-2,0.89,0.46,2.1},
{-0.66,0.48,-1.2,0.66,1,0.2},
{-0.88,-0.18,2.1,0.88,0.1,2.25}}}
})

minetest.register_node("tool:cardiag",{
	description = "Car diag",
	inventory_image = "car.png",
	drawtype = "mesh",
    mesh = "cardiag.obj",
	visual_scale = 1,
	tiles = {"peck.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, not_in_creative_inventory=1},
	drop = 'tool:cardiag',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.5,-0.5,-0.5,0.5,0.5,0.5}}},
    collision_box = {type = "fixed", fixed = {
{-0.5,-0.5,-0.5,0.5,0.5,0.5}}}
})

minetest.register_node("tool:car_1",{
	description = "Car 1",
	inventory_image = "ElCamino.png",
	drawtype = "mesh",
    mesh = "car_1.obj",
	visual_scale = 1,
	tiles = {"peck.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, not_in_creative_inventory=1},
	drop = 'tool:car_1',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.84,-0.1,-2.75,0.84,0.25,2.4},
{-0.66,0.48,-0.5,0.66,0.85,0.2}}},
    collision_box = {type = "fixed", fixed = {
{-0.84,-0.1,-2.75,0.84,0.25,2.4},
{-0.66,0.48,-0.5,0.66,0.85,0.2}}}
})

minetest.register_node("tool:car_2",{
	description = "Car 2",
	inventory_image = "Luxery.png",
	drawtype = "mesh",
    mesh = "car_2.obj",
	visual_scale = 1,
	tiles = {"peck.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, not_in_creative_inventory=1},
	drop = 'tool:car_2',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.80,-0.16,-2.25,0.80,0.28,2.23},
{-0.61,0.46,-1.1,0.61,0.78,0.32}}},
    collision_box = {type = "fixed", fixed = {
{-0.80,-0.15,-2.25,0.80,0.28,2.23},
{-0.61,0.46,-1.1,0.61,0.78,0.32}}}
})




