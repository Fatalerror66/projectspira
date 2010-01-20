-----------------------------------
--	Author: Tenjou
-- 	Chainspell
-- 	Allows rapid spellcasting.
--
--	Adds the effect for 30 seconds.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,30);
	target:updateEnmity(user,1,0);
end;