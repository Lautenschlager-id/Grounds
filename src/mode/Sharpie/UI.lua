	uiborder = function(t,x,y)
		local colors = {
			{"#F7F918","#EC4848"},
			{"#4CE7F7","#2C9F5B"},
			{"#4BD9CD","#2A64E9"},
			{"#D4F31A","#8C8fA4"},
		}
		local color = table.random(colors)

		ui.addTextArea(0,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y-1,900,25,1,1,0,true)
		ui.addTextArea(1,"<font color='" .. color[2] .. "'><B>"..t,nil,x,y+1,900,25,1,1,0,true)
		ui.addTextArea(2,"<font color='" .. color[2] .. "'><B>"..t,nil,x+1,y,900,25,1,1,0,true)
		ui.addTextArea(3,"<font color='" .. color[2] .. "'><B>"..t,nil,x-1,y,900,25,1,1,0,true)
		ui.addTextArea(4,"<font color='" .. color[1] .. "'><B>"..t,nil,x,y,900,25,1,1,0,true)
	end,