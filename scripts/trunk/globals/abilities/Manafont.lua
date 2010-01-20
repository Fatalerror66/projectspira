-----------------------------------
--	Author: Tenjou
-- 	Manafont
-- 	Allows spellcasting without using MP.
--
--	Adds the effect for 60 seconds.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

user:addStatusEffect(EFFECT_MANAFONT,1,0,60);
end;