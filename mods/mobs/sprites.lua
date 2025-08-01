local S = mobs.intllib

--Guy from Vampire story who's girlfriend gets stolen by the vampire in the hotel.

mobs:register_mob("mobs:swinepine", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"swinepine_f.png","swinepine_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:swinepine"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end
})

mobs:register_egg("mobs:swinepine", "Swinepine", "swinepine_f.png")

--Lamb the supervisor of the pipe factory from Beneath a Steel Sky

mobs:register_mob("mobs:inokuin", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"inokuin_f_" ..math.random(1,2).. ".png","inokuin_r_" ..math.random(1,2).. ".png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:inokuin"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:inokuin", "Inokuin", "inokuin_f_0.png")

--Anita the technician from Beneath a Steel Sky

mobs:register_mob("mobs:beka", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {"beka_f_1.png","beka_r_1.png"},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:beka"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:beka", "Beka", "beka_f_0.png")

--The Jester from Lure of The Temptress, who get's rescued from the rack in the torture room.

mobs:register_mob("mobs:cedry", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"cedry_f.png","cedry_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:cedry"},
	jump = true,
	rotate = 0,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:cedry", "Cedry", "cedry_f.png")

--The Main guy, Robert Foster, from Beneath A Steel Sky

mobs:register_mob("mobs:demopay", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"demopay_f.png","demopay_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:demopay"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:demopay", "Demopay", "demopay_f.png")

--Foster in a radiation suit

mobs:register_mob("mobs:etoll", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"etoll_f.png","etoll_r.png"}},
	walk_velocity =0,
	run_velocity = 5,
	follow = {"mobs:etoll"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:etoll", "Etoll", "etoll_f.png")

--The Detective in the French Templar One

mobs:register_mob("mobs:feylo", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"feylo_f.png","feylo_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:feylo"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:feylo", "Feylo", "feylo_f.png")

--The main guy of lure of the temptress, who burns the straw in his cell after being captured, frees the Jester, and has to figure out a way to give the guy in chains water, and find the key out of the torture room etc...

mobs:register_mob("mobs:graz", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"graz_f.png","graz_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:graz"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:graz", "Graz", "graz_f.png")

--The cool hooded figure of IonFury, staffed up, but it's also the player avatar.

mobs:register_mob("mobs:hazma", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"hazma_f.png","hazma_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:hazma"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:hazma", "Hazma", "hazma_f.png")

--The Skorl of Lure of The Temptress

mobs:register_mob("mobs:isoma", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"isoma_f_"..math.random(0,3)..".png","isoma_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:isoma"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:isoma", "Isoma", "isoma_f_0.png")

--The main guy of Flight of the amazon queen, who lets say exlored a wierd jungle.

mobs:register_mob("mobs:oreon", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"oreon_f.png","oreon_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:oreon"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:oreon", "Oreon", "oreon_f.png")

--The mechanic of the room with the lathe machine in Beneath a Steel Sky, the guy in green overalls who goes to court to argue about a guard laughing at him because some water splashed on him.

mobs:register_mob("mobs:penta", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"penta_f.png","penta_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:penta"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:penta", "Penta", "penta_f.png")

--The Pipe clipboard guy who check Foster didn't steal anything, who owns the WD40.

mobs:register_mob("mobs:veiko", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -1, -0.1, 0.1, 0.95, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=2},
	textures = {{"veiko_f.png","veiko_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:veiko"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:veiko", "Veiko", "veiko_f.png")

--Robert's robot friend Joey, in its third and penultimate form, a domestic health-bot.

mobs:register_mob("mobs:jel", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -0.5, -0.1, 0.1, 0.45, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=1},
	textures = {{"jel_f.png","jel_r.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:jel"},
	jump = true,
	jump_height = 0.025,
	view_range = 20,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:jel", "Jel", "jel_f.png")

--Reo is a magpie

mobs:register_mob("mobs:reo", {
	type = "npc",
	hp_min = 33,
	hp_max = 50,
	collisionbox = {-0.1, -0.5, -0.1, 0.1, 0.45, 0.1},
	visual = "upright_sprite",
	visual_size = {x=1,y=1},
	textures = {{"reo_r.png","reo_l.png"}},
	walk_velocity = 0,
	run_velocity = 5,
	follow = {"mobs:reo"},
	jump = true,
	jump_height = 5,
	view_range = 50,
	light_damage = -1,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs:reo", "Reo", "reo_r.png")
