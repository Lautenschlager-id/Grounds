	eventNewGame = function()
		if (tfm.get.room.xmlMapInfo or {}).author ~= "#Module" then
			return
		end
	
		mode.universe.canInsertBackground = true
		
		mode.universe.setBackground()
	
		-- Solar System
		if system.roomNumber == 801 or not string.find(tfm.get.room.name,"@") then
			local system = {
				[1] = {
					name = "Sun",
					class = 1,
					className = "Star",
					type = 1,
					typeName = "Yellow Dwarf",
					size = 90,
					color = 0xF8B55F,
					temperature = 5500,
				},
				[2] = {
					name = "Mercury",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Iron",
					size = 18,
					color = 0x929292,
					velocity = 4,
					temperature = 200,
					rings = false,
					distance = 1,
				},
				[3] = {
					name = "Venus",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Telluric",
					size = 32,
					color = 0xCFB181,
					velocity = .5,
					temperature = 450,
					rings = false,
					distance = 20,
				},
				[4] = {
					name = "Earth",
					class = 2,
					className = "Planet",
					type = 5,
					typeName = "Telluric",
					size = 35,
					color = 0x3E7B9D,
					velocity = 1,
					temperature = 20,
					rings = false,
					distance = 70,
				},
				[5] = {
					name = "Moon",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 6.5,
					color = 0x848484,
					temperature = -30,
					satelliteOf = 4
				},
				[6] = {
					name = "Mars",
					class = 2,
					className = "Planet",
					type = 6,
					typeName = "Sillicate",
					size = 24,
					color = 0xEF6B3E,
					velocity = .6,
					temperature = -17,
					rings = false,
					distance = 120,
				},
				[7] = {
					name = "Phobos",
					class = 3,
					className = "Moon",
					type = 2,
					typeName = "Irregular Asteroid",
					size = 3.3,
					color = 0x73572B,
					temperature = -58,
					satelliteOf = 6
				},
				[8] = {
					name = "Deimos",
					class = 3,
					className = "Moon",
					type = 2,
					typeName = "Irregular Asteroid",
					size = 2.2,
					color = 0xB9B9B9,
					temperature = -40,
					satelliteOf = 6
				},
				[9] = {
					name = "Jupiter",
					class = 2,
					className = "Planet",
					type = 3,
					typeName = "Gas Giant",
					size = 55,
					color = 0xE39492,
					velocity = .4,
					temperature = -170,
					rings = {
						inclination = .6,
					},
					distance = 185,
				},
				[10] = {
					name = "Io",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 5.5,
					color = 0xE7D587,
					temperature = -100,
					satelliteOf = 9
				},
				[11] = {
					name = "Europa",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 4.5,
					color = 0xB4BCBE,
					temperature = -180,
					satelliteOf = 9
				},
				[12] = {
					name = "Ganymede",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 10,
					color = 0x907E6D,
					temperature = -150,
					satelliteOf = 9
				},
				[13] = {
					name = "Callisto",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 8,
					color = 0xB9A89F,
					temperature = -180,
					satelliteOf = 9
				},
				[14] = {
					name = "Saturn",
					class = 2,
					className = "Planet",
					type = 3,
					typeName = "Gas Giant",
					size = 50,
					color = 0xCAAB7B,
					velocity = .3,
					temperature = -170,
					rings = {
						inclination = .3,
						volume = 7
					},
					distance = 280,
				},
				[15] = {
					name = "Titan",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 9,
					color = 0xCF892A,
					temperature = -180,
					satelliteOf = 14
				},
				[16] = {
					name = "Enceladus",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 6.5,
					color = 0xAEBBC3,
					temperature = -200,
					satelliteOf = 14
				},
				[17] = {
					name = "Uranus",
					class = 2,
					className = "Planet",
					type = 4,
					typeName = "Ice Giant",
					size = 36,
					color = 0x57D2C9,
					velocity = .2,
					temperature = -216,
					rings = {
						inclination = 2,
						volume = 1
					},
					distance = 360,
				},
				[18] = {
					name = "Neptune",
					class = 2,
					className = "Planet",
					type = 4,
					typeName = "Ice Giant",
					size = 30,
					color = 0x456FFD,
					velocity = .17,
					temperature = -210,
					rings = false,
					distance = 430,
				},
				[19] = {
					name = "Pluto",
					class = 2,
					className = "Planet",
					type = 8,
					typeName = "Dwarf",
					size = 6,
					color = 0x40181C,
					velocity = .08,
					temperature = -230,
					rings = false,
					distance = 500,
				},
				[20] = {
					name = "Charon",
					class = 3,
					className = "Moon",
					type = 1,
					typeName = "Asteroid",
					size = 3.8,
					color = 0xA7A7A7,
					temperature = -220,
					satelliteOf = 19
				},
			}
			
			for i = 1,#system do
				if not mode.universe.stuff[system[i].name] then
					mode.universe.object.new(mode.universe.object,system[i])
				end
			end
			
			
			for i = 1,#mode.universe.cosmos do
				if mode.universe.cosmos[i].class ~= 3 then
					mode.universe.cosmos[i]:create()
				end
			end
		end
	end,
