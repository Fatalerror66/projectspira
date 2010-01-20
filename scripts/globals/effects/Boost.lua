-----------------------------------
--  Author: atkb
--  Boost
--  Enhances user's next attack.
-----------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
  effect:addMod(MOD_ATTP,effect:getPower());
  effect:addMod(MOD_BOOST_COUNTER,1);
end;

function OnTick(target,effect)
end;

function OnLoseEffect(target,effect)
end;
--[[

  effect:subtractMod(MOD_ATTP,effect:getPower());
  effect:subtractMod(MOD_BOOST_COUNTER,1);
end;]]--