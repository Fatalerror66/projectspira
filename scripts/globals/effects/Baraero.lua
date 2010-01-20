-----------------------------------
--	Author: Tenjou
--  Baraero (effect)
--	Increases resistance against wind.
--
--	Working 100%.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_WINDRES,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_WINDRES,effect:getPower());
end;]]--