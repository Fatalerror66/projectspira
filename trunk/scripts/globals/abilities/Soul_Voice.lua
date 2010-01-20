-----------------------------------
--	Author: Tenjou
-- 	Soul Voice
-- 	Enhances the effect of songs.
--
--	Actually doubles the effect of songs.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
	target:addStatusEffect(EFFECT_SOUL_VOICE,1,0,180);
	target:updateEnmity(user,0,1);
end;