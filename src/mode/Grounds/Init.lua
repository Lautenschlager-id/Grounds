	reset = function()
		-- Settings and modes
		mode.grounds.welcomeMessage = (function()
			if system.roomNumber == 666 then
				return {"<R>","<R>","<R>","<R>"}
			else
				return {"<BV>","<PT>","<BV>","<VP>"}	
			end
		end)()
		
		mode.grounds.isHouse = system.roomNumber == 801 or system.officialMode[1] == "village"
		mode.grounds.review = false
		
		-- Data
		mode.grounds.info = {}
		
		-- Maps
		mode.grounds.rotation = {1,{9,7,4,1,5,7,10,8,6,11,2,1,3,5}}
	end,
	init = function()
		-- Shuffle the map rotation and adds to the Map list
		for k,v in next,mode.grounds.G do
			v.queue = table.shuffle(v.queue) -- May need a loop before this one
			for i,j in next,v.queue do
				mode.grounds.maps[#mode.grounds.maps + 1] = {j,k}
			end
		end
	
		-- Organizates the staff table
		for k,v in next,mode.grounds.staff do
			table.sort(v,function(t1,t2) return t2[1] > t1[1] end)
		end
		
		-- Organizes the languages
		mode.grounds.langues = (function()
			local l = {}
			for id in next,mode.grounds.translations do
				l[#l + 1] = string.upper(id)
			end
			table.sort(l)
			return l
		end)()
		
		-- Translation indexes
		mode.grounds.translationIndexes = mode.grounds.listener(mode.grounds.translations.en,{})
		
		-- Sets the shop prices, upgrades, etc
		mode.grounds.shop.grounds = {
			-- Ground ID, #Possible upgrades (Imgs), Price average, Upgrade average
			[1] = {1,mode.grounds.shop.unpackImages(1,3),1.05,1.5},
			[2] = {7,mode.grounds.shop.unpackImages(7,4),.4,2},
			[3] = {8,mode.grounds.shop.unpackImages(8,3),1.15,1.47},
			[4] = {9,mode.grounds.shop.unpackImages(9,3),1.6,.6},
			[5] = {10,mode.grounds.shop.unpackImages(10,3),1.1,1.65},
			[6] = {11,mode.grounds.shop.unpackImages(11,5),.5,1.42},
		}
		
		-- Sets the commands
		mode.grounds.cmds = system.getTranslation().commands

		-- Official modes running together
		if system.officialMode[1] == "racing" then
			mode.grounds.rotation = {1,{7}}
		elseif system.officialMode[1] == "bootcamp" then
			mode.grounds.rotation = {1,{3}}
		end
		
		-- House system
		if mode.grounds.isHouse then
			system.isRoom = false
			mode.grounds.rotation = {1,{12}}
			tfm.exec.disableAfkDeath()
		end
		
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","MinimalistMode","PhysicalConsumables"} do
			tfm.exec["disable"..f]()
		end
		tfm.exec.setAutoMapFlipMode(false)
		tfm.exec.setRoomMaxPlayers(16)
		
		mode.grounds.alivePlayers,mode.grounds.totalPlayers = system.players()
		
		mode.grounds.uileaderboard()
		system.newTimer(function()
			tfm.exec.newGame(mode.grounds.newMap())
		end,1000,false)
	end,