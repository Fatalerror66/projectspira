-----------------------------------
--  Author: atkb
--  Berserk
--  Enhances attacks but weakens defense.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  user:addStatusEffect(EFFECT_BERSERK,25,0,180);
  ability:setMsg(115);
  target:updateEnmity(user,300,1);
end;