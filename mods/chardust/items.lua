local shared = ...
local S = core.get_translator("chardust")

local function get_eye_pos(player)
    local pos = player:get_pos()
    pos.y = pos.y + player:get_properties().eye_height
    return pos
end

local function etch(item, player)
    local name = player:get_player_name()
    local pos = get_eye_pos(player)
    local dir = player:get_look_dir()
    shared.etchcast(player, pos, dir, etch_def)
    player_lasts[name] = {pos=pos, dir=dir}
    shared.after_etchcasts()
end

minetest.register_tool("chardust:chalk", {
        description = S("Chalk"),
        inventory_image = "chalk.png",
        range = shared.MAX_ETCH_DISTANCE,
        on_use = etch,
        on_place = function(itemstack, placer, pointed_thing, player)
        	if pointed_thing.type == "node" then
    		local pos = pointed_thing.above
    		local oldnode = minetest.get_node(pos)
	    	local stackname = itemstack:get_name()
    		while oldnode.name == "air" and not itemstack:is_empty() do
    			local newnode = {name = "chardust:chardust", param1 = p2}
    			minetest.set_node(pos, newnode)
	    		itemstack:take_item()
	    		pos.y = pos.y - 1
    			oldnode = minetest.get_node(pos)
          		end
         	end
	    return itemstack
        end,
        on_secondary_use = function(itemstack, placer, pos)
	    	local dir = placer:get_look_dir();
    		local pos = placer:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
    		minetest.add_item(pos, "chardust:duster")
    		itemstack:take_item()
    		return itemstack
    	end,
        chardust = {applier = true, remover = false},
        groups = {chalk=1, duster=0, not_in_creative_inventory=1},
       
})

minetest.register_node("chardust:chardust", {
	description = "Chalk and Duster",
	paramtype = "light",
	paramtype2 = "facedir",
    inventory_image = "chalk_and_duster.png",
	tiles = {"nb_irl.png", "nb_irl2.png", {name = "nb_irl.png",
		tileable_vertical = true}},
	groups = {vcol=0.03, cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "chardust:chalk",
	pointable = true,
    node_box={type="fixed",fixed={
    {-0.25,-0.5,0.3125, 0.25,-0.375,0.5},
    {-0.125,-0.375,0.375, 0.125,-0.3125,0.4375}}},
	drawtype = "nodebox",
    use_texture_alpha = "clip"
})

minetest.register_tool("chardust:duster", {
        description = S("Duster"),
        inventory_image = "duster.png",
        range = shared.MAX_ETCH_DISTANCE,
        on_use = etch_on_use,
        on_place = function(itemstack, placer, pointed_thing)
        	if pointed_thing.type == "node" then
    		local pos = pointed_thing.above
    		local oldnode = minetest.get_node(pos)
	    	local stackname = itemstack:get_name()
    		while oldnode.name == "air" and not itemstack:is_empty() do
    			local newnode = {name = "chardust:chardust", param1 = 0}
    			minetest.set_node(pos, newnode)
	    		itemstack:take_item()
	    		pos.y = pos.y - 1
    			oldnode = minetest.get_node(pos)
          		end
         	end
	    return itemstack
        end,
        on_secondary_use = function(itemstack, placer, pos)
	    	local dir = placer:get_look_dir();
    		local pos = placer:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
    		minetest.add_item(pos, "chardust:chalk")
    		itemstack:take_item()
    		return itemstack
    	end,
        chardust = {applier = false, remover = true},
        groups = {chalk=0, duster=1, not_in_creative_inventory=1}
})



