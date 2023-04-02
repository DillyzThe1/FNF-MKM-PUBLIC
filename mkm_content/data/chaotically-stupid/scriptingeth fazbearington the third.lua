function onSongStart()
		setDisplayLength(2, 26)
	end

local goneBack = false
local yeahNot = false
function onBeatHit()
		if curBeat >= 176 and not goneBack then
			goneBack = true
			tweenDisplayLength(-1, -1, 20, 'cubeInOut')
		end
	end

function onCreatePost()
	
	makeLuaSprite("novatos", "bupalphajumpscare", 0, 0)
	setObjectCamera("novatos", "camHUD")
	addLuaSprite("novatos", false)
	setProperty("novatos.alpha", 0.00001)

end

function onUpdatePost()
	if getProperty('songMisses') >= 350 then
		setProperty('novatos.alpha', getProperty('novatos.alpha') + 0.001)
	end
	
	
	if getProperty('novatos.alpha') >= 1 then
	setProperty("health", getProperty("health") - 1)
	end
end

