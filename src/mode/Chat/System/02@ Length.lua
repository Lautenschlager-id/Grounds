	getTextLength = function(line)
		return string.len(string.gsub(line,"<.*>",""))
	end,