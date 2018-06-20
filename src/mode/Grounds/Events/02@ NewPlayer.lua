	eventNewPlayer = function(n)
		tfm.exec.chatMessage(string.format("%s[•] %s%s\n\n<G>[^_^] %s%s",mode.grounds.welcomeMessage[2],mode.grounds.welcomeMessage[3],string.format(system.getTranslation().welcome,"<ROSE>" .. module._NAME .. mode.grounds.welcomeMessage[1]),mode.grounds.welcomeMessage[4],string.format(system.getTranslation().developer,"Bolodefchoco")),n)
		if math.random(10) < 3 then
			tfm.exec.chatMessage("<ROSE>[•] Play #powers at /room #powers",n)
		end
		
		if system.isPlayer(n) then
			for _,key in next,mode.grounds.bindKeys do
				if key < 4 then
					system.bindKeyboard(n,key,false,true)
				end
				system.bindKeyboard(n,key,true,true)
			end
			
			if mode.grounds.review then
				tfm.exec.respawnPlayer(n)
			end
		else
			tfm.exec.chatMessage("<R>Souris! :(",n)
		end
		if not mode.grounds.info[n] then
			mode.grounds.info[n] = {
				groundsDataLoaded = true,
				showHelp = true,
				right = true,
				langue = mode.grounds.langue,
				isWalking = false,
				holdingShift = false,
				drown = 0,
				ranking = -1,
				canRev = false,
				checkpoint = -1,
				shop = {
					accessing = false,
					page = 0,
					timer = 0,
					image = {},
				},
				menu = {
					accessing = false,
					page = 0,
					timer = 0,
					showPopup = true,
				},
				profileAccessing = false,
				leaderboardAccessing = false,
				profileTimer = 0,
				leaderboardTimer = 0,
				isOnline = true,
				stats = {
					groundsCoins = 1000,
					rounds = 0,
					podiums = 0,
					deaths = 0,
					powers = {
						ice = {25,100,1}, -- power, timer, level
						lava = {0,1}, -- power, level
						sand = {1,1}, -- Txtarea opacity, level
						cloud = {35,100,1}, -- power, timer, level
						water = {5,1}, -- power, level
						stone = {15,2500,700,1}, -- size, despawn timer, timer, level
						snow = {5,100,1}, -- power, timer, level
						spiderweb = {0,1}, -- power, level
					},
				},
				powersOP = {
					TIMER = 0,
					GTYPE = -1,
				},
				infoImage = {},
			}
			if not mode.grounds.isHouse then
				ui.addTextArea(0,"",n,-1500,-1500,3e3,3e3,1,1,.8,true)
				mode.grounds.uimenu(n)
			end
		end
	
		mode.grounds.info[n].isOnline = true
		mode.grounds.info[n].canRev = false
	end,
