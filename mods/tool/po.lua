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
end end,
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
        if s.name == "stones:brush"	then 
		p2brush = s.param2
		minetest.env:set_node(p, {name="stones:blush", param2=p2brush}) end
        if s.name == "stones:blush"	then 
		p2lbrush = (s.param2+math.random(1,4))%4
		minetest.env:set_node(p, {name="stones:brush", param2=p2lbrush}) end
        if s.name == "stones:brushrock_0"	then 
		p2b0 = (s.param2+1)%4
		minetest.env:set_node(p, {name="stones:blushrock_0", param2=p2b0}) end
        if s.name == "stones:blushrock_0"	then 
		p2lb0 = (s.param2-1)%4
		minetest.env:set_node(p, {name="stones:brushrock_0", param2=p2lb0}) end
        if s.name == "stones:brushrock_1"	then 
		p2b1 = (s.param2+1)%4
		minetest.env:set_node(p, {name="stones:blushrock_1", param2=p2b1}) end
        if s.name == "stones:blushrock_1"	then 
		p2lb1 = (s.param2-1)%4
		minetest.env:set_node(p, {name="stones:brushrock_1", param2=p2lb1}) end
        if s.name == "stones:brushrock_11"	then 
		p2b11 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_11", param2=p2b11}) end
        if s.name == "stones:blushrock_11"	then 
		p2lb11 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_11", param2=p2lb11}) end
        if s.name == "stones:brushrock_2"	then 
		p2b2 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_2", param2=p2b2}) end
        if s.name == "stones:blushrock_2"	then 
		p2lb2 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_2", param2=p2lb2}) end
        if s.name == "stones:brushrock_5"	then 
		p2b5 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_5", param2=p2b5}) end
        if s.name == "stones:blushrock_5"	then 
		p2lb5 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_5", param2=p2lb5}) end
        if s.name == "stones:brushrock_8"	then 
		p2b8 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_8", param2=p2b8}) end
        if s.name == "stones:blushrock_8"	then 
		p2lb8 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_8", param2=p2lb8}) end
        if s.name == "stones:brushrock_c"	then 
		p2bc = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_c", param2=p2bc}) end
        if s.name == "stones:blushrock_c"	then 
		p2lbc = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_c", param2=p2lbc}) end
        if s.name == "stones:brushrock_21"	then 
		p2b21 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_21", param2=p2b21}) end
        if s.name == "stones:blushrock_21"	then 
		p2lb21 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_21", param2=p2lb21}) end
        if s.name == "stones:brushrock_3"	then 
		p2b3 = (s.param2+1)%4
		minetest.env:set_node(p, {name="stones:blushrock_3", param2=p2b3}) end
        if s.name == "stones:blushrock_3"	then 
		p2lb3 = (s.param2-1)%4
		minetest.env:set_node(p, {name="stones:brushrock_3", param2=p2lb3}) end
        if s.name == "stones:brushrock_4"	then 
		p2b4 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_4", param2=p2b4}) end
        if s.name == "stones:blushrock_4"	then 
		p2lb4 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_4", param2=p2lb4}) end
        if s.name == "stones:brushrock_28"	then 
		p2b28 = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_28", param2=p2b28}) end
        if s.name == "stones:blushrock_28"	then 
		p2lb28 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_28", param2=p2lb28}) end
        if s.name == "stones:brushrock_2u"	then 
		p2b2u = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_2u", param2=p2b2u}) end
        if s.name == "stones:blushrock_2u"	then 
		p2lb2u = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_2u", param2=p2lb2u}) end
        if s.name == "stones:brushrock_52ul"	then 
		p2b52ul = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_52ul", param2=p2b52ul}) end
        if s.name == "stones:blushrock_52ul"	then 
		p2lb52ul = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_52ul", param2=p2lb52ul}) end
        if s.name == "stones:brushrock_52ur"	then 
		p2b52ur = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_52ur", param2=p2b52ur}) end
        if s.name == "stones:blushrock_52ur"	then 
		p2lb52ur = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_52ur", param2=p2lb52ur}) end
        if s.name == "stones:brushrock_527l"	then 
		p2b527l = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_527l", param2=p2b527l}) end
        if s.name == "stones:blushrock_527l"	then 
		p2lb527l = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_527l", param2=p2lb527l}) end
        if s.name == "stones:brushrock_527r"	then 
		p2b527r = s.param2
		minetest.env:set_node(p, {name="stones:blushrock_527r", param2=p2b527r}) end
        if s.name == "stones:blushrock_527r"	then 
		p2lb527r = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_527r", param2=p2lb527r}) end
        if s.name == "stones:rush"	then 
		p2r = s.param2
		minetest.env:set_node(p, {name="stones:brush", param2=p2r}) end
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
end end

end end
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
