	eventKeyboard = function(n,k,d,x,y)
		if _G.currentTime > 3 and not tfm.get.room.playerList[n].isDead then
			if k == 32 then
				tfm.exec.movePlayer(n,0,0,true,0,mode.sharpie.flyPower)
				tfm.exec.displayParticle(3,x,y)
			end
		end
	end,