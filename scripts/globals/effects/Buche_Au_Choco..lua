-----------------------------------
--	Author: Psy aka psyclosis
--  Roll of buche au chocolat
-- 
--	A San d'Orian cake made for
--  the Starlight Celebration.
--  Symbolizes thankfulness to the forest
--  for firewood to keep homes warm.  
--
--	http://wiki.ffxiclopedia.org/wiki/Buche_au_Chocolat
-- 
--  3 Hours, All Races
--  Group Food
--  MP +3%(Cap: 13@433 Base MP)
--  Intelligence +2
--  MP Recovered while healing +4
--  HP +8
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,3);
	effect:addMod(MOD_FOOD_MP_CAP,13);
	effect:addMod(MOD_INT,2);
	effect:addMod(MOD_MPHEAL,4);
	effect:addMod(MOD_HP,8);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
