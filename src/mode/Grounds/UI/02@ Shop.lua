	uishop = function(n)
		if mode.grounds.info[n].groundsDataLoaded then
			for k,v in next,mode.grounds.info[n].shop.image do
				tfm.exec.removeImage(v)
			end
			if not mode.grounds.info[n].shop.accessing then
				local get,index = table.find(mode.grounds.shop.grounds,mode.grounds.info[n].powersOP.GTYPE,1)
				if get then
					mode.grounds.info[n].shop.page = index
				else
					mode.grounds.info[n].shop.page = 1
				end
				mode.grounds.info[n].shop.accessing = true
			end
			if mode.grounds.info[n].shop.page < 1 then
				mode.grounds.info[n].shop.page = #mode.grounds.shop.grounds
			elseif mode.grounds.info[n].shop.page > #mode.grounds.shop.grounds then
				mode.grounds.info[n].shop.page = 1
			end
			
			local shopTxt = system.getTranslation(n).shop
			local debuggedGround = mode.grounds.shop.grounds[mode.grounds.info[n].shop.page]
			local ground = system.getTranslation(n).grounds[debuggedGround[1]]
			local G = string.lower(system.getTranslation("en").grounds[debuggedGround[1]][1])
			local groundLevel = mode.grounds.info[n].stats.powers[G]
			groundLevel = groundLevel[#groundLevel]
			
			ui.addTextArea(4,"",n,160,50,480,320,0x1a2433,1,1,true)

			ui.addTextArea(5,"",n,171,56,240,15,0x1d5a78,0x1d5a78,1,true)
			ui.addTextArea(6,"<p align='center'><font size='13'>"..string.nick(mode.grounds.cmds.shop, true),n,170,53,240,25,1,1,0,true)

			ui.addTextArea(7,"<p align='center'><font size='12'><B><a href='event:shop.left'><BV>«</BV></a>  <font size='14'><a href='event:info.grounds."..string.gsub(ground[1],"'","#").."."..ground[2].."'>"..ground[1].."</a></font>  <a href='event:shop.right'><BV>»</BV></a>",n,170,87,240,25,0x073247,0x073247,1,true)
			
			mode.grounds.info[n].shop.image[1] = tfm.exec.addImage(debuggedGround[2][1]..".png","&0",435,70,n)

			local playerData = string.format("<font size='12'><N>%s <G>: <J>$%s\n<N>%s\n<N>%s <G>: <BL>%s",shopTxt.coin,mode.grounds.info[n].stats.groundsCoins,"%s",shopTxt.power,math.floor(math.percent(groundLevel,#debuggedGround[2])).."%%")
			local groundData = ""
			local upgradeData = "<p align='center'><font size='15'><B>%s" .. shopTxt.upgrade

			if (groundLevel + 1) <= #debuggedGround[2] then
				local price = (groundLevel + 1) * (120 * debuggedGround[3])
				playerData = string.format(playerData,shopTxt.price .. " <G>: <R>$" .. price)
				local iniPerc = math.floor(math.percent(1,#mode.grounds.shop.grounds[mode.grounds.info[n].shop.page][2]))
				groundData = string.format(ground[3],iniPerc)
				upgradeData = string.format(upgradeData,"<a href='event:shop.buy."..price.."."..G.."'><PT>")
				
				local gId = mode.grounds.info[n].stats.powers[G][#mode.grounds.info[n].stats.powers[G]]
				mode.grounds.info[n].shop.image[2] = tfm.exec.addImage(debuggedGround[2][gId]..".png","&1",540,70,n)
				mode.grounds.info[n].shop.image[3] = tfm.exec.addImage("15a2df6ab69.png","&2",440,205,n)
				mode.grounds.info[n].shop.image[4] = tfm.exec.addImage(debuggedGround[2][gId+1]..".png","&3",540,210,n)
			else
				playerData = string.format(playerData,"<R>-")
				upgradeData = string.format(upgradeData,"<V>")
				
				mode.grounds.info[n].shop.image[2] = tfm.exec.addImage(system.getTranslation(n).max .. ".png","&2",175,215,n)
			end
			
			ui.addTextArea(8,playerData,n,170,130,240,52,0x073247,0x073247,1,true)
			ui.addTextArea(9,groundData,n,170,200,240,80,0x073247,0x073247,1,true)

			ui.addTextArea(10,upgradeData,n,170,298,240,24,0x073247,0x073247,1,true)
			ui.addTextArea(11,"<p align='center'><font size='15'><R><B><a href='event:shop.close'>"..shopTxt.close.."</a></B>",n,170,339,240,24,0x073247,0x073247,1,true)

			ui.addTextArea(12,"",n,430,62,200,300,0x073247,0x073247,1,true)
			ui.addTextArea(13,"",n,426,58,90,90,0x1a2433,0x1a2433,1,true)
		end
	end,