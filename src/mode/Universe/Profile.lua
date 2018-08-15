	profile = {
		uiprofile = function(n)
			mode.universe.uiitems("<p align='center'><font size='20'><V><B>" .. string.upper(system.getTranslation().profile.profiles) .. "</B><font size='12'>\n<a href='event:profile.exit'>" .. system.getTranslation().exit .. "</a><p align='left'>\n\n<S>" .. table.list(mode.universe.cosmos,"\n",function(k,v)
				return string.format("%s <a href='event:profile.open.%s.%s'>%s</a>",(v.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "<CE>[" .. v.className .."]</CE>"),v.className,k,v.name)
			end),n,300)
		end,
		uiremoveprofile = function(n)
			for i = 1,41 do
				ui.removeTextArea(-i,n)
			end
		end,
		profileStar = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
		
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d509ca726.png","?0",-110,-120,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V>" .. (obj.id == mode.universe.cosmos[1].id and "<a:active>★</a:active>" or "") .. " <B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,195,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,222,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,196,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,223,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,305,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,332,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.exTime,n,181,306,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.time / 1e7,n,171,333,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-20,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-21,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-22,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().profile.main .. " : <V>" .. system.getTranslation()[obj.id == mode.universe.cosmos[1].id and "yes" or "no"],n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-25,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-26,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-27,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.flow .. " : <V>" .. obj.flow,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.luminosity .. " : <V>" .. obj.luminosity,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-29,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.magnitude .. " : <V>" .. obj.magnitude,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-30,"",n,550,46,102,20,0x242f42,0x242f42,1,true)
			ui.addTextArea(-31,"",n,540,72,122,288,0x242f42,0x242f42,1,true)

			ui.addTextArea(-32,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.planets,n,551,47,100,20,0x0f242e,0x0f242e,1,true)
			ui.addTextArea(-33,"<p align='center'><V>" .. table.list(mode.universe.cosmos,"",function(k,v)
				return v.class == 2 and string.format("<a href='event:profile.open.Planet.%s'>%s</a>\n\n",k,v.name) or ""
			end),n,541,73,120,290,0x0f242e,0x0f242e,1,true)
		end,
		profilePlanet = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d509cc1ab.png","?0",-20,30,n)
			
			ui.addTextArea(-1,"",n,150,40,540,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,180,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,170,127,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.life,n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.rings,n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V>" .. system.getTranslation()[obj.rings and "yes" or "no"],n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.velocity .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.periods,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.rotation .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.translation .. " : <V>" .. obj.period.translation / 1e10,n,351,342,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-34,"",n,550,41,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-35,"",n,540,67,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-36,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.orbit,n,551,42,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-37,"<p align='center'><V>#" .. obj.planetPosition,n,541,68,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-38,"",n,550,116,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-39,"",n,540,142,122,214,0x242F42,0x242F42,1,true)

			ui.addTextArea(-40,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.satellites,n,551,117,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-41,"<p align='center'><V>" .. table.list(obj.moons,"",function(k,v)
				return string.format("<a href='event:profile.open.Moon.%s'>%s</a>\n\n",mode.universe.cosmos[v].position,mode.universe.cosmos[v].name)
			end),n,541,143,120,216,0x0F242E,0x0F242E,1,true)
		end,
		profileMoon = function(obj,n)
			mode.universe.profile.uiremoveprofile(n)
			
			obj = mode.universe.cosmos[tonumber(obj)]

			local objColor = string.upper(string.format("%x",obj.color))
			
			--tfm.exec.addImage("15d41dcea87.png","?0",380,90,n)
			
			ui.addTextArea(-1,"",n,150,40,350,350,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-2,"",n,155,45,340,33,0x242F42,0x242F42,1,true)
			ui.addTextArea(-3,"<font size='16'><p align='center'><V><B>" .. obj.name .. "</B><font size='12'><p align='right'>\n<a href='event:profile.exit'>[" .. system.getTranslation().exit .. "]</a>",n,158,42,340,45,1,1,0,true)

			ui.addTextArea(-4,"",n,170,127,122,23,0x242F42,0x242F42,1,true)
			ui.addTextArea(-5,"",n,180,100,102,20,0x242F42,0x242F42,1,true)

			ui.addTextArea(-6,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.class,n,181,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-7,"<p align='center'><V>" .. obj.className,n,171,128,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-8,"",n,180,170,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-9,"",n,170,197,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-10,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.type,n,181,171,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-11,"<p align='center'><V>" .. obj.typeName,n,171,198,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-12,"",n,180,240,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-13,"",n,170,267,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-14,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.life,n,181,241,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-15,"<p align='center'><V>" .. obj.life .. "%",n,171,268,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-16,"",n,180,315,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-17,"",n,170,342,122,23,0x242F42,0x242F42,1,true)

			ui.addTextArea(-18,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().menu.satellite,n,181,316,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-19,"<p align='center'><V><a href='event:profile.open.Planet." .. obj.satelliteOf .. "'>" .. mode.universe.cosmos[obj.satelliteOf].name,n,171,343,120,25,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-20,"",n,360,100,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-21,"",n,350,127,122,143,0x242F42,0x242F42,1,true)

			ui.addTextArea(-22,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.information,n,361,101,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-23,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.size .. " : <V>" .. obj.size,n,351,128,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-24,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.color .. " : <font color='#" ..  objColor.. "'>#" .. objColor,n,351,152,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-25,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.gravity .. " : <V>" .. obj.gravity,n,351,177,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-26,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.mass .. " : <V>" .. obj.mass / 1e8,n,351,202,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-27,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.temperature .. " : <V>" .. obj.temperature .. "°C",n,351,227,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-28,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.velocity .. " : <V>" .. obj.velocity,n,351,252,120,20,0x0F242E,0x0F242E,1,true)

			ui.addTextArea(-29,"",n,360,290,102,20,0x242F42,0x242F42,1,true)
			ui.addTextArea(-30,"",n,350,316,122,40,0x242F42,0x242F42,1,true)

			ui.addTextArea(-31,"<p align='center'><font color='#32C3CC'>" .. system.getTranslation().profile.periods,n,361,291,100,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-32,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.rotation .. " : <V>" .. obj.period.rotation,n,351,317,120,20,0x0F242E,0x0F242E,1,true)
			ui.addTextArea(-33,"<p align='center'><font color='#31AAB2'>" .. system.getTranslation().menu.translation .. " : <V>" .. obj.period.translation,n,351,342,120,20,0x0F242E,0x0F242E,1,true)
		end,
	},