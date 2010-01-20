-----------------------------------
--	Authors: atkb
-- 	Hasso
-- 	Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
  effect:addMod(MOD_ACCP,effect:getPower());
  effect:addMod(MOD_STR,effect:getPower());
  effect:addMod(MOD_HASTE,effect:getPower());
  effect:addMod(MOD_FASTCAST,-50);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_ACCP,effect:getPower());
  effect:subtractMod(MOD_STR,effect:getPower());
  effect:subtractMod(MOD_HASTE,effect:getPower());
  effect:subtractMod(MOD_FASTCAST,-50);
end;]]--