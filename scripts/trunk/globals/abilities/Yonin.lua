-----------------------------------
--	Author: hyourin
-- 	Yonin
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
target:updateEnmity(user,600,1);
end;