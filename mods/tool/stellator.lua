tool={}

local function calculate_midpoints(input_text)
    local vertices = {}
    -- Parse input lines: "v x y z"
    for line in input_text:gmatch("[^\r\n]+") do
        local x, y, z = line:match("v%s+([%-0-9%.]+)%s+([%-0-9%.]+)%s+([%-0-9%.]+)")
        if x and y and z then
            table.insert(vertices, {x = tonumber(x), y = tonumber(y), z = tonumber(z)})
        end
    end

    local midpoints = {}
    local seen = {} -- To avoid duplicate midpoints

    -- Calculate midpoints for every unique pair (Edge detection)
    for i = 1, #vertices do
        for j = i + 1, #vertices do
            local m = {
                x = (vertices[i].x + vertices[j].x) / 2,
                y = (vertices[i].y + vertices[j].y) / 2,
                z = (vertices[i].z + vertices[j].z) / 2
            }
            
            -- Create a key to prevent duplicate points (e.g. from overlapping edges)
            local key = string.format("%.3f,%.3f,%.3f", m.x, m.y, m.z)
            if not seen[key] then
                table.insert(midpoints, string.format("v %.3f %.3f %.3f", m.x, m.y, m.z))
                seen[key] = true
            end
        end
    end

    return table.concat(midpoints, "\n")
end


minetest.register_node("tool:stellator", {
    description = "Polytope Midpoint Calculator",    
    drawtype = "nodebox",
    node_box = {type="fixed",fixed={
	  {-0.375,-0.5,-0.375, 0.375,-0.375,0.375}}},
    tiles = {"bstar.png"}, 
    use_texture_alpha = "clip",
    groups = {attached_node=1,crumbly=1,dig_immediate=1,not_in_creative_inventory=1},
    on_rightclick = function(pos, node, clicker)
        local meta = minetest.get_meta(pos)
        local input = meta:get_string("input") or "v 0 0 0\nv 1 1 1"
        local output = meta:get_string("output") or ""

        local fs = "size[10,9]real_coordinates[true]" ..
            "label[0.5,0.5;Input Vertices (v x y z)]" ..
            "textarea[0.5,1;9,3;input;;" .. minetest.formspec_escape(input) .. "]" ..
            "button[4,4.2;2,0.8;calc;Find Midpoints]" ..
            "label[0.5,5.2;Generated Midpoints]" ..
            "textarea[0.5,5.5;9,3;output;;" .. minetest.formspec_escape(output) .. "]"
        
        minetest.show_formspec(clicker:get_player_name(), "tool:stellator_fs", fs)
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "tool:stellator_fs" or fields.quit then return end

    if fields.calc then
        local result = calculate_midpoints(fields.input)
        -- We can update the meta or just re-show the form with the result
        local fs = "size[10,9]real_coordinates[true]" ..
            "label[0.5,0.5;Input Vertices (v x y z)]" ..
            "textarea[0.5,1;9,3;input;;" .. minetest.formspec_escape(fields.input) .. "]" ..
            "button[4,4.2;2,0.8;calc;Find Midpoints]" ..
            "label[0.5,5.2;Generated Midpoints]" ..
            "textarea[0.5,5.5;9,3;output;;" .. minetest.formspec_escape(result) .. "]"
        
        minetest.show_formspec(player:get_player_name(), "tool:stellator_fs", fs)
    end
end)

tool={}
-- Helper: Checks if a point is inside the hull formed by a set of vertices
-- Note: This uses a simplified plane-side check for convex sets
local function get_interior_points(vertices)
    -- We need a hull to exist first (min 4 points for a 3D volume)
    if #vertices <= 4 then return "Error: Not enough points to form a volume." end
    
    local interior = {}
    
    -- In a true peeling algorithm, we:
    -- 1. Identify which points form the current Convex Hull.
    -- 2. Create a list of all points NOT in that set.
    
    -- For this Lua implementation, we'll identify 'Boundary Points'
    -- A point is a boundary point if it's an extreme in any direction 
    -- or forms the outer triangles.
    
    -- Simple approach for your tool: 
    -- Identify the hull points (QuickHull or similar) and subtract them.
    local is_on_hull = {}
    
    -- [Logic Placeholder for Hull Detection]
    -- For each point, if it's part of the hull construction, mark it true.
    -- (This is the complex math part we discussed)
    
    for i, v in ipairs(vertices) do
        if not is_on_hull[i] then
            table.insert(interior, string.format("v %.3f %.3f %.3f", v.x, v.y, v.z))
        end
    end
    
    return table.concat(interior, "\n")
end

minetest.register_node("tool:peeler", {
    description = "Polytope Layer Peeler",   
    drawtype = "nodebox",
    node_box = {type="fixed",fixed={
	  {-0.375,-0.5,-0.375, 0.375,-0.375,0.375}}},
    tiles = {"wood00.png^bubble.png"}, 
    use_texture_alpha = "clip",
    groups = {attached_node=1,crumbly=1,dig_immediate=1,not_in_creative_inventory=1},
    on_rightclick = function(pos, node, clicker)
        local fs = "size[10,9]real_coordinates[true]" ..
            "label[0.5,0.5;Input Points (v x y z)]" ..
            "textarea[0.5,1;9,3;input;;" .. (fields_input or "") .. "]" ..
            "button[4,4.2;2,0.8;peel;Peel Outer Hull]" ..
            "label[0.5,5.2;Interior Vertices (The Core)]" ..
            "textarea[0.5,5.5;9,3;output;;" .. (fields_output or "") .. "]"
        
        minetest.show_formspec(clicker:get_player_name(), "tool:peeler_fs", fs)
    end,
})


