
--[[to do: register runes:rune_bu as the non-glowing rune, and default:rune_bu_glowing as the node timer that turns to regular stone.]]

rune_bu = {}
rune_ke = {}
rune_hui = {}


-- creative check
local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function is_creative(name)
	return creative_mode_cache or minetest.check_player_privs(name, {creative = true})
end

minetest.register_node("runes:lit_bu", {
	description = "Bu = Not",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", {name = "rock_1x24.png^opaq_1x24.png^rune_bu_ani.png", animation = {type = "vertical_frames", length = 5.0}}},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:bu",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
})

minetest.register_node("runes:bu", {
	description = "Bu = Not",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"rock.png^[transformR90",
		"rock.png^[transformFX",
		"rock.png", "rock.png",
--[[{name = "rune_bu_glowing.png", animation = {type = "vertical_frames", length = 60.0}}]]
		"rock.png^[transformR270", "rock.png^runelay_bu.png"
		},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:bu',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("runes:lit_ke", {
	description = "Ke = May",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^opaq.png", "rock.png^opaq.png", {name = "rock_1x24.png^opaq_1x24.png^rune_ke_ani.png", animation = {type = "vertical_frames", length = 4.0}}, "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:ke",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("runes:ke", {
	description = "Ke = May",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^[transformR270",
		"rock.png^[transformR90",
		"rock.png^runelay_ke.png", 
        "rock.png^[transformFX",
		"rock.png", "rock.png"},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:ke',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("runes:lit_hui", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="runestone_1x24.png", animation = {type = "vertical_frames", length=3.0}}, "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:hui",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = {x=pos.x,y=pos.y,z=pos.z}
		s = minetest.env:get_node(pos)
		minetest.env:remove_node(wpos)
		minetest.set_node(wpos, {name="runes:hui", param2 = s.param2})
		local tpos = {x=pos.x,y=pos.y+1,z=pos.z}
		local hpos = {x=pos.x,y=pos.y,z=pos.z+1}
		local fpos = {x=pos.x,y=pos.y,z=pos.z-1}
		local rpos = {x=pos.x+1,y=pos.y,z=pos.z}
		local lpos = {x=pos.x-1,y=pos.y,z=pos.z}
		local bpos = {x=pos.x,y=pos.y-1,z=pos.z}
		if math.floor(s.param2/4) == 0 then
			minetest.set_node(tpos, {name="tool:prup", param2 = 0})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 1 then 
			minetest.set_node(hpos, {name="tool:prup", param2 = 4})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 2 then
			minetest.set_node(fpos, {name="tool:prup", param2 = 8})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 3 then
			minetest.set_node(rpos, {name="tool:prup", param2 = 12})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 4 then
			minetest.set_node(lpos, {name="tool:prup", param2 = 16})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 5 then
			minetest.set_node(bpos, {name="tool:prup", param2 = 20})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		end 

	end
})

minetest.register_node("runes:lit_hui_tempo", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="runestone_1x24.png", animation = {type = "vertical_frames", length=3.0}}, "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:hui",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = {x=pos.x,y=pos.y,z=pos.z}
		s = minetest.env:get_node(pos)
		minetest.env:remove_node(wpos)
		minetest.set_node(wpos, {name="runes:hui", param2 = s.param2})
		local tpos = {x=pos.x,y=pos.y+1,z=pos.z}
		local hpos = {x=pos.x,y=pos.y,z=pos.z+1}
		local fpos = {x=pos.x,y=pos.y,z=pos.z-1}
		local rpos = {x=pos.x+1,y=pos.y,z=pos.z}
		local lpos = {x=pos.x-1,y=pos.y,z=pos.z}
		local bpos = {x=pos.x,y=pos.y-1,z=pos.z}
		if math.floor(s.param2/4) == 0 then
			minetest.set_node(tpos, {name="tool:prup", param2 = 0})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 1 then 
			minetest.set_node(hpos, {name="tool:prup", param2 = 4})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 2 then
			minetest.set_node(fpos, {name="tool:prup", param2 = 8})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 3 then
			minetest.set_node(rpos, {name="tool:prup", param2 = 12})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 4 then
			minetest.set_node(lpos, {name="tool:prup", param2 = 16})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 5 then
			minetest.set_node(bpos, {name="tool:prup", param2 = 20})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		end 

	end
})

