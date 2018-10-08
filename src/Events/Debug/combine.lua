modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)Debug")
require (modulePath:match("C:(.-\\)src") .. 'sys')

tree = {
	getFile("eventLoop"),
	getFile("eventNewPlayer"),
	getFile("eventChatCommand"),
	getFile("eventPlayerDataLoaded"),
}

setFile()
