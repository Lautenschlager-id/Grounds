	getDataMenus = function()
		mode.universe.data.menu = {
			class = {
				"<N2>" .. system.getTranslation().menu.class .. " : <V><a href='event:newObject.class'>%s</a>",function(n)
					if mode.universe.info[n].settings.class > 0 then
						return mode.universe.data.classes[mode.universe.info[n].settings.class]
					else
						return system.getTranslation().choose
					end
				end
			},
			type = {
				"<N2>" .. system.getTranslation().menu.type .. " : <V><a href='event:newObject.type'>%s</a>",function(n)
					if mode.universe.info[n].settings.type > 0 then
						return mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][1]
					else
						return system.getTranslation().choose
					end
				end
			},
			name = {
				"<N2>" .. system.getTranslation().menu.name .. " : <V><a href='event:newObject.name'>%s</a>",function(n)
					if #mode.universe.info[n].settings.name > 0 then
						return table.concat(mode.universe.info[n].settings.name)
					else
						return system.getTranslation().choose
					end
				end
			},
			color = {
				"<N2>" .. system.getTranslation().menu.color .. " : <V><a href='event:newObject.color'>%s</a>",function(n)
					if mode.universe.info[n].settings.palette[3] ~= 1 then
						local color = string.format("%X",mode.universe.info[n].settings.palette[3])
						return string.format("<font color='#%s'>#%s</font>",color,color)
					else
						return system.getTranslation().choose
					end
				end
			},
			size = {
				"<N2>" .. system.getTranslation().menu.size .. " : <V><a href='event:newObject.size'>%s</a>",function(n)
					if mode.universe.info[n].settings.size[1] > -math.huge then
						return mode.universe.info[n].settings.size[1]
					else
						return system.getTranslation().choose
					end
				end
			},
			temperature = {
				"<N2>" .. system.getTranslation().menu.temperature .. " : <V><a href='event:options.temperature'>%s</a>",function(n)
					if mode.universe.info[n].settings.temperature[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.temperature[1] .. " °C"
					end
				end
			},
			satellite = {
				"<N2>" .. system.getTranslation().menu.satellite .. " : <V><a href='event:newObject.moon'>%s</a>",function(n)
					if mode.universe.info[n].settings.satellite > 0 and mode.universe.cosmos[mode.universe.info[n].settings.satellite].name then
						return mode.universe.cosmos[mode.universe.info[n].settings.satellite].name
					else
						return system.getTranslation().choose
					end
				end
			},
			velocity = {
				"<N2>" .. system.getTranslation().menu.velocity .. " : <V><a href='event:options.velocity'>%s</a>",function(n)
					if mode.universe.info[n].settings.velocity[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.velocity[1]
					end
				end
			},
			distance = {
				"<N2>" .. system.getTranslation().menu.distance .. " : <V><a href='event:options.distance'>%s</a>",function(n)
					if mode.universe.info[n].settings.distance[3] then
						return "Auto"
					else
						return mode.universe.info[n].settings.distance[1]
					end
				end
			},
			rings = {
				"<N2>" .. system.getTranslation().menu.rings .. " : <V><a href='event:alternate.rings'>%s</a>",function(n)
					return system.getTranslation()[mode.universe.info[n].settings.rings and "yes" or "no"]
				end
			}
		}
	end,
