-----------------------------------
--	Author: atkb
-- 	Flee
-- 	Increases movement speed.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
  -- Lasts for 30 seconds, or 45 seconds with artifact feet  
  duration = 30;
  
  if (user:getEquip(9) == 14094 or user:getEquip(9) == 15357) then
    duration = 45;
  end

  if (user:getStatusEffect(EFFECT_QUICKENING)) then
    user:removeStatusType(EFFECT_QUICKENING);
  end
  if (user:getStatusEffect(EFFECT_MAZURKA)) then
    user:removeStatusType(EFFECT_MAZURKA);
  end

  user:addStatusEffect(EFFECT_FLEE,50,0,duration);
  ability:setMsg(126);
end;