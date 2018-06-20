modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)Debug")
require (modulePath:match("C:(.-\\)src") .. 'sys')

tree = {
	getFolder("Translations"),
	getFile("Info"),
	getFile("Data"),
	getFile("Maps"),
	getFolder("Settings"),
	getFile("Shop"),
	getFile("System"),
	getFolder("UI"),
	getFile("WaterBar"),
	getFile("Grounds"),
	getFile("Init"),
	getFolder("Events"),
}

setFile()