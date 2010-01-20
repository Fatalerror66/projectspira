-------------------------
--  Author: atkb
--  Boost
--  Releases Chi to attack an enemy.
-------------------------
require("/scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  mnd = user:getStat(6);
  boost = user:getMod(MOD_BOOST_COUNTER);

  if (hands == 13962 or hands == 14891) then
    random = math.random((0.75),(1.10));
  else
    random = math.random((0.25),(0.60));
  end

  chi = mnd * (boost * random + 1);

  if (user:getStatusEffect(EFFECT_BOOST)) then
    user:removeStatusType(EFFECT_BOOST);
  end

  ability:setMsg(110);
  ability:setResult(chi);
  target:removeHP(chi);
end;