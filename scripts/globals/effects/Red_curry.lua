-----------------------------------
--	Author: Bababooey
-- 	Red Curry
-- 	A delicious curry with dragon meat.
--
--	http://wiki.ffxiclopedia.org/wiki/Red_Curry
--
--	3 Hours All Races
--	HP +25
--	Strength +7
--	Agility +1
--	Intelligence -2
--	HP Recovered while healing +2
--	MP Recovered while healing +1
--	Attack +23% (Cap: 150@652 Base Attack)
--	Ranged Attack +23% (Cap: 150@652 Base Ranged Attack)
--	Demon Killer
--	Resist Sleep
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25);
	effect:addMod(MOD_STR,7);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,1);
	effect:addMod(MOD_FOOD_ATTP,23);
	effect:addMod(MOD_FOOD_ATT_CAP,150);
	effect:addMod(MOD_FOOD_RATTP,23);
	effect:addMod(MOD_FOOD_RATT_CAP,150);
	effect:addMod(MOD_DEMON_KILLER,5);
	effect:addMod(MOD_SLEEPRES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
