	noel = {
		x = 240,
		y = 140,
		id = -1,
		isEscaping = false,
		isDizzy = {0,false},
		timers = {
			teleport = 0,
			prize = 0
		},
		img = {
			dizzy = {"158bb1dccb6","158bb1cf9a8","158bb1d6489","158bb1e2518"},
			right = "158bb1d8069",
			left = "158bb1e0daf",
			jumping = "158bb1d470a",
			stop = "158bb1d9b67",
		},
		updateImage = function(img)
			tfm.exec.removeImage(mode.xmas.noel.imgId)
			mode.xmas.noel.imgId = tfm.exec.addImage(img..".png","#"..mode.xmas.noel.id,-23,-32)
		end,
		particles = function(id)
			for i = 1,5 do
				tfm.exec.displayParticle(id,mode.xmas.noel.x + math.random(-50,50),mode.xmas.noel.y + math.random(-50,50),table.random({-.2,.2}),table.random({-.2,.2}))
			end
		end,
		move = function(x,y)
			tfm.exec.moveObject(mode.xmas.noel.id,0,0,false,x,y,false)
		end,
		nearMouse = function(range)
			local player = {"",{dist=math.random(800),x=0,y=0}}
			for k,v in next,tfm.get.room.playerList do
				if not v.isDead then
					if math.pythag(v.x,v.y,mode.xmas.noel.x,mode.xmas.noel.y,range) then
						local m = v.x-mode.xmas.noel.x
						if math.abs(m) < player[2].dist then
							player = {k,{dist=m,x=v.x,y=v.y}}
						end
					end
				end
			end
			mode.xmas.noel.isEscaping = player[1] ~= ""
			return player
		end,
		escape = function(id)
			local player = mode.xmas.noel.nearMouse(math.random(80,100))
			local mul = (player[1] ~= "" and math.isNegative(player[2].dist,1,-1) or table.random({-1,1}))
			local img = math.isNegative(mul,"left","right")
			local rand = 9 - math.random(0,9)
			if id == 0 or (rand < 6) then
				mode.xmas.noel.move(mul * math.random(50,80),-math.random(1,10))
				mode.xmas.noel.updateImage(mode.xmas.noel.img[img])
			elseif id == 1 or (rand < 9) then
				mode.xmas.noel.move(mul * math.random(60,70),-80)
				mode.xmas.noel.updateImage(table.random({mode.xmas.noel.img[img],mode.xmas.noel.img.jumping}))
			elseif id == 2 or rand == 9 then
				mode.xmas.noel.move(mul * math.random(10,20),-math.random(70,100))
				mode.xmas.noel.updateImage(mode.xmas.noel.img.jumping)
			end
		end,
		meep = function()
			tfm.exec.displayParticle(20,mode.xmas.noel.x,mode.xmas.noel.y)
			tfm.exec.explosion(mode.xmas.noel.x,mode.xmas.noel.y,20,50)
		end,
		cannon = function()
			local player = mode.xmas.noel.nearMouse(100)
			if player[1] ~= "" then
				local x = mode.xmas.noel.x + (mode.xmas.noel.x > player[2].x and -40 or 40)
				local y = mode.xmas.noel.y + (mode.xmas.noel.y > player[2].y and -40 or 40)
				local angle = math.deg(math.atan2(player[2].y-mode.xmas.noel.y,player[2].x-mode.xmas.noel.x)) + 90
				table.insert(mode.xmas.despawnObjects,{
					[1] = tfm.exec.addShamanObject(1703,x,y,angle),
					[2] = os.time() + 2500
				})
				local effect = function(id,sx,sy,xs,ys,e)
					for i = 1,2 do
						tfm.exec.displayParticle(id[i] and id[i] or id[1],x + sx * e,y - sy * e,xs/1.5,ys/1.5)
					end
				end
				for i = 1,20 do
					effect({9,11},math.cos(i),math.sin(i),math.cos(i),-math.sin(i),22)
					effect({13},math.cos(i),math.sin(i),math.sin(i),math.cos(i),19)
				end
			end
		end,
		teleport = function()
			if os.time() > mode.xmas.noel.timers.teleport then
				mode.xmas.noel.timers.teleport = os.time() + 8000
				tfm.exec.displayParticle(37,mode.xmas.noel.x,mode.xmas.noel.y)
				local x,y = math.random(20,780),math.random(50,300)
				tfm.exec.moveObject(mode.xmas.noel.id,x,y)
				tfm.exec.displayParticle(37,x,y)
			else
				mode.xmas.noel.escape(2)
			end
		end,
		gift = function()
			if os.time() > mode.xmas.noel.timers.prize then
				mode.xmas.noel.timers.prize = os.time() + 5000
				mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
				local giftsAmount = mode.xmas.amountPlayers < 10 and 1 or math.floor(mode.xmas.amountPlayers/10)
				for i = 1,giftsAmount do
					local gift = table.random({2,4,3,1,1,2,3,5,2,4})
					for k,v in next,mode.xmas.gifts do
						if gift == k then
							gift = k
							break
						end
					end
					local gen = {}
					gen[1] = tfm.exec.addShamanObject(6300,mode.xmas.noel.x,mode.xmas.noel.y,0,table.random({-13,-10,-5,5,10,13}))
					gen[2] = os.time() + mode.xmas.gifts[gift][2]
					gen[3] = tfm.exec.addImage(mode.xmas.gifts[gift][1]..".png","#"..gen[1],-15,-15)
					gen[4] = gift
					table.insert(mode.xmas.currentGifts,gen)
				end
			else
				mode.xmas.noel.escape(0)
			end
		end,
		dizzy = function(timer)
			if os.time() > mode.xmas.noel.timers.prize then
				mode.xmas.noel.isDizzy[1] = os.time() + 9500
			else
				mode.xmas.noel.escape(2)
			end
		end,
	},
