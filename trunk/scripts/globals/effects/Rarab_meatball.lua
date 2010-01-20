-----------------------------------
--	Author: Bababooey
-- 	Rarab Meatball
-- 	A tasty snack of ground wild hare meat.  
--
--	http://wiki.ffxiclopedia.org/wiki/Rarab_Meatball
--	
--	3 Hours, All Races
--	HP +10
--	Strength +2
--	Vitality +2
--	Intelligence -1
--	Attack +30% (Cap: 20@66 Base Attack)
--	Ranged Attack +30% (Cap: 20@66 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,10);
	effect:addMod(MOD_STR,2);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,1);
	effect:addMod(MOD_FOOD_ATTP,30);
	effect:addMod(MOD_FOOD_ATT_CAP,20);
	effect:addMod(MOD_FOOD_RATTP,30);
	effect:addMod(MOD_FOOD_RATT_CAP,20);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
