-----------------------------------
--	Author: Bababooey
-- 	Dragon Steak
-- 	This extra-thick cut of dragon meat will give you so much
--  energy that you will not sleep for three days.
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Steak
--	
--	3 Hours, All Races
--	HP +25
--	Strength +7
--	Intelligence -3
--	Attack +20% (Cap: 150@750 Base Attack)
--	Ranged Attack +20% (Cap: 150@750 Base Ranged Attack
--	HP Recovered while healing +2
--	MP Recovered while healing +2
--	Demon Killer
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,25)
	effect:addMod(MOD_STR,7);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,150);
	effect:addMod(MOD_FOOD_RATTP,20);
	effect:addMod(MOD_FOOD_RATT_CAP,150);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_DEMON_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
