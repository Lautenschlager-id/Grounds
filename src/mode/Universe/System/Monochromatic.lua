	paletteMonochromatic = function(hex,amount,period,reversed)
		local h, s, l = color.rgb_to_hsl(color.hex_to_rgb(hex))
		
		local colors = {}
		
		local final = 1
		if reversed then
			final = l - amount
			period = -period
		end
		
		for i = l,final,period do
			colors[#colors+1] = color.rgb_to_hex(color.hsl_to_rgb(h, s, i))
			
			amount = amount - 1
			if amount == 0 then
				break
			end
		end
		
		if reversed then
			table.remove(colors, 1)
		end
		
		return colors
	end,
