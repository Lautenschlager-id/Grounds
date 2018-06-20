	displayChat = function(n,update)
		local loadedM = mode.chat.loadData()
		if not update then
			mode.chat.chat(n,loadedM)
		else
			for k,v in next,mode.chat.info do
				if v.open then
					mode.chat.chat(k,loadedM,k ~= n)
				else
					v.toRead = v.toRead + 1
					mode.chat.updateToRead(k)
				end
			end
		end
	end,