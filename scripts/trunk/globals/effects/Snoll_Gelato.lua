-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Snoll Gelato
--
--	Sweet milk frozen with the essence of a snoll.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Snoll_Gelato
--  30 min, All Races
--  MP +16% (Cap: 75@468 Base MP)
--  MP Recovered while healing +1
--------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,16);
	effect:addMod(MOD_FOOD_MP_CAP,75);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
