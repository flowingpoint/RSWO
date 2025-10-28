local S = minetest.get_translator(minetest.get_current_modname())

local ac = sum_air_currents

ac.sound_system = {
  sound_list = {length = 0},
  playing = {handle = nil, ref = nil},
  play_time = 0,
  gain = 1,
}

ac.sound_stop = function()
  -- minetest.sound_stop(ac.sound_system.playing)
  for _, player in pairs(minetest.get_connected_players()) do
    if ac.sound_system.playing[player] then
      if minetest.sound_fade ~= nil then
        minetest.sound_fade(ac.sound_system.playing[player], 1, 0)
      else
        minetest.sound_stop(ac.sound_system.playing[player])
      end
    end
  end

  ac.sound_system.playing = {handle = nil, ref = nil}
  ac.sound_system.play_time = math.random(-5,0)
end

ac.sound_play = function(sound_index)
  local params = ac.sound_system.sound_list[sound_index]
  ac.sound_system.playing.ref = ac.sound_system.sound_list[sound_index]
  if not params then return end
  ac.sound_system.playing.handle = 1

  if ac.wind_speed < 0.3 then return end

  local sound_chance = 1 --ac.wind_speed / ac.max_wind_speed + 0.2
  if math.random(0, 100) > sound_chance * 100 then return end
  for _, player in pairs(minetest.get_connected_players()) do
    local pos = player:get_pos()
    local light = ac.get_light(pos)
    if light > 1  then
      local wind_strength = math.max(((light)/15)) * ac.wind_speed
      local gain = math.min(math.max(wind_strength/8, 1.2) * ac.sound_system.gain, 50)
      local pitch = math.min(wind_strength / ac.max_wind_speed + 0.5, 1.5)
      pos = vector.add(pos, vector.multiply(ac.wind_dir, -10))

      params.duration = params.duration_normal / pitch

      ac.sound_system.playing[player] = minetest.sound_play(
        params.sound_name, {
        to_player = player:get_player_name(),
        sound_name = params.sound_name,
        gain = gain,
        max_hear_distance = 20000,
        pos = pos,
        pitch = pitch,
      })
    end
  end
end


ac.sound_system.register_sound = function(params)
  if type(params) == "table" then
    local list = ac.sound_system.sound_list
    list[list.length] = params
    list.length = list.length + 1
  else
    error("\n\nac.sound_system.register_sound cannot accept anything but a table. Make sure it has a name = \"something\".\n" .. type(params) .. "\n")
  end
end

dofile(minetest.get_modpath("sum_air_currents") .. DIR_DELIM .. "sound_data.lua")

ac.sound_pick = function()
  local sound_index = math.floor(math.random(0, ac.sound_system.sound_list.length))
  ac.sound_play(sound_index)
end

ac.do_sound_countdown = function(dtime)
  if not ac.sound_system.playing.handle then return end
  ac.sound_system.play_time = ac.sound_system.play_time + dtime
  if ac.sound_system.playing.ref
  and ac.sound_system.play_time > ac.sound_system.playing.ref.duration then
    ac.sound_stop()
  end
end

local globalstep_timer = 0
ac.do_sound_update = function(dtime)
  if not ac.enabled then
    if ac.sound_system.playing.handle then
      ac.sound_stop()
    end
    return
  end
  ac.do_sound_countdown(dtime)
  if not ac.sound_system.playing.handle then
    ac.sound_pick()
  end
  if globalstep_timer < 1 then
    globalstep_timer = globalstep_timer + dtime
    return
  else
    globalstep_timer = globalstep_timer - 1
  end
end


minetest.register_globalstep(ac.do_sound_update)