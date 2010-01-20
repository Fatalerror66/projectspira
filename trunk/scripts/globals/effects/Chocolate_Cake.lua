-----------------------------------
--	Author: Psy aka psyclosis
--  Chocolate cake
--
--	This maple cake is as smooth as silk.   
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Silken_Siesta
--
--  3 hours, All Races
--  Group Effects
--  MP Recovered while healing +6
--  MP +3%
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_MPHEAL,6);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
