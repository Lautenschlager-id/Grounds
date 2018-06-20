		en = {
			-- Init
			welcome = "Welcome to <font color='#BD5DC5'><B>#Universe</B></font>. Build your own solar system or just enjoy the art.\n\tReport bugs to Bolodefchoco.",
			creator = "Now you are the creator of the universe! Press <B>O</B> and build it all!",
			
			-- Data
			objects = {
				star = {
					"Yellow Dwarf",
					"Red Dwarf",
					"Red Giant",
					"Blue Giant",
					"Supergiant",
					"White Dwarf",
					"Brown Dwarf",
				},
				planet = {
					"Chthonian",
					"Gas Dwarf",
					"Gas Giant",
					"Ice Giant",
					"Iron",
					"Sillicate",
					"Telluric",
					"Dwarf",
				},
				moon = {
					"Asteroid",
					"Irregular Asteroid",
				},
			},
			menu = {
				class = "Class",
				type = "Type",
				name = "Name",
				color = "Color",
				size = "Size",
				temperature = "Temperature",
				satellite = "Satellite of",
				velocity = "Velocity",
				distance = "Distance",
				rings = "Rings",
				gravity = "Gravity",
				mass = "Mass",
				flow = "Flow",
				luminosity = "Luminosity",
				magnitude = "Magnitude",
				rotation = "Rotation",
				translation = "Translation",
			},
			
			-- Interface
			buttons = {
				keyboard = {
					"submit",
					"backspace",
					"clear"
				},
				classes = {
					"Star",
					"Planet",
					"Moon"
				},
				main = {
					create = "Create",
					reset = "Reset",
					destroy = "Destroy",
					recreate = "Recreate",
				},
			},
			color = {
				previous = "Previous Color",
				next = "Next Color"
			},
			profile = {
				profiles = "profiles",
				exTime = "Existence Time",
				information = "Information",
				main = "Main",
				planets = "Planets",
				life = "Life",
				periods = "Periods",
				orbit = "Orbit",
				satellites = "Satellites",
			},
			exit = "Exit",
			choose = "Choose",
			yes = "Yes",
			no = "No",
			
			-- Warning
			newObject = {
				"New <B>%s star</B> created!",
				"New <B>%s planet</B> created!",
				"New <B>%s moon</B> orbiting %s!",
			},
			checkProfile = "Check its profile using the command <B>!profile %s</B>",
			fail = "The attributes %s are invalid!",
			nameExist = "There's already an object named \"%s\"!",
			destroyConfirm = "Are you sure you want to delete the %s \"%s\"?",
			cantDestroy = "You cannot destroy this object!",
			moonDestroyed = "All the moons of this planet were destroyed too!",
			systemDestroyed = "This Solar System was destroyed!",
			moonRecreated = "The moons of this planet were recreated!",
			planetRecreated = "The planet which the recreated moon orbits was also recreated (also the other moons, if exists)!",
			systemRecreated = "The System was recreated!",
			sysName = {
				choose = "Set below a name for the Solar System. (20- characters)",
				new = "This Solar System has been renamed to \"%s\"! \\o/",
			},
		},
