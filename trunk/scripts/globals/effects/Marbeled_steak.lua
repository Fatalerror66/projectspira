-----------------------------------
--	Author: Bababooey
-- 	Marbeled Steak
-- 	Marbled with succulent fat, this heavenly bison steak will melt in your mouth. 
--
--	http://wiki.ffxiclopedia.org/wiki/Marbled_Steak
--	4 hours, All Races
--	Strength +6
--  Agility +1
--	Intelligence -3
--	Lizard Killer
--  Attack +18% (Cap: 95@527 Base Attack)
--	Ranged Attack +32% (Cap: 95@527 Base Raneged Attack)
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_STR,6);
	effect:addMod(MOD_AGI,1);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_LIZARD_KILLER,5);
	effect:addMod(MOD_FOOD_ATTP,18)
	effect:addMod(MOD_FOOD_ATT_CAP,95);
	effect:addMod(MOD_FOOD_RATTP,18)
	effect:addMod(MOD_FOOD_RATT_CAP,95);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
