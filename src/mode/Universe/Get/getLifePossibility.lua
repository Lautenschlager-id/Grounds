	getLifePossibility = function(this)
		local possibility = 0
		
		if this.class == 2 then
			if not mode.universe.data.objects[string.lower(this.className)][this.type][4] then
				return 0
			else
				possibility = possibility + 10
				
				if #this.moons > 0 then
					possibility = possibility + 10
				end
				
				if this.velocity > 0.7 and this.velocity < 2.4 then
					possibility = possibility + 10
				end
			end
		elseif this.class == 3 then
			if mode.universe.cosmos[this.satelliteOf].life >= 40 then
				possibility = possibility + 5
			end

			if string.find(string.lower(mode.universe.cosmos[this.satelliteOf].typeName),"gas") then
				possibility = possibility + 10
			end
			
			if this.velocity == 2.5 then
				possibility = possibility + 10
			end
		end
		
		local dist = this.distance
		local starSize = mode.universe.cosmos[1].size / 100
		
		if dist > (10 * starSize) then
			if dist > (50 * starSize) then
				if dist > (100 * starSize) then
					if dist > (200 * starSize) then
						if dist > (350 * starSize) then
							possibility = possibility + 10
						end
					else
						possibility = possibility + 45
					end
				else
					possibility = possibility + 60
				end
			else
				possibility = possibility + 5
			end
		end
	
		return possibility
	end,
