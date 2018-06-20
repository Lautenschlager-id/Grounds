	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				if mode.dev.throw[1] and os.time() > mode.dev.info[n].timer then
					mode.dev.info[n].timer = os.time() + 500
			
					x = x + (tfm.get.room.playerList[n].isFacingRight and 30 or -30)
					y = y - 15
					
					local xs,ys = mode.dev.throw[4],mode.dev.throw[5]
					
					local angle = 0			
					if mode.dev.throw[3] == 17 then
						angle = tfm.get.room.playerList[n].isFacingRight and 90 or -90
					else
						xs = (tfm.get.room.playerList[n].isFacingRight and xs or -xs)
						ys = (tfm.get.room.playerList[n].isFacingRight and ys or -ys)
					end
					
					local object = tfm.exec.addShamanObject(mode.dev.throw[3],x,y,angle,xs,ys,mode.dev.throw[6])
					
					if mode.dev.throw[8] then
						local imageId = math.random(#mode.dev.throw[7])
						tfm.exec.addImage(mode.dev.throw[(tfm.get.room.playerList[n].isFacingRight and 8 or 7)][imageId] .. ".png","#" .. object,-5,-8)
					end
					
					mode.dev.toDespawn[#mode.dev.toDespawn + 1] = {object,os.time() + 5000}
				end
				return
			end
			
			if k == 0 or k == 2 then
				if mode.dev.mouseImages[1] then
					if mode.dev.info[n].mouseImage > -1 then
						tfm.exec.removeImage(mode.dev.info[n].mouseImage)
					end
					
					mode.dev.info[n].mouseImage = tfm.exec.addImage(({[0]=mode.dev.mouseImages[4],[2]=mode.dev.mouseImages[5]})[k] .. ".png",mode.dev.mouseImages[3] .. n,mode.dev.mouseImages[6],mode.dev.mouseImages[7])
				end
				return
			end
		end
	end,