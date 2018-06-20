	uinew = function(id,text,player,x,y,w,h,hasBg,color)
		w,h = w or 100,h or 100
		x,y = ((x or 400) - (w/2)),((y or 400) - (h/2))

		id = id>0 and id*5 or id
		if hasBg then
			ui.addTextArea(id,"",player,5,5,790,400,1,1,.5,true)
		end

		ui.addTextArea(id+1,"",player,x,y,w,h,0x0C191C,0x0C191C,1,true)
		ui.addTextArea(id+2,"",player,x+1,y+1,w-2,h-2,0x24474D,0x24474D,1,true)
		ui.addTextArea(id+3,"",player,x+2,y+2,w-4,h-4,0x183337,0x183337,1,true)
		ui.addTextArea(id+4,text,player,x+2,y+3,w-4,h-5,color or 0x122528,color or 0x122528,1,true)
	end,
	uiremove = function(id,player)
		id = id>0 and id*5 or id
		for i = id + 4,id,-1 do
			ui.removeTextArea(i,player)
		end
	end,
