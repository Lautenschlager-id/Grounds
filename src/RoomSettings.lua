system.roomSettings = {
	[1] = {
		char = "@",
		execute = function(n)
			if n and #n > 2 then
				system.roomAdmins[string.nick(n)] = true
			end
		end
	},
	[2] = {
		char = "#",
		execute = function(name)
			if name then
				local game = system.getGameMode(name)
				if not game then
					system.gameMode = module._NAME
				end
			end
		end
	},
	[3] = {
		char = "*",
		execute = function(id)
			system.miscAttrib = tonumber(id) or 1
			system.miscAttrib = math.setLim(system.miscAttrib,1,99)
		end
	},
	[4] = {
		char = "!",
		execute = function(langue)
			if langue and #langue > 0 then
				system.roomLanguage = string.lower(langue)
			end
		end
	},
}

system.setRoom = function()
	if system.isRoom and system.roomAttributes then
		for playerName in string.gmatch(system.roomAttributes, system.roomSettings[1].char .. "(%+?[a-zA-Z0-9_]+#%d%d%d%d)") do
			system.roomSettings[1].execute(playerName)
		end
	
		system.roomSettings[2].execute(string.match(system.roomAttributes, system.roomSettings[2].char .. "([%a_]+)"))
		
		local characters = table.list(system.roomSettings, "", function(index, value) return value.char end, 3)
		for char, value in string.gmatch(system.roomAttributes, "([" .. characters .. "])([^" .. characters .. "]+)") do
			for id, setting in next, system.roomAttributes do
				if setting.char == char then
					setting.execute(string.gmatch(value, "%S+"))
		
					break
				end
			end
		end
		
		local officialModes = {
			{"vanilla","<VP>Enjoy your vanilla (: .. okno"},
			{"survivor","<R>Aw, you cannot play survivor on #grounds"},
			{"racing","<CH>Uh, racing? Good luck!"},
			{"music","<BV>Music? Nice choice! Why don't you try a rock'n'roll?"},
			{"bootcamp","<PT>Bootcamp? Ok. This is unfair and your data won't be saved out of the room."},
			{"defilante","<R>Aw, you cannot play defilante on #grounds"},
			{"village","<R>You cannot play village on #grounds. Please, change your room."},
		}
		for k, v in next, officialModes do
			if string.find(string.lower(system.roomAttributes), v[1]) then
				system.officialMode = {v[1], v[2]}
				break
			end
		end
	end
end