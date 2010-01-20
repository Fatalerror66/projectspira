-----------------------------------
--	Author: Psy aka psyclosis
--  Roll of sylvan excursion
-- 
--	Made by a master patissier,
--  this gleaming buche au chocolat
--  is designed to melt on your tongue. 
--
--	http://wiki.ffxiclopedia.org/wiki/Sylvan_Excursion
-- 
--  4 Hours, All Races
--  Group Food
--  MP +4%(Cap: 15@375 Base MP)
--  Intelligence +3
--  MP Recovered while healing +5
--  HP +10
------------------------------
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	effect:addMod(MOD_FOOD_MPP,4);
	effect:addMod(MOD_FOOD_MP_CAP,15);
	effect:addMod(MOD_INT,3);
	effect:addMod(MOD_MPHEAL,5);
	effect:addMod(MOD_HP,10);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
