	paletteMonochromatic = function(hex,amount,period,reversed)
		local hsl = color.rgbToHsl(color.hexToRgb(hex))
		
		local colors = {}
		
		local final = 1
		if reversed then
			final = hsl.l - amount
			period = -period
		end
		
		for i = hsl.l,final,period do
			colors[#colors+1] = color.rgbToHex(color.hslToRgb(hsl.h,hsl.s,i))
			
			amount = amount - 1
			if amount == 0 then
				break
			end
		end
		
		if reversed then
			table.remove(colors,1)
		end
		
		return colors
	end,
