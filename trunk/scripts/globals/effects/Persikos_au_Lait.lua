-----------------------------------
--	Author: Tenjou
--  Regen effect (effect)
--	Target gradually restores HP.
--
--	4 HP every 3 seconds during 10 minutes, 800 total
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
	target:addHP(4);
end;

function OnLoseEffect(target,effect)
end;
