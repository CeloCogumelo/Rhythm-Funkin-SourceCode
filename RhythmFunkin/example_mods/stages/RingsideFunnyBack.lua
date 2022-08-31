function onStartCountdown()
	-- background shit
	makeLuaSprite('black', 'RingSide/black', -500, -300);
	setLuaSpriteScrollFactor('black', 0.9, 0.9);

	makeAnimatedLuaSprite('OffOutside','RingSide/RingSideOutsideOff',-400,-660)
	addLuaSprite('OffOutside',true)
	scaleObject('OffOutside', 3.2, 3.2)
	setLuaSpriteScrollFactor('OffOutside', 0.5, 0.8);
	
	makeAnimatedLuaSprite('3Journal','RingSide/3Journal',850,-50)
	addLuaSprite('3Journal',false)
	scaleObject('3Journal', 1.7, 1.7);
	
	makeAnimatedLuaSprite('2Journal','RingSide/2Journal',850,-50)
	addLuaSprite('2Journal',false)
	scaleObject('2Journal', 1.7, 1.7);
	
	makeAnimatedLuaSprite('1Journal','RingSide/1Journal',850,-50)
	addLuaSprite('1Journal',false)
	scaleObject('1Journal', 1.7, 1.7);
		
	makeAnimatedLuaSprite('Spiral','RingSide/Spiral',-300,-1300)
	addLuaSprite('Spiral',false)
	addAnimationByPrefix('Spiral', 'Spiral', 'Circle_Thing', 24, true);	
	
	makeLuaSprite('black','RingSide/black',-900,-400)
	addLuaSprite('black',false)
	setLuaSpriteScrollFactor('black', 0.5, 0.8);
	scaleObject('black', 17, 17);
	
	makeLuaSprite('RhythmArena','RingSide/RhythmArena',-250,-160)
	addLuaSprite('RhythmArena',false)
	setLuaSpriteScrollFactor('RhythmArena', 0.5, 0.8)
	scaleObject('RhythmArena', 1, 1);
	
	makeAnimatedLuaSprite('Menjump','RingSide/Menjump',-165,427)
	addLuaSprite('Menjump',true)
	setLuaSpriteScrollFactor('Menjump', 0.5, 0.8)
	addAnimationByPrefix('Menjump', 'notdo', 'dam', 24, false)
	addAnimationByPrefix('Menjump', 'ye', 'Jumpin', 24, false);
	
	makeAnimatedLuaSprite('Outside','RingSide/RingSide Outside',-430,-680)
	addLuaSprite('Outside',true)
	scaleObject('Outside', 1.07, 1.07)
	setLuaSpriteScrollFactor('Outside', 0.5, 0.8);
	
	makeLuaSprite('realblack','realblack',-900,-400)
	addLuaSprite('realblack',true)
	setLuaSpriteScrollFactor('realblack', 0.5, 0.8);
	scaleObject('realblack', 17, 17);
	
	doTweenZoom('boyfriend', 'camGame', 0.5, 0.001, 'linear');
	
	setProperty('camHUD.alpha', 0);
	
	setProperty('OffOutside.visible', false);
	setProperty('2Journal.visible', true);
	setProperty('3Journal.visible', true);
	
	doTweenAlpha('realblack.alpha', 'realblack', 0, 0.001, 'linear');	

	setProperty('timeBar.color',getColorFromHex('ef3131'))
end

function onStepHit()
	if curStep == 25 then
		addAnimationByPrefix('Outside', 'RingSide Outside', 'Bouncy', 24, true);	
	end
	if curStep == 43 then
		doTweenAlpha('Outside.alpha', 'Outside', 0, 1.5, 'linear');
		doTweenZoom('boyfriend', 'camGame', 0.95, 2.3, 'quadIn');
	end
	if curStep == 89 then
		setProperty('camHUD.alpha', 1);
		setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 4, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 5, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 6, 'alpha', 0)
		setPropertyFromGroup('strumLineNotes', 7, 'alpha', 0)
		setProperty('2Journal.visible', false);
		setProperty('3Journal.visible', false);
	end
	if curStep == 137 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 149 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 153 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 169 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 181 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 185 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 265 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 277 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 281 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 297 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 309 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 313 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 361 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 373 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 377 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 409 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 421 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 425 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 445 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 457 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		--here is gonna happen the first jounal
		addAnimationByPrefix('1Journal', '1Journal', 'show', 24, true);
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
		setProperty('boyfriend.visible', false);
		setProperty('gf.visible', false);
		setProperty('dad.visible', false);
		setProperty('Spiral.visible', false);
		setProperty('camHUD.alpha', 0);
	end
	if curStep == 473 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
		setProperty('1Journal.visible', false);
		setProperty('boyfriend.visible', true);
		setProperty('gf.visible', true);
		setProperty('dad.visible', true);
		setProperty('Spiral.visible', true);
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
		setProperty('camHUD.alpha', 1);
	end
	if curStep == 485 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
		setProperty('2Journal.visible', true);
	end
	if curStep == 489 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 505 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 517 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 521 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 525 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 537 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		--here is gonna happen the second jounal
		addAnimationByPrefix('2Journal', '2Journal', '2show', 24, true);
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
		setProperty('boyfriend.visible', false);
		setProperty('gf.visible', false);
		setProperty('dad.visible', false);
		setProperty('Spiral.visible', false);
		setProperty('camHUD.alpha', 0);
	end
	if curStep == 553 then
		setProperty('boyfriend.visible', true);
		setProperty('gf.visible', true);
		setProperty('dad.visible', true);
		setProperty('2Journal.visible', false);
		setProperty('Spiral.visible', true);
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
		setProperty('camHUD.alpha', 1);
	end
	if curStep == 665 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 677 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 677 then
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 689 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 689 then
		objectPlayAnimation('Menjump', 'ye', true);
	end
	if curStep == 701 then
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
	end
	if curStep == 701 then
		objectPlayAnimation('Menjump', 'ye', true);
		setProperty('3Journal.visible', true);
	end
	if curStep == 713 then
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.0001, 'linear');
		--here is gonna happen the last journal
		addAnimationByPrefix('3Journal', '3Journal', '3show', 24, true);
		setProperty('RhythmArena.visible', false);
		setProperty('black.visible', false);
		setProperty('boyfriend.visible', false);
		setProperty('gf.visible', false);
		setProperty('dad.visible', false);
		setProperty('Spiral.visible', false);
		setProperty('camHUD.alpha', 0);
	end
	if curStep == 729 then
		--outside
		setProperty('Menjump.visible', false);
		setProperty('OffOutside.visible', true);
		setProperty('3Journal.visible', false);
		doTweenZoom('boyfriend', 'camGame', 0.5, 0.001, 'linear');

	end
	if curStep == 739 then
		addAnimationByPrefix('OffOutside', 'turnoff', 'LightsOff', 24, false);
		--turn of the lights
	end
	if curStep == 745 then
		doTweenAlpha('realblack.alpha', 'realblack', 1, 0.3, 'linear');
		--turn of the WORLD, basically put a black square and some aplha on it
	end
	if curStep == 682 then
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 694 then
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
	if curStep == 706 then
		setProperty('RhythmArena.visible', true);
		setProperty('black.visible', true);
	end
end