-----------------------------------
--	Author: Tenjou
--	Protect (effect)
--	Entity's defense is enhanced.
--
--	Based on effect's power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_DEF,effect:getPower());
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_DEF,effect:getPower());
end;]]--