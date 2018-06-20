	uicounter = function(id,range,n,limit,increment)
		local min,max = string.match(range,"(%-?%d+):(%-?%d+)")
		min,max = tonumber(min),tonumber(max)
		
		if mode.universe.info[n].settings[id][1] == -math.huge then
			mode.universe.info[n].settings[id][1] = math.ceil((min+max)/2)
		else
			mode.universe.info[n].settings[id][1] = math.setLim(mode.universe.info[n].settings[id][1],min,max)
		end
		
		limit = limit or 10
		increment = string.gsub(tostring(increment or 1),"%.","%%s")
		mode.universe.info[n].settings[id][2] = math.setLim(mode.universe.info[n].settings[id][2],.1,limit)

		mode.universe.uinew(10,"<p align='center'><font size='20'><V><B>"..string.upper(id).."</B><font size='7'>\n\n<font size='12'><p align='left'><J><a href='event:counter."..id..".submit'>SUBMIT</a>"..string.rep(mode.universe.tab,3).."<PT><a href='event:counter."..id..".add."..increment.."'><B>+</B></a>  <J>" .. mode.universe.info[n].settings[id][2] .. "  <R><a href='event:counter."..id..".sub."..increment.."'><B>-</B></a>\n\n\n<p align='center'><font size='16'><S><a href='event:item."..id..".add'>▲</a>&nbsp;&nbsp;<PS>" ..  mode.universe.info[n].settings[id][1] .. "&nbsp;&nbsp;<S><a href='event:item."..id..".sub'>▼</a>",n,400,200,180,130,true)
	end,
