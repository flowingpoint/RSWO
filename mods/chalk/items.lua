local shared = ...
local S = core.get_translator("chalk")

local function get_eye_pos(player)
    local pos = player:get_pos()
    pos.y = pos.y + player:get_properties().eye_height
    return pos
end

local function wear_out(player_name, item, n_steps)
    if core.is_creative_enabled(player_name) then
        return item
    end

    item:add_wear_by_uses(shared.ETCH_DURATION / shared.ETCH_STEP_INTERVAL *
            shared.NUM_ETCH_STEPS / n_steps )
    if item:is_empty() then
    itemstack:clear()
    return itemstack
    end
end

local function table_copy_shallow(t)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = v
    end
    return t2
end

local function get_processed_etch_def(item, prompt_player)
    local etch_def = shared.get_raw_etch_def(item)
    if not etch_def then return end
    etch_def = table_copy_shallow(etch_def)

    if etch_def.applier then
        etch_def.color = "#f2ebd9"

    if not etch_def.color then return end
    end
    return etch_def
end


local player_lasts = {}

local function etch_on_use(item, player)
    local player_name = player:get_player_name()
    local etch_def = get_processed_etch_def(item, player)
    if not etch_def then return end
    local pos = get_eye_pos(player)
    local dir = player:get_look_dir()
    shared.etchcast(player, pos, dir, etch_def)
    player_lasts[player_name] = { pos = pos, dir = dir }
    shared.after_etchcasts()
    return wear_out(player_name, item, 1)
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
        chardust = {applier = true},
        groups = {chalk = 1, not_in_creative_inventory=1},
--[[    	on_drop = function(itemstack, dropper, pos)
	    	local dir = dropper:get_look_dir();
    		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
    		minetest.add_item(pos, "chalk:duster")
    		itemstack:take_item()
    		return itemstack
    	end]]
})

minetest.register_tool("chalk:duster", {
    description = S("Duster"),
    inventory_image = "duster.png",
    range = shared.MAX_ETCH_DISTANCE,
    on_use = etch_on_use,
    on_place = etch_on_place,
    on_secondary_use = etch_on_place,
    chardust = {remover = true},
    groups = {chalk=1, not_in_creative_inventory=1},
--[[   	on_drop = function(itemstack, dropper, pos)
	   	local dir = dropper:get_look_dir();
   		local pos = dropper:get_pos() + {x=0+dir.x/2,y=1.5,z=0+dir.z/2}
   		minetest.add_item(pos, "chalk:chalk")
   		itemstack:take_item()
   		return itemstack
   	end]]
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
    local etch_def = get_processed_etch_def(item)
    if not etch_def then
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

                shared.etchcast(player, pos, dir, etch_def)
            end
        end

        item = wear_out(player_name, item, n_steps, 1)
        player:set_wielded_item(item)
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
