-----------------------------------
--	Author: Tenjou
--  Dirge
--	Lowers enmity.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_ENMITY,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_ENMITY,effect:getPower());
end;]]--