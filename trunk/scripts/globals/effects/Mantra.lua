-----------------------------------
--  Author: atkb
--  Mantra
--  Increases the max. HP of party members within area of effect.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_HPP,effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_HPP,effect:getPower());
end;]]--