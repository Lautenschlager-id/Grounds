events.eventNewPlayer = function(n)
	tfm.exec.lowerSyncDelay(n)
	
	if system.officialMode[2] ~= "" then
		tfm.exec.chatMessage(system.officialMode[2],n)
	end
end
