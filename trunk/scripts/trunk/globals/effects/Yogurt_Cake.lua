----------------------------------
--	Author: Psy aka psyclosis
--  Yogurt cake
--
--	A light and smooth yogurt-based cake. 
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Yogurt_Cake
--
--  3 hours, All Races
--
--  Intelligence +1
--  MP Recovered while healing +6
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_INT,1);
	effect:addMod(MOD_MPHEAL,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
