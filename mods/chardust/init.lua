local shared = {}
shared.ETCH_DURATION = 5 * 60
shared.ETCH_STEP_INTERVAL = 0.1
shared.NUM_ETCH_STEPS = 5
shared.MAX_ETCH_DISTANCE = 4
shared.DESIRED_PIXEL_SIZE = 1/16
shared.TRANSPARENT = "#00000000"
shared.WHITE = "#c8c8c8"
shared.YELLOW = "#fcf611"
shared.PURPLE = "#d80481"
shared.CYAN = "#00959d"
shared.CANVAS_OFFSET = 0.501
shared.EPSILON = 0.0001

local basepath = core.get_modpath("chardust")
assert(loadfile(basepath .. "/items.lua"))(shared)

