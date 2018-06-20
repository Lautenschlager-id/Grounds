local _events = {}

local eventNames = {"eventLoop", "eventNewGame", "eventPlayerDied", "eventPlayerGetCheese", "eventPlayerVampire", "eventPlayerWon", "eventPlayerLeft", "eventEmotePlayed", "eventKeyboard", "eventMouse", "eventPopupAnswer", "eventTextAreaCallback", "eventChatCommand", "eventChatMessage", "eventSummoningStart", "eventSummoningEnd", "eventSummoningCancel", "eventNewPlayer", "eventPlayerRespawn", "eventColorPicked"}

local foo = function() end

system.init = function(refresh)
	_events = {}
	
	for _, event in next, eventNames do
		_events[event] = mode[system.gameMode][event] or foo
	end

	if refresh then
		if mode[system.gameMode].reset then
			mode[system.gameMode].reset()
		end
	end
	
	normalizeTranslation()
	mode[system.gameMode].init()

	table.foreach(tfm.get.room.playerList,eventNewPlayer)
end

for _, event in next, eventNames do
	_G[event] = function(...)
		if events[event] then
			events[event](...)
		end

		_events[event](...)
	end
end

system.setRoom()
system.init()