-----------------------------------
--	Author: Psy aka psyclosis
--  TrueLove Chocolate
--
--	An elegantly wrapped heart-shaped chocolate. 
-- 
--  http://wiki.ffxiclopedia.org/wiki/Truelove_Chocolate
--  4 hrs, All Races
--  MP Recovered while healing +4
--  MP +10
-------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,4);
	effect:addMod(MOD_MP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
