dataManager = {}
dataManager.using = function(module, data)
	local self = {}	
	
	--[[ Tools ]]--
	local transform = function(value, dataType, reverse)
		if dataType == "number" then
			return reverse and (tostring(value)) or (tonumber(value) or 0)
		elseif dataType == "boolean" then
			return reverse and (value and "1" or "0") or (value == "1")
		elseif dataType == "table" then
			return reverse and (table.concat(value, "|")) or (string.split(value, "[^|]+", function(value)
				if value == "true" or value == "false" then
					return value == "true"
				end
				return tonumber(value) or tostring(value)
			end))
		else
			return tostring(value)
		end
	end
	
	local normalizeData = function(self, data)
		data = string.split(data, "[^~]+")
		local out = {}
		
		for k, v in next, self._data do
			local value = data[v.index]
			if value then
				if value == "nil" then
					value = v.default
				else
					value = transform(value, type(v.default))
				end
			end
			if type(value) == "nil" then
				value = v.default
			end
			
			out[v.name] = value
		end
		
		return out
	end

	local init = function(self, module, data)
		self._module = module
		self._data = {}
		self._players = {}
		
		local availableTypes = { number = true, string =  true, table = true, boolean = true }
		
		for k, v in next, data do
			if v.index and type(v.index) == "number" then
				if not self._data[v.index] then
					if v.default ~= nil and availableTypes[type(v.default)] then
						self._data[v.index] = {
							index = v.index,
							default = v.default,
							name = k
						}
					else
						error(string.format("parameter_index_%s:%s: The index 'default' does not exist or have not its value type available for this manager [number, string, table, boolean].", v.index, type(v.default)))
					end
				else
					error(string.format("parameter_index_%s: The index 'index' must be unique. There is already a value with this index.", v.index))
				end
			else
				error(string.format("parameter_%s: The index 'index' does not exist or is not a number.", k))
			end
		end
	end

	--[[ Managers ]]--
	self.struct = function(self, player, data)
		local hasData = false
		
		local garbage = data
		for Module, Data in string.gmatch(data, "%[(.-)%]%((.-)%)") do
			garbage = string.gsub(string.gsub(garbage, string.format("%%[%s%%]%%(.-%%)", Module), ""), "<INSERT_DATA>", "")
		
			if Module == self._module then
				hasData = true
				
				local raw = string.gsub(data, string.format("%%[%s%%]%%(.-%%)", Module), "<INSERT_DATA>")
				self._players[player] = setmetatable({_GARBAGE = {"", false}, data = normalizeData(self, Data)},{
					__call = function(playerTable, single)
						local out = {}
						for k, v in next, self._data do
							out[#out + 1] = transform(self._players[player].data[v.name], type(self._players[player].data[v.name]), true)
						end
						
						local out =  string.format("[%s](%s)", self._module, table.concat(out, "~"))
						if single then
							return out
						else
							raw = string.gsub(raw, playerTable._GARBAGE[2] and playerTable._GARBAGE[1] or "", "", 1)
							return string.gsub(raw, "<INSERT_DATA>", out)
						end
					end
				})
			end
		end

		if hasData then
			garbage = string.gsub(garbage, "[%^%$%(%)%%%[%]%?%*%+%-]", "%%%1")
			self._players[player]._GARBAGE[1] = garbage
		else
			return self:struct(player, data .. string.format("[%s](nil)", self._module))
		end
		
		return not not self._players[player]
	end
	
	self.getData = function(self, player, index)
		if self._players[player] then
			if index then
				if self._players[player].data[index] ~= nil then
					return self._players[player].data[index]
				else
					return { error = string.format("getData_ The index '%s' does not exist.", index) }
				end
			else
				return self._players[player]()
			end
		else
			return { error = string.format("getData_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	self.setValue = function(self, player, values, save)
		if self._players[player] then
			local updated = false
			for k, v in next, values do
				if self._players[player].data[k] ~= nil and type(v) == type(self._players[player].data[k]) then
					if not updated then
						updated = true
					end
					
					self._players[player].data[k] = v
				end
			end
			
			if updated then
				local out = self._players[player]()
				if save then
					self:save(player, out)
				end
				return out
			else
				return { error = string.format("setValue_ The values '%s' do not exist.", table.concat(values, " ~ ", tostring)) }
			end
		else
			return { error = string.format("setValue_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	self.save = function(self, player, data)
		if player then
			system.savePlayerData(player, data or self._players[player]())
			return true
		else
			return false
		end
	end
	
	self.garbage = function(self, player, remove)
		if self._players[player] then
			local garbage = self._players[player]._GARBAGE[1]
			if remove then
				self._players[player]._GARBAGE[2] = true
				self:save(player)
				self._players[player]._GARBAGE[1] = ""
			end
			return garbage, self._players[player]._GARBAGE[2]
		else
			return { error = string.format("garbage_ The player '%s' does not have a player structure.", player) }
		end
	end
	
	init(self, module, data)
	return self
end
dataManager.delete = function(module, data)
	for Module, Data in string.gmatch(data, "%[(.-)%]%((.-)%)") do
		local mod = module
		if type(module) == "table" then
			local found, index = table.find(module, Module)
			if found then
				mod = module[index]
			end
		end
		if Module == mod then
			data = string.gsub(data, string.format("%%[%s%%]%%(.-%%)", Module), "")
		end
	end
	return data
end