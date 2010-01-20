-----------------------------------
--	Author: atkb
--  Mazurka
--  Increases the Movement Speed of party members within the area of effect.
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