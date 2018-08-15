ui.banner = function(image, aX, aY, n, time)
	time = time or 5
	aX = aX or 100
	aY = aY or 100
	
	local img = tfm.exec.addImage(image .. ".png", "&0", aX, aY, n)
	system.newTimer(function()
		tfm.exec.removeImage(img)
	end, time * 1000, false)
end