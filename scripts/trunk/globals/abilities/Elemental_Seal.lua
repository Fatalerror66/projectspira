-----------------------------------
--	Author: Tenjou
--  Elemental Seal
--  Enhances the accuracy of the user's next spell.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_ELEMENTAL_SEAL,1,0,60);
	target:updateEnmity(user,1,80);
end;