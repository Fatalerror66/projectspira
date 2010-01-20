----------------------------------
--	Author: Psy aka psyclosis
--  Silken smile
--
--	This yogurt cake is as smooth as silk. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Yogurt_Cake
--
--  4 hours, All Races
--
--  Intelligence +2
--  MP Recovered while healing +7
--------------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_MPHEAL,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
