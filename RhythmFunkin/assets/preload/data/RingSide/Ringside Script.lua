function onGameOver()
		setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'TryAgain');
		setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TryAgainEnd');
end

function onEndSong()
	if getProperty('ratingPercent') >= 1 and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('PERFECT')
		return Function_Stop;
	else if getProperty('ratingPercent') >= 0.80 and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('SuperB')
		return Function_Stop;
	else if getProperty('ratingPercent') >= 0.70 and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('JustOk')
		return Function_Stop;
	else if getProperty('ratingPercent') >= 0.60 and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('Ok')
		return Function_Stop;
	else if getProperty('ratingPercent') >= 0 and not seenDaEnd then
		makeAnimatedLuaSprite('dedtryagain','RingSide/dedtryagain',448,97)
		addLuaSprite('dedtryagain',true)
		addAnimationByPrefix('dedtryagain', 'dedtryagain', 'thelost', 24, true);
		setLuaSpriteScrollFactor('dedtryagain', 0.5, 0.8);

		doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'quadIn');
		playSound('yousuck', 0.5);
		runTimer('timetodie', 15, 0);	

		setProperty('camGame.visible',true)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		return Function_Stop;
	else
		return Function_Continue;
	end
end
end
end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'timetodie' then
		setProperty('health', -1);
		setProperty('camGame.visible',true);
		setProperty('camHUD.visible',true);
	end
end