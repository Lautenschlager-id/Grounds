	eventChatCommand = function(n,c)
		local p = string.split(c,"[^%s]+")
		
		if p[1] == "help" then
			tfm.exec.chatMessage(table.concat(system.getTranslation().commands,"\n\n",function(k,v)
				return "<ROSE>• <CE>" .. string.gsub(v,"<","&lt;")
			end),n)
			return
		end
		
		if system.roomAdmins[n] then

			if p[1] == "set" then
				if p[2] == "players" then --set players INT
					p[3] = math.setLim(tonumber(p[3]) or 25,1,50)
					tfm.exec.setRoomMaxPlayers(p[3])
					tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().maxPlayers,n,p[3]))
				elseif p[2] == "password" then --set password PASSWORD
					if p[3] then
						p[3] = table.concat(p," ",nil,3)
					
						tfm.exec.setRoomPassword(p[3])
					
						tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().addPassword,n,string.rep("*",#p[3])))
					else
						tfm.exec.chatMessage("<CE>[#dev] " .. string.format(system.getTranslation().removePassword,n))
					end
				elseif p[2] == "background" and p[3] then --set background img x y
					if p[3] == "remove" then
						if #mode.dev.currentBackground > 0 then
							tfm.exec.removeImage(mode.dev.currentBackground[4])
							mode.dev.currentBackground = {}
						end
					else
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
						mode.dev.currentBackground = {p[3] .. ".png",tonumber(p[4]) or 0,tonumber(p[5]) or 0}
						mode.dev.currentBackground[4] = tfm.exec.addImage(mode.dev.currentBackground[1],"?1",mode.dev.currentBackground[2],mode.dev.currentBackground[3])
					end
				end
				return
			end
			
			if p[1] == "timer" then --timer NAME LOOP TIME FUNC PARAM
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.timers,"\n",tostring),n)
				elseif p[3] == "break" then
					if mode.dev.timers[p[2]] then
						system.removeTimer(mode.dev.timers[p[2]])
						mode.dev.timers[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().timerDestroyed,p[2]),n)
					end
				else
					if #mode.dev.timers < 39 then
						if mode.dev.timers[p[2]] then
							mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " break")
						end
						
						if p[5] then 
							local loop,counter = true
							
							if p[3] == "true" then
								counter = -1
							elseif p[3] == "false" then
								counter = 1
							else
								counter = tonumber(p[3]) or 5
							end
							
							local time = math.setLim(tonumber(p[4]) or 1,1,50) * 1000
							local f = system.loadTable(p[5])
							f = type(f) == "function" and f or tfm.exec.chatMessage

							local args = mode.dev.getWithType(table.concat(p," ",function(k,v)
								return (table.find({"#","@","!","?"},string.sub(v,1,1)) and "," or "") .. v
							end,6))
							
							local this
							this = system.newTimer(function()
								f(table.unpack(args))
								
								counter = counter - 1
								if counter == 0 then
									system.removeTimer(this)
									mode.dev.timers[p[2]] = nil
								end
							end,time,loop)
							
							mode.dev.timers[p[2]] = this
							
							tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().timerCreated,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "img" then --img NAME IMG TARG X Y PLAYER
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.images,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.images[p[2]] then
						tfm.exec.removeImage(mode.dev.images[p[2]])
						mode.dev.images[p[2]] = nil
						tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().imageDestroyed,p[2]),n)
					end
				else
					if mode.dev.images[p[2]]then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
					
					if p[4] then
						local target = table.find({"#","$","%","?","_","!","&"},string.sub(p[4],1,1))
						
						if target then
							p[5],p[6] = p[5] or 0,p[6] or 0
						
							local object = string.sub(p[4],1,1) == "#" and "#" .. (mode.dev.objects[string.sub(p[4],2)] or tfm.exec.addShamanObject(1,p[5],p[6])) or p[4]
							mode.dev.images[p[2]] = tfm.exec.addImage(p[3] .. ".png",object,p[5],p[6],p[7])
						else
							tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().imageTargetInvalid,p[2]),n)
						end
					end
				end
				return
			end
			
			if p[1] == "object" then --object NAME ID X Y BOOLEAN_DESPAWN:TIME_TO_DESPAWN ANGLE XS YS GHOST
				if not p[2] then
					tfm.exec.chatMessage("<CE>" .. table.concat(mode.dev.objects,"\n",tostring),n)
				elseif p[3] == "remove" then
					if mode.dev.objects[p[2]] then
						tfm.exec.removeObject(mode.dev.objects[p[2]])
						mode.dev.objects[p[2]] = nil
					end
				else
					if mode.dev.objects[p[2]] then
						mode.dev.eventChatCommand(n,p[1] .. " " .. p[2] .. " remove")
					end
				
					mode.dev.objects[p[2]] = tfm.exec.addShamanObject(tonumber(p[3]) or 1,tonumber(p[4]) or 0,tonumber(p[5]) or 0,tonumber(p[7]),tonumber(p[8]),tonumber(p[9]),p[10] == "true")
					if p[6] and string.find(p[6],"true") then
						mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {mode.dev.objects[p[2]],os.time() + (tonumber(string.match(p[6],":(%d+)")) or 5) * 1000,p[2]}
					end
				end
				return
			end
			
			if p[1] == "throw" and p[2] then --throw WHO ID XS YS BOOLEAN_GHOST {IMG,IMG} {IMG,IMG}
				if p[2] == "remove" then
					mode.dev.throw = {false}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwDisabled,n)
					
					for k,v in next,mode.dev.info do
						system.bindKeyboard(k,32,true,false)
					end
				else
					mode.dev.throw = {false}
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							system.bindKeyboard(k,32,true,true)
						end
					else
						system.bindKeyboard(p[2],32,true,true)
					end
					mode.dev.throw[2] = p[2] -- Who
					
					mode.dev.throw[3] = tonumber(p[3]) or 17 -- Object type
					
					local create = true
					if p[7] then
						if not p[8] or p[8] == "-" then
							p[8] = rawget(p,7)
						end	
						if string.find(p[7],"{") or string.find(p[8],"{") then
							if string.find(p[7],"{") and string.find(p[8],"{") then
								mode.dev.throw[7] = string.split(string.sub(p[7],2,-2),"[^,]+") -- Left images
								mode.dev.throw[8] = string.split(string.sub(p[8],2,-2),"[^,]+") -- Right images
							else
								create = false
							end
						else
							mode.dev.throw[7] = {p[7]}
							mode.dev.throw[8] = {p[8]}
						end
					end
					
					if create then
						mode.dev.throw[4] = tonumber(p[4]) or 0 -- X speed
						mode.dev.throw[5] = tonumber(p[5]) or 0 -- Y speed
						mode.dev.throw[6] = p[6] == "true" -- Ghost
						
						mode.dev.throw[1] = true
						tfm.exec.chatMessage("<CE>" .. system.getTranslation().throwCreated,n)
					else
						mode.dev.throw = {false}
					end
				end
				return
			end

			if p[1] == "character" and p[4] then --character WHO DEPTH IMG IMG X Y
				if p[2] == "disable" then
					mode.dev.mouseImages = {false}
					
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterDisabled,n)
					
					for k,v in next,mode.dev.info do
						for i = 0,2,2 do
							system.bindKeyboard(k,i,true,false)
						end
						
						if v.mouseImage > -1 then
							tfm.exec.removeImage(v.mouseImage)
							v.mouseImage = -1
						end
					end
				else
					if p[2] == "*" then
						for k,v in next,mode.dev.info do
							for i = 0,2,2 do
								system.bindKeyboard(k,i,true,true)
							end
						end
					else
						for i = 0,2,2 do
							system.bindKeyboard(p[2],i,true,true)
						end
					end

					p[3] = table.find({"$","%"},p[3]) and p[3] or "%"
					
					if not p[5] or p[5] == "-" then
						p[5] = rawget(p,4)
					end
					
					mode.dev.mouseImages = {true,p[2],p[3],p[4],p[5],tonumber(p[6]) or 0,tonumber(p[7]) or 0}
					tfm.exec.chatMessage("<CE>" .. system.getTranslation().characterCreated,n)
				end
				return
			end
			
			if p[1] == "display" and p[2] then
				tfm.exec.chatMessage("<CE>[" .. n .. "#DEV-DISPLAY] <N>" .. string.gsub(table.concat(p," ",nil,2),"<","&lt;"))
				return
			end
		
			if p[1] == "disable" and p[2] then --disable AUTONEWGAME TRUE
				for k,v in next,tfm.exec do
					if string.lower(k) == p[1]..p[2] then
						local status = p[3] == "true"
						tfm.exec.chatMessage("<CE>" .. k .. " : " .. tostring(status))
						v(status)
						break
					end
				end
				return
			end
			
			if p[1] == "xml" and p[2] and _G.currentTime > 10 then
				mode.dev.runXml = true
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().loadMap,n,p[2]) .. " (XML)")
				return
			end
		
			if p[1] == "np" and p[2] and _G.currentTime > 10 then
				tfm.exec.newGame(p[2])
				tfm.exec.chatMessage("<CE>" .. string.format(system.getTranslation().loadMap,n,p[2]))
				return
			end
		
			if p[1] == "execute" and p[2] then --execute tfm.exec.giveCheese NAME
				local f = system.loadTable(p[2])
				if type(f) == "function" then
					local args = mode.dev.getWithType(table.concat(p," ",function(k,v)
						return (table.find({"#","@","!","?"},string.sub(v,1,1)) and "," or "") .. v
					end,3))
				
					f(table.unpack(args))
				end
				return
			end
		end
	end,