modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)Debug")
require (modulePath:match("C:(.-\\)src") .. 'sys')

tree = {
	getFolder("Translations"),
	getFile("Data"),
	getFile("Settings"),
	getFile("Informations"),
	getFile("Meta"),
	getFolder("System"),
	getFile("UI"),
	getFolder("UISplash"),
	getFolder("UICreator"),
	getFile("MenuUpdate"),
	getFile("Background"),
	getFile("Profile"),
	getFolder("Get"),
	getFile("Objects"),
	getFolder("Others"),
	getFile("Init"),
	getFolder("Events"),
}

setFile()
