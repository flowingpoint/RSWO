

local ac = sum_air_currents

local default_gain = 5

ac.sound_system.register_sound({
  sound_name = "sum_air_currents_wind_low01",
  gain = default_gain,
  duration = 2.2,
  duration_normal = 4.2,
  wind_threshold = 1,
  wind_gain = 1, -- makes the gain mult by wind speed
})
ac.sound_system.register_sound({
  sound_name = "sum_air_currents_wind_low02",
  gain = default_gain,
  duration = 2.2,
  duration_normal = 2.2,
  wind_threshold = 1,
  wind_gain = 1, -- makes the gain mult by wind speed
})
ac.sound_system.register_sound({
  sound_name = "sum_air_currents_wind_low03",
  gain = default_gain,
  duration = 4.2,
  duration_normal = 4.2,
  wind_threshold = 1,
  wind_gain = 1, -- makes the gain mult by wind speed
})
ac.sound_system.register_sound({
  sound_name = "sum_air_currents_wind_low04",
  gain = default_gain,
  duration = 6.2,
  duration_normal = 6.2,
  wind_threshold = 1,
  wind_gain = 1, -- makes the gain mult by wind speed
})
ac.sound_system.register_sound({
  sound_name = "sum_air_currents_wind_low05",
  gain = default_gain,
  duration = 4.2,
  duration_normal = 4.2,
  wind_threshold = 1,
  wind_gain = 1, -- makes the gain mult by wind speed
})