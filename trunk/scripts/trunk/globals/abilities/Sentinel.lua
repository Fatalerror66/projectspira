-----------------------------------
--  Author: atkb
--  Sentinel
--  Reduces physical damage taken and increases enmity.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  user:addStatusEffect(EFFECT_SENTINEL,90,0,30);
  ability:setMsg(319);
  target:updateEnmity(user,1800,1);
end;