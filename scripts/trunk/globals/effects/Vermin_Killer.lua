-----------------------------------
--	Author: Tenjou
--	Vermin Killer
--	Allows entity to occasionally intimidate the named target type.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_VERMIN_KILLER,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_VERMIN_KILLER,10);
end;]]--