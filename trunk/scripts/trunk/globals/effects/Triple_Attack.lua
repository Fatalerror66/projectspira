-----------------------------------
--	Author: Tenjou
--  Triple Attack (Job Trait)
--	Occasionally triples attacks.
--
--	Set to 5% chance right now.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_TRIPLE_ATTACK,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	effect:subtractMod(MOD_TRIPLE_ATTACK,5);
end;]]--