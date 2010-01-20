-----------------------------------
--	Author: Bababooey
--	Rice Dumpling
--	This steamed rice has been wrapped in a bamboo leaf. Rice dumplings are
--	said to have the power to ward off evil spirits.
--
--	http://wiki.ffxiclopedia.org/wiki/Rice_Dumpling
--
--	30 Minutes, All Races
--	Strength +3
--	Agility +1
--	Vitality +2
--	HP Recovered while healing +2
--	MP Recovered while healing +2
--	HP +17
--	Attack +20% (Cap: 45@225 Base Attack)
--	Ranged Attack +30% (Cap: 45@150 Base Ranged Attack)
--	Accuracy +5
--	Resist Paralyze
-----------------------------------------

require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,3);
	effect:addMod(MOD_AGI,1);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_HPHEAL,2);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_HP,17);
	effect:addMod(MOD_FOOD_ATTP,20);
	effect:addMod(MOD_FOOD_ATT_CAP,45);
	effect:addMod(MOD_FOOD_RATTP,30);
	effect:addMod(MOD_FOOD_RATT_CAP,45);
	effect:addMod(MOD_ACC,5);
	effect:addMod(MOD_PARALYZERES,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;

