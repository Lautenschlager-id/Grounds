	init = function()
		for i,f in next,{"AutoShaman","AfkDeath","MortCommand","AutoTimeLeft","PhysicalConsumables","AutoNewGame","DebugCommand"} do
			tfm.exec["disable"..f]()
		end
		tfm.exec.setRoomMaxPlayers(25)
		tfm.exec.newGame(mode.xmas.xml)
		mode.xmas.aim = system.miscAttrib > 0 and system.miscAttrib or 8
	end,