-----------------------------------
--	Author: Psy aka psyclosis
--  Maple Cake
--
--	A light and smooth maple-flavored cake.   
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Maple_Cake
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +1
--  MP Recovered while healing +4
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,1);
	effect:addMod(MOD_MPHEAL,4);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
