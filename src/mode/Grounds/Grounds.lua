	gsys = {
		-- Ground system
		grounds = {},
		disabledGrounds = {},
		collisionArea = {34,40,50,50,40,34,34,35,0,0,40,35,35,23,0,0},
		getTpPos = function(g,center)
			if center then
				return {g.X, g.Y}
			else			
				local hTP = {g.X, g.Y}
				if g.P[5] == 90 or g.P[5] == -270 then
					hTP[1] = hTP[1] + g.L/2
				elseif g.P[5] == -90 or g.P[5] == 270 then
					hTP[1] = hTP[1] - g.L/2
				elseif math.abs(g.P[5]) == 180 then
					hTP[2] = hTP[2] + g.H/2
				else
					hTP[2] = hTP[2] - g.H/2
				end
				
				return hTP
			end
		end,
		onGround = function(t,px,py)
			px,py = px or 0,py or 0
			
			local groundType = math.setLim(t.T, 0, 15)
			local collisionArea = mode.grounds.gsys.collisionArea[groundType + 1]
			
			if groundType == 13 then
				return math.pythag(px, py, t.X, t.Y, t.L + collisionArea)
			else
				local radiusX = (t.L + collisionArea) / 2
				local radiusY = (t.H + collisionArea) / 2

				local x, y = math.rotatePoint(px - t.X, py - t.Y, -tonumber(t.P[5]))
				return x >= -radiusX and x <= radiusX and y >= -radiusY and y <= radiusY
			end
		end,
		getGroundProperties = function(xml)
			mode.grounds.gsys.grounds = {}
			
			local properties = {}
			local setValue = function(tag, _, value)
				properties[tag] = (value:find(",") and string.split(value, "[^,]+") or tonumber(value) or value)
			end

			string.gsub(xml, "<S (.-)/>", function(attributes)
				properties = {}

				string.gsub(attributes, "([%-%w]+)=([\"'])(.-)%2", setValue)
				mode.grounds.gsys.grounds[#mode.grounds.gsys.grounds + 1] = properties
			end)
		end,
		groundEffects = function()
			for n,p in next,tfm.get.room.playerList do
				if not p.isDead then
					local affected = false
					for id = 1,#mode.grounds.gsys.grounds do
						local ground = mode.grounds.gsys.grounds[id]
						local newId = id - 1
						if not mode.grounds.gsys.disabledGrounds[newId] and (ground.disablepower or ground.P[1] == '1' or (ground.v and (_G.currentTime - 3) >= (tonumber(ground.v)/1000))) then
							-- If the ground has the disablepower attribute, or is dynamic, or the v despawner attribute exists (after it disappear)
							mode.grounds.gsys.disabledGrounds[newId] = true
						end
						if not mode.grounds.gsys.disabledGrounds[newId] and _G.currentTime >= 3 then
							if mode.grounds.gsys.onGround(ground,p.x,p.y) then
								affected = true
								local gtype = ground.T
								local color = string.upper(tostring(ground.o or ""))
								mode.grounds.info[n].powersOP.GTYPE = gtype
								if gtype == 1 or color == "89A7F5" then -- ice
									system.bindKeyboard(n,32,true,true)
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 1
									end
								elseif gtype == 2 or color == "6D4E94" then -- trampoline
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 2
									end
								elseif gtype == 3 or color == "D84801" then -- lava
									if color ~= "" then
										mode.grounds.info[n].powersOP.GTYPE = 3
									end

									local place = tonumber(ground.move)
									place = place and place + 1 or (id > 1 and id - 1 or #mode.grounds.gsys.grounds)
									place = mode.grounds.gsys.grounds[place]
									
									local hTP = mode.grounds.gsys.getTpPos(place)
									
									tfm.exec.displayParticle(36,p.x,p.y,0,0,0,0,n)
									tfm.get.room.playerList[n].x = 0
									tfm.get.room.playerList[n].y = 0
									tfm.exec.movePlayer(n,hTP[1],hTP[2])
									tfm.exec.displayParticle(36,hTP[1],hTP[2],0,0,0,0,n)
								elseif gtype == 8 or color == "9BAABC" then -- cloud
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 7 then -- sand
									ui.addTextArea(-1,"",n,-1500,-1500,3e3,3e3,0xE5CC5D,0xE5CC5D,mode.grounds.stormIntensities[mode.grounds.info[n].stats.powers.sand[1]],false)
									for i = 1,2 do
										tfm.exec.displayParticle(26,math.random(800),math.random(350),0,0,0,0,n)
										tfm.exec.displayParticle(27,math.random(800),math.random(350),0,0,0,0,n)
									end
								elseif gtype == 9 then -- water
									if mode.grounds.hasWater then
										mode.grounds.info[n].drown = mode.grounds.info[n].drown + math.random(1,math.floor(mode.grounds.info[n].stats.powers.water[1]))
										mode.grounds.displayWaterBar(n)
										if mode.grounds.info[n].drown > 99 then
											tfm.exec.killPlayer(n)
											mode.grounds.info[n].drown = 0
											for i = 1,8 do
												tfm.exec.displayParticle(14,p.x+math.random(-50,50),p.y+math.random(-20,20),0,-1,0,0,n)
											end
										end
										for i = 1,math.random(2,4) do
											tfm.exec.displayParticle(14,p.x+math.random(-50,50),p.y+math.random(-20,20),0,-1,0,0,n)
										end
									end
								elseif gtype == 10 then -- stone
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 11 or color == "E7F0F2" then -- snow
									system.bindKeyboard(n,32,true,true)
								elseif gtype == 12 or gtype == 13 then -- retangle or circle
									if color == "C90909" then
										tfm.exec.killPlayer(n)
									elseif color == "18C92B" then
										if os.time() > mode.grounds.respawn then
											mode.grounds.respawn = os.time() + 7e3
											for k,v in next,tfm.get.room.playerList do
												if v.isVampire then
													tfm.exec.killPlayer(k)
												elseif v.isDead and mode.grounds.info[k].canRev then
													tfm.exec.respawnPlayer(k)
												end
											end
										end
									elseif color == "555D77" then
										mode.grounds.info[n].checkpoint = id
									end
								elseif gtype == 15 then -- web
									tfm.exec.movePlayer(n,mode.grounds.spawnPoint[1],mode.grounds.spawnPoint[2])
									tfm.get.room.playerList[n].x = 0
									tfm.get.room.playerList[n].y = 0
								end
							end
						end
					end
					if not affected then
						mode.grounds.info[n].powersOP.GTYPE = -1
					end
				end
			end
		end,
	},
