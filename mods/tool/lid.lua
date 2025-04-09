-- doors/init.lua

-- our API object
tool = {}

tool.registered_lid = {}

-- Load support for MT game translation.
local S = minetest.get_translator("lid")


local function replace_old_owner_information(pos)
	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("lid_owner")
	if owner and owner ~= "" then
		meta:set_string("owner", owner)
		meta:set_string("lid_owner", "")
	end
end

local function is_lid_upper_node(pos)
	return minetest.get_node(pos).name == "lid:hidden"
end

function tool.can_interact_with_node(player, pos)
	if player and player:is_player() then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	if minetest.get_item_group(item:get_name(), "key") == 1 then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_meta():get_string("")
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
-- returns an object to a door object or nil
function tool.get(pos)
	local node_name = minetest.get_node(pos).name
	if lid.registered_lid[node_name] then
		-- A trapdoor/lid
		return {
			pos = pos,
			open = function(self, player)
				if self:state() then
					return false
				end
				return tool.lid_toggle(self.pos, nil, player)
			end,
			close = function(self, player)
				if not self:state() then
					return false
				end
				return tool.lid_toggle(self.pos, nil, player)
			end,
			toggle = function(self, player)
				return tool.lid_toggle(self.pos, nil, player)
			end,
			state = function(self)
				return minetest.get_node(self.pos).name:sub(-5) == "_open"
			end
		}
	else
		return nil
	end
end


----trapdoor----

function tool.lid_toggle(pos, node, clicker)
	node = node or minetest.get_node(pos)

	replace_old_owner_information(pos)

	if clicker and not tool.can_interact_with_node(clicker, pos) then
		return false
	end

	local def = minetest.registered_nodes[node.name]

	if string.sub(node.name, -5) == "_open" then
		minetest.sound_play(def.sound_close,
			{pos = pos, gain = def.gain_close, max_hear_distance = 10}, true)
		minetest.swap_node(pos, {name = string.sub(node.name, 1,
			string.len(node.name) - 5), param1 = node.param1, param2 = node.param2})
	else
		minetest.sound_play(def.sound_open,
			{pos = pos, gain = def.gain_open, max_hear_distance = 10}, true)
		minetest.swap_node(pos, {name = node.name .. "_open",
			param1 = node.param1, param2 = node.param2})
	end
end

