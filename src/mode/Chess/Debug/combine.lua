modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)Debug")
require (modulePath:match("C:(.-\\)src") .. 'sys')

tree = {
	getFolder("Translations"),
	getFile("Board"),
	getFile("Data"),
	getFile("StringRef"),
	getFolder("System"),
	getFile("Refresh"),
	getFolder("UI"),
	getFile("Init"),
	getFolder("Events"),
}

setFile()
