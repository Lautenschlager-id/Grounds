modulePath = string.match(debug.getinfo(1).source:sub(2),"(.-\\)Debug")
require (modulePath:match("C:(.-\\)src") .. 'sys')

tree = {
	getFile("Control"),
	getFile("Improvements"),
	getFile("Room"),
	getFile("Player"),
	getFile("System"),
	getFile("Interface"),
	getFile("Math"),
	getFile("String"),
	getFile("Table"),
	getFile("Others"),
	getFile("XML"),
	getFile("Color"),
}

setFile()
