
local path = minetest.get_modpath("mobs")

-- Peaceful player privilege
minetest.register_privilege("peaceful_player", {
	description = "Prevents Mobs from attacking player",
	give_to_singleplayer = false
})

-- Mob API
dofile(path .. "/api.lua")

-- Rideable Mobs
dofile(path .. "/mount.lua")

print("Sprites loaded")

--Swinepine and friends
dofile(path .. "/sprites.lua")

dofile(path .. "/name.lua")