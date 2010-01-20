-----------------------------------
--	Author: atkb
-- 	Chocobo Jig
-- 	Increases movement speed.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  -- Lasts for 120 seconds
  duration = 120;

  -- Bonuses (25 seconds each)
  bonus = 25;
  legs = user:getEquip(6);
  feet = user:getEquip(7);
  -- Relic Legs (NQ/HQ)
  if (legs == 16360 or legs == 16361) then
    duration = duration + bonus;
  end
  -- Artifact Feet (NQ/HQ) Why are there 2 different IDs?
  if (feet == 15746 or feet == 15747 or feet == 11393 or feet == 11394) then
    duration = duration + bonus;
  end

  if (user:getStatusEffect(EFFECT_QUICKENING)) then
    user:removeStatusType(EFFECT_QUICKENING);
  end

  -- No effect if Flee or Mazurka is active
  if (user:getStatusEffect(EFFECT_FLEE) or user:getStatusEffect(EFFECT_MAZURKA)) then
    ability:setMsg(323);
  else
    user:addStatusEffect(EFFECT_QUICKENING,25,0,duration);
    ability:setMsg(126);
  end
end;