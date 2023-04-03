function onCreatePost()
	
	makeLuaSprite("novatos", "bupalphajumpscare", 0, 0)
	setObjectCamera("novatos", "camHUD")
	addLuaSprite("novatos", false)
	setProperty("novatos.alpha", 0.00001)

end

function onUpdatePost()
	if getProperty('songMisses') >= 1 then
		setProperty('novatos.alpha', getProperty('novatos.alpha') + 0.0006)
	end
	
	
	if getProperty('novatos.alpha') >= 1 then
	setProperty("health", getProperty("health") - 1)
	end

	if getProperty('novatos.alpha') <= 0 then
		setProperty('novatos.alpha', getProperty('novatos.alpha') == 0)
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if getProperty('songMisses') >= 1 then
		setProperty('novatos.alpha', getProperty('novatos.alpha') - 0.01)
     end
end


