-----------------------------------
--	Author: Bababooey
-- 	Porcupine Pie
-- 	Serve this mouthwatering hedgehog pie	at any family gathering and it will be
--	gone faster than you can say "sonic." 
--
--	http://wiki.ffxiclopedia.org/wiki/Porcupine_Pie
--	
--	4 Hours, All Races
--	HP +55
--	Strength +6
--	Vitality +2
--	Intelligence -3
--	Mind +3
--	MP Recovered while healing +2
--	Accuracy +5
--	Attack +18% (Cap: 95@527 Base Attack)
--	Ranged Attack +18% (Cap: 95@527 Base Ranged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,55);
	effect:addMod(MOD_STR,6);
	effect:addMod(MOD_VIT,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_MND,3);
	effect:addMod(MOD_MPHEAL,2);
	effect:addMod(MOD_ACC,5);
	effect:addMod(MOD_FOOD_ATTP,18);
	effect:addMod(MOD_FOOD_ATT_CAP,95);
	effect:addMod(MOD_FOOD_RATTP,18);
	effect:addMod(MOD_FOOD_RATT_CAP,95);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
