	displayBar = function(id,player,value,nvalue,color,sig,size,height)
		sig = sig or ""
		size = size or 100
		height = height or 20

		ui.addTextArea(id,"",player,5,(height+8) * id,size + 4,height,0xC7CED2,1,1,true)
		if value ~= 0 then
			ui.addTextArea(id.."0","",player,6,(height+8) * id + 2,nvalue + 2,height - 4,color,color,1,true)
		end
		ui.addTextArea(id + 2,"<B><font color='#0'>"..value..sig,player,(size-30)/2,(height+8) * id + 1,50,height,1,1,0,true)
	end,