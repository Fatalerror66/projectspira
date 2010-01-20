-----------------------------------
--  Author: atkb
--  Aggressor
--  Enhances accuracy but impairs evasion.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  user:addStatusEffect(EFFECT_AGGRESSOR,25,0,180);
  ability:setMsg(118);
  target:updateEnmity(user,300,1);
end;