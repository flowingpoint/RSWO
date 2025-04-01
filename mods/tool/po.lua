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
        if s.name == "stones:s_2216"	then 
		p2s0 = s.param2
		minetest.env:set_node(p, {name="runes:sl1", param2=p2s0}) end
        if s.name == "runes:sl1"	then 
		p2s1 = s.param2
		minetest.env:set_node(p, {name="runes:sl2", param2=p2s1}) end
        if s.name == "runes:sl2"	then 
		p2s2 = s.param2
		minetest.env:set_node(p, {name="runes:sl3", param2=p2s2}) end
        if s.name == "runes:sl3"	then 
		p2s3 = s.param2
		minetest.env:set_node(p, {name="runes:sl4", param2=p2s3}) end
        if s.name == "runes:sl4"	then 
		p2s4 = s.param2
		minetest.env:set_node(p, {name="stones:s_2216", param2=p2s4}) end
        if s.name == "tool:ladder"	then 
		p2la = s.param2
		minetest.env:set_node(p, {name="tool:lid", param2=p2la}) end
        if s.name == "tool:lid"	then 
		p2li = s.param2
		minetest.env:set_node(p, {name="tool:ladder", param2=p2li}) end
        if s.name == "stones:isokar"	then 
		p2isoka = s.param2
		minetest.env:set_node(p, {name="stones:isodark", param2=pisoka}) end
        if s.name == "stones:isodark"	then 
		minetest.sound_play({name="whoosh", gain=0.05}, {pos=selfpos}, true)
		p2isokb = s.param2
		minetest.env:set_node(p, {name="stones:isokar", param2=p2isokb})
		minetest.add_particlespawner({
		amount = 1,
		time = 1,
		glow = 14,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {x=pos.x, y=pos.y, z=pos.z},
		minvel = {x=0, y=0, z=0},
		maxvel = {x=0, y=0, z=0},
		minacc = {x=0, y=0, z=0},
		maxacc = {x=0, y=0, z=0},
		exptime = {min=2, max=2},
		collisiondetection = true,
		collision_removal = false,
		texpool = {{name = "burst16x16x10.png", animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.1}, blend='alpha', scale_tween={{x=20,y=20}}}}}) end
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
        if s.name == "stones:r_2"	then 
		p2r2 = s.param2
		minetest.env:set_node(p, {name="stones:brush_2", param2=p2r2}) end
        if s.name == "stones:rushrock_1"	then 
		p2br1 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_1", param2=p2br1}) end
        if s.name == "stones:rushrock_0"	then 
		p2br0 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_0", param2=p2br0}) end
        if s.name == "stones:rushrock_11"	then 
		p2br11 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_11", param2=p2br11}) end
        if s.name == "stones:rushrock_2"	then 
		p2br2 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_2", param2=p2br2}) end
        if s.name == "stones:rushrock_21"	then 
		p2br21 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_21", param2=p2br21}) end
        if s.name == "stones:rushrock_4"	then 
		p2br4 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_4", param2=p2br4}) end
        if s.name == "stones:rushrock_5"	then 
		p2br5 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_5", param2=p2br5}) end
        if s.name == "stones:rushrock_527l"	then 
		p2br527l = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_527l", param2=p2br527l}) end
        if s.name == "stones:rushrock_527r"	then 
		p2br527r = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_527r", param2=p2br527r}) end
        if s.name == "stones:rushrock_28"	then 
		p2br28 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_28", param2=p2br28}) end
        if s.name == "stones:rushrock_2u"	then 
		p2br2u = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_2u", param2=p2br2u}) end
        if s.name == "stones:rushrock_3"	then 
		p2br3 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_3", param2=p2br3}) end
        if s.name == "stones:rushrock_52ul"	then 
		p2br52ul = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_52ul", param2=p2br52ul}) end
        if s.name == "stones:rushrock_52ur"	then 
		p2br52ur = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_52ur", param2=p2br52ur}) end
        if s.name == "stones:rushrock_8"	then 
		p2br8 = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_8", param2=p2br8}) end
        if s.name == "stones:rushrock_c"	then 
		p2brc = s.param2
		minetest.env:set_node(p, {name="stones:brushrock_c", param2=p2brc}) end
        if s.name == "stones:cis" then
            if s.param2 == 2 or s.param2 == 4 or s.param2 == 10 or s.param2 == 13 or s.param2 == 19 or s.param2 == 22 then 
            p2bd1 = math.floor(s.param2/4)*4+(s.param2%4+2)%4
		    minetest.env:set_node(p, {name="runes:nbdx1", param2=p2bd1}) 
            else if s.param2 == 3 or s.param2 == 5 or s.param2 == 11 or s.param2 == 14 or s.param2 == 16 or s.param2 == 23 then 
            p2bd2 = math.floor(s.param2/4)*4+(s.param2%4+1)%4
		    minetest.env:set_node(p, {name="runes:nbdx2", param2=p2bd2}) 
            else if s.param2 == 0 or s.param2 == 6 or s.param2 == 8 or s.param2 == 15 or s.param2 == 17 or s.param2 == 20 then 
            p2bd3 = s.param2
	    	minetest.env:set_node(p, {name="runes:nbdx3", param2=p2bd3}) 
            else if s.param2 == 1 or s.param2 == 7 or s.param2 == 9 or s.param2 == 12 or s.param2 == 18 or s.param2 == 21 then 
            p2bd4 = math.floor(s.param2/4)*4+(s.param2%4-1)%4
	    	minetest.env:set_node(p, {name="runes:nbdx4", param2=p2bd4}) end end end end     
        end
        if s.name == "runes:0ur"	then 
		p20ura = s.param2
		minetest.env:set_node(p, {name="runes:0rd", param2=p20ura}) end
        if s.name == "runes:0rd"	then 
		p20urb = s.param2
		minetest.env:set_node(p, {name="runes:0ur", param2=p20urb}) end
        if s.name == "runes:0br"	then 
		p20bra = s.param2
		minetest.env:set_node(p, {name="runes:0be", param2=p20bra}) end
        if s.name == "runes:0be"	then 
		p20brb = s.param2
		minetest.env:set_node(p, {name="runes:0br", param2=p20brb}) end
        if s.name == "runes:0bl"	then 
		p20bla = s.param2
		minetest.env:set_node(p, {name="runes:0gn", param2=p20bla}) end
        if s.name == "runes:0gn"	then 
		p20blb = s.param2
		minetest.env:set_node(p, {name="runes:0bl", param2=p20blb}) end
        if s.name == "runes:0ul"	then 
		p20ula = s.param2
		minetest.env:set_node(p, {name="runes:0bk", param2=p20ula}) end
        if s.name == "runes:0bk"	then 
		p20ulb = s.param2
		minetest.env:set_node(p, {name="runes:0ul", param2=p20ulb}) end
minetest.add_particlespawner({
		amount = 50,
		time = 30,
		glow = 10,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {min={x=pos.x-20, y=pos.y+7, z=pos.z-20}, max={x=pos.x+20, y=pos.y+10, z=pos.z+20}, bias=math.random(0,1)},
		minvel = {x=0.2, y=-3, z=0.2},
		maxvel = {x=2, y=-2, z=2},
		exptime = {min=7.5, max=15},
		collisiondetection = true,
		collision_removal = true,
		bounce = {min = 0.6, max = 0.9, bias = 0},
		texpool = {
			{name = 'rg1.png', blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg2.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg3.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg4.png', blend = 'alpha', scale_tween = {{x=0.125,y=0.125},{x=0.25,y=0.25}}}, {name = 'rg5.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg6.png', blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg7.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg8.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg9.png', blend = 'alpha', scale_tween = {{x=0.125,y=0.125},{x=0.25,y=0.25}}}, {name = 'rg10.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg11.png', blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg12.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg13.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg14.png', blend = 'alpha', scale_tween = {{x=0.125,y=0.125},{x=0.25,y=0.25}}}, {name = 'rg15.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg16.png', blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg17.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg18.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}, {name = 'rg19.png', blend = 'alpha', scale_tween = {{x=0.125,y=0.125},{x=0.25,y=0.25}}}, {name = 'rg20.png', blend = 'alpha', scale_tween = {{x=(math.random(10,20)/20),y=(math.random(10,20)/20)},{x=(math.random(20,30)/20),y=(math.random(20,30)/20)}}}}
		})
end end
end end
})

