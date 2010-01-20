-----------------------------------
--	Author: ReaperX
--	Sandstorm (effect)
--	Gives the weather effect "Duststorm" or upgrades it to "Sandstorm" if Duststorm is already present.
--
--	If Stormsurge is active, enhances target's VIT.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_VIT,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_VIT,effect:getPower());
end;]]--