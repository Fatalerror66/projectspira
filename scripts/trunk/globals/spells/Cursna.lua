--------------------------------------
--	Author: Tenjou
-- 	Cursna
-- 	Removes curse.
--
--	Can become AoE through Divine Veil.
--	Can also remove Doom.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	--print();
	
	--Try to remove Doom first.
	if (target:getStatusEffect(EFFECT_DOOM) ~= nil and math.random() >= 0.5) then
		target:removeStatusType(EFFECT_DOOM);
		final = EFFECT_DOOM;
	else
		if (target:getStatusEffect(EFFECT_CURSE) ~= nil) then
			target:removeStatusType(EFFECT_CURSE);
			--Adjust message for multiple targets.
			if (spell:getCurrTargNum() == 1) then
				spell:setMsg(83);
			else
				spell:setMsg(350);
			end 
		else
			spell:setMsg(75);
		end
		final = EFFECT_CURSE;
	end
	
	target:updateEnmity(caster,300,1);
	return final;
end;