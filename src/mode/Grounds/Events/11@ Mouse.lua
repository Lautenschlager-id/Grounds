	eventMouse = function(n,x,y)
		if mode.grounds.review then
			if mode.grounds.info[n].holdingShift then
				tfm.exec.movePlayer(n,x,y)
			else
				tfm.exec.addShamanObject(0,x,y)
			end
		end
	end,