minetest.register_entity("tool:pew", {
	visual = "sprite",
	visual_size = {x=0.25, y=0.25},
	textures = {"star.png"},
---	spritediv = {x = 4, y = 5},
	velocity = 7,
	time = 2,
	exptime = {min=0.5, max=1.5},
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
minetest.add_particlespawner({
		amount = 10+math.random(1,10),
		time = 5+math.random(1,10),
		glow = 14,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=0.2+math.sin(pos.x), y=0.2+math.sin(pos.x), z=0.2+math.cos(pos.x)},
		maxvel = {x=2+math.sin(pos.x), y=1+math.sin(pos.x), z=2+math.cos(pos.x)},
		minacc = {x=-0.2+math.sin(pos.x), y=-0.8+math.sin(pos.x), z=-0.2+math.cos(pos.x)},
		maxacc = {x=0.8+math.cos(pos.x), y=0.2+math.sin(pos.x), z=0.8-math.sin(pos.x)},
		exptime = {min=3, max=7},
		collisiondetection = true,
		bounce = {min = 0.4, max = 0.7, bias = 0},
		collision_removal = false,
		texpool = {
			{name = "glyph20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)}}}}
		})
end end
end end
})

--rublerstaff emits 'row' which if contacts player becomes 'pew', a ricochet, which on contact with anything again emits numerous animated glyphs, while popperstaff causes sparse glyphsnow.

minetest.register_entity("tool:row", {
	visual = "sprite",
	visual_size = {x=0.2, y=0.2},
	textures = {"rushout.png"},
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
			for _,player in pairs(minetest.env:get_objects_inside_radius(pos, 1)) do
				if player:is_player() then
					self.hit_player(self, player)
					self.object:remove()
					return
				end
			end
		 end,
	hit_player = function(self, player)
		local s = player:getpos()
		local p = player:get_look_dir()
		local vec = {x=s.x-p.x, y=s.y-p.y, z=s.z-p.z}
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=2},
		}, vec)
		local pos = player:getpos()
		for dx=-0,0 do
			for dy=-0,0 do
				for dz=-0,0 do
					local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
					local n = minetest.env:get_node(pos).name
					if math.random(1, 100) <= 97 then
	local vel = {x=math.sin(self.object:getpos().x), y=2+math.cos(2*self.object:getpos().x),z=math.sin(self.object:getpos().x)}
	local acc = {x=0,y=-2,z=0}
	if vector.distance(player:getpos(),self.object:getpos()) < 4 then
		local obj1 = minetest.env:add_entity({x=self.object:getpos().x, y=self.object:getpos().y, z=self.object:getpos().z}, "tool:pew")
		obj1:setvelocity(vel)
		obj1:setacceleration(acc)
		return
		end
	minetest.register_abm({
  		nodenames = {"tool:pew"},
   		interval = 2,
  		chance = 3,
  		action = function(pos, node)
   		minetest.env:remove_node(pos)
  		end,
	})
	else
		return
	end
					end
				end
			end
		end,
	lose_player = function(self, player)
		local s = player:getpos()
		local q = self.object:getpos()
		local dist = {x=s.x-q.x, y=s.y-q.y, z=s.z-q.z}
		if vector.abs(dist) > 5 then
			self.object:remove()
			return
		end
	end,
	hit_node = function(self, pos, node)
		for dx=-0,0 do
		for dy=-0,0 do
		for dz=-0,0 do
		local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
		local q = {x=pos.x+0.5*math.random(-1,1), y=pos.y+0.1, z=pos.z+0.5*math.random(-1,1)}
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
        if s.name == "stones:s_2216"	then 
		p2s0 = s.param2
		minetest.env:set_node(p, {name="runes:sl4", param2=p2s0}) end
        if s.name == "runes:sl4"	then 
		p2s4 = s.param2
		minetest.env:set_node(p, {name="runes:sl3", param2=p2s4}) end
        if s.name == "runes:sl3"	then 
		p2s3 = s.param2
		minetest.env:set_node(p, {name="runes:sl2", param2=p2s3}) end
        if s.name == "runes:sl2"	then 
		p2s2 = s.param2
		minetest.env:set_node(p, {name="runes:sl1", param2=p2s2}) end
        if s.name == "runes:sl1"	then 
		p2s1 = s.param2
		minetest.env:set_node(p, {name="stones:s_2216", param2=p2s1}) end
        if s.name == "tool:ladder"	then 
		p2la = s.param2
		minetest.env:set_node(p, {name="tool:lid", param2=p2la}) end
        if s.name == "tool:lid"	then 
		p2li = s.param2
		minetest.env:set_node(p, {name="tool:ladder", param2=p2li}) end
        if s.name == "stones:isokar"	then 
		p2isoka = s.param2
		minetest.env:set_node(p, {name="stones:isodark", param2=pisoka}) end
        if s.name == "stones:isodark"	then 
		minetest.sound_play({name="whoosh", gain=0.05}, {pos=selfpos}, true)
		p2isokb = s.param2
		minetest.env:set_node(p, {name="stones:isokar", param2=p2isokb})
		minetest.add_particlespawner({
		amount = 1,
		time = 1,
		glow = 14,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {x=pos.x, y=pos.y, z=pos.z},
		minvel = {x=0, y=0, z=0},
		maxvel = {x=0, y=0, z=0},
		minacc = {x=0, y=0, z=0},
		maxacc = {x=0, y=0, z=0},
		exptime = {min=2, max=2},
		collisiondetection = true,
		collision_removal = false,
		texpool = {{name = "burst16x16x10.png", animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.1}, blend='alpha', scale_tween={{x=20,y=20}}}}}) end
        if s.name == "stones:brush"	then 
		p2br = s.param2
		minetest.env:set_node(p, {name="stones:rush", param2=p2br}) end
        if s.name == "stones:brush_2"	then 
		p2br2 = s.param2
		minetest.env:set_node(p, {name="stones:r_2", param2=p2br2}) end
        if s.name == "stones:brushrock_1"	then 
		p2br1 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_1", param2=p2br1}) end
        if s.name == "stones:brushrock_0"	then 
		p2br0 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_0", param2=p2br0}) end
        if s.name == "stones:brushrock_11"	then 
		p2br11 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_11", param2=p2br11}) end
        if s.name == "stones:brushrock_2"	then 
		p2br2 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_2", param2=p2br2}) end
        if s.name == "stones:brushrock_21"	then 
		p2br21 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_21", param2=p2br21}) end
        if s.name == "stones:brushrock_4"	then 
		p2br4 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_4", param2=p2br4}) end
        if s.name == "stones:brushrock_5"	then 
		p2br5 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_5", param2=p2br5}) end
        if s.name == "stones:brushrock_527l"	then 
		p2br527l = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_527l", param2=p2br527l}) end
        if s.name == "stones:brushrock_527r"	then 
		p2br527r = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_527r", param2=p2br527r}) end
        if s.name == "stones:brushrock_28"	then 
		p2br28 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_28", param2=p2br28}) end
        if s.name == "stones:brushrock_2u"	then 
		p2br2u = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_2u", param2=p2br2u}) end
        if s.name == "stones:brushrock_3"	then 
		p2br3 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_3", param2=p2br3}) end
        if s.name == "stones:brushrock_52ul"	then 
		p2br52ul = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_52ul", param2=p2br52ul}) end
        if s.name == "stones:brushrock_52ur"	then 
		p2br52ur = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_52ur", param2=p2br52ur}) end
        if s.name == "stones:brushrock_8"	then 
		p2br8 = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_8", param2=p2br8}) end
        if s.name == "stones:brushrock_c"	then 
		p2brc = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_c", param2=p2brc}) end
        if s.name == "stones:s_2"	then 
		p2rb2a = s.param2
		minetest.env:set_node(p, {name="stones:rubble_2", param2=p2rb2a}) end
        if s.name == "stones:rubble_2"	then 
		p2rb2b = s.param2
		minetest.env:set_node(p, {name="stones:s_2", param2=p2rb2b}) end
        if s.name == "stones:rock"	then 
		p2rka = s.param2
		minetest.env:set_node(p, {name="stones:rubble", param2=p2rka}) end
        if s.name == "stones:rubble"	then 
		p2rkb = s.param2
		minetest.env:set_node(p, {name="stones:rock", param2=p2rkb}) end
        if s.name == "stones:roch"	then 
		p2rha = s.param2
		minetest.env:set_node(p, {name="stones:ruvl", param2=p2rha}) end
        if s.name == "stones:ruvl"	then 
		p2rhb = s.param2
		minetest.env:set_node(p, {name="stones:roch", param2=p2rhb}) end
        if s.name == "stones:cis"	then 
		p2ca = s.param2
		minetest.env:set_node(p, {name="stones:cris", param2=p2ca}) end
        if s.name == "stones:cris"	then 
		p2cb = s.param2
		minetest.env:set_node(p, {name="stones:cis", param2=p2cb}) end
        if s.name == "stones:cish"	then 
		p2cha = s.param2
		minetest.env:set_node(p, {name="stones:crish", param2=p2cha}) end
        if s.name == "stones:crish"	then 
		p2chb = s.param2
		minetest.env:set_node(p, {name="stones:cish", param2=p2chb}) end
        if s.name == "stones:hex"	then 
		p2hxa = s.param2
		minetest.env:set_node(p, {name="stones:hrex", param2=p2hxa}) end
        if s.name == "stones:hrex"	then 
		p2hxb = s.param2
		minetest.env:set_node(p, {name="stones:hex", param2=p2hxb}) end
        if s.name == "stones:hexp"	then 
		p2hxpa = s.param2
		minetest.env:set_node(p, {name="stones:hrexp", param2=p2hxpa}) end
        if s.name == "stones:hrexp"	then 
		p2hxpb = s.param2
		minetest.env:set_node(p, {name="stones:hexp", param2=p2hxpb}) end
        if s.name == "stones:hexar"	then 
		p2hxra = s.param2
		minetest.env:set_node(p, {name="stones:hrexar", param2=p2hxra}) end
        if s.name == "stones:hrexar"	then 
		p2hxrb = s.param2
		minetest.env:set_node(p, {name="stones:hexar", param2=p2hxrb}) end
        if s.name == "stones:diagstep"	then 
		p2dsa = s.param2
		minetest.env:set_node(p, {name="stones:diagsterp", param2=p2dsa}) end
        if s.name == "stones:diagsterp"	then 
		p2dsb = s.param2
		minetest.env:set_node(p, {name="stones:diagstep", param2=p2dsb}) end
        if s.name == "stones:diagsteps"	then 
		p2dssa = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps", param2=p2dssa}) end
        if s.name == "stones:diagsterps"	then 
		p2dssb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps", param2=p2dssb}) end
        if s.name == "stones:rushrock_1"	then 
		p2rb1a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_1", param2=p2rb1a}) end
        if s.name == "stones:rublish_1"	then 
		p2rb1b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_1", param2=p2rb1b}) end
        if s.name == "runes:nbdx1"	then 
		p2nx1a = s.param2
		minetest.env:set_node(p, {name="runes:rbdx1", param2=p2nx1a}) end
        if s.name == "runes:rbdx1"	then 
		p2nx1b = s.param2
		minetest.env:set_node(p, {name="runes:nbdx1", param2=p2nx1b}) end
        if s.name == "runes:nbdx2"	then 
		p2nx2a = s.param2
		minetest.env:set_node(p, {name="runes:rbdx2", param2=p2nx2a}) end
        if s.name == "runes:rbdx2"	then 
		p2nx2b = s.param2
		minetest.env:set_node(p, {name="runes:nbdx2", param2=p2nx2b}) end
        if s.name == "runes:nbdx3"	then 
		p2nx3a = s.param2
		minetest.env:set_node(p, {name="runes:rbdx3", param2=p2nx3a}) end
        if s.name == "runes:rbdx3"	then 
		p2nx3b = s.param2
		minetest.env:set_node(p, {name="runes:nbdx3", param2=p2nx3b}) end
        if s.name == "runes:nbdx4"	then 
		p2nx4a = s.param2
		minetest.env:set_node(p, {name="runes:rbdx4", param2=p2nx4a}) end
        if s.name == "runes:rbdx4"	then 
		p2nx4b = s.param2
		minetest.env:set_node(p, {name="runes:nbdx4", param2=p2nx4b}) end
        if s.name == "stones:arch"	then 
		p2archa = s.param2
		minetest.env:set_node(p, {name="stones:aruch", param2=p2archa}) end
        if s.name == "stones:aruch"	then 
		p2archb = s.param2
		minetest.env:set_node(p, {name="stones:arch", param2=p2archb}) end
        if s.name == "stones:arci"	then 
		p2arcia = s.param2
		minetest.env:set_node(p, {name="stones:aruci", param2=p2arcia}) end
        if s.name == "stones:aruci"	then 
		p2arcib = s.param2
		minetest.env:set_node(p, {name="stones:arci", param2=p2arcib}) end
        if s.name == "stones:arco"	then 
		p2arcoa = s.param2
		minetest.env:set_node(p, {name="stones:aruco", param2=p2arcoa}) end
        if s.name == "stones:aruco"	then 
		p2arcob = s.param2
		minetest.env:set_node(p, {name="stones:arco", param2=p2arcob}) end
        if s.name == "stones:arcshil"	then 
		p2arcshila = s.param2
		minetest.env:set_node(p, {name="stones:arucshil", param2=p2arcshila}) end
        if s.name == "stones:arucshil"	then 
		p2arcshilb = s.param2
		minetest.env:set_node(p, {name="stones:arcshil", param2=p2arcshilb}) end
        if s.name == "stones:arcshir"	then 
		p2arcshira = s.param2
		minetest.env:set_node(p, {name="stones:arucshir", param2=p2arcshira}) end
        if s.name == "stones:arucshir"	then 
		p2arcshirb = s.param2
		minetest.env:set_node(p, {name="stones:arcshir", param2=p2arcshirb}) end
        if s.name == "stones:arcshol"	then 
		p2arcshola = s.param2
		minetest.env:set_node(p, {name="stones:arucshol", param2=p2arcshola}) end
        if s.name == "stones:arucshol"	then 
		p2arcsholb = s.param2
		minetest.env:set_node(p, {name="stones:arcshol", param2=p2arcsholb}) end
        if s.name == "stones:arschor"	then 
		p2arschora = s.param2
		minetest.env:set_node(p, {name="stones:aruschor", param2=p2arschora}) end
        if s.name == "stones:aruschor"	then 
		p2arschorb = s.param2
		minetest.env:set_node(p, {name="stones:arschor", param2=p2arschorb}) end
        if s.name == "stones:arschol"	then 
		p2arschola = s.param2
		minetest.env:set_node(p, {name="stones:aruschol", param2=p2arschola}) end
        if s.name == "stones:aruschol"	then 
		p2arscholb = s.param2
		minetest.env:set_node(p, {name="stones:arschol", param2=p2arscholb}) end
        if s.name == "stones:arcshor"	then 
		p2arcshora = s.param2
		minetest.env:set_node(p, {name="stones:arucshor", param2=p2arcshora}) end
        if s.name == "stones:arucshor"	then 
		p2arcshorb = s.param2
		minetest.env:set_node(p, {name="stones:arcshor", param2=p2arcshorb}) end
        if s.name == "stones:arschil"	then 
		p2arschila = s.param2
		minetest.env:set_node(p, {name="stones:aruschil", param2=p2arschila}) end
        if s.name == "stones:aruschil"	then 
		p2arschilb = s.param2
		minetest.env:set_node(p, {name="stones:arschil", param2=p2arschilb}) end
        if s.name == "stones:arschir"	then 
		p2arschira = s.param2
		minetest.env:set_node(p, {name="stones:aruschir", param2=p2arschira}) end
        if s.name == "stones:aruschir"	then 
		p2arschirb = s.param2
		minetest.env:set_node(p, {name="stones:arschir", param2=p2arschirb}) end
        if s.name == "stones:arsh"	then 
		p2arsha = s.param2
		minetest.env:set_node(p, {name="stones:arush", param2=p2arsha}) end
        if s.name == "stones:arush"	then 
		p2arshb = s.param2
		minetest.env:set_node(p, {name="stones:arsh", param2=p2arshb}) end
        if s.name == "stones:asect"	then 
		p2asecta = s.param2
		minetest.env:set_node(p, {name="stones:asectr", param2=p2asecta}) end
        if s.name == "stones:asectr"	then 
		p2asectb = s.param2
		minetest.env:set_node(p, {name="stones:asect", param2=p2asectb}) end
        if s.name == "stones:asect_2"	then 
		p2asect2a = s.param2
		minetest.env:set_node(p, {name="stones:asectr_2", param2=p2asect2a}) end
        if s.name == "stones:asectr_2"	then 
		p2asect2b = s.param2
		minetest.env:set_node(p, {name="stones:asect_2", param2=p2asect2b}) end
        if s.name == "stones:asect_2u"	then 
		p2asect2ua = s.param2
		minetest.env:set_node(p, {name="stones:asectr_2u", param2=p2asect2ua}) end
        if s.name == "stones:asectr_2u"	then 
		p2asect2ub = s.param2
		minetest.env:set_node(p, {name="stones:asect_2u", param2=p2asect2ub}) end
        if s.name == "stones:aset"	then 
		p2aseta = s.param2
		minetest.env:set_node(p, {name="stones:asetr", param2=p2aseta}) end
        if s.name == "stones:asetr"	then 
		p2asetb = s.param2
		minetest.env:set_node(p, {name="stones:aset", param2=p2asetb}) end
        if s.name == "stones:aset_2"	then 
		p2aset2a = s.param2
		minetest.env:set_node(p, {name="stones:asetr_2", param2=p2aset2a}) end
        if s.name == "stones:asetr_2"	then 
		p2aset2b = s.param2
		minetest.env:set_node(p, {name="stones:aset_2", param2=p2aset2b}) end
        if s.name == "stones:aset_2u"	then 
		p2aset2ua = s.param2
		minetest.env:set_node(p, {name="stones:asetr_2u", param2=p2aset2ua}) end
        if s.name == "stones:asetr_2u"	then 
		p2aset2ub = s.param2
		minetest.env:set_node(p, {name="stones:aset_2u", param2=p2aset2ub}) end
        if s.name == "stones:c8l1"	then 
		p2c8l1a = s.param2
		minetest.env:set_node(p, {name="stones:b8l1", param2=p2c8l1a}) end
        if s.name == "stones:b8l1"	then 
		p2c8l1b = s.param2
		minetest.env:set_node(p, {name="stones:c8l1", param2=p2c8l1b}) end
        if s.name == "stones:c8l2"	then 
		p2c8l2a = s.param2
		minetest.env:set_node(p, {name="stones:b8l2", param2=p2c8l2a}) end
        if s.name == "stones:b8l2"	then 
		p2c8l2b = s.param2
		minetest.env:set_node(p, {name="stones:c8l2", param2=p2c8l2b}) end
        if s.name == "stones:c8l3"	then 
		p2c8l3a = s.param2
		minetest.env:set_node(p, {name="stones:b8l3", param2=p2c8l3a}) end
        if s.name == "stones:b8l3"	then 
		p2c8l3b = s.param2
		minetest.env:set_node(p, {name="stones:c8l3", param2=p2c8l3b}) end
        if s.name == "stones:c8l4"	then 
		p2c8l4a = s.param2
		minetest.env:set_node(p, {name="stones:b8l4", param2=p2c8l4a}) end
        if s.name == "stones:b8l4"	then 
		p2c8l4b = s.param2
		minetest.env:set_node(p, {name="stones:c8l4", param2=p2c8l4b}) end
        if s.name == "stones:c8l5"	then 
		p2c8l5a = s.param2
		minetest.env:set_node(p, {name="stones:b8l5", param2=p2c8l5a}) end
        if s.name == "stones:b8l5"	then 
		p2c8l5b = s.param2
		minetest.env:set_node(p, {name="stones:c8l5", param2=p2c8l5b}) end
        if s.name == "stones:c8l6"	then 
		p2c8l6a = s.param2
		minetest.env:set_node(p, {name="stones:b8l6", param2=p2c8l6a}) end
        if s.name == "stones:b8l6"	then 
		p2c8l6b = s.param2
		minetest.env:set_node(p, {name="stones:c8l6", param2=p2c8l6b}) end
        if s.name == "stones:c8l7"	then 
		p2c8l7a = s.param2
		minetest.env:set_node(p, {name="stones:b8l7", param2=p2c8l7a}) end
        if s.name == "stones:b8l7"	then 
		p2c8l7b = s.param2
		minetest.env:set_node(p, {name="stones:c8l7", param2=p2c8l7b}) end
        if s.name == "stones:c8l8"	then 
		p2c8l8a = s.param2
		minetest.env:set_node(p, {name="stones:b8l8", param2=p2c8l8a}) end
        if s.name == "stones:b8l8"	then 
		p2c8l8b = s.param2
		minetest.env:set_node(p, {name="stones:c8l8", param2=p2c8l8b}) end
        if s.name == "stones:c8l9"	then 
		p2c8l9a = s.param2
		minetest.env:set_node(p, {name="stones:b8l9", param2=p2c8l9a}) end
        if s.name == "stones:b8l9"	then 
		p2c8l9b = s.param2
		minetest.env:set_node(p, {name="stones:c8l9", param2=p2c8l9b}) end
        if s.name == "stones:c8la"	then 
		p2c8laa = s.param2
		minetest.env:set_node(p, {name="stones:b8la", param2=p2c8laa}) end
        if s.name == "stones:b8la"	then 
		p2c8lab = s.param2
		minetest.env:set_node(p, {name="stones:c8la", param2=p2c8lab}) end
        if s.name == "stones:c8lb"	then 
		p2c8lba = s.param2
		minetest.env:set_node(p, {name="stones:b8lb", param2=p2c8lba}) end
        if s.name == "stones:b8lb"	then 
		p2c8lbb = s.param2
		minetest.env:set_node(p, {name="stones:c8lb", param2=p2c8lbb}) end
        if s.name == "stones:c8lc"	then 
		p2c8lca = s.param2
		minetest.env:set_node(p, {name="stones:b8lc", param2=p2c8lca}) end
        if s.name == "stones:b8lc"	then 
		p2c8lcb = s.param2
		minetest.env:set_node(p, {name="stones:c8lc", param2=p2c8lcb}) end
        if s.name == "stones:c8ld"	then 
		p2c8lda = s.param2
		minetest.env:set_node(p, {name="stones:b8ld", param2=p2c8lda}) end
        if s.name == "stones:b8ld"	then 
		p2c8ldb = s.param2
		minetest.env:set_node(p, {name="stones:c8ld", param2=p2c8ldb}) end
        if s.name == "stones:c8le"	then 
		p2c8lea = s.param2
		minetest.env:set_node(p, {name="stones:b8le", param2=p2c8lea}) end
        if s.name == "stones:b8le"	then 
		p2c8leb = s.param2
		minetest.env:set_node(p, {name="stones:c8le", param2=p2c8leb}) end
        if s.name == "stones:c8lf"	then 
		p2c8lfa = s.param2
		minetest.env:set_node(p, {name="stones:b8lf", param2=p2c8lfa}) end
        if s.name == "stones:b8lf"	then 
		p2c8lfb = s.param2
		minetest.env:set_node(p, {name="stones:c8lf", param2=p2c8lfb}) end
        if s.name == "stones:c8r1"	then 
		p2c8r1a = s.param2
		minetest.env:set_node(p, {name="stones:b8r1", param2=p2c8r1a}) end
        if s.name == "stones:b8r1"	then 
		p2c8r1b = s.param2
		minetest.env:set_node(p, {name="stones:c8r1", param2=p2c8r1b}) end
        if s.name == "stones:c8r2"	then 
		p2c8r2a = s.param2
		minetest.env:set_node(p, {name="stones:b8r2", param2=p2c8r2a}) end
        if s.name == "stones:b8r2"	then 
		p2c8r2b = s.param2
		minetest.env:set_node(p, {name="stones:c8r2", param2=p2c8r2b}) end
        if s.name == "stones:c8r3"	then 
		p2c8r3a = s.param2
		minetest.env:set_node(p, {name="stones:b8r3", param2=p2c8r3a}) end
        if s.name == "stones:b8r3"	then 
		p2c8r3b = s.param2
		minetest.env:set_node(p, {name="stones:c8r3", param2=p2c8r3b}) end
        if s.name == "stones:c8r4"	then 
		p2c8r4a = s.param2
		minetest.env:set_node(p, {name="stones:b8r4", param2=p2c8r4a}) end
        if s.name == "stones:b8r4"	then 
		p2c8r4b = s.param2
		minetest.env:set_node(p, {name="stones:c8r4", param2=p2c8r4b}) end
        if s.name == "stones:c8r5"	then 
		p2c8r5a = s.param2
		minetest.env:set_node(p, {name="stones:b8r5", param2=p2c8r5a}) end
        if s.name == "stones:b8r5"	then 
		p2c8r5b = s.param2
		minetest.env:set_node(p, {name="stones:c8r5", param2=p2c8r5b}) end
        if s.name == "stones:c8r6"	then 
		p2c8r6a = s.param2
		minetest.env:set_node(p, {name="stones:b8r6", param2=p2c8r6a}) end
        if s.name == "stones:b8r6"	then 
		p2c8r6b = s.param2
		minetest.env:set_node(p, {name="stones:c8r6", param2=p2c8r6b}) end
        if s.name == "stones:c8r7"	then 
		p2c8r7a = s.param2
		minetest.env:set_node(p, {name="stones:b8r7", param2=p2c8r7a}) end
        if s.name == "stones:b8r7"	then 
		p2c8r7b = s.param2
		minetest.env:set_node(p, {name="stones:c8r7", param2=p2c8r7b}) end
        if s.name == "stones:c8r8"	then 
		p2c8r8a = s.param2
		minetest.env:set_node(p, {name="stones:b8r8", param2=p2c8r8a}) end
        if s.name == "stones:b8r8"	then 
		p2c8r8b = s.param2
		minetest.env:set_node(p, {name="stones:c8r8", param2=p2c8r8b}) end
        if s.name == "stones:c8r9"	then 
		p2c8r9a = s.param2
		minetest.env:set_node(p, {name="stones:b8r9", param2=p2c8r9a}) end
        if s.name == "stones:b8r9"	then 
		p2c8r9b = s.param2
		minetest.env:set_node(p, {name="stones:c8r9", param2=p2c8r9b}) end
        if s.name == "stones:c8ra"	then 
		p2c8raa = s.param2
		minetest.env:set_node(p, {name="stones:b8ra", param2=p2c8raa}) end
        if s.name == "stones:b8ra"	then 
		p2c8rab = s.param2
		minetest.env:set_node(p, {name="stones:c8ra", param2=p2c8rab}) end
        if s.name == "stones:c8rb"	then 
		p2c8rba = s.param2
		minetest.env:set_node(p, {name="stones:b8rb", param2=p2c8rba}) end
        if s.name == "stones:b8rb"	then 
		p2c8rbb = s.param2
		minetest.env:set_node(p, {name="stones:c8rb", param2=p2c8rbb}) end
        if s.name == "stones:c8rc"	then 
		p2c8rca = s.param2
		minetest.env:set_node(p, {name="stones:b8rc", param2=p2c8rca}) end
        if s.name == "stones:b8rc"	then 
		p2c8rcb = s.param2
		minetest.env:set_node(p, {name="stones:c8rc", param2=p2c8rcb}) end
        if s.name == "stones:c8rd"	then 
		p2c8rda = s.param2
		minetest.env:set_node(p, {name="stones:b8rd", param2=p2c8rda}) end
        if s.name == "stones:b8rd"	then 
		p2c8rdb = s.param2
		minetest.env:set_node(p, {name="stones:c8rd", param2=p2c8rdb}) end
        if s.name == "stones:c8re"	then 
		p2c8rea = s.param2
		minetest.env:set_node(p, {name="stones:b8re", param2=p2c8rea}) end
        if s.name == "stones:b8re"	then 
		p2c8reb = s.param2
		minetest.env:set_node(p, {name="stones:c8re", param2=p2c8reb}) end
        if s.name == "stones:c8rf"	then 
		p2c8rfa = s.param2
		minetest.env:set_node(p, {name="stones:b8rf", param2=p2c8rfa}) end
        if s.name == "stones:b8rf"	then 
		p2c8rfb = s.param2
		minetest.env:set_node(p, {name="stones:c8rf", param2=p2c8rfb}) end
        if s.name == "stones:diagstep_2"	then 
		p2ds2a = s.param2
		minetest.env:set_node(p, {name="stones:diagsterp_2", param2=p2ds2a}) end
        if s.name == "stones:diagsterp_2"	then 
		p2ds2b = s.param2
		minetest.env:set_node(p, {name="stones:diagstep_2", param2=p2ds2b}) end
        if s.name == "stones:diagstep_7"	then 
		p2ds7a = s.param2
		minetest.env:set_node(p, {name="stones:diagsterp_7", param2=p2ds7a}) end
        if s.name == "stones:diagsterp_7"	then 
		p2ds7b = s.param2
		minetest.env:set_node(p, {name="stones:diagstep_7", param2=p2ds7b}) end
        if s.name == "stones:diagsteps_13"	then 
		p2ds13a = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_13", param2=p2ds13a}) end
        if s.name == "stones:diagsterps_13"	then 
		p2ds13b = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_13", param2=p2ds13b}) end
        if s.name == "stones:diagsteps_31"	then 
		p2ds31a = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_31", param2=p2ds31a}) end
        if s.name == "stones:diagsterps_31"	then 
		p2ds31b = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_31", param2=p2ds31b}) end
        if s.name == "stones:diagsteps_52lh"	then 
		p252lha = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52lh", param2=p252lha}) end
        if s.name == "stones:diagsterps_52lh"	then 
		p252lhb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52lh", param2=p252lhb}) end
        if s.name == "stones:diagsteps_52lv"	then 
		p252lva = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52lv", param2=p252lva}) end
        if s.name == "stones:diagsterps_52lv"	then 
		p252lvb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52lv", param2=p252lvb}) end
        if s.name == "stones:diagsteps_52rh"	then 
		p252rha = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52rh", param2=p252rha}) end
        if s.name == "stones:diagsterps_52rh"	then 
		p252rhb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52rh", param2=p252rhb}) end
        if s.name == "stones:diagsteps_52rv"	then 
		p252rva = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52rv", param2=p252rva}) end
        if s.name == "stones:diagsterps_52rv"	then 
		p252rvb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52rv", param2=p252rvb}) end
        if s.name == "stones:diagsteps_52s"	then 
		p252sa = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52s", param2=p252sa}) end
        if s.name == "stones:diagsterps_52s"	then 
		p252sb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52s", param2=p252sb}) end
        if s.name == "stones:diagsteps_52z"	then 
		p252za = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_52z", param2=p252za}) end
        if s.name == "stones:diagsterps_52z"	then 
		p252zb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_52z", param2=p252zb}) end
        if s.name == "stones:diagsteps_8l"	then 
		p28la = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_8l", param2=p28la}) end
        if s.name == "stones:diagsterps_8l"	then 
		p28lb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_8l", param2=p28lb}) end
        if s.name == "stones:diagsteps_8r"	then 
		p28ra = s.param2
		minetest.env:set_node(p, {name="stones:diagsterps_8r", param2=p28ra}) end
        if s.name == "stones:diagsterps_8r"	then 
		p28rb = s.param2
		minetest.env:set_node(p, {name="stones:diagsteps_8r", param2=p28rb}) end
        if s.name == "stones:diaq"	then 
		p2qa = s.param2
		minetest.env:set_node(p, {name="stones:diraq", param2=p2qa}) end
        if s.name == "stones:diraq"	then 
		p2qb = s.param2
		minetest.env:set_node(p, {name="stones:diaq", param2=p2qb}) end
        if s.name == "stones:dias52b"	then 
		p2d52ba = s.param2
		minetest.env:set_node(p, {name="stones:diras52b", param2=p2d52ba}) end
        if s.name == "stones:diras52b"	then 
		p2d52bb = s.param2
		minetest.env:set_node(p, {name="stones:dias52b", param2=p2d52bb}) end
        if s.name == "stones:dias52d"	then 
		p2d52da = s.param2
		minetest.env:set_node(p, {name="stones:diras52d", param2=p2d52da}) end
        if s.name == "stones:diras52d"	then 
		p2d52db = s.param2
		minetest.env:set_node(p, {name="stones:dias52d", param2=p2d52db}) end
        if s.name == "stones:dias52r"	then 
		p2d52ra = s.param2
		minetest.env:set_node(p, {name="stones:diras52r", param2=p2d52ra}) end
        if s.name == "stones:diras52r"	then 
		p2d52rb = s.param2
		minetest.env:set_node(p, {name="stones:dias52r", param2=p2d52rb}) end
        if s.name == "stones:estruk"	then 
		p2etka = s.param2
		minetest.env:set_node(p, {name="stones:estruble", param2=p2etka}) end
        if s.name == "stones:estruble"	then 
		p2etkb = s.param2
		minetest.env:set_node(p, {name="stones:estruk", param2=p2etkb}) end
        if s.name == "stones:flat_1"	then 
		p2f1a = s.param2
		minetest.env:set_node(p, {name="stones:flart_1", param2=p2f1a}) end
        if s.name == "stones:flart_1"	then 
		p2f1b = s.param2
		minetest.env:set_node(p, {name="stones:flat_1", param2=p2f1b}) end
        if s.name == "stones:flat_2"	then 
		p2f2a = s.param2
		minetest.env:set_node(p, {name="stones:flart_2", param2=p2f2a}) end
        if s.name == "stones:flart_2"	then 
		p2f2b = s.param2
		minetest.env:set_node(p, {name="stones:flat_2", param2=p2f2b}) end
        if s.name == "stones:flat_3"	then 
		p2f3a = s.param2
		minetest.env:set_node(p, {name="stones:flart_3", param2=p2f3a}) end
        if s.name == "stones:flart_3"	then 
		p2f3b = s.param2
		minetest.env:set_node(p, {name="stones:flat_3", param2=p2f3b}) end
        if s.name == "stones:flat_3a"	then 
		p2f4a = s.param2
		minetest.env:set_node(p, {name="stones:flart_3a", param2=p2f4a}) end
        if s.name == "stones:flart_3a"	then 
		p2f4b = s.param2
		minetest.env:set_node(p, {name="stones:flat_3a", param2=p2f4b}) end
        if s.name == "stones:flat_4"	then 
		p2f5a = s.param2
		minetest.env:set_node(p, {name="stones:flart_4", param2=p2f5a}) end
        if s.name == "stones:flart_4"	then 
		p2f5b = s.param2
		minetest.env:set_node(p, {name="stones:flat_4", param2=p2f5b}) end
        if s.name == "stones:isocol"	then 
		p2iso1a = s.param2
		minetest.env:set_node(p, {name="stones:irocol", param2=p2iso1a}) end
        if s.name == "stones:irocol"	then 
		p2iso1b = s.param2
		minetest.env:set_node(p, {name="stones:isocol", param2=p2iso1b}) end
        if s.name == "stones:iso54"	then 
		p2iso2a = s.param2
		minetest.env:set_node(p, {name="stones:isor54", param2=p2iso2a}) end
        if s.name == "stones:isor54"	then 
		p2iso2b = s.param2
		minetest.env:set_node(p, {name="stones:iso54", param2=p2iso2b}) end
        if s.name == "stones:micro"	then 
		p2mua = s.param2
		minetest.env:set_node(p, {name="stones:micru", param2=p2mua}) end
        if s.name == "stones:micru"	then 
		p2mub = s.param2
		minetest.env:set_node(p, {name="stones:micro", param2=p2mub}) end
        if s.name == "stones:panel"	then 
		p2pna = s.param2
		minetest.env:set_node(p, {name="stones:parul", param2=p2pna}) end
        if s.name == "stones:parul"	then 
		p2pnb = s.param2
		minetest.env:set_node(p, {name="stones:panel", param2=p2pnb}) end
        if s.name == "stones:plot"	then 
		p2pta = s.param2
		minetest.env:set_node(p, {name="stones:prob", param2=p2pta}) end
        if s.name == "stones:prob"	then 
		p2ptb = s.param2
		minetest.env:set_node(p, {name="stones:plot", param2=p2ptb}) end
        if s.name == "stones:pyra"	then 
		p2py1a = s.param2
		minetest.env:set_node(p, {name="stones:pyru", param2=p2py1a}) end
        if s.name == "stones:pyru"	then 
		p2py1b = s.param2
		minetest.env:set_node(p, {name="stones:pyra", param2=p2py1b}) end
        if s.name == "stones:pyra_2"	then 
		p2py2a = s.param2
		minetest.env:set_node(p, {name="stones:pyru_2", param2=p2py2a}) end
        if s.name == "stones:pyru_2"	then 
		p2py2b = s.param2
		minetest.env:set_node(p, {name="stones:pyra_2", param2=p2py2b}) end
        if s.name == "stones:pyre"	then 
		p2py3a = s.param2
		minetest.env:set_node(p, {name="stones:pyrue", param2=p2py3a}) end
        if s.name == "stones:pyrue"	then 
		p2py3b = s.param2
		minetest.env:set_node(p, {name="stones:pyre", param2=p2py3b}) end
        if s.name == "stones:rushrock_0"	then 
		p2rr0a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_0", param2=p2rr0a}) end
        if s.name == "stones:rublish_0"	then 
		p2rr0b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_0", param2=p2rr0b}) end
        if s.name == "stones:rushrock_1"	then 
		p2rr1a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_1", param2=p2rr1a}) end
        if s.name == "stones:rublish_1"	then 
		p2rr1b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_1", param2=p2rr1b}) end
        if s.name == "stones:rushrock_11"	then 
		p2rr11a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_11", param2=p2rr11a}) end
        if s.name == "stones:rublish_11"	then 
		p2rr11b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_11", param2=p2rr11b}) end
        if s.name == "stones:rushrock_21"	then 
		p2rr21a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_21", param2=p2rr21a}) end
        if s.name == "stones:rublish_21"	then 
		p2rr21b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_21", param2=p2rr21b}) end
        if s.name == "stones:rushrock_28"	then 
		p2rr28a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_28", param2=p2rr28a}) end
        if s.name == "stones:rublish_28"	then 
		p2rr28b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_28", param2=p2rr28b}) end
        if s.name == "stones:rushrock_4"	then 
		p2rr4a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_4", param2=p2rr4a}) end
        if s.name == "stones:rublish_4"	then 
		p2rr4b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_4", param2=p2rr4b}) end
        if s.name == "stones:rushrock_3"	then 
		p2rr3a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_3", param2=p2rr3a}) end
        if s.name == "stones:rublish_3"	then 
		p2rr3b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_3", param2=p2rr3b}) end
        if s.name == "stones:rushrock_2"	then 
		p2rr2a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_2", param2=p2rr2a}) end
        if s.name == "stones:rublish_2"	then 
		p2rr2b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_2", param2=p2rr2b}) end
        if s.name == "stones:rushrock_5"	then 
		p2rr5a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_5", param2=p2rr5a}) end
        if s.name == "stones:rublish_5"	then 
		p2rr5b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_5", param2=p2rr5b}) end
        if s.name == "stones:rushrock_2u"	then 
		p2rr2ua = s.param2
		minetest.env:set_node(p, {name="stones:rublish_2u", param2=p2rr2ua}) end
        if s.name == "stones:rublish_2u"	then 
		p2rr2ub = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_2u", param2=p2rr2ub}) end
        if s.name == "stones:rushrock_527l"	then 
		p2rr527la = s.param2
		minetest.env:set_node(p, {name="stones:rublish_527l", param2=p2rr527la}) end
        if s.name == "stones:rublish_527l"	then 
		p2rr527lb = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_527l", param2=p2rr527lb}) end
        if s.name == "stones:rushrock_527r"	then 
		p2rr527ra = s.param2
		minetest.env:set_node(p, {name="stones:rublish_527r", param2=p2rr527ra}) end
        if s.name == "stones:rublish_527r"	then 
		p2rr527rb = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_527r", param2=p2rr527rb}) end
        if s.name == "stones:rushrock_52ul"	then 
		p2rr52ula = s.param2
		minetest.env:set_node(p, {name="stones:rublish_52ul", param2=p2rr52ula}) end
        if s.name == "stones:rublish_52ul"	then 
		p2rr52ulb = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_52ul", param2=p2rr52ulb}) end
        if s.name == "stones:rushrock_52ur"	then 
		p2rr52ura = s.param2
		minetest.env:set_node(p, {name="stones:rublish_52ur", param2=p2rr52ura}) end
        if s.name == "stones:rublish_52ur"	then 
		p2rr52urb = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_52ur", param2=p2rr52urb}) end
        if s.name == "stones:rushrock_8"	then 
		p2rr8a = s.param2
		minetest.env:set_node(p, {name="stones:rublish_8", param2=p2rr8a}) end
        if s.name == "stones:rublish_8"	then 
		p2rr8b = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_8", param2=p2rr8b}) end
        if s.name == "stones:rushrock_c"	then 
		p2rrca = s.param2
		minetest.env:set_node(p, {name="stones:rublish_c", param2=p2rrca}) end
        if s.name == "stones:rublish_c"	then 
		p2rrcb = s.param2
		minetest.env:set_node(p, {name="stones:rushrock_c", param2=p2rr8b}) end
        if s.name == "stones:s_21"	then 
		p2sb21a = s.param2
		minetest.env:set_node(p, {name="stones:sb_21", param2=p2sb21a}) end
        if s.name == "stones:sb_21"	then 
		p2sb21b = s.param2
		minetest.env:set_node(p, {name="stones:s_21", param2=p2sb21b}) end
        if s.name == "stones:s_221"	then 
		p2sb221a = s.param2
		minetest.env:set_node(p, {name="stones:sb_221", param2=p2sb221a}) end
        if s.name == "stones:sb_221"	then 
		p2sb221b = s.param2
		minetest.env:set_node(p, {name="stones:s_221", param2=p2sb221b}) end
        if s.name == "stones:s_21u"	then 
		p2sb21ua = s.param2
		minetest.env:set_node(p, {name="stones:sb_21u", param2=p2sb21ua}) end
        if s.name == "stones:sb_21u"	then 
		p2sb21ub = s.param2
		minetest.env:set_node(p, {name="stones:s_21u", param2=p2sb21ub}) end
        if s.name == "stones:s_22"	then 
		p2sb22a = s.param2
		minetest.env:set_node(p, {name="stones:sb_22", param2=p2sb22a}) end
        if s.name == "stones:sb_22"	then 
		p2sb22b = s.param2
		minetest.env:set_node(p, {name="stones:s_22", param2=p2sb22b}) end
        if s.name == "stones:s_252l"	then 
		p2sb252la = s.param2
		minetest.env:set_node(p, {name="stones:sb_252l", param2=p2sb252la}) end
        if s.name == "stones:sb_252l"	then 
		p2sb252lb = s.param2
		minetest.env:set_node(p, {name="stones:s_252l", param2=p2sb252lb}) end
        if s.name == "stones:s_252r"	then 
		p2sb252ra = s.param2
		minetest.env:set_node(p, {name="stones:sb_252r", param2=p2sb252ra}) end
        if s.name == "stones:sb_252r"	then 
		p2sb252rb = s.param2
		minetest.env:set_node(p, {name="stones:s_252r", param2=p2sb252rb}) end
        if s.name == "stones:s_222"	then 
		p2sb222a = s.param2
		minetest.env:set_node(p, {name="stones:sb_222", param2=p2sb222a}) end
        if s.name == "stones:sb_222"	then 
		p2sb222b = s.param2
		minetest.env:set_node(p, {name="stones:s_222", param2=p2sb222b}) end
        if s.name == "stones:s_3"	then 
		p2sb3a = s.param2
		minetest.env:set_node(p, {name="stones:sb_3", param2=p2sb3a}) end
        if s.name == "stones:sb_3"	then 
		p2sb3b = s.param2
		minetest.env:set_node(p, {name="stones:s_3", param2=p2sb3b}) end
        if s.name == "stones:s_38"	then 
		p2sb38a = s.param2
		minetest.env:set_node(p, {name="stones:sb_38", param2=p2sb38a}) end
        if s.name == "stones:sb_38"	then 
		p2sb38b = s.param2
		minetest.env:set_node(p, {name="stones:s_38", param2=p2sb38b}) end
        if s.name == "stones:s_58"	then 
		p2sb58a = s.param2
		minetest.env:set_node(p, {name="stones:sb_58", param2=p2sb58a}) end
        if s.name == "stones:sb_58"	then 
		p2sb58b = s.param2
		minetest.env:set_node(p, {name="stones:s_58", param2=p2sb58b}) end
        if s.name == "stones:s_52"	then 
		p2sb52a = s.param2
		minetest.env:set_node(p, {name="stones:sb_52", param2=p2sb52a}) end
        if s.name == "stones:sb_52"	then 
		p2sb52b = s.param2
		minetest.env:set_node(p, {name="stones:s_52", param2=p2sb52b}) end
        if s.name == "stones:s_52hq"	then 
		p2sb52hqa = s.param2
		minetest.env:set_node(p, {name="stones:sb_52hq", param2=p2sb52hqa}) end
        if s.name == "stones:sb_52hq"	then 
		p2sb52hqb = s.param2
		minetest.env:set_node(p, {name="stones:s_52hq", param2=p2sb52hqb}) end
        if s.name == "stones:s_52l"	then 
		p2sb52la = s.param2
		minetest.env:set_node(p, {name="stones:sb_52l", param2=p2sb52la}) end
        if s.name == "stones:sb_52l"	then 
		p2sb52lb = s.param2
		minetest.env:set_node(p, {name="stones:s_52l", param2=p2sb52lb}) end
        if s.name == "stones:s_52r"	then 
		p2sb52ra = s.param2
		minetest.env:set_node(p, {name="stones:sb_52r", param2=p2sb52ra}) end
        if s.name == "stones:sb_52r"	then 
		p2sb52rb = s.param2
		minetest.env:set_node(p, {name="stones:s_52r", param2=p2sb52rb}) end
        if s.name == "stones:s_52ul"	then 
		p2sb52ula = s.param2
		minetest.env:set_node(p, {name="stones:sb_52ul", param2=p2sb52ula}) end
        if s.name == "stones:sb_52ul"	then 
		p2sb52ulb = s.param2
		minetest.env:set_node(p, {name="stones:s_52ul", param2=p2sb52ulb}) end
        if s.name == "stones:s_52ur"	then 
		p2sb52ura = s.param2
		minetest.env:set_node(p, {name="stones:sb_52ur", param2=p2sb52ura}) end
        if s.name == "stones:sb_52ur"	then 
		p2sb52urb = s.param2
		minetest.env:set_node(p, {name="stones:s_52ur", param2=p2sb52urb}) end
        if s.name == "stones:s_52u"	then 
		p2sb52ua = s.param2
		minetest.env:set_node(p, {name="stones:sb_52u", param2=p2sb52ua}) end
        if s.name == "stones:sb_52u"	then 
		p2sb52ub = s.param2
		minetest.env:set_node(p, {name="stones:s_52u", param2=p2sb52ub}) end
        if s.name == "stones:s_52pl"	then 
		p2sb52pla = s.param2
		minetest.env:set_node(p, {name="stones:sb_52pl", param2=p2sb52pla}) end
        if s.name == "stones:sb_52pl"	then 
		p2sb52plb = s.param2
		minetest.env:set_node(p, {name="stones:s_52pl", param2=p2sb52plb}) end
        if s.name == "stones:s_52pr"	then 
		p2sb52pra = s.param2
		minetest.env:set_node(p, {name="stones:sb_52pr", param2=p2sb52pra}) end
        if s.name == "stones:sb_52pr"	then 
		p2sb52prb = s.param2
		minetest.env:set_node(p, {name="stones:s_52pr", param2=p2sb52prb}) end
        if s.name == "stones:sku"	then 
		p2skua = s.param2
		minetest.env:set_node(p, {name="stones:skubl", param2=p2skua}) end
        if s.name == "stones:skubl"	then 
		p2skub = s.param2
		minetest.env:set_node(p, {name="stones:sku", param2=p2skub}) end
        if s.name == "stones:sku2_r"	then 
		p2sk2a = s.param2
		minetest.env:set_node(p, {name="stones:skub2_r", param2=p2sk2a}) end
        if s.name == "stones:skub2_r"	then 
		p2sk2b = s.param2
		minetest.env:set_node(p, {name="stones:sku2_r", param2=p2sk2b}) end
        if s.name == "stones:sku2_l"	then 
		p2sk3a = s.param2
		minetest.env:set_node(p, {name="stones:skub2_l", param2=p2sk3a}) end
        if s.name == "stones:skub2_l"	then 
		p2sk3b = s.param2
		minetest.env:set_node(p, {name="stones:sku2_l", param2=p2sk3b}) end
        if s.name == "stones:sku3_r"	then 
		p2sk4a = s.param2
		minetest.env:set_node(p, {name="stones:skub3_r", param2=p2sk4a}) end
        if s.name == "stones:skub3_r"	then 
		p2sk4b = s.param2
		minetest.env:set_node(p, {name="stones:sku3_r", param2=p2sk4b}) end
        if s.name == "stones:sku3_l"	then 
		p2sk5a = s.param2
		minetest.env:set_node(p, {name="stones:skub3_l", param2=p2sk5a}) end
        if s.name == "stones:skub3_l"	then 
		p2sk5b = s.param2
		minetest.env:set_node(p, {name="stones:sku3_l", param2=p2sk5b}) end
        if s.name == "stones:sku_20"	then 
		p2sk6a = s.param2
		minetest.env:set_node(p, {name="stones:skub_20", param2=p2sk6a}) end
        if s.name == "stones:skub_20"	then 
		p2sk6b = s.param2
		minetest.env:set_node(p, {name="stones:sku_20", param2=p2sk6b}) end
        if s.name == "stones:sku_202"	then 
		p2sk7a = s.param2
		minetest.env:set_node(p, {name="stones:skub_202", param2=p2sk7a}) end
        if s.name == "stones:skub_202"	then 
		p2sk7b = s.param2
		minetest.env:set_node(p, {name="stones:sku_202", param2=p2sk7b}) end
        if s.name == "stones:skud_202r"	then 
		p2sk8a = s.param2
		minetest.env:set_node(p, {name="stones:skrud_202r", param2=p2sk8a}) end
        if s.name == "stones:skud_202r"	then 
		p2sk8b = s.param2
		minetest.env:set_node(p, {name="stones:skrud_202r", param2=p2sk8b}) end
        if s.name == "stones:spike"	then 
		p2sk9a = s.param2
		minetest.env:set_node(p, {name="stones:spruke", param2=p2sk9a}) end
        if s.name == "stones:spruke"	then 
		p2sk9b = s.param2
		minetest.env:set_node(p, {name="stones:spike", param2=p2sk9b}) end
        if s.name == "stones:spikle"	then 
		p2sk0a = s.param2
		minetest.env:set_node(p, {name="stones:sprukle", param2=p2sk0a}) end
        if s.name == "stones:sprukle"	then 
		p2sk0b = s.param2
		minetest.env:set_node(p, {name="stones:spikle", param2=p2sk0b}) end
        if s.name == "stones:spirdiag"	then 
		p2sp0a = s.param2
		minetest.env:set_node(p, {name="stones:spirblag", param2=p2sp0a}) end
        if s.name == "stones:spirblag"	then 
		p2sp0b = s.param2
		minetest.env:set_node(p, {name="stones:spirdiag", param2=p2sp0b}) end
        if s.name == "stones:spircol_8"	then 
		p2sp1a = s.param2
		minetest.env:set_node(p, {name="stones:spircobl_8", param2=p2sp1a}) end
        if s.name == "stones:spircobl_8"	then 
		p2sp1b = s.param2
		minetest.env:set_node(p, {name="stones:spircol_8", param2=p2sp1b}) end
        if s.name == "stones:spircod"	then 
		p2sp2a = s.param2
		minetest.env:set_node(p, {name="stones:spircob", param2=p2sp2a}) end
        if s.name == "stones:spircob"	then 
		p2sp2b = s.param2
		minetest.env:set_node(p, {name="stones:spircod", param2=p2sp2b}) end
        if s.name == "stones:spirdiag_l"	then 
		p2sp3a = s.param2
		minetest.env:set_node(p, {name="stones:spirblag_l", param2=p2sp3a}) end
        if s.name == "stones:spirblag_l"	then 
		p2sp3b = s.param2
		minetest.env:set_node(p, {name="stones:spirdiag_l", param2=p2sp3b}) end
        if s.name == "stones:spirdiag_r"	then 
		p2sp4a = s.param2
		minetest.env:set_node(p, {name="stones:spirblag_r", param2=p2sp4a}) end
        if s.name == "stones:spirblag_r"	then 
		p2sp4b = s.param2
		minetest.env:set_node(p, {name="stones:spirdiag_r", param2=p2sp4b}) end
        if s.name == "stones:spirjoin"	then 
		p2sp5a = s.param2
		minetest.env:set_node(p, {name="stones:spijrubl", param2=p2sp5a}) end
        if s.name == "stones:spijrubl"	then 
		p2sp5b = s.param2
		minetest.env:set_node(p, {name="stones:spirjoin", param2=p2sp5b}) end
        if s.name == "stones:spirjoin2"	then 
		p2sp6a = s.param2
		minetest.env:set_node(p, {name="stones:spijrubl2", param2=p2sp6a}) end
        if s.name == "stones:spijrubl2"	then 
		p2sp6b = s.param2
		minetest.env:set_node(p, {name="stones:spirjoin2", param2=p2sp6b}) end
        if s.name == "stones:spirjoin_2l"	then 
		p2sp7a = s.param2
		minetest.env:set_node(p, {name="stones:spijrubl_2l", param2=p2sp7a}) end
        if s.name == "stones:spijrubl_2l"	then 
		p2sp7b = s.param2
		minetest.env:set_node(p, {name="stones:spirjoin_2l", param2=p2sp7b}) end
        if s.name == "stones:spirjoin_2r"	then 
		p2sp8a = s.param2
		minetest.env:set_node(p, {name="stones:spijrubl_2r", param2=p2sp8a}) end
        if s.name == "stones:spijrubl_2r"	then 
		p2sp8b = s.param2
		minetest.env:set_node(p, {name="stones:spirjoin_2r", param2=p2sp8b}) end
        if s.name == "stones:spirout_l"	then 
		p2sp9a = s.param2
		minetest.env:set_node(p, {name="stones:spirbut_l", param2=p2sp9a}) end
        if s.name == "stones:spirbut_l"	then 
		p2sp9b = s.param2
		minetest.env:set_node(p, {name="stones:spirout_l", param2=p2sp9b}) end
        if s.name == "stones:spirout_r"	then 
		p2sp10a = s.param2
		minetest.env:set_node(p, {name="stones:spirbut_r", param2=p2sp10a}) end
        if s.name == "stones:spirbut_r"	then 
		p2sp10b = s.param2
		minetest.env:set_node(p, {name="stones:spirout_r", param2=p2sp10b}) end
        if s.name == "stones:spirstax_r"	then 
		p2sp11a = s.param2
		minetest.env:set_node(p, {name="stones:spirblux_r", param2=p2sp11a}) end
        if s.name == "stones:spirblux_r"	then 
		p2sp11b = s.param2
		minetest.env:set_node(p, {name="stones:spirstax_r", param2=p2sp11b}) end
        if s.name == "stones:spirstax_l"	then 
		p2sp12a = s.param2
		minetest.env:set_node(p, {name="stones:spirblux_l", param2=p2sp12a}) end
        if s.name == "stones:spirblux_l"	then 
		p2sp12b = s.param2
		minetest.env:set_node(p, {name="stones:spirstax_l", param2=p2sp12b}) end
        if s.name == "stones:stair_2"	then 
		p2st2a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2", param2=p2st2a}) end
        if s.name == "stones:strubl_2"	then 
		p2st2b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2", param2=p2st2b}) end
        if s.name == "stones:stair_3"	then 
		p2st3a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_3", param2=p2st3a}) end
        if s.name == "stones:strubl_3"	then 
		p2st3b = s.param2
		minetest.env:set_node(p, {name="stones:stair_3", param2=p2st3b}) end
        if s.name == "stones:stair_2p"	then 
		p2st4a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2p", param2=p2st4a}) end
        if s.name == "stones:strubl_2p"	then 
		p2st4b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2p", param2=p2st4b}) end
        if s.name == "stones:stair_2q"	then 
		p2st5a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2q", param2=p2st5a}) end
        if s.name == "stones:strubl_2q"	then 
		p2st5b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2q", param2=p2st5b}) end
        if s.name == "stones:stair_2of3"	then 
		p2st6a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2of3", param2=p2st6a}) end
        if s.name == "stones:strubl_2of3"	then 
		p2st6b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2of3", param2=p2st6b}) end
        if s.name == "stones:stair_3_half_l"	then 
		p2st7a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_3_half_l", param2=p2st7a}) end
        if s.name == "stones:strubl_3_half_l"	then 
		p2st7b = s.param2
		minetest.env:set_node(p, {name="stones:stair_3_half_l", param2=p2st7b}) end
        if s.name == "stones:stair_3_half_r"	then 
		p2st8a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_3_half_r", param2=p2st8a}) end
        if s.name == "stones:strubl_3_half_r"	then 
		p2st8b = s.param2
		minetest.env:set_node(p, {name="stones:stair_3_half_r", param2=p2st8b}) end
        if s.name == "stones:stair_half"	then 
		p2st9a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_half", param2=p2st9a}) end
        if s.name == "stones:strubl_half"	then 
		p2st9b = s.param2
		minetest.env:set_node(p, {name="stones:stair_half", param2=p2st9b}) end
        if s.name == "stones:stair_half_r"	then 
		p2st10a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_half_r", param2=p2st10a}) end
        if s.name == "stones:strubl_half_r"	then 
		p2st10b = s.param2
		minetest.env:set_node(p, {name="stones:stair_half_r", param2=p2st10b}) end
        if s.name == "stones:stair_2of3h"	then 
		p2st11a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2of3h", param2=p2st11a}) end
        if s.name == "stones:strubl_2of3h"	then 
		p2st11b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2of3h", param2=p2st11b}) end
        if s.name == "stones:stair_7"	then 
		p2st12a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_7", param2=p2st12a}) end
        if s.name == "stones:strubl_7"	then 
		p2st12b = s.param2
		minetest.env:set_node(p, {name="stones:stair_7", param2=p2st12b}) end
        if s.name == "stones:stair_5"	then 
		p2st13a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_5", param2=p2st13a}) end
        if s.name == "stones:strubl_5"	then 
		p2st13b = s.param2
		minetest.env:set_node(p, {name="stones:stair_5", param2=p2st13b}) end
        if s.name == "stones:stair_941"	then 
		p2st14a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_941", param2=p2st14a}) end
        if s.name == "stones:strubl_941"	then 
		p2st14b = s.param2
		minetest.env:set_node(p, {name="stones:stair_941", param2=p2st14b}) end
        if s.name == "stones:stair_5of14"	then 
		p2st15a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_5of14", param2=p2st15a}) end
        if s.name == "stones:strubl_5of14"	then 
		p2st15b = s.param2
		minetest.env:set_node(p, {name="stones:stair_5of14", param2=p2st15b}) end
        if s.name == "stones:stair_3_inner"	then 
		p2st16a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_3_inner", param2=p2st16a}) end
        if s.name == "stones:strubl_3_inner"	then 
		p2st16b = s.param2
		minetest.env:set_node(p, {name="stones:stair_3_inner", param2=p2st16b}) end
        if s.name == "stones:stair_2of3_inner"	then 
		p2st17a = s.param2
		minetest.env:set_node(p, {name="stones:strubl_2of3_inner", param2=p2st17a}) end
        if s.name == "stones:strubl_2of3_inner"	then 
		p2st17b = s.param2
		minetest.env:set_node(p, {name="stones:stair_2of3_inner", param2=p2st17b}) end
        if s.name == "stones:steps"	then 
		p2stpa = s.param2
		minetest.env:set_node(p, {name="stones:stru", param2=p2stpa}) end
        if s.name == "stones:stru"	then 
		p2stpb = s.param2
		minetest.env:set_node(p, {name="stones:steps", param2=p2stpb}) end
        if s.name == "stones:vr"	then 
		p2v1a = s.param2
		minetest.env:set_node(p, {name="stones:vrbl", param2=p2v1a}) end
        if s.name == "stones:vrbl"	then 
		p2v1b = s.param2
		minetest.env:set_node(p, {name="stones:vr", param2=p2v1b}) end
        if s.name == "stones:vr_2"	then 
		p2v2a = s.param2
		minetest.env:set_node(p, {name="stones:vrbl_2", param2=p2v2a}) end
        if s.name == "stones:vrbl_2"	then 
		p2v2b = s.param2
		minetest.env:set_node(p, {name="stones:vr_2", param2=p2v2b}) end
        if s.name == "stones:vr_2u"	then 
		p2v3a = s.param2
		minetest.env:set_node(p, {name="stones:vrbl_2u", param2=p2v3a}) end
        if s.name == "stones:vrbl_2u"	then 
		p2v3b = s.param2
		minetest.env:set_node(p, {name="stones:vr_2u", param2=p2v3b}) end
        if s.name == "stones:vsect"	then 
		p2v4a = s.param2
		minetest.env:set_node(p, {name="stones:vsectr", param2=p2v4a}) end
        if s.name == "stones:vsectr"	then 
		p2v4b = s.param2
		minetest.env:set_node(p, {name="stones:vsect", param2=p2v4b}) end
        if s.name == "stones:vsect_2"	then 
		p2v5a = s.param2
		minetest.env:set_node(p, {name="stones:vsectr_2", param2=p2v5a}) end
        if s.name == "stones:vsectr_2"	then 
		p2v5b = s.param2
		minetest.env:set_node(p, {name="stones:vsect_2", param2=p2v5b}) end
        if s.name == "stones:vsect_2u"	then 
		p2v6a = s.param2
		minetest.env:set_node(p, {name="stones:vsectr_2u", param2=p2v6a}) end
        if s.name == "stones:vsectr_2u"	then 
		p2v6b = s.param2
		minetest.env:set_node(p, {name="stones:vsect_2u", param2=p2v6b}) end
        if s.name == "stones:vsedr"	then 
		p2v7a = s.param2
		minetest.env:set_node(p, {name="stones:vsrud", param2=p2v7a}) end
        if s.name == "stones:vsrud"	then 
		p2v7b = s.param2
		minetest.env:set_node(p, {name="stones:vsedr", param2=p2v7b}) end
        if s.name == "stones:vsedl"	then 
		p2v8a = s.param2
		minetest.env:set_node(p, {name="stones:vsudl", param2=p2v8a}) end
        if s.name == "stones:vsudl"	then 
		p2v8b = s.param2
		minetest.env:set_node(p, {name="stones:vsedl", param2=p2v8b}) end
	end

