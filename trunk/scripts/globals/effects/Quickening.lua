-----------------------------------
--  Author: atkb
--  Quickening
--  Increases movement speed.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_MOVE,effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_MOVE,effect:getPower());
end;]]--