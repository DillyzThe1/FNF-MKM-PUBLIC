local creditedPeople = ''

function alphaaaa()
	if string.lower(songName) == "normalized" then 
		return false
	end
	return true
end

local creditsMatch = {
	{'academic failure', 'Composed by Novatos Team'},
	{'bup', 'Composed By Novatos Team & Novatos Team'},
	{'chaotically stupid', 'Composed By Novatos Team & Novatos Team'},
	{'extra screwed', 'Composed By Novatos Team'},
	{'hell shrooms', 'Composed by Novatos Team'},
	{'house', 'Composed By Novatos Team'},
	{'incorrect residence', 'this song had me in tears (and it\'s by Novatos Team)'},
	{'karrd kollision', 'Composed by Novatos Team'},
	{'normalized', 'Composed by DillyzThe1'},
	{'no shrooms', 'Composed By Novatos Team'},
	{'shroomus toodus', 'Original versions by Novatos Team & Novatos Team, Remixed by Novatos Team'},
	{'square', 'Composed by Novatos Team & Novatos Team'},
	{'top 10 great amazing super duper wonderful outstanding saster level music that ever has been heard', 'Composed by Novatos Team'},
	{'tutorial', 'Composed By KawaiSprite, Edited by Novatos Team'},
	{'welcom toad', 'composted by dillyzthe1'},
	{'wrong house', 'Composed by Novatos Team'},
	{'yeah', 'Composed by Novatos Team'},
	{'no way', 'Composed by Novatos Team'}
}

function onCreatePost()
	for i = 1, table.maxn(creditsMatch), 1 do
		local creditsTable = creditsMatch[i]
		if creditsTable[1] == string.lower(songName) then 
			creditedPeople = creditsTable[2]
		end
	end

	makeLuaText('creditsTxt',creditedPeople, 0, getPropertyFromClass('flixel.FlxG','width')/2,getProperty('healthBarBG.y') + 56)
	setTextSize('creditsTxt',16)
	setTextBorder('creditsTxt',1.25,'0xFF000000')
	--setTextAlignment('creditsTxt','center')
	addLuaText('creditsTxt')
	
	setProperty('creditsTxt.x',getPropertyFromClass('flixel.FlxG','width')/2 - getTextWidth('creditsTxt')/2)
	
	if getProperty('curStage') == 'minecraft' then 
		setTextFont('creditsTxt','minecraft')
	end
end

function onEvent(ev, v1, v2)
	if ev == 'Change Credits' then 
		setProperty('creditsTxt.text',v1)
		setProperty('creditsTxt.x',getPropertyFromClass('flixel.FlxG','width')/2 - getTextWidth('creditsTxt')/2)
	end
end

function onUpdatePost()
	if alphaaaa() then 
		setProperty('creditsTxt.x',getPropertyFromClass('flixel.FlxG','width') - getTextWidth('creditsTxt') - 10)
	else
		setProperty('creditsTxt.x',getPropertyFromClass('flixel.FlxG','width')/2 - getTextWidth('creditsTxt')/2)
	end
end