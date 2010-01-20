----------------------------------
--	Author: Psy aka psyclosis
--  Silken Squeeze
--
--	This orange cake is as smooth as silk.   
--  
--  http://wiki.ffxiclopedia.org/wiki/Silken_Squeeze
--
--  4 hours, All Races
--  Group Effects
--  HP Recovered while healing +4
--  MP Recovered while healing +5
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,4);
	effect:addMod(MOD_MPHEAL,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
