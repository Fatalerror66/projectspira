-----------------------------------
--	Author: ReaperX
--	Firestorm (effect)
--	Gives the weather effect "Hot" or upgrades them to "Heat Wave" if Hot is already present.
--
--	If Stormsurge is active, enhances target's STR.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_STR,effect:getPower());
end;]]--