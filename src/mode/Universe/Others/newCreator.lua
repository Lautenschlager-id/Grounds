	newCreator = function(n)
		-- Data
		mode.universe.info[n] = {
			action = 0,
			creatorOpen = false,
			settings = {
				palette = {1,{},1}, -- Current Page, Color List, Selected Color
				-- For all bellow: [1]=Value,[2]=Counter,[[3] = isAutomatic]
				size = {-math.huge,5},
				temperature = {-math.huge,5,true},
				velocity = {-math.huge,1,true},
				distance = {-math.huge,5,true},
				-- Settings
				class = 0,
				type = 0,
				name = {},
				rings = false,
				satellite = 0,
				-- List
				create = setmetatable(
					{
						mode.universe.data.menu.class
					},
					mode.universe.meta.add
				),
			},
		}
		
		-- Controls
		system.bindKeyboard(n,string.byte("O"),true,true)
		
		-- Message
		tfm.exec.chatMessage("<font color='#CF50DB'>[•] " .. system.getTranslation().creator,n)
	end,
