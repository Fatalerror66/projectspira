-----------------------------------
--  Author: atkb
--  Warcry
--  Enhances attacks of party members within area of effect.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_ATT,effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_ATT,effect:getPower());
end;]]--