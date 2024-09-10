local function nextrange(x, max)
	x = x + 1
	if x > max then
		x = 0
	end
	return x
end

-- Handles rotation
local function wrench_handler(itemstack, user, pointed_thing, mode)
	if pointed_thing.type ~= "node" then
		return
	end

	local pos = pointed_thing.under
	local keys = user:get_player_control()
	local player_name = user:get_player_name()

	if minetest.is_protected(pos, user:get_player_name()) then
		minetest.record_protection_violation(pos, user:get_player_name())
		return
	end

	local node = minetest.get_node(pos)
	local ndef = minetest.registered_nodes[node.name]
	if not ndef or not ndef.paramtype2 == "facedir" or
			(ndef.drawtype == "nodebox" and
			not ndef.node_box.type == "fixed") or
			node.param2 == nil then
		return
	end

	-- Set param2
	local n = node.param2
	local axisdir = math.floor(n / 4)
	local rotation = n - axisdir * 4
	if mode == 1 then
		n = axisdir * 4 + nextrange(rotation, 3)
	elseif mode == 3 then
		n = nextrange(axisdir, 5) * 4
	end
	
	node.param2 = n
	minetest.swap_node(pos, node)

	local item_wear = tonumber(itemstack:get_wear())
	item_wear = item_wear + 300 -- was 327
	if item_wear > 65535 then
		itemstack:clear()
		return itemstack
	end
	itemstack:set_wear(item_wear)
	return itemstack
end

-- Wrench
minetest.register_tool("tool:wrench", {
	description = "Ratchet",
	inventory_image = "wrench.png",
	on_use = function(itemstack, user, pointed_thing)
		wrench_handler(itemstack, user, pointed_thing, 1)
		return itemstack
	end,
	on_place = function(itemstack, user, pointed_thing)
		wrench_handler(itemstack, user, pointed_thing, 3)
		return itemstack
	end,
})
