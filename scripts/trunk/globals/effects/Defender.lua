-----------------------------------
--  Author: atkb
--  Defender
--  Enhances defense but weakens attacks.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_DEFP,effect:getPower());
  effect:addMod(MOD_ATTP,-effect:getPower());
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_DEFP,effect:getPower());
  effect:subtractMod(MOD_ATTP,-effect:getPower());
end;]]--