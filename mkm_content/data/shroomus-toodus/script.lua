function onCreate()		
		makeAnimatedLuaSprite("mindblown", "mindblown", 0, 0)
		addAnimationByPrefix("mindblown", "a", "mind blowing", 24, false)
		addOffset("mindblown", "a", 0, 0)
		playAnim("mindblown", "a", true)
		addLuaSprite("mindblown", true)
		setProperty("mindblown.alpha", 0.00005)
	end

local kys = false
function onBeatHit()
		if curBeat >= 784 and not kys then
			kys = true
			addHealth(-1)
			setProperty("mindblown.alpha", 1)
			playAnim("mindblown", "a", true)
	end
end

function onUpdatePost()
	if string.lower(difficultyName) == "hard" and getProperty("mindblown.alpha") > 0.05 then
		setProperty("mindblown.x", getProperty("camFollow.x") - getProperty("mindblown.width")/2)
		setProperty("mindblown.y", getProperty("camFollow.y") - getProperty("mindblown.height")/2)
		
		local scaleee = 1 - getProperty("camGame.zoom")
		setProperty("mindblown.scale.x", 1.05 + scaleee)
		setProperty("mindblown.scale.y", 1.05 + scaleee)
	end
end