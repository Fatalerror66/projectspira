-----------------------------------
--	Author: Tenjou
--  Serenade
--	Enhances virus resistance.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_VIRUSRES,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_VIRUSRES,effect:getPower());
end;]]--