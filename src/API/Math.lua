math.isNegative = function(x, iN, iP)
	if x < 0 then
		if iN then return iN end
	else
		if iP then return iP end
	end
	return x
end
math.percent = function(x, y, v)
	v = v or 100
	local m = x / y * v
	return math.min(m, v)
end
math.pythag = function(x1, y1, x2, y2, range)
	return (x1 - x2) ^ 2 + (y1 - y2) ^ 2 <= (range ^ 2)
end
math.setLim = function(value, min, max)
	return value < min and min or value > max and max or value -- math.max(min,math.min(max,value))
end
math.rotatePoint = function(x, y, angle)
	angle = angle % 360
	if angle < 0 then
		angle = angle + 360
	end

	angle = math.rad(angle)
	local cos, sin = math.cos(angle), math.sin(angle)
	return (x * cos - y * sin), (y * cos + x * sin)
end
math.round = function(x)
	return math.floor(x + .5)
end