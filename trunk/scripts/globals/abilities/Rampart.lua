-----------------------------------
--  Author: atkb
--  Rampart
--  Grants a Magic Shield effect and enhances defense for party members within area of effect.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  -- Defines
  vit = user:getStat(3);
  duration = 30;
  def = vit*2;

  if (user:getEquip(5) == 15078 or user:getEquip(5) == 15251) then
    duration = 45;
  end

  target:addStatusEffect(EFFECT_DEF_UP,def,0,duration);
  target:addStatusEffect(EFFECT_MAGIC_SHIELD,def,0,duration);

  if (isFirstTarget == 1) then
    ability:setMsg(441);
  else
    ability:setMsg(421);
  end

  target:updateEnmity(user,300,1);
end;