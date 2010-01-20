-----------------------------------
--  Author: atkb
--  Rampart
--  Grants a Magic Shield effect and enhances defense for party members within area of effect.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_DEF,effect:getPower());
  effect:addMod(MOD_MDEF,effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_DEF,effect:getPower());
  effect:subtractMod(MOD_MDEF,effect:getPower());
end;]]--