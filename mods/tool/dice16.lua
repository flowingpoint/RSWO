tool={}

minetest.register_node("tool:dice_box_covered", {
    description = "The Impossible Dice Box",
    drawtype = "nodebox",
    paramtype2 = "facedir",
    tiles = {"wood00.png^kopper_dbcover.png^[transformR180",
    	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png"},
    paramtype = "light",
    use_texture_alpha = "clip",
    groups = {snappy = 3, attached_node = 1,not_in_creative_inventory=0},
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}, -- Floor
            {-0.5, -0.4, -0.5, -0.4, 0.1, 0.5}, -- West Wall
            {0.4, -0.4, -0.5, 0.5, 0.1, 0.5},  -- East Wall
            {-0.4, -0.4, -0.5, -0.0625, -0.1, -0.4}, -- South Wall A
            {0.0625, -0.4, -0.5, 0.4, -0.1, -0.4}, --South Wall B
            {-0.0625, -0.4, -0.5, 0.0625, -0.1875, -0.4}, --South opening
            {-0.4, -0.4, 0.4, 0.4, 0.1, 0.5}, -- North Wall
            {-0.4, -0.1, -0.5, -0.0625, 0.1, -0.4}, -- Cover A
            {0.0625, -0.1, -0.5, 0.4, 0.1, 0.4}, --Cover B
            {-0.0625, -0.0625, -0.5, 0.0625, 0.1, -0.4}, --Cover opening
            {-0.5, 0.1, -0.5, 0.5, 0.1875, 0.5} --Cover
        },
    },
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
	minetest.set_node(pos, {name = "tool:dice_box", param2 = node.param2})
        minetest.sound_play({name="dmf", gain=0.05}, {pos=selfpos}, true)
	end,
    on_rotate = function(pos, node, user, mode, new_param2)
    	if mode == screwdriver.ROTATE_FACE then
    		return false
    	end
    end
})

minetest.register_node("tool:dice_box", {
    description = "The Impossible Dice Box",
    drawtype = "nodebox",
    paramtype2 = "facedir",
    tiles = {"wood00.png^kopper_9.png",
    	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png",
	"wood00.png^kopper_db.png",
	"wood00.png^kopper_dbdice.png",
	"wood00.png^kopper_db.png"},
    paramtype = "light",
    use_texture_alpha = "clip",
    groups = {snappy = 3, attached_node = 1,not_in_creative_inventory=1},
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}, -- Floor
            {-0.5, -0.4, -0.5, -0.4, 0.1, 0.5}, -- West Wall
            {0.4, -0.4, -0.5, 0.5, 0.1, 0.5},  -- East Wall
            {-0.4, -0.4, -0.5, -0.0625, -0.1, -0.4}, -- South Wall A
            {0.0625, -0.4, -0.5, 0.4, -0.1, -0.4}, --South Wall B
            {-0.0625, -0.4, -0.5, 0.0625, -0.1875, -0.4}, --South opening
            {-0.4, -0.4, 0.4, 0.4, 0.1, 0.5}, -- North Wall
            {-0.4, 1, 0.2, -0.0625, 1.1, 0.4}, -- Cover A
            {0.0625, 1, 0.2, 0.4, 1.1, 0.4}, --Cover B
            {-0.0625, 1, 0.25, 0.0625, 1.1, 0.4}, --Cover opening
            {-0.5, 0.1, 0.4, 0.5, 1.1, 0.5} -- Cover On Hinge
        },
    },

    -- Helper function to clear dice in this box
    on_rightclick = function(pos, node, clicker)
        local meta = minetest.get_meta(pos)
        minetest.sound_play({name="dwf", gain=0.05}, {pos=selfpos}, true)
        -- 1. Reset Display and Clear old dice
        meta:set_string("infotext", "Analyzing alternate realities...")
        
        local objects = minetest.get_objects_inside_radius(pos, 0.7)
        for _, obj in ipairs(objects) do
            local ent = obj:get_luaentity()
            if ent and ent.name == "tool:impossible_die" then
                obj:remove()
            end
        end

        -- 2. Create and Shuffle 16 slots (4x4 grid)
        local slots = {}
        for x = 1, 3 do
            for z = 1, 3 do
                table.insert(slots, {x = x, z = z})
            end
        end

        for i = #slots, 2, -1 do
            local j = math.random(i)
            slots[i], slots[j] = slots[j], slots[i]
        end

        -- 3. Spawn 3 Dice
        local total_score = 0
        for i = 1, 4 do
            local pick = slots[i]
            
            -- This is the missing 'spawn_pos' logic:
            -- Maps grid 1-4 to local coordinates -0.3 to 0.3
            local spawn_pos = {
                x = pos.x + (pick.x * 0.25) - 0.5,
                y = pos.y - 0.35,
                z = pos.z + (pick.z * 0.25) - 0.5
            }
            
            local ent = minetest.add_entity(spawn_pos, "tool:impossible_die")
            if ent then
                local luaent = ent:get_luaentity()
                local score = luaent:roll_instant()
                total_score = total_score + score
            end
        end

    -- 4. Set the hovertext timer on the box metadata
    local meta = minetest.get_meta(pos)
    meta:set_string("infotext", "...")
    minetest.after(1, function()
        -- Only show if the box is still there
        local current_node = minetest.get_node(pos)
        if current_node.name == "tool:dice_box" then
            meta:set_string("infotext", "Goblin Score: " .. total_score)
        end
    end)
