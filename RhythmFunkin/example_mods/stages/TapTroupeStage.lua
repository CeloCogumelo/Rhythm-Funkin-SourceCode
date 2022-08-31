dofile('mods/extra characters/extraCharacters.lua')

local originy = 0

local finger = false

function onCreatePost()
	-- background shit
    addCharacter('TF','TapMan','tappernote',false,1250,150)
    addCharacter('TF1','TapMan','tappernote',false,550,150)
    addCharacter('TF2','TapMan','tappernote',false,-170,150)

	makeLuaSprite('WhiteSquare', 'TapTroupe/WhiteSquare', -800, -500);
	setLuaSpriteScrollFactor('WhiteSquare', 1, 1);
	scaleObject('WhiteSquare', 8, 8);
	addLuaSprite('WhiteSquare', false);

	makeLuaSprite('TapForeGround', 'TapTroupe/TapForeGround', -2100, 720);
	setLuaSpriteScrollFactor('TapForeGround', 1, 1);
	addLuaSprite('TapForeGround', true);
	scaleObject('TapForeGround', 1.3, 1.3);

	makeLuaSprite('TapUpGround', 'TapTroupe/TapUpGround', -700, -400);
	setLuaSpriteScrollFactor('TapUpGround', 1, 1);
	addLuaSprite('TapUpGround', true);
	scaleObject('TapUpGround', 2, 2);

	makeAnimatedLuaSprite("TapBF", 'TapTroupe/TapBF', 220, 870)
	addAnimationByPrefix("TapBF", 'idlebf', 'BFIdle', 24, true)
	addAnimationByPrefix("TapBF", 'missbf', 'BFMiss', 24, false)
	addAnimationByPrefix("TapBF", 'BFOK', 'BFOK', 24, false)
	addAnimationByPrefix("TapBF", 'BFFingerUp', 'BFFingerUp', 24, false)
	addLuaSprite('TapBF', true);
	scaleObject('TapBF', 1.4, 1.4);
	setLuaSpriteScrollFactor('TapBF', 1, 1);
	originy = getProperty('TapBF.y')

	makeAnimatedLuaSprite("Tapper3", 'TapTroupe/TheTwoOther', 0, 710)
	addAnimationByPrefix("Tapper3", 'Idle', 'Idle', 24, true)
	addAnimationByPrefix("Tapper3", 'OK', 'OK', 24, false)
	addAnimationByPrefix("Tapper3", 'PoseIdk', 'PoseIdk', 24, false)
	addLuaSprite('Tapper3', true);
	scaleObject('Tapper3', 1.4, 1.4);
	setLuaSpriteScrollFactor('Tapper3', 1, 1);
	originytap3 = getProperty('Tapper3.y')

	makeAnimatedLuaSprite("Tapper2", 'TapTroupe/TheTwoOther', -230, 660)
	addAnimationByPrefix("Tapper2", 'Idle', 'Idle', 24, true)
	addAnimationByPrefix("Tapper2", 'OK', 'OK', 24, false)
	addAnimationByPrefix("Tapper2", 'PoseIdk', 'PoseIdk', 24, false)
	addLuaSprite('Tapper2', true);
	scaleObject('Tapper2', 1.5, 1.5);
	setLuaSpriteScrollFactor('Tapper2', 1, 1);
	originytap2 = getProperty('Tapper2.y')
	
	makeAnimatedLuaSprite("FirstTapper", 'TapTroupe/FirstTapper', -500, 610)
	addAnimationByPrefix("FirstTapper", 'Idle', 'Idle', 24, true)
	addAnimationByPrefix("FirstTapper", 'OK', 'OK', 24, false)
	addAnimationByPrefix("FirstTapper", 'CONFETTI', 'CONFETTI', 24, false)
	addAnimationByPrefix("FirstTapper", 'PoseIdk', 'PoseIdk', 24, false)
	addLuaSprite('FirstTapper', true);
	scaleObject('FirstTapper', 1.6, 1.6);
	setLuaSpriteScrollFactor('FirstTapper', 1, 1);
	originytap1 = getProperty('FirstTapper.y')

	makeAnimatedLuaSprite("Confetti", 'TapTroupe/Confetti', 100, 400)
	addAnimationByPrefix("Confetti", 'NahConfetti', 'NahConfetti', 40, true)
	addAnimationByPrefix("Confetti", 'YESConfetti', 'Confetti', 40, false)
	addLuaSprite('Confetti', true);
	setProperty('Confetti.visible', false);
	scaleObject('Confetti', 3.5, 3.5);

	makeLuaSprite('ZoomOut', 'TapTroupe/ZoomOut', -6000, -10250);
	scaleObject('ZoomOut', 1.8, 1.8);
	doTweenAlpha('ZoomOut.alpha', 'ZoomOut', 0, 0.001, 'linear');
	addLuaSprite('ZoomOut', true);

	makeLuaSprite('realblack','realblack',-6000,-6000)
	addLuaSprite('realblack',true)
	setLuaSpriteScrollFactor('realblack', 0.1, 0.5);
	scaleObject('realblack', 17, 17);
	doTweenAlpha('realblack.alpha', 'realblack', 0, 0.001, 'linear');

	setPropertyFromGroup('strumLineNotes', 4, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 5, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 6, 'alpha', 0)
	setPropertyFromGroup('strumLineNotes', 7, 'alpha', 0)

	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end

	setProperty("healthBar.x", 600) 
	setProperty("scoreTxt.x", 250) 
	setProperty("scoreTxt.y", 685) 

	setProperty('timeBar.color',getColorFromHex('7f7f7f'))
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if finger == false then
		setProperty('TapBF.y',originy+40)
		doTweenY('wifjwif','TapBF',originy,0.10,'linear')
	end
	if finger == true then
		setProperty('TapBF.y',705+40)
		doTweenY('wifjwif','TapBF',705,0.10,'linear')
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'returnback' then
		finger = false
		setProperty('TapBF.x', 220)
		setProperty('TapBF.y', 870)
		setProperty('FirstTapper.y', 610)
		setProperty('Tapper2.y', 660)
		setProperty('Tapper3.y', 710)
		objectPlayAnimation('TapBF', 'idlebf', false)
		objectPlayAnimation('FirstTapper', 'Idle', false)
		objectPlayAnimation('Tapper2', 'Idle', false)
		objectPlayAnimation('Tapper3', 'Idle', false)
		doTweenX('madjnap', 'FirstTapper', -500, 0.001, 'linear')
		doTweenX('afueihp', 'Tapper2', -230, 0.001, 'linear')
		doTweenX('pafp', 'Tapper3', 0, 0.001, 'linear')
	end
