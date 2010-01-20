-----------------------------------
--	Author: Tenjou
-- 	Chainspell
-- 	Allows rapid spellcasting.
--
--	Adds the effect for 60 seconds.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	target:addStatusEffect(EFFECT_CHAINSPELL,1,0,60);
	target:updateEnmity(user,1,0);
end;