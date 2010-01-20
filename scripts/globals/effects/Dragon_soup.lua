-----------------------------------
--	Author: Bababooey
-- 	Dragon Soup
-- 	Soup made from the meat of a dragon. 
--
--	http://wiki.ffxiclopedia.org/wiki/Dragon_Soup
--
--	3 Hours, All Races
--	HP +20
--	Strength +7
--	Vitality +2
--	Agility +2
--	Intelligence -3
--	HP Recovered While Healing +9
--	Attack +22% (Cap: 150@681 Base Attack)
--	Ranged Attack +22% (Cap: 150@681 Base Ranged Attack)
--	Demon Killer 
-----------------------------------
 
require("scripts/globals/settings");

function OnGainEffect(target,effect)
	effect:addMod(MOD_HP,20);
	effect:addMod(MOD_STR,7);
	effect:addMod(MOD_VIT,2);
	effect:addMod(MOD_AGI,2);
	effect:subtractMod(MOD_INT,3);
	effect:addMod(MOD_HPHEAL,9);
	effect:addMod(MOD_FOOD_ATTP,22);
	effect:addMod(MOD_FOOD_ATT_CAP,150);
	effect:addMod(MOD_FOOD_RATTP,22);
	effect:addMod(MOD_FOOD_RATT_CAP,150);
	effect:addMod(MOD_DEMON_KILLER,5);
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