end,

    -- Clean up dice when the box is removed
    on_destruct = function(pos)
        local objects = minetest.get_objects_inside_radius(pos, 0.7)
        for _, obj in ipairs(objects) do
            local ent = obj:get_luaentity()
            if ent and ent.name == "tool:impossible_die" then
                obj:remove()
            end
        end
    end,
        on_punch = function(pos, node, clicker, itemstack, pointed_thing)
	minetest.set_node(pos, {name = "tool:dice_box_covered", param2 = node.param2})
        minetest.sound_play({name="dmf", gain=0.05}, {pos=selfpos}, true)
	end
})


tool={}
local die_pool = {
    "wood00.png^dice_01.png", "wood00.png^dice_02.png", "wood00.png^dice_03.png", "wood00.png^dice_04.png", "wood00.png^dice_05.png", "wood00.png^dice_06.png", "wood00.png^dice_07.png", "wood00.png^dice_08.png", "wood00.png^dice_09.png", "wood00.png^dice_10.png", "wood00.png^dice_11.png", "wood00.png^dice_12.png", "wood00.png^dice_13.png", "wood00.png^dice_14.png", "wood00.png^dice_15.png", "wood00.png^dice_00.png"
}

local glyph_pool = {
	"wood00.png^rg1.png", "wood00.png^rg2.png", "wood00.png^rg3.png", "wood00.png^rg4.png", "wood00.png^rg5.png", "wood00.png^rg6.png", "wood00.png^rg7.png", "wood00.png^rg8.png", "wood00.png^rg9.png", "wood00.png^rg10.png", "wood00.png^rg11.png", "wood00.png^rg12.png", "wood00.png^rg13.png", "wood00.png^rg14.png", "wood00.png^rg15.png", "wood00.png^rg16.png", "wood00.png^rg17.png", "wood00.png^rg18.png", "wood00.png^rg19.png", "wood00.png^rg20.png"}

local reality_map = {0, 1, 2, 3, 2, 3, 2, 5, 4, 5, 6, 7, 6, 7, 8, 9}

-- Helper: Fisher-Yates shuffle to get a random subset
local function get_random_six(pool)
    local indices = {}
    for i = 1, #pool do indices[i] = i end
    
    for i = #indices, 2, -1 do
        local j = math.random(i)
        indices[i], indices[j] = indices[j], indices[i]
    end
    
    local selection = {}
    for i = 1, 6 do
        table.insert(selection, pool[indices[i]])
    end
    return selection
end

minetest.register_entity("tool:impossible_die", {
    visual = "cube",
    visual_size = {x=0.05,y=0.05,z=0.05},
    textures = {"wood00.png^dice_1.png", "wood00.png^dice_2.png", "wood00.png^dice_3.png", "wood00.png^dice_4.png", "wood00.png^dice_5.png", "wood00.png^dice_6.png"},
    collisionbox = {-0.025, -0.025, -0.025, 0.025, 0.025, 0.025},
    physical = true,
    collide_with_objects = true,
    on_activate = function(self, staticdata)
        self:roll_instant()
    end,

-- Inside your die entity registration
roll_instant = function(self)
    -- 1. Pick 6 random texture indices from the pool of 16
    local pool = {}
    for i = 1, 16 do table.insert(pool, i) end
    
    local subset_indices = {}
    for i = 1, 6 do
        local r = math.random(#pool)
        table.insert(subset_indices, table.remove(pool, r))
    end

    -- 2. Apply textures (using your 1-16 files)
    local tex_table = {}
    for _, idx in ipairs(subset_indices) do
        -- Formatting to dice_01, dice_02, etc.
        local filename = string.format("dice_%02d.png", idx)
        table.insert(tex_table, "wood00.png^" .. filename)
    end

--     3. Instant Snap Rotation
    local r_list = {0, math.pi/2, math.pi, math.pi*1.5}
    self.object:set_properties({
        textures = tex_table,
        visual_size = {x=0.1, y=0.1, z=0.1}
    })
    self.object:set_rotation({
        x = r_list[math.random(4)],
        y = r_list[math.random(4)],
        z = r_list[math.random(4)]
    })
    
    -- 4. Calculate the 'Reality Score'
    -- Pick which face is on top, then look up its score in the list
    local winning_subset_index = math.random(6)
    local actual_texture_index = subset_indices[winning_subset_index]
    
    -- This pulls from your {0,1,2,3,2,3,2,5,4,5,6,7,6,7,8,9} list
    local reality_score = reality_map[actual_texture_index]
    
    return reality_score
end,


get_top_value = function(self, subset, rot)
    -- Simplified: Since we are using instant random rotation, 
    -- we can just pick one of the 6 faces to be the 'winner'
    -- because the visual orientation is randomized anyway.
    return subset[math.random(6)]
end,

})

minetest.register_chatcommand("rolldie", {
    func = function(name)
        local player = minetest.get_player_by_name(name)
        local pos = player:get_pos()
        pos.y = pos.y + 1.5
        minetest.add_entity(pos, "tool:impossible_die")
    end,
})



