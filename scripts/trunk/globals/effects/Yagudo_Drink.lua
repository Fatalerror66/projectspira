-----------------------------------
--	Author: Tenjou
--  Refresh (effect)
--	Target gradually restores MP.
--
--	Based on specified power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:addMP(2);
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--