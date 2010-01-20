-----------------------------------
--  Author: atkb
--  Defender
--  Enhances defense but weakens attacks.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  user:addStatusEffect(EFFECT_DEFENDER,25,0,180);
  ability:setMsg(117);
  target:updateEnmity(user,300,1);
end;