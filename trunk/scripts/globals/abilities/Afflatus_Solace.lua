-----------------------------------
--	Author: ReaperX
--  Afflatus Solace
--  Inspires you to draw strength from the healing spells you cast. 
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_AFFLATUS_SOLACE,1,0,3600);
	target:updateEnmity(user,1,80);
end;