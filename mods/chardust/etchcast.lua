local shared = ...
local S = core.get_translator("chardust")
local get_node_selectionboxes_cache = {}

local function is_etchable(pos)
    local node = core.get_node(pos)
    local def = core.registered_nodes[node.name]
    if def and def.drawtype == "plantlike" then
        return false
    end
    return true
end

local function get_node_selectionboxes_cached(pos)
    local key = pos.x .. ":" .. pos.y .. ":" .. pos.z
    local result = get_node_selectionboxes_cache[key]
    if result ~= nil then
        return result
    end

    local new_result
    local def = core.registered_nodes[core.get_node(pos).name]
    if def and not def.pointable then
        -- don't allow paint to stick on e.g. air nodes
        new_result = {}
    else
        new_result = core.get_node_boxes("selection_box", pos)
    end

    get_node_selectionboxes_cache[key] = new_result
    return new_result
end

local function nearly_equal(a, b)
    return math.abs(a - b) < shared.EPSILON
end

-- `vector_prerot_pre` and `vector_prerot` are a split version of `vector.rotate`.
-- https://github.com/minetest/minetest/blob/15fb4cab15c8d57028a2/builtin/common/vector.lua#L309-L340

local function vector_prerot_pre(rot)
    local sinpitch = math.sin(-rot.x)
    local sinyaw   = math.sin(-rot.y)
    local sinroll  = math.sin(-rot.z)
    local cospitch = math.cos(rot.x)
    local cosyaw   = math.cos(rot.y)
    local cosroll  = math.cos(rot.z)
    -- Rotation matrix that applies yaw, pitch and roll
    return {
        {
            sinpitch * sinyaw * sinroll + cosyaw * cosroll,
            sinpitch * sinyaw * cosroll - cosyaw * sinroll,
            cospitch * sinyaw,
        },
        {
            cospitch * sinroll,
            cospitch * cosroll,
            -sinpitch,
        },
        {
            sinpitch * cosyaw * sinroll - sinyaw * cosroll,
            sinpitch * cosyaw * cosroll + sinyaw * sinroll,
            cospitch * cosyaw,
        },
    }
end

local function vector_prerot(v, matrix)
    -- Compute matrix multiplication: `matrix` * `v`
    return vector.new(
        matrix[1][1] * v.x + matrix[1][2] * v.y + matrix[1][3] * v.z,
        matrix[2][1] * v.x + matrix[2][2] * v.y + matrix[2][3] * v.z,
        matrix[3][1] * v.x + matrix[3][2] * v.y + matrix[3][3] * v.z
    )
end

local function calc_bitmap_size(canvas_size)
    return { -- minimum 1x1 pixels
        x = math.max(math.round(canvas_size.x / shared.DESIRED_PIXEL_SIZE), 1),
        y = math.max(math.round(canvas_size.y / shared.DESIRED_PIXEL_SIZE), 1),
    }
end

local function find_canvas(pos)
    local findings = core.get_objects_inside_radius(pos, shared.EPSILON)

    for _, obj in ipairs(findings) do
        local ent = obj:get_luaentity()
        if ent and ent.name == "chardust:canvas" then
            return ent
        end
    end
end

local function create_canvas(node_pos, pos, rot, size, bitmap_size)
    local obj = core.add_entity(pos, "chardust:canvas")
    if not obj then return end
    obj:set_rotation(rot)

    local canvas = obj:get_luaentity()
    canvas:setup(node_pos, size, bitmap_size)
    canvas:update_immediately() -- Avoid flash of "no texture" texture.
    return canvas
end

local function vec_to_canvas_space(vec, canvas_prerot)
    return vector_prerot(vector.new(-vec.x, -vec.y, vec.z), canvas_prerot)
end

local spread_rect_to_node, spread_rect_to_box


