system.gameMode = module._NAME
system.modeChanged = os.time() + 1000

system.getGameMode = function(moduleName, triggerEvent)
	local exists = not not mode[moduleName]
	
	if exists then	
		system.gameMode = moduleName
		
		if triggerEvent then
			eventOnModeChange()
		end
		
		system.modeChanged = os.time() + 1000
	end
	return exists
end