-----------------------------------
--	Author: Tenjou
--  Regain (effect)
--	Target gradually restores TP.
--
--	Based on specified power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:setTP(target:getTP()+effect:getPower());
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--