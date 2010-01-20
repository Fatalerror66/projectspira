-----------------------------------
--	Author: Tenjou
--  Regen (effect)
--	Target gradually restores HP.
--
--	Based on specified power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:addHP(effect:getPower());
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--