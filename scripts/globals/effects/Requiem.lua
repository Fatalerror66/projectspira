-----------------------------------
--	Author: Tenjou
--  Reqiuem
--	Deals light damage to enemies.
--
--	Based on power.
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	--print("FINAL",effect:getPower(),getNaturalResist(target:getFamily()),target:getElementalResist(7));
	target:removeHP(math.floor(effect:getPower()*getNaturalResist(target:getFamily())*target:getElementalResist(7)/100));
end;

function OnLoseEffect(target,effect)
end;
--[[

end;]]--