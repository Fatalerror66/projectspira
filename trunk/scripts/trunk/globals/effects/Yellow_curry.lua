-----------------------------------
--	Author: Bababooey
-- 	Yellow Curry
-- 	A delicious curry with coeurl meat. 
--
--	http://wiki.ffxiclopedia.org/wiki/Yellow_Curry
--
--	3 Hours All Races
--	HP +20
--	Strength +5
--	Agility +2
--	Intelligence -4
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Attack +20% (Cap: 75@375 Base Attack)
--	Ranged Attack +20% (Cap: 75@375 Base Ranged Attack)
--	Resist Sleep
-- 	Resist Stun
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_STR,5);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,4);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,75);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,75);
	effect:addMod(MOD_SLEEPRES,5);
	effect:addMod(MOD_STUNRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
