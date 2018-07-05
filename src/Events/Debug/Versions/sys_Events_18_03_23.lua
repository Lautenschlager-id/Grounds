	--[[ eventLoop ]]--
events.eventLoop = function(currentTime,leftTime)
	_G.currentTime = math.round(currentTime / 1e3)
	_G.leftTime = math.round(leftTime / 1e3)
end
	--[[ eventNewPlayer ]]--
events.eventNewPlayer = function(n)
	tfm.exec.lowerSyncDelay(n)
	
	if system.officialMode[2] ~= "" then
		tfm.exec.chatMessage(system.officialMode[2],n)
	end
end
	--[[ eventChatCommand ]]--

events.eventChatCommand = function(n,c)
	if system.isPlayer(n) then
		system.disableChatCommandDisplay(c,true)
		
		local p = string.split(c,"[^%s]+",string.lower)
		disableChatCommand(p[1])
	
		if module._FREEACCESS[n] then
			if p[1] == "refresh" and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				tfm.exec.chatMessage("[#bolo] Refreshing the module...")
				eventModeChanged()
				system.init(true)
				return
			end
			
			if p[1] == "room" and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				local room = tonumber(p[2]) or 0
				if _G["eventChatCommand"] and system.roomNumber ~= room then
					system.roomNumber = room
					tfm.exec.chatMessage("[#bolo] Room number changed.")
					eventChatCommand(n,"refresh")
				end
				return
			end
			
			if p[1] == "setmisc" and p[2] and (module._FREEACCESS[n] > 1 or not system.isRoom) then
				system.miscAttrib = tonumber(p[2]) or 0
				system.miscAttrib = math.setLim(system.miscAttrib,0,99)
				tfm.exec.chatMessage("[#bolo] Misc attribute changed.")
				if p[3] == "true" then
					eventChatCommand(n,"refresh")
				end
				return
			end
			
			if p[1] == "load" and (module._FREEACCESS[n] > 2 or not system.isRoom) then
				if os.time() > system.modeChanged and os.time() > system.newGameTimer then
					if system.getGameMode(p[2],true) then
						tfm.exec.chatMessage("[#bolo] Loading " .. p[2])
						system.init(system.isRoom)
					end
				end				
				return
			end
		end
		
		if p[1] == "module" then
			p[2] = string.upper(p[2] or "")
			
			if module["_" .. p[2]] then
				if p[2] == "FREEACCESS" then
					if p[3] then
						local num = tonumber(p[3])
						if num then
							num = math.setLim(num, 1, 3)
							local lastValue = num
							
							tfm.exec.chatMessage("[#bolo] " .. p[2] .. " [" .. num .. "] : " .. table.concat(module._FREEACCESS, "", function(name, value)
								return value == num and name .. " ~ " or ""
							end), n)
						else
							p[3] = string.nick(p[3])
							tfm.exec.chatMessage("[#bolo] " .. p[3] .. " ~> " .. (module._FREEACCESS[p[3]] or 0),n)
						end
					end
				else
					tfm.exec.chatMessage("[#bolo] " .. p[2] .. " : " .. table.concat(table.turnTable(module["_" .. p[2]]),"\n",function(k,v)
						return v
					end),n)
				end
			else
				tfm.exec.chatMessage(string.format("VERSION : %s\nNAME : %s\nSTATUS : %s\nAUTHOR : %s\n\nMODE : %s",module._VERSION,module._NAME,module._STATUS,module._AUTHOR,system.gameMode),n)
			end
			return
		end
		
		if p[1] == "modes" then
			tfm.exec.chatMessage(table.concat({table.unpack(system.submodes,2)},"\n",function(k,v)
				return string.format("~> /room #%s%s@%s#%s",module._NAME,math.random(0,999),n,v)
			end),n)
			return
		end

		if p[1] == "stop" and system.roomAdmins[n] then
			system.exit()
		end
		
		if p[1] == "admin" then
			tfm.exec.chatMessage("[#bolo] Room Admins : " .. table.concat(system.roomAdmins,", ",tostring),n)
			return
		end
		
		if p[1] == "adm" and p[2] and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 2)) then
			if table.find({"true","false"},p[3]) then
				local pl = string.nick(p[2])
				system.roomAdmins[pl] = (not not module._FREEACCESS[pl]) or p[3] == "true" or nil
				eventChatCommand(n,"admin")
			end
			return
		end
		
		if p[1] == "setroomlanguage" and p[2] and (system.roomAdmins[n] or (module._FREEACCESS[n] and module._FREEACCESS[n] > 2)) then
			if mode[system.gameMode].translations[p[2]] then
				system.roomLanguage = p[2]
				mode[system.gameMode].langue = system.roomLanguage
				tfm.exec.chatMessage("[#bolo] Language set to " .. mode[system.gameMode].langue)
			end
			return
		end
		
		if p[1] == "me" then
			local commands = {
				[0] = {"!hash"},
				[1] = {"!hash","!refresh (tribe house)","!setMisc [number] [refresh] (tribe house)","!room [number] (tribe house)","!load [mode] (tribe house)"},
				[2] = {"!hash","!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode] (tribe house)"},
				[3] = {"!hash [name]","!refresh","!setMisc [number] [refresh]","!room [number]","!load [mode]"}
			}
			
			local access = module._FREEACCESS[n] or 0
			
			if system.roomAdmins[n] then
				for k,v in next,{"!stop","!adm [playerName] [true/false]","!setRoomLanguage [language]"} do
					commands[access][#commands[access] + 1] = v
				end
			end
			
			tfm.exec.chatMessage(string.format("@%s\nACCESS : %s\nROOM ADMIN : %s\n\n~> Commands: %s",n,access,tostring(not not system.roomAdmins[n]),table.concat(commands[access],"; ")),n)
			return
		end

		if p[1] == "hash" then
			p[2] = (module._FREEACCESS[n] and module._FREEACCESS[n] > 2) and (p[2] or n) or n
			p[2] = string.nick(p[2])
		
			tfm.exec.chatMessage(string.format("\n\n<p align='center'><font size='20'><J>MICE CLAN\nACCOUNT VERIFICATION\n</J></font></p><p align='left'><font size='12'><PT>Yay! So you want to join us on Mice Clan!!!\n\nYour pretty hash is : <ROSE><B>%s</B></ROSE></PT></p></font>\n\n", _HASH(p[2])), n)
		end
	end
end