end

function onEvent(name, value1, value2)
    if name == "bounce" then
        setProperty('TapBF.y',originy+40)
        doTweenY('wifjwif','TapBF',originy,0.10,'linear')
		setProperty('FirstTapper.y',originytap1+40)
        doTweenY('wifjwifa','FirstTapper',originytap1,0.10,'linear')
		setProperty('Tapper2.y',originytap2+40)
        doTweenY('wifjwifb','Tapper2',originytap2,0.10,'linear')
		setProperty('Tapper3.y',originytap3+40)
        doTweenY('wifjwifc','Tapper3',originytap3,0.10,'linear')
    end
	if name == "FingerUp" then
		finger = true
		objectPlayAnimation('TapBF', 'BFFingerUp', true)
		objectPlayAnimation('FirstTapper', 'PoseIdk', false)
		objectPlayAnimation('Tapper2', 'PoseIdk', false)
		objectPlayAnimation('Tapper3', 'PoseIdk', false)
		setProperty('FirstTapper.x', -660)
		setProperty('FirstTapper.y', 425)
		setProperty('Tapper2.x', -385)
		setProperty('Tapper2.y', 480)
		setProperty('Tapper3.x', -155)
		setProperty('Tapper3.y', 530)
		setProperty('TapBF.x', 130)
		setProperty('TapBF.y', 705)
		runTimer('returnback', 1.7, 0);
	end
	if name == "start" then
        setProperty('TapBF.y',originy+40)
        doTweenY('wifjwif','TapBF',originy,0.10,'linear')
		setProperty('FirstTapper.y',originytap1+40)
        doTweenY('wifjwifa','FirstTapper',originytap1,0.10,'linear')
		setProperty('Tapper2.y',originytap2+40)
        doTweenY('wifjwifb','Tapper2',originytap2,0.10,'linear')
		setProperty('Tapper3.y',originytap3+40)
        doTweenY('wifjwifc','Tapper3',originytap3,0.10,'linear')
    end
	if name == "tapbounce" then
		if finger == false then
			setProperty('FirstTapper.y',originytap1+40)
        	doTweenY('wifjwifa','FirstTapper',originytap1,0.10,'linear')
			setProperty('Tapper2.y',originytap2+40)
        	doTweenY('wifjwifb','Tapper2',originytap2,0.10,'linear')
			setProperty('Tapper3.y',originytap3+40)
       		doTweenY('wifjwifc','Tapper3',originytap3,0.10,'linear')
		end
		if finger == true then
			setProperty('FirstTapper.y',425+40)
			doTweenY('wifjwifa','FirstTapper',425,0.10,'linear')
			setProperty('Tapper2.y',480+40)
			doTweenY('wifjwifb','Tapper2',480,0.10,'linear')
			setProperty('Tapper3.y',530+40)
			doTweenY('wifjwifc','Tapper3',530,0.10,'linear')
		end
    end
	if name == "OK!" then
		objectPlayAnimation('TapBF', 'BFOK', true)
		objectPlayAnimation('FirstTapper', 'OK', false)
		objectPlayAnimation('Tapper2', 'OK', false)
		objectPlayAnimation('Tapper3', 'OK', false)
		doTweenX('madjnqvj', 'FirstTapper', -503, 0.001, 'linear')
		doTweenX('madjiohf', 'Tapper2', -233, 0.001, 'linear')
		doTweenX('svby0', 'Tapper3', -3, 0.001, 'linear')
		runTimer('returnback', 1.3, 0);
	end
	if name == "Confetti" then
		setProperty('Confetti.visible', true);
		objectPlayAnimation('Confetti', 'YESConfetti', true)
	end
	if name == "CoolConfetti" then
		objectPlayAnimation('TapBF', 'BFOK', true)
		objectPlayAnimation("FirstTapper", 'CONFETTI', false)
		objectPlayAnimation('Tapper2', 'OK', false)
		objectPlayAnimation('Tapper3', 'OK', false)
		setProperty('FirstTapper.x', -570)
		doTweenX('madjiohf', 'Tapper2', -233, 0.001, 'linear')
		doTweenX('svby0', 'Tapper3', -3, 0.001, 'linear')
		runTimer('returnback', 2.2, 0);
	end
end

function onUpdatePost(elapsed)
	setProperty('camZooming', false);
end

function onStepHit()
	if curStep == 943 then
		doTweenAlpha('ZoomOut.alpha', 'ZoomOut', 1, 0.3, 'linear');
		doTweenZoom('zoomthing', 'camGame', 0.1, 2, 'linear');
		triggerEvent('Camera Follow Pos', 820, -1100);
		setProperty('camHUD.alpha', 0);
	end
	if curStep == 980 then
		doTweenAlpha('realblack.alpha', 'realblack', 1, 0.3, 'linear');
	end
	if curStep == 983 then
		triggerEvent('Camera Follow Pos', nil, nil);
		doTweenZoom('zoomthing', 'camGame', 0.5, 0.01, 'linear');
	end
end