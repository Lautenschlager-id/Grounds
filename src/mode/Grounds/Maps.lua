	maps = {},
	G = {
		--[[
			name = catName,
			queue{maps},
			id = 1,
			icon = {iconImage,x axis (from 360),y axis (from 123)}
			color = catColor,
			before = function executed before the map,
			after = function executed after the map
		]]--
		[1] = {
			name = "Circuit",
			queue = {3099763,4612510,7078090,4493715,7102175,7127261,7102187,7252160,7241132,7333343,6578479},
			id = 1,
			icon = {"15c60371706",0,-1},
			color = "9A9ACE",
		},
		[2] = {
			name = "Flap Bird",
			queue = {7069835,2265250,6300148,5921754,2874090,2310427,7260642},
			id = 1,
			icon = {"15c603730a6",0,0},
			color = "E084D4",
		},
		[3] = {
			name = "Bootcamp",
			queue = {4592612,7079708,5921867,7087840,6391815,7090909,7011800,7069314,6333026,6000012,6990787,7100040,7068403,7259064,7316276,7460134,7460158},
			id = 1,
			icon = {"15c60382627",-5,-5},
			color = "A4CF9E",
			before = function()
				if system.officialMode[1] == "" and math.random(10) > 6 then
					tfm.exec.chatMessage("<PT>" .. system.getTranslation().rooms.bootcamp)
				end
			end,
			after = function()
				if system.officialMode[1] == "bootcamp" then
					tfm.exec.setGameTime(180)
				end
			end,
		},
		[4] = {
			name = "Aquatic",
			queue = {6133469,3324284,7095393,5772226,2310447,7252986,7316290},
			id = 1,
			icon = {"15c603788c1",0,0},
			color = "2194D9",
		},
		[5] = {
			name = "Teleport",
			queue = {5168440,6987992,7069343,6945850,7090907,3326655,7069816,5921744,7071075,7071400,4509060,7118888,7219651,7246114,7251246,7271551},
			id = 1,
			icon = {"15c60376d57",2,-1},
			color = "E29E71",
		},
		[6] = {
			name = "Puzzle",
			queue = {5993927,7057010,5507021,6994066,6332986,7074686,3448597,2887357,6576282,4514386,7079827,7079880,7192030,7204077,7259062,7275725},
			id = 1,
			icon = {"15c6037edb7",0,-1},
			color = "75EABB",
		},
		[7] = {
			name = "Racing",
			queue = {4140491,3324180,6564380,6600268,6987993,6726599,2283901,6568120,4055924,4361785,3851416,7079644,6347093,6620004,7086768,6797243,2030030,5198518,6230212,6340023,7069304,4362362,5981054,4364504,7086737,6623930,7245986,7251932,7246303,7251897},
			id = 1,
			icon = {"15c6037ccd7",-5,-5},
			color = "9DBCF2",
			before = function()
				if system.officialMode[1] == "" and math.random(30) > 20 then
					tfm.exec.chatMessage("<PT>" .. system.getTranslation().rooms.racing)
				end
			end,
			after = function()
				tfm.exec.setGameTime(120) -- 2 minutes
			end,
		},
		[8] = {
			name = "Snow",
			queue = {4396371,5632126,7079092,4531989,4509584},
			id = 1,
			icon = {"15c6037b089",5,1},
			color = "CCDFEA",
			after = function()
				if os.date("%m") == "12" then
					tfm.exec.chatMessage("<PS>Merry christmas :)")
					tfm.exec.snow(60)
				end
			end,
		},
		[9] = {
			name = "Miscellaneous",
			queue = {6226386,5425815,7047955,6558179,6961916,6968299,6935117,4802574,7087798,6335452,7093647,7145064,6197872,4869830,7296331,7333260,7460173},
			id = 1,
			icon = {"15c6036fb66",-10,-2},
			color = "FFE83A",
		},
		[10] = {
			name = "Cooperation",
			queue = {3326675,4184558,5198607,6988672,7271861},
			id = 1,
			icon = {"15c60374f1f",-3,-1},
			color = "CB6BF4",
		},
		[11] = {
			name = "Vampire",
			queue = {5043429,4361619,4633670},
			id = 1,
			icon = {"15c60380b12",-10,-5},
			color = "CB546B",
			after = function()
				if os.date("%m") == "10" then
					tfm.exec.chatMessage("<R>Happy Halloween :>")
				end
			end,
		},
		[12] = {
			name = "House",
			queue = {510966,7240001,7316967},
			id = 1,
			icon = {"15cb6dbea83",-8,-4},
			color = "D1AB83",
			after = function()
				tfm.exec.setGameTime(1800) -- 30 minutes
				tfm.exec.chatMessage("<ROSE>" .. system.getTranslation().tribehouse)
			end,
		},
	},
	rotation = {1,{9,7,4,1,5,7,10,8,6,11,2,1,3,5}},
	newMap = coroutine.wrap(function(this)
		while true do
			local map
			if os.time() > system.newGameTimer then
				this = this or {}
				
				if #this<1 and (mode.grounds.rotation[1] > #mode.grounds.rotation[2]) then
					mode.grounds.rotation[1] = 1
				end
				
				local category = this.category or mode.grounds.rotation[2][mode.grounds.rotation[1]]
				mode.grounds.mapInfo[2] = category
				category = mode.grounds.G[category]
				mode.grounds.mapInfo[5] = category.color
				map = this.map or category.queue[category.id]
				mode.grounds.mapInfo[1] = map
				
				if #this<1 then
					category.id = category.id + 1
				end
				
				mode.grounds.afterFunction = category.after or (function() end)
				if category.before then
					category.before()
				end
				
				if #this<1 then
					if category.id > #category.queue then
						category.queue = table.shuffle(category.queue)
						category.id = 1
					end
					
					mode.grounds.rotation[1] = mode.grounds.rotation[1] + 1
				end
			end
			this = coroutine.yield(map)
		end
	end),
