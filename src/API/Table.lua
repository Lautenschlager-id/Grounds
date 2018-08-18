table.find = function(list, value, index, f)
	for k, v in next, list do
		local i = (type(v) == "table" and index) and v[index] or v
		if (not f and i or f(i)) == value then
			return true, k
		end
	end
	return false, 0
end
table.turnTable = function(x)
	return (type(x)=="table" and x or { x })
end
table.random = function(t)
	return (type(t) == "table" and t[math.random(#t)] or math.random())
end
table.shuffle = function(t)
	local len = #t
	for i = len, 1, -1 do
		local rand = math.random(len)
		t[i], t[rand] = t[rand], t[i]
	end
	return t
end
table.merge = function(this,src)
	for k, v in next, src do
		if this[k] then
			if type(v) == "table" then
				this[k] = table.turnTable(this[k])
				table.merge(this[k], v)
			else
				this[k] = this[k] or v
			end
		else
			this[k] = v
		end
	end
end
table.copy = function(list)
	local out = {}
	for k, v in next, list do
		out[k] = (type(v) == "table" and table.copy(v) or v)
	end
	return out
end
table.list = function(tbl, sep, f, i, j)
	local out = {}

	sep = sep or ""

	i, j = (i or 1), (j or #tbl)

	local counter = 1
	for k, v in next, tbl do
		if type(k) ~= "number" or (k >= i and k <= j) then
			if f then
				out[counter] = f(k, v)
			else
				out[counter] = tostring(v)
			end
			counter = counter + 1
		end
	end

	return table.concat(out, sep)
end