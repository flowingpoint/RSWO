local t = tool
local database_path = minetest.get_worldpath() .. "/tp_db.json"

local portals

local file = io.open(database_path,"r")
if file then
	local portal_string = file:read("*all")
	if portal_string and portal_string ~= "" then
		portals = minetest.parse_json(portal_string)
	end
	file:close()
end

if not portals then
	portals = {}
end

local function save_database()
	local file = assert(io.open(database_path,"w"))
	local database_string = minetest.write_json(portals,true)
	if database_string then
		file:write(database_string)
	end
	file:close()
end

t.set_portal = function(pos,name)
	if not name or not pos then
		return false
	end
	if portals[name] then
		-- Report if needed
	end
	portals[name] = pos
	save_database()
	minetest.chat_send_all("Set portal: " .. name)
	return true
end

t.remove_portal = function(name)
	if not name or not portals[name] then
		return false
	end
	portals[name] = nil
	save_database()
	minetest.chat_send_all("Removed portal: " .. name)
	return true
end

t.get_portal = function(name)
	return portals[name]
end
