function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'SkillStarNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HURTNOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function onCreatePost()
    makeAnimatedLuaSprite('littlestar', 'Skill Star', 1080, 520)
    addLuaSprite('littlestar', true)
    setObjectCamera('littlestar', 'hud')
    addAnimationByPrefix('littlestar', 'no skill', 'No Skill', 24, true)
    addAnimationByPrefix('littlestar', 'gettingskill', 'Skill Issue', 24, true)
    addAnimationByPrefix('littlestar', 'skill', 'Got Skill', 24, false)
    scaleObject('littlestar', 0.8, 0.8);
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'SkillStarNote' then
        if getPropertyFromGroup('notes', id, 'rating') == 'sick' then
            objectPlayAnimation('littlestar', 'skill', true)
            setProperty('littlestar.x',1070)
            setProperty('littlestar.y',470)
            playSound('skillstar', 1)
            addScore(500)
        end
        if getPropertyFromGroup('notes', id, 'rating') == 'good' then
            objectPlayAnimation('littlestar', 'no skill', false)
            setProperty('littlestar.x',1080)
            setProperty('littlestar.y',500)
        end
        if getPropertyFromGroup('notes', id, 'rating') == 'bad' then
            objectPlayAnimation('littlestar', 'no skill', false)
            setProperty('littlestar.x',1080)
            setProperty('littlestar.y',500)
        end
        if getPropertyFromGroup('notes', id, 'rating') == 'shit' then
            objectPlayAnimation('littlestar', 'no skill', false)
            setProperty('littlestar.x',1080)
            setProperty('littlestar.y',500)
        end
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == 'SkillStarNote' then
        objectPlayAnimation('littlestar', 'no skill', false)
        setProperty('littlestar.x',1080)
        setProperty('littlestar.y',500)
    end
end

function onEvent(name, value1, value2)
    if name == 'SkillStartMoment' then
        objectPlayAnimation('littlestar', 'gettingskill', true)
        setProperty('littlestar.x',1071.5)
        setProperty('littlestar.y',491)
    end
end