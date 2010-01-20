-----------------------------------
--	Author: Tenjou
--  Dark Seal
--  Enhances the accuracy of the user's next dark magic spell.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_DARK_SEAL,1,0,60);
	target:updateEnmity(user,1,300);
end;