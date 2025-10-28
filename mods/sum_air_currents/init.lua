local S = minetest.get_translator(minetest.get_current_modname())

sum_air_currents = {
  enabled = true,
  -- constants
  max_wind_speed = 10, -- maxiumum speed of wind unless changed with commands
  max_player_push = 30,
  wind_change_mult = 1, -- how fast the wind gets up to speed
  stillness_chance = 0.5, -- chance that the wind will decide to stay 0 this time
  player_particles_threshold = 0.3, -- minimum wind speed to spawn wind particles
  -- realtime vars (DONT CHANGE THESE)
  wind_yaw = 3.14, -- affects dir
  wind_dir = vector.new(0,0,0), -- dir of the yaw
  wind_speed = 0, -- wind speed currently (pun unintended)
  wind = vector.new(0,0,0), -- ACTUAL wind, as calculated with wind_dir and wind_speed
  -- for interpolation
  new_wind_yaw = 3.14, -- affects dir
  new_wind_dir = vector.new(0,0,0), -- dir of the yaw
  new_wind_speed = 0, -- wind speed currently (pun unintended)
  --
  old_wind_yaw = 3.14, -- affects dir
  old_wind_dir = vector.new(0,0,0), -- dir of the yaw
  old_wind_speed = 0, -- wind speed currently (pun unintended)
  -- enables features (setting them here does nothing)
  do_player_particles = false,
  do_push_entities = false,
  do_push_players = false,
  is_wind_predictable = false,
}

local ac = sum_air_currents

dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "utility_functions.lua")
dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "api.lua")
dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "sound.lua")
dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "particles.lua")
dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "commands.lua")
dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "items.lua")

-- load settings
ac.max_wind_speed = tonumber(minetest.settings:get("wind_max_speed") or ac.max_wind_speed)
ac.max_player_push = tonumber(minetest.settings:get("wind_max_player_push") or ac.max_player_push)
ac.wind_change_mult = tonumber(minetest.settings:get("wind_change_mult") or ac.wind_change_mult)
ac.stillness_chance = tonumber(minetest.settings:get("wind_stillness_chance") or ac.stillness_chance)
ac.do_player_particles = minetest.settings:get_bool("wind_player_particles") ~= false
ac.do_push_players = minetest.settings:get_bool("wind_push_players") ~= false
ac.do_push_entities = minetest.settings:get_bool("wind_push_entities") ~= false
ac.is_wind_predictable = minetest.settings:get_bool("wind_predictable") ~= false
ac.sound_system.gain = tonumber(minetest.settings:get("wind_volume") or 1)

local clamp = function(num, min, max)
  return (math.min(math.max(num, min), max))
end

local globalstep_timer = 1 -- start immediately
ac.timers = {
  change_dir = {time = 0, trigger = 20, func = nil, trigger_min = 30, trigger_max = 300},
}
-- load timer settings
ac.timers.change_dir.trigger_min = tonumber(minetest.settings:get("wind_change_time_min") or ac.timers.change_dir.trigger_min)
ac.timers.change_dir.trigger_max = tonumber(minetest.settings:get("wind_change_time_max") or ac.timers.change_dir.trigger_max)


sum_air_currents.get_new_wind_direction = function()
  ac.old_wind_yaw = ac.new_wind_yaw
  ac.old_wind_dir = ac.new_wind_dir
  ac.old_wind_speed = ac.new_wind_speed
  --
  if math.random(0, 100)/100 < ac.stillness_chance then
    ac.new_wind_speed = 0
  elseif ac.is_wind_predictable then
    ac.new_wind_yaw = (ac.new_wind_yaw + (math.pi / 2.1)) % (math.pi * 2)
    ac.new_wind_speed = (ac.new_wind_speed + ac.max_wind_speed * 1.6) % ac.max_wind_speed
  else
    ac.new_wind_yaw = math.random(0, 100) * math.pi * 2 / 100
    ac.new_wind_speed = (math.random(0, ac.max_wind_speed*100) / 100)
  end
end


sum_air_currents.timers.change_dir.func = function()
  ac.get_new_wind_direction()

  ac.timers.change_dir.time = 0

  ac.interpolate()
end


sum_air_currents.override_wind = function(wind_speed)
  ac.old_wind_speed = wind_speed
  ac.new_wind_speed = wind_speed
  ac.wind_speed = wind_speed
end


-- updates the dir and sped and wind values
sum_air_currents.update_values = function()
  ac.wind_dir = minetest.yaw_to_dir(ac.wind_yaw)
  ac.wind = vector.multiply(ac.wind_dir, ac.wind_speed)
end


-- interpolate between current wind and the next wind change
sum_air_currents.interpolate = function()
  -- ratio 0 : just started counting
  -- ratio 1 : finished counting
  -- ratio 0.1 : 10% through counting
  local r = math.min((ac.timers.change_dir.time / ac.timers.change_dir.trigger) * 5, 1)
  ac.wind_yaw = ac.old_wind_yaw * (1-r) + ac.new_wind_yaw * (r)
  ac.wind_speed = ac.old_wind_speed * (1-r) + ac.new_wind_speed * (r)
  ac.update_values()
end


sum_air_currents.on_step = function(dtime)
  if not ac.enabled then return end
  -- only do it once a second
  if globalstep_timer > 1 then
    globalstep_timer = globalstep_timer - 1
    for _, timer in pairs(ac.timers) do
      timer.time = timer.time + 1
      if timer.func ~= nil
      and timer.time >= timer.trigger then
        timer.trigger = math.random(timer.trigger_min, timer.trigger_max)
        timer.func()
      end
    end
  else
    globalstep_timer = globalstep_timer + dtime
    return
  end
  -- the rest will happen once per sec

  -- interpolate between the values of old and new
  ac.interpolate()
end


minetest.register_globalstep(sum_air_currents.on_step)

ac.get_new_wind_direction()
ac.get_new_wind_direction()
ac.override_wind(0)
