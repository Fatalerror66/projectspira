----------------------------------
--	Author: Psy aka psyclosis
--  Serving of Mont blanc
--
--	A San d'Orian cake heaped with chestnuts to symbolize 
--  the white mountains of the Uleguerand Range.  
--  
--  http://wiki.ffxiclopedia.org/wiki/Mont_Blanc
--
--  3 hours, All Races
--  Group Effects
--  HP Recovered while healing +4
--  MP Recovered while healing +5
--  HP +8
--  MP +10
--  INT +1
-------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_HPHEAL,4);
	effect:addMod(MOD_MPHEAL,5);
	effect:addMod(MOD_HP,8);
	effect:addMod(MOD_MP,10);
	effect:addMod(MOD_INT,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
