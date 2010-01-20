-----------------------------------
--	Author: Psy aka psyclosis
--  Bubble Chocolate
--	A chocolate with lighter-than-air
--  bubbles. It floats when you let go. 
--
--	http://wiki.ffxiclopedia.org/wiki/Bubble_Chocolate
-- 
-- 30 minutes, All Races
-- MP Recovered while healing +1
----------------------------------- 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
