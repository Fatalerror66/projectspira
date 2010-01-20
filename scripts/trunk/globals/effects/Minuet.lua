-----------------------------------
--	Author: Tenjou
--  Minuet
--	Raises defense.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_ATT,effect:getPower());
	effect:addMod(MOD_RATT,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_ATT,effect:getPower());
	effect:subtractMod(MOD_RATT,effect:getPower());
end;]]--