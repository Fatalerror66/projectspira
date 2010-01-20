-----------------------------------
--  Author: atkb
--  Sentinel
--  Reduces physical damage taken and increases enmity.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_SENTINEL,effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_SENTINEL,effect:getPower());
end;]]--