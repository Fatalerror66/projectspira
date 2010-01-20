--------------------------------------
--	Author: Tenjou
-- 	Foe Lullaby
-- 	Lulls an enemy to sleep.
--
--	http://wiki.ffxiclopedia.org/wiki/Lullaby
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	--Pull base stats.
	stat = 5; --INT
	diff = (caster:getStat(stat) - target:getStat(stat));
	staff = StaffBonus(caster,spell);
	
	--Duration, including resistance.
	duration = 30;
	
	--Instrument enhancement.
	instrument = caster:getEquip(3);
	GjallarhornIncrDuration = 0;
	MarysHornIncrDuration = 0;
	NursemaidsHarpIncrDuration = 0;
	if (instrument == Gjallarhorn or (instrument == 18341 and isInDynamis(caster))) then
		GjallarhornIncrDuration = 6;
	elseif (instrument == 17366) then --Mary's Horn
		MarysHornIncrDuration = 3;
	elseif (instrument == 17841) then --Nursemaid's Harp
		NursemaidsHarpIncrDuration = 6;
	-- Weapon enhancement
	elseif(caster:getEquip(1) == 19000)then --Carnwenhan increments duration in 20% of the base duration.
		CarnwenhanIncrDuration = duration*0.2;
	end
	
	duration = duration + GjallarhornIncrDuration + MarysHornIncrDuration + NursemaidsHarpIncrDuration + CarnwenhanIncrDuration;
	
	resist = spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_SLEEPRES)) then
		if (resist >= 0.5) then --Do it!
			--Try to erase a weaker sleep or lullaby.
			sleep = target:getStatusEffect(EFFECT_SLEEP);
			lullaby = target:getStatusEffect(EFFECT_LULLABY);
			if (sleep ~= nil) then
				if (sleep:getPower() < 1) then
					target:removeStatusType(EFFECT_SLEEP);	
					target:addStatusEffect(EFFECT_LULLABY,1,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			elseif (lullaby ~= nil) then
				if (lullaby:getPower() < 1) then
					target:removeStatusType(EFFECT_LULLABY);	
					target:addStatusEffect(EFFECT_LULLABY,1,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_LULLABY,1,0,duration);
				if (spell:getCurrTargNum() == 1) then
					spell:setMsg(237);
				else
					spell:setMsg(267);
				end
			end
		else
			if (spell:getCurrTargNum() == 1) then
				spell:setMsg(85);
			else
				spell:setMsg(284);
			end
		end
	else
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(85);
		else
			spell:setMsg(284);
		end
	end
	
	target:updateEnmity(caster,0,240);
	final = EFFECT_LULLABY;
	return final;
end;