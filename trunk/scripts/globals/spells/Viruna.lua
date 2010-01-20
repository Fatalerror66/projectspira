--------------------------------------
--	Author: Tenjou
-- 	Viruna
-- 	Removes virus.
--
--	Can become AoE through Divine Veil.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	if (target:getStatusEffect(EFFECT_VIRUS) ~= nil) then
		target:removeStatusType(EFFECT_VIRUS);
		--Adjust message for multiple targets.
		if (spell:getCurrTargNum() == 1) then
			spell:setMsg(83);
		else
			spell:setMsg(350);
		end 
	else
		spell:setMsg(75);
	end
	
	target:updateEnmity(caster,300,1);
	final = EFFECT_VIRUS;
	return final;
end;