-----------------------------------
--	Author: Tenjou
--  Double Attack (Job Trait)
--	Occasionally doubles attacks.
--
--	Set to 10% chance right now.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_DOUBLE_ATTACK,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_DOUBLE_ATTACK,10);
end;]]--