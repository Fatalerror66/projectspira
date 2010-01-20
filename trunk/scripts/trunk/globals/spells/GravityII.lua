--------------------------------------
--	Author: Tenjou
-- 	Gravity II
-- 	Weighs an enemy down and lowers its movement speed.
--
--	Not available to players.
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
	
	--Power.
	power = 30;
	
	--Duration, including resistance.
	duration = math.random(30,125);
	resist = spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_GRAVITYRES)) then
		if (resist >= 0.5) then --Do it!
			--Try to erase a weaker gravity.
			gravity = target:getStatusEffect(EFFECT_WEIGHT)
			if (gravity ~= nil) then
				if (gravity:getPower() < power) then
					target:removeStatusType(EFFECT_WEIGHT);	
					target:addStatusEffect(EFFECT_WEIGHT,power,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_WEIGHT,power,0,duration);
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
	
	target:updateEnmity(caster,80,1);
	final = EFFECT_WEIGHT;
	return final;
end;