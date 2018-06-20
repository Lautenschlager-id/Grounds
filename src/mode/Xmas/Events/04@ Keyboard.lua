	eventKeyboard = function(n,k,d,x,y)
		if mode.xmas.start then
			if os.time() > mode.xmas.info[n].catch and k == 32 then
				if os.time() < mode.xmas.noel.isDizzy[1] then
					if math.pythag(x,y,mode.xmas.noel.x,mode.xmas.noel.y,32) then
						mode.xmas.info[n].db.eventNoelGifts[2] = (mode.xmas.info[n].db.eventNoelGifts[1]/10) + mode.xmas.info[n].db.eventNoelGifts[2]
						mode.xmas.info[n].db.eventNoelGifts[1] = 0

						mode.xmas.updateBar(n)
					end
				else
					for k,v in next,mode.xmas.currentGifts do
						local o = tfm.get.room.objectList[v[1]]
						if o and math.pythag(x,y,o.x,o.y,25) then
							if (mode.xmas.info[n].db.eventNoelGifts[1]+v[4]) <= 50 then
								tfm.exec.removeObject(v[1])
								tfm.exec.removeImage(v[3])

								mode.xmas.currentGifts[k][2] = 0
								mode.xmas.info[n].db.eventNoelGifts[1] = mode.xmas.info[n].db.eventNoelGifts[1] + v[4]

								mode.xmas.updateBar(n,({0xB73535,0x358CB7,0x35B765,0xB7B735,0xB73487})[v[4]])
								break
							end
						end
					end
				end
				mode.xmas.info[n].catch = os.time() + 1000
			end
		end
	end,
