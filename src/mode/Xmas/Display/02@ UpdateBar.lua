	updateBar = function(n,giftColor)
		giftColor = giftColor or mode.xmas.info[n].lastColor
		mode.xmas.displayBar(1,n,math.floor(mode.xmas.info[n].db.eventNoelGifts[2]) .. " / "..mode.xmas.aim,(mode.xmas.info[n].db.eventNoelGifts[2] > mode.xmas.aim and 100 or math.percent(mode.xmas.info[n].db.eventNoelGifts[2],mode.xmas.aim,100)),0xFF0000)
		mode.xmas.displayBar(2,n,mode.xmas.info[n].db.eventNoelGifts[1],(mode.xmas.info[n].db.eventNoelGifts[1] > 50 and 50 or math.percent(mode.xmas.info[n].db.eventNoelGifts[1],50,50)),giftColor,"G",50,20)
	end,