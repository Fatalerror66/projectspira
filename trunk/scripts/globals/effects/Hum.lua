-----------------------------------
--	Author: Tenjou
--  Hum
--	Enhances paralyze resistance.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_PARALYZERES,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_PARALYZERES,effect:getPower());
end;]]--