-----------------------------------
--	Author: Tenjou
--  Rhapsody
--	Enhances confusion resistance.
--
--	Based on power.  Assuming this means charm too.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_CHARMRES,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_CHARMRES,effect:getPower());
end;]]--