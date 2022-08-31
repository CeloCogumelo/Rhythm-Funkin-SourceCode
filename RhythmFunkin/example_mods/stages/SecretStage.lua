function onCreate()
	makeAnimatedLuaSprite('DJBackground', 'Secret/DJBackground', -200, -600);
	addAnimationByPrefix('DJBackground', 'spinfan', 'DJBackground', 16, true);
	setLuaSpriteScrollFactor('DJBackground', 1, 1);
	scaleObject('DJBackground', 1.1, 1.1);
	addLuaSprite('DJBackground', false)

	doTweenZoom('camerazoom', 'camGame', 0.5, 0.001, 'linear');
	setProperty("defaultCamZoom",0.5)

	setProperty('showRating', false)
	setProperty('showCombo', false)
	setProperty('skipCountdown', true)

	makeLuaSprite('Warning', 'Secret/AntiPiracy', -450, -550);
	addLuaSprite('Warning', true)
	scaleObject('Warning', 2.2, 2.2);
	setLuaSpriteScrollFactor('Warning', 1, 1);
	doTweenAlpha('Warning.alpha', 'Warning', 0, 0.001, 'linear');
end

function onCreatePost()
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end
	setPropertyFromGroup('strumLineNotes', 4, 'scale.x', 0.75)
	setPropertyFromGroup('strumLineNotes', 4, 'scale.y', 0.75)
	setPropertyFromGroup('strumLineNotes', 5, 'scale.x', 0.75)
	setPropertyFromGroup('strumLineNotes', 5, 'scale.y', 0.75)
	setPropertyFromGroup('strumLineNotes', 6, 'scale.x', 0.75)
	setPropertyFromGroup('strumLineNotes', 6, 'scale.y', 0.75)
	setPropertyFromGroup('strumLineNotes', 7, 'scale.x', 0.75)
	setPropertyFromGroup('strumLineNotes', 7, 'scale.y', 0.75)
	debugPrint(defaultPlayerStrumX)
	if getProperty(middlescroll) == true then
		setPropertyFromGroup('strumLineNotes', 4, 'x', 738)
		setPropertyFromGroup('strumLineNotes', 5, 'x', 844)
		setPropertyFromGroup('strumLineNotes', 6, 'x', 956)
		setPropertyFromGroup('strumLineNotes', 7, 'x', 1068)
	end
end

function onStepHit()
	if curStep == 924 then
		setProperty('boyfriend.visible', false);
		setProperty('dad.visible', false);
		setProperty('gf.visible', false);
		setProperty('DJBackground.visible', false);
		setProperty('camHUD.alpha', 0);
	end
	if curStep == 931 then
		doTweenAlpha('Warning.alpha', 'Warning', 1, 6, 'linear');
	end
end

function onUpdatePost(elapsed)
	setProperty('camZooming', false);
end