-----------------------------------
--  Author: atkb
--  Aggressor
--  Enhances accuracy but impairs evasion.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_ACC,effect:getPower());
  effect:addMod(MOD_EVA,-effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_ACC,effect:getPower());
  effect:subtractMod(MOD_EVA,-effect:getPower());
end;]]--