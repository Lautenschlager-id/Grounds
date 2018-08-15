	uimenu = function(n)
		if not mode.grounds.info[n].menu.accessing then
			mode.grounds.info[n].menu.page = 1
			mode.grounds.info[n].menu.accessing = true
		end

		local langue = system.getTranslation(n).menu

		if mode.grounds.info[n].menu.page < 1 then
			mode.grounds.info[n].menu.page = #langue
		elseif mode.grounds.info[n].menu.page > #langue then
			mode.grounds.info[n].menu.page = 1
		end

		local popupFormat = "<%s><a href='event:menu.page.%d'>#%s</a>"
		local popups = {}
		for k,v in next,langue do
			popups[#popups+1] = string.format(popupFormat,(k == mode.grounds.info[n].menu.page and "VP" or "J"),k,string.format(v[1],string.nick(module._NAME, true)))
		end

		local popup = {
			x = {663,546},
			d = "«",
			txt = "<font size='11'><J>"..table.concat(popups,"\n\n")
		}
		if not mode.grounds.info[n].menu.showPopup then
			popup = {
				x = {552,435},
				d = "»",
				txt = "",
			}
		end

		local displayText = {table.unpack(langue[mode.grounds.info[n].menu.page])}

		if mode.grounds.info[n].menu.page == 1 then
			displayText[1] = string.format(displayText[1],string.nick(module._NAME, true))
		else
			local textFormat = nil
			if mode.grounds.info[n].menu.page == 2 then
				local gameModes = "<PT>"
				
				local _modes = {}
				for k, v in next, mode do
					if k ~= module._NAME then
						_modes[#_modes + 1] = k
					end
				end
				
				for k,v in next, _modes do
					local room = string.format("/room #%s0@YourName#%s",module._NAME,v)
					gameModes = gameModes .. string.format("<a href='event:print.&lt;ROSE>%s'>%s</a>\n",room,room)
				end
				
				local otherModules = "<CE>"
				for k,v in next,{"powers", "cannonup", "hardcamp", "signal"} do
					local room = string.format("/room #%s0@YourName",v)
					otherModules = otherModules .. string.format("<a href='event:print.&lt;ROSE>%s'>%s</a>\n",room,room)
				end

				displayText[2] = string.format(displayText[2],gameModes,otherModules)
			elseif mode.grounds.info[n].menu.page == 3 then
				textFormat = {{},system.getTranslation(n).grounds}
				for k,v in next,textFormat[2] do
					if v[2] ~= "?" then
						table.insert(textFormat[1],string.format("<a href='event:info.grounds.%s.%s'><B>%s</B></a>",string.gsub(v[1],"'","#"),string.gsub(v[2],"%.","@"),string.upper(v[1])))
					end
				end
				displayText[2] = string.format(displayText[2],"• "..table.concat(textFormat[1],"\n• "))
			elseif mode.grounds.info[n].menu.page == 4 then
				displayText[2] = table.list(displayText[2],"\n",function(k,v)
					return mode.grounds.concat(k,v)
				end)
				displayText[2] = "<font size='10'>" .. string.format(displayText[2],mode.grounds.cmds.profile,mode.grounds.cmds.shop,mode.grounds.cmds.langue,mode.grounds.cmds.help,mode.grounds.cmds.leaderboard,mode.grounds.cmds.info,mode.grounds.cmds.mapinfo,mode.grounds.cmds.pw)
			elseif mode.grounds.info[n].menu.page == 5 then
				displayText[2] = string.format(displayText[2] .. "\n\n%s",#mode.grounds.maps.."<N>","<BV><a href='event:print.atelier801¬com/topic?f=6&t=845005'>#"..string.upper(module._NAME).." MAP SUBMISSIONS</a></BV>",table.list(mode.grounds.G,"\n",function(k,v)
					return string.format("<font color='#%s'><a href='event:info.mapCategory.%s'>G%2d</a> : %3d</font>",v.color,k,k,#v.queue)
				end))
			elseif mode.grounds.info[n].menu.page == 6 then
				local concat = {}
				for i,j in next,{{"translators","<CEP>"},{"mapEvaluators","<BV>"}} do
					concat[#concat+1] = j[2] .. table.list(mode.grounds.staff[j[1]],"<G>, " .. j[2],function(k,v)
						return string.format("<a href='event:info.%s.%s'>%s</a>",j[1],k,v[1])
					end)
				end
				displayText[2] = string.format(displayText[2],"Bolodefchoco#0000",concat[1],concat[2])
			end
		end

		ui.addTextArea(17,"<font size='1'>\n</font><p align='center'><J><B><a href='event:menu.right'>»</a>",n,543,352,40,20,1,1,1,true)
		ui.addTextArea(18,"<font size='1'>\n</font><p align='center'><J><B><a href='event:menu.left'>«</a>",n,217,352,40,20,1,1,1,true)

		ui.addTextArea(19,"<font size='1'>\n</font><p align='center'><PT><B><a href='event:menu.popup'>"..popup.d.."</a>",n,popup.x[1],107,20,20,1,1,1,true)
		ui.addTextArea(20,popup.txt,n,popup.x[2],107,115,155,0x123e54,1,1,true)

		ui.addTextArea(21,"<p align='center'><B><R><a href='event:menu.close'>X",n,543,42,20,20,1,1,1,true)
		ui.addTextArea(22,"<p align='center'><font size='20'><V><B>"..string.upper(displayText[1]).."</B></V><font size='15'>\n<R>_____________\n\n<font size='11'><N><p align='left'>"..displayText[2],n,260,42,280,330,0x073247,1,1,true)
	end,
