--------------------------------------
--	Author: Tenjou
-- 	Poisonga II
-- 	Poisons enemies and gradually reduces their HP.
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
	
	--Base "tic."  Power may need more research.
	power = 10;
	tictime = 3;
	
	--Duration, including resistance.  Unconfirmed.
	duration = 30 * spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_POISONRES)) then
		if (duration >= 15) then --Do it!
			--Try to erase a weaker poison.
			poison = target:getStatusEffect(EFFECT_POISON)
			if (poison ~= nil) then
				if (poison:getPower() < power) then
					target:removeStatusType(EFFECT_POISON);	
					target:addStatusEffect(EFFECT_POISON,power,tictime,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_POISON,power,tictime,duration);
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
	
	target:updateEnmity(caster,320,1);
	final = EFFECT_POISON;
	return final;
end;