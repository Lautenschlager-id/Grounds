	eventMouse = function(n,x,y)
		if mode.click.circle.status then
			if mode.click.info[n].canPlay then
				if math.pythag(400,200,x,y,150) then
					mode.click.info[n].roundClick = mode.click.info[n].roundClick + 1
					tfm.exec.displayParticle(15,math.random(150,650),math.random(100,300),0,0,0,0,n)
				end
			end
		end
	end,