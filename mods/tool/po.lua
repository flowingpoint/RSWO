tool = {}

minetest.register_entity("tool:pow", {
	visual = "sprite",
	visual_size = {x=0.2, y=0.2},
	textures = {"bubble.png"},
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
		for dx=-0,0 do
		for dy=-0,0 do
		for dz=-0,0 do
		local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
		s = minetest.env:get_node(self.object:getpos())
		if s.name == "runes:hui"	then 
		p2h = s.param2
		minetest.env:set_node(p, {name="runes:lit_hui", param2=p2h}) end
		if s.name == "runes:lit_hui"	then 
		p2lh = s.param2
		minetest.env:set_node(p, {name="runes:hui", param2=p2lh}) end
		if s.name == "runes:bu"	then 
		p2b = s.param2
		minetest.env:set_node(p, {name="runes:lit_bu", param2=p2b}) end
		if s.name == "runes:lit_bu"	then 
		p2lb = s.param2
		minetest.env:set_node(p, {name="runes:bu", param2=p2lb}) end
		if s.name == "runes:ke"	then 
		p2k = s.param2
		minetest.env:set_node(p, {name="runes:lit_ke", param2=p2k}) end
		if s.name == "runes:lit_ke"	then 
		p2lk = s.param2
		minetest.env:set_node(p, {name="runes:ke", param2=p2lk}) end
	minetest.add_particlespawner({
		amount = 100,
		time = 3,
		glow = 10,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {min={x=pos.x-1, y=pos.y-1, z=pos.z-1}, max={x=pos.x+1, y=pos.y+1, z=pos.z+1}, bias=0},
		minvel = {x=-1, y=-1, z=-1},
		maxvel = {x=1, y=3, z=1},
		exptime = {min=3, max=7},
		collisiondetection = false,
		collision_removal = false,
		texpool = {
			{name = 'yellow.png', blend='alpha', scale_tween={{x=1,y=1},{x=2,y=2}}}, {name = 'yellow.png', blend = 'alpha', scale_tween = {{x=0.5,y=0.5},{x=1,y=1}}}, {name = 'yellow.png', blend = 'alpha', scale_tween = {{x=0.25,y=0.25},{x=0.5,y=0.5}}}, {name = 'yellow.png', blend = 'alpha', scale_tween = {{x=0.125,y=0.125},{x=0.25,y=0.25}}}}
		})
end end end end
})


minetest.register_tool("tool:pok", {
	description = "Popper",
	inventory_image = "smokestaff.png",
	on_use = function(itemstack, placer, pointed_thing)
		local dir = placer:get_look_dir();
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x, y=playerpos.y+1.5+dir.y, z=playerpos.z+0+dir.z}, "tool:pow")
		local vec = {x=dir.x*3, y=dir.y*3, z=dir.z*3}
		obj:setvelocity(vec)
		return itemstack
	end,
	light_source = 12,
})