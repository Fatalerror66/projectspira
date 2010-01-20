-----------------------------------
--	Author: Hyourin
--  Auto Refresh
--	Gradually restores MP. 
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	if (target:getMP()<target:getMaxMP()) then
		target:addMP(1);
	end
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--