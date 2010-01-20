-----------------------------------
--	Author: Tenjou
--  Elegy
--	Same as Slow.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_HASTE,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_HASTE,effect:getPower());
end;]]--