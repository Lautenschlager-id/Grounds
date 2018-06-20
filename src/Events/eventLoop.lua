events.eventLoop = function(currentTime,leftTime)
	_G.currentTime = math.round(currentTime / 1e3)
	_G.leftTime = math.round(leftTime / 1e3)
end