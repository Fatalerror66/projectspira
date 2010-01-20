-----------------------------------
--	Author: atkb
--  Paeon
--	Gradually restores HP for party members within the area of effect.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	target:addHP(effect:getPower());
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--