	eventTextAreaCallback = function(i,n,c)
		local p = string.split(c,"[^%.]+")
		-- Keyboard
		if p[1] == "keyboard" then
			if p[2] == "name" then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					if p[3] == "backspace" then
						table.remove(mode.universe.info[n].settings.name)
					elseif p[3] == "clear" then
						mode.universe.info[n].settings.name = {}
					elseif p[3] == "insert" then
						if #mode.universe.info[n].settings.name < 16 then
							mode.universe.info[n].settings.name[#mode.universe.info[n].settings.name + 1] = string.char(p[4])
						end
					end
					mode.universe.uikeyboard(p[2],mode.universe.info[n].settings.name,n)
				end
			end
			return
		end
		-- Counter
		if p[1] == "counter" then
			if table.find({"size","temperature","velocity","distance"},p[2]) then
				if p[3] == "submit" then
					mode.universe.uicloseSplash(n)
				else
					local increment = tonumber(string.format(p[4],"."))
					if p[3] == "add" then
						mode.universe.info[n].settings[p[2]][2] = mode.universe.info[n].settings[p[2]][2] + increment
					elseif p[3] == "sub" then
						mode.universe.info[n].settings[p[2]][2] = mode.universe.info[n].settings[p[2]][2] - increment
					end
					mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
				end
			end
			return
		end
		-- Palette
		if p[1] == "palette" then
			if p[2] == "exit" then
				for i = 11,19 do
					mode.universe.uiremove(i,n)
				end
				mode.universe.info[n].settings.palette[1] = 1
				mode.universe.uicreator(n)
			else
				if p[2] == "left" then
					mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] - 1
				elseif p[2] == "right" then
					mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] + 1
				end
				mode.universe.eventTextAreaCallback(i,n,"newObject.color")
			end
			return
		end
		-- New Object
		if p[1] == "newObject" then
			-- Class
			if p[2] == "class" then
				mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.list(mode.universe.data.classes,"\n",function(k,v)
					local out = true
					if k == 1 then
						out = not mode.universe.star
					end
					if k == 2 then
						out = mode.universe.star
					end
					if k == 3 then
						if mode.universe.orbit[2] == 0 then
							out = false
						end
					end
					return out and string.format("%s<a href='event:item.class.%s'>%s</a>",mode.universe.tab,k,v) or string.format("%s<N2>%s</N2>",mode.universe.tab,v)
				end),n)
				return
			end
			-- Type
			if p[2] == "type" then
				if mode.universe.info[n].settings.class > 0 then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(p[2]) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.list(mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])],"\n",function(k,v)
						local out = true
						if mode.universe.info[n].settings.class == 2 then
							local orbit = mode.universe.orbit[2] + 1
							if v[5] ~= 0 and not math.isNegative(v[5],orbit > math.abs(v[5]),orbit <= v[5]) then
								out = false
							end
						end
						return out and string.format("%s<a href='event:item.type.%s'>%s</a>",mode.universe.tab,k,v[1]) or string.format("%s<N2>%s</N2>",mode.universe.tab,v[1])
					end),n)
				end
				return
			end
			-- Name
			if p[2] == "name" then
				mode.universe.uikeyboard(p[2],mode.universe.info[n].settings.name,n)
				return
			end
			-- Size, Color, Temperature, Velocity, Distance, Moon, Respectively. [There must be a type]
			if mode.universe.info[n].settings.type > 0 then
				if p[2] == "size" then
					mode.universe.uicounter(p[2],mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][3],n)
				elseif p[2] == "color" then
					mode.universe.uipaletteMono(mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2],n)
				elseif p[2] == "temperature" then
					mode.universe.uicounter(p[2],"-200:8000",n,1000,200) -- Unknown, yet.
				elseif p[2] == "velocity" then
					mode.universe.uicounter(p[2],"-8:8",n,2,.1) -- Unknown, yet.
				elseif p[2] == "distance" then
					mode.universe.uicounter(p[2],"0:250",n,20) -- Unknown, yet.
				elseif p[2] == "moon" then
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation().menu.satellite) .. "</B><font size='12'><p align='left'>\n\n<S>" .. table.list(mode.universe.cosmos,"\n",function(k,v)
						return v.class == 2 and string.format("%s<a href='event:item.satellite.%s'>%s</a>",mode.universe.tab,k,v.name) or ""
					end),n)
				end
				return
			end
			return
		end
		-- Items
		if p[1] == "item" then
			-- Class
			if p[2] == "class" then
				mode.universe.info[n].settings.class = tonumber(p[3])
				mode.universe.info[n].settings.type = 0
				
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n)
				
				mode.universe.info[n].settings.create = mode.universe.info[n].settings.create + {mode.universe.data.menu.type,mode.universe.data.menu.name}
				
				mode.universe.uicloseSplash(n)
				return
			end
			-- Type
			if p[2] == "type" then
				mode.universe.info[n].settings.type = tonumber(p[3])
				
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n,3)
				
				mode.universe.info[n].settings.palette[2] = mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[mode.universe.info[n].settings.class])][mode.universe.info[n].settings.type][2]
				
				local implement = setmetatable({
					mode.universe.data.menu.color,
					mode.universe.data.menu.size,
					mode.universe.data.menu.temperature
				},mode.universe.meta.add)
				if mode.universe.info[n].settings.class == 2 then
					implement = implement + {mode.universe.data.menu.velocity,mode.universe.data.menu.distance,mode.universe.data.menu.rings}
				end
				if mode.universe.info[n].settings.class == 3 then
					implement = implement + {mode.universe.data.menu.satellite}
				end
				
				mode.universe.info[n].settings.create = mode.universe.info[n].settings.create + implement
				
				mode.universe.uicloseSplash(n)
				return
			end
			-- Size, Temperature, Velocity, Distance
			if table.find({"size","temperature","velocity","distance"},p[2]) then
				if p[3] == "add" then
					mode.universe.info[n].settings[p[2]][1] = mode.universe.info[n].settings[p[2]][1] + mode.universe.info[n].settings[p[2]][2]
				elseif p[3] == "sub" then
					mode.universe.info[n].settings[p[2]][1] = mode.universe.info[n].settings[p[2]][1] - mode.universe.info[n].settings[p[2]][2]
				end
				mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
				return
			end
			-- Color
			if p[2] == "color" then
				mode.universe.info[n].settings.palette[3] = tonumber(p[3])
				mode.universe.eventTextAreaCallback(i,n,"palette.exit")
				
				return
			end
			-- Satellite
			if p[2] == "satellite" then
				mode.universe.info[n].settings.satellite = tonumber(p[3])
				mode.universe.uicloseSplash(n)
				return
			end
			return
		end
		-- Options
		if p[1] == "options" then
			if mode.universe.info[n].settings[p[2]][3] then
				mode.universe.info[n].settings[p[2]][3] = false
				mode.universe.eventTextAreaCallback(i,n,"newObject." .. p[2])
			else
				mode.universe.info[n].settings[p[2]][3] = true
				mode.universe.uicreator(n)
			end
			return
		end
		-- Alternate (Yes/No)
		if p[1] == "alternate" then
			if p[2] == "rings" then
				mode.universe.info[n].settings[p[2]] = not mode.universe.info[n].settings[p[2]]
				mode.universe.uicreator(n)
			end
			return
		end
		-- Close splash
		if p[1] == "closeSplash" then
			mode.universe.uicloseSplash(n)
		end
		-- Main
		if p[1] == "main" then
			-- Exit
			if p[2] == "exit" then
				mode.universe.uicloseSplash(n)
				for i = 0,9 do
					mode.universe.uiremove(i,n)
				end
				mode.universe.info[n].creatorOpen = false
				return
			end
			-- Reset
			if p[2] == "reset" then
				mode.universe.info[n].settings.class = 0
				mode.universe.info[n].settings.type = 0
				mode.universe.info[n].settings.name = {}
				mode.universe.uiresetCreator(n)
				mode.universe.uiclearCreator(n)
				if not p[3] then
					mode.universe.uicreator(n)
				end
				return
			end
			-- Create
			if p[2] == "create" then
				local fails = {}
				if mode.universe.info[n].settings.class <= 0 then
					fails[#fails + 1] = "class"
				end
				if #mode.universe.info[n].settings.name == 0 then
					fails[#fails + 1] = "name"
				end
				if mode.universe.info[n].settings.type <= 0 then
					fails[#fails + 1] = "type"
				end
				if mode.universe.info[n].settings.size[1] == -math.huge then
					fails[#fails + 1] = "size"
				end
				if mode.universe.info[n].settings.palette[3] == 1 then
					fails[#fails + 1] = "color"
				end
				
				if mode.universe.info[n].settings.class == 3 then
					if mode.universe.info[n].settings.satellite == 0 then
						fails[#fails + 1] = "satellite"
					end
				end
				
				local create = #fails == 0
				
				local concatenedName = table.concat(mode.universe.info[n].settings.name)
				
				if not create then
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation().fail,table.list(fails,", ",function(k,v)
						return system.getTranslation().menu[v]
					end)),n)
				end
				
				if mode.universe.stuff[concatenedName] then
					create = false
					tfm.exec.chatMessage("<R>" .. string.format(system.getTranslation().nameExist,concatenedName),n)
				end

				if create and (os.time() > mode.universe.info[n].action) then
					mode.universe.info[n].action = os.time() + 2500
				
					local this = mode.universe.object:new({
						name = concatenedName,
						class = mode.universe.info[n].settings.class,
						type = mode.universe.info[n].settings.type,
						size = mode.universe.info[n].settings.size[1],
						color = mode.universe.info[n].settings.palette[3],
						velocity = mode.universe.info[n].settings.velocity[3] and "auto" or mode.universe.info[n].settings.velocity[1],
						temperature = mode.universe.info[n].settings.temperature[3] and "auto" or mode.universe.info[n].settings.temperature[1],
						rings = mode.universe.info[n].settings.rings and {inclination = 6.5} or false,
						distance = mode.universe.info[n].settings.distance[3] and "auto" or mode.universe.info[n].settings.distance[1],
						satelliteOf = mode.universe.info[n].settings.satellite,			
					})

					if this.class == 3 then
						mode.universe.object.destroy(mode.universe.cosmos[this.satelliteOf])
						mode.universe.object.create(mode.universe.cosmos[this.satelliteOf])
					else
						this:create()
					end
					
					local type = mode.universe.data.objects[string.lower(system.getTranslation("en").buttons.classes[this.class])][this.type][1]
					tfm.exec.chatMessage("<S>" .. string.format(system.getTranslation().newObject[this.class],type,(this.satelliteOf and mode.universe.cosmos[this.satelliteOf].name or "")) .. "\n\t" .. string.format(system.getTranslation().checkProfile,this.name))

					mode.universe.eventTextAreaCallback(i,n,"main.reset.not")
					mode.universe.eventTextAreaCallback(i,n,"main.exit")
				end
				return
			end
			-- Destroy
			if p[2] == "destroy" then
				if p[3] then
					p[3] = tonumber(p[3])
					ui.addPopup(p[3],1,"<p align='center'><font color='#2ECF73'>" .. string.format(system.getTranslation().destroyConfirm,mode.universe.cosmos[p[3]].className,mode.universe.cosmos[p[3]].name),n,200,150,400,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation().buttons.main.destroy) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. table.list(mode.universe.cosmos,"",function(k,v)
						return v.display and string.format("%s%s <a href='event:main.destroy.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name) or ""
					end),n,200)
				end
				return
			end
			-- Recreate
			if p[2] == "recreate" then
				if p[3] then
					p[3] = tonumber(p[3])
					if mode.universe.cosmos[p[3]].id == mode.universe.cosmos[1].id then 
						for i = 1,mode.universe.orbit[4] do
							if mode.universe.cosmos[p[3]].class < 3 then
								mode.universe.cosmos[i]:create()
							end
						end
						
						tfm.exec.chatMessage("<R>" .. system.getTranslation().systemRecreated,n)
					else
						if mode.universe.cosmos[p[3]].class == 3 then
							if mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf].display then
								mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:destroy()
							else
								tfm.exec.chatMessage("<R>" .. system.getTranslation().planetRecreated,n)
							end
							
							mode.universe.cosmos[mode.universe.cosmos[p[3]].satelliteOf]:create()
						else
							mode.universe.cosmos[p[3]]:create()
							
							if mode.universe.cosmos[p[3]].class == 2 then
								if #mode.universe.cosmos[p[3]].moons > 0 then
									tfm.exec.chatMessage("<R>" .. system.getTranslation().moonRecreated,n)
								end
							end
						end
					end
					mode.universe.uicloseSplash(n,true)
				else
					mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation().buttons.main.recreate) .. "</B><font size='12'>\n<a href='event:closeSplash'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. table.list(mode.universe.cosmos,"",function(k,v)
						return v.display and "" or string.format("%s%s <a href='event:main.recreate.%s'>%s</a>\n",mode.universe.tab,(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),k,v.name)
					end),n,200)
				end
				return
			end
			return
		end
		-- Profile
		if p[1] == "profile" then
			local allowed = true
			if mode.universe.info[n] and mode.universe.info[n].creatorOpen then
				allowed = false
			end
			if allowed then
				-- Open, Exit, Respectively.
				if p[2] == "open" then
					mode.universe.profile.uiremoveprofile(n)
					mode.universe.profile["profile" .. p[3]](p[4],n)
				elseif p[2] == "exit" then
					mode.universe.uicloseSplash(n,true)
					mode.universe.profile.uiremoveprofile(n)
				end
			end
			return
		end
	end,
