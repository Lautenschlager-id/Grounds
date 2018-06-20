	resetNoel = function()
		mode.xmas.initx = 240
		mode.xmas.inity = 140
		mode.xmas.noel.x = mode.xmas.initx
		mode.xmas.noel.y = mode.xmas.inity
		mode.xmas.noel.id = -1
		mode.xmas.noel.isEscaping = false
		mode.xmas.noel.isDizzy = {0,false}
		mode.xmas.noel.timers = {
			teleport = 0,
			prize = 0
		}
	end,