	eventLoop = function()
		mode.xmas.currentTime = mode.xmas.currentTime + .5
		mode.xmas.leftTime = mode.xmas.leftTime - .5
		if mode.xmas.start then
			if mode.xmas.currentTime > 4 then
				if mode.xmas.noel.id == -1 then
					mode.xmas.noel.id = tfm.exec.addShamanObject(6300,mode.xmas.noel.x,mode.xmas.noel.y)
					mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
				end

				local ox,oy
				if tfm.get.room.objectList[mode.xmas.noel.id] then
					ox,oy = tfm.get.room.objectList[mode.xmas.noel.id].x,tfm.get.room.objectList[mode.xmas.noel.id].y
				else
					ox,oy = mode.xmas.noel.x,mode.xmas.noel.y
				end

				if (ox < -10 or ox > 810) or (oy > 400 or oy < -50) then
					tfm.exec.removeObject(mode.xmas.noel.id)
					mode.xmas.noel.x,mode.xmas.noel.y = mode.xmas.initx,mode.xmas.inity
					mode.xmas.noel.id = nil
				end

				if mode.xmas.noel.id then
					mode.xmas.noel.x = ox
					mode.xmas.noel.y = oy
				end

				for k,v in ipairs(mode.xmas.despawnObjects) do
					if os.time() > v[2] then
						tfm.exec.removeObject(v[1])
					end
				end
				for k,v in ipairs(mode.xmas.currentGifts) do
					if os.time() > v[2] then
						tfm.exec.removeObject(v[1])
						tfm.exec.removeImage(v[3])
					end
				end

				if os.time() > mode.xmas.noel.isDizzy[1] and mode.xmas.currentTime > 5 then
					mode.xmas.noel.particles(13)
					if mode.xmas.currentTime % 60 == 0 then
						mode.xmas.noel.dizzy()
					elseif mode.xmas.currentTime % 5 == 0 then
						mode.xmas.noel.gift()
						mode.xmas.noel.escape(1)
					elseif math.floor(mode.xmas.currentTime) % 2 == 0 then
						local option = math.random((mode.xmas.noel.isEscaping and 15 or 12))
						if option > 3 then
							mode.xmas.noel.escape()
						else
							mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
							if mode.xmas.currentTime > 7 and math.random(1,2) == 1 then
								if option == 3 then
									mode.xmas.noel.cannon()
								elseif option == 2 then
									mode.xmas.noel.teleport()
								elseif option == 1 then
									mode.xmas.noel.meep()
								end
							end
						end
					else
						mode.xmas.noel.updateImage(mode.xmas.noel.img.stop)
					end
				else
					mode.xmas.noel.particles(1)
					if not mode.xmas.noel.isDizzy[2] then
						mode.xmas.noel.isDizzy[2] = true
						mode.xmas.noel.timers.prize = os.time() + 5000
						local imgId = #mode.xmas.noel.img.dizzy
						local animation = {}
						local numb = 1
						animation = system.looping(function()
							mode.xmas.noel.updateImage(mode.xmas.noel.img.dizzy[imgId])

							if imgId == #mode.xmas.noel.img.dizzy or imgId == 1 then
								numb = -numb
							end

							imgId = imgId + numb

							if (os.time()+250) > mode.xmas.noel.isDizzy[1] then
								for k,v in next,animation do
									system.removeTimer(v)
								end
								mode.xmas.noel.isDizzy = {0,false}
							end
						end,10)
					end
				end
			end
			if mode.xmas.leftTime < 2 then
				mode.xmas.start = false
				tfm.exec.newGame(mode.xmas.xml)
			end
		end
	end,
