-----------------------------------
--	Author: hyourin
-- 	Innin
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
target:updateEnmity(user,60,1);
end;