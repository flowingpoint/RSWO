local S = minetest.get_translator(minetest.get_current_modname())

local ac = sum_air_currents

-- could cause issues with mcl if mcl changes these three lines at any point
minetest.register_privilege("weather_manager", {
	description = S("Gives ability to control weather"),
	give_to_singleplayer = false
})

minetest.register_chatcommand("wind", {
	params = "(wind | wind [on/off] | wind [speed] | wind pushplayers [true/false] | wind pushentities [true/false] | wind sound [on/off] | wind change)",
	description = S("Changes the wind speed to the specified parameter."),
	privs = {weather_manager = true},
	func = function(name, param)
		local parse1, parse2 = string.match(param, "(%w+) ?(%w+)")
		local wind_speed = tonumber(param)
    if (param == "change") then
      ac.timers.change_dir.func()
      return true, S("Wind has changed course.")
		elseif (param == "off") then
			ac.enabled = false
			return true, S("Wind is off.")
		elseif (param == "on") then
			ac.enabled = true
			return true, S("Wind is on.")
    elseif (param == "") then
			return true, S("Wind is " .. ac.wind_speed .. " toward " .. ac.wind_yaw .. ".")
		elseif type(wind_speed) == "number" then
			sum_air_currents.override_wind(wind_speed)
			return true, S("Wind is set to " .. wind_speed)
		end
		if parse1 then
      if parse1 == "pushplayers" then
        if parse2 == "true" then
          ac.do_push_players = true
          return true, S("Wind will push players.")
        elseif parse2 == "false" then
          ac.do_push_players = false
          return true, S("Wind will not push players.")
        end
      elseif parse1 == "pushentities" then
        if parse2 == "true" then
          ac.do_push_entities = true
          return true, S("Wind will push entities.")
        elseif parse2 == "false" then
          ac.do_push_entities = false
          return true, S("Wind will not push entities.")
        end
			elseif parse1 == "sound" then
				local num = tonumber(parse2)
				if type(num) == "number" then
					ac.sound_system.gain = num
					return true, S("Wind will have gain of " .. num)
				end
			end
			if wind_speed then
				return false, S("Error: windspeed " .. wind_speed)
			end
		end
		return false, S("Error: Invalid")
	end
})
