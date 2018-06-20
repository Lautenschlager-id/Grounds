	uidisplayInfo = function(n,data)
		local what = data[2]
		local title,text,color = "","",""
		if what == "grounds" then
			color = "<N>"
			title = string.gsub(data[3],"#","'")
			local info = string.gsub(data[4],"@",".")
			local groundTxt = system.getTranslation(n).grounds[12]
			if info == groundTxt[2] then
				local colors = {}
				for k,v in next,groundTxt[4] do
					colors[#colors+1] = string.format("<PT>[•] <N2><font color='#%s'>(#%s)</a> <BL>- <PS>%s",k,k,v)
				end
				text = table.concat(colors,"\n")
			else
				text = string.format("<PT>[•] <PS>%s",info)
			end
		elseif what == "mapCategory" then
			data[3] = tonumber(data[3])
			color = "<S>"
			title = "G"..data[3]
			text = string.format("%s\n# %s\n@ %s",mode.grounds.G[data[3]].name,#mode.grounds.G[data[3]].queue,system.getTranslation(n).categories[data[3]])
			if mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage] then
				tfm.exec.removeImage(mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage])
			end
			mode.grounds.info[n].infoImage[#mode.grounds.info[n].infoImage + 1] = tfm.exec.addImage(mode.grounds.G[data[3]].icon[1] .. ".png","&4",360 + mode.grounds.G[data[3]].icon[2],125 + mode.grounds.G[data[3]].icon[3],n)
		elseif mode.grounds.staff[what] then
			local comp = data[3]
			local info = mode.grounds.staff[what][tonumber(comp)]
			title = info[1]
			if what == "translators" then
				color = "<CEP>"
				text = string.format("[<%s>•<CEP>] !%s %s",info[3] and "PT" or "R",mode.grounds.cmds.langue,table.concat(table.turnTable(info[2]),", "))
			elseif what == "mapEvaluators" then
				color = "<BV>"
				text = string.format("[•] %s",info[2])
			end
		end
		ui.addTextArea(37,"<p align='center'><B><R><a href='event:info.close'>X",n,528,115,20,20,1,1,1,true)
		ui.addTextArea(38,"<p align='center'><font size='20'><V><B>" .. title .. "</B>" .. color .. (mode.grounds.staff[what] and " •" or "") .. "\n\n<p align='left'><font size='13'>" .. text,n,275,115,250,160,0x073247,1,1,true)
	end,
