	eventNewGame = function()
		local mapName = {}
		
		mode.grounds.isOfficialMap = table.find(mode.grounds.maps,tfm.get.room.xmlMapInfo.mapCode,1)
		
		if mode.grounds.isOfficialMap then
			mapName[#mapName + 1] = "<font color='#".. mode.grounds.mapInfo[5] .."'>G" .. mode.grounds.mapInfo[2] .. "</font>"
		else
			mode.grounds.mapInfo = {0,0,0,0,"CAA4CF"}
			mode.grounds.afterFunction = (function() end)
		end

		tfm.exec.setGameTime(3 * 60)

		mode.grounds.podium = 0
		mode.grounds.availableRoom = system.isRoom and mode.grounds.totalPlayers > 2
		if not mode.grounds.availableRoom then
			if math.random(30) < 16 then
				if not system.isRoom then
					tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",system.getTranslation().countstats.tribe))
				else
					tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",system.getTranslation().countstats.mice))
				end
			end
		end

		for k,v in next,mode.grounds.info do
			if not system.isPlayer(k) then
				tfm.exec.killPlayer(k)
			end
			if v.groundsDataLoaded and mode.grounds.availableRoom then
				v.stats.rounds = v.stats.rounds + 1
			end
			v.canRev = true
			v.right = true
			v.checkpoint = -1
		end

		mode.grounds.afterFunction()
		
		mode.grounds.hasWater = false
		local deactivateWater = mode.grounds.isHouse
		
		mode.grounds.startsWith = { meep = false, cheese = false }

		mode.grounds.despawnGrounds = {}
		mode.grounds.gsys.disabledGrounds = {}
		local currentXml = tfm.get.room.xmlMapInfo

		local xmlPowers = {}
			-- Info
		xmlPowers[1] = { -- Soulmate system
			attribute = "A", -- Soulmate not allowed for rooms with odd amount of players
			func = function()
				if mode.grounds.totalPlayers % 2 ~= 0 then
					table.foreach(mode.grounds.info,tfm.exec.killPlayer)
				end
			end
		}
		xmlPowers[2] = { -- Map Width
			attribute = "L",
			func = function(size)
				if size then
					mode.grounds.mapInfo[3] = tonumber(size)
				end
			end
		}
		xmlPowers[3] = { -- Map Height
			attribute = "H",
			func = function(size)
				if size then
					mode.grounds.mapInfo[4] = tonumber(size)
				end
			end
		}
		
		mode.grounds.mapInfo[3] = math.max(800,mode.grounds.mapInfo[3])
		mode.grounds.mapInfo[4] = math.max(400,mode.grounds.mapInfo[4])
			-- Powers
		xmlPowers[4] = { -- mapname
			attribute = "mapname",
			func = function(t)
				if t ~= "" then
					mapName[#mapName + 1] = t
				end
			end
		}
		xmlPowers[5] = { -- disablepower
			attribute = "disablepower",
			func = function(g)
				for ground in string.gmatch(g,"[^,]+") do
					ground = tonumber(ground)
					if ground and not mode.grounds.gsys.disabledGrounds[ground] then
						mode.grounds.gsys.disabledGrounds[ground] = true
					end
				end
			end
		}
		xmlPowers[6] = { -- cheese
			attribute = "cheese",
			func = function()
				mode.grounds.startsWith.cheese = true
				table.foreach(mode.grounds.info,tfm.exec.giveCheese)
			end
		}
		xmlPowers[7] = { -- meep
			attribute = "meep",
			func = function()
				mode.grounds.startsWith.meep = true
				table.foreach(mode.grounds.info,tfm.exec.giveMeep)
			end
		}
		xmlPowers[8] = { -- addtime
			attribute = "addtime",
			func = function(minutes)
				tfm.exec.setGameTime((3 + (tonumber(minutes) or 0)) * 60)
			end
		}
		xmlPowers[9] = { -- notwater
			attribute = "notwater",
			func = function()
				deactivateWater = true
			end
		}
		xmlPowers[10] = { -- setvampire
			attribute = "setvampire",
			func = function(coordinates)
				if mode.grounds.totalPlayers > 2 then
					local coord,axY = xml.getCoordinates(coordinates)

					local vampires,p = {},{}
					for k,v in next,mode.grounds.info do
						if v.isOnline then
							p[#p + 1] = k
						end
					end
					local randomVamp = ""
					for i = 1,math.floor(mode.grounds.totalPlayers/3) do
						repeat
							randomVamp = table.random(p)
						until not table.find(vampires,randomVamp)
						vampires[#vampires + 1] = randomVamp
					end
					for k,v in next,vampires do
						if type(coord) == "table" then
							local c = table.random(coord)
							tfm.exec.movePlayer(v,c.x,c.y)
						else
							if axY == 0 then
								tfm.exec.movePlayer(v,coord,math.random(10,mode.grounds.mapInfo[4] - 10))
							else
								tfm.exec.movePlayer(v,math.random(10,mode.grounds.mapInfo[4] - 10),axY)
							end
						end
						tfm.exec.setVampirePlayer(v)
					end
				else
					table.foreach(mode.grounds.info,tfm.exec.setVampirePlayer)
				end
			end
		}
		xmlPowers[11] = { -- shaman
			attribute = "shaman",
			func = function(t)
				if t ~= "" then
					ui.setShamanName(t)
				end
			end
		}	

		local parameters = xml.attribFunc(currentXml.xml or "",xmlPowers)
		if mode.grounds.review then
			for k,v in next,mode.grounds.staff.mapEvaluators do
				tfm.exec.chatMessage("<BV>&lt;P> : <N>" .. tostring(parameters), v[1])
			end
		end

		mode.grounds.gsys.getGroundProperties(currentXml.xml)

		if not deactivateWater then
			for k,v in next,mode.grounds.gsys.grounds do
				if v.T == 9 then
					mode.grounds.hasWater = true
					for k,v in next,mode.grounds.info do
						v.drown = 0
						mode.grounds.displayWaterBar(k)
					end
					break
				end
			end
		end
		if not mode.grounds.hasWater then
			for i = 1,3 do
				ui.removeTextArea(i)
			end
		end
		
		local ini = ""
		local D = string.match(tfm.get.room.xmlMapInfo.xml,"<D>(.-)</D>") or ""
		for k,v in next,{"DS","T"} do
			ini = string.match(D,"<"..v.." (.-)/>")
			if ini then
				break
			end
		end
		ini = ini or ""
		local sX = string.match(ini,"X=\"(.-)\"")
		local sY = string.match(ini,"Y=\"(.-)\"")
		mode.grounds.spawnPoint = {tonumber(sX) or 0,tonumber(sY) or 0}
		
		-- Icon Image
		if mode.grounds.mapCategoryIcon ~= -1 then
			tfm.exec.removeImage(mode.grounds.mapCategoryIcon)
		end
		if mode.grounds.isOfficialMap then
			mode.grounds.mapCategoryIcon = tfm.exec.addImage(mode.grounds.G[mode.grounds.mapInfo[2]].icon[1] .. ".png","&4",10 + mode.grounds.G[mode.grounds.mapInfo[2]].icon[2],30 + mode.grounds.G[mode.grounds.mapInfo[2]].icon[3])
		else
			mode.grounds.mapCategoryIcon = -1
		end
		
		ui.setMapName(table.concat(mapName,"   <G>|<J>   ") .. (#mapName > 0 and "   <G>|<J>   " or "") .. currentXml.author .. " <BL>- " .. tfm.get.room.currentMap)
	end,
