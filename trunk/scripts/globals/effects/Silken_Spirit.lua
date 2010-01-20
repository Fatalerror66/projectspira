-----------------------------------
--	Author: Psy aka psyclosis
--  Silken Spirit
--
--	This chocolate cake is as smooth as silk.    
--  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Silken_Spirit
--
--  4 hours, All Races
--  Group Effects
--  MP Recovered while healing +7
--  MP +3%
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_MPHEAL,7);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
