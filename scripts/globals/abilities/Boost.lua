-----------------------------------
--  Author: atkb
--  Boost
--  Enhances user's next attack.
-----------------------------------

require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  boost = 12.5;
  duration = 180;
  if (user:getEquip(7) == 13962 or user:getEquip(7) == 14891) then
    boost = 18.75;
  end

  if (user:getMod(MOD_BOOST_COUNTER) > 12) then
    user:removeStatusType(EFFECT_BOOST);
  end

  user:addStatusEffect(EFFECT_BOOST,boost,0,duration);
  ability:setMsg(116);
  target:updateEnmity(user,300,1);
end;