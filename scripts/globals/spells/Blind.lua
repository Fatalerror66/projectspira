--------------------------------------
--	Author: Tenjou
-- 	Blind
-- 	Blinds an enemy, lowering its accuracy.
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
	
	--Base power.  May need more research.
	power = math.floor((diff+60)/4);
	if (power < 5) then
		power = 5;
	end
	
	--Duration, including resistance.  Unconfirmed.
	duration = 180 * spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_BLINDRES)) then
		if (duration >= 90) then --Do it!
			--Try to erase a weaker blind.
			blind = target:getStatusEffect(EFFECT_BLIND)
			if (blind ~= nil) then
				if (blind:getPower() < power) then
					target:removeStatusType(EFFECT_BLIND);	
					target:addStatusEffect(EFFECT_BLIND,power,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_BLIND,power,0,duration);
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
	final = EFFECT_BLIND;
	return final;
end;