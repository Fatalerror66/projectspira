-----------------------------------
--	Author: Tenjou
-- 	Hundred Fists
--	Turns all melee attacks into critical hits.
--
--	Adds the effect for 45 seconds.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	--print();
	user:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,45);
	target:updateEnmity(user,300,1);
end;