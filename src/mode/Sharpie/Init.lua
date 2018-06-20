	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoScore","AutoNewGame"} do
			tfm.exec["disable"..f]()
		end
		
		tfm.exec.newGame()
	end,