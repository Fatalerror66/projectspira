--------------------------------------
--	Author: Tenjou
-- 	Wind Threnody
-- 	Reduces an enemy's wind resistance.
--
--	http://wiki.ffxiclopedia.org/wiki/Threnody
--------------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
--------------------------------------

--------------------------------------
function OnSpellCast(caster,target,spell)

	-- Defines
	name = EFFECT_THRENODY; --Actually is type, but type is a keyword in LUA.
	tic = 0;
	duration = 60;
	if (caster:getEquip(1) == 19000) then --Carnwenhan extends duration.
		duration = 72;
	end
	
	--Calculate song's power.  Needs more research, only 2 data points right now.
	power = 50;
	
	--Instrument enhancement.
	instrument = caster:getEquip(3);
	if (instrument == Gjallarhorn or (instrument == 18341 and isInDynamis(caster))) then
		power = power + 10;
		duration = duration + 12;
	elseif (instrument == 17347) then --Piccolo
		power = power + 5;
		duration = duration + 6;
	elseif (instrument == 17368) then --Piccolo +1
		power = power + 10;
		duration = duration + 12;
	elseif (instrument == 17842) then --Sorrowful Harp
		power = power + 15;
		duration = duration + 18;
	end
	
	--Encode the element into the threnody's power.
	element = 4; --See effects/Threnody.lua
	power = power + 1000*element;
	
	--Soul voice always doubles the power.
	soulvoice = caster:getStatusEffect(EFFECT_SOUL_VOICE);
	if (soulvoice ~= nil) then
		power = power * 2;
	end
	
	--Try to erase another song.
	basecap = BARD_SONG_LIMIT;
	instrumentcap = BARD_INSTRUMENT_LIMIT;
	songid = spell:getId()+1000; --ID of this specific song.
	curreffect = nil;
	checkeffect = nil;
	
	if (basecap < 1) then 
		basecap = 1;
	elseif (basecap > 31) then 
		basecap = 31; 
	end
	
	if (instrumentcap < basecap) then 
		instrumentcap = basecap + 1;
	elseif (instrumentcap > 32) then
		instrumentcap = 32;
	end
	
	for i = 1368,1469 do --Covers all Bard songs.
		curreffect = target:getStatusEffect(i);
		if (curreffect ~= nil) then --Found a song on the target.
			if (curreffect:getType() == songid) then --The song found is this song; erase it and stop checking.
				target:removeStatusType(songid); --Actual effect.
				target:removeStatusType(name); --Icon.
				do break end
			elseif (curreffect:getPower() == name) then --The song is another threnody; erase it and stop checking.
				target:removeStatusType(songid); --Actual effect.
				target:removeStatusType(name); --Icon.
				do break end
			else
				effector = curreffect:getEffector();
				if (effector == caster) then --Song was cast by this Bard.
					if (checkeffect == nil or checkeffect:getStartTime() < curreffect:getStartTime()) then --This song is (so far) the earliest one cast; store it for a possible erase.
						checkeffect = curreffect;
					end
					basecap = basecap - 1;
					instrumentcap = instrumentcap - 1;
					if (basecap <= 0) then --Base limit reached; check if this song is being cast with an instrument.
						instrument = caster:getEquip(3);
						if (isInstrument(instrument) == true) then --Song is being cast with an instrument.
							if (instrumentcap <= 0) then --Instrument limit reached; stop checking.
								do break end
							end
						else --Song is not being cast with an instrument; stop checking.
							instrumentcap = 0;
							do break end
						end
					end
				end
			end
		end
	end
	
	--Erase checkeffect if needed.
	if (instrumentcap <= 0) then
		target:removeStatusType(checkeffect:getPower()); --Removes icon.
		target:removeStatusType(checkeffect:getType()); --Removes actual effect.
	end

	--Do it!!!
	target:addStatusEffect(name,power,tic,duration); --Add icon.
	target:addStatusEffect(songid,name,tic,duration,FLAG_ERASBLE); --Add effect to track this song.
	songeffect = target:getStatusEffect(songid);
	songeffect:setEffector(caster);
	
	-- Adjust message for multiple targets
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end

	target:updateEnmity(caster,240,100);
	return name;
end;