system.newGameTimer = 0
system.officialMode = {"", ""}
system.playerMessage = ""
system.getAdmins = function()
	local out = {}
	for k, v in next, module._FREEACCESS do
		if v > 2 then
			out[k] = true
		end
	end
	return out
end