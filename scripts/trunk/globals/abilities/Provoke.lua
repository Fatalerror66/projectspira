-----------------------------------
--	Author: Regiuz
--	Modified By: Randomguy
-- 	Provoke
-- 	Goads an enemy into attacking you
--
--	Proper enmity formula.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  --print(user)
  target:updateEnmity(user, 1800,1);
  ability:setMsg(119);
  ability:setResult(target);
end;