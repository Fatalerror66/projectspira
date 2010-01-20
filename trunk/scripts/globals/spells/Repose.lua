--------------------------------------
--	Author: Tenjou
-- 	Sleep
-- 	Puts an enemy to sleep.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	--Pull base stats.
	skill = DIVINE_MAGIC_SKILL;
	stat = 6; --MND
	diff = (caster:getStat(stat) - target:getStat(stat));
	staff = StaffBonus(caster,spell);
	
	--Duration, including resistance.
	duration = 90 * spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_SLEEPRES)) then
		if (duration >= 45) then --Do it!
			--Try to erase a weaker sleep.
			sleep = target:getStatusEffect(EFFECT_SLEEP)
			if (sleep ~= nil) then
				if (sleep:getPower() < 2) then
					target:removeStatusType(EFFECT_SLEEP);	
					target:addStatusEffect(EFFECT_SLEEP,2,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_SLEEP,2,0,duration);
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
	
	target:updateEnmity(caster,480,480);
	final = EFFECT_SLEEP;
	return final;
end;