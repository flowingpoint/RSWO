local S = minetest.get_translator(minetest.get_current_modname())

local ac = sum_air_currents

-- gets just the wind speed
ac.get_wind_speed = function()
  return ac.wind_speed
end


ac.get_wind_speed_at = function(p)
  if ac.get_light(p) == 15 then
    return ac.wind_speed
  else return 0 end
end


-- gets just the wind direction if not zero
ac.get_wind_dir = function()
  if ac.wind_speed ~= 0 then
    return ac.wind_dir
  else
    return vector.new(0,0,0)
  end
end


-- go some distance and tell if there are solid nodes there
ac.get_node_dist = function(p, direction, nodes)
  -- go 10 nodes in the wind direction to look for nodes
  local pos = {x=p.x, y=p.y, z=p.z}
  local dir = direction
  dir.y = 0.2 -- go up at a slight angle
  for i=1, nodes do
    pos = vector.add(pos, dir)
    local node = minetest.get_node(pos).name
    if minetest.registered_nodes[node].walkable then
      return i
    end
  end
  return nodes
end


-- get the wind as a vector
ac.get_wind = function(pos)
  if not ac.enabled then return vector.new(0,0,0) end
  local light = ac.get_light(pos)
  if light == 15 then
    return ac.wind
  end
  return vector.new(0,0,0)
end


-- DO NOT USE FOR MANY OBJECTS. DON'T FORGET THE PASSWORD.
ac.get_wind_expensive = function(p, password)
  if not ac.enabled
  or password ~= "This function call is laggy." then
    return {
      vector = vector.new(),
      speed = 0,
      strength = 0,}
  end
  local light = ac.get_light(p)
  if light < 1 then
    return {
      vector = vector.new(),
      speed = 0,
      strength = 0,}
  else
    local wind_strength = ac.get_node_dist(p, vector.multiply(ac.wind_dir, -1), 10)
    -- wind_strength = math.max(wind_strength - 0.5, 0) * 2
    if wind_strength and wind_strength > 0 then
      wind_strength = wind_strength / 10
      return {
        vector = vector.multiply(ac.wind_dir, wind_strength * ac.wind_speed),
        speed = wind_strength * ac.wind_speed,
        strength = wind_strength,}
    end
  end
  return {
    vector = vector.new(),
    speed = 0,
    strength = 0,}
end


-- apply the wind to an existing velocity
ac.apply_wind = function(vel, pos)
  if not ac.enabled then return vel end
  if not ac.do_push_entities then return vel end
  return vector.add(vel, ac.get_wind(pos))
end


-- get the light level to determine if you can have wind or not
ac.get_light = function(pos)
  local ret = 0
  if minetest.get_natural_light then
    ret = minetest.get_natural_light(pos, 0.5)
  else
    ret = minetest.get_light(pos, 0.5)
    -- so that we can use get_natural_light < 10 eg.
    if ret and ret < 15 then ret = 1 end
  end
  if not ret then ret = 0 end
  return ret
end