minetest.register_node("runes:hui", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"runestone.png", "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:hui',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_abm({
    nodenames = {"runes:hui"},
    interval = 3,
    chance = 75,
    action = function(pos, node)
        minetest.env:remove_node(pos)
        minetest.set_node(pos, {name = "runes:lit_hui_tempo", param2 = node.param2})
	minetest.add_particlespawner({
		amount = math.random(1,2),
		time = math.random(1,2),
		glow = 14,
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=-0.1+math.sin(pos.x), y=-0.1+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxvel = {x=0.1+math.sin(pos.x), y=0.4+math.sin(pos.x), z=0.1+math.cos(pos.x)},
		minacc = {x=-0.1+math.sin(pos.x), y=-0.4+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxacc = {x=0.1+math.cos(pos.x), y=0.1+math.sin(pos.x), z=0.1-math.sin(pos.x)},
		exptime = {min=2, max=5},
		collisiondetection = true,
		collision_removal = false,
		texpool = {
			{name = "glypy20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/40),y=(math.random(10,20)/40)}}}}
		})
    end
})

minetest.register_abm({
    nodenames = {"runes:lit_hui_tempo"},
    interval = 2,
    chance = 2,
    action = function(pos, node)
        minetest.env:remove_node(pos)
        minetest.set_node(pos, {name = "runes:hui", param2 = node.param2})
	minetest.add_particlespawner({
		amount = math.random(1,2),
		time = math.random(1,2),
		glow = 14,
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=-0.1+math.sin(pos.x), y=-0.1+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxvel = {x=0.1+math.sin(pos.x), y=0.4+math.sin(pos.x), z=0.1+math.cos(pos.x)},
		minacc = {x=-0.1+math.sin(pos.x), y=-0.4+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxacc = {x=0.1+math.cos(pos.x), y=0.1+math.sin(pos.x), z=0.1-math.sin(pos.x)},
		exptime = {min=2, max=5},
		collisiondetection = true,
		collision_removal = false,
		texpool = {
			{name = "glypy20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/40),y=(math.random(10,20)/40)}}}}
		})
    end
})

function c(n)
	return n/32-1/2
end

minetest.register_node("runes:nbdx1", {
	description = "Niu Bi Da Xue Yi",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", "rock.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx1",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(1),c(32),c(10)},
	{c(1),c(0),c(0), c(2),c(32),c(13)},
	{c(2),c(0),c(0), c(3),c(32),c(15)},
	{c(3),c(0),c(0), c(4),c(32),c(17)},
	{c(4),c(0),c(0), c(5),c(32),c(18)},
	{c(5),c(0),c(0), c(6),c(32),c(19)},
	{c(6),c(0),c(0), c(7),c(32),c(20)},
	{c(7),c(0),c(0), c(8),c(32),c(22)},
	{c(8),c(0),c(0), c(9),c(32),c(23)},
	{c(9),c(0),c(0), c(10),c(32),c(24)},
	{c(10),c(0),c(0), c(12),c(32),c(25)},
	{c(12),c(0),c(0), c(13),c(32),c(26)},
	{c(13),c(0),c(0), c(14),c(32),c(27)},
	{c(14),c(0),c(0), c(15),c(32),c(28)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(19),c(32),c(30)},
	{c(19),c(0),c(0), c(22),c(32),c(31)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx1c", {
	description = "Niu Bi Da Xue Yi Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1c_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", "rock.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx1c",
	node_box = {type = "fixed", fixed = {
	{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}},
})

minetest.register_node("runes:rbdx1", {
	description = "Ru Bli Da Xue Yi",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", "rubble.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:rbdx1",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(1),c(32),c(10)},
	{c(1),c(0),c(0), c(2),c(32),c(13)},
	{c(2),c(0),c(0), c(3),c(32),c(15)},
	{c(3),c(0),c(0), c(4),c(32),c(17)},
	{c(4),c(0),c(0), c(5),c(32),c(18)},
	{c(5),c(0),c(0), c(6),c(32),c(19)},
	{c(6),c(0),c(0), c(7),c(32),c(20)},
	{c(7),c(0),c(0), c(8),c(32),c(22)},
	{c(8),c(0),c(0), c(9),c(32),c(23)},
	{c(9),c(0),c(0), c(10),c(32),c(24)},
	{c(10),c(0),c(0), c(12),c(32),c(25)},
	{c(12),c(0),c(0), c(13),c(32),c(26)},
	{c(13),c(0),c(0), c(14),c(32),c(27)},
	{c(14),c(0),c(0), c(15),c(32),c(28)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(19),c(32),c(30)},
	{c(19),c(0),c(0), c(22),c(32),c(31)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx1c", {
	description = "Ru Bli Da Xue Yi Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx1c_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", "rubble.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:rbdx1c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx2", {
	description = "Niu Bi Da Xue Er",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2",
	node_box = {type = "fixed", fixed = {
	{c(0), c(0), c(0), c(10), c(32), c(32)},
	{c(10),c(0),c(0), c(13),c(32),c(31)},
	{c(13),c(0),c(0), c(15),c(32),c(30)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(18),c(32),c(28)},
	{c(18),c(0),c(0), c(19),c(32),c(27)},
	{c(19),c(0),c(0), c(20),c(32),c(26)},
	{c(20),c(0),c(0), c(22),c(32),c(25)},
	{c(22),c(0),c(0), c(23),c(32),c(24)},
	{c(23),c(0),c(0), c(24),c(32),c(23)},
	{c(24),c(0),c(0), c(25),c(32),c(22)},
	{c(25),c(0),c(0), c(26),c(32),c(20)},
	{c(26),c(0),c(0), c(27),c(32),c(19)},
	{c(27),c(0),c(0), c(28),c(32),c(18)},
	{c(28),c(0),c(0), c(29),c(32),c(17)},
	{c(29),c(0),c(0), c(30),c(32),c(15)},	
	{c(30),c(0),c(0), c(31),c(32),c(13)},
	{c(31),c(0),c(0), c(32),c(32),c(10)}}},
})

minetest.register_node("runes:nbdx2c", {
	description = "Niu Bi Da Xue Er Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2c_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx2", {
	description = "Ru Bli Da Xue Er",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2",
	node_box = {type = "fixed", fixed = {
	{c(0), c(0), c(0), c(10), c(32), c(32)},
	{c(10),c(0),c(0), c(13),c(32),c(31)},
	{c(13),c(0),c(0), c(15),c(32),c(30)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(18),c(32),c(28)},
	{c(18),c(0),c(0), c(19),c(32),c(27)},
	{c(19),c(0),c(0), c(20),c(32),c(26)},
	{c(20),c(0),c(0), c(22),c(32),c(25)},
	{c(22),c(0),c(0), c(23),c(32),c(24)},
	{c(23),c(0),c(0), c(24),c(32),c(23)},
	{c(24),c(0),c(0), c(25),c(32),c(22)},
	{c(25),c(0),c(0), c(26),c(32),c(20)},
	{c(26),c(0),c(0), c(27),c(32),c(19)},
	{c(27),c(0),c(0), c(28),c(32),c(18)},
	{c(28),c(0),c(0), c(29),c(32),c(17)},
	{c(29),c(0),c(0), c(30),c(32),c(15)},	
	{c(30),c(0),c(0), c(31),c(32),c(13)},
	{c(31),c(0),c(0), c(32),c(32),c(10)}}},
})

minetest.register_node("runes:rbdx2c", {
	description = "Ru Bli Da Xue Er Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx2c_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx3", {
	description = "Niu Bi Da Xue San",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(10),c(32),c(32)},
	{c(10),c(0),c(1), c(13),c(32),c(32)},
	{c(13),c(0),c(2), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(4), c(18),c(32),c(32)},
	{c(18),c(0),c(5), c(19),c(32),c(32)},
	{c(19),c(0),c(6), c(20),c(32),c(32)},
	{c(20),c(0),c(7), c(22),c(32),c(32)},
	{c(22),c(0),c(8), c(23),c(32),c(32)},
	{c(23),c(0),c(9), c(24),c(32),c(32)},
	{c(24),c(0),c(10), c(25),c(32),c(32)},
	{c(25),c(0),c(12), c(26),c(32),c(32)},
	{c(26),c(0),c(13), c(27),c(32),c(32)},
	{c(27),c(0),c(14), c(28),c(32),c(32)},
	{c(28),c(0),c(15), c(29),c(32),c(32)},
	{c(29),c(0),c(17), c(30),c(32),c(32)},
	{c(30),c(0),c(19), c(31),c(32),c(32)},
	{c(31),c(0),c(22), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx3c", {
	description = "Niu Bi Da Xue San Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3c_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx3", {
	description = "Ru Bli Da Xue San",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(10),c(32),c(32)},
	{c(10),c(0),c(1), c(13),c(32),c(32)},
	{c(13),c(0),c(2), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(4), c(18),c(32),c(32)},
	{c(18),c(0),c(5), c(19),c(32),c(32)},
	{c(19),c(0),c(6), c(20),c(32),c(32)},
	{c(20),c(0),c(7), c(22),c(32),c(32)},
	{c(22),c(0),c(8), c(23),c(32),c(32)},
	{c(23),c(0),c(9), c(24),c(32),c(32)},
	{c(24),c(0),c(10), c(25),c(32),c(32)},
	{c(25),c(0),c(12), c(26),c(32),c(32)},
	{c(26),c(0),c(13), c(27),c(32),c(32)},
	{c(27),c(0),c(14), c(28),c(32),c(32)},
	{c(28),c(0),c(15), c(29),c(32),c(32)},
	{c(29),c(0),c(17), c(30),c(32),c(32)},
	{c(30),c(0),c(19), c(31),c(32),c(32)},
	{c(31),c(0),c(22), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx3c", {
	description = "Ru Bli Da Xue San Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx3c_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx4", {
	description = "Niu Bi Da Xue Si",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4c",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(22), c(1),c(32),c(32)},
	{c(1),c(0),c(19), c(2),c(32),c(32)},
	{c(2),c(0),c(17), c(3),c(32),c(32)},
	{c(3),c(0),c(15), c(4),c(32),c(32)},
	{c(4),c(0),c(14), c(5),c(32),c(32)},
	{c(5),c(0),c(13), c(6),c(32),c(32)},
	{c(6),c(0),c(12), c(7),c(32),c(32)},
	{c(7),c(0),c(10), c(8),c(32),c(32)},
	{c(8),c(0),c(9), c(9),c(32),c(32)},
	{c(9),c(0),c(8), c(10),c(32),c(32)},
	{c(10),c(0),c(7), c(12),c(32),c(32)},
	{c(12),c(0),c(6), c(13),c(32),c(32)},
	{c(13),c(0),c(5), c(14),c(32),c(32)},
	{c(14),c(0),c(4), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(2), c(19),c(32),c(32)},
	{c(19),c(0),c(1), c(22),c(32),c(32)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx4c", {
	description = "Niu Bi Da Xue Si Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4c_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx4", {
	description = "Ru Bli Da Xue Si",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(22), c(1),c(32),c(32)},
	{c(1),c(0),c(19), c(2),c(32),c(32)},
	{c(2),c(0),c(17), c(3),c(32),c(32)},
	{c(3),c(0),c(15), c(4),c(32),c(32)},
	{c(4),c(0),c(14), c(5),c(32),c(32)},
	{c(5),c(0),c(13), c(6),c(32),c(32)},
	{c(6),c(0),c(12), c(7),c(32),c(32)},
	{c(7),c(0),c(10), c(8),c(32),c(32)},
	{c(8),c(0),c(9), c(9),c(32),c(32)},
	{c(9),c(0),c(8), c(10),c(32),c(32)},
	{c(10),c(0),c(7), c(12),c(32),c(32)},
	{c(12),c(0),c(6), c(13),c(32),c(32)},
	{c(13),c(0),c(5), c(14),c(32),c(32)},
	{c(14),c(0),c(4), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(2), c(19),c(32),c(32)},
	{c(19),c(0),c(1), c(22),c(32),c(32)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx4c", {
	description = "Ru Bli Da Xue Si Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx4c_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5,}}},
})

minetest.register_node("runes:0ur", {
	description = "0◣ red",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0red.png",
	tiles = {{name = "0ur_1x32.png",
		animation = {type = "vertical_frames",
		length = 25.8129}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0rd",
	node_box={type="fixed",fixed={
	{-0.5625,-0.5,-0.0625,-0.4375,-0.4875,0},
	{-0.4375,-0.5,-0.125,-0.375,-0.4875,-0.0625},
	{-0.375,-0.5,-0.1875,-0.3125,-0.4875,-0.125},
	{-0.3125,-0.5,-0.25,-0.25,-0.4875,-0.1875},
	{-0.25,-0.5,-0.3125,-0.1875,-0.4875,-0.25},
	{-0.1875,-0.5,-0.375,-0.125,-0.4875,-0.3125},
	{-0.125,-0.5,-0.4375,-0.0625,-0.4875,-0.375},
	{-0.0625,-0.5,-0.5625,0,-0.4875,-0.4375},
	{-0.125,-0.5,-0.625,-0.0625,-0.4875,-0.5625},
	{-0.1875,-0.5,-0.6875,-0.125,-0.4875,-0.625},
	{-0.25,-0.5,-0.75,-0.1875,-0.4875,-0.6875},
	{-0.3125,-0.5,-0.8125,-0.25,-0.4875,-0.75},
	{-0.375,-0.5,-0.875,-0.3125,-0.4875,-0.8125},
	{-0.4375,-0.5,-0.9325,-0.375,-0.4875,-0.875},
	{-0.5625,-0.5,-1,-0.4375,-0.4875,-0.9325},
	{-0.625,-0.5,-0.9325,-0.5625,-0.4875,-0.875},
	{-0.6875,-0.5,-0.875,-0.625,-0.4875,-0.8125},
	{-0.75,-0.5,-0.8125,-0.6875,-0.4875,-0.75},
	{-0.8125,-0.5,-0.75,-0.75,-0.4875,-0.6875},
	{-0.875,-0.5,-0.6875,-0.8125,-0.4875,-0.625},
	{-0.9375,-0.5,-0.625,-0.875,-0.4875,-0.5625},
	{-1,-0.5,-0.5625,-0.9375,-0.4875,-0.4375},
	{-0.9375,-0.5,-0.4375,-0.875,-0.4875,-0.375},
	{-0.875,-0.5,-0.375,-0.8125,-0.4875,-0.3125},
	{-0.8125,-0.5,-0.3125,-0.75,-0.4875,-0.25},
	{-0.75,-0.5,-0.25,-0.6875,-0.4875,-0.1875},
	{-0.6875,-0.5,-0.1875,-0.625,-0.4875,-0.125},
	{-0.625,-0.5,-0.125,-0.5625,-0.4875,-0.0625}}},
	collision_box={type="fixed",fixed={
	{-0.5625,-0.5,-0.0625,-0.4375,-0.4875,0},
	{-0.4375,-0.5,-0.125,-0.375,-0.4875,-0.0625},
	{-0.375,-0.5,-0.1875,-0.3125,-0.4875,-0.125},
	{-0.3125,-0.5,-0.25,-0.25,-0.4875,-0.1875},
	{-0.25,-0.5,-0.3125,-0.1875,-0.4875,-0.25},
	{-0.1875,-0.5,-0.375,-0.125,-0.4875,-0.3125},
	{-0.125,-0.5,-0.4375,-0.0625,-0.4875,-0.375},
	{-0.0625,-0.5,-0.5625,0,-0.4875,-0.4375},
	{-0.125,-0.5,-0.625,-0.0625,-0.4875,-0.5625},
	{-0.1875,-0.5,-0.6875,-0.125,-0.4875,-0.625},
	{-0.25,-0.5,-0.75,-0.1875,-0.4875,-0.6875},
	{-0.3125,-0.5,-0.8125,-0.25,-0.4875,-0.75},
	{-0.375,-0.5,-0.875,-0.3125,-0.4875,-0.8125},
	{-0.4375,-0.5,-0.9325,-0.375,-0.4875,-0.875},
	{-0.5625,-0.5,-1,-0.4375,-0.4875,-0.9325},
	{-0.625,-0.5,-0.9325,-0.5625,-0.4875,-0.875},
	{-0.6875,-0.5,-0.875,-0.625,-0.4875,-0.8125},
	{-0.75,-0.5,-0.8125,-0.6875,-0.4875,-0.75},
	{-0.8125,-0.5,-0.75,-0.75,-0.4875,-0.6875},
	{-0.875,-0.5,-0.6875,-0.8125,-0.4875,-0.625},
	{-0.9375,-0.5,-0.625,-0.875,-0.4875,-0.5625},
	{-1,-0.5,-0.5625,-0.9375,-0.4875,-0.4375},
	{-0.9375,-0.5,-0.4375,-0.875,-0.4875,-0.375},
	{-0.875,-0.5,-0.375,-0.8125,-0.4875,-0.3125},
	{-0.8125,-0.5,-0.3125,-0.75,-0.4875,-0.25},
	{-0.75,-0.5,-0.25,-0.6875,-0.4875,-0.1875},
	{-0.6875,-0.5,-0.1875,-0.625,-0.4875,-0.125},
	{-0.625,-0.5,-0.125,-0.5625,-0.4875,-0.0625}}}
})

minetest.register_node("runes:0rd", {
	description = "0 red",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0red.png",
	tiles = {{name = "0rd_1x32.png",
		animation = {type = "vertical_frames",
		length = 25.8129}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0rd",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.4375, 0.0625,-0.4875,0.5},
{0.0625,-0.5,0.375, 0.125,-0.4875,0.4375},
{0.125,-0.5,0.3125, 0.1875,-0.4875,0.375},
{0.1875,-0.5,0.25, 0.25,-0.4875,0.3125},
{0.25,-0.5,0.1875, 0.3125,-0.4875,0.25},
{0.3125,-0.5,0.125, 0.375,-0.4875,0.1875},
{0.375,-0.5,0.0625, 0.4375,-0.4875,0.125},
{0.4375,-0.5,-0.0625, 0.5,-0.4875,0.0625},
{0.375,-0.5,-0.125, 0.4375,-0.4875,-0.0625},
{0.3125,-0.5,-0.1875, 0.375,-0.4875,-0.125},
{0.25,-0.5,-0.25, 0.3125,-0.4875,-0.1875},
{0.1875,-0.5,-0.3125, 0.25,-0.4875,-0.25},
{0.125,-0.5,-0.375, 0.1875,-0.4875,-0.3125},
{0.0625,-0.5,-0.4325, 0.125,-0.4875,-0.375},
{-0.0625,-0.5,-0.5, 0.0625,-0.4875,-0.4325},
{-0.125,-0.5,-0.4325, -0.0625,-0.4875,-0.375},
{-0.1875,-0.5,-0.375, -0.125,-0.4875,-0.3125},
{-0.25,-0.5,-0.3125, -0.1875,-0.4875,-0.25},
{-0.3125,-0.5,-0.25, -0.25,-0.4875,-0.1875},
{-0.375,-0.5,-0.1875, -0.3125,-0.4875,-0.125},
{-0.4375,-0.5,-0.125, -0.375,-0.4875,-0.0625},
{-0.5,-0.5,-0.0625, -0.4375,-0.4875,0.0625},
{-0.4375,-0.5,0.0625, -0.375,-0.4875,0.125},
{-0.375,-0.5,0.125, -0.3125,-0.4875,0.1875},
{-0.3125,-0.5,0.1875, -0.25,-0.4875,0.25},
{-0.25,-0.5,0.25, -0.1875,-0.4875,0.3125},
{-0.1875,-0.5,0.3125, -0.125,-0.4875,0.375},
{-0.125,-0.5,0.375, -0.0625,-0.4875,0.4375}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.4375, 0.0625,-0.4875,0.5},
{0.0625,-0.5,0.375, 0.125,-0.4875,0.4375},
{0.125,-0.5,0.3125, 0.1875,-0.4875,0.375},
{0.1875,-0.5,0.25, 0.25,-0.4875,0.3125},
{0.25,-0.5,0.1875, 0.3125,-0.4875,0.25},
{0.3125,-0.5,0.125, 0.375,-0.4875,0.1875},
{0.375,-0.5,0.0625, 0.4375,-0.4875,0.125},
{0.4375,-0.5,-0.0625, 0.5,-0.4875,0.0625},
{0.375,-0.5,-0.125, 0.4375,-0.4875,-0.0625},
{0.3125,-0.5,-0.1875, 0.375,-0.4875,-0.125},
{0.25,-0.5,-0.25, 0.3125,-0.4875,-0.1875},
{0.1875,-0.5,-0.3125, 0.25,-0.4875,-0.25},
{0.125,-0.5,-0.375, 0.1875,-0.4875,-0.3125},
{0.0625,-0.5,-0.4325, 0.125,-0.4875,-0.375},
{-0.0625,-0.5,-0.5, 0.0625,-0.4875,-0.4325},
{-0.125,-0.5,-0.4325, -0.0625,-0.4875,-0.375},
{-0.1875,-0.5,-0.375, -0.125,-0.4875,-0.3125},
{-0.25,-0.5,-0.3125, -0.1875,-0.4875,-0.25},
{-0.3125,-0.5,-0.25, -0.25,-0.4875,-0.1875},
{-0.375,-0.5,-0.1875, -0.3125,-0.4875,-0.125},
{-0.4375,-0.5,-0.125, -0.375,-0.4875,-0.0625},
{-0.5,-0.5,-0.0625, -0.4375,-0.4875,0.0625},
{-0.4375,-0.5,0.0625, -0.375,-0.4875,0.125},
{-0.375,-0.5,0.125, -0.3125,-0.4875,0.1875},
{-0.3125,-0.5,0.1875, -0.25,-0.4875,0.25},
{-0.25,-0.5,0.25, -0.1875,-0.4875,0.3125},
{-0.1875,-0.5,0.3125, -0.125,-0.4875,0.375},
{-0.125,-0.5,0.375, -0.0625,-0.4875,0.4375}}}
})

minetest.register_node("runes:0br", {
	description = "0◤ blue",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0blue.png",
	tiles = {{name = "0br_1x28.png",
		animation = {type = "vertical_frames",
		length = 12}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0be",
	node_box={type="fixed",fixed={
	{-0.5625,-0.5,0.875,-0.4375,-0.4875,0.9375},
	{-0.4375,-0.5,0.8125,-0.375,-0.4875,0.875},
	{-0.375,-0.5,0.75,-0.3125,-0.4875,0.8125},
	{-0.3125,-0.5,0.6875,-0.25,-0.4875,0.75},
	{-0.25,-0.5,0.625,-0.1875,-0.4875,0.6875},
	{-0.1875,-0.5,0.5625,-0.125,-0.4875,0.625},
	{-0.125,-0.5,0.4375,-0.0625,-0.4875,0.5625},
	{-0.1875,-0.5,0.375,-0.125,-0.4875,0.4375},
	{-0.25,-0.5,0.3125,-0.1875,-0.4875,0.375},
	{-0.3125,-0.5,0.25,-0.25,-0.4875,0.3125},
	{-0.375,-0.5,0.1875,-0.3125,-0.4875,0.25},
	{-0.4375,-0.5,0.125,-0.375,-0.4875,0.1875},
	{-0.5625,-0.5,0.0625,-0.4375,-0.4875,0.125},
	{-0.625,-0.5,0.125,-0.5625,-0.4875,0.1875},
	{-0.6875,-0.5,0.1875,-0.625,-0.4875,0.25},
	{-0.75,-0.5,0.25,-0.6875,-0.4875,0.3125},
	{-0.8125,-0.5,0.3125,-0.75,-0.4875,0.375},
	{-0.875,-0.5,0.375,-0.8125,-0.4875,0.4375},
	{-0.9375,-0.5,0.4375,-0.875,-0.4875,0.5625},
	{-0.875,-0.5,0.5625,-0.8175,-0.4875,0.625},
	{-0.8125,-0.5,0.625,-0.75,-0.4875,0.6875},
	{-0.75,-0.5,0.6875,-0.6875,-0.4875,0.75},
	{-0.6875,-0.5,0.75,-0.625,-0.4875,0.8125},
	{-0.625,-0.5,0.8125,-0.5625,-0.4875,0.875}}},
	collision_box={type="fixed",fixed={
	{-0.5625,-0.5,0.875,-0.4375,-0.4875,0.9375},
	{-0.4375,-0.5,0.8125,-0.375,-0.4875,0.875},
	{-0.375,-0.5,0.75,-0.3125,-0.4875,0.8125},
	{-0.3125,-0.5,0.6875,-0.25,-0.4875,0.75},
	{-0.25,-0.5,0.625,-0.1875,-0.4875,0.6875},
	{-0.1875,-0.5,0.5625,-0.125,-0.4875,0.625},
	{-0.125,-0.5,0.4375,-0.0625,-0.4875,0.5625},
	{-0.1875,-0.5,0.375,-0.125,-0.4875,0.4375},
	{-0.25,-0.5,0.3125,-0.1875,-0.4875,0.375},
	{-0.3125,-0.5,0.25,-0.25,-0.4875,0.3125},
	{-0.375,-0.5,0.1875,-0.3125,-0.4875,0.25},
	{-0.4375,-0.5,0.125,-0.375,-0.4875,0.1875},
	{-0.5625,-0.5,0.0625,-0.4375,-0.4875,0.125},
	{-0.625,-0.5,0.125,-0.5625,-0.4875,0.1875},
	{-0.6875,-0.5,0.1875,-0.625,-0.4875,0.25},
	{-0.75,-0.5,0.25,-0.6875,-0.4875,0.3125},
	{-0.8125,-0.5,0.3125,-0.75,-0.4875,0.375},
	{-0.875,-0.5,0.375,-0.8125,-0.4875,0.4375},
	{-0.9375,-0.5,0.4375,-0.875,-0.4875,0.5625},
	{-0.875,-0.5,0.5625,-0.8175,-0.4875,0.625},
	{-0.8125,-0.5,0.625,-0.75,-0.4875,0.6875},
	{-0.75,-0.5,0.6875,-0.6875,-0.4875,0.75},
	{-0.6875,-0.5,0.75,-0.625,-0.4875,0.8125},
	{-0.625,-0.5,0.8125,-0.5625,-0.4875,0.875}}}
})

minetest.register_node("runes:0be", {
	description = "0 blue",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0blue.png",
	tiles = {{name = "0be_1x28.png",
		animation = {type = "vertical_frames",
		length = 12}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1},
	drop = "runes:0be",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.375, 0.0625,-0.4875,0.4375},
{0.0625,-0.5,0.3125, 0.125,-0.4875,0.375},
{0.125,-0.5,0.25, 0.1875,-0.4875,0.3125},
{0.1875,-0.5,0.1875, 0.25,-0.4875,0.25},
{0.25,-0.5,0.125, 0.3125,-0.4875,0.1875},
{0.3125,-0.5,0.0625, 0.375,-0.4875,0.125},
{0.375,-0.5,-0.0625, 0.4375,-0.4875,0.0625},
{0.3125,-0.5,-0.125, 0.375,-0.4875,-0.0625},
{0.25,-0.5,-0.1875, 0.3125,-0.4875,-0.125},
{0.1875,-0.5,-0.25, 0.25,-0.4875,-0.1875},
{0.125,-0.5,-0.3125, 0.1875,-0.4875,-0.25},
{0.0625,-0.5,-0.375, 0.125,-0.4875,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.4875,-0.375},
{-0.125,-0.5,-0.375, -0.0625,-0.4875,-0.3125},
{-0.1875,-0.5,-0.3125, -0.125,-0.4875,-0.25},
{-0.25,-0.5,-0.25, -0.1875,-0.4875,-0.1875},
{-0.3125,-0.5,-0.1875, -0.25,-0.4875,-0.125},
{-0.375,-0.5,-0.125, -0.3125,-0.4875,-0.0625},
{-0.4375,-0.5,-0.0625, -0.375,-0.4875,0.0625},
{-0.375,-0.5,0.0625, -0.3175,-0.4875,0.125},
{-0.3125,-0.5,0.125, -0.25,-0.4875,0.1875},
{-0.25,-0.5,0.1875, -0.1875,-0.4875,0.25},
{-0.1875,-0.5,0.25, -0.125,-0.4875,0.3125},
{-0.125,-0.5,0.3125, -0.0625,-0.4875,0.375}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.375, 0.0625,-0.4875,0.4375},
{0.0625,-0.5,0.3125, 0.125,-0.4875,0.375},
{0.125,-0.5,0.25, 0.1875,-0.4875,0.3125},
{0.1875,-0.5,0.1875, 0.25,-0.4875,0.25},
{0.25,-0.5,0.125, 0.3125,-0.4875,0.1875},
{0.3125,-0.5,0.0625, 0.375,-0.4875,0.125},
{0.375,-0.5,-0.0625, 0.4375,-0.4875,0.0625},
{0.3125,-0.5,-0.125, 0.375,-0.4875,-0.0625},
{0.25,-0.5,-0.1875, 0.3125,-0.4875,-0.125},
{0.1875,-0.5,-0.25, 0.25,-0.4875,-0.1875},
{0.125,-0.5,-0.3125, 0.1875,-0.4875,-0.25},
{0.0625,-0.5,-0.375, 0.125,-0.4875,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.4875,-0.375},
{-0.125,-0.5,-0.375, -0.0625,-0.4875,-0.3125},
{-0.1875,-0.5,-0.3125, -0.125,-0.4875,-0.25},
{-0.25,-0.5,-0.25, -0.1875,-0.4875,-0.1875},
{-0.3125,-0.5,-0.1875, -0.25,-0.4875,-0.125},
{-0.375,-0.5,-0.125, -0.3125,-0.4875,-0.0625},
{-0.4375,-0.5,-0.0625, -0.375,-0.4875,0.0625},
{-0.375,-0.5,0.0625, -0.3175,-0.4875,0.125},
{-0.3125,-0.5,0.125, -0.25,-0.4875,0.1875},
{-0.25,-0.5,0.1875, -0.1875,-0.4875,0.25},
{-0.1875,-0.5,0.25, -0.125,-0.4875,0.3125},
{-0.125,-0.5,0.3125, -0.0625,-0.4875,0.375}}}
})

minetest.register_node("runes:0bl", {
	description = "◥0 green",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0green.png",
	tiles = {{name = "0bl_1x24.png",
		animation = {type = "vertical_frames",
		length = 6.3405}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0gn",
	node_box={type="fixed",fixed={
	{0.4375,-0.5,0.8125,0.5625,-0.4875,0.875},
	{0.5625,-0.5,0.75,0.625,-0.4875,0.8125},
	{0.625,-0.5,0.6875,0.6875,-0.4875,0.75},
	{0.6875,-0.5,0.625,0.75,-0.4875,0.6875},
	{0.75,-0.5,0.5625,0.8125,-0.4875,0.625},
	{0.8125,-0.5,0.4375,0.875,-0.4875,0.5625},
	{0.75,-0.5,0.375,0.8125,-0.4875,0.4375},
	{0.6875,-0.5,0.3125,0.75,-0.4875,0.375},
	{0.625,-0.5,0.25,0.6875,-0.4875,0.3125},
	{0.5625,-0.5,0.1875,0.625,-0.4875,0.25},
	{0.4375,-0.5,0.125,0.5625,-0.4875,0.1875},
	{0.375,-0.5,0.1875,0.4375,-0.4875,0.25},
	{0.3125,-0.5,0.25,0.375,-0.4875,0.3125},
	{0.25,-0.5,0.3125,0.3125,-0.4875,0.375},
	{0.1875,-0.5,0.375,0.25,-0.4875,0.4375},
	{0.125,-0.5,0.4375,0.1875,-0.4875,0.5625},
	{0.1875,-0.5,0.5625,0.25,-0.4875,0.625},
	{0.25,-0.5,0.625,0.3125,-0.4875,0.6875},
	{0.3125,-0.5,0.6875,0.375,-0.4875,0.75},
	{0.375,-0.5,0.75,0.4375,-0.4875,0.8125}}},
	collision_box={type="fixed",fixed={
	{0.4375,-0.5,0.8125,0.5625,-0.4875,0.875},
	{0.5625,-0.5,0.75,0.625,-0.4875,0.8125},
	{0.625,-0.5,0.6875,0.6875,-0.4875,0.75},
	{0.6875,-0.5,0.625,0.75,-0.4875,0.6875},
	{0.75,-0.5,0.5625,0.8125,-0.4875,0.625},
	{0.8125,-0.5,0.4375,0.875,-0.4875,0.5625},
	{0.75,-0.5,0.375,0.8125,-0.4875,0.4375},
	{0.6875,-0.5,0.3125,0.75,-0.4875,0.375},
	{0.625,-0.5,0.25,0.6875,-0.4875,0.3125},
	{0.5625,-0.5,0.1875,0.625,-0.4875,0.25},
	{0.4375,-0.5,0.125,0.5625,-0.4875,0.1875},
	{0.375,-0.5,0.1875,0.4375,-0.4875,0.25},
	{0.3125,-0.5,0.25,0.375,-0.4875,0.3125},
	{0.25,-0.5,0.3125,0.3125,-0.4875,0.375},
	{0.1875,-0.5,0.375,0.25,-0.4875,0.4375},
	{0.125,-0.5,0.4375,0.1875,-0.4875,0.5625},
	{0.1875,-0.5,0.5625,0.25,-0.4875,0.625},
	{0.25,-0.5,0.625,0.3125,-0.4875,0.6875},
	{0.3125,-0.5,0.6875,0.375,-0.4875,0.75},
	{0.375,-0.5,0.75,0.4375,-0.4875,0.8125}}}
})

minetest.register_node("runes:0gn", {
	description = "0 green",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0green.png",
	tiles = {{name = "0gn_1x24.png",
		animation = {type = "vertical_frames",
		length = 6.3405}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0gn",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.3125, 0.0625,-0.4875,0.375},
{0.0625,-0.5,0.25, 0.125,-0.4875,0.3125},
{0.125,-0.5,0.1875, 0.1875,-0.4875,0.25},
{0.1875,-0.5,0.125, 0.25,-0.4875,0.1875},
{0.25,-0.5,0.0625, 0.3125,-0.4875,0.125},
{0.3125,-0.5,-0.0625, 0.375,-0.4875,0.0625},
{0.25,-0.5,-0.125, 0.3125,-0.4875,-0.0625},
{0.1875,-0.5,-0.1875, 0.25,-0.4875,-0.125},
{0.125,-0.5,-0.25, 0.1875,-0.4875,-0.1875},
{0.0625,-0.5,-0.3125, 0.125,-0.4875,-0.25},
{-0.0625,-0.5,-0.375, 0.0625,-0.4875,-0.3125},
{-0.125,-0.5,-0.3125, -0.0625,-0.4875,-0.25},
{-0.1875,-0.5,-0.25, -0.125,-0.4875,-0.1875},
{-0.25,-0.5,-0.1875, -0.1875,-0.4875,-0.125},
{-0.3125,-0.5,-0.125, -0.25,-0.4875,-0.0625},
{-0.375,-0.5,-0.0625, -0.3125,-0.4875,0.0625},
{-0.3125,-0.5,0.0625, -0.25,-0.4875,0.125},
{-0.25,-0.5,0.125, -0.1875,-0.4875,0.1875},
{-0.1875,-0.5,0.1875, -0.125,-0.4875,0.25},
{-0.125,-0.5,0.25, -0.0625,-0.4875,0.3125}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.3125, 0.0625,-0.4875,0.375},
{0.0625,-0.5,0.25, 0.125,-0.4875,0.3125},
{0.125,-0.5,0.1875, 0.1875,-0.4875,0.25},
{0.1875,-0.5,0.125, 0.25,-0.4875,0.1875},
{0.25,-0.5,0.0625, 0.3125,-0.4875,0.125},
{0.3125,-0.5,-0.0625, 0.375,-0.4875,0.0625},
{0.25,-0.5,-0.125, 0.3125,-0.4875,-0.0625},
{0.1875,-0.5,-0.1875, 0.25,-0.4875,-0.125},
{0.125,-0.5,-0.25, 0.1875,-0.4875,-0.1875},
{0.0625,-0.5,-0.3125, 0.125,-0.4875,-0.25},
{-0.0625,-0.5,-0.375, 0.0625,-0.4875,-0.3125},
{-0.125,-0.5,-0.3125, -0.0625,-0.4875,-0.25},
{-0.1875,-0.5,-0.25, -0.125,-0.4875,-0.1875},
{-0.25,-0.5,-0.1875, -0.1875,-0.4875,-0.125},
{-0.3125,-0.5,-0.125, -0.25,-0.4875,-0.0625},
{-0.375,-0.5,-0.0625, -0.3125,-0.4875,0.0625},
{-0.3125,-0.5,0.0625, -0.25,-0.4875,0.125},
{-0.25,-0.5,0.125, -0.1875,-0.4875,0.1875},
{-0.1875,-0.5,0.1875, -0.125,-0.4875,0.25},
{-0.125,-0.5,0.25, -0.0625,-0.4875,0.3125}}}
})

minetest.register_node("runes:0ul", {
	description = "◢0 black",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0black.png",
	tiles = {{name = "0ul_1x20.png",
		animation = {type = "vertical_frames",
		length = 2.0665}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0bk",
	node_box={type="fixed",fixed={
	{0.4375,-0.5,-0.25,0.5625,-0.4875,-0.1875},
	{0.5625,-0.5,-0.3125,0.625,-0.4875,-0.25},
	{0.625,-0.5,-0.375,0.6875,-0.4875,-0.3125},
	{0.6875,-0.5,-0.4375,0.75,-0.4875,-0.375},
	{0.75,-0.5,-0.5625,0.8125,-0.4875,-0.4375},
	{0.6875,-0.5,-0.625,0.75,-0.4875,-0.5625},
	{0.625,-0.5,-0.6875,0.6875,-0.4875,-0.625},
	{0.5625,-0.5,-0.75,0.625,-0.4875,-0.6875},
	{0.4375,-0.5,-0.8125,0.5625,-0.4875,-0.75},
	{0.375,-0.5,-0.75,0.4375,-0.4875,-0.6875},
	{0.3125,-0.5,-0.6875,0.375,-0.4875,-0.625},
	{0.25,-0.5,-0.625,0.3125,-0.4875,-0.5625},
	{0.1875,-0.5,-0.5625,0.25,-0.4875,-0.4375},
	{0.25,-0.5,-0.4375,0.3125,-0.4875,-0.375},
	{0.3125,-0.5,-0.375,0.375,-0.4875,-0.3125},
	{0.375,-0.5,-0.3125,0.4375,-0.4875,-0.25}}},
	collision_box={type="fixed",fixed={
	{0.4375,-0.5,-0.25,0.5625,-0.4875,-0.1875},
	{0.5625,-0.5,-0.3125,0.625,-0.4875,-0.25},
	{0.625,-0.5,-0.375,0.6875,-0.4875,-0.3125},
	{0.6875,-0.5,-0.4375,0.75,-0.4875,-0.375},
	{0.75,-0.5,-0.5625,0.8125,-0.4875,-0.4375},
	{0.6875,-0.5,-0.625,0.75,-0.4875,-0.5625},
	{0.625,-0.5,-0.6875,0.6875,-0.4875,-0.625},
	{0.5625,-0.5,-0.75,0.625,-0.4875,-0.6875},
	{0.4375,-0.5,-0.8125,0.5625,-0.4875,-0.75},
	{0.375,-0.5,-0.75,0.4375,-0.4875,-0.6875},
	{0.3125,-0.5,-0.6875,0.375,-0.4875,-0.625},
	{0.25,-0.5,-0.625,0.3125,-0.4875,-0.5625},
	{0.1875,-0.5,-0.5625,0.25,-0.4875,-0.4375},
	{0.25,-0.5,-0.4375,0.3125,-0.4875,-0.375},
	{0.3125,-0.5,-0.375,0.375,-0.4875,-0.3125},
	{0.375,-0.5,-0.3125,0.4375,-0.4875,-0.25}}}
})

minetest.register_node("runes:0bk", {
	description = "0 black",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0black.png",
	tiles = {{name = "0bk_1x20.png",
		animation = {type = "vertical_frames",
		length = 2.0665}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0bk",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.25, 0.0625,-0.4875,0.3125},
{0.0625,-0.5,0.1875, 0.125,-0.4875,0.25},
{0.125,-0.5,0.125, 0.1875,-0.4875,0.1875},
{0.1875,-0.5,0.0625, 0.25,-0.4875,0.125},
{0.25,-0.5,-0.0625, 0.3125,-0.4875,0.0625},
{0.1875,-0.5,-0.125, 0.25,-0.4875,-0.0625},
{0.125,-0.5,-0.1875, 0.1875,-0.4875,-0.125},
{0.0625,-0.5,-0.25, 0.125,-0.4875,-0.1875},
{-0.0625,-0.5,-0.3125, 0.0625,-0.4875,-0.25},
{-0.125,-0.5,-0.25, -0.0625,-0.4875,-0.1875},
{-0.1875,-0.5,-0.1875, -0.125,-0.4875,-0.125},
{-0.25,-0.5,-0.125, -0.1875,-0.4875,-0.0625},
{-0.3125,-0.5,-0.0625, -0.25,-0.4875,0.0625},
{-0.25,-0.5,0.0625, -0.1875,-0.4875,0.125},
{-0.1875,-0.5,0.125, -0.125,-0.4875,0.1875},
{-0.125,-0.5,0.1875, -0.0625,-0.4875,0.25}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.25, 0.0625,-0.4875,0.3125},
{0.0625,-0.5,0.1875, 0.125,-0.4875,0.25},
{0.125,-0.5,0.125, 0.1875,-0.4875,0.1875},
{0.1875,-0.5,0.0625, 0.25,-0.4875,0.125},
{0.25,-0.5,-0.0625, 0.3125,-0.4875,0.0625},
{0.1875,-0.5,-0.125, 0.25,-0.4875,-0.0625},
{0.125,-0.5,-0.1875, 0.1875,-0.4875,-0.125},
{0.0625,-0.5,-0.25, 0.125,-0.4875,-0.1875},
{-0.0625,-0.5,-0.3125, 0.0625,-0.4875,-0.25},
{-0.125,-0.5,-0.25, -0.0625,-0.4875,-0.1875},
{-0.1875,-0.5,-0.1875, -0.125,-0.4875,-0.125},
{-0.25,-0.5,-0.125, -0.1875,-0.4875,-0.0625},
{-0.3125,-0.5,-0.0625, -0.25,-0.4875,0.0625},
{-0.25,-0.5,0.0625, -0.1875,-0.4875,0.125},
{-0.1875,-0.5,0.125, -0.125,-0.4875,0.1875},
{-0.125,-0.5,0.1875, -0.0625,-0.4875,0.25}}}
})

minetest.register_node("runes:sl1", {
	description = "Lit Bit 1",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_1.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl2", {
	description = "Lit Bit 2",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_2.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl3", {
	description = "Lit Bit 3",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_3.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl4", {
	description = "Lit Bit 4",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_4.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:zendor", {
	description = "Zendor Crystal",
	paramtype = "light",
	light_source = 5,
	paramtype2 = "facedir",
	tiles = {{name="zend64.png", animation = {type = "vertical_frames", length=1.0}}},
	inventory_image = {"zdcrunes.png"},
	use_texture_alpha = "clip",
	groups = {cracky=3, oddly_breakable_by_hand=0,not_in_creative_inventory=1},
	drop = "runes:zendor",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,-0.25,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,-0.25,0.5}}},
	drawtype = "mesh",
	mesh = "zendor.obj"
})

