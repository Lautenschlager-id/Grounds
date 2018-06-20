	eventNewGame = function()
		mode.presents.isRunning = true
		for i,x in next,{250,400,550} do
			tfm.exec.addPhysicObject(i,x,75,{
				type = 12,
				height = 90,
				width = 90,
				miceCollision = false,
				groundCollision = false,
				color = 0x6A7495
			})
		end
		for i = 0,1 do
			ui.removeTextArea(i)
		end
		mode.presents.chooseTimer = 15
		mode.presents.blockTimer = 0
		mode.presents.newMapTimer = 0
		mode.presents.currentGift = 1
		for k,v in next,mode.presents.info do
			v.rounds = v.rounds + 1
		end
	end,