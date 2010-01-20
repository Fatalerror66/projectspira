-----------------------------------
--	Author: Psy aka psyclosis
--  Cone of Sub-Zero Gelato
--
--	This delicious gelato has been known to 
--  give Tarutaru brain-freeze.  
-- 
--  http://wiki.ffxiclopedia.org/wiki/Sub-Zero_Gelato
--  60 min, All Races
--  MP +16% (Cap: 80@500 Base MP)
--  MP Recovered while healing +2
--  HP +10
--------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,16);
	effect:addMod(MOD_FOOD_MP_CAP,80);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
