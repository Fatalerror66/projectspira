-----------------------------------
--	Author: Tenjou
--  weight
--	Lowers movement speed and evasion.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:subtractMod(MOD_MOVE,effect:getPower());
	effect:subtractMod(MOD_EVA,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:addMod(MOD_MOVE,effect:getPower());
	effect:addMod(MOD_EVA,effect:getPower());
end;]]--