	uibar = function(id,player,value,color,size,height,y)
		size = size or 100
		height = height or 20
		y = y or 25
		
		local x = mode.grounds.isOfficialMap and 50 or 5

		if value > size then
			value = size
		elseif value < 0 then
			value = 0
		end

		ui.addTextArea(id,"",player,x,y,size + 4,height,0xC7CED2,1,1,true)
		if value ~= 0 then
			ui.addTextArea(id+1,"",player,x + 1,y + 2,value + 2,height - 4,color,color,1,true)
		end
		ui.addTextArea(id+2,"<p align='center'><B><font color='#0'>"..value.."%",player,x,y-4,size + 4,20,1,1,0,true)
	end,