json = dofile--[[require no]]('mods/extra characters/json.lua')

local characters = {}


local allcharacteroffsets = {}

function round(x)
	return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

function startsWith(text,startssWith)
	return string.sub(text,1,string.len(startssWith))==startssWith
end

function LuaCharacterPlayAnim(char,anim,forced)
	forced = forced or false
	for loser,charr in pairs(allcharacteroffsets) do
		if charr[1] == char then
			for k,v in pairs(charr[2]) do
				if v[1] == anim then
					objectPlayAnimation(char, anim, forced)
					setProperty(char..'.offset.x',v[2])
					setProperty(char..'.offset.y',v[3])
				end
			end
		end
	end
end
function addCharacter(name,pathrawjson,noteType,modsFolder,x,y)
	local charJson = json.parse(getTextFromFile('characters/'..pathrawjson..'.json',modsFolder))
	makeAnimatedLuaSprite(name,charJson.image,x,y);
	local offsets = {}
	local hasDance = false
	for idk,anim in pairs(charJson.animations) do
		if anim.anim == 'danceLeft' or anim.anim == 'danceLeft' then hasDance = true end
		table.insert(offsets,{anim.anim,anim.offsets[1],anim.offsets[2]})
		if #anim.indices ~= 0 then
			local realindices = ''
			for i = 1,#anim.indices do
				if i ~=#anim.indices then
					realindices = realindices..tostring(anim.indices[i])..','
				else
					realindices = realindices..tostring(anim.indices[i])
				end
			end
			addAnimationByIndices(name,anim.anim,anim.name,realindices,anim.fps)
		else
			addAnimationByPrefix(name, anim.anim, anim.name, anim.fps, anim.loop)
		end
	end
	local dancenum = 2
	if hasDance then dancenum = 1 end
	local shit = dancenum
	if hasDance then shit = shit / 2 else shit = shit * 2 end
	dancenum = round( math.max(shit,1) )
	
	--                       nameOfCharacter,hasdance,haddanced,notetype, stunned,dancenum
	table.insert(characters,{name,hasDance,false,noteType,false,dancenum})
	table.insert(allcharacteroffsets,{name,offsets})
	if charJson.scale ~= 1 then
		setGraphicSize(name,math.floor(getProperty(name..'.width')*charJson.scale))
	end
	if not hasDance then LuaCharacterPlayAnim(name, 'idle',true) else LuaCharacterPlayAnim(name, 'danceRight',true) end
	setProperty(name..'.antialiasing',not(charJson.no_antialiasing))
	setProperty(name..'.flipX',charJson.flip_x)
	addLuaSprite(name, true);
end

function onCreate()
	for k,v in pairs(characters) do
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == v[4] then
				setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true);
			end
		end
	end
end

local anim1 = {'GettinReadyLeft','GettinReadyRight','LeftyTap','PanLeft'}
local anim2 = {'PanRight','Start','TAAPLEFT','TAAPRIGHT'}
local anim3 = {'TapTapLeft','TapTapRight','bump','RightyTap'}
local anim4 = {'ITHolding','singUP-alt','singUP','HoldingIT'}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	for k,v in pairs(characters) do
        if noteType == v[4]..'-one' then
            for i = 0,3 do
                if i == direction then
					local altAnimm =''
					if altAnim then altAnimm = '-alt' end
					LuaCharacterPlayAnim(v[1], anim1[i+1]..altAnimm,true)
                end
            end
        end
        if noteType == v[4]..'-two' then
            for i = 0,3 do
                if i == direction then
					local altAnimm =''
					if altAnim then altAnimm = '-alt' end
					LuaCharacterPlayAnim(v[1], anim2[i+1]..altAnimm,true)
                end
            end
        end
        if noteType == v[4]..'-three' then
            for i = 0,3 do
                if i == direction then
					local altAnimm =''
					if altAnim then altAnimm = '-alt' end
					LuaCharacterPlayAnim(v[1], anim3[i+1]..altAnimm,true)
                end
            end
        end
        if noteType == v[4]..'-four' then
            for i = 0,3 do
                if i == direction then
					local altAnimm =''
					if altAnim then altAnimm = '-alt' end
					LuaCharacterPlayAnim(v[1], anim4[i+1]..altAnimm,true)
                end
            end
        end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	for k,v in pairs(characters) do
        if noteType == v[4] then
            for i = 0,3 do
                if i == direction then
					local altAnimm =''
					if altAnim then altAnimm = '-alt' end
					LuaCharacterPlayAnim(v[1], anim[i+1]..altAnimm,true)
                end
            end
        end
	end
end

function onUpdate()
	for k,v in pairs(characters) do
		if v[2] then
			if curBeat % 1 == 0 and getProperty(v[1]..'.animation.curAnim.finished') and not v[5] then
				characters[k][3] = not characters[k][3]
				if v[3] then
					LuaCharacterPlayAnim(v[1], 'danceLeft',true)
				else
					LuaCharacterPlayAnim(v[1], 'danceRight',true)
				end
			end
		else
			if  getProperty(v[1]..'.animation.curAnim.finished') and not v[5] then
				LuaCharacterPlayAnim(v[1], 'idle',true)
			end
		end
	end
end
function onStartCountdown()
    runTimer('startTimer',crochet/1000,5)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startTimer' then
		for k,v in pairs(characters) do
			if v[2] then
				if loopsLeft % 1 == 0 and getProperty(v[1]..'.animation.curAnim') ~= nil and not startsWith(getProperty(v[1]..'.animation.curAnim.name'),'sing') and not v[5] then
					characters[k][3] = not characters[k][3]
					if v[3] then
						LuaCharacterPlayAnim(v[1], 'danceLeft',true)
					else
						LuaCharacterPlayAnim(v[1], 'danceRight',true)
					end
				end
			else
				if loopsLeft % v[6] -2 == 0 and getProperty(v[1]..'.animation.curAnim') ~= nil and not startsWith(getProperty(v[1]..'.animation.curAnim.name'),'sing') and not v[5] then
					LuaCharacterPlayAnim(v[1], 'idle',true)
				end
			end
		end
	end
end