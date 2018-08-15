	uicreator = function(n)
		mode.universe.uinew(0,table.list(mode.universe.info[n].settings.create,"\n<font size='4'>\n</font>",function(k,v)
			return string.format(v[1],tostring(v[2](n)))
		end),n,400,200,540,300,true)
		
		mode.universe.uinew(1,"<p align='center'><VI><a href='event:main.create'>" .. system.getTranslation().buttons.main.create .. "</a>",n,180,338,100,24,false)
		mode.universe.uinew(2,"<p align='center'><VI><a href='event:main.recreate'>" .. system.getTranslation().buttons.main.recreate .. "</a>",n,290,338,100,24,false)
		mode.universe.uinew(3,"<p align='center'><R><a href='event:main.destroy'>" .. system.getTranslation().buttons.main.destroy .. "</a>",n,400,338,100,24,false)
		mode.universe.uinew(4,"<p align='center'><BV><a href='event:main.reset'>" .. system.getTranslation().buttons.main.reset .. "</a>",n,510,338,100,24,false)
		mode.universe.uinew(5,"<p align='center'><VP><a href='event:main.exit'>" .. system.getTranslation().exit .. "</a>",n,620,338,100,24,false)
		mode.universe.info[n].creatorOpen = true
	end,
