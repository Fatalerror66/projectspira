-----------------------------------
--	Author: ReaperX
--  Thunderstorm (effect)
--	Gives the weather effect "Thunder" or upgrades it to "Thunderstorms" if Thunder is already present.
--
--	If Stormsurge is active, enhances target's DEX.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_DEX,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_DEX,effect:getPower());
end;]]--