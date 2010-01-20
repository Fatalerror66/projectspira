-----------------------------------
--	Author: ReaperX
--	Rainstorm (effect)
--	Gives the weather effect "Rain" or upgrades it to "Squall" if Rain is already present.
--
--	If Stormsurge is active, enhances target's MND.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MND,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_MND,effect:getPower());
end;]]--