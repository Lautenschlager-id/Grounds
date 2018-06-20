	board = {},
	colors = {
		background = 0x2F363F,
		whiteSquare = 0xFFCE9E,
		whitePiece = 'FFFFFF',
		blackSquare = 0xD18B47,
		blackPiece = '1',
		specialMove = 0xB300EF,
		emptyMove = 0x2ECF73,
		captureMove = 0xAF2A2A,
		lastMove = 0xFFCF5F,
		selectedPiece = '<PT>',
	},
	pieces = {
		king = 1,
		queen = 2,
		rook = 3,
		bishop = 4,
		knight = 5,
		pawn = 6
	},
	players = {},
	moveTimer = 0,
	canStart = false,
	currentPlayer = 2,
	currentPlayerColor = "",
	lastMove = {},
	coloredSquares = {},