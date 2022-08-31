local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
function onStartCountdown()
if not allowCountdown and isStoryMode and not startedFirstDialogue then
setProperty('inCutscene', true);
runTimer('startDialogue', 0.8);
startedFirstDialogue = true;
return Function_Stop;
end
return Function_Continue;
end

function onEndSong()
if not allowCountdown and isStoryMode and not startedEndDialogue then
setProperty('inCutscene', true);
runTimer('startDialogueEnd', 0.8);
startedEndDialogue = true;
return Function_Stop;
end
return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'startDialogue' then
startDialogue('dialogue', 'breakfast');
elseif tag == 'startDialogueEnd' then
startDialogue('dialogueEnd', 'breakfast');
end
end

function onCreate()
	doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'linear');

	makeAnimatedLuaSprite('Spiral','RingSide/Spiral',-300,-1300)
	addLuaSprite('Spiral',false)
	addAnimationByPrefix('Spiral', 'Spiral', 'Circle_Thing', 24, true);	

	makeLuaSprite('PracticeRingSideBack','RingSide/PracticeRingSideBack',-250,-160)
	addLuaSprite('PracticeRingSideBack',false)
	setLuaSpriteScrollFactor('PracticeRingSideBack', 0.5, 0.8)
	scaleObject('PracticeRingSideBack', 1, 1);

	makeAnimatedLuaSprite('PracticeMen','RingSide/PracticeMen',570,680)
	addLuaSprite('PracticeMen',true)
	setLuaSpriteScrollFactor('PracticeMen', 0.5, 0.8)
	addAnimationByPrefix('PracticeMen', 'notdo', 'damp', 24, false)
	addAnimationByPrefix('PracticeMen', 'ye', 'Pjump', 24, false);

	setProperty('Spiral.visible', false);

	makeLuaSprite('realblack','realblack',-900,-400)
	addLuaSprite('realblack',true)
	setLuaSpriteScrollFactor('realblack', 0.5, 0.8);
	scaleObject('realblack', 17, 17);

	doTweenAlpha('realblack.alpha', 'realblack', 0, 0.001, 'linear');
end

function onGameOver()
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'TryAgain');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TryAgainEnd');
end

function onStepHit()
	if curStep == 18 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('PracticeMen', 'ye', true);
	end
	if curStep == 31 then
		setProperty('PracticeRingSideBack.visible', false);
		setProperty('Spiral.visible', true);
	end
	if curStep == 36 then
		setProperty('PracticeRingSideBack.visible', true);
		setProperty('Spiral.visible', false);
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'linear');
	end
	if curStep == 53 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('PracticeMen', 'ye', true);
	end
	if curStep == 67 then
		setProperty('PracticeRingSideBack.visible', false);
		setProperty('Spiral.visible', true);
	end
	if curStep == 71 then
		setProperty('PracticeRingSideBack.visible', true);
		setProperty('Spiral.visible', false);
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'linear');
	end
	if curStep == 89 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('PracticeMen', 'ye', true);
	end
	if curStep == 102 then
		setProperty('PracticeRingSideBack.visible', false);
		setProperty('Spiral.visible', true);
	end
	if curStep == 106 then
		setProperty('PracticeRingSideBack.visible', true);
		setProperty('Spiral.visible', false);
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'linear');
	end
	if curStep == 124 then
		doTweenZoom('boyfriend', 'camGame', 0.51, 0.55, 'CincIn');
		objectPlayAnimation('PracticeMen', 'ye', true);
	end
	if curStep == 137 then
		setProperty('PracticeRingSideBack.visible', false);
		setProperty('Spiral.visible', true);
	end
	if curStep == 142 then
		setProperty('PracticeRingSideBack.visible', true);
		setProperty('Spiral.visible', false);
		doTweenZoom('boyfriend', 'camGame', 0.95, 0.001, 'linear');
	end
	if curStep == 149 then
		doTweenAlpha('realblack.alpha', 'realblack', 1, 0.9, 'linear');
	end
end