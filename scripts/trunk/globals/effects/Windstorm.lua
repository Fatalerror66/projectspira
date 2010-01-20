-----------------------------------
--	Author: ReaperX
--  Windstorm (effect)
--	Gives the weather effect "Wind" or upgrades it to "Gales" if Wind is already present.
--
--	If Stormsurge is active, enhances target's AGI.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_AGI,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_AGI,effect:getPower());
end;]]--