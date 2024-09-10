-- game_commands/init.lua

-- Load support for MT game translation.
local S = minetest.get_translator("game_commands")

minetest.register_chatcommand("antigravity", {
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		player:set_physics_override({
			gravity = 0.5 -- set gravity to 10% of its original value
			              -- (0.1 * 9.81)
			--{speed,jump,gravity,sneak,sneak_glitch}
		})
	end
})

minetest.register_chatcommand("r", {
	description = S("Restart"),
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if player then
			if minetest.settings:get_bool("enable_damage") then
				player:set_hp(20)
				return true
			else
				for _, callback in pairs(core.registered_on_respawnplayers) do
					if callback(player) then
						return true
					end
				end

				-- There doesn't seem to be a way to get a default spawn pos
				-- from the lua API
				return false, S("No static_spawnpoint defined")
			end
		else
			-- Show error message if used when not logged in, eg: from IRC mod
			return false, S("You need to be online to be returned to starting point!")
		end
	end
})
