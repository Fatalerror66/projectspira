--------------------------------------
--	Author: Tenjou
-- 	Reraise
-- 	Description of spell.  Usually the same as the help text in-game.
--
--	Some comments about the source of any formulas you may find.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	power = 1;
	spell:setMsg(230);
	
	--Try to refresh duration.
	reraise = target:getStatusEffect(EFFECT_RERAISE);
	if (reraise ~= nil) then
		if (reraise:getPower() <= power) then
			target:removeStatusType(EFFECT_RERAISE);
			target:addStatusEffect(EFFECT_RERAISE,power,0,3600,FLAG_DISPELABLE);
		else 
			spell:setMsg(75);
		end
	else
		target:addStatusEffect(EFFECT_RERAISE,power,0,3600,FLAG_DISPELABLE);
	end
		
	target:updateEnmity(caster,80,1);
	final = EFFECT_RERAISE;
	
	return final;
end;