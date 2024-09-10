local t = tool

--Check node below. These should be runes but can be anything.
local portal_node_points = {
	{x=0,y=-1,z=0},
}

t.get_portal_node = function(pos)
	local node_name = nil
	for _,relative in ipairs(portal_node_points) do
		local real_pos = vector.add(relative,pos)
		local node = minetest.get_node_or_nil(real_pos)
		if node and node.name 
		and (not node_name or node.name == node_name) then
			node_name = node.name
		else
			return nil
		end
	end
	return node_name
end

t.tp_to_portal = function(name,entity)
	local portal_pos = t.get_portal(name)
	if not portal_pos then
		return false
	end
	entity:setpos(vector.add(portal_pos,{x=0,y=1,z=0}))
	return true
end

t.try_collapse = function(name)
	if not name then
		return false
	end

	local pos = t.get_portal(name)
	if not pos then
		return false
	end

	local portal = minetest.get_node_or_nil(pos)
	if not portal then
		return false
	end
	if portal.name ~= "tool:dice" then
		t.remove_portal(name)
		return true
	end

	local node = t.get_portal_node(pos)
	if not node or node ~= name then
		t.remove_portal(name)
		if node ~= name then
			t.set_portal(pos,node)
		end
		return true
	end
	
	return false
end