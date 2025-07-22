tool = {}

minetest.register_node("tool:prop", {
	description = "Propped P-Staff",
	paramtype = "light",
	paramtype2 = "facedir",
    inventory_image = "smokestaff.png",
	tiles = {"proptop.png", "propbottom.png", {name = "propipd.png",
		tileable_vertical = true}},
	groups = {vcol=0.00, choppy=2, dig_immediate=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "tool:pok",
	pointable = true,
	light_source = 14,
    node_box={type="fixed",fixed={
    {-0.0313,-0.5,-0.0313, 0.0313,0.5,0.0313}}},
	drawtype = "nodebox",
    use_texture_alpha = "clip",
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_node(pos, {name = "tool:prup", param2 = node.param2})
        minetest.sound_play({name="whoosh", gain=0.05}, {pos=selfpos}, true)
	end
})

minetest.register_abm({
    nodenames = {"tool:prop"},
    interval = 3,
    chance = 10,
    action = function(pos, node)
        minetest.env:remove_node(pos)
        minetest.set_node(pos, {name = "tool:prup", param2 = node.param2})
        minetest.sound_play({name="whoosh", gain=0.05}, {pos=selfpos}, true)
        minetest.add_particlespawner({
    		amount = 1,
    		time = 1,
    		glow = 14,
       		pos = {x=pos.x, y=pos.y+0.5, z=pos.z},
    		minvel = {x=-0.2, y=0, z=-0.2},
    		maxvel = {x=0.2, y=0, z=0.2},
    		minacc = {x=0, y=0.2, z=0},
    		maxacc = {x=0, y=0.7, z=0},
    		exptime = {min=2, max=2},
    		collisiondetection = true,
    		collision_removal = false,
	    	texpool = {{name = "bubbles.png", animation = {type = "vertical_frames", aspect_w = 40, aspect_h = 40, length = 2.1}, blend='alpha', scale_tween={{x=10,y=10}}}}})
        minetest.add_particlespawner({
		amount = 10+math.random(1,10),
		time = 5+math.random(1,10),
		glow = 14,
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
minetest.add_particlespawner({
		amount = 5+math.random(1,10),
		time = 10+math.random(1,10),
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
	nodenames = {"stones:blush"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brush"})
	end
})

minetest.register_abm({
	nodenames = {"stones:brush"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rush"})
	end
})

minetest.register_abm({
	nodenames = {"stones:rush"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brush"})
	end
})

minetest.register_abm({
	nodenames = {"stones:brush"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blush"}, {param2 = math.random(0,3)})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_0"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_0",  param2 = math.floor((node.param2)/4)*4+(node.param2-1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_0"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_0",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_0"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_0",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_0"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_0",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_0"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:brushrock_0",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_0"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_0",  param2 = math.floor((node.param2)/4)*4+(node.param2+1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_1"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_1", param2 = math.floor((node.param2)/4)*4+(node.param2-1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_1"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:rushrock_1",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_1"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_1",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_1"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_1",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_1"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_1",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_1"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_1",  param2 = math.floor((node.param2)/4)*4+(node.param2+1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_2"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_2"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_2"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_2"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_2"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_2"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_3"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_3", param2 = math.floor((node.param2)/4)*4+(node.param2-1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_3"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_3",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_3"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_3",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_3"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_3",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_3"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_3",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_3"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_3",  param2 = math.floor((node.param2)/4)*4+(node.param2+1)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_4"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_4"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_4"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_4"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_4"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_4"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_4",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_5"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_5"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_5"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_5"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_5"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_5"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_5", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_52ul"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_52ul"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_52ul"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_52ul"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_52ul"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_52ul"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_52ul", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_52ur"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_52ur"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_52ur"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_52ur"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_52ur"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_52ur"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_52ur", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_527l"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_527l"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_527l"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_527l"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_527l"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_527l"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_527l",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_527r"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_527r"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_527r"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_527r"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_527r"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_527r"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_527r", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_8"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_8"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_8"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_8"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_8"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_8"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_8", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_28"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:brushrock_28",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_28"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:rushrock_28",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_28"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:rublish_28", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_28"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:rushrock_28",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_28"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},  {name = "stones:brushrock_28",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_28"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z},   {name = "stones:blushrock_28",  param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_2u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_2u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_2u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_2u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_2u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_2u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_2u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_21"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_21"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_21"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_21"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_21"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_21"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_21", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_21u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_21u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_21u"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_21u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_21u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_21u"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_21u", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_c"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_c"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_c"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_c"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_c"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_c"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_c", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:blushrock_11"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_11"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_11"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rublish_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rublish_11"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:rushrock_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:rushrock_11"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brushrock_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brushrock_11"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:blushrock_11", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brush_2"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:r_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:r_2"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brush_2", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:brush_3"},
	neighbors = {"tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:r_3", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:r_3"},
	neighbors = {"tool:prop"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:brush_3", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_abm({
	nodenames = {"stones:isodark"},
	neighbors = {"tool:prop","tool:prup"},
	interval = 1.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
        minetest.env:remove_node(pos)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "stones:isokar", param2 = math.floor((node.param2)/4)*4+(node.param2)%4})
	end
})

minetest.register_node("tool:prup", {
	description = "Propped R-Staff",
	paramtype = "light",
	paramtype2 = "facedir",
    inventory_image = "wokestaff.png",
	tiles = {"propbottom.png", "proptop.png", {name = "propipd.png^[transformFY",
		tileable_vertical = true}},
	groups = {vcol=0.00, choppy=2, dig_immediate=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "tool:rok",
	pointable = true,
	light_source = 9,
    node_box={type="fixed",fixed={
    {-0.0313,-0.5,-0.0313, 0.0313,0.5,0.0313}}},
	drawtype = "nodebox",
    use_texture_alpha = "clip",
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.set_node(pos, {name = "tool:prop", param2 = node.param2})
        minetest.sound_play({name="whoosh", gain=0.05}, {pos=selfpos}, true)
        minetest.add_particlespawner({
    		amount = 1,
    		time = 1,
    		glow = 14,
       		pos = {x=pos.x, y=pos.y+0.5, z=pos.z},
    		minvel = {x=-0.2, y=0, z=-0.2},
    		maxvel = {x=0.2, y=0, z=0.2},
    		minacc = {x=0, y=0.2, z=0},
    		maxacc = {x=0, y=0.7, z=0},
    		exptime = {min=2, max=2},
    		collisiondetection = true,
    		collision_removal = false,
	    	texpool = {{name = "bubbles.png", animation = {type = "vertical_frames", aspect_w = 40, aspect_h = 40, length = 2.1}, blend='alpha', scale_tween={{x=10,y=10}}}}})
        minetest.add_particlespawner({
		amount = 10+math.random(1,10),
		time = 5+math.random(1,10),
		glow = 14,
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
	end,
})
