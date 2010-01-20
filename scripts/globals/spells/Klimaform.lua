--------------------------------------
--	Author: ReaperX
--  Klimaform
--	Increases the magic accuracy for spells of the same element as the current weather.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	
	duration = 600;
		
	target:addStatusEffect(EFFECT_KLIMAFORM,1,0,duration);
		--Adjust message for multiple targets.
	if (spell:getCurrTargNum() == 1) then
		spell:setMsg(230);
	else
		spell:setMsg(266);
	end
		
	target:updateEnmity(caster,300,1);
	final = EFFECT_KLIMAFORM;
	return final;
end;