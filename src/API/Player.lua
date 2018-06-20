system.isPlayer = function(n)
	--[[
		The player must not be a souris;
		The player must have played Transformice for at least 5 days
	]]
	return not not (string.sub(n, 1, 1) ~= "*" and tfm.get.room.playerList[n] and (os.time() - (tfm.get.room.playerList[n].registrationDate or os.time())) >= 432e6)
end
system.players = function(alivePlayers)
	local alive, total = 0, 0
	if alivePlayers then
		alive = {}
	end

	for k, v in next, tfm.get.room.playerList do
		if system.isPlayer(k) then
			total = total + 1
			if not (v.isDead or v.isVampire) then
				if alivePlayers then
					alive[#alive + 1] = k
				else
					alive = alive + 1
				end
			end
		end
	end

	return alive, total
end