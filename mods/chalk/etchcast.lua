local shared = ...
local S = core.get_translator("chalk")
local get_node_selectionboxes_cache = {}

local function is_etchable(pos)
    local node = core.get_node(pos)
    local name = core.registered_nodes[node.name]
    if name and name.drawtype == "plantlike" then
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
    local name = core.registered_nodes[core.get_node(pos).name]
    if name and not name.pointable then
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

spread_rect_to_node = function(props, other_node_pos, skip_box_id)
    if not is_etchable(other_node_pos) then return
    end
    local raw_boxes = get_node_selectionboxes_cached(other_node_pos)

    for index, raw_box in ipairs(raw_boxes) do
        if index ~= skip_box_id then
            spread_rect_to_box(props, other_node_pos, raw_box)
        end
    end
end

spread_rect_to_box = function(props, other_node_pos, raw_box)
    local box = shared.aabb.from(raw_box)
    box:repair()
    local box_center = box:get_center()

    local self_prerot = props.self_prerot
    local rot_box = shared.aabb.new(
        vector_prerot(box.pos_min, self_prerot),
        vector_prerot(box.pos_max, self_prerot)
    )
    rot_box:repair()
    local rot_box_size = rot_box:get_size()

    local self_root_pos_canvas = props.self_root_pos_canvas
    local other_root_pos = other_node_pos + box_center +
        vector_prerot(vector.new(0, 0, rot_box_size.z * 0.5), self_prerot)
    local other_root_pos_canvas = vec_to_canvas_space(other_root_pos, self_prerot)
    if not nearly_equal(self_root_pos_canvas.z, other_root_pos_canvas.z) then
        return
    end

    -- The Z value of this vector is never used.
    local canvas_offset = (self_root_pos_canvas - props.self_rot_box_size / 2) -
        (other_root_pos_canvas - rot_box_size / 2)
    local bitmap_offset_x = math.round(canvas_offset.x / shared.DESIRED_PIXEL_SIZE)
    local bitmap_offset_y = math.round(canvas_offset.y / shared.DESIRED_PIXEL_SIZE)

    local new_x = bitmap_offset_x + props.x
    local new_y = bitmap_offset_y + props.y

    local bitmap_size = calc_bitmap_size(rot_box_size)
    if new_x + 3 < 0 or
       new_y + 3 < 0 or
       new_x > bitmap_size.x - 1 or
       new_y > bitmap_size.y - 1 then
        return
    end

    local other_pos = other_node_pos + box_center +
            vector_prerot(vector.new(0, 0, rot_box_size.z * shared.CANVAS_OFFSET), self_prerot)

    local canvas = find_canvas(other_pos)
    if not canvas and not props.remover then
        local other_size = { x = rot_box_size.x, y = rot_box_size.y }
        canvas = create_canvas(
            other_node_pos, other_pos, props.self_rot, other_size, bitmap_size)
    end
    if not canvas then return end

    canvas:draw_rect(new_x, new_y, props.size)
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
        if ent and ent.name == "chalk:canvas" then
            return ent
        end
    end
end

local function create_canvas(node_pos, pos, rot, size, bitmap_size)
    local obj = core.add_entity(pos, "chalk:canvas")
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


function shared.etchcast(player, pos, dir)
    local ray = core.raycast(pos, pos + dir * shared.MAX_ETCH_DISTANCE, true, false)
    local pthing
    for i_pthing in ray do
        if not (i_pthing.type == "object" and i_pthing.ref == player) and
                not (i_pthing.type == "node" and not is_etchable(i_pthing.under)) then
            pthing = i_pthing
            break
        end
    end
    if not pthing or pthing.type ~= "node" or
            -- `pthing.intersection_normal == vector.zero()` if you're inside a node
            pthing.intersection_normal == vector.zero() then
        return
    end

    local node_pos = pthing.under
    local player_name = player:get_player_name()

    local raw_box = get_node_selectionboxes_cached(pthing.under)[pthing.box_id]
    if not raw_box then return end -- We have been betrayed 😱
    local box = shared.aabb.from(raw_box)
    box:repair()
    local box_center = box:get_center()

    local canvas_rot = vector.dir_to_rotation(pthing.intersection_normal)
    local canvas_prerot = vector_prerot_pre(canvas_rot)
    local rot_box = shared.aabb.new(
        vector_prerot(box.pos_min, canvas_prerot),
        vector_prerot(box.pos_max, canvas_prerot)
    )
    rot_box:repair()
    local rot_box_size = rot_box:get_size()
    local bitmap_size = calc_bitmap_size(rot_box_size)

    local canvas

    if not is_protected then
        local canvas_pos = node_pos + box_center +
            vector_prerot(vector.new(0, 0, rot_box_size.z * shared.CANVAS_OFFSET), canvas_prerot)
        canvas = find_canvas(canvas_pos)

        if not canvas then
            local canvas_size = { x = rot_box_size.x, y = rot_box_size.y }
            canvas = create_canvas(
                node_pos, canvas_pos, canvas_rot, canvas_size, bitmap_size)
            if not canvas then return end -- This is actually an error.
        end

        if not canvas then return end
    end

    local root_pos = node_pos + box_center +
        vector_prerot(vector.new(0, 0, rot_box_size.z * 0.5), canvas_prerot)
    local pointed_pos = pthing.intersection_point

    -- 2D (Z is always zero)
    local pos_on_canvas = vector.new(rot_box_size.x / 2, rot_box_size.y / 2, 0) +
        vec_to_canvas_space(pointed_pos - root_pos, canvas_prerot)

    local pos_on_bitmap_x = pos_on_canvas.x / rot_box_size.x * bitmap_size.x
    local pos_on_bitmap_y = pos_on_canvas.y / rot_box_size.y * bitmap_size.y
   
    canvas:draw_pixel(math.floor(pos_on_bitmap_x), math.floor(pos_on_bitmap_y), "#f2ebe9")
 
    
    -- shared.profiler_someone_etching = true
