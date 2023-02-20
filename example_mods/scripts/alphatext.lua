local modeAlpha = false
local textY = 0

function onCreatePost()
	if string.lower(difficultyName) == "alpha" then 
		modeAlpha = true
		textY = getProperty('healthBarBG.y') + 56
		makeLuaText('alphaTxt',songName .. " - " .. difficultyName .. " | KE 1.5.4 EK", 0, getPropertyFromClass('flixel.FlxG','width')/2, textY)
		setTextSize('alphaTxt',16)
		setTextBorder('alphaTxt',1.25,'0xFF000000')
		addLuaText('alphaTxt')
		setProperty('alphaTxt.x', 10)
		
		setTextSize("scoreTxt", 16)
		setProperty("scoreTxt.y", textY)
		setTextBorder('scoreTxt',1.25,'0xFF000000')
		
		runHaxeCode("PlayState.instance.healthBar.createColoredEmptyBar(0xFFFF0000);")
		runHaxeCode("PlayState.instance.healthBar.updateBar();")
		
		runHaxeCode("PlayState.instance.healthBar.createColoredFilledBar(0xFF66FF33);")
		runHaxeCode("PlayState.instance.healthBar.updateBar();")
	end
end

function onUpdatePost()
	if string.lower(difficultyName) == "alpha" then 
	
		ratingName = "N/A"
		
		local ratingPercent = math.ceil(rating * 10000)/100
		if ratingPercent > 0 then
			if botPlay then
				ratingName = "Botplay"
			else
				local sicks = getProperty('sicks')
				local goods = getProperty('goods')
				local bads = getProperty('bads')
				local shits = getProperty('shits')
				if misses == 0 and bads == 0 and shits == 0 and goods == 0 then 
					ratingName = "(MFC)"
				elseif misses == 0 and bads == 0 and shits == 0 then 
					ratingName = "(GFC)"
				elseif misses == 0 then 
					ratingName = "(FC)"
				elseif misses < 10 then 
					ratingName = "(SDCB)"
				else
					ratingName = "(CLEAR)"
				end
			end
		end
		setProperty("scoreTxt.text", "Score: " .. score .. " | Combo Breaks: " .. misses .. " | Accuracy:" .. ratingPercent .. " % | " .. ratingName)
	end
end