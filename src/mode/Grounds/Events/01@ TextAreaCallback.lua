	eventTextAreaCallback = function(i,n,c)
		local p = string.split(c,"[^%.]+")
		if p[1] == "shop" and os.time() > mode.grounds.info[n].shop.timer then
			mode.grounds.info[n].shop.timer = os.time() + 900
			if p[2] == "left" then
				mode.grounds.info[n].shop.page = mode.grounds.info[n].shop.page - 1
				mode.grounds.uishop(n)
			elseif p[2] == "right" then
				mode.grounds.info[n].shop.page = mode.grounds.info[n].shop.page + 1
				mode.grounds.uishop(n)
			elseif p[2] == "buy" and mode.grounds.info[n].groundsDataLoaded then
				p[3] = tonumber(p[3]) or 0
				if mode.grounds.info[n].stats.groundsCoins >= p[3] then
					mode.grounds.info[n].stats.groundsCoins = mode.grounds.info[n].stats.groundsCoins - p[3]
					local loc = mode.grounds.info[n].stats.powers[p[4]]
					mode.grounds.info[n].stats.powers[p[4]][#loc] = mode.grounds.info[n].stats.powers[p[4]][#loc] + 1
					mode.grounds.info[n].stats.powers[p[4]][1] = mode.grounds.info[n].stats.powers[p[4]][1] * mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][4]
					tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",string.format(system.getTranslation(n).bought,"<J>$"..p[3].."</J>","<ROSE>"..system.getTranslation(n).grounds[mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][1]][1].."</ROSE>",n)),n)
					mode.grounds.uishop(n)
				else
					tfm.exec.chatMessage(string.format("<PT>[•] <R>%s",system.getTranslation(n).cantbuy),n)
				end
			elseif p[2] == "close" then
				for i = 4,13 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].shop.accessing = false
				for k,v in next,mode.grounds.info[n].shop.image do
					tfm.exec.removeImage(v)
				end
			end
		elseif p[1] == "profile" then
			if p[2] == "close" then
				for i = 14,16 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].profileAccessing = false
			elseif p[2] == "open" then
				if p[3] then
					mode.grounds.uiprofile(n,p[3]:gsub("~", "#"))
				else
					mode.grounds.uiprofile(n,n)
				end
			end
		elseif p[1] == "menu" and os.time() > mode.grounds.info[n].menu.timer then
			mode.grounds.info[n].menu.timer = os.time() + 750
			if p[2] == "page" and p[3] then
				mode.grounds.info[n].menu.page = tonumber(p[3])
				mode.grounds.uimenu(n)
			elseif p[2] == "right" then
				mode.grounds.info[n].menu.page = mode.grounds.info[n].menu.page + 1
				mode.grounds.uimenu(n)
			elseif p[2] == "left" then
				mode.grounds.info[n].menu.page = mode.grounds.info[n].menu.page - 1
				mode.grounds.uimenu(n)
			elseif p[2] == "popup" then
				mode.grounds.info[n].menu.showPopup = not mode.grounds.info[n].menu.showPopup
				mode.grounds.uimenu(n)
			elseif p[2] == "close" then
				for i = 22,17,-1 do
					ui.removeTextArea(i,n)
				end
				mode.grounds.info[n].menu.accessing = false
				if mode.grounds.info[n].showHelp then
					mode.grounds.info[n].showHelp = false
					ui.removeTextArea(0,n)
				end
			end
		elseif p[1] == "print" then
			p[2] = string.gsub(p[2],"¬",".")
			tfm.exec.chatMessage(string.format("<PT>[•] <BV>%s",p[2]),n)
		elseif p[1] == "ranking" then
			if p[2] == "close" then
				mode.grounds.info[n].leaderboardAccessing = false
				for i = 23,36 do
					ui.removeTextArea(i,n)
				end
			end
		elseif p[1] == "info" then
			if p[2] == "close" then
				for i = 37,38 do
					ui.removeTextArea(i,n)
				end
				for k,v in next,mode.grounds.info[n].infoImage do
					tfm.exec.removeImage(v)
				end
				mode.grounds.info[n].infoImage = {}
			else
				mode.grounds.uidisplayInfo(n,p)
			end
		end
	end,
