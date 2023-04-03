function onCreatePost()
	if getProperty('boyfriend.curCharacter') == 'kandice kid' then
		setProperty('boyfriend.flipX',false)
	end 
	if getProperty('dad.curCharacter') == 'kandice kid' then
		flipAnims = true
		setProperty('dad.flipX',false)
	end 
end

local flipAnims = false
function opponentNoteHit(noteIndex,noteData,noteType,isSustainNote)
	if flipAnims and getProperty('dad.curCharacter') == 'singLEFT' then 
		characterPlayAnim('dad','singRIGHT',true)
	elseif flipAnims and getProperty('dad.curCharacter') == 'singRIGHT' then 
		characterPlayAnim('dad','singLEFT',true)
	end
end