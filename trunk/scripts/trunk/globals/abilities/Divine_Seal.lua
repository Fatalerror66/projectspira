-----------------------------------
--	Author: ReaperX
--  Divine Seal
--  Enhances the potency of the user's next healing spell.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/spell_definitions");


function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_DIVINE_SEAL,1,0,60);
	target:updateEnmity(user,1,80);
end;