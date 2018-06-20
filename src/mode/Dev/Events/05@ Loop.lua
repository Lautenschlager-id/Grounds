	eventLoop = function()
		for k,v in next,{table.unpack(mode.dev.toDespawn)} do
			if os.time() > v[2] then
				tfm.exec.removeObject(v[1])
				mode.dev.objects[v[1]] = nil
				table.remove(mode.dev.toDespawn,k)
			end
		end

		if system.miscAttrib == 1 then
			table.foreach(tfm.get.room.playerList,tfm.exec.respawnPlayer)
		end
	end,