-----------------------------------
--	Author: Hyourin
--  Auto Regen
--	Gradually restores HP. 
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	if(target:getHP()>0 and target:getHP()<target:getMaxHP()) then
		target:addHP(1);
	end
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--