--------------------------------------
--	Author: Tenjou
-- 	Slow II
-- 	Reduces an enemy's attack speed.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	--Pull base stats.
	
	stat = 6; --MND
	diff = (caster:getStat(stat) - target:getStat(stat));
	staff = StaffBonus(caster,spell);
	
	--Power.  Can be adjusted through merits.
	power = math.floor((100/1024)*(240 + diff*1.6))
	if (power > 35) then
		power = 35;
	end
	
	power = power * -1;
	--print("POWER:",power);
	
	--Duration, including resistance.
	duration = 180 * spellResist(caster,target,spell,diff,staff);
	
	if (100*math.random() >= target:getMod(MOD_SLOWRES)) then
		if (duration >= 90) then --Do it!
			--Try to erase a weaker slow or haste.
			slow = target:getStatusEffect(EFFECT_SLOW);
			haste = target:getStatusEffect(EFFECT_HASTE);
			if (slow ~= nil) then
				if (slow:getPower() > power) then
					target:removeStatusType(EFFECT_SLOW);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			elseif (haste ~= nil) then
				if (haste:getPower() < (-1*power)) then
					target:removeStatusType(EFFECT_HASTE);	
					target:addStatusEffect(EFFECT_SLOW,power,0,duration);
					if (spell:getCurrTargNum() == 1) then
						spell:setMsg(237);
					else
						spell:setMsg(267);
					end
				else
					spell:setMsg(75);
				end
			else
				target:addStatusEffect(EFFECT_SLOW,1,0,duration);
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
	final = EFFECT_SLOW;
	return final;
end;