minetest.add_particlespawner({
		amount = 10+math.random(1,10),
		time = 5+math.random(1,10),
		glow = 14,
		pos = minetest.env:get_node(self.object:getpos()),
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=-0.2+math.sin(pos.x), y=-0.2+math.sin(pos.x), z=-0.2+math.cos(pos.x)},
		maxvel = {x=0.2+math.sin(pos.x), y=0.8+math.sin(pos.x), z=0.2+math.cos(pos.x)},
		minacc = {x=-0.2+math.sin(pos.x), y=-0.8+math.sin(pos.x), z=-0.2+math.cos(pos.x)},
		maxacc = {x=0.2+math.cos(pos.x), y=0.2+math.sin(pos.x), z=0.2-math.sin(pos.x)},
		exptime = {min=2, max=5},
		collisiondetection = true,
		collision_removal = false,
		texpool = {
			{name = "glypy20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/20),y=(math.random(10,20)/20)}}}}
		})
end
end end
})

minetest.register_tool("tool:pok", {
	description = "Popper",
	inventory_image = "smokestaff.png",
	on_use = function(itemstack, placer, pointed_thing)
		local dir = placer:get_look_dir();
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x, y=playerpos.y+1.618+dir.y, z=playerpos.z+0+dir.z}, "tool:pow")
		local acc = {x=dir.x*0, y=-10, z=dir.z*0}
		local vec = {x=dir.x*3, y=dir.y*3+3, z=dir.z*3}
		obj:setacceleration(acc)
		obj:setvelocity(vec)
		return itemstack
	end,
	on_drop = function(itemstack, dropper, pos)
		local dir = dropper:get_look_dir();
		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
		minetest.add_item(pos, "tool:rok")
		itemstack:take_item()
		return itemstack
	end,
	light_source = 12,
})

minetest.register_tool("tool:rok", {
	description = "Rubler",
	inventory_image = "wokestaff.png",
	on_use = function(itemstack, placer, pointed_thing)
		local dir = placer:get_look_dir();
		local playerpos = placer:getpos();
		local obj = minetest.env:add_entity({x=playerpos.x+0+dir.x, y=playerpos.y+1.618+dir.y, z=playerpos.z+0+dir.z}, "tool:row")
		local acc = {x=0, y=-1, z=0}
		local vec = {x=dir.x*4, y=dir.y*4, z=dir.z*4}
		obj:setacceleration(acc)
		obj:setvelocity(vec)
		return itemstack
	end,
	on_drop = function(itemstack, dropper, pos)
		local dir = dropper:get_look_dir();
		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
		minetest.add_item(pos, "tool:pok")
		itemstack:take_item()
		return itemstack
	end,
	light_source = 5,
    groups = {not_in_creative_inventory=1}
})

minetest.register_craft({
	output = "tool:pok",
	recipe = {{"tool:rok"}}
})

minetest.register_craft({
	output = "tool:rok",
	recipe = {{"tool:pok"}}
})
