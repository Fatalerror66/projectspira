-----------------------------------
--  Author: atkb
--  Mantra
--  Increases the max. HP of party members within area of effect.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  if (target:getStatusEffect(EFFECT_MAX_HP_UP)) then
    target:removeStatusType(EFFECT_MAX_HP_UP);
  end

  target:addStatusEffect(EFFECT_MAX_HP_UP,4,0,180);

  if (isFirstTarget == 1) then
    ability:setMsg(441);
  else
    ability:setMsg(421);
  end

  target:updateEnmity(user,300,1);
end;