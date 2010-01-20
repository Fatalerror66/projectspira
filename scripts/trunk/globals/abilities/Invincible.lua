-----------------------------------
--	Author: Randomguy
-- 	Invincible
-- 	Grants immunity to all physical attacks.
--
--	Also grants a large amount of hate, outlined at kanican.livejournal.com
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();

user:addStatusEffect(EFFECT_INVINCIBLE,1,0,30);
target:updateEnmity(user,7200,1)
end;