	data = { 
		objects = {
			star = {
				--[[
					Name;
					Color accuracy;
					Size range
				]]
				{"Yellow Dwarf", {color.Yellow}, "40:100"},
				{"Red Dwarf", {color.OrangeRed}, "40:100"},
				{"Red Giant", {color.OrangeRed}, "80:160"},
				{"Blue Giant", {color.CornflowerBlue}, "80:160"},
				{"Supergiant", {color.Yellow, color.OrangeRed, color.CornflowerBlue}, "80:160"},
				{"White Dwarf", {color.DarkGray}, "30:60"},
				{"Brown Dwarf", {color.Sienna}, "30:60"},
			},
			planet = {
				--[[
					Name;
					Color accuracy;
					Size range;
					Lifeable;
					Queue Limit (where positive = not > x ; negative = not < abs(x) and 0 is free)
				]]
				{"Chthonian", {color.Sienna, color.MediumTurquoise, color.DarkGoldenrod}, "15:35", false, 2},
				{"Gas Dwarf", {color.DarkGray, color.DarkGoldenrod, color.MediumTurquoise, color.IndianRed}, "20:30", false, -2},
				{"Gas Giant", {color.DarkGray, color.DarkGoldenrod, color.MediumTurquoise, color.IndianRed}, "25:60", false, -2},
				{"Ice Giant", {color.MediumBlue, color.MediumTurquoise, color.SteelBlue}, "20:45", false, -3},
				{"Iron", {color.DarkGray, color.DarkGoldenrod, color.RosyBrown}, "15:25", true, 0},
				{"Sillicate", {color.DarkGoldenrod, color.RosyBrown, color.OliveDrab, color.SteelBlue}, "20:30", true, 0},
				{"Telluric", {color.DarkGoldenrod, color.RosyBrown, color.OliveDrab, color.SteelBlue}, "15:35", true, 0},
				{"Dwarf", {color.DarkGray, color.DarkGoldenrod}, "5:12", true, -1},
			},
			moon = {
				--[[
					Name;
					Color accuracy;
					Size range
				]]
				{"Asteroid", {color.DarkGray}, "5:8"},
				{"Irregular Asteroid", {color.DarkGray, color.DarkGoldenrod}, "2:6"},
			},
		},
		classes = {
		
		},
		menu = {

		},
	}, 
