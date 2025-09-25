local shared = ...
local S = core.get_translator("chalk")
core.register_alias("chalk:chalk", "chalk")

local function get_eye_pos(player)
    local pos = player:get_pos()
    pos.y = pos.y + player:get_properties().eye_height
    return pos
end

local function table_copy_shallow(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

local player_lasts = {}

local function etch_on_use(item, player)
    local player_name = player:get_player_name()
    local pos = get_eye_pos(player)
    local dir = player:get_look_dir()
    shared.etchcast(player, pos, dir)
    player_lasts[player_name] = { pos = pos, dir = dir }
    shared.after_etchcasts()
end

local function dust_on_use(item, player)
    local player_name = player:get_player_name()
    local pos = get_eye_pos(player)
    local dir = player:get_look_dir()
    shared.dustcast(player, pos, dir)
    player_lasts[player_name] = { pos = pos, dir = dir }
    shared.after_etchcasts()
    minetest.add_particlespawner({
		amount = 3,
		time = 1,
		glow = 14,
		pos = {x=pos.x, y=pos.y, z=pos.z},
		minvel = {x=-0.1, y=0, z=-0.1},
		maxvel = {x=0.1, y=0, z=0.1},
		minacc = {x=0, y=-0.2, z=0},
		maxacc = {x=0, y=-0.7, z=0},
		exptime = {min=2, max=2},
		collisiondetection = true,
		collision_removal = false,
		texpool = {{name = "wspeck.png", animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 2.1}, blend='alpha', scale_tween={{x=1,y=1}}}}})
end

--local function etch_on_place(item, player) end
--[toggle remover here]

minetest.register_tool("chalk:chalk", {
        description = S("Chalk"),
        inventory_image = "chalk.png",
        range = shared.MAX_ETCH_DISTANCE,
        on_use = etch_on_use,
        on_place = etch_on_place,
        on_secondary_use = etch_on_place,
        groups = {chalk=1, not_in_creative_inventory=1},
        on_place = function(itemstack, placer, pointed_thing)
        	if pointed_thing.type == "node" then
    		local pos = pointed_thing.above
    		local oldnode = minetest.get_node(pos)
	    	local stackname = itemstack:get_name()
    		while oldnode.name == "air" and not itemstack:is_empty() do
    			local newnode = {name = "chalk:chardust", param1 = 0}
    			minetest.set_node(pos, newnode)
	    		itemstack:take_item()
	    		pos.y = pos.y - 1
    			oldnode = minetest.get_node(pos)
          		end
         	end
	    return itemstack
        end,
    on_drop = function(itemstack, dropper, pos)
	    	local dir = dropper:get_look_dir();
    		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
    		minetest.add_item(pos, "chalk:duster")
    		itemstack:take_item()
    		return itemstack
    	end,
})

minetest.register_tool("chalk:duster", {
    description = S("Duster"),
    inventory_image = "duster.png",
    range = shared.MAX_ETCH_DISTANCE,
    on_use = dust_on_use,
    on_place = function(itemstack, placer, pointed_thing)
        	if pointed_thing.type == "node" then
    		local pos = pointed_thing.above
    		local oldnode = minetest.get_node(pos)
	    	local stackname = itemstack:get_name()
    		while oldnode.name == "air" and not itemstack:is_empty() do
    			local newnode = {name = "chalk:chardust", param1 = 0}
    			minetest.set_node(pos, newnode)
	    		itemstack:take_item()
	    		pos.y = pos.y - 1
    			oldnode = minetest.get_node(pos)
          		end
         	end
	    return itemstack
        end,
    on_drop = function(itemstack, dropper, pos)
	    	local dir = dropper:get_look_dir();
    		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
    		minetest.add_item(pos, "chalk:chalk")
    		itemstack:take_item()
    		return itemstack
    	end,
    groups = {chalk=1, not_in_creative_inventory=1},
})

minetest.register_node("chalk:chardust", {
	description = "Chalk and Duster",
	paramtype = "light",
	paramtype2 = "facedir",
    inventory_image = "chalk_and_duster.png",
	tiles = {"nb_irl.png", "nb_irl2.png", {name = "nb_irl.png",
		tileable_vertical = true}},
	groups = {vcol=0.03, choppy=2, dig_immediate=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
	drop = "chalk:chalk",
	pointable = true,
    node_box={type="fixed",fixed={
    {-0.25,-0.5,0.3125, 0.25,-0.375,0.5},
    {-0.125,-0.375,0.375, 0.125,-0.3125,0.4375}}},
	drawtype = "nodebox",
    use_texture_alpha = "clip"
})

minetest.register_craft({
	output = "chalk:chalk",
	recipe = {{"chalk:duster"}}
})

minetest.register_craft({
	output = "chalk:duster",
	recipe = {{"chalk:chalk"}}
})

local function lerp_factory(t)
    return function(a, b)
        return a + (b - a) * t
    end
end

local function etch_step(player)
    local player_name = player:get_player_name()

    if not player:get_player_control().dig then
        player_lasts[player_name] = nil
        return
    end

    local item = player:get_wielded_item()
    if item:get_name() ~= "chalk:chalk" then
        player_lasts[player_name] = nil
        return
    end

    local last = player_lasts[player_name]
    local now_pos = get_eye_pos(player)
    local now_dir = player:get_look_dir()

    if last then
        local n_steps = shared.NUM_ETCH_STEPS

        if now_pos == last.pos and now_dir == last.dir then
            -- The player hasn't moved, but the world may have changed.
            shared.etchcast(player, now_pos, now_dir)
        else
            for step_n = 1, n_steps do
                local lerp = lerp_factory(step_n / n_steps)
                local pos = vector.combine(last.pos, now_pos, lerp)
                local dir = vector.combine(last.dir, now_dir, lerp):normalize() -- "nlerp"

                shared.etchcast(player, pos, dir)
            end
        end
    end

    player_lasts[player_name] = { pos = now_pos, dir = now_dir }
end

local dtime_accu = 0

-- local deltas = {}
-- local delta_index = 1

core.register_globalstep(function(dtime)
    dtime_accu = dtime_accu + dtime

    if dtime_accu >= shared.ETCH_STEP_INTERVAL then
        -- shared.profiler_someone_etching = false
        -- local t1 = core.get_us_time()

        dtime_accu = dtime_accu % shared.ETCH_STEP_INTERVAL
        for _, player in ipairs(core.get_connected_players()) do
            etch_step(player)
        end
        shared.after_etchcasts()

        -- if shared.profiler_someone_etching then
        --     local t2 = core.get_us_time()
        --     deltas[delta_index] = (t2 - t1) / 1000
        --     delta_index = delta_index + 1
        --     if delta_index > 100000 then
        --         delta_index = 1
        --     end

        --     local avg = 0
        --     for _, v in ipairs(deltas) do
        --         avg = avg + v
        --     end
        --     avg = avg / #deltas
        --     print(string.format("[chalk] average etch step time: %.6f ms", avg))
        -- end
    end
end)
