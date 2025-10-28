local S = minetest.get_translator(minetest.get_current_modname())

local ac = sum_air_currents

local function get_overall_velocity(vector)
	local v = math.sqrt(vector.x^2 + vector.y^2 + vector.z^2)
	return v
end

local clamp = function(num, min, max)
  return (math.min(math.max(num, min), max))
end

ac.particles = {
	last_node = {}
}

local particle_colors = {
	length = 5,
}
particle_colors[0] = "#335446" .. "33" -- green
particle_colors[1] = "#536946" .. "33" -- green
particle_colors[2] = "#695e46" .. "33" -- brown
particle_colors[3] = "#594238" .. "33" -- brown
particle_colors[4] = "#cccde5" -- white
particle_colors[5] = "#cccde5" -- white
particle_colors[6] = "#cccde5" -- white

ac.particles.spawn_particles = function(player, amount, override_light)
	local player_name = player:get_player_name()
	local spread = 30
	local pos = player:get_pos()
	pos = vector.add(pos, vector.multiply(ac.wind_dir, -4 - (ac.wind_speed/2)))
	pos.y = pos.y + spread / 3

	for i=1, amount do
		local p = vector.offset(pos, math.random(-100, 100)/100*spread, math.random(-100, 100)/100*spread, math.random(-100, 100)/100*spread)
		local light = ac.get_light(p)
		if light == 15 or override_light then
			local color = math.floor(math.random(0, 6))
			color = particle_colors[color]
			minetest.add_particle({
				pos = p,
				velocity = vector.multiply(ac.wind, 5),
				expirationtime = math.random(5, 10)/2,
				size = math.random(70, 200)/80,
				collisiondetection = true,
				collision_removal = true,
				vertical = false,
				-- node = {name = node_tex, param2 = 0},
				-- node_tile = 1,
				texture = "sum_air_currents_speed_trail.png^[colorize:" .. tostring(color) .. ":255",
				playername = player_name,
			})
		end
	end
end

local do_player_particles = function(dtime)
	if not ac.enabled then return end
  if not ac.do_player_particles then return end

  local players = minetest.get_connected_players()
  for _, player in pairs(players) do
    local p = player:get_pos()
		p = vector.offset(p, 0, 1, 0)
		local light = ac.get_light(p)
		local ctrl = player:get_player_control()
		local is_sneaking = (ctrl and ctrl.sneak)
		local wind = ac.get_wind_expensive(p, "This function call is laggy.")
		local v = wind.vector

    if wind.strength > 0.1
		and ac.do_push_players == true and not is_sneaking then
      local vel = {
        x = clamp(wind.vector.x, -ac.max_player_push, ac.max_player_push),
        y = clamp(wind.vector.y, -ac.max_player_push, ac.max_player_push),
        z = clamp(wind.vector.z, -ac.max_player_push, ac.max_player_push),
      }
      player:add_velocity(vector.multiply(vel, 0.05))
    end

    if ac.wind_speed > 0 and light > 0 and ac.do_player_particles and get_overall_velocity(v) > ac.player_particles_threshold
    and math.random(0, ac.max_wind_speed) < ac.wind_speed then
			ac.particles.spawn_particles(player,
			math.floor(ac.wind_speed + 1), false)
    end
  end
end

minetest.register_globalstep(do_player_particles)
