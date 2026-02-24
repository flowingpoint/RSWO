tool={}
local function multiply_quaternions(q1, q2)
    return {
        w = q1.w*q2.w - q1.i*q2.i - q1.j*q2.j - q1.k*q2.k,
        i = q1.w*q2.i + q1.i*q2.w + q1.j*q2.k - q1.k*q2.j,
        j = q1.w*q2.j - q1.i*q2.k + q1.j*q2.w + q1.k*q2.i,
        k = q1.w*q2.k + q1.i*q2.j - q1.j*q2.i + q1.k*q2.w
    }
end

local function get_quat_formspec(q1, q2, res)
    local fs = "size[8,6]real_coordinates[true]"
    
    -- Headers
    fs = fs .. "label[0.5,0.5;Quaternion A (w, x, y, z)]"
    fs = fs .. "label[4.5,0.5;Quaternion B (w, x, y, z)]"

    -- Inputs for Q1 and Q2
    local comps = {"w", "i", "j", "k"}
    for idx, c in ipairs(comps) do
        local val1 = (q1 and q1[c]) or ""
        local val2 = (q2 and q2[c]) or ""
        fs = fs .. ("field[%f,1;0.8,0.8;q1_%s;;%s]"):format(0.5 + (idx-1), c, val1)
        fs = fs .. ("field[%f,1;0.8,0.8;q2_%s;;%s]"):format(4.5 + (idx-1), c, val2)
    end

    -- Result Section
    fs = fs .. "button[3.5,2.5;1,0.8;calculate;X]"
    fs = fs .. "label[2.5,4;Resulting Quaternion:]"
    
    if res then
        local res_str = string.format("w: %.2f, i: %.2f, j: %.2f, k: %.2f", res.w, res.i, res.j, res.k)
        fs = fs .. "label[2.5,4.5;" .. minetest.formspec_escape(res_str) .. "]"
    end

    return fs
end


minetest.register_node("tool:quat_calc", {
    description = "Quaternion Multiplier",    
    drawtype = "nodebox",
    node_box = {type="fixed",fixed={
	  {-0.375,-0.5,-0.375, 0.375,-0.375,0.375}}},
    tiles = {"wood00.png^l.png^r.png"}, 
    use_texture_alpha = "clip",
    groups = {attached_node=1,crumbly=1,dig_immediate=1,not_in_creative_inventory=1},
    on_rightclick = function(pos, node, clicker)
        minetest.show_formspec(clicker:get_player_name(), "tool:quat_fs", get_quat_formspec())
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "tool:quat_fs" or fields.quit then return end

    if fields.calculate then
        local q1 = {
            w = tonumber(fields.q1_w) or 0, i = tonumber(fields.q1_i) or 0,
            j = tonumber(fields.q1_j) or 0, k = tonumber(fields.q1_k) or 0
        }
        local q2 = {
            w = tonumber(fields.q2_w) or 0, i = tonumber(fields.q2_i) or 0,
            j = tonumber(fields.q2_j) or 0, k = tonumber(fields.q2_k) or 0
        }

        local result = multiply_quaternions(q1, q2)
        minetest.show_formspec(player:get_player_name(), "tool:quat_fs", get_quat_formspec(q1, q2, result))
    end
end)
