-----------------------------
--	Author: Psy aka psyclosis
--  Orange kuchen +1
--
--	One of the most delicious orange 
--  kuchens you have ever tasted.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Orange_Kuchen_%2B1
--  4 hrs, All Races
--  MP +13% (Cap: 80@615 Base MP)
--  MP Recovered while healing +1
--------------------------

require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,13);
	effect:addMod(MOD_FOOD_MP_CAP,80);
	effect:addMod(MOD_MPHEAL,1);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
