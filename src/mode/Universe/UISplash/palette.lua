	uipaletteMono = function(hex,n)
		mode.universe.info[n].settings.palette[1] = mode.universe.info[n].settings.palette[1] < 1 and #hex or mode.universe.info[n].settings.palette[1] > #hex and 1 or mode.universe.info[n].settings.palette[1]

		local darker = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,true)
		local lighter = mode.universe.paletteMonochromatic(hex[mode.universe.info[n].settings.palette[1]],5,0.07,false)

		local colors = setmetatable(darker,mode.universe.meta.add)
		colors = colors + lighter
		table.sort(colors)

		local div = mode.universe.tab .. "<BL>|<V>" .. mode.universe.tab
		mode.universe.uinew(10,string.format("<font size='11'><V><a href='event:palette.left'>« %s</a>%s<a href='event:palette.right'>%s »</a>%s<a href='event:palette.exit'>%s</a>",system.getTranslation().color.previous,div,system.getTranslation().color.next,div,system.getTranslation().exit),n,400,200,450,80,true)
		for i = 1,#colors do
			local color = colors[i]
			mode.universe.uinew(i + 10,color and ("<font size='7'>\n<p align='center'><font size='13' color='#"..string.format("%X",0xFFFFFF-color).."'><a href='event:item.color." .. color .. "'>■</a>"),n,150 + (50*i) or "",215,40,40,false,color)
		end
	end,
