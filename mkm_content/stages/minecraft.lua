function onCreatePost()
	makeLuaSprite('mc','bgs/a minecraft screenshot from 5 minutes ago',0,0)
	addLuaSprite('mc',false)
	setProperty('mc.antialiasing',true)
	setProperty('mc.scale.x',1.4)
	setProperty('mc.scale.y',1.4)
end

--local realElapsed = 0
function onUpdatePost(elapsed)
	if mustHitSection then
		cameraSetTarget('bf')
	else 
		cameraSetTarget('dad')
	end
end