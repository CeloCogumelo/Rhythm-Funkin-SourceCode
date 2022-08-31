function onCreate()
	-- background shit
	makeLuaSprite('black','RingSide/black',-900,-400)
	addLuaSprite('black',false)
	setLuaSpriteScrollFactor('black', 0.5, 0.8);
	scaleObject('black', 17, 17);
	
	makeLuaSprite('PracticeRingSideBack','RingSide/PracticeRingSideBack',-250,-160)
	addLuaSprite('PracticeRingSideBack',false)
	setLuaSpriteScrollFactor('PracticeRingSideBack', 0.5, 0.8)
	scaleObject('PracticeRingSideBack', 1, 1);
	
	setProperty('timeBar.color',getColorFromHex('ef3131'))
end