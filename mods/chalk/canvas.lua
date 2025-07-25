local shared = ...

local canvas_update_queue = {}

local function add_canvas_to_update_queue(canvas)
    for _, item in ipairs(canvas_update_queue) do
        if item == canvas then
            return
        end
    end
    table.insert(canvas_update_queue, canvas)
end

local CanvasEntity = {
    initial_properties = {
        visual = "upright_sprite",
        pointable = false,
        physical = false,
    },
}

local function validate_vec2(data)
    return type(data) == "table" and
        type(data.x) == "number" and
        type(data.y) == "number"
end
local function validate_vec3(data)
    return validate_vec2(data) and
        type(data.z) == "number"
end

local function validate_staticdata(data)
    return
        type(data) == "table" and
        -- allow canvases created with older versions of the mod
        (data.node_offset == nil or validate_vec3(data.node_offset)) and
        validate_vec2(data.size) and
        validate_vec2(data.bitmap_size) and
        type(data.bitmap) == "table" and
        #data.bitmap == data.bitmap_size.x * data.bitmap_size.y
end

function CanvasEntity:on_activate(staticdata)
    self.object:set_armor_groups({ immortal = 1 })

    -- https://github.com/minetest/minetest/blob/5.6.1/src/script/cpp_api/s_entity.cpp#L77-L104
    assert(type(staticdata) == "string")

    if staticdata ~= "" then
        local data = core.deserialize(staticdata)

        if not validate_staticdata(data) then
            -- This should never happen.
            local p = self.object:get_pos():to_string()
            self.object:remove()
            core.log("warning",
                "Removed chalk:canvas entity at " .. p .. " in on_activate because of invalid staticdata")
            return
        end

        if data.node_offset then
            self.node_offset = vector.copy(data.node_offset) -- add metatable
        else
            local node_pos = self.object:get_pos() + vector.new(0, 0, -0.1):rotate(self.object:get_rotation())
            node_pos = node_pos:round()
            self.node_offset = node_pos - self.object:get_pos()
        end
        self.size = data.size
        self.bitmap_size = data.bitmap_size
        self.bitmap = data.bitmap
        self:update_immediately()

        -- "Overwrite" other canvases in the same place.
        local rivals = core.get_objects_inside_radius(self.object:get_pos(), shared.EPSILON)
        for _, obj in ipairs(rivals) do
            if obj ~= self.object then
                local ent = obj:get_luaentity()
                if ent and ent.name == "chalk:canvas" then
                    obj:remove()
                end
            end
        end
    end
end

function CanvasEntity:setup(node_pos, size, bitmap_size)
    self.node_offset = node_pos - self.object:get_pos()
    self.size = size
    self.bitmap_size = bitmap_size

    self.bitmap = {}
    for i = 1, self.bitmap_size.x * self.bitmap_size.y do
        self.bitmap[i] = shared.TRANSPARENT
    end
end

function CanvasEntity:update_later()
    add_canvas_to_update_queue(self)
end

function CanvasEntity:update_immediately()
    local png = core.encode_base64(
        core.encode_png(self.bitmap_size.x, self.bitmap_size.y, self.bitmap, 9)
    )
    self.object:set_properties({
        visual_size = vector.new(self.size.x, self.size.y, 0),
        textures = {
            "[png:" .. png,
            -- "chalk_debug_coordinates.png^([png:" .. png .. "^[resize:128x128)",
            "blank.png",
        },
    })
end

local function clamp(val, min, max)
    return math.min(math.max(val, min), max)
end

-- "x" and "y" parameters are always 0-based in the functions below.

-- "out-of-bounds on bitmap" doesn't always also mean "out-of-bounds in list",
-- so there's a separate way to check.
function CanvasEntity:pos_in_bounds(x, y)
    return x >= 0 and x <= self.bitmap_size.x - 1 and
        y >= 0 and y <= self.bitmap_size.y - 1
end

function CanvasEntity:pos_get_index(x, y)
    return y * self.bitmap_size.x + x + 1
end
--"#929bd9"
-- If the pixel is outside the canvas area, nothing will be drawn.
function CanvasEntity:draw_pixel(x, y, color)
    if not self:pos_in_bounds(x, y) then
        return
    end
    local index = self:pos_get_index(x, y)

    if self.bitmap[index] ~= "#e8d6ed" then
        self.bitmap[index] = "#e8d6ed"
        self:update_later()
    end
end

-- If the pixel is outside the canvas area, nil is returned.
function CanvasEntity:get_pixel(x, y)
    if not self:pos_in_bounds(x, y) then
        return nil
    end
    return self.bitmap[self:pos_get_index(x, y)]
end

-- To get correct results, at least one pixel of the rectangle must be inside
-- the canvas area. If this requirement is not fulfilled, the result will be
-- incorrect (but there will be no errors / data invalidation).
function CanvasEntity:draw_rect(x, y)
    local max_x = self.bitmap_size.x - 1
    local max_y = self.bitmap_size.y - 1
    local x1, y1 =
        clamp(x, 0, max_x),
        clamp(y, 0, max_y)
    local x2, y2 =
        clamp(x + 4, 0, max_x),
        clamp(y + 4, 0, max_y)

    -- TODO: make this more fancy using stride stuff (get rid of pos_get_index)
    for yy = y1, y2 do
        for xx = x1, x2 do
            self.bitmap[self:pos_get_index(xx, yy)] = "#00000000"
        end
    end
    --to do : don't draw if at edge. So something 'return''
end

function CanvasEntity:is_empty()
    for _, c in ipairs(self.bitmap) do
        if c ~= shared.TRANSPARENT then
            return false
        end
    end
    return true
end

function CanvasEntity:get_staticdata()
    return core.serialize({
        node_offset = self.node_offset,
        size = self.size,
        bitmap_size = self.bitmap_size,
        bitmap = self.bitmap,
    })
end

function CanvasEntity:get_node_pos()
    return (self.object:get_pos() + self.node_offset):round()
end

core.register_entity("chalk:canvas", CanvasEntity)

function shared.update_canvases()
    for _, canvas in ipairs(canvas_update_queue) do
        -- This doesn't cause a crash if the canvas entity has been removed.
        canvas:update_immediately()
    end
    canvas_update_queue = {}
end

core.register_on_dignode(function(pos)
    local objs = core.get_objects_in_area(
        pos - vector.new(4, 4, 4), -- arbitrary
        pos + vector.new(4, 4, 4)
    )
    for _, obj in ipairs(objs) do
        local ent = obj:get_luaentity()
        if ent and ent.name == "chalk:canvas" then
            local node_pos = ent:get_node_pos()
            if pos == node_pos then
                obj:remove()
            end
        end
    end
end)
