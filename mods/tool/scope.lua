--Scope 
scope = {}

minetest.register_craftitem(":default:scope", {
	description = "'B' Zooms",
	inventory_image = "bubble.png",
	wield_image = "bubble.png",
	stack_max = 1,

	on_use = function(itemstack, user, pointed_thing)
		scope.update_player_property(user)
	end,
	on_drop = function(itemstack, dropper, pos)
		local dir = dropper:get_look_dir();
		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
		minetest.add_item(pos, "tape_measure:tape_measure")
		itemstack:take_item()
		return itemstack
	end
})
local creative_mod = minetest.get_modpath("creative")
local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function scope.update_player_property(player)
	local creative_enabled =
		(creative_mod and creative.is_enabled_for(player:get_player_name())) or
		creative_mode_cache
	local new_zoom_fov = 0

	if player:get_inventory():contains_item(
			"main", "default:scope") then
		new_zoom_fov = 10
	elseif creative_enabled then
		new_zoom_fov = 15
	end

	if player:get_properties().zoom_fov ~= new_zoom_fov then
		player:set_properties({zoom_fov = new_zoom_fov})
	end
end

minetest.register_on_joinplayer(function(player)
	scope.update_player_property(player)
end)

local function cyclic_update()
	for _, player in ipairs(minetest.get_connected_players()) do
		scope.update_player_property(player)
	end
	minetest.after(4.7, cyclic_update)
end

minetest.after(4.7, cyclic_update)
