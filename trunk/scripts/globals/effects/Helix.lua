-----------------------------------
--	Author: ReaperX
--  Helix (effect)
--	Entity gradually loses HP
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:removeHP(effect:getPower()-1);
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--