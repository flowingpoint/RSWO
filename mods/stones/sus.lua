local tmp = {}

minetest.register_entity("stones:item",{
	hp_max = 1,
	visual="wielditem",
	visual_size={x=.33,y=.33},
	collisionbox = {0,0,0,0,0,0},
	physical=false,
	textures={"air"},
	on_activate = function(self, staticdata)
		if tmp.nodename ~= nil and tmp.texture ~= nil then
			self.nodename = tmp.nodename
			tmp.nodename = nil
			self.texture = tmp.texture
			tmp.texture = nil
		else
			if staticdata ~= nil and staticdata ~= "" then
				local data = staticdata:split(';')
				if data and data[1] and data[2] then
					self.nodename = data[1]
					self.texture = data[2]
				end
			end
		end
		if self.texture ~= nil then
			self.object:set_properties({textures={self.texture}})
		end
		if self.nodename == "stones:flat_O" then
			self.object:set_properties({automatic_rotate=1})
		end
	end,
	get_staticdata = function(self)
		if self.nodename ~= nil and self.texture ~= nil then
			return self.nodename .. ';' .. self.texture
		end
		return ""
	end,
})


local remove_item = function(pos, node)
	local objs = nil
	if node.name == "stones:flat_O" then
		objs = minetest.env:get_objects_inside_radius({x=pos.x,y=pos.y,z=pos.z}, .5)
	end
	if objs then
		for _, obj in ipairs(objs) do
			if obj and obj:get_luaentity() and obj:get_luaentity().name == "stones:item" then
				obj:remove()
			end
		end
	end
end

local update_item = function(pos, node)
	remove_item(pos, node)
	local meta = minetest.env:get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "stones:flat_O" then
			pos.y = pos.y + 0.07
		end
		tmp.nodename = node.name
		tmp.texture = ItemStack(meta:get_string("item")):get_name()
		local e = minetest.env:add_entity(pos,"stones:item")
	end
end

local drop_item = function(pos, node)
	local meta = minetest.env:get_meta(pos)
	if meta:get_string("item") ~= "" then
		if node.name == "stones:flat_O" then
			minetest.env:add_item({x=pos.x,y=pos.y,z=pos.z}, meta:get_string("item"))
		end
		meta:set_string("item","")
	end
	remove_item(pos, node)
end


minetest.register_node("stones:flat_O",{
	description = "flat 'O'",
	drawtype = "nodebox",
		node_box = {type="fixed",fixed={
	  {-0.375,-0.5,-0.5, 0.375,-0.375,0.5},
	  {-0.5,-0.5,-0.5, -0.375,0.5,0.5},
	  {0.375,-0.5,-0.5, 0.5,0.5,0.5},
	  {-0.375,0.375,-0.5, 0.375,0.5,0.5}}},
	--selection_box = { type = "fixed", fixed = {-7/16, -0.5, -7/16, 7/16, 12/16, 7/16} },
	tiles = {"rock.png"},
	paramtype = "light",
    paramtype2 = "facedir",
	groups = {vcol=0.469, cracky=1, oddly_breakable_by_hand=1},
	on_rightclick = function(pos, node, clicker, itemstack)
		if not itemstack then return end
		local meta = minetest.env:get_meta(pos)
			drop_item(pos,node)
		local s = itemstack:take_item()
			meta:set_string("item",s:to_string())
			update_item(pos,node)
		return itemstack
	end,
	on_punch = function(pos,node,puncher)
		local meta = minetest.env:get_meta(pos)
			drop_item(pos,node)
	end
})

-- automatically restore entities lost from flatOs
-- due to /clearobjects or similar

minetest.register_abm({
	nodenames = { "stones:flat_O" },
	interval = 15,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if #minetest.get_objects_inside_radius(pos, 0.5) > 0 then return end
		update_item(pos, node)
	end
})

-- crafts

