----------------------------------
--	Author: Psy aka psyclosis
--  Pumpkin Cake
--
--	A light and smooth pumpkin-flavored cake.  
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Pumpkin_Cake
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +2
--  MP Recovered while healing +4
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
