-----------------------------------
--  Author: atkb
--  Sublimation
--  Gradually creates a storage of MP while reducing your HP.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
  mp = effect:getPower();

  if (target:getEquip(5) == 16140 or target:getEquip(5) == 11477) then
    mp = mp + 1;
  end

  if (target:getEquip(6) == 11307 or target:getEquip(6) == 11308) then
    mp = mp + 1;
  end

  if (target:getHP() > target:getMaxHP()/2) then
    target:removeHP(mp);
    effect:addMod(MOD_SUBLIMATION_POOL,mp);
  else
    if (target:getStatusEffect(EFFECT_SUBLIMATION_ACTIVATE)) then
      target:removeStatusType(EFFECT_SUBLIMATION_ACTIVATE);
      target:addStatusEffect(EFFECT_SUBLIMATION_COMPLETE,effect:getMod(MOD_SUBLIMATION_POOL),0,3600);
    end
  end
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--