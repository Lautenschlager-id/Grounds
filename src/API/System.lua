events = {}
currentTime,leftTime = 0,0
system.loadTable = function(s)
	-- "a.b.c.1" returns a[b][c][1]
	local list
	for tbl in string.gmatch(s,"[^%.]+") do
		tbl = tonumber(tbl) or tbl
		list = (list and list[tbl] or _G[tbl])
	end
	return list
end
system.getTranslation = function(flag)
	if flag and #flag > 2 then
		if mode[system.gameMode].info[flag] then
			flag = mode[system.gameMode].info[flag].langue
		end
	end
	return mode[system.gameMode].translations[flag or mode[system.gameMode].langue or tfm.get.room.community] or mode[system.gameMode].translations['en']
end

system.looping = function(f,tick)
	local s = 1000 / tick
	local t = {}
	
	local fooTimer = function()
		t[#t+1] = system.newTimer(f,1000,true)
	end
	for timer = 0,1000 - s,s do
		system.newTimer(fooTimer,1000 + timer,false)
	end
	return t
end
