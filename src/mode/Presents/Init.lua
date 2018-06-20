	reset = function()
		-- Data
		mode.presents.info = {}
	end,
	init = function()
		-- Init
		for _,f in next,{"AutoShaman","AutoNewGame","AutoScore","AfkDeath","MortCommand","DebugCommand","PhysicalConsumables"} do
			tfm.exec["disable"..f]()
		end	
		tfm.exec.setRoomMaxPlayers(30)
		
		system.newTimer(function()
			mode.presents.generateMap()
		end,1000,false)
		
		-- Auto Admin
		system.roomAdmins["Ruamorangos#0000"] = true
	end,