	uikeyboard = function(id,str,n)
		mode.universe.uinew(10,table.list(system.getTranslation().buttons.keyboard,"\n",function(k,v)
			return string.format("<%s><a href='event:keyboard.%s.%s'>%s</a>", k==1 and "J" or "R", id, system.getTranslation("en").buttons.keyboard[k], string.upper(v))
		end) .. "\n\n<p align='center'><PT>" .. string.gsub(mode.universe.keyboard,"@",id) .. "\n\n<font size='15'><T>" .. table.concat(str),n,400,200,320,150,true)
	end,
