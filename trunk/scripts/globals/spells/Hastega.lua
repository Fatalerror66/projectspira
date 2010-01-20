--------------------------------------
--	Author: Almendro
-- 	Haste
-- 	Haste is a beneficial status effect that increases a character's speed.
--  Benefiting characters experience reduced weapon delay and magic recast timers.
--	http://wiki.ffxiclopedia.org/wiki/Haste_%28Status_Effect%29
--------------------------------------
-- Include
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
--------------------------------------
-- Defines
duration = 90;
    power = 15; -- 15% haste
--------------------------------------
function OnSpellCast(caster,target,spell)
	slow = target:getStatusEffect(EFFECT_SLOW);
	if(slow == nil)then
		target:addStatusEffect(EFFECT_HASTE,power,0,duration,FLAG_DISPELABLE);
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(230);
		else
			spell:setMsg(266);
		end
	else
		if(slow:getPower() < (-1*power))then
			target:removeStatusType(EFFECT_SLOW);
			target:addStatusEffect(EFFECT_HASTE,power,0,duration,FLAG_DISPELABLE);
			if (spell:getCurrTargNum() == 1) then
				spell:setMsg(230);
			else
				spell:setMsg(266);
			end
		else
			spell:setMsg(75);
		end
	end
	target:updateEnmity(caster,300,1);
	final = EFFECT_HASTE;
	return final;
end