end

function shared.dustcast(player, pos, dir)
    local ray = core.raycast(pos, pos + dir * shared.MAX_ETCH_DISTANCE, true, false)
    local pthing
    for i_pthing in ray do
        if not (i_pthing.type == "object" and i_pthing.ref == player) and
                not (i_pthing.type == "node" and not is_etchable(i_pthing.under)) then
            pthing = i_pthing
            break
        end
    end
    if not pthing or pthing.type ~= "node" or
            -- `pthing.intersection_normal == vector.zero()` if you're inside a node
            pthing.intersection_normal == vector.zero() then
        return
    end

    local node_pos = pthing.under
    local player_name = player:get_player_name()

    local raw_box = get_node_selectionboxes_cached(pthing.under)[pthing.box_id]
    if not raw_box then return end -- We have been betrayed 😱
    local box = shared.aabb.from(raw_box)
    box:repair()
    local box_center = box:get_center()

    local canvas_rot = vector.dir_to_rotation(pthing.intersection_normal)
    local canvas_prerot = vector_prerot_pre(canvas_rot)
    local rot_box = shared.aabb.new(
        vector_prerot(box.pos_min, canvas_prerot),
        vector_prerot(box.pos_max, canvas_prerot)
    )
    rot_box:repair()
    local rot_box_size = rot_box:get_size()
    local bitmap_size = calc_bitmap_size(rot_box_size)

    local canvas

    if not is_protected then
        local canvas_pos = node_pos + box_center +
            vector_prerot(vector.new(0, 0, rot_box_size.z * shared.CANVAS_OFFSET), canvas_prerot)
        canvas = find_canvas(canvas_pos)

        if not canvas then
            local canvas_size = { x = rot_box_size.x, y = rot_box_size.y }
            canvas = create_canvas(
                node_pos, canvas_pos, canvas_rot, canvas_size, bitmap_size)
            if not canvas then return end -- This is actually an error.
        end

        if not canvas then return end
    end

    local root_pos = node_pos + box_center +
        vector_prerot(vector.new(0, 0, rot_box_size.z * 0.5), canvas_prerot)
    local pointed_pos = pthing.intersection_point

    -- 2D (Z is always zero)
    local pos_on_canvas = vector.new(rot_box_size.x / 2, rot_box_size.y / 2, 0) +
        vec_to_canvas_space(pointed_pos - root_pos, canvas_prerot)

    local pos_on_bitmap_x = pos_on_canvas.x / rot_box_size.x * bitmap_size.x
    local pos_on_bitmap_y = pos_on_canvas.y / rot_box_size.y * bitmap_size.y
   
    canvas:draw_pixel(math.floor(pos_on_bitmap_x), math.floor(pos_on_bitmap_y), "#00000000")
        local rect_x = math.round(pos_on_bitmap_x - 4 / 2)
        local rect_y = math.round(pos_on_bitmap_y - 4 / 2)

        if canvas then
            canvas:draw_rect(rect_x, rect_y)
        end

        local exceeds_left = rect_x < 0
        local exceeds_top = rect_y < 0
        local exceeds_right = rect_x + 3 > bitmap_size.x - 1
        local exceeds_bottom = rect_y + 3 > bitmap_size.y - 1

        if exceeds_left or exceeds_top or exceeds_right or exceeds_bottom then
            local spread_props = {
                player_name = player_name,
                self_node_pos = node_pos,
                self_root_pos_canvas = vec_to_canvas_space(root_pos, canvas_prerot),
                self_rot = canvas_rot,
                self_prerot = canvas_prerot,
                self_rot_box_size = rot_box_size,

                x = rect_x,
                y = rect_y,
                size = 4,
                color = "#00000000",
            }
            spread_rect_to_node(spread_props, node_pos, pthing.box_id)
            local function spread_offset(x, y)
                -- partially duplicated from vec_to_canvas_space
                spread_rect_to_node(spread_props, node_pos + vector_prerot(vector.new(-x, -y, 0), canvas_prerot))
            end

            if exceeds_left then
                spread_offset(-1, 0)
            end
            if exceeds_right then
                spread_offset(1, 0)
            end
            if exceeds_top then
                spread_offset(0, -1)
            end
            if exceeds_bottom then
                spread_offset(0, 1)
            end

            if exceeds_left and exceeds_top then
                spread_offset(-1, -1)
            end
            if exceeds_left and exceeds_bottom then
                spread_offset(-1, 1)
            end
            if exceeds_right and exceeds_top then
                spread_offset(1, -1)
            end
            if exceeds_right and exceeds_bottom then
                spread_offset(1, 1)
            end
        end
    
    -- shared.profiler_someone_etching = true
end

function shared.after_etchcasts()
    shared.update_canvases()
    get_node_selectionboxes_cache = {}
end
