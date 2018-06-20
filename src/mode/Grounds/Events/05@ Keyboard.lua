	eventKeyboard = function(n,k,d,x,y)
		tfm.get.room.playerList[n].x = x
		tfm.get.room.playerList[n].x = y
		if table.find(mode.grounds.bindKeys,k) then
			if k < 4 then
				if k == 0 then
					mode.grounds.info[n].right = false
				elseif k == 2 then
					mode.grounds.info[n].right = true
				end
			elseif k == string.byte("O") then
				mode.grounds.eventChatCommand(n,"o")
			elseif k == string.byte("P") then
				if mode.grounds.info[n].profileAccessing then
					mode.grounds.eventTextAreaCallback(nil,n,"profile.close")
				else
					if os.time() > mode.grounds.info[n].profileTimer then
						mode.grounds.info[n].profileTimer = os.time() + 1e3
						mode.grounds.eventChatCommand(n,"p")
					end
				end
			elseif k == string.byte("H") then
				mode.grounds.eventChatCommand(n,"h")
			elseif k == string.byte("K") then
				mode.grounds.eventChatCommand(n,"k")
			end
		else
			if k == 32 and os.time() > mode.grounds.info[n].powersOP.TIMER then
				local ms = 0
				local power = {0,0}
				if mode.grounds.info[n].powersOP.GTYPE == 8 then -- Cloud
					power = mode.grounds.info[n].stats.powers.cloud
					ms = power[2]
					tfm.exec.movePlayer(n,0,0,true,0,-power[1],true)
				elseif mode.grounds.info[n].powersOP.GTYPE == 1 and mode.grounds.info[n].isWalking then -- Ice
					power = mode.grounds.info[n].stats.powers.ice
					ms = power[2]
					tfm.exec.movePlayer(n,0,0,false,(mode.grounds.info[n].right and power[1] or -power[1]),0,true)
				elseif mode.grounds.info[n].powersOP.GTYPE == 11 and not mode.grounds.info[n].isWalking then -- Snow
					power = mode.grounds.info[n].stats.powers.snow
					ms = power[2]
					tfm.exec.addShamanObject(34,x + (mode.grounds.info[n].right and 20 or -20),y - 5,0,(mode.grounds.info[n].right and power[1] or -power[1]))
					tfm.exec.playEmote(n,26)
				elseif mode.grounds.info[n].powersOP.GTYPE == 10 and not mode.grounds.info[n].isWalking then -- Stone
					power = mode.grounds.info[n].stats.powers.stone
					local id = tfm.get.room.playerList[n].id
					if not mode.grounds.despawnGrounds[id] then--if not table.find(mode.grounds.despawnGrounds,id,1) then
						ms = power[3]
						local halfSize = (power[1]/2) + 15
						tfm.exec.addPhysicObject(id,x + (mode.grounds.info[n].right and halfSize or -halfSize),y + 32 - halfSize,{
							type = 10,
							miceCollision = true,
							groundCollision = false,
							width = power[1],
							height = power[1],
							friction = .3,
							restitution = 0
						})
						mode.grounds.despawnGrounds[id] = true

						system.newTimer(function()
							tfm.exec.removePhysicObject(id)
							mode.grounds.despawnGrounds[id] = nil
						end,power[2],false)
						--table.insert(mode.grounds.despawnGrounds,{id,os.time() + power[2]})
					end
				end
				mode.grounds.info[n].powersOP.TIMER = os.time() + ms
				system.bindKeyboard(n,32,true,false)
				
				mode.grounds.info[n].powersOP.GTYPE = -1
			elseif k == 16 then
				mode.grounds.info[n].holdingShift = d
			end
		end
	end,
