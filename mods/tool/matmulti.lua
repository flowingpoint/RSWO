tool={}


local function multiply_matrices(A, B)
    local C = {}
    -- Standard Matrix Multiplication: C[i][j] = sum(A[i][k] * B[k][j])
    for i = 1, 4 do
        C[i] = {}
        for j = 1, 4 do
            local sum = 0
            for k = 1, 4 do
                sum = sum + (A[i][k] * B[k][j])
            end
            C[i][j] = sum
        end
    end
    return C
end



local function get_matrix_formspec(matrix_a, matrix_b, matrix_c)
    local fs = "size[12,10]real_coordinates[true]"
    
    -- Labels
    fs = fs .. "label[1,0.5;Matrix A]label[5.5,0.5;Matrix B]label[3.2,5.5;Result (A x B)]"

    for i = 1, 4 do
        for j = 1, 4 do
            -- Input A (Left)
            local val_a = (matrix_a and matrix_a[i][j]) or ""
            fs = fs .. ("field[%f,%f;0.8,0.8;a_%d_%d;;%s]"):format(0.5+j, 0.5+i, i, j, val_a)
            
            -- Input B (Right)
            local val_b = (matrix_b and matrix_b[i][j]) or ""
            fs = fs .. ("field[%f,%f;0.8,0.8;b_%d_%d;;%s]"):format(5.5+j, 0.5+i, i, j, val_b)
            
            -- Result C (Bottom) - using read-only label or disabled field
            local val_c = (matrix_c and matrix_c[i][j]) or "?"
            fs = fs .. ("label[%f,%f;%s]"):format(3.5+j, 5.5+i, val_c)
        end
    end

    fs = fs .. "button[10,2.5;1,1;multiply;X]"
    return fs
end

minetest.register_node("tool:matmulti", {
    description = "Matrix Multiplier Desk",
    drawtype = "nodebox",
    node_box = {type="fixed",fixed={
	  {-0.375,-0.5,-0.375, 0.375,-0.375,0.375}}},
    tiles = {"wood00.png^alpha_m.png"}, 
    use_texture_alpha = "clip",
    groups = {attached_node=1,crumbly=1,dig_immediate=1,not_in_creative_inventory=1},
    on_rightclick = function(pos, node, clicker)
        minetest.show_formspec(clicker:get_player_name(), "tool:matmulti_fs", get_matrix_formspec())
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname ~= "tool:matmulti_fs" or fields.quit then return end

    if fields.multiply then
        local A, B = {}, {}
        for i = 1, 4 do
            A[i], B[i] = {}, {}
            for j = 1, 4 do
                -- Convert empty strings to 0
                A[i][j] = tonumber(fields["a_"..i.."_"..j]) or 0
                B[i][j] = tonumber(fields["b_"..i.."_"..j]) or 0
            end
        end

        local C = multiply_matrices(A, B)
        
        -- Refresh the formspec with the result
        minetest.show_formspec(player:get_player_name(), "tool:matmulti_fs", get_matrix_formspec(A, B, C))
    end
end)
