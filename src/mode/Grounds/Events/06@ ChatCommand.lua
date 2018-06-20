	eventChatCommand = function(n,c)
		if system.isPlayer(n) then
			-- Normalize and hide commands
			c = deactivateAccents(c)
			system.disableChatCommandDisplay(c,true)
			local p = string.split(c,"[^%s]+",string.lower)
			disableChatCommand(p[1])
	
			if not mode.grounds.isHouse then -- Not house mode
				if p[1] == mode.grounds.cmds.shop or p[1] == "o" then
					if mode.grounds.info[n].shop.accessing then
						mode.grounds.eventTextAreaCallback(nil,n,"shop.close")
					else
						if os.time() > mode.grounds.info[n].shop.timer then
							mode.grounds.info[n].shop.timer = os.time() + 1200
							mode.grounds.uishop(n)
						end
					end				
					return
				elseif p[1] == mode.grounds.cmds.profile or p[1] == "p" then
					if p[2] then
						p[2] = string.nick(p[2])
						if mode.grounds.info[p[2]] then
							mode.grounds.uiprofile(n,p[2])
						end
					else
						mode.grounds.uiprofile(n,n)
					end
					mode.grounds.info[n].profileAccessing = true
					return
				elseif p[1] == mode.grounds.cmds.leaderboard or p[1] == "k" then
					if mode.grounds.info[n].leaderboardAccessing then
						mode.grounds.eventTextAreaCallback(nil,n,"ranking.close")
					else
						if os.time() > mode.grounds.info[n].leaderboardTimer then
							mode.grounds.info[n].leaderboardTimer = os.time() + 1e3
							mode.grounds.uileaderboard(n)
						end
					end
					return
				end
			end
			
			if p[1] == mode.grounds.cmds.help or p[1] == "h" then
				if mode.grounds.info[n].menu.accessing then
					mode.grounds.eventTextAreaCallback(nil,n,"menu.close")
				else
					if os.time() > mode.grounds.info[n].menu.timer then
						mode.grounds.info[n].menu.timer = os.time() + 1e3
						mode.grounds.uimenu(n)
					end
				end
				return
			elseif p[1] == mode.grounds.cmds.langue then
				p[2] = p[2] and string.lower(p[2]) or nil
				if p[2] and (p[2] == "default" or mode.grounds.translations[p[2]]) then
					if p[2] == "default" then
						mode.grounds.info[n].langue = (mode.grounds.translations[tfm.get.room.playerList[n].community] and tfm.get.room.playerList[n].community or mode.grounds.langue)
					else
						mode.grounds.info[n].langue = string.lower(p[2])
					end
					tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",string.format(system.getTranslation(n).language,string.upper(mode.grounds.info[n].langue))),n)
				else
					tfm.exec.chatMessage(string.format("<PT>[•] <J>!%s <PS>%s",p[1],table.concat(mode.grounds.langues," <G>-</G> ")),n)
				end			
				return
			elseif p[1] == mode.grounds.cmds.info or p[1] == "?" then
				local grounds = system.getTranslation(n).grounds
				local ground = grounds[mode.grounds.info[n].powersOP.GTYPE]
				if ground then
					mode.grounds.uidisplayInfo(n,{"info","grounds",string.gsub(ground[1],"'","#"),ground[2]})
				end
				return
			elseif p[1] == "mapinfo" and mode.grounds.mapInfo[2] > 0 then
				tfm.exec.chatMessage(string.format("<PT>[•] <BV>G%s (%s) - %s - @%s",mode.grounds.mapInfo[2],mode.grounds.G[mode.grounds.mapInfo[2]].name,tfm.get.room.xmlMapInfo.author,mode.grounds.mapInfo[1]),n)
				return
			elseif p[1] == "is" then
				p[2] = p[2] or tfm.get.room.currentMap
				p[2] = tonumber(string.match(p[2],"@?(%d+)")) or 0
				
				local exist,index = table.find(mode.grounds.maps,p[2],1)
				local cat = exist and mode.grounds.maps[index][2] or 0
				tfm.exec.chatMessage(string.format("<BV>[•] @%s : %s",p[2],string.upper(tostring(exist)) .. (exist and " (G"..cat..")" or "")),n)
				return
			end
			
			if system.isRoom then
				if p[1] == mode.grounds.cmds.pw or p[1] == "pw" then
					if system.roomAdmins[n] or module._FREEACCESS[n] > 1 then
						local newPassword = p[2] and table.concat(p," ",nil,2) or ""
						local pwMsg = system.getTranslation().password
						if newPassword == "" then
							tfm.exec.chatMessage(string.format("<R>[•] %s",pwMsg.off))
						else
							local xxx = string.rep("*",#newPassword)
							for k in next,mode.grounds.info do
								if system.roomAdmins[k] and system.isPlayer(k) then
									tfm.exec.chatMessage(string.format("<R>[•] %s",string.format(pwMsg.on,newPassword)),k)
								else
									tfm.exec.chatMessage(string.format("<R>[•] %s",string.format(pwMsg.on,xxx)),k)
								end
							end
						end
						tfm.exec.setRoomPassword(newPassword)
					else
						tfm.exec.chatMessage("<ROSE>[•] /room #" .. module._NAME .. math.random(0,999) .. "@" .. n,n)
					end
					return
				end
			end
			
			local freeaccess = system.isRoom and (module._FREEACCESS[n] and module._FREEACCESS[n] > 2) or module._FREEACCESS[n]

			local mapEvaluator = table.find(mode.grounds.staff.mapEvaluators,n,1)
			if (mapEvaluator and (not system.isRoom or system.roomAdmins[n])) or freeaccess then
				if p[1] == "time" then
					tfm.exec.setGameTime(p[2] or 1e7)
					return
				elseif p[1] == "np" and p[2] then
					local official,where = table.find(mode.grounds.maps,(tonumber((string.gsub(p[2],"@",""))) or 0),1)
					if official then
						tfm.exec.newGame(mode.grounds.newMap({
							map = mode.grounds.maps[where][1],
							category = mode.grounds.maps[where][2]
						}))
					elseif string.sub(p[2],1,1) == "g" then
						local cat = tonumber((string.sub(p[2],2))) or 1
						if mode.grounds.G[cat] then
							tfm.exec.newGame(mode.grounds.newMap({
								map = table.random(mode.grounds.G[cat].queue),
								category = cat
							}))
						end
					else
						mode.grounds.mapInfo = {0,0,0,0,"CAA4CF"}
						tfm.exec.newGame(p[2])
					end
					return
				elseif p[1] == "review" and (module._FREEACCESS[n] and module._FREEACCESS[n] > 2 or mapEvaluator) then
					mode.grounds.review = not mode.grounds.review
					tfm.exec.chatMessage("<BV>[•] REVIEW MODE : " .. string.upper(tostring(mode.grounds.review)))
					tfm.exec.disableAfkDeath(mode.grounds.review)
					
					if mode.grounds.review then
						table.foreach(mode.grounds.info,tfm.exec.respawnPlayer)
					end
					
					for k,v in next,mode.grounds.staff.mapEvaluators do
						system.bindMouse(v[1],mode.grounds.review)
						for i = 1,2 do
							system.bindKeyboard(v[1],16,i == 1,true) -- Shift (Hold shift to teleport)
						end
					end
					return
				elseif _G.currentTime > 10 then
					if p[1] == "next" then
						tfm.exec.newGame(mode.grounds.newMap())
						return
					elseif p[1] == "again" then
						if tfm.get.room.currentMap then
							tfm.exec.newGame(tfm.get.room.currentMap)
						end
						return
					end
				end
			end
			
			local translator = table.find(mode.grounds.staff.translators,n,1)
			if translator or freeaccess then
				if p[1] == "check" then
					p[2] = p[2] and string.lower(p[2]) or nil
					if p[2] and mode.grounds.translations[p[2]] then
						local newP3 = p[3] and system.loadTable("mode.grounds.translations."..p[2].."."..p[3]) or {}
						if newP3 and type(newP3) == "string" then
							tfm.exec.chatMessage("<CEP>[•] [" .. p[3] .. "] : <N><VI>\"</VI>" .. newP3 .. "<VI>\"</VI>",n)
						else
							tfm.exec.chatMessage("<CEP>[•] " .. (p[3] and "Invalid! Try one of these indexes:" or "!" .. p[1] .. " " .. p[2] .. " <VI>id"),n)
							for k,v in next,mode.grounds.translationIndexes do
								tfm.exec.chatMessage("<N>\t\t" .. v,n)
							end
						end
					else
						tfm.exec.chatMessage("<CEP>[•] !" .. p[1] .. " " .. table.concat(mode.grounds.langues," <G>-</G> "),n)
					end
					return
				end
			end
		end
	end,