function tool.register_lid(name, def)
	if not name:find(":") then
		name = "lid:" .. name
	end

	local name_closed = name
	local name_opened = name.."_open"

	def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		tool.lid_toggle(pos, node, clicker)
		return itemstack
	end

	-- Common trapdoor/lid configuration
	def.drawtype = "nodebox"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.is_ground_content = false
	def.use_texture_alpha = def.use_texture_alpha or "clip"

	if def.protected then
		def.can_dig = can_dig_door
		def.after_place_node = function(pos, placer, itemstack, pointed_thing)
			local pn = placer:get_player_name()
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", pn)
			meta:set_string("infotext", def.description .. "\n" .. S("Owned by @1", pn))

			return minetest.is_creative_enabled(pn)
		end

		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local door = lid.get(pos)
			door:toggle(player)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			replace_old_owner_information(pos)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local pname = player:get_player_name()

			-- verify placer is owner of lockable door
			if owner ~= pname then
				minetest.record_protection_violation(pos, pname)
				minetest.chat_send_player(pname, S("You do not own this lid."))
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, S("a locked lid"), owner
		end
		def.node_dig_prediction = ""
	else
		def.on_blast = function(pos, intensity)
			minetest.remove_node(pos)
			return {name}
		end
	end

	if not def.gain_open then
		def.gain_open = 0.3
	end

	if not def.gain_close then
		def.gain_close = 0.3
	end

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	if def.nodebox_closed and def.nodebox_opened then
		def_closed.node_box = def.nodebox_closed
	else
		def_closed.node_box = {type = "fixed",fixed = {
{-0.4375, -0.5313, -0.5, 0.4375, -0.4687, -0.375},
{-0.4375, -0.5313, -0.3125, 0.4375, -0.4687, -0.1875},
{-0.4375, -0.5313, -0.125, 0.4375, -0.4687, 0},
{-0.4375, -0.5313, 0.0625, 0.4375, -0.4687, 0.1875},
{-0.4375, -0.5313, 0.25, 0.4375, -0.4687, 0.375},
{-0.5,-0.5625,-0.5, -0.4375,-0.4375,0.5},
{0.4375,-0.5625,-0.5, 0.5,-0.4375,0.5},
{-7/16,-3/16,6/16, 7/16,-1/16,7/16},
{-7/16,-3/16,7/16, -6/16,-1/16,9/16},
{6/16,-3/16,7/16, 7/16,-1/16,9/16},
{-7/16,-9/16,9/16, -6/16,7/16,11/16},
{6/16,-9/16,9/16, 7/16,7/16,11/16},
{-7/16,5/16,6/16, 7/16,7/16,7/16},
{-7/16,5/16,7/16, -6/16,7/16,9/16},
{6/16,5/16,7/16, 7/16,7/16,9/16},
{-3/16,-9/16,9/16, -2/16,7/16,11/16},
{-6/16,-75/160,9/16, -3/16,-65/160,11/16},
{-6/16,-55/160,9/16, -3/16,-45/160,11/16},
{-6/16,-35/160,9/16, -3/16,-25/160,11/16},
{-6/16,-15/160,9/16, -3/16,-5/160,11/16},
{-6/16,5/160,9/16, -3/16,15/160,11/16},
{-6/16,25/160,9/16, -3/16,35/160,11/16},
{-6/16,45/160,9/16, -3/16,55/160,11/16},
{-6/16,65/160,9/16, -3/16,75/160,11/16},
{2/16,-9/16,9/16, 3/16,7/16,11/16},
{3/16,-75/160,9/16, 6/16,-65/160,11/16},
{3/16,-55/160,9/16, 6/16,-45/160,11/16},
{3/16,-35/160,9/16, 6/16,-25/160,11/16},
{3/16,-15/160,9/16, 6/16,-5/160,11/16},
{3/16,5/160,9/16, 6/16,15/160,11/16},
{3/16,25/160,9/16, 6/16,35/160,11/16},
{3/16,45/160,9/16, 6/16,55/160,11/16},
{3/16,65/160,9/16, 6/16,75/160,11/16}}}
	end
	def_closed.selection_box = {type = "fixed",fixed = {
{-0.4375, -0.5313, -0.5, 0.4375, -0.4687, -0.375},
{-0.4375, -0.5313, -0.3125, 0.4375, -0.4687, -0.1875},
{-0.4375, -0.5313, -0.125, 0.4375, -0.4687, 0},
{-0.4375, -0.5313, 0.0625, 0.4375, -0.4687, 0.1875},
{-0.4375, -0.5313, 0.25, 0.4375, -0.4687, 0.375},
{-0.5,-0.5625,-0.5, -0.4375,-0.4375,0.5},
{0.4375,-0.5625,-0.5, 0.5,-0.4375,0.5},
{-7/16,-3/16,6/16, 7/16,-1/16,7/16},
{-7/16,-3/16,7/16, -6/16,-1/16,9/16},
{6/16,-3/16,7/16, 7/16,-1/16,9/16},
{-7/16,-9/16,9/16, -6/16,7/16,11/16},
{6/16,-9/16,9/16, 7/16,7/16,11/16},
{-7/16,5/16,6/16, 7/16,7/16,7/16},
{-7/16,5/16,7/16, -6/16,7/16,9/16},
{6/16,5/16,7/16, 7/16,7/16,9/16},
{-3/16,-9/16,9/16, -2/16,7/16,11/16},
{-6/16,-75/160,9/16, -3/16,-65/160,11/16},
{-6/16,-55/160,9/16, -3/16,-45/160,11/16},
{-6/16,-35/160,9/16, -3/16,-25/160,11/16},
{-6/16,-15/160,9/16, -3/16,-5/160,11/16},
{-6/16,5/160,9/16, -3/16,15/160,11/16},
{-6/16,25/160,9/16, -3/16,35/160,11/16},
{-6/16,45/160,9/16, -3/16,55/160,11/16},
{-6/16,65/160,9/16, -3/16,75/160,11/16},
{2/16,-9/16,9/16, 3/16,7/16,11/16},
{3/16,-75/160,9/16, 6/16,-65/160,11/16},
{3/16,-55/160,9/16, 6/16,-45/160,11/16},
{3/16,-35/160,9/16, 6/16,-25/160,11/16},
{3/16,-15/160,9/16, 6/16,-5/160,11/16},
{3/16,5/160,9/16, 6/16,15/160,11/16},
{3/16,25/160,9/16, 6/16,35/160,11/16},
{3/16,45/160,9/16, 6/16,55/160,11/16},
{3/16,65/160,9/16, 6/16,75/160,11/16}}}
	def_closed.tiles = {"kopper.png"
	}

	if def.nodebox_opened and def.nodebox_closed then
		def_opened.node_box = def.nodebox_opened
	else
		def_opened.node_box = {type = "fixed",fixed = {
{-0.4375,-0.5,-0.4687, 0.4375, -0.375,-0.4061},
{-0.4375,-0.3125,-0.4687, 0.4375, -0.1875,-0.4061},
{-0.4375,-0.125,-0.4687, 0.4375, 0,-0.4061},
{-0.4375,0.0625,-0.4687, 0.4375, 0.1875,-0.4061},
{-0.4375,0.25,-0.4687, 0.4375, 0.375,-0.4061},
{-0.5,-0.5,-0.499, -0.4375,0.5,-0.375},
{0.4375,-0.5,-0.499, 0.5,0.5,-0.375},
{-7/16,-3/16,6/16, 7/16,-1/16,7/16},
{-7/16,-3/16,7/16, -6/16,-1/16,9/16},
{6/16,-3/16,7/16, 7/16,-1/16,9/16},
{-7/16,-9/16,9/16, -6/16,7/16,11/16},
{6/16,-9/16,9/16, 7/16,7/16,11/16},
{-7/16,5/16,6/16, 7/16,7/16,7/16},
{-7/16,5/16,7/16, -6/16,7/16,9/16},
{6/16,5/16,7/16, 7/16,7/16,9/16},
{-3/16,-9/16,9/16, -2/16,7/16,11/16},
{-6/16,-75/160,9/16, -3/16,-65/160,11/16},
{-6/16,-55/160,9/16, -3/16,-45/160,11/16},
{-6/16,-35/160,9/16, -3/16,-25/160,11/16},
{-6/16,-15/160,9/16, -3/16,-5/160,11/16},
{-6/16,5/160,9/16, -3/16,15/160,11/16},
{-6/16,25/160,9/16, -3/16,35/160,11/16},
{-6/16,45/160,9/16, -3/16,55/160,11/16},
{-6/16,65/160,9/16, -3/16,75/160,11/16},
{2/16,-9/16,9/16, 3/16,7/16,11/16},
{3/16,-75/160,9/16, 6/16,-65/160,11/16},
{3/16,-55/160,9/16, 6/16,-45/160,11/16},
{3/16,-35/160,9/16, 6/16,-25/160,11/16},
{3/16,-15/160,9/16, 6/16,-5/160,11/16},
{3/16,5/160,9/16, 6/16,15/160,11/16},
{3/16,25/160,9/16, 6/16,35/160,11/16},
{3/16,45/160,9/16, 6/16,55/160,11/16},
{3/16,65/160,9/16, 6/16,75/160,11/16}}}
	end
	def_opened.selection_box = {type = "fixed",fixed = {
{-0.4375,-0.5,-0.4687, 0.4375, -0.375,-0.4061},
{-0.4375,-0.3125,-0.4687, 0.4375, -0.1875,-0.4061},
{-0.4375,-0.125,-0.4687, 0.4375, 0,-0.4061},
{-0.4375,0.0625,-0.4687, 0.4375, 0.1875,-0.4061},
{-0.4375,0.25,-0.4687, 0.4375, 0.375,-0.4061},
{-0.5,-0.5,-0.499, -0.4375,0.5,-0.375},
{0.4375,-0.5,-0.499, 0.5,0.5,-0.375},
{-7/16,-3/16,6/16, 7/16,-1/16,7/16},
{-7/16,-3/16,7/16, -6/16,-1/16,9/16},
{6/16,-3/16,7/16, 7/16,-1/16,9/16},
{-7/16,-9/16,9/16, -6/16,7/16,11/16},
{6/16,-9/16,9/16, 7/16,7/16,11/16},
{-7/16,5/16,6/16, 7/16,7/16,7/16},
{-7/16,5/16,7/16, -6/16,7/16,9/16},
{6/16,5/16,7/16, 7/16,7/16,9/16},
{-3/16,-9/16,9/16, -2/16,7/16,11/16},
{-6/16,-75/160,9/16, -3/16,-65/160,11/16},
{-6/16,-55/160,9/16, -3/16,-45/160,11/16},
{-6/16,-35/160,9/16, -3/16,-25/160,11/16},
{-6/16,-15/160,9/16, -3/16,-5/160,11/16},
{-6/16,5/160,9/16, -3/16,15/160,11/16},
{-6/16,25/160,9/16, -3/16,35/160,11/16},
{-6/16,45/160,9/16, -3/16,55/160,11/16},
{-6/16,65/160,9/16, -3/16,75/160,11/16},
{2/16,-9/16,9/16, 3/16,7/16,11/16},
{3/16,-75/160,9/16, 6/16,-65/160,11/16},
{3/16,-55/160,9/16, 6/16,-45/160,11/16},
{3/16,-35/160,9/16, 6/16,-25/160,11/16},
{3/16,-15/160,9/16, 6/16,-5/160,11/16},
{3/16,5/160,9/16, 6/16,15/160,11/16},
{3/16,25/160,9/16, 6/16,35/160,11/16},
{3/16,45/160,9/16, 6/16,55/160,11/16},
{3/16,65/160,9/16, 6/16,75/160,11/16}}}
	def_opened.tiles = {"kopper.png"
	}

	def_opened.drop = name_closed
	def_opened.groups.not_in_creative_inventory = 1

	minetest.register_node(name_opened, def_opened)
	minetest.register_node(name_closed, def_closed)

	tool.registered_lid[name_opened] = true
	tool.registered_lid[name_closed] = true
end

tool.register_lid("tool:lid", {
	description = S("Lid"),
	inventory_image = "rungs.png",
	wield_image = "rungs.png",
	tiles = {"kopper.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	climbable = true,
	gain_open = 0.06,
	gain_close = 0.13,
	groups = {choppy=2, oddly_breakable_by_hand=1, door=1, not_in_creative_inventory=1},
})


