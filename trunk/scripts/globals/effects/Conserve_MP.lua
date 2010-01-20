-----------------------------------
--	Author: Tenjou
--  Magic Attack Bonus
--	Occasionally reduces spells' MP cost.
--
--	Based on job.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	--Do it!
	effect:addMod(MOD_CONSERVE_MP,25);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	--Do it!
	effect:subtractMod(MOD_CONSERVE_MP,25);
end;]]--