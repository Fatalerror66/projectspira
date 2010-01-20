-----------------------------------
--	Author: ReaperX
--	Hailstorm (effect)
--	Gives the weather effect "Snow" or upgrades it to "Blizzard" if Snow is already present.
--
--	If Stormsurge is active, enhances target's INT.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_INT,effect:getPower());
end;]]--