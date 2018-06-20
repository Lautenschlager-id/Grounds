	reset = function()
		for i = #mode.universe.cosmos,1,-1 do
			mode.universe.cosmos[i]:destroy()
		end
		
		mode.universe.cosmos = {}
		mode.universe.orbit = {0,0,0,0}
		
		table.foreach(system.roomAdmins,mode.universe.newCreator)
	end,
	init = function()
		-- Keyboard
		if type(mode.universe.keyboard) == "function" then
			mode.universe.keyboard = mode.universe.keyboard()
		end
		
		-- Translations
		-- Set object translated names
		if mode.universe.langue ~= "en" then
			for k,v in next,mode.universe.data.objects do
				for i,j in next,v do
					j[1] = system.getTranslation().objects[k][i]
				end
			end
		end
		-- Set class translations
		mode.universe.data.classes = system.getTranslation().buttons.classes
		
		-- Menus
		mode.universe.getDataMenus()
		
		-- Loops
		system.newTimer(function()
			ui.setMapName(mode.universe.infoBar())
		end,1000,true)
		
		-- Settings
		tfm.exec.setRoomMaxPlayers(12)
		for _,f in next,{"AutoShaman","AutoNewGame","DebugCommand"} do
			tfm.exec["disable"..f]()
		end
		
		-- Map
		system.newTimer(function()
			tfm.exec.newGame('<C><P L="8000" G="0," H="8000" /><Z><S><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="-1000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="-1500" c="4" Y="2000" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="5000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="1500" c="4" Y="9500" T="12" P="0,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="4500" c="4" Y="9500" T="12" H="3000" /><S H="3000" L="3000" o="0" X="9500" c="4" Y="5000" T="12" P="1,,.3,.2,,,," /><S H="3000" L="3000" o="0" X="7500" c="4" Y="9500" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="9500" c="4" Y="2000" T="12" H="3000" /><S H="3000" L="3000" o="0" X="9500" c="4" Y="-1000" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="-1500" c="4" Y="8000" T="12" H="3000" /><S P="1,,.3,.2,,,," L="3000" o="0" X="1500" c="4" Y="-1500" T="12" H="3000" /><S H="3000" L="3000" o="0" X="4500" c="4" Y="-1500" T="12" P="1,,.3,.2,,,," /><S P="1,,.3,.2,,,," L="3000" o="0" X="6500" c="4" Y="-1500" T="12" H="3000" /><S P="1,,.3,.2,,,," L="3000" o="0" X="9500" c="4" Y="8000" T="12" H="3000" /></S><D><DS Y="4000" X="4000" /></D><O /></Z></C>')
		end,1000,false)
	end,
