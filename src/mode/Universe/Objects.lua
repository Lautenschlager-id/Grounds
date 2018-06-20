	object = {
		new = function(self,info)
			mode.universe.orbit[4] = mode.universe.orbit[4] + 1
		
			local data = {
				position = mode.universe.orbit[4],
				
				name = #info.name>0 and info.name or "?",
				
				class = info.class,
				type = info.type,
				
				size = info.size,
				color = info.color,
				
				display = false,
			}
			
			data.className = system.getTranslation("en").buttons.classes[data.class] or "?"
			data.typeName = mode.universe.data.objects[string.lower(data.className)][data.type][1] or "?"

			data.gravity = mode.universe.getGravity(data.class,data.position)
			data.mass = mode.universe.getMass(data.gravity,data.size)
			data.temperature = (info.temperature == "auto" and mode.universe.getTemperature(data.class,data.position) or info.temperature)
			
			data.id = mode.universe.getID(data.class)
			
			if data.class == 1 then -- Star
				data.luminosity = mode.universe.getLuminosity(data.size,data.temperature)
				data.flow = mode.universe.getFlow(data.luminosity,data.size)
				data.magnitude = mode.universe.getMagnitude(data.flow)
				
				data.time = os.time()
				
				if not mode.universe.star then
					mode.universe.star = true
				end
				
				mode.universe.orbit[1] = mode.universe.orbit[1] + 1
			else
				if data.class == 2 then -- Planet
					data.moons = {}
					data.rings = info.rings
					data.orbit = mode.universe.orbit[2] + 1
					data.distance = (info.distance == "auto" and math.ceil(mode.universe.getDistance(data.class,data.position,data.size)) or math.ceil(info.distance))
					data.velocity = (info.velocity == "auto" and mode.universe.getVelocity(data.mass,data.size,data.orbit) or (info.velocity == 0 and .5 or info.velocity))
				elseif data.class == 3 then -- Moon
					data.satelliteOf = info.satelliteOf
					data.distance = math.ceil(mode.universe.getDistance(data.class,data.satelliteOf))
					data.velocity = 7 * table.random({.5,.3,.2,.1})
					
					mode.universe.cosmos[data.satelliteOf].moons[#mode.universe.cosmos[data.satelliteOf].moons + 1] = data.position
				end
				
				data.life = mode.universe.getLifePossibility(data)
				
				data.period = {
					rotation = mode.universe.getRotation(data.velocity),
					translation = mode.universe.getTranslation(data.mass,data.size)
				}
				
				if data.class == 2 then
					mode.universe.orbit[2] = mode.universe.orbit[2] + 1
					data.planetPosition = mode.universe.orbit[2]
				elseif data.class == 3 then
					mode.universe.orbit[3] = mode.universe.orbit[3] + 1
				end
			end

			mode.universe.cosmos[data.position] = data
			mode.universe.stuff[data.name] = true

			self.__index = self
			return setmetatable(data,self)			
		end,
		destroy = function(self)
			if self.class > 1 then
				if self.class == 2 then -- Planet
					if #self.moons > 0 then
						for k,v in next,self.moons do
							mode.universe.cosmos[v]:destroy()
						end
					end
					
					if self.rings then
						tfm.exec.removeJoint(self.id + 3)
					end
				end
				
				-- Below: Planet and Moon
				tfm.exec.removeJoint(self.id + 2) -- Object's JR
			end

			tfm.exec.removeJoint(self.id + 1) -- Object's JD
			tfm.exec.removePhysicObject(self.id) -- Object
			
			self.display = false
		end,
		create = function(self)
			local x = 4e3
			local y = x - (mode.universe.star and (mode.universe.cosmos[1].id == self.id and 0 or (mode.universe.cosmos[1].size + (self.distance * 4))) or 0)
			
			local center = mode.universe.cosmos[1].id
			if self.class == 3 then -- Resets the satellite
				center = mode.universe.cosmos[self.satelliteOf].id
			end
			
			tfm.exec.addPhysicObject(self.id,x,y,{ -- Object
				type = 14, -- Used to be 13
				color = 1,
				width = 1,
				groundCollision = false,
				miceCollision = false,
				mass = 1,
				dynamic = (self.class ~= 1),
			})
			
			tfm.exec.addJoint(self.id + 1,self.id,self.id,{ -- JD (Color)
				type = 0,
				point1 = string.format("%s,%s",x,y),
				point2 = string.format("%s,%s",x,y+1),
				line = self.size,
				color = self.color,
				alpha = 1,
				foreground = true,
			})
			
			if self.class ~= 1 then -- Rotation
				tfm.exec.addJoint(self.id + 2,center,self.id,{
					type = 3,
					forceMotor = self.class == 3 and 10 or 9999,
					speedMotor = self.velocity
				})
			end
			
			if self.rings then
				tfm.exec.addJoint(self.id + 3,self.id,self.id,{
					type = 0,
					point1 = string.format("%s,%s",x - self.size,y + math.floor(self.rings.inclination * 1.5)),
					point2 = string.format("%s,%s",x + self.size,y - math.floor(self.rings.inclination * 1.5)),
					line = self.rings.volume,
					color = self.color,
					alpha = .7,
					foreground = 1
				})
			end
			if self.moons then
				for k,v in next,self.moons do
					mode.universe.object.create(mode.universe.cosmos[v])
				end
			end
			
			self.display = true
		end